grammar D;

Assign: '=';
At: '@';
BitAnd: '&';
BitAndEqual: '&=';
BitOr: '|';
BitOrEqual: '|=';
CatEqual: '~=';
Colon: ':';
Comma: ',';
Decrement: '--';
Div: '/';
DivEqual: '/=';
Dollar: '$';
Dot: '.';
Equal: '==';
GoesTo: '=>';
Greater: '>';
GreaterEqual: '>=';
Hash: '#';
Increment: '++';
LBrace: '{';
LBracket: '[';
Less: '<';
LessEqual: '<=';
LessEqualGreater: '<>=';
LessOrGreater: '<>';
LogicAnd: '&&';
LogicOr: '||';
LParen: '(';
Minus: '-';
MinusEqual: '-=';
Mod: '%';
ModEqual: '%=';
MulEqual: '*=';
Not: '!';
NotEqual: '!=';
NotGreater: '!>';
NotGreaterEqual: '!>=';
NotLess: '!<';
NotLessEqual: '!<=';
NotLessEqualGreater: '!<>';
Plus: '+';
PlusEqual: '+=';
Pow: '^^';
PowEqual: '^^=';
RBrace: '}';
RBracket: ']';
RParen: ')';
Semicolon: ';';
ShiftLeft: '<<';
ShiftLeftEqual: '<<=';
ShiftRight: '>>';
ShiftRightEqual: '>>=';
Slice: '..';
Star: '*';
Ternary: '?';
Tilde: '~';
Unordered: '!<>=';
UnsignedShiftRight: '>>>';
UnsignedShiftRightEqual: '>>>=';
Vararg: '...';
Xor: '^';
XorEqual: '^=';
Bool: 'bool';
Byte: 'byte';
Cdouble: 'cdouble';
Cent: 'cent';
Cfloat: 'cfloat';
Char: 'char';
Creal: 'creal';
Dchar: 'dchar';
Double: 'double';
Float: 'float';
Function: 'function';
Idouble: 'idouble';
Ifloat: 'ifloat';
Int: 'int';
Ireal: 'ireal';
Long: 'long';
Real: 'real';
Short: 'short';
Ubyte: 'ubyte';
Ucent: 'ucent';
Uint: 'uint';
Ulong: 'ulong';
Ushort: 'ushort';
Void: 'void';
Wchar: 'wchar';
Align: 'align';
Deprecated: 'deprecated';
Extern: 'extern';
Pragma: 'pragma';
Export: 'export';
Package: 'package';
Private: 'private';
Protected: 'protected';
Public: 'public';
Abstract: 'abstract';
Auto: 'auto';
Const: 'const';
Final: 'final';
Gshared: '__gshared';
Immutable: 'immutable';
Inout: 'inout';
Scope: 'scope';
Shared: 'shared';
Static: 'static';
Synchronized: 'synchronized';
Alias: 'alias';
Asm: 'asm';
Assert: 'assert';
Body: 'body';
Break: 'break';
Case: 'case';
Cast: 'cast';
Catch: 'catch';
Class: 'class';
Continue: 'continue';
Debug: 'debug';
Default: 'default';
Delegate: 'delegate';
Delete: 'delete';
Do: 'do';
Else: 'else';
Enum: 'enum';
False: 'false';
Finally: 'finally';
Foreach: 'foreach';
Foreach_reverse: 'foreach_reverse';
For: 'for';
Goto: 'goto';
If: 'if';
Import: 'import';
In: 'in';
Interface: 'interface';
Invariant: 'invariant';
Is: 'is';
Lazy: 'lazy';
Macro: 'macro';
Mixin: 'mixin';
Module: 'module';
New: 'new';
Nothrow: 'nothrow';
Null: 'null';
Out: 'out';
Override: 'override';
Pure: 'pure';
Ref: 'ref';
Return: 'return';
Struct: 'struct';
Super: 'super';
Switch: 'switch';
Template: 'template';
This: 'this';
Throw: 'throw';
True: 'true';
Try: 'try';
Typedef: 'typedef';
Typeid: 'typeid';
Typeof: 'typeof';
Union: 'union';
Unittest: 'unittest';
Version: 'version';
Volatile: 'volatile';
While: 'while';
With: 'with';

SpecialDate: '__DATE__';
SpecialEof: '__EOF__';
SpecialTime: '__TIME__';
Specialimestamp: '__TIMESTAMP__';
SpecialVendor: '__VENDOR__';
SpecialVersion: '__VERSION__';
SpecialFile: '__FILE__';
SpecialLine: '__LINE__';
SpecialModule: '__MODULE__';
SpecialFunction: '__FUNCTION__';
SpecialPrettyFunction: '__PRETTY_FUNCTION__';
Traits: '__traits';
Parameters: '__parameters';
Vector: '__vector';

Whitespace: [\u0020\u0009\u000b\u000c\u000a\u000d]+ -> skip;
fragment EndOfLine : '\u000d' | '\u000a' | '\u000d' '\u000a' | '\u2028' | '\u2029';

fragment Character: [\u0001-\uffff];
fragment WysiwygCharacter: Character | Whitespace;
fragment HexDigit: [a-fA-F0-9];
fragment OctalDigit: [0-7];
fragment BinDigit: [01];
fragment DecimalDigit: [0-9];

fragment BlockComment: '/*' .*? '*/';
fragment LineComment: '//' (~[\u000D\u000A\u2028\u2029])* (EndOfLine | EOF);
fragment NestingBlockComment: '/+' (NestingBlockComment | .)*? '+/';
Comment : (BlockComment | LineComment | NestingBlockComment) -> skip;

Identifier : ([a-zA-Z_])([a-zA-Z0-9_])*;

fragment WysiwygString : 'r"' .*? '"' StringPostfix?;
fragment AlternativeWysiwygString : '`' .*? '`' StringPostfix?;
fragment EscapeSequence : '\\\''
    | '\\"'
    | '\\\\'
    | '\\?'
    | '\\0'
    | '\\a'
    | '\\b'
    | '\\f'
    | '\\n'
    | '\\r'
    | '\\t'
    | '\\v'
    | '\\x' HexDigit HexDigit
    | '\\' OctalDigit OctalDigit? OctalDigit?
    | '\\u' HexDigit HexDigit HexDigit HexDigit
    | '\\U' HexDigit HexDigit HexDigit HexDigit HexDigit HexDigit HexDigit HexDigit
    | '\\&' Identifier ';';
fragment HexStringChar : [0-9a-fA-F] | Whitespace | EndOfLine;
fragment StringPostfix : [dwc];
fragment DoubleQuotedCharacter : EscapeSequence | ~('"' | '\\' );
fragment DoubleQuotedString : '"' DoubleQuotedCharacter* '"'  StringPostfix?;
fragment HexString: 'x"' HexStringChar* '"' StringPostfix?;
// fragment DelimitedString: 'q"' Delimiter WysiwygCharacter+ MatchingDelimiter '"';
// fragment TokenString: 'q{' Token* '}';
fragment StringFragment : WysiwygString | AlternativeWysiwygString | DoubleQuotedString | HexString /*| DelimitedString | TokenString*/;
StringLiteral : StringFragment (Whitespace? StringFragment)*;

CharacterLiteral: '\'' ( EscapeSequence | ~[\\'] )*? '\'';

IntegerLiteral: Integer IntegerSuffix?;
fragment Integer: BinaryInteger | DecimalInteger | HexadecimalInteger;
fragment IntegerSuffix: ('L' | 'u' | 'U' | 'Lu' | 'LU' | 'uL' | 'UL');
fragment DecimalInteger: DecimalDigit (DecimalDigit | '_')*;
fragment BinaryInteger: ('0b' | '0B') BinDigit (BinDigit | '_')*;
fragment HexadecimalInteger: ('0x' | '0X') HexDigit (HexDigit | '_')*;

FloatLiteral: (FloatOption (FloatSuffix | RealSuffix)?) | (Integer (FloatSuffix | RealSuffix)? ImaginarySuffix);
fragment FloatOption: DecimalFloat | HexFloat;
fragment DecimalFloat
    : DecimalInteger '.' (DecimalDigit (DecimalDigit | '_')* DecimalExponent?)?  // BUG: can't lex a[0..1] properly
    | '.' DecimalInteger DecimalExponent?
    | DecimalInteger DecimalExponent
    ;
fragment DecimalExponent: ('e' | 'E' | 'e+' | 'E+' | 'e-' | 'E-') DecimalInteger;
fragment FloatSuffix: 'F' | 'f';
fragment RealSuffix: 'L';
fragment ImaginarySuffix: 'i';
fragment HexFloat: ('0x' | '0X') ((HexDigit (HexDigit | '_')* '.' HexDigit (HexDigit | '_')*) | ('.' HexDigit (HexDigit | '_')*) | (HexDigit (HexDigit | '_')*)) HexExponent;
fragment HexExponent: ('p' | 'P' | 'p+' | 'P+' | 'p-' | 'P-') DecimalDigit (DecimalDigit | '_')*;

SpecialTokenSequence: '#line' Space+ IntegerLiteral Space* ('"' .*? '"' Space*)? (EndOfLine | EOF) -> skip;
fragment Space: [\u0020\u0009\u000B\u000C];




addExpression:
      mulExpression
    | addExpression ('+' | '-' | '~') mulExpression
    ;

aliasDeclaration:
    'alias' (aliasInitializer (',' aliasInitializer)* | type declarator) ';'
    ;

aliasInitializer:
    Identifier '=' type
    ;

aliasThisDeclaration:
    'alias' Identifier 'this' ';'
    ;

alignAttribute:
    'align' ('(' IntegerLiteral ')')?
    ;

andAndExpression:
      orExpression
    | andAndExpression '&&' orExpression
    ;

andExpression:
      cmpExpression
    | andExpression '&' cmpExpression
    ;

argumentList:
    assignExpression (',' assignExpression?)*
    ;

arguments:
    '(' argumentList? ')'
    ;

arrayInitializer:
      '[' ']'
    | '[' arrayMemberInitialization (',' arrayMemberInitialization?)* ']'
    ;

arrayLiteral:
    '[' (assignExpression (',' assignExpression)*)? ']'
    ;

arrayMemberInitialization:
    (assignExpression ':')? nonVoidInitializer
    ;

asmAddExp:
      asmMulExp
    | asmAddExp ('+' | '-') asmMulExp
    ;

asmAndExp:
    asmEqualExp ('&' asmEqualExp)?
    ;

asmBrExp:
      asmUnaExp
    | asmBrExp '[' asmExp ']'
    ;

asmEqualExp:
    asmRelExp (('==' | '!=') asmRelExp)?
    ;

asmExp:
    asmLogOrExp ('?' asmExp ':' asmExp)?
    ;

asmInstruction:
    Identifier
    | 'align' IntegerLiteral
    | 'align' Identifier
    | Identifier ':' asmInstruction
    | Identifier asmExp
    | Identifier operands
    ;

asmLogAndExp:
    asmOrExp ('&&' asmOrExp)?
    ;

asmLogOrExp:
    asmLogAndExp ('||' asmLogAndExp)?
    ;

asmMulExp:
    asmBrExp (('*' | '/' | '%') asmBrExp)?
    ;

asmOrExp:
    asmXorExp ('|' asmXorExp)?
    ;

asmPrimaryExp:
      IntegerLiteral
    | FloatLiteral
    | register
    | identifierChain
    | '$'
    ;

asmRelExp:
    asmShiftExp (('<' | '<=' | '>' | '>=') asmShiftExp)?
    ;

asmShiftExp:
    asmAddExp (('<<' | '>>' | '>>>') asmAddExp)?
    ;

asmStatement:
    'asm' '{' asmInstruction+ '}'
    ;

asmTypePrefix:
      Identifier Identifier
    | 'byte' Identifier
    | 'short' Identifier
    | 'int' Identifier
    | 'float' Identifier
    | 'double' Identifier
    | 'real' Identifier
    ;

asmUnaExp:
      asmTypePrefix asmExp
    | Identifier asmExp
    | '+' asmUnaExp
    | '-' asmUnaExp
    | '!' asmUnaExp
    | '~' asmUnaExp
    | asmPrimaryExp
    ;

asmXorExp:
    asmAndExp ('^' asmAndExp)?
    ;

assertExpression:
    'assert' '(' assignExpression (',' assignExpression)? ')'
    ;

assignExpression:
    ternaryExpression (assignOperator assignExpression)?
    ;
assignOperator:
      '='
    | '>>>='
    | '>>='
    | '<<='
    | '+='
    | '-='
    | '*='
    | '%='
    | '&='
    | '/='
    | '|='
    | '^^='
    | '^='
    | '~='
    ;

assocArrayLiteral:
    '[' keyValuePairs ']'
    ;

atAttribute:
    '@' (Identifier | '(' argumentList ')' | functionCallExpression)
    ;

attribute:
      alignAttribute
    | linkageAttribute
    | pragmaExpression
    | storageClass
    | 'export'
    | 'package'
    | 'private'
    | 'protected'
    | 'public'
    ;

attributeDeclaration:
     ':'
    ;

autoDeclaration:
    storageClass Identifier '=' initializer (',' Identifier '=' initializer)* ';'
    ;

blockStatement:
    '{' declarationsAndStatements? '}'
    ;

bodyStatement:
    'body' blockStatement
    ;

breakStatement:
    'break' Identifier? ';'
    ;

baseClass:
    (typeofExpression '.')? identifierOrTemplateChain
    ;

baseClassList:
    baseClass (',' baseClass)*
    ;

builtinType:
     'bool'
    | 'byte'
    | 'ubyte'
    | 'short'
    | 'ushort'
    | 'int'
    | 'uint'
    | 'long'
    | 'ulong'
    | 'char'
    | 'wchar'
    | 'dchar'
    | 'float'
    | 'double'
    | 'real'
    | 'ifloat'
    | 'idouble'
    | 'ireal'
    | 'cfloat'
    | 'cdouble'
    | 'creal'
    | 'void'
    ;

caseRangeStatement:
    'case' assignExpression ':' '...' 'case' assignExpression ':' declarationsAndStatements
    ;

caseStatement:
    'case'  ':' declarationsAndStatements
    ;

castExpression:
    'cast' '(' (type | castQualifier)? ')' unaryExpression
    ;

castQualifier:
     'const'
    | 'const' 'shared'
    | 'immutable'
    | 'inout'
    | 'inout' 'shared'
    | 'shared'
    | 'shared' 'const'
    | 'shared' 'inout'
    ;

catch:
    'catch' '(' type Identifier? ')' declarationOrStatement
    ;

catches:
      catch+
    | catch* lastCatch
    ;

classDeclaration:
    'class' Identifier (templateParameters constraint?)? (':' baseClassList)? structBody
    ;

cmpExpression:
      shiftExpression
    | equalExpression
    | identityExpression
    | relExpression
    | inExpression
    ;

compileCondition:
      versionCondition
    | debugCondition
    | staticIfCondition
    ;

conditionalDeclaration:
    compileCondition (declaration | '{' declaration* '}') ('else' (declaration | '{' declaration* '}'))?
    ;

conditionalStatement:
    compileCondition declarationOrStatement ('else' declarationOrStatement)?
    ;

constraint:
    'if' '(' expression ')'
    ;

constructor:
      'this' templateParameters parameters memberFunctionAttribute* constraint? (functionBody | ';')
    ;

continueStatement:
    'continue' Identifier? ';'
    ;

debugCondition:
    'debug' ('(' (IntegerLiteral | Identifier) ')')?
    ;

debugSpecification:
    'debug' '=' (Identifier | IntegerLiteral) ';'
    ;

declaration:
    attribute*
    ;
declaration2:
      aliasDeclaration
    | aliasThisDeclaration
    | classDeclaration
    | conditionalDeclaration
    | constructor
    | destructor
    | enumDeclaration
    | functionDeclaration
    | importDeclaration
    | interfaceDeclaration
    | mixinDeclaration
    | mixinTemplateDeclaration
    | pragmaDeclaration
    | sharedStaticConstructor
    | sharedStaticDestructor
    | staticAssertDeclaration
    | staticConstructor
    | staticDestructor
    | structDeclaration
    | templateDeclaration
    | unionDeclaration
    | unittest
    | variableDeclaration
    | attributeDeclaration
    | invariant
    | '{' declaration+ '}'
    ;

declarationsAndStatements:
    declarationOrStatement+
    ;

declarationOrStatement:
      declaration
    | statement
    ;

declarator:
    Identifier ('=' initializer)?
    ;

defaultStatement:
    'default' ':' declarationsAndStatements
    ;

deleteExpression:
    'delete' unaryExpression
    ;

deprecated:
    'deprecated' ('(' assignExpression ')')?
    ;

destructor:
    '~' 'this' '(' ')' (functionBody | ';')
    ;

doStatement:
    'do' statementNoCaseNoDefault 'while' '(' expression ')' ';'
    ;

enumBody:
      ';'
    | '{' enumMember (',' enumMember?)* '}'
    ;

enumDeclaration:
    'enum' Identifier? (':' type)? enumBody
    ;

enumMember:
      Identifier
    | (Identifier | type) '=' assignExpression
    ;

equalExpression:
    shiftExpression ('==' | '!=') shiftExpression
    ;

expression:
    assignExpression (',' assignExpression)*
    ;

expressionStatement:
     ';'
    ;

finalSwitchStatement:
    'final' switchStatement
    ;

finally:
    'finally' declarationOrStatement
    ;

forStatement:
    'for' '(' declarationOrStatement expression? ';' expression? ')' declarationOrStatement
    ;

foreachStatement:
      ('foreach' | 'foreach_reverse') '(' foreachTypeList ';' expression ')' declarationOrStatement
    | ('foreach' | 'foreach_reverse') '(' foreachType ';' expression '..' expression ')' declarationOrStatement
    ;

foreachType:
    typeConstructors? type? Identifier
    ;

foreachTypeList:
    foreachType (',' foreachType)*
    ;

functionAttribute:
      atAttribute
    | 'pure'
    | 'nothrow'
    ;

functionBody:
      blockStatement
    | (inStatement | outStatement | outStatement inStatement | inStatement outStatement)? bodyStatement
    ;

functionCallExpression:
    unaryExpression templateArguments? arguments
    ;

functionCallStatement:
    functionCallExpression ';'
    ;

functionDeclaration:
      (storageClass | type) Identifier templateParameters parameters memberFunctionAttribute* constraint? (functionBody | ';')
    ;

functionLiteralExpression:
    (('function' | 'delegate') type?)? (parameters functionAttribute*)? functionBody
    ;

gotoStatement:
    'goto' (Identifier | 'default' | 'case' expression?) ';'
    ;

identifierChain:
    Identifier ('.' Identifier)*
    ;

identifierList:
    Identifier (',' Identifier)*
    ;

identifierOrTemplateChain:
    identifierOrTemplateInstance ('.' identifierOrTemplateInstance)*
    ;

identifierOrTemplateInstance:
      Identifier
    | templateInstance
    ;

identityExpression:
    shiftExpression ('is' | '!' 'is') shiftExpression
    ;

ifStatement:
    'if' '(' ifCondition ')' declarationOrStatement ('else' declarationOrStatement)?
ifCondition:
      'auto' Identifier '=' expression
    | type Identifier '=' expression
    | expression
    ;

importBind:
    Identifier ('=' Identifier)?
    ;

importBindings:
     ':' importBind (',' importBind)*
    ;

importDeclaration:
      'import' singleImport (',' singleImport)* (',' importBindings)? ';'
    | 'import' importBindings ';'
    ;

importExpression:
    'import' '(' assignExpression ')'
    ;

indexExpression:
     '[' argumentList ']'
    ;

inExpression:
    shiftExpression ('in' | '!' 'in') shiftExpression
    ;

inStatement:
    'in' blockStatement
    ;

initialize:
      ';'
    | statementNoCaseNoDefault
    ;

initializer:
      'void'
    | nonVoidInitializer
    ;

interfaceDeclaration:
    'interface' Identifier (templateParameters constraint?)? (':' baseClassList)? structBody
    ;

invariant:
    'invariant' ('(' ')')? blockStatement
    ;

isExpression:
    'is' '(' type Identifier? ((':' | '==') typeSpecialization (',' templateParameterList)?)? ')'
    ;

keyValuePair:
    assignExpression ':' assignExpression
    ;

keyValuePairs:
    keyValuePair (',' keyValuePair)* ','?
    ;

labeledStatement:
    Identifier ':' declarationOrStatement
    ;

lambdaExpression:
      Identifier '=>' assignExpression
    | 'function' parameters functionAttribute* '=>' assignExpression
    | 'delegate' parameters functionAttribute* '=>' assignExpression
    | parameters functionAttribute* '=>' assignExpression
    ;

lastCatch:
    'catch' statementNoCaseNoDefault
    ;

linkageAttribute:
    'extern' '(' Identifier '++'? ')'
    ;

memberFunctionAttribute:
      functionAttribute
    | 'immutable'
    | 'inout'
    | 'shared'
    | 'const'
    ;

mixinDeclaration:
      mixinExpression ';'
    | templateMixinExpression ';'
    ;

mixinExpression:
    'mixin' '(' assignExpression ')'
    ;

mixinTemplateDeclaration:
    'mixin' templateDeclaration
    ;

mixinTemplateName:
    (typeofExpression? '.')? identifierOrTemplateChain
    ;

module:
    moduleDeclaration? declaration*
    ;

moduleDeclaration:
    'module' identifierChain ';'
    ;

mulExpression:
      powExpression
    | mulExpression ('*' | '/' | '%') powExpression
    ;

newAnonClassExpression:
    'new' arguments? 'class' arguments? baseClassList? structBody
    ;

newExpression:
      'new' type ('[' assignExpression ']' | arguments)?
    | newAnonClassExpression
    ;

statementNoCaseNoDefault:
      labeledStatement
    | blockStatement
    | ifStatement
    | whileStatement
    | doStatement
    | forStatement
    | foreachStatement
    | switchStatement
    | finalSwitchStatement
    | continueStatement
    | breakStatement
    | returnStatement
    | gotoStatement
    | withStatement
    | synchronizedStatement
    | tryStatement
    | throwStatement
    | scopeGuardStatement
    | asmStatement
    | conditionalStatement
    | staticAssertStatement
    | versionSpecification
    | debugSpecification
    | expressionStatement
    ;

nonVoidInitializer:
      assignExpression
    | arrayInitializer
    | structInitializer
    ;

operands:
    asmExp+
    ;

orExpression:
      xorExpression
    | orExpression '|' xorExpression
    ;

orOrExpression:
      andAndExpression
    | orOrExpression '||' andAndExpression
    ;

outStatement:
    'out' ('(' Identifier ')')? blockStatement
    ;

parameter:
    parameterAttribute* type (Identifier? '...' | (Identifier? ('=' assignExpression)?))?
    ;

parameterAttribute:
      typeConstructor
    | 'final'
    | 'in'
    | 'lazy'
    | 'out'
    | 'ref'
    | 'scope'
    | 'auto'
    ;

parameters:
      '(' parameter (',' parameter)* (',' '...')? ')'
    | '(' '...' ')'
    | '(' ')'
    ;

postblit:
    'this' '(' 'this' ')' (functionBody | ';')
    ;

postIncDecExpression:
    unaryExpression ('++' | '--')
    ;

powExpression:
      unaryExpression
    | powExpression '^^' unaryExpression
    ;

pragmaDeclaration:
    pragmaExpression ';'
    ;

pragmaExpression:
    'pragma' '(' Identifier (',' argumentList)? ')'
    ;

preIncDecExpression:
    ('++' | '--') unaryExpression
    ;

primaryExpression:
      identifierOrTemplateInstance
    | '.' identifierOrTemplateInstance
    | builtinType '.' Identifier
    | typeofExpression
    | typeidExpression
    | vector
    | arrayLiteral
    | assocArrayLiteral
    | '(' expression ')'
    | isExpression
    | lambdaExpression
    | functionLiteralExpression
    | traitsExpression
    | mixinExpression
    | importExpression
    | '$'
    | 'this'
    | 'super'
    | 'null'
    | 'true'
    | 'false'
    | '__DATE__'
    | '__TIME__'
    | '__TIMESTAMP__'
    | '__VENDOR__'
    | '__VERSION__'
    | '__FILE__'
    | '__LINE__'
    | '__MODULE__'
    | '__FUNCTION__'
    | '__PRETTY_FUNCTION__'
    | IntegerLiteral
    | FloatLiteral
    | StringLiteral+
    | CharacterLiteral
    ;

register:
    Identifier
    | Identifier '(' IntegerLiteral ')'
    ;

relExpression:
      shiftExpression
    | relExpression relOperator shiftExpression
    ;
relOperator:
      '<'
    | '<='
    | '>'
    | '>='
    | '!<>='
    | '!<>'
    | '<>'
    | '<>='
    | '!>'
    | '!>='
    | '!<'
    | '!<='
    ;

returnStatement:
    'return' expression? ';'
    ;

scopeGuardStatement:
    'scope' '(' Identifier ')' statementNoCaseNoDefault
    ;

sharedStaticConstructor:
    'shared' 'static' 'this' '(' ')' functionBody
    ;

sharedStaticDestructor:
    'shared' 'static' '~' 'this' '(' ')' functionBody
    ;

shiftExpression:
      addExpression
    | shiftExpression ('<<' | '>>' | '>>>') addExpression
    ;

singleImport:
    (Identifier '=')? identifierChain
    ;

sliceExpression:
      unaryExpression '[' assignExpression '..' assignExpression ']'
    | unaryExpression '[' ']'
    ;

statement:
      statementNoCaseNoDefault
    | caseStatement
    | caseRangeStatement
    | defaultStatement
    ;

staticAssertDeclaration:
    staticAssertStatement
    ;

staticAssertStatement:
    'static' assertExpression ';'
    ;

staticConstructor:
    'static' 'this' '(' ')' functionBody
    ;

staticDestructor:
    'static' '~' 'this' '(' ')' functionBody
    ;

staticIfCondition:
    'static' 'if' '(' assignExpression ')'
    ;

storageClass:
      atAttribute
    | typeConstructor
    | deprecated
    | 'abstract'
    | 'auto'
    | 'enum'
    | 'extern'
    | 'final'
    | 'nothrow'
    | 'override'
    | 'pure'
    | 'ref'
    | '__gshared'
    | 'scope'
    | 'static'
    | 'synchronized'
    ;

structBody:
    '{' declaration* '}'
    ;

structDeclaration:
    'struct' Identifier? (templateParameters constraint? structBody | (structBody | ';'))
    ;

structInitializer:
    '{' structMemberInitializers? '}'
    ;

structMemberInitializer:
    (Identifier ':')? nonVoidInitializer
    ;

structMemberInitializers:
    structMemberInitializer (',' structMemberInitializer?)*
    ;

switchStatement:
    'switch' '(' expression ')' statement
    ;

symbol:
    '.'? identifierOrTemplateChain
    ;

synchronizedStatement:
    'synchronized' ('(' expression ')')? statementNoCaseNoDefault
    ;

templateAliasParameter:
    'alias' type? Identifier (':' (type | assignExpression))? ('=' (type | assignExpression))?
    ;

templateArgument:
      type
    | assignExpression
    ;

templateArgumentList:
    templateArgument (',' templateArgument?)*
    ;

templateArguments:
    '!' ('(' templateArgumentList? ')' | templateSingleArgument)
    ;

templateDeclaration:
    'template' Identifier templateParameters constraint? '{' declaration* '}'
    ;

templateInstance:
    Identifier templateArguments
    ;

templateMixinExpression:
    'mixin' mixinTemplateName templateArguments? Identifier?
    ;

templateParameter:
      templateTypeParameter
    | templateValueParameter
    | templateAliasParameter
    | templateTupleParameter
    | templateThisParameter
    ;

templateParameterList:
    templateParameter (',' templateParameter?)*
    ;

templateParameters:
    '(' templateParameterList? ')'
    ;

templateSingleArgument:
      builtinType
    | Identifier
    | CharacterLiteral
    | StringLiteral
    | IntegerLiteral
    | FloatLiteral
    | 'true'
    | 'false'
    | 'null'
    | 'this'
    | '__DATE__'
    | '__TIME__'
    | '__TIMESTAMP__'
    | '__VENDOR__'
    | '__VERSION__'
    | '__FILE__'
    | '__LINE__'
    | '__MODULE__'
    | '__FUNCTION__'
    | '__PRETTY_FUNCTION__'
    ;

templateThisParameter:
    'this' templateTypeParameter
    ;

templateTupleParameter:
    Identifier '...'
    ;

templateTypeParameter:
    Identifier (':' type)? ('=' type)?
    ;

templateValueParameter:
    type Identifier (':' expression)? templateValueParameterDefault?
    ;

templateValueParameterDefault:
    '=' ('__FILE__' | '__MODULE__' | '__LINE__' | '__FUNCTION__' | '__PRETTY_FUNCTION__' | assignExpression)
    ;

ternaryExpression:
    orOrExpression ('?' expression ':' ternaryExpression)?
    ;

throwStatement:
    'throw' expression ';'
    ;

traitsExpression:
    '__traits' '(' Identifier ',' TemplateArgumentList ')'
    ;

tryStatement:
    'try' declarationOrStatement (catches | catches finally | finally)
    ;

type:
    attribute? type2 typeSuffix*
    ;

type2:
      builtinType
    | symbol
    | typeofExpression ('.' identifierOrTemplateChain)?
    | typeConstructor '(' type ')'
    ;

typeConstructor:
      'const'
    | 'immutable'
    | 'inout'
    | 'shared'
    | 'scope'
    ;

typeConstructors:
    typeConstructor+
    ;

typeSpecialization:
      type
    | 'struct'
    | 'union'
    | 'class'
    | 'interface'
    | 'enum'
    | 'function'
    | 'delegate'
    | 'super'
    | 'const'
    | 'immutable'
    | 'inout'
    | 'shared'
    | 'return'
    | 'typedef'
    | '__parameters'
    ;

typeSuffix:
      '*'
    | '[' type? ']'
    | '[' assignExpression ']'
    | '[' assignExpression '..'  assignExpression ']'
    | ('delegate' | 'function') parameters memberFunctionAttribute*
    ;

typeidExpression:
    'typeid' '(' (type | expression) ')'
    ;

typeofExpression:
    'typeof' '(' (expression | 'return') ')'
    ;

unaryExpression:
      primaryExpression
    | '&' unaryExpression
    | '!' unaryExpression
    | '*' unaryExpression
    | '+' unaryExpression
    | '-' unaryExpression
    | '~' unaryExpression
    | '++' unaryExpression
    | '--' unaryExpression
    | newExpression
    | deleteExpression
    | castExpression
    | assertExpression
    | functionCallExpression
    | sliceExpression
    | indexExpression
    | '(' type ')' '.' identifierOrTemplateInstance
    | unaryExpression '.' identifierOrTemplateInstance
    | unaryExpression '--'
    | unaryExpression '++'
    ;

unionDeclaration:
      'union' Identifier templateParameters constraint? structBody
    | 'union' Identifier (structBody | ';')
    | 'union' structBody
    ;

unittest:
    'unittest' blockStatement
    ;

variableDeclaration:
      type declarator (',' declarator)* ';'
    | autoDeclaration
    ;

vector:
    '__vector' '(' type ')'
    ;

versionCondition:
    'version' '(' (IntegerLiteral | Identifier | 'unittest' | 'assert') ')'
    ;

versionSpecification:
    'version' '=' (Identifier | IntegerLiteral) ';'
    ;

whileStatement:
    'while' '(' expression ')' declarationOrStatement
    ;

withStatement:
    'with' '(' expression ')' statementNoCaseNoDefault
    ;

xorExpression:
      andExpression
    | xorExpression '^' andExpression
    ;

