�
SD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\IJsonRpcHandler.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{		 
public 

	interface 
IJsonRpcHandler $
{ 
IReadOnlyDictionary 
< 
string "
," #"
JsonRpcRequestContract$ :
>: ;
GetContracts< H
(H I
)I J
;J K
Task 
< 
JsonRpcResponse 
> 
HandleAsync )
() *
JsonRpcRequest* 8
request9 @
)@ A
;A B
} 
} �
SD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\IJsonRpcService.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
public 

	interface 
IJsonRpcService $
{		 
}

 
} �
XD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\InterfaceAssistant`1.cs
	namespace

 	
Anemonis


 
.

 

AspNetCore

 
.

 
JsonRpc

 %
{ 
internal 
static 
class 
InterfaceAssistant ,
<, -
T- .
>. /
where 
T 
: 
class 
{ 
public 
static 
List 
< 
TypeInfo #
># $
GetDefinedTypes% 4
(4 5
)5 6
{ 	
var 
types 
= 
new 
List  
<  !
TypeInfo! )
>) *
(* +
)+ ,
;, -
var 

assemblies 
= 
	AppDomain &
.& '
CurrentDomain' 4
.4 5
GetAssemblies5 B
(B C
)C D
;D E
for 
( 
var 
i 
= 
$num 
; 
i 
< 

assemblies  *
.* +
Length+ 1
;1 2
i3 4
++4 6
)6 7
{ 
var 
definedTypes  
=! "
default# *
(* +
IEnumerable+ 6
<6 7
TypeInfo7 ?
>? @
)@ A
;A B
try 
{ 
definedTypes  
=! "

assemblies# -
[- .
i. /
]/ 0
.0 1
DefinedTypes1 =
;= >
} 
catch 
( '
ReflectionTypeLoadException 2
)2 3
{ 
continue 
; 
} 
foreach!! 
(!! 
var!! 
type!! !
in!!" $
definedTypes!!% 1
)!!1 2
{"" 
if## 
(## 
typeof## 
(## 
T##  
)##  !
.##! "
IsAssignableFrom##" 2
(##2 3
type##3 7
)##7 8
)##8 9
{$$ 
types%% 
.%% 
Add%% !
(%%! "
type%%" &
)%%& '
;%%' (
}&& 
}'' 
}(( 
return** 
types** 
;** 
}++ 	
public-- 
static-- 
void-- 
VerifyTypeParam-- *
(--* +
Type--+ /
param--0 5
,--5 6
string--7 =
	paramName--> G
)--G H
{.. 	
if// 
(// 
!// 
param// 
.// 
IsClass// 
)// 
{00 
throw11 
new11 
ArgumentException11 +
(11+ ,
Strings11, 3
.113 4
	GetString114 =
(11= >
$str11> ^
)11^ _
,11_ `
	paramName11a j
)11j k
;11k l
}22 
if33 
(33 
!33 
typeof33 
(33 
T33 
)33 
.33 
IsAssignableFrom33 +
(33+ ,
param33, 1
)331 2
)332 3
{44 
throw55 
new55 
ArgumentException55 +
(55+ ,
string55, 2
.552 3
Format553 9
(559 :
CultureInfo55: E
.55E F
CurrentCulture55F T
,55T U
Strings55V ]
.55] ^
	GetString55^ g
(55g h
$str	55h �
)
55� �
,
55� �
typeof
55� �
(
55� �
T
55� �
)
55� �
)
55� �
,
55� �
	paramName
55� �
)
55� �
;
55� �
}66 
}77 	
}88 
}99 �z
\D:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcBuilderExtensions.cs
	namespace

 	
	Microsoft


 
.

 

AspNetCore

 
.

 
Builder

 &
{ 
public 

static 
class $
JsonRpcBuilderExtensions 0
{ 
public 
static 
IApplicationBuilder )
UseJsonRpcHandler* ;
(; <
this< @
IApplicationBuilderA T
builderU \
,\ ]
Type^ b
typec g
,g h

PathStringi s
patht x
=y z
default	{ �
)
� �
{ 	
if 
( 
builder 
== 
null 
)  
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
builder7 >
)> ?
)? @
;@ A
} 
if 
( 
type 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
type7 ;
); <
)< =
;= >
} 
InterfaceAssistant!! 
<!! 
IJsonRpcHandler!! .
>!!. /
.!!/ 0
VerifyTypeParam!!0 ?
(!!? @
type!!@ D
,!!D E
nameof!!F L
(!!L M
type!!M Q
)!!Q R
)!!R S
;!!S T
if## 
(## 
!## 
path## 
.## 
HasValue## 
)## 
{$$ 
var%%  
jsonRpcRouteAtribute%% (
=%%) *
type%%+ /
.%%/ 0
GetCustomAttribute%%0 B
<%%B C!
JsonRpcRouteAttribute%%C X
>%%X Y
(%%Y Z
)%%Z [
;%%[ \
if'' 
(''  
jsonRpcRouteAtribute'' (
!='') +
null'', 0
)''0 1
{(( 
path)) 
=))  
jsonRpcRouteAtribute)) /
.))/ 0
Path))0 4
;))4 5
}** 
}++ 
var-- 
middlewareType-- 
=--  
typeof--! '
(--' (
JsonRpcMiddleware--( 9
<--9 :
>--: ;
)--; <
.--< =
MakeGenericType--= L
(--L M
type--M Q
)--Q R
;--R S
return// 
builder// 
.// 
Map// 
(// 
path// #
,//# $
b//% &
=>//' )
b//* +
.//+ ,
UseMiddleware//, 9
(//9 :
middlewareType//: H
)//H I
)//I J
;//J K
}00 	
public88 
static88 
IApplicationBuilder88 )
UseJsonRpcHandler88* ;
<88; <
T88< =
>88= >
(88> ?
this88? C
IApplicationBuilder88D W
builder88X _
,88_ `

PathString88a k
path88l p
=88q r
default88s z
)88z {
where99 
T99 
:99 
class99 
,99 
IJsonRpcHandler99 ,
{:: 	
if;; 
(;; 
builder;; 
==;; 
null;; 
);;  
{<< 
throw== 
new== !
ArgumentNullException== /
(==/ 0
nameof==0 6
(==6 7
builder==7 >
)==> ?
)==? @
;==@ A
}>> 
if@@ 
(@@ 
!@@ 
path@@ 
.@@ 
HasValue@@ 
)@@ 
{AA 
varBB  
jsonRpcRouteAtributeBB (
=BB) *
typeofBB+ 1
(BB1 2
TBB2 3
)BB3 4
.BB4 5
GetCustomAttributeBB5 G
<BBG H!
JsonRpcRouteAttributeBBH ]
>BB] ^
(BB^ _
)BB_ `
;BB` a
ifDD 
(DD  
jsonRpcRouteAtributeDD (
!=DD) +
nullDD, 0
)DD0 1
{EE 
pathFF 
=FF  
jsonRpcRouteAtributeFF /
.FF/ 0
PathFF0 4
;FF4 5
}GG 
}HH 
returnJJ 
builderJJ 
.JJ 
MapJJ 
(JJ 
pathJJ #
,JJ# $
bJJ% &
=>JJ' )
bJJ* +
.JJ+ ,
UseMiddlewareJJ, 9
(JJ9 :
typeofJJ: @
(JJ@ A
JsonRpcMiddlewareJJA R
<JJR S
TJJS T
>JJT U
)JJU V
)JJV W
)JJW X
;JJX Y
}KK 	
publicQQ 
staticQQ 
IApplicationBuilderQQ )
UseJsonRpcHandlersQQ* <
(QQ< =
thisQQ= A
IApplicationBuilderQQB U
builderQQV ]
)QQ] ^
{RR 	
ifSS 
(SS 
builderSS 
==SS 
nullSS 
)SS  
{TT 
throwUU 
newUU !
ArgumentNullExceptionUU /
(UU/ 0
nameofUU0 6
(UU6 7
builderUU7 >
)UU> ?
)UU? @
;UU@ A
}VV 
varXX 
typesXX 
=XX 
InterfaceAssistantXX *
<XX* +
IJsonRpcHandlerXX+ :
>XX: ;
.XX; <
GetDefinedTypesXX< K
(XXK L
)XXL M
;XXM N
forZZ 
(ZZ 
varZZ 
iZZ 
=ZZ 
$numZZ 
;ZZ 
iZZ 
<ZZ 
typesZZ  %
.ZZ% &
CountZZ& +
;ZZ+ ,
iZZ- .
++ZZ. 0
)ZZ0 1
{[[ 
var\\  
jsonRpcRouteAtribute\\ (
=\\) *
types\\+ 0
[\\0 1
i\\1 2
]\\2 3
.\\3 4
GetCustomAttribute\\4 F
<\\F G!
JsonRpcRouteAttribute\\G \
>\\\ ]
(\\] ^
)\\^ _
;\\_ `
if^^ 
(^^  
jsonRpcRouteAtribute^^ (
==^^) +
null^^, 0
)^^0 1
{__ 
continue`` 
;`` 
}aa 
varcc 
middlewareTypecc "
=cc# $
typeofcc% +
(cc+ ,
JsonRpcMiddlewarecc, =
<cc= >
>cc> ?
)cc? @
.cc@ A
MakeGenericTypeccA P
(ccP Q
typesccQ V
[ccV W
iccW X
]ccX Y
)ccY Z
;ccZ [
builderee 
.ee 
Mapee 
(ee  
jsonRpcRouteAtributeee 0
.ee0 1
Pathee1 5
,ee5 6
bee7 8
=>ee9 ;
bee< =
.ee= >
UseMiddlewareee> K
(eeK L
middlewareTypeeeL Z
)eeZ [
)ee[ \
;ee\ ]
}ff 
returnhh 
builderhh 
;hh 
}ii 	
publicrr 
staticrr 
IApplicationBuilderrr )
UseJsonRpcServicerr* ;
(rr; <
thisrr< @
IApplicationBuilderrrA T
builderrrU \
,rr\ ]
Typerr^ b
typerrc g
,rrg h

PathStringrri s
pathrrt x
=rry z
default	rr{ �
)
rr� �
{ss 	
iftt 
(tt 
buildertt 
==tt 
nulltt 
)tt  
{uu 
throwvv 
newvv !
ArgumentNullExceptionvv /
(vv/ 0
nameofvv0 6
(vv6 7
buildervv7 >
)vv> ?
)vv? @
;vv@ A
}ww 
ifxx 
(xx 
typexx 
==xx 
nullxx 
)xx 
{yy 
throwzz 
newzz !
ArgumentNullExceptionzz /
(zz/ 0
nameofzz0 6
(zz6 7
typezz7 ;
)zz; <
)zz< =
;zz= >
}{{ 
InterfaceAssistant}} 
<}} 
IJsonRpcService}} .
>}}. /
.}}/ 0
VerifyTypeParam}}0 ?
(}}? @
type}}@ D
,}}D E
nameof}}F L
(}}L M
type}}M Q
)}}Q R
)}}R S
;}}S T
if 
( 
! 
path 
. 
HasValue 
) 
{
�� 
var
�� "
jsonRpcRouteAtribute
�� (
=
��) *
type
��+ /
.
��/ 0 
GetCustomAttribute
��0 B
<
��B C#
JsonRpcRouteAttribute
��C X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
if
�� 
(
�� "
jsonRpcRouteAtribute
�� (
!=
��) +
null
��, 0
)
��0 1
{
�� 
path
�� 
=
�� "
jsonRpcRouteAtribute
�� /
.
��/ 0
Path
��0 4
;
��4 5
}
�� 
}
�� 
var
�� 
middlewareType
�� 
=
��  
typeof
��! '
(
��' (
JsonRpcMiddleware
��( 9
<
��9 :
>
��: ;
)
��; <
.
��< =
MakeGenericType
��= L
(
��L M
typeof
��M S
(
��S T#
JsonRpcServiceHandler
��T i
<
��i j
>
��j k
)
��k l
.
��l m
MakeGenericType
��m |
(
��| }
type��} �
)��� �
)��� �
;��� �
return
�� 
builder
�� 
.
�� 
Map
�� 
(
�� 
path
�� #
,
��# $
b
��% &
=>
��' )
b
��* +
.
��+ ,
UseMiddleware
��, 9
(
��9 :
middlewareType
��: H
)
��H I
)
��I J
;
��J K
}
�� 	
public
�� 
static
�� !
IApplicationBuilder
�� )
UseJsonRpcService
��* ;
<
��; <
T
��< =
>
��= >
(
��> ?
this
��? C!
IApplicationBuilder
��D W
builder
��X _
,
��_ `

PathString
��a k
path
��l p
=
��q r
default
��s z
)
��z {
where
�� 
T
�� 
:
�� 
class
�� 
,
�� 
IJsonRpcService
�� ,
{
�� 	
if
�� 
(
�� 
builder
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
builder
��7 >
)
��> ?
)
��? @
;
��@ A
}
�� 
if
�� 
(
�� 
!
�� 
path
�� 
.
�� 
HasValue
�� 
)
�� 
{
�� 
var
�� "
jsonRpcRouteAtribute
�� (
=
��) *
typeof
��+ 1
(
��1 2
T
��2 3
)
��3 4
.
��4 5 
GetCustomAttribute
��5 G
<
��G H#
JsonRpcRouteAttribute
��H ]
>
��] ^
(
��^ _
)
��_ `
;
��` a
if
�� 
(
�� "
jsonRpcRouteAtribute
�� (
!=
��) +
null
��, 0
)
��0 1
{
�� 
path
�� 
=
�� "
jsonRpcRouteAtribute
�� /
.
��/ 0
Path
��0 4
;
��4 5
}
�� 
}
�� 
return
�� 
builder
�� 
.
�� 
Map
�� 
(
�� 
path
�� #
,
��# $
b
��% &
=>
��' )
b
��* +
.
��+ ,
UseMiddleware
��, 9
(
��9 :
typeof
��: @
(
��@ A
JsonRpcMiddleware
��A R
<
��R S#
JsonRpcServiceHandler
��S h
<
��h i
T
��i j
>
��j k
>
��k l
)
��l m
)
��m n
)
��n o
;
��o p
}
�� 	
public
�� 
static
�� !
IApplicationBuilder
�� ) 
UseJsonRpcServices
��* <
(
��< =
this
��= A!
IApplicationBuilder
��B U
builder
��V ]
)
��] ^
{
�� 	
if
�� 
(
�� 
builder
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
builder
��7 >
)
��> ?
)
��? @
;
��@ A
}
�� 
var
�� 
types
�� 
=
��  
InterfaceAssistant
�� *
<
��* +
IJsonRpcService
��+ :
>
��: ;
.
��; <
GetDefinedTypes
��< K
(
��K L
)
��L M
;
��M N
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
types
��  %
.
��% &
Count
��& +
;
��+ ,
i
��- .
++
��. 0
)
��0 1
{
�� 
var
�� "
jsonRpcRouteAtribute
�� (
=
��) *
types
��+ 0
[
��0 1
i
��1 2
]
��2 3
.
��3 4 
GetCustomAttribute
��4 F
<
��F G#
JsonRpcRouteAttribute
��G \
>
��\ ]
(
��] ^
)
��^ _
;
��_ `
if
�� 
(
�� "
jsonRpcRouteAtribute
�� (
==
��) +
null
��, 0
)
��0 1
{
�� 
continue
�� 
;
�� 
}
�� 
var
�� 
middlewareType
�� "
=
��# $
typeof
��% +
(
��+ ,
JsonRpcMiddleware
��, =
<
��= >
>
��> ?
)
��? @
.
��@ A
MakeGenericType
��A P
(
��P Q
typeof
��Q W
(
��W X#
JsonRpcServiceHandler
��X m
<
��m n
>
��n o
)
��o p
.
��p q
MakeGenericType��q �
(��� �
types��� �
[��� �
i��� �
]��� �
)��� �
)��� �
;��� �
builder
�� 
.
�� 
Map
�� 
(
�� "
jsonRpcRouteAtribute
�� 0
.
��0 1
Path
��1 5
,
��5 6
b
��7 8
=>
��9 ;
b
��< =
.
��= >
UseMiddleware
��> K
(
��K L
middlewareType
��L Z
)
��Z [
)
��[ \
;
��\ ]
}
�� 
return
�� 
builder
�� 
;
�� 
}
�� 	
public
�� 
static
�� !
IApplicationBuilder
�� )

UseJsonRpc
��* 4
(
��4 5
this
��5 9!
IApplicationBuilder
��: M
builder
��N U
)
��U V
{
�� 	
if
�� 
(
�� 
builder
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
builder
��7 >
)
��> ?
)
��? @
;
��@ A
}
�� 
builder
�� 
.
��  
UseJsonRpcHandlers
�� &
(
��& '
)
��' (
;
��( )
builder
�� 
.
��  
UseJsonRpcServices
�� &
(
��& '
)
��' (
;
��( )
return
�� 
builder
�� 
;
�� 
}
�� 	
}
�� 
}�� �
[D:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcHandlerErrorCode.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
internal 
static 
class #
JsonRpcHandlerErrorCode 1
{ 
public 
const 
long (
BatchHasDuplicateIdentifiers 6
=7 8
-9 :
$num: @
;@ A
} 
}		 �j
[D:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcLoggerExtensions.cs
	namespace		 	
Anemonis		
 
.		 

AspNetCore		 
.		 
JsonRpc		 %
{

 
internal 
static 
class #
JsonRpcLoggerExtensions 1
{ 
private 
static 
readonly 
Action  &
<& '
ILogger' .
,. /
	Exception0 9
>9 :
_logDataIsMessage; L
=M N
LoggerMessage 
. 
Define  
(  !
LogLevel 
. 
Trace 
, 
new 
EventId 
( 
$num  
,  !
$str" ;
); <
,< =
Strings 
. 
	GetString !
(! "
$str" ;
); <
)< =
;= >
private 
static 
readonly 
Action  &
<& '
ILogger' .
,. /
int0 3
,3 4
	Exception5 >
>> ?
_logDataIsBatch@ O
=P Q
LoggerMessage 
. 
Define  
<  !
int! $
>$ %
(% &
LogLevel 
. 
Trace 
, 
new 
EventId 
( 
$num  
,  !
$str" 9
)9 :
,: ;
Strings 
. 
	GetString !
(! "
$str" 9
)9 :
): ;
;; <
private 
static 
readonly 
Action  &
<& '
ILogger' .
,. /
int0 3
,3 4
	Exception5 >
>> ?/
#_logHandledNotificationSuccessfully@ c
=d e
LoggerMessage 
. 
Define  
<  !
int! $
>$ %
(% &
LogLevel 
. 
Debug 
, 
new 
EventId 
( 
$num  
,  !
$str" M
)M N
,N O
Strings 
. 
	GetString !
(! "
$str" M
)M N
)N O
;O P
private 
static 
readonly 
Action  &
<& '
ILogger' .
,. /
int0 3
,3 4
	Exception5 >
>> ?4
(_logHandledRequestWithResultSuccessfully@ h
=i j
LoggerMessage 
. 
Define  
<  !
int! $
>$ %
(% &
LogLevel 
. 
Debug 
, 
new 
EventId 
( 
$num  
,  !
$str" T
)T U
,U V
Strings   
.   
	GetString   !
(  ! "
$str  " T
)  T U
)  U V
;  V W
private!! 
static!! 
readonly!! 
Action!!  &
<!!& '
ILogger!!' .
,!!. /
long!!0 4
,!!4 5
int!!6 9
,!!9 :
	Exception!!; D
>!!D E3
'_logHandledRequestWithErrorSuccessfully!!F m
=!!n o
LoggerMessage"" 
."" 
Define""  
<""  !
long""! %
,""% &
int""' *
>""* +
(""+ ,
LogLevel## 
.## 
Debug## 
,## 
new$$ 
EventId$$ 
($$ 
$num$$  
,$$  !
$str$$" S
)$$S T
,$$T U
Strings%% 
.%% 
	GetString%% !
(%%! "
$str%%" S
)%%S T
)%%T U
;%%U V
private&& 
static&& 
readonly&& 
Action&&  &
<&&& '
ILogger&&' .
,&&. /
int&&0 3
,&&3 4
	Exception&&5 >
>&&> ?6
*_logHandledRequestWithResultAsNotification&&@ j
=&&k l
LoggerMessage'' 
.'' 
Define''  
<''  !
int''! $
>''$ %
(''% &
LogLevel(( 
.(( 
Information(( $
,(($ %
new)) 
EventId)) 
()) 
$num))  
,))  !
$str))" W
)))W X
,))X Y
Strings** 
.** 
	GetString** !
(**! "
$str**" W
)**W X
)**X Y
;**Y Z
private++ 
static++ 
readonly++ 
Action++  &
<++& '
ILogger++' .
,++. /
long++0 4
,++4 5
int++6 9
,++9 :
	Exception++; D
>++D E5
)_logHandledRequestWithErrorAsNotification++F o
=++p q
LoggerMessage,, 
.,, 
Define,,  
<,,  !
long,,! %
,,,% &
int,,' *
>,,* +
(,,+ ,
LogLevel-- 
.-- 
Information-- $
,--$ %
new.. 
EventId.. 
(.. 
$num..  
,..  !
$str.." V
)..V W
,..W X
Strings// 
.// 
	GetString// !
(//! "
$str//" V
)//V W
)//W X
;//X Y
private00 
static00 
readonly00 
Action00  &
<00& '
ILogger00' .
,00. /
int000 3
,003 4
	Exception005 >
>00> ?,
 _logHandledNotificationAsRequest00@ `
=00a b
LoggerMessage11 
.11 
Define11  
<11  !
int11! $
>11$ %
(11% &
LogLevel22 
.22 
Warning22  
,22  !
new33 
EventId33 
(33 
$num33  
,33  !
$str33" K
)33K L
,33L M
Strings44 
.44 
	GetString44 !
(44! "
$str44" K
)44K L
)44L M
;44M N
private55 
static55 
readonly55 
Action55  &
<55& '
ILogger55' .
,55. /
	Exception550 9
>559 :
_logDataIsInvalid55; L
=55M N
LoggerMessage66 
.66 
Define66  
(66  !
LogLevel77 
.77 
Error77 
,77 
new88 
EventId88 
(88 
$num88  
,88  !
$str88" 8
)888 9
,889 :
Strings99 
.99 
	GetString99 !
(99! "
$str99" 8
)998 9
)999 :
;99: ;
private:: 
static:: 
readonly:: 
Action::  &
<::& '
ILogger::' .
,::. /
int::0 3
,::3 4
	Exception::5 >
>::> ? 
_logRequestIsInvalid::@ T
=::U V
LoggerMessage;; 
.;; 
Define;;  
<;;  !
int;;! $
>;;$ %
(;;% &
LogLevel<< 
.<< 
Error<< 
,<< 
new== 
EventId== 
(== 
$num==  
,==  !
$str==" ;
)==; <
,==< =
Strings>> 
.>> 
	GetString>> !
(>>! "
$str>>" ;
)>>; <
)>>< =
;>>= >
private?? 
static?? 
readonly?? 
Action??  &
<??& '
ILogger??' .
,??. /
	Exception??0 9
>??9 :,
 _logBatchHasDuplicateIdentifiers??; [
=??\ ]
LoggerMessage@@ 
.@@ 
Define@@  
(@@  !
LogLevelAA 
.AA 
ErrorAA 
,AA 
newBB 
EventIdBB 
(BB 
$numBB  
,BB  !
$strBB" K
)BBK L
,BBL M
StringsCC 
.CC 
	GetStringCC !
(CC! "
$strCC" K
)CCK L
)CCL M
;CCM N
publicEE 
staticEE 
voidEE 
LogDataIsMessageEE +
(EE+ ,
thisEE, 0
ILoggerEE1 8
loggerEE9 ?
)EE? @
{FF 	
_logDataIsMessageGG 
.GG 
InvokeGG $
(GG$ %
loggerGG% +
,GG+ ,
nullGG- 1
)GG1 2
;GG2 3
}HH 	
publicJJ 
staticJJ 
voidJJ 
LogDataIsBatchJJ )
(JJ) *
thisJJ* .
ILoggerJJ/ 6
loggerJJ7 =
,JJ= >
intJJ? B
countJJC H
)JJH I
{KK 	
_logDataIsBatchLL 
.LL 
InvokeLL "
(LL" #
loggerLL# )
,LL) *
countLL+ 0
,LL0 1
nullLL2 6
)LL6 7
;LL7 8
}MM 	
publicOO 
staticOO 
voidOO .
"LogHandledNotificationSuccessfullyOO =
(OO= >
thisOO> B
ILoggerOOC J
loggerOOK Q
,OOQ R
intOOS V
indexOOW \
)OO\ ]
{PP 	/
#_logHandledNotificationSuccessfullyQQ /
.QQ/ 0
InvokeQQ0 6
(QQ6 7
loggerQQ7 =
,QQ= >
indexQQ? D
,QQD E
nullQQF J
)QQJ K
;QQK L
}RR 	
publicTT 
staticTT 
voidTT 3
'LogHandledRequestWithResultSuccessfullyTT B
(TTB C
thisTTC G
ILoggerTTH O
loggerTTP V
,TTV W
intTTX [
indexTT\ a
)TTa b
{UU 	4
(_logHandledRequestWithResultSuccessfullyVV 4
.VV4 5
InvokeVV5 ;
(VV; <
loggerVV< B
,VVB C
indexVVD I
,VVI J
nullVVK O
)VVO P
;VVP Q
}WW 	
publicYY 
staticYY 
voidYY 2
&LogHandledRequestWithErrorSuccessfullyYY A
(YYA B
thisYYB F
ILoggerYYG N
loggerYYO U
,YYU V
longYYW [
	errorCodeYY\ e
,YYe f
intYYg j
indexYYk p
)YYp q
{ZZ 	3
'_logHandledRequestWithErrorSuccessfully[[ 3
.[[3 4
Invoke[[4 :
([[: ;
logger[[; A
,[[A B
	errorCode[[C L
,[[L M
index[[N S
,[[S T
null[[U Y
)[[Y Z
;[[Z [
}\\ 	
public^^ 
static^^ 
void^^ 5
)LogHandledRequestWithResultAsNotification^^ D
(^^D E
this^^E I
ILogger^^J Q
logger^^R X
,^^X Y
int^^Z ]
index^^^ c
)^^c d
{__ 	6
*_logHandledRequestWithResultAsNotification`` 6
.``6 7
Invoke``7 =
(``= >
logger``> D
,``D E
index``F K
,``K L
null``M Q
)``Q R
;``R S
}aa 	
publiccc 
staticcc 
voidcc 4
(LogHandledRequestWithErrorAsNotificationcc C
(ccC D
thisccD H
ILoggerccI P
loggerccQ W
,ccW X
longccY ]
	errorCodecc^ g
,ccg h
intcci l
indexccm r
)ccr s
{dd 	5
)_logHandledRequestWithErrorAsNotificationee 5
.ee5 6
Invokeee6 <
(ee< =
loggeree= C
,eeC D
	errorCodeeeE N
,eeN O
indexeeP U
,eeU V
nulleeW [
)ee[ \
;ee\ ]
}ff 	
publichh 
statichh 
voidhh +
LogHandledNotificationAsRequesthh :
(hh: ;
thishh; ?
ILoggerhh@ G
loggerhhH N
,hhN O
inthhP S
indexhhT Y
)hhY Z
{ii 	,
 _logHandledNotificationAsRequestjj ,
.jj, -
Invokejj- 3
(jj3 4
loggerjj4 :
,jj: ;
indexjj< A
,jjA B
nulljjC G
)jjG H
;jjH I
}kk 	
publicmm 
staticmm 
voidmm 
LogDataIsInvalidmm +
(mm+ ,
thismm, 0
ILoggermm1 8
loggermm9 ?
,mm? @
	ExceptionmmA J
	exceptionmmK T
)mmT U
{nn 	
_logDataIsInvalidoo 
.oo 
Invokeoo $
(oo$ %
loggeroo% +
,oo+ ,
	exceptionoo- 6
)oo6 7
;oo7 8
}pp 	
publicrr 
staticrr 
voidrr 
LogRequestIsInvalidrr .
(rr. /
thisrr/ 3
ILoggerrr4 ;
loggerrr< B
,rrB C
intrrD G
indexrrH M
,rrM N
	ExceptionrrO X
	exceptionrrY b
)rrb c
{ss 	 
_logRequestIsInvalidtt  
.tt  !
Invokett! '
(tt' (
loggertt( .
,tt. /
indextt0 5
,tt5 6
	exceptiontt7 @
)tt@ A
;ttA B
}uu 	
publicww 
staticww 
voidww +
LogBatchHasDuplicateIdentifiersww :
(ww: ;
thisww; ?
ILoggerww@ G
loggerwwH N
)wwN O
{xx 	,
 _logBatchHasDuplicateIdentifiersyy ,
.yy, -
Invokeyy- 3
(yy3 4
loggeryy4 :
,yy: ;
nullyy< @
)yy@ A
;yyA B
}zz 	
}{{ 
}|| �
ZD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcMethodAttribute.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Method

% +
)

+ ,
]

, -
public 

sealed 
class "
JsonRpcMethodAttribute .
:/ 0
	Attribute1 :
{ 
public "
JsonRpcMethodAttribute %
(% &
string& ,

methodName- 7
)7 8
{ 	
if 
( 

methodName 
== 
null "
)" #
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7

methodName7 A
)A B
)B C
;C D
} 

MethodName 
= 

methodName #
;# $
} 	
public "
JsonRpcMethodAttribute %
(% &
string& ,

methodName- 7
,7 8
params9 ?
int@ C
[C D
]D E
parameterPositionsF X
)X Y
: 
this 
( 

methodName 
) 
{   	
if!! 
(!! 
parameterPositions!! "
==!!# %
null!!& *
)!!* +
{"" 
throw## 
new## !
ArgumentNullException## /
(##/ 0
nameof##0 6
(##6 7
parameterPositions##7 I
)##I J
)##J K
;##K L
}$$ 
ParameterPositions&& 
=&&  
parameterPositions&&! 3
;&&3 4
ParametersType'' 
='' !
JsonRpcParametersType'' 2
.''2 3

ByPosition''3 =
;''= >
}(( 	
public.. "
JsonRpcMethodAttribute.. %
(..% &
string..& ,

methodName..- 7
,..7 8
params..9 ?
string..@ F
[..F G
]..G H
parameterNames..I W
)..W X
:// 
this// 
(// 

methodName// 
)// 
{00 	
if11 
(11 
parameterNames11 
==11 !
null11" &
)11& '
{22 
throw33 
new33 !
ArgumentNullException33 /
(33/ 0
nameof330 6
(336 7
parameterNames337 E
)33E F
)33F G
;33G H
}44 
ParameterNames66 
=66 
parameterNames66 +
;66+ ,
ParametersType77 
=77 !
JsonRpcParametersType77 2
.772 3
ByName773 9
;779 :
}88 	
internal:: 
string:: 

MethodName:: "
{;; 	
get<< 
;<< 
}== 	
internal?? !
JsonRpcParametersType?? &
ParametersType??' 5
{@@ 	
getAA 
;AA 
}BB 	
internalDD 
intDD 
[DD 
]DD 
ParameterPositionsDD )
{EE 	
getFF 
;FF 
}GG 	
internalII 
stringII 
[II 
]II 
ParameterNamesII (
{JJ 	
getKK 
;KK 
}LL 	
}MM 
}NN �
UD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcMethodInfo.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
internal 
sealed 
class 
JsonRpcMethodInfo +
{ 
public		 
JsonRpcMethodInfo		  
(		  !

MethodInfo		! +
method		, 2
)		2 3
{

 	
Method 
= 
method 
; 
} 	
public 
JsonRpcMethodInfo  
(  !

MethodInfo! +
method, 2
,2 3
int4 7
[7 8
]8 9
parameterPositions: L
)L M
: 
this 
( 
method 
) 
{ 	
ParameterPositions 
=  
parameterPositions! 3
;3 4
} 	
public 
JsonRpcMethodInfo  
(  !

MethodInfo! +
method, 2
,2 3
string4 :
[: ;
]; <
parameterNames= K
)K L
: 
this 
( 
method 
) 
{ 	
ParameterNames 
= 
parameterNames +
;+ ,
} 	
public 

MethodInfo 
Method  
{ 	
get 
; 
} 	
public 
int 
[ 
] 
ParameterPositions '
{   	
get!! 
;!! 
}"" 	
public$$ 
string$$ 
[$$ 
]$$ 
ParameterNames$$ &
{%% 	
get&& 
;&& 
}'' 	
}(( 
})) ��
WD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcMiddleware`1.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
public 

sealed 
class 
JsonRpcMiddleware )
<) *
T* +
>+ ,
:- .
IMiddleware/ :
,: ;
IDisposable< G
where 
T 
: 
class 
, 
IJsonRpcHandler (
{ 
private 
const 
int 
_streamBufferSize +
=, -
$num. 2
;2 3
private!! 
static!! 
readonly!! 
string!!  &#
_contentTypeHeaderValue!!' >
=!!? @
$"!!A C
{!!C D

MediaTypes!!D N
.!!N O
ApplicationJson!!O ^
}!!^ _
; charset=utf-8!!_ n
"!!n o
;!!o p
private"" 
static"" 
readonly"" 

Dictionary""  *
<""* +
string""+ 1
,""1 2
Encoding""3 ;
>""; <
_supportedEncodings""= P
=""Q R$
CreateSupportedEncodings""S k
(""k l
)""l m
;""m n
private## 
static## 
readonly## 

Dictionary##  *
<##* +
long##+ /
,##/ 0
JsonRpcError##1 =
>##= >"
_standardJsonRpcErrors##? U
=##V W'
CreateStandardJsonRpcErrors##X s
(##s t
)##t u
;##u v
private$$ 
static$$ 
readonly$$ 

Dictionary$$  *
<$$* +
long$$+ /
,$$/ 0
JsonRpcResponse$$1 @
>$$@ A%
_standardJsonRpcResponses$$B [
=$$\ ]*
CreateStandardJsonRpcResponses$$^ |
($$| }
)$$} ~
;$$~ 
private&& 
readonly&& 
IHostingEnvironment&& ,
_environment&&- 9
;&&9 :
private'' 
readonly'' 
ILogger''  
_logger''! (
;''( )
private(( 
readonly(( 
T(( 
_handler(( #
;((# $
private)) 
readonly)) 
JsonRpcSerializer)) *
_serializer))+ 6
;))6 7
public00 
JsonRpcMiddleware00  
(00  !
IServiceProvider00! 1
services002 :
,00: ;
IHostingEnvironment00< O
environment00P [
,00[ \
ILogger00] d
<00d e
JsonRpcMiddleware00e v
<00v w
T00w x
>00x y
>00y z
logger	00{ �
)
00� �
{11 	
if22 
(22 
services22 
==22 
null22  
)22  !
{33 
throw44 
new44 !
ArgumentNullException44 /
(44/ 0
nameof440 6
(446 7
services447 ?
)44? @
)44@ A
;44A B
}55 
if66 
(66 
environment66 
==66 
null66 #
)66# $
{77 
throw88 
new88 !
ArgumentNullException88 /
(88/ 0
nameof880 6
(886 7
environment887 B
)88B C
)88C D
;88D E
}99 
if:: 
(:: 
logger:: 
==:: 
null:: 
):: 
{;; 
throw<< 
new<< !
ArgumentNullException<< /
(<</ 0
nameof<<0 6
(<<6 7
logger<<7 =
)<<= >
)<<> ?
;<<? @
}== 
_environment?? 
=?? 
environment?? &
;??& '
_logger@@ 
=@@ 
logger@@ 
;@@ 
_handlerAA 
=AA 
servicesAA 
.AA  

GetServiceAA  *
<AA* +
TAA+ ,
>AA, -
(AA- .
)AA. /
??AA0 2
ActivatorUtilitiesAA3 E
.AAE F
CreateInstanceAAF T
<AAT U
TAAU V
>AAV W
(AAW X
servicesAAX `
)AA` a
;AAa b
_serializerBB 
=BB 
newBB 
JsonRpcSerializerBB /
(BB/ 0)
CreateJsonRpcContractResolverBB0 M
(BBM N
_handlerBBN V
)BBV W
,BBW X
servicesBBY a
.BBa b

GetServiceBBb l
<BBl m
IOptionsBBm u
<BBu v
JsonRpcOptions	BBv �
>
BB� �
>
BB� �
(
BB� �
)
BB� �
?
BB� �
.
BB� �
Value
BB� �
?
BB� �
.
BB� �
JsonSerializer
BB� �
)
BB� �
;
BB� �
}CC 	
privateEE 
staticEE 

DictionaryEE !
<EE! "
stringEE" (
,EE( )
EncodingEE* 2
>EE2 3$
CreateSupportedEncodingsEE4 L
(EEL M
)EEM N
{FF 	
returnGG 
newGG 

DictionaryGG !
<GG! "
stringGG" (
,GG( )
EncodingGG* 2
>GG2 3
(GG3 4
StringComparerGG4 B
.GGB C
OrdinalIgnoreCaseGGC T
)GGT U
{HH 
[II 
EncodingII 
.II 
UTF8II 
.II 
WebNameII &
]II& '
=II( )
newII* -
UTF8EncodingII. :
(II: ;
falseII; @
,II@ A
trueIIB F
)IIF G
,IIG H
[JJ 
EncodingJJ 
.JJ 
UnicodeJJ !
.JJ! "
WebNameJJ" )
]JJ) *
=JJ+ ,
newJJ- 0
UnicodeEncodingJJ1 @
(JJ@ A
falseJJA F
,JJF G
falseJJH M
,JJM N
trueJJO S
)JJS T
,JJT U
[KK 
EncodingKK 
.KK 
UTF32KK 
.KK  
WebNameKK  '
]KK' (
=KK) *
newKK+ .
UTF32EncodingKK/ <
(KK< =
falseKK= B
,KKB C
falseKKD I
,KKI J
trueKKK O
)KKO P
}LL 
;LL 
}MM 	
privateOO 
staticOO 

DictionaryOO !
<OO! "
longOO" &
,OO& '
JsonRpcErrorOO( 4
>OO4 5'
CreateStandardJsonRpcErrorsOO6 Q
(OOQ R
)OOR S
{PP 	
returnQQ 
newQQ 

DictionaryQQ !
<QQ! "
longQQ" &
,QQ& '
JsonRpcErrorQQ( 4
>QQ4 5
{RR 
[SS 
JsonRpcErrorCodeSS !
.SS! "
InvalidFormatSS" /
]SS/ 0
=SS1 2
newTT 
JsonRpcErrorTT $
(TT$ %
JsonRpcErrorCodeTT% 5
.TT5 6
InvalidFormatTT6 C
,TTC D
StringsTTE L
.TTL M
	GetStringTTM V
(TTV W
$strTTW q
)TTq r
)TTr s
,TTs t
[UU 
JsonRpcErrorCodeUU !
.UU! "
InvalidOperationUU" 2
]UU2 3
=UU4 5
newVV 
JsonRpcErrorVV $
(VV$ %
JsonRpcErrorCodeVV% 5
.VV5 6
InvalidOperationVV6 F
,VVF G
StringsVVH O
.VVO P
	GetStringVVP Y
(VVY Z
$strVVZ w
)VVw x
)VVx y
,VVy z
[WW 
JsonRpcErrorCodeWW !
.WW! "
InvalidParametersWW" 3
]WW3 4
=WW5 6
newXX 
JsonRpcErrorXX $
(XX$ %
JsonRpcErrorCodeXX% 5
.XX5 6
InvalidParametersXX6 G
,XXG H
StringsXXI P
.XXP Q
	GetStringXXQ Z
(XXZ [
$strXX[ y
)XXy z
)XXz {
,XX{ |
[YY 
JsonRpcErrorCodeYY !
.YY! "
InvalidMethodYY" /
]YY/ 0
=YY1 2
newZZ 
JsonRpcErrorZZ $
(ZZ$ %
JsonRpcErrorCodeZZ% 5
.ZZ5 6
InvalidMethodZZ6 C
,ZZC D
StringsZZE L
.ZZL M
	GetStringZZM V
(ZZV W
$strZZW q
)ZZq r
)ZZr s
,ZZs t
[[[ 
JsonRpcErrorCode[[ !
.[[! "
InvalidMessage[[" 0
][[0 1
=[[2 3
new\\ 
JsonRpcError\\ $
(\\$ %
JsonRpcErrorCode\\% 5
.\\5 6
InvalidMessage\\6 D
,\\D E
Strings\\F M
.\\M N
	GetString\\N W
(\\W X
$str\\X s
)\\s t
)\\t u
}]] 
;]] 
}^^ 	
private`` 
static`` 

Dictionary`` !
<``! "
long``" &
,``& '
JsonRpcResponse``( 7
>``7 8*
CreateStandardJsonRpcResponses``9 W
(``W X
)``X Y
{aa 	
returnbb 
newbb 

Dictionarybb !
<bb! "
longbb" &
,bb& '
JsonRpcResponsebb( 7
>bb7 8
{cc 
[dd 
JsonRpcErrorCodedd !
.dd! "
InvalidFormatdd" /
]dd/ 0
=dd1 2
newee 
JsonRpcResponseee '
(ee' (
defaultee( /
,ee/ 0
newee1 4
JsonRpcErroree5 A
(eeA B
JsonRpcErrorCodeeeB R
.eeR S
InvalidFormateeS `
,ee` a
Stringseeb i
.eei j
	GetStringeej s
(ees t
$str	eet �
)
ee� �
)
ee� �
)
ee� �
,
ee� �
[ff 
JsonRpcErrorCodeff !
.ff! "
InvalidOperationff" 2
]ff2 3
=ff4 5
newgg 
JsonRpcResponsegg '
(gg' (
defaultgg( /
,gg/ 0
newgg1 4
JsonRpcErrorgg5 A
(ggA B
JsonRpcErrorCodeggB R
.ggR S
InvalidOperationggS c
,ggc d
Stringsgge l
.ggl m
	GetStringggm v
(ggv w
$str	ggw �
)
gg� �
)
gg� �
)
gg� �
,
gg� �
[hh #
JsonRpcHandlerErrorCodehh (
.hh( )(
BatchHasDuplicateIdentifiershh) E
]hhE F
=hhG H
newii 
JsonRpcResponseii '
(ii' (
defaultii( /
,ii/ 0
newii1 4
JsonRpcErrorii5 A
(iiA B#
JsonRpcHandlerErrorCodeiiB Y
.iiY Z(
BatchHasDuplicateIdentifiersiiZ v
,iiv w
Stringsiix 
.	ii �
	GetString
ii� �
(
ii� �
$str
ii� �
)
ii� �
)
ii� �
)
ii� �
}jj 
;jj 
}kk 	
privatemm 
staticmm 
boolmm 
IsReservedErrorCodemm /
(mm/ 0
longmm0 4
codemm5 9
)mm9 :
{nn 	
returnoo 
(pp 
codepp 
==pp 
JsonRpcErrorCodepp )
.pp) *
InvalidFormatpp* 7
)pp7 8
||pp9 ;
(qq 
codeqq 
==qq 
JsonRpcErrorCodeqq )
.qq) *
InvalidMethodqq* 7
)qq7 8
||qq9 ;
(rr 
coderr 
==rr 
JsonRpcErrorCoderr )
.rr) *
InvalidMessagerr* 8
)rr8 9
||rr: <
(ss 
codess 
==ss #
JsonRpcHandlerErrorCodess 0
.ss0 1(
BatchHasDuplicateIdentifiersss1 M
)ssM N
;ssN O
}tt 	
privatevv 
staticvv #
JsonRpcContractResolvervv .)
CreateJsonRpcContractResolvervv/ L
(vvL M
TvvM N
handlervvO V
)vvV W
{ww 	
varxx 
	contractsxx 
=xx 
handlerxx #
.xx# $
GetContractsxx$ 0
(xx0 1
)xx1 2
;xx2 3
varyy 
resolveryy 
=yy 
newyy #
JsonRpcContractResolveryy 6
(yy6 7
)yy7 8
;yy8 9
foreach{{ 
({{ 
var{{ 
kvp{{ 
in{{ 
	contracts{{  )
){{) *
{|| 
if}} 
(}} 
kvp}} 
.}} 
Key}} 
==}} 
null}} #
)}}# $
{~~ 
throw 
new %
InvalidOperationException 7
(7 8
Strings8 ?
.? @
	GetString@ I
(I J
$strJ v
)v w
)w x
;x y
}
�� 
if
�� 
(
�� 
JsonRpcProtocol
�� #
.
��# $
IsSystemMethod
��$ 2
(
��2 3
kvp
��3 6
.
��6 7
Key
��7 :
)
��: ;
)
��; <
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
string
��8 >
.
��> ?
Format
��? E
(
��E F
CultureInfo
��F Q
.
��Q R
CurrentCulture
��R `
,
��` a
Strings
��b i
.
��i j
	GetString
��j s
(
��s t
$str��t �
)��� �
,��� �
kvp��� �
.��� �
Key��� �
)��� �
)��� �
;��� �
}
�� 
resolver
�� 
.
��  
AddRequestContract
�� +
(
��+ ,
kvp
��, /
.
��/ 0
Key
��0 3
,
��3 4
kvp
��5 8
.
��8 9
Value
��9 >
)
��> ?
;
��? @
}
�� 
return
�� 
resolver
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
InvokeAsync
�� %
(
��% &
HttpContext
��& 1
context
��2 9
,
��9 :
RequestDelegate
��; J
next
��K O
)
��O P
{
�� 	
if
�� 
(
�� 
context
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
context
��7 >
)
��> ?
)
��? @
;
��@ A
}
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
Equals
�� 
(
�� 
context
�� &
.
��& '
Request
��' .
.
��. /
Method
��/ 5
,
��5 6
HttpMethods
��7 B
.
��B C
Post
��C G
,
��G H
StringComparison
��I Y
.
��Y Z
OrdinalIgnoreCase
��Z k
)
��k l
)
��l m
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :'
Status405MethodNotAllowed
��: S
;
��S T
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
context
�� 
.
�� 
Request
�� 
.
��  
Headers
��  '
.
��' (
ContainsKey
��( 3
(
��3 4
HeaderNames
��4 ?
.
��? @
ContentEncoding
��@ O
)
��O P
)
��P Q
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :+
Status415UnsupportedMediaType
��: W
;
��W X
return
�� 
;
�� 
}
�� 
var
�� #
requestStreamEncoding
�� %
=
��& '
default
��( /
(
��/ 0
Encoding
��0 8
)
��8 9
;
��9 :
var
�� $
responseStreamEncoding
�� &
=
��' (
default
��) 0
(
��0 1
Encoding
��1 9
)
��9 :
;
��: ;
if
�� 
(
�� 
!
�� 
context
�� 
.
�� 
Request
��  
.
��  !
Headers
��! (
.
��( )
TryGetValue
��) 4
(
��4 5
HeaderNames
��5 @
.
��@ A
ContentType
��A L
,
��L M
out
��N Q
var
��R U*
contentTypeHeaderValueString
��V r
)
��r s
)
��s t
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :+
Status415UnsupportedMediaType
��: W
;
��W X
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� "
MediaTypeHeaderValue
�� %
.
��% &
TryParse
��& .
(
��. /
(
��/ 0
string
��0 6
)
��6 7*
contentTypeHeaderValueString
��7 S
,
��S T
out
��U X
var
��Y \$
contentTypeHeaderValue
��] s
)
��s t
)
��t u
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :+
Status415UnsupportedMediaType
��: W
;
��W X
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� $
contentTypeHeaderValue
�� '
.
��' (
	MediaType
��( 1
.
��1 2
Equals
��2 8
(
��8 9

MediaTypes
��9 C
.
��C D
ApplicationJson
��D S
,
��S T
StringComparison
��U e
.
��e f
OrdinalIgnoreCase
��f w
)
��w x
)
��x y
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :+
Status415UnsupportedMediaType
��: W
;
��W X
return
�� 
;
�� 
}
�� 
if
�� 
(
�� $
contentTypeHeaderValue
�� &
.
��& '
Charset
��' .
.
��. /
HasValue
��/ 7
&&
��8 :
!
��; <!
_supportedEncodings
��< O
.
��O P
TryGetValue
��P [
(
��[ \$
contentTypeHeaderValue
��\ r
.
��r s
Charset
��s z
.
��z {
Value��{ �
,��� �
out��� �%
requestStreamEncoding��� �
)��� �
)��� �
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :+
Status415UnsupportedMediaType
��: W
;
��W X
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� 
context
�� 
.
�� 
Request
��  
.
��  !
Headers
��! (
.
��( )
TryGetValue
��) 4
(
��4 5
HeaderNames
��5 @
.
��@ A
Accept
��A G
,
��G H
out
��I L
var
��M P)
acceptTypeHeaderValueString
��Q l
)
��l m
)
��m n
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :$
Status406NotAcceptable
��: P
;
��P Q
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� "
MediaTypeHeaderValue
�� %
.
��% &
TryParse
��& .
(
��. /
(
��/ 0
string
��0 6
)
��6 7)
acceptTypeHeaderValueString
��7 R
,
��R S
out
��T W
var
��X [#
acceptTypeHeaderValue
��\ q
)
��q r
)
��r s
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :$
Status406NotAcceptable
��: P
;
��P Q
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
�� #
acceptTypeHeaderValue
�� &
.
��& '
	MediaType
��' 0
.
��0 1
Equals
��1 7
(
��7 8

MediaTypes
��8 B
.
��B C
ApplicationJson
��C R
,
��R S
StringComparison
��T d
.
��d e
OrdinalIgnoreCase
��e v
)
��v w
)
��w x
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :$
Status406NotAcceptable
��: P
;
��P Q
return
�� 
;
�� 
}
�� 
if
�� 
(
�� #
acceptTypeHeaderValue
�� %
.
��% &
Charset
��& -
.
��- .
HasValue
��. 6
&&
��7 9
!
��: ;!
_supportedEncodings
��; N
.
��N O
TryGetValue
��O Z
(
��Z [#
acceptTypeHeaderValue
��[ p
.
��p q
Charset
��q x
.
��x y
Value
��y ~
,
��~ 
out��� �&
responseStreamEncoding��� �
)��� �
)��� �
{
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :$
Status406NotAcceptable
��: P
;
��P Q
return
�� 
;
�� 
}
�� 
if
�� 
(
�� #
requestStreamEncoding
�� %
==
��& (
null
��) -
)
��- .
{
�� #
requestStreamEncoding
�� %
=
��& '!
_supportedEncodings
��( ;
[
��; <
Encoding
��< D
.
��D E
UTF8
��E I
.
��I J
WebName
��J Q
]
��Q R
;
��R S
}
�� 
if
�� 
(
�� $
responseStreamEncoding
�� &
==
��' )
null
��* .
)
��. /
{
�� $
responseStreamEncoding
�� &
=
��' (!
_supportedEncodings
��) <
[
��< =
Encoding
��= E
.
��E F
UTF8
��F J
.
��J K
WebName
��K R
]
��R S
;
��S T
}
�� 
var
��  
jsonRpcRequestData
�� "
=
��# $
default
��% ,
(
��, -
JsonRpcData
��- 8
<
��8 9
JsonRpcRequest
��9 G
>
��G H
)
��H I
;
��I J
try
�� 
{
�� 
using
�� 
(
�� 
var
�� 
streamReader
�� '
=
��( )
new
��* -
StreamReader
��. :
(
��: ;
context
��; B
.
��B C
Request
��C J
.
��J K
Body
��K O
,
��O P#
requestStreamEncoding
��Q f
,
��f g
false
��h m
,
��m n 
_streamBufferSize��o �
,��� �
true��� �
)��� �
)��� �
{
��  
jsonRpcRequestData
�� &
=
��' (
await
��) .
_serializer
��/ :
.
��: ;)
DeserializeRequestDataAsync
��; V
(
��V W
streamReader
��W c
,
��c d
context
��e l
.
��l m
RequestAborted
��m {
)
��{ |
;
��| }
}
�� 
}
�� 
catch
�� 
(
�� 
JsonException
��  
e
��! "
)
��" #
{
�� 
_logger
�� 
.
�� 
LogDataIsInvalid
�� (
(
��( )
e
��) *
)
��* +
;
��+ ,
var
�� 
jsonRpcResponse
�� #
=
��$ %'
_standardJsonRpcResponses
��& ?
[
��? @
JsonRpcErrorCode
��@ P
.
��P Q
InvalidFormat
��Q ^
]
��^ _
;
��_ `
if
�� 
(
�� 
_environment
��  
.
��  !
IsDevelopment
��! .
(
��. /
)
��/ 0
)
��0 1
{
�� 
jsonRpcResponse
�� #
=
��$ %
new
��& )
JsonRpcResponse
��* 9
(
��9 :
default
��: A
,
��A B
new
��C F
JsonRpcError
��G S
(
��S T
jsonRpcResponse
��T c
.
��c d
Error
��d i
.
��i j
Code
��j n
,
��n o
jsonRpcResponse
��p 
.�� �
Error��� �
.��� �
Message��� �
,��� �
e��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :
Status200OK
��: E
;
��E F
await
�� +
SerializeJsonRpcResponseAsync
�� 3
(
��3 4
context
��4 ;
,
��; <
jsonRpcResponse
��= L
,
��L M$
responseStreamEncoding
��N d
)
��d e
;
��e f
return
�� 
;
�� 
}
�� 
catch
�� 
(
�� +
JsonRpcSerializationException
�� 0
e
��1 2
)
��2 3
{
�� 
_logger
�� 
.
�� 
LogDataIsInvalid
�� (
(
��( )
e
��) *
)
��* +
;
��+ ,
var
�� 
jsonRpcResponse
�� #
=
��$ %'
_standardJsonRpcResponses
��& ?
[
��? @
JsonRpcErrorCode
��@ P
.
��P Q
InvalidOperation
��Q a
]
��a b
;
��b c
if
�� 
(
�� 
_environment
��  
.
��  !
IsDevelopment
��! .
(
��. /
)
��/ 0
)
��0 1
{
�� 
jsonRpcResponse
�� #
=
��$ %
new
��& )
JsonRpcResponse
��* 9
(
��9 :
default
��: A
,
��A B
new
��C F
JsonRpcError
��G S
(
��S T
jsonRpcResponse
��T c
.
��c d
Error
��d i
.
��i j
Code
��j n
,
��n o
jsonRpcResponse
��p 
.�� �
Error��� �
.��� �
Message��� �
,��� �
e��� �
.��� �
ToString��� �
(��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :
Status200OK
��: E
;
��E F
await
�� +
SerializeJsonRpcResponseAsync
�� 3
(
��3 4
context
��4 ;
,
��; <
jsonRpcResponse
��= L
,
��L M$
responseStreamEncoding
��N d
)
��d e
;
��e f
return
�� 
;
�� 
}
�� 
if
�� 
(
�� 
!
��  
jsonRpcRequestData
�� #
.
��# $
IsBatch
��$ +
)
��+ ,
{
�� 
var
��  
jsonRpcRequestItem
�� &
=
��' ( 
jsonRpcRequestData
��) ;
.
��; <
Item
��< @
;
��@ A
_logger
�� 
.
�� 
LogDataIsMessage
�� (
(
��( )
)
��) *
;
��* +
context
�� 
.
�� 
RequestAborted
�� &
.
��& '*
ThrowIfCancellationRequested
��' C
(
��C D
)
��D E
;
��E F
var
�� 
jsonRpcResponse
�� #
=
��$ %
await
��& +(
CreateJsonRpcResponseAsync
��, F
(
��F G 
jsonRpcRequestItem
��G Y
,
��Y Z
$num
��[ \
)
��\ ]
;
��] ^
if
�� 
(
�� 
jsonRpcResponse
�� #
==
��$ &
null
��' +
)
��+ ,
{
�� 
context
�� 
.
�� 
Response
�� $
.
��$ %

StatusCode
��% /
=
��0 1
StatusCodes
��2 =
.
��= > 
Status204NoContent
��> P
;
��P Q
return
�� 
;
�� 
}
�� 
if
�� 
(
��  
jsonRpcRequestItem
�� &
.
��& '
IsValid
��' .
&&
��/ 1 
jsonRpcRequestItem
��2 D
.
��D E
Message
��E L
.
��L M
IsNotification
��M [
)
��[ \
{
�� 
context
�� 
.
�� 
Response
�� $
.
��$ %

StatusCode
��% /
=
��0 1
StatusCodes
��2 =
.
��= > 
Status204NoContent
��> P
;
��P Q
return
�� 
;
�� 
}
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :
Status200OK
��: E
;
��E F
await
�� +
SerializeJsonRpcResponseAsync
�� 3
(
��3 4
context
��4 ;
,
��; <
jsonRpcResponse
��= L
,
��L M$
responseStreamEncoding
��N d
)
��d e
;
��e f
}
�� 
else
�� 
{
�� 
var
�� !
jsonRpcRequestItems
�� '
=
��( ) 
jsonRpcRequestData
��* <
.
��< =
Items
��= B
;
��B C
_logger
�� 
.
�� 
LogDataIsBatch
�� &
(
��& '!
jsonRpcRequestItems
��' :
.
��: ;
Count
��; @
)
��@ A
;
��A B
var
�� '
jsonRpcRequestIdentifiers
�� -
=
��. /
new
��0 3
HashSet
��4 ;
<
��; <
	JsonRpcId
��< E
>
��E F
(
��F G
)
��G H
;
��H I
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
��  !
<
��" #!
jsonRpcRequestItems
��$ 7
.
��7 8
Count
��8 =
;
��= >
i
��? @
++
��@ B
)
��B C
{
�� 
var
��  
jsonRpcRequestItem
�� *
=
��+ ,!
jsonRpcRequestItems
��- @
[
��@ A
i
��A B
]
��B C
;
��C D
if
�� 
(
��  
jsonRpcRequestItem
�� *
.
��* +
IsValid
��+ 2
&&
��3 5
!
��6 7 
jsonRpcRequestItem
��7 I
.
��I J
Message
��J Q
.
��Q R
IsNotification
��R `
)
��` a
{
�� 
if
�� 
(
�� 
!
�� '
jsonRpcRequestIdentifiers
�� 6
.
��6 7
Add
��7 :
(
��: ; 
jsonRpcRequestItem
��; M
.
��M N
Message
��N U
.
��U V
Id
��V X
)
��X Y
)
��Y Z
{
�� 
_logger
�� #
.
��# $-
LogBatchHasDuplicateIdentifiers
��$ C
(
��C D
)
��D E
;
��E F
var
�� 
jsonRpcResponse
��  /
=
��0 1'
_standardJsonRpcResponses
��2 K
[
��K L%
JsonRpcHandlerErrorCode
��L c
.
��c d+
BatchHasDuplicateIdentifiers��d �
]��� �
;��� �
context
�� #
.
��# $
Response
��$ ,
.
��, -

StatusCode
��- 7
=
��8 9
StatusCodes
��: E
.
��E F
Status200OK
��F Q
;
��Q R
await
�� !+
SerializeJsonRpcResponseAsync
��" ?
(
��? @
context
��@ G
,
��G H
jsonRpcResponse
��I X
,
��X Y$
responseStreamEncoding
��Z p
)
��p q
;
��q r
return
�� "
;
��" #
}
�� 
}
�� 
}
�� 
var
�� 
jsonRpcResponses
�� $
=
��% &
new
��' *
List
��+ /
<
��/ 0
JsonRpcResponse
��0 ?
>
��? @
(
��@ A!
jsonRpcRequestItems
��A T
.
��T U
Count
��U Z
)
��Z [
;
��[ \
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
��  !
<
��" #!
jsonRpcRequestItems
��$ 7
.
��7 8
Count
��8 =
;
��= >
i
��? @
++
��@ B
)
��B C
{
�� 
context
�� 
.
�� 
RequestAborted
�� *
.
��* +*
ThrowIfCancellationRequested
��+ G
(
��G H
)
��H I
;
��I J
var
��  
jsonRpcRequestItem
�� *
=
��+ ,!
jsonRpcRequestItems
��- @
[
��@ A
i
��A B
]
��B C
;
��C D
var
�� 
jsonRpcResponse
�� '
=
��( )
await
��* /(
CreateJsonRpcResponseAsync
��0 J
(
��J K 
jsonRpcRequestItem
��K ]
,
��] ^
i
��_ `
)
��` a
;
��a b
if
�� 
(
�� 
jsonRpcResponse
�� '
!=
��( *
null
��+ /
)
��/ 0
{
�� 
if
�� 
(
��  
jsonRpcRequestItem
�� .
.
��. /
IsValid
��/ 6
&&
��7 9 
jsonRpcRequestItem
��: L
.
��L M
Message
��M T
.
��T U
IsNotification
��U c
)
��c d
{
�� 
continue
�� $
;
��$ %
}
�� 
jsonRpcResponses
�� (
.
��( )
Add
��) ,
(
��, -
jsonRpcResponse
��- <
)
��< =
;
��= >
}
�� 
}
�� 
if
�� 
(
�� 
jsonRpcResponses
�� $
.
��$ %
Count
��% *
==
��+ -
$num
��. /
)
��/ 0
{
�� 
context
�� 
.
�� 
Response
�� $
.
��$ %

StatusCode
��% /
=
��0 1
StatusCodes
��2 =
.
��= > 
Status204NoContent
��> P
;
��P Q
return
�� 
;
�� 
}
�� 
context
�� 
.
�� 
Response
��  
.
��  !

StatusCode
��! +
=
��, -
StatusCodes
��. 9
.
��9 :
Status200OK
��: E
;
��E F
await
�� ,
SerializeJsonRpcResponsesAsync
�� 4
(
��4 5
context
��5 <
,
��< =
jsonRpcResponses
��> N
,
��N O$
responseStreamEncoding
��P f
)
��f g
;
��g h
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� +
SerializeJsonRpcResponseAsync
�� 8
(
��8 9
HttpContext
��9 D
context
��E L
,
��L M
JsonRpcResponse
��N ]
jsonRpcResponse
��^ m
,
��m n
Encoding
��o w
encoding��x �
)��� �
{
�� 	
context
�� 
.
�� 
Response
�� 
.
�� 
ContentType
�� (
=
��) *%
_contentTypeHeaderValue
��+ B
;
��B C
using
�� 
(
�� 
var
�� 
responseStream
�� %
=
��& '
new
��( +
MemoryStream
��, 8
(
��8 9
)
��9 :
)
��: ;
{
�� 
using
�� 
(
�� 
var
�� 
streamWriter
�� '
=
��( )
new
��* -
StreamWriter
��. :
(
��: ;
responseStream
��; I
,
��I J
encoding
��K S
,
��S T
_streamBufferSize
��U f
,
��f g
true
��h l
)
��l m
)
��m n
{
�� 
await
�� 
_serializer
�� %
.
��% &$
SerializeResponseAsync
��& <
(
��< =
jsonRpcResponse
��= L
,
��L M
streamWriter
��N Z
,
��Z [
context
��\ c
.
��c d
RequestAborted
��d r
)
��r s
;
��s t
}
�� 
context
�� 
.
�� 
Response
��  
.
��  !
ContentLength
��! .
=
��/ 0
responseStream
��1 ?
.
��? @
Length
��@ F
;
��F G
responseStream
�� 
.
�� 
Position
�� '
=
��( )
$num
��* +
;
��+ ,
await
�� 
responseStream
�� $
.
��$ %
CopyToAsync
��% 0
(
��0 1
context
��1 8
.
��8 9
Response
��9 A
.
��A B
Body
��B F
)
��F G
;
��G H
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� ,
SerializeJsonRpcResponsesAsync
�� 9
(
��9 :
HttpContext
��: E
context
��F M
,
��M N
IReadOnlyList
��O \
<
��\ ]
JsonRpcResponse
��] l
>
��l m
jsonRpcResponses
��n ~
,
��~ 
Encoding��� �
encoding��� �
)��� �
{
�� 	
context
�� 
.
�� 
Response
�� 
.
�� 
ContentType
�� (
=
��) *%
_contentTypeHeaderValue
��+ B
;
��B C
using
�� 
(
�� 
var
�� 
responseStream
�� %
=
��& '
new
��( +
MemoryStream
��, 8
(
��8 9
)
��9 :
)
��: ;
{
�� 
using
�� 
(
�� 
var
�� 
streamWriter
�� '
=
��( )
new
��* -
StreamWriter
��. :
(
��: ;
responseStream
��; I
,
��I J
encoding
��K S
,
��S T
_streamBufferSize
��U f
,
��f g
true
��h l
)
��l m
)
��m n
{
�� 
await
�� 
_serializer
�� %
.
��% &%
SerializeResponsesAsync
��& =
(
��= >
jsonRpcResponses
��> N
,
��N O
streamWriter
��P \
,
��\ ]
context
��^ e
.
��e f
RequestAborted
��f t
)
��t u
;
��u v
}
�� 
context
�� 
.
�� 
Response
��  
.
��  !
ContentLength
��! .
=
��/ 0
responseStream
��1 ?
.
��? @
Length
��@ F
;
��F G
responseStream
�� 
.
�� 
Position
�� '
=
��( )
$num
��* +
;
��+ ,
await
�� 
responseStream
�� $
.
��$ %
CopyToAsync
��% 0
(
��0 1
context
��1 8
.
��8 9
Response
��9 A
.
��A B
Body
��B F
)
��F G
;
��G H
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
JsonRpcResponse
�� *
>
��* +(
CreateJsonRpcResponseAsync
��, F
(
��F G 
JsonRpcMessageInfo
��G Y
<
��Y Z
JsonRpcRequest
��Z h
>
��h i
requestInfo
��j u
,
��u v
int
��w z
index��{ �
)��� �
{
�� 	
if
�� 
(
�� 
!
�� 
requestInfo
�� 
.
�� 
IsValid
�� $
)
��$ %
{
�� 
var
�� 
	exception
�� 
=
�� 
requestInfo
��  +
.
��+ ,
	Exception
��, 5
;
��5 6
_logger
�� 
.
�� !
LogRequestIsInvalid
�� +
(
��+ ,
index
��, 1
,
��1 2
	exception
��3 <
)
��< =
;
��= >
var
�� 
jsonRpcError
��  
=
��! "$
_standardJsonRpcErrors
��# 9
[
��9 :
	exception
��: C
.
��C D
	ErrorCode
��D M
]
��M N
;
��N O
if
�� 
(
�� 
_environment
��  
.
��  !
IsDevelopment
��! .
(
��. /
)
��/ 0
)
��0 1
{
�� 
jsonRpcError
��  
=
��! "
new
��# &
JsonRpcError
��' 3
(
��3 4
jsonRpcError
��4 @
.
��@ A
Code
��A E
,
��E F
jsonRpcError
��G S
.
��S T
Message
��T [
,
��[ \
	exception
��] f
.
��f g
ToString
��g o
(
��o p
)
��p q
)
��q r
;
��r s
}
�� 
return
�� 
new
�� 
JsonRpcResponse
�� *
(
��* +
	exception
��+ 4
.
��4 5
	MessageId
��5 >
,
��> ?
jsonRpcError
��@ L
)
��L M
;
��M N
}
�� 
var
�� 
request
�� 
=
�� 
requestInfo
�� %
.
��% &
Message
��& -
;
��- .
var
�� 
	requestId
�� 
=
�� 
request
�� #
.
��# $
Id
��$ &
;
��& '
var
�� 
response
�� 
=
�� 
await
��  
_handler
��! )
.
��) *
HandleAsync
��* 5
(
��5 6
request
��6 =
)
��= >
;
��> ?
if
�� 
(
�� 
response
�� 
!=
�� 
null
��  
)
��  !
{
�� 
var
�� 

responseId
�� 
=
��  
response
��! )
.
��) *
Id
��* ,
;
��, -
if
�� 
(
�� 
	requestId
�� 
!=
��  

responseId
��! +
)
��+ ,
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 7
(
��7 8
Strings
��8 ?
.
��? @
	GetString
��@ I
(
��I J
$str
��J g
)
��g h
)
��h i
;
��i j
}
�� 
if
�� 
(
�� 
!
�� 
response
�� 
.
�� 
Success
�� %
)
��% &
{
�� 
if
�� 
(
�� !
IsReservedErrorCode
�� +
(
��+ ,
response
��, 4
.
��4 5
Error
��5 :
.
��: ;
Code
��; ?
)
��? @
)
��@ A
{
�� 
throw
�� 
new
�� !'
InvalidOperationException
��" ;
(
��; <
Strings
��< C
.
��C D
	GetString
��D M
(
��M N
$str
��N j
)
��j k
)
��k l
;
��l m
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
request
�� 
.
�� 
IsNotification
�� +
)
��+ ,
{
�� 
if
�� 
(
�� 
response
��  
.
��  !
Success
��! (
)
��( )
{
�� 
_logger
�� 
.
��  5
'LogHandledRequestWithResultSuccessfully
��  G
(
��G H
index
��H M
)
��M N
;
��N O
}
�� 
else
�� 
{
�� 
_logger
�� 
.
��  4
&LogHandledRequestWithErrorSuccessfully
��  F
(
��F G
response
��G O
.
��O P
Error
��P U
.
��U V
Code
��V Z
,
��Z [
index
��\ a
)
��a b
;
��b c
}
�� 
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
response
��  
.
��  !
Success
��! (
)
��( )
{
�� 
_logger
�� 
.
��  7
)LogHandledRequestWithResultAsNotification
��  I
(
��I J
index
��J O
)
��O P
;
��P Q
}
�� 
else
�� 
{
�� 
_logger
�� 
.
��  6
(LogHandledRequestWithErrorAsNotification
��  H
(
��H I
response
��I Q
.
��Q R
Error
��R W
.
��W X
Code
��X \
,
��\ ]
index
��^ c
)
��c d
;
��d e
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
request
�� 
.
�� 
IsNotification
�� *
)
��* +
{
�� 
_logger
�� 
.
�� 0
"LogHandledNotificationSuccessfully
�� >
(
��> ?
index
��? D
)
��D E
;
��E F
}
�� 
else
�� 
{
�� 
_logger
�� 
.
�� -
LogHandledNotificationAsRequest
�� ;
(
��; <
index
��< A
)
��A B
;
��B C
}
�� 
}
�� 
return
�� 
response
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
Dispose
�� 
(
�� 
)
�� 
{
�� 	
(
�� 
_handler
�� 
as
�� 
IDisposable
�� $
)
��$ %
?
��% &
.
��& '
Dispose
��' .
(
��. /
)
��/ 0
;
��0 1
}
�� 	
}
�� 
}�� �
RD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcOptions.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
public 

sealed 
class 
JsonRpcOptions &
{		 
public 
JsonRpcOptions 
( 
) 
{ 	
} 	
public 
JsonSerializer 
JsonSerializer ,
{ 	
get 
; 
set 
; 
} 	
} 
} �	
YD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcRouteAttribute.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Class

% *
)

* +
]

+ ,
public 

sealed 
class !
JsonRpcRouteAttribute -
:. /
	Attribute0 9
{ 
public !
JsonRpcRouteAttribute $
($ %
string% +
path, 0
)0 1
{ 	
if 
( 
path 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
path7 ;
); <
)< =
;= >
} 
Path 
= 
new 

PathString !
(! "
path" &
)& '
;' (
} 	
internal 

PathString 
Path  
{ 	
get 
; 
} 	
} 
} �
[D:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcServiceException.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
public

 

class

 #
JsonRpcServiceException

 (
:

) *
JsonRpcException

+ ;
{ 
internal #
JsonRpcServiceException (
(( )
)) *
: 
base 
( 
) 
{ 	
} 	
internal #
JsonRpcServiceException (
(( )
string) /
message0 7
)7 8
: 
base 
( 
message 
) 
{ 	
} 	
internal #
JsonRpcServiceException (
(( )
string) /
message0 7
,7 8
	Exception9 B
innerExceptionC Q
)Q R
: 
base 
( 
message 
, 
innerException *
)* +
{ 	
} 	
public #
JsonRpcServiceException &
(& '
long' +
code, 0
,0 1
string2 8
message9 @
)@ A
:   
base   
(   
message   
)   
{!! 	
if"" 
("" 
message"" 
=="" 
null"" 
)""  
{## 
throw$$ 
new$$ !
ArgumentNullException$$ /
($$/ 0
nameof$$0 6
($$6 7
message$$7 >
)$$> ?
)$$? @
;$$@ A
}%% 
Code'' 
='' 
code'' 
;'' 
}(( 	
public// #
JsonRpcServiceException// &
(//& '
long//' +
code//, 0
,//0 1
string//2 8
message//9 @
,//@ A
object//B H
data//I M
)//M N
:00 
base00 
(00 
message00 
)00 
{11 	
if22 
(22 
message22 
==22 
null22 
)22  
{33 
throw44 
new44 !
ArgumentNullException44 /
(44/ 0
nameof440 6
(446 7
message447 >
)44> ?
)44? @
;44@ A
}55 
Code77 
=77 
code77 
;77 
	ErrorData88 
=88 
data88 
;88 
HasErrorData99 
=99 
true99 
;99  
}:: 	
public== 
long== 
Code== 
{>> 	
get?? 
;?? 
}@@ 	
publicCC 
objectCC 
	ErrorDataCC 
{DD 	
getEE 
;EE 
}FF 	
publicII 
boolII 
HasErrorDataII  
{JJ 	
getKK 
;KK 
}LL 	
}MM 
}NN ��
[D:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcServiceHandler`1.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
public 

sealed 
class !
JsonRpcServiceHandler -
<- .
T. /
>/ 0
:1 2
IJsonRpcHandler3 B
,B C
IDisposableD O
where 
T 
: 
class 
, 
IJsonRpcService (
{ 
private 
static 
readonly 

Dictionary  *
<* +
string+ 1
,1 2
JsonRpcMethodInfo3 D
>D E
	_metadataF O
;O P
private 
static 
readonly 

Dictionary  *
<* +
string+ 1
,1 2"
JsonRpcRequestContract3 I
>I J

_contractsK U
;U V
private 
readonly 
T 
_service #
;# $
static !
JsonRpcServiceHandler $
($ %
)% &
{ 	
var   
	blueprint   
=   
new   

Dictionary    *
<  * +
string  + 1
,  1 2
(  3 4"
JsonRpcRequestContract  4 J
Contract  K S
,  S T
JsonRpcMethodInfo  U f

MethodInfo  g q
)  q r
>  r s
(  s t
StringComparer	  t �
.
  � �
Ordinal
  � �
)
  � �
;
  � �
FindContracts"" 
("" 
	blueprint"" #
,""# $
typeof""% +
(""+ ,
T"", -
)""- .
)"". /
;""/ 0
var$$ 
metadata$$ 
=$$ 
new$$ 

Dictionary$$ )
<$$) *
string$$* 0
,$$0 1
JsonRpcMethodInfo$$2 C
>$$C D
($$D E
	blueprint$$E N
.$$N O
Count$$O T
,$$T U
StringComparer$$V d
.$$d e
Ordinal$$e l
)$$l m
;$$m n
var%% 
	contracts%% 
=%% 
new%% 

Dictionary%%  *
<%%* +
string%%+ 1
,%%1 2"
JsonRpcRequestContract%%3 I
>%%I J
(%%J K
	blueprint%%K T
.%%T U
Count%%U Z
,%%Z [
StringComparer%%\ j
.%%j k
Ordinal%%k r
)%%r s
;%%s t
foreach'' 
('' 
var'' 
kvp'' 
in'' 
	blueprint''  )
)'') *
{(( 
metadata)) 
[)) 
kvp)) 
.)) 
Key))  
]))  !
=))" #
kvp))$ '
.))' (
Value))( -
.))- .

MethodInfo)). 8
;))8 9
	contracts** 
[** 
kvp** 
.** 
Key** !
]**! "
=**# $
kvp**% (
.**( )
Value**) .
.**. /
Contract**/ 7
;**7 8
}++ 
	_metadata-- 
=-- 
metadata--  
;--  !

_contracts.. 
=.. 
	contracts.. "
;.." #
}// 	
public44 !
JsonRpcServiceHandler44 $
(44$ %
IServiceProvider44% 5
serviceProvider446 E
)44E F
{55 	
if66 
(66 
serviceProvider66 
==66  "
null66# '
)66' (
{77 
throw88 
new88 !
ArgumentNullException88 /
(88/ 0
nameof880 6
(886 7
serviceProvider887 F
)88F G
)88G H
;88H I
}99 
_service;; 
=;; 
serviceProvider;; &
.;;& '

GetService;;' 1
<;;1 2
T;;2 3
>;;3 4
(;;4 5
);;5 6
??;;7 9
ActivatorUtilities;;: L
.;;L M
CreateInstance;;M [
<;;[ \
T;;\ ]
>;;] ^
(;;^ _
serviceProvider;;_ n
);;n o
;;;o p
}<< 	
private>> 
static>> 
void>> 
FindContracts>> )
(>>) *

Dictionary>>* 4
<>>4 5
string>>5 ;
,>>; <
(>>= >"
JsonRpcRequestContract>>> T
,>>T U
JsonRpcMethodInfo>>V g
)>>g h
>>>h i
	blueprint>>j s
,>>s t
Type>>u y
type>>z ~
)>>~ 
{?? 	
if@@ 
(@@ 
type@@ 
==@@ 
null@@ 
)@@ 
{AA 
returnBB 
;BB 
}CC 
FindContractsEE 
(EE 
	blueprintEE #
,EE# $
typeEE% )
.EE) *

GetMethodsEE* 4
(EE4 5
BindingFlagsEE5 A
.EEA B
InstanceEEB J
|EEK L
BindingFlagsEEM Y
.EEY Z
PublicEEZ `
)EE` a
)EEa b
;EEb c
FindContractsFF 
(FF 
	blueprintFF #
,FF# $
typeFF% )
.FF) *
BaseTypeFF* 2
)FF2 3
;FF3 4
varHH 
interfaceTypesHH 
=HH  
typeHH! %
.HH% &
GetInterfacesHH& 3
(HH3 4
)HH4 5
;HH5 6
forJJ 
(JJ 
varJJ 
iJJ 
=JJ 
$numJJ 
;JJ 
iJJ 
<JJ 
interfaceTypesJJ  .
.JJ. /
LengthJJ/ 5
;JJ5 6
iJJ7 8
++JJ8 :
)JJ: ;
{KK 
FindContractsLL 
(LL 
	blueprintLL '
,LL' (
interfaceTypesLL) 7
[LL7 8
iLL8 9
]LL9 :
)LL: ;
;LL; <
}MM 
}NN 	
privatePP 
staticPP 
voidPP 
FindContractsPP )
(PP) *

DictionaryPP* 4
<PP4 5
stringPP5 ;
,PP; <
(PP= >"
JsonRpcRequestContractPP> T
,PPT U
JsonRpcMethodInfoPPV g
)PPg h
>PPh i
	blueprintPPj s
,PPs t
IEnumerable	PPu �
<
PP� �

MethodInfo
PP� �
>
PP� �
methods
PP� �
)
PP� �
{QQ 	
foreachRR 
(RR 
varRR 
methodRR 
inRR  "
methodsRR# *
)RR* +
{SS 
varTT 
	attributeTT 
=TT 
methodTT  &
.TT& '
GetCustomAttributeTT' 9
<TT9 :"
JsonRpcMethodAttributeTT: P
>TTP Q
(TTQ R
)TTR S
;TTS T
ifVV 
(VV 
	attributeVV 
==VV  
nullVV! %
)VV% &
{WW 
continueXX 
;XX 
}YY 
ifZZ 
(ZZ 
!ZZ 
(ZZ 
methodZZ 
.ZZ 

ReturnTypeZZ '
==ZZ( *
typeofZZ+ 1
(ZZ1 2
TaskZZ2 6
)ZZ6 7
)ZZ7 8
&&ZZ9 ;
!ZZ< =
(ZZ= >
methodZZ> D
.ZZD E

ReturnTypeZZE O
.ZZO P
IsGenericTypeZZP ]
&&ZZ^ `
(ZZa b
methodZZb h
.ZZh i

ReturnTypeZZi s
.ZZs t%
GetGenericTypeDefinition	ZZt �
(
ZZ� �
)
ZZ� �
==
ZZ� �
typeof
ZZ� �
(
ZZ� �
Task
ZZ� �
<
ZZ� �
>
ZZ� �
)
ZZ� �
)
ZZ� �
)
ZZ� �
)
ZZ� �
{[[ 
throw\\ 
new\\ %
InvalidOperationException\\ 7
(\\7 8
string\\8 >
.\\> ?
Format\\? E
(\\E F
CultureInfo\\F Q
.\\Q R
CurrentCulture\\R `
,\\` a
Strings\\b i
.\\i j
	GetString\\j s
(\\s t
$str	\\t �
)
\\� �
,
\\� �
method
\\� �
.
\\� �
Name
\\� �
,
\\� �
typeof
\\� �
(
\\� �
T
\\� �
)
\\� �
)
\\� �
)
\\� �
;
\\� �
}]] 
if^^ 
(^^ 
	blueprint^^ 
.^^ 
ContainsKey^^ )
(^^) *
	attribute^^* 3
.^^3 4

MethodName^^4 >
)^^> ?
)^^? @
{__ 
throw`` 
new`` %
InvalidOperationException`` 7
(``7 8
string``8 >
.``> ?
Format``? E
(``E F
CultureInfo``F Q
.``Q R
CurrentCulture``R `
,``` a
Strings``b i
.``i j
	GetString``j s
(``s t
$str	``t �
)
``� �
,
``� �
typeof
``� �
(
``� �
T
``� �
)
``� �
,
``� �
	attribute
``� �
.
``� �

MethodName
``� �
)
``� �
)
``� �
;
``� �
}aa 
varcc 
contractcc 
=cc 
defaultcc &
(cc& '"
JsonRpcRequestContractcc' =
)cc= >
;cc> ?
vardd 

methodInfodd 
=dd  
defaultdd! (
(dd( )
JsonRpcMethodInfodd) :
)dd: ;
;dd; <
varee 

parametersee 
=ee  
methodee! '
.ee' (
GetParametersee( 5
(ee5 6
)ee6 7
;ee7 8
switchgg 
(gg 
	attributegg !
.gg! "
ParametersTypegg" 0
)gg0 1
{hh 
caseii !
JsonRpcParametersTypeii .
.ii. /

ByPositionii/ 9
:ii9 :
{jj 
varkk 
parameterPositionskk  2
=kk3 4
	attributekk5 >
.kk> ?
ParameterPositionskk? Q
;kkQ R
ifmm 
(mm  
parameterPositionsmm  2
.mm2 3
Lengthmm3 9
!=mm: <

parametersmm= G
.mmG H
LengthmmH N
)mmN O
{nn 
throwoo  %
newoo& )%
InvalidOperationExceptionoo* C
(ooC D
stringooD J
.ooJ K
FormatooK Q
(ooQ R
CultureInfoooR ]
.oo] ^
CurrentCultureoo^ l
,ool m
Stringsoon u
.oou v
	GetStringoov 
(	oo �
$str
oo� �
)
oo� �
,
oo� �
method
oo� �
.
oo� �
Name
oo� �
,
oo� �
typeof
oo� �
(
oo� �
T
oo� �
)
oo� �
)
oo� �
)
oo� �
;
oo� �
}pp 
forrr 
(rr  !
varrr! $
irr% &
=rr' (
$numrr) *
;rr* +
irr, -
<rr. /
parameterPositionsrr0 B
.rrB C
LengthrrC I
;rrI J
irrK L
++rrL N
)rrN O
{ss 
iftt  "
(tt# $
!tt$ %
parameterPositionstt% 7
.tt7 8
Containstt8 @
(tt@ A
ittA B
)ttB C
)ttC D
{uu  !
throwvv$ )
newvv* -%
InvalidOperationExceptionvv. G
(vvG H
stringvvH N
.vvN O
FormatvvO U
(vvU V
CultureInfovvV a
.vva b
CurrentCulturevvb p
,vvp q
Stringsvvr y
.vvy z
	GetString	vvz �
(
vv� �
$str
vv� �
)
vv� �
,
vv� �
method
vv� �
.
vv� �
Name
vv� �
,
vv� �
typeof
vv� �
(
vv� �
T
vv� �
)
vv� �
)
vv� �
)
vv� �
;
vv� �
}ww  !
}xx 
varzz 
contractParameterszz  2
=zz3 4
newzz5 8
Typezz9 =
[zz= >

parameterszz> H
.zzH I
LengthzzI O
]zzO P
;zzP Q
for|| 
(||  !
var||! $
i||% &
=||' (
$num||) *
;||* +
i||, -
<||. /

parameters||0 :
.||: ;
Length||; A
;||A B
i||C D
++||D F
)||F G
{}} 
contractParameters~~  2
[~~2 3
parameterPositions~~3 E
[~~E F
i~~F G
]~~G H
]~~H I
=~~J K

parameters~~L V
[~~V W
i~~W X
]~~X Y
.~~Y Z
ParameterType~~Z g
;~~g h
} 
contract
�� $
=
��% &
new
��' *$
JsonRpcRequestContract
��+ A
(
��A B 
contractParameters
��B T
)
��T U
;
��U V

methodInfo
�� &
=
��' (
new
��) ,
JsonRpcMethodInfo
��- >
(
��> ?
method
��? E
,
��E F 
parameterPositions
��G Y
)
��Y Z
;
��Z [
}
�� 
break
�� 
;
�� 
case
�� #
JsonRpcParametersType
�� .
.
��. /
ByName
��/ 5
:
��5 6
{
�� 
var
�� 
parameterNames
��  .
=
��/ 0
	attribute
��1 :
.
��: ;
ParameterNames
��; I
;
��I J
if
�� 
(
��  
parameterNames
��  .
.
��. /
Length
��/ 5
!=
��6 8

parameters
��9 C
.
��C D
Length
��D J
)
��J K
{
�� 
throw
��  %
new
��& )'
InvalidOperationException
��* C
(
��C D
string
��D J
.
��J K
Format
��K Q
(
��Q R
CultureInfo
��R ]
.
��] ^
CurrentCulture
��^ l
,
��l m
Strings
��n u
.
��u v
	GetString
��v 
(�� �
$str��� �
)��� �
,��� �
method��� �
.��� �
Name��� �
,��� �
typeof��� �
(��� �
T��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
if
�� 
(
��  
parameterNames
��  .
.
��. /
Length
��/ 5
!=
��6 8
parameterNames
��9 G
.
��G H
Distinct
��H P
(
��P Q
StringComparer
��Q _
.
��_ `
Ordinal
��` g
)
��g h
.
��h i
Count
��i n
(
��n o
)
��o p
)
��p q
{
�� 
throw
��  %
new
��& )'
InvalidOperationException
��* C
(
��C D
string
��D J
.
��J K
Format
��K Q
(
��Q R
CultureInfo
��R ]
.
��] ^
CurrentCulture
��^ l
,
��l m
Strings
��n u
.
��u v
	GetString
��v 
(�� �
$str��� �
)��� �
,��� �
method��� �
.��� �
Name��� �
,��� �
typeof��� �
(��� �
T��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
var
��  
contractParameters
��  2
=
��3 4
new
��5 8

Dictionary
��9 C
<
��C D
string
��D J
,
��J K
Type
��L P
>
��P Q
(
��Q R

parameters
��R \
.
��\ ]
Length
��] c
,
��c d
StringComparer
��e s
.
��s t
Ordinal
��t {
)
��{ |
;
��| }
var
�� "
methodParameterNames
��  4
=
��5 6
new
��7 :
string
��; A
[
��A B

parameters
��B L
.
��L M
Length
��M S
]
��S T
;
��T U
for
�� 
(
��  !
var
��! $
i
��% &
=
��' (
$num
��) *
;
��* +
i
��, -
<
��. /

parameters
��0 :
.
��: ;
Length
��; A
;
��A B
i
��C D
++
��D F
)
��F G
{
��  
contractParameters
��  2
[
��2 3
parameterNames
��3 A
[
��A B
i
��B C
]
��C D
]
��D E
=
��F G

parameters
��H R
[
��R S
i
��S T
]
��T U
.
��U V
ParameterType
��V c
;
��c d"
methodParameterNames
��  4
[
��4 5
i
��5 6
]
��6 7
=
��8 9
parameterNames
��: H
[
��H I
i
��I J
]
��J K
;
��K L
}
�� 
contract
�� $
=
��% &
new
��' *$
JsonRpcRequestContract
��+ A
(
��A B 
contractParameters
��B T
)
��T U
;
��U V

methodInfo
�� &
=
��' (
new
��) ,
JsonRpcMethodInfo
��- >
(
��> ?
method
��? E
,
��E F"
methodParameterNames
��G [
)
��[ \
;
��\ ]
}
�� 
break
�� 
;
�� 
default
�� 
:
�� 
{
�� 
if
�� 
(
��  

parameters
��  *
.
��* +
Length
��+ 1
!=
��2 4
$num
��5 6
)
��6 7
{
�� 
throw
��  %
new
��& )'
InvalidOperationException
��* C
(
��C D
string
��D J
.
��J K
Format
��K Q
(
��Q R
CultureInfo
��R ]
.
��] ^
CurrentCulture
��^ l
,
��l m
Strings
��n u
.
��u v
	GetString
��v 
(�� �
$str��� �
)��� �
,��� �
method��� �
.��� �
Name��� �
,��� �
typeof��� �
(��� �
T��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
contract
�� $
=
��% &
new
��' *$
JsonRpcRequestContract
��+ A
(
��A B
)
��B C
;
��C D

methodInfo
�� &
=
��' (
new
��) ,
JsonRpcMethodInfo
��- >
(
��> ?
method
��? E
)
��E F
;
��F G
}
�� 
break
�� 
;
�� 
}
�� 
	blueprint
�� 
[
�� 
	attribute
�� #
.
��# $

MethodName
��$ .
]
��. /
=
��0 1
(
��2 3
contract
��3 ;
,
��; <

methodInfo
��= G
)
��G H
;
��H I
}
�� 
}
�� 	
public
�� !
IReadOnlyDictionary
�� "
<
��" #
string
��# )
,
��) *$
JsonRpcRequestContract
��+ A
>
��A B
GetContracts
��C O
(
��O P
)
��P Q
{
�� 	
return
�� 

_contracts
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
JsonRpcResponse
�� )
>
��) *
HandleAsync
��+ 6
(
��6 7
JsonRpcRequest
��7 E
request
��F M
)
��M N
{
�� 	
if
�� 
(
�� 
request
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
request
��7 >
)
��> ?
)
��? @
;
��@ A
}
�� 
var
�� 
	requestId
�� 
=
�� 
request
�� #
.
��# $
Id
��$ &
;
��& '
var
�� 

methodInfo
�� 
=
�� 
	_metadata
�� &
[
��& '
request
��' .
.
��. /
Method
��/ 5
]
��5 6
;
��6 7
var
�� 
method
�� 
=
�� 

methodInfo
�� #
.
��# $
Method
��$ *
;
��* +
var
�� 

parameters
�� 
=
�� 
method
�� #
.
��# $
GetParameters
��$ 1
(
��1 2
)
��2 3
;
��3 4
var
�� 
parameterValues
�� 
=
��  !
default
��" )
(
��) *
object
��* 0
[
��0 1
]
��1 2
)
��2 3
;
��3 4
switch
�� 
(
�� 
request
�� 
.
�� 
ParametersType
�� *
)
��* +
{
�� 
case
�� #
JsonRpcParametersType
�� *
.
��* +

ByPosition
��+ 5
:
��5 6
{
�� 
parameterValues
�� '
=
��( )
new
��* -
object
��. 4
[
��4 5

parameters
��5 ?
.
��? @
Length
��@ F
]
��F G
;
��G H
for
�� 
(
�� 
var
��  
i
��! "
=
��# $
$num
��% &
;
��& '
i
��( )
<
��* +
parameterValues
��, ;
.
��; <
Length
��< B
;
��B C
i
��D E
++
��E G
)
��G H
{
�� 
parameterValues
�� +
[
��+ ,

methodInfo
��, 6
.
��6 7 
ParameterPositions
��7 I
[
��I J
i
��J K
]
��K L
]
��L M
=
��N O
request
��P W
.
��W X"
ParametersByPosition
��X l
[
��l m
i
��m n
]
��n o
;
��o p
}
�� 
}
�� 
break
�� 
;
�� 
case
�� #
JsonRpcParametersType
�� *
.
��* +
ByName
��+ 1
:
��1 2
{
�� 
parameterValues
�� '
=
��( )
new
��* -
object
��. 4
[
��4 5

parameters
��5 ?
.
��? @
Length
��@ F
]
��F G
;
��G H
for
�� 
(
�� 
var
��  
i
��! "
=
��# $
$num
��% &
;
��& '
i
��( )
<
��* +
parameterValues
��, ;
.
��; <
Length
��< B
;
��B C
i
��D E
++
��E G
)
��G H
{
�� 
if
�� 
(
��  
!
��  !
request
��! (
.
��( )
ParametersByName
��) 9
.
��9 :
TryGetValue
��: E
(
��E F

methodInfo
��F P
.
��P Q
ParameterNames
��Q _
[
��_ `
i
��` a
]
��a b
,
��b c
out
��d g
parameterValues
��h w
[
��w x
i
��x y
]
��y z
)
��z {
)
��{ |
{
�� 
if
��  "
(
��# $

parameters
��$ .
[
��. /
i
��/ 0
]
��0 1
.
��1 2
HasDefaultValue
��2 A
)
��A B
{
��  !
parameterValues
��$ 3
[
��3 4
i
��4 5
]
��5 6
=
��7 8

parameters
��9 C
[
��C D
i
��D E
]
��E F
.
��F G
DefaultValue
��G S
;
��S T
}
��  !
else
��  $
{
��  !
var
��$ '
message
��( /
=
��0 1
string
��2 8
.
��8 9
Format
��9 ?
(
��? @
CultureInfo
��@ K
.
��K L
CurrentCulture
��L Z
,
��Z [
Strings
��\ c
.
��c d
	GetString
��d m
(
��m n
$str��n �
)��� �
,��� �
request��� �
.��� �
Method��� �
,��� �

methodInfo��� �
.��� �
ParameterNames��� �
[��� �
i��� �
]��� �
)��� �
;��� �
return
��$ *
new
��+ .
JsonRpcResponse
��/ >
(
��> ?
	requestId
��? H
,
��H I
new
��J M
JsonRpcError
��N Z
(
��Z [
JsonRpcErrorCode
��[ k
.
��k l
InvalidParameters
��l }
,
��} ~
message�� �
)��� �
)��� �
;��� �
}
��  !
}
�� 
}
�� 
}
�� 
break
�� 
;
�� 
}
�� 
try
�� 
{
�� 
if
�� 
(
�� 
request
�� 
.
�� 
IsNotification
�� *
||
��+ -
!
��. /
method
��/ 5
.
��5 6

ReturnType
��6 @
.
��@ A
IsGenericType
��A N
)
��N O
{
�� 
await
�� 
(
�� 
dynamic
�� "
)
��" #
method
��# )
.
��) *
Invoke
��* 0
(
��0 1
_service
��1 9
,
��9 :
parameterValues
��; J
)
��J K
;
��K L
}
�� 
else
�� 
{
�� 
var
�� 
jsonRpcResult
�� %
=
��& '
await
��( -
(
��. /
dynamic
��/ 6
)
��6 7
method
��7 =
.
��= >
Invoke
��> D
(
��D E
_service
��E M
,
��M N
parameterValues
��O ^
)
��^ _
as
��` b
object
��c i
;
��i j
return
�� 
new
�� 
JsonRpcResponse
�� .
(
��. /
	requestId
��/ 8
,
��8 9
jsonRpcResult
��: G
)
��G H
;
��H I
}
�� 
}
�� 
catch
�� 
(
�� %
JsonRpcServiceException
�� *
e
��+ ,
)
��, -
{
�� 
var
�� 
responseError
�� !
=
��" #
default
��$ +
(
��+ ,
JsonRpcError
��, 8
)
��8 9
;
��9 :
if
�� 
(
�� 
e
�� 
.
�� 
HasErrorData
�� "
)
��" #
{
�� 
responseError
�� !
=
��" #
new
��$ '
JsonRpcError
��( 4
(
��4 5
e
��5 6
.
��6 7
Code
��7 ;
,
��; <
e
��= >
.
��> ?
Message
��? F
,
��F G
e
��H I
.
��I J
	ErrorData
��J S
)
��S T
;
��T U
}
�� 
else
�� 
{
�� 
responseError
�� !
=
��" #
new
��$ '
JsonRpcError
��( 4
(
��4 5
e
��5 6
.
��6 7
Code
��7 ;
,
��; <
e
��= >
.
��> ?
Message
��? F
)
��F G
;
��G H
}
�� 
return
�� 
new
�� 
JsonRpcResponse
�� *
(
��* +
	requestId
��+ 4
,
��4 5
responseError
��6 C
)
��C D
;
��D E
}
�� 
catch
�� 
(
�� '
TargetInvocationException
�� ,
e
��- .
)
��. /
when
�� 
(
�� 
e
�� 
.
�� 
InnerException
�� &
is
��' )%
JsonRpcServiceException
��* A
jrse
��B F
)
��F G
{
�� 
var
�� 
responseError
�� !
=
��" #
default
��$ +
(
��+ ,
JsonRpcError
��, 8
)
��8 9
;
��9 :
if
�� 
(
�� 
jrse
�� 
.
�� 
HasErrorData
�� %
)
��% &
{
�� 
responseError
�� !
=
��" #
new
��$ '
JsonRpcError
��( 4
(
��4 5
jrse
��5 9
.
��9 :
Code
��: >
,
��> ?
jrse
��@ D
.
��D E
Message
��E L
,
��L M
jrse
��N R
.
��R S
	ErrorData
��S \
)
��\ ]
;
��] ^
}
�� 
else
�� 
{
�� 
responseError
�� !
=
��" #
new
��$ '
JsonRpcError
��( 4
(
��4 5
jrse
��5 9
.
��9 :
Code
��: >
,
��> ?
jrse
��@ D
.
��D E
Message
��E L
)
��L M
;
��M N
}
�� 
return
�� 
new
�� 
JsonRpcResponse
�� *
(
��* +
	requestId
��+ 4
,
��4 5
responseError
��6 C
)
��C D
;
��D E
}
�� 
catch
�� 
(
�� '
TargetInvocationException
�� ,
e
��- .
)
��. /
when
�� 
(
�� 
e
�� 
.
�� 
InnerException
�� &
!=
��' )
null
��* .
)
��. /
{
�� #
ExceptionDispatchInfo
�� %
.
��% &
Capture
��& -
(
��- .
e
��. /
.
��/ 0
InnerException
��0 >
)
��> ?
.
��? @
Throw
��@ E
(
��E F
)
��F G
;
��G H
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
Dispose
�� 
(
�� 
)
�� 
{
�� 	
(
�� 
_service
�� 
as
�� 
IDisposable
�� $
)
��$ %
?
��% &
.
��& '
Dispose
��' .
(
��. /
)
��/ 0
;
��0 1
}
�� 	
}
�� 
}�� �i
]D:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\JsonRpcServicesExtensions.cs
	namespace

 	
	Microsoft


 
.

 

Extensions

 
.

 
DependencyInjection

 2
{ 
public 

static 
class %
JsonRpcServicesExtensions 1
{ 
public 
static 
IServiceCollection (
AddJsonRpcHandler) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
,[ \
Type] a
typeb f
)f g
{ 	
if 
( 
services 
== 
null  
)  !
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
services7 ?
)? @
)@ A
;A B
} 
if 
( 
type 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
type7 ;
); <
)< =
;= >
} 
InterfaceAssistant   
<   
IJsonRpcHandler   .
>  . /
.  / 0
VerifyTypeParam  0 ?
(  ? @
type  @ D
,  D E
nameof  F L
(  L M
type  M Q
)  Q R
)  R S
;  S T
var"" 
middlewareType"" 
=""  
typeof""! '
(""' (
JsonRpcMiddleware""( 9
<""9 :
>"": ;
)""; <
.""< =
MakeGenericType""= L
(""L M
type""M Q
)""Q R
;""R S
services$$ 
.$$ 
TryAddScoped$$ !
($$! "
middlewareType$$" 0
,$$0 1
middlewareType$$2 @
)$$@ A
;$$A B
return&& 
services&& 
;&& 
}'' 	
public.. 
static.. 
IServiceCollection.. (
AddJsonRpcHandler..) :
<..: ;
T..; <
>..< =
(..= >
this..> B
IServiceCollection..C U
services..V ^
)..^ _
where// 
T// 
:// 
class// 
,// 
IJsonRpcHandler// ,
{00 	
if11 
(11 
services11 
==11 
null11  
)11  !
{22 
throw33 
new33 !
ArgumentNullException33 /
(33/ 0
nameof330 6
(336 7
services337 ?
)33? @
)33@ A
;33A B
}44 
services66 
.66 
TryAddScoped66 !
<66! "
JsonRpcMiddleware66" 3
<663 4
T664 5
>665 6
,666 7
JsonRpcMiddleware668 I
<66I J
T66J K
>66K L
>66L M
(66M N
)66N O
;66O P
return88 
services88 
;88 
}99 	
public?? 
static?? 
IServiceCollection?? (
AddJsonRpcHandlers??) ;
(??; <
this??< @
IServiceCollection??A S
services??T \
)??\ ]
{@@ 	
ifAA 
(AA 
servicesAA 
==AA 
nullAA  
)AA  !
{BB 
throwCC 
newCC !
ArgumentNullExceptionCC /
(CC/ 0
nameofCC0 6
(CC6 7
servicesCC7 ?
)CC? @
)CC@ A
;CCA B
}DD 
varFF 
typesFF 
=FF 
InterfaceAssistantFF *
<FF* +
IJsonRpcHandlerFF+ :
>FF: ;
.FF; <
GetDefinedTypesFF< K
(FFK L
)FFL M
;FFM N
forHH 
(HH 
varHH 
iHH 
=HH 
$numHH 
;HH 
iHH 
<HH 
typesHH  %
.HH% &
CountHH& +
;HH+ ,
iHH- .
++HH. 0
)HH0 1
{II 
varJJ  
jsonRpcRouteAtributeJJ (
=JJ) *
typesJJ+ 0
[JJ0 1
iJJ1 2
]JJ2 3
.JJ3 4
GetCustomAttributeJJ4 F
<JJF G!
JsonRpcRouteAttributeJJG \
>JJ\ ]
(JJ] ^
)JJ^ _
;JJ_ `
ifLL 
(LL  
jsonRpcRouteAtributeLL (
==LL) +
nullLL, 0
)LL0 1
{MM 
continueNN 
;NN 
}OO 
varQQ 
middlewareTypeQQ "
=QQ# $
typeofQQ% +
(QQ+ ,
JsonRpcMiddlewareQQ, =
<QQ= >
>QQ> ?
)QQ? @
.QQ@ A
MakeGenericTypeQQA P
(QQP Q
typesQQQ V
[QQV W
iQQW X
]QQX Y
)QQY Z
;QQZ [
servicesSS 
.SS 
TryAddScopedSS %
(SS% &
middlewareTypeSS& 4
,SS4 5
middlewareTypeSS6 D
)SSD E
;SSE F
}TT 
returnVV 
servicesVV 
;VV 
}WW 	
public__ 
static__ 
IServiceCollection__ (
AddJsonRpcService__) :
(__: ;
this__; ?
IServiceCollection__@ R
services__S [
,__[ \
Type__] a
type__b f
)__f g
{`` 	
ifaa 
(aa 
servicesaa 
==aa 
nullaa  
)aa  !
{bb 
throwcc 
newcc !
ArgumentNullExceptioncc /
(cc/ 0
nameofcc0 6
(cc6 7
servicescc7 ?
)cc? @
)cc@ A
;ccA B
}dd 
ifee 
(ee 
typeee 
==ee 
nullee 
)ee 
{ff 
throwgg 
newgg !
ArgumentNullExceptiongg /
(gg/ 0
nameofgg0 6
(gg6 7
typegg7 ;
)gg; <
)gg< =
;gg= >
}hh 
InterfaceAssistantjj 
<jj 
IJsonRpcServicejj .
>jj. /
.jj/ 0
VerifyTypeParamjj0 ?
(jj? @
typejj@ D
,jjD E
nameofjjF L
(jjL M
typejjM Q
)jjQ R
)jjR S
;jjS T
varll 
middlewareTypell 
=ll  
typeofll! '
(ll' (
JsonRpcMiddlewarell( 9
<ll9 :
>ll: ;
)ll; <
.ll< =
MakeGenericTypell= L
(llL M
typeofllM S
(llS T!
JsonRpcServiceHandlerllT i
<lli j
>llj k
)llk l
.lll m
MakeGenericTypellm |
(ll| }
type	ll} �
)
ll� �
)
ll� �
;
ll� �
servicesnn 
.nn 
TryAddScopednn !
(nn! "
middlewareTypenn" 0
,nn0 1
middlewareTypenn2 @
)nn@ A
;nnA B
returnpp 
servicespp 
;pp 
}qq 	
publicxx 
staticxx 
IServiceCollectionxx (
AddJsonRpcServicexx) :
<xx: ;
Txx; <
>xx< =
(xx= >
thisxx> B
IServiceCollectionxxC U
servicesxxV ^
)xx^ _
whereyy 
Tyy 
:yy 
classyy 
,yy 
IJsonRpcServiceyy ,
{zz 	
if{{ 
({{ 
services{{ 
=={{ 
null{{  
){{  !
{|| 
throw}} 
new}} !
ArgumentNullException}} /
(}}/ 0
nameof}}0 6
(}}6 7
services}}7 ?
)}}? @
)}}@ A
;}}A B
}~~ 
services
�� 
.
�� 
TryAddScoped
�� !
<
��! "
JsonRpcMiddleware
��" 3
<
��3 4#
JsonRpcServiceHandler
��4 I
<
��I J
T
��J K
>
��K L
>
��L M
,
��M N
JsonRpcMiddleware
��O `
<
��` a#
JsonRpcServiceHandler
��a v
<
��v w
T
��w x
>
��x y
>
��y z
>
��z {
(
��{ |
)
��| }
;
��} ~
return
�� 
services
�� 
;
�� 
}
�� 	
public
�� 
static
��  
IServiceCollection
�� ( 
AddJsonRpcServices
��) ;
(
��; <
this
��< @ 
IServiceCollection
��A S
services
��T \
)
��\ ]
{
�� 	
if
�� 
(
�� 
services
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
services
��7 ?
)
��? @
)
��@ A
;
��A B
}
�� 
var
�� 
types
�� 
=
��  
InterfaceAssistant
�� *
<
��* +
IJsonRpcService
��+ :
>
��: ;
.
��; <
GetDefinedTypes
��< K
(
��K L
)
��L M
;
��M N
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<
�� 
types
��  %
.
��% &
Count
��& +
;
��+ ,
i
��- .
++
��. 0
)
��0 1
{
�� 
var
�� "
jsonRpcRouteAtribute
�� (
=
��) *
types
��+ 0
[
��0 1
i
��1 2
]
��2 3
.
��3 4 
GetCustomAttribute
��4 F
<
��F G#
JsonRpcRouteAttribute
��G \
>
��\ ]
(
��] ^
)
��^ _
;
��_ `
if
�� 
(
�� "
jsonRpcRouteAtribute
�� (
==
��) +
null
��, 0
)
��0 1
{
�� 
continue
�� 
;
�� 
}
�� 
var
�� 
middlewareType
�� "
=
��# $
typeof
��% +
(
��+ ,
JsonRpcMiddleware
��, =
<
��= >
>
��> ?
)
��? @
.
��@ A
MakeGenericType
��A P
(
��P Q
typeof
��Q W
(
��W X#
JsonRpcServiceHandler
��X m
<
��m n
>
��n o
)
��o p
.
��p q
MakeGenericType��q �
(��� �
types��� �
[��� �
i��� �
]��� �
)��� �
)��� �
;��� �
services
�� 
.
�� 
TryAddScoped
�� %
(
��% &
middlewareType
��& 4
,
��4 5
middlewareType
��6 D
)
��D E
;
��E F
}
�� 
return
�� 
services
�� 
;
�� 
}
�� 	
public
�� 
static
��  
IServiceCollection
�� (

AddJsonRpc
��) 3
(
��3 4
this
��4 8 
IServiceCollection
��9 K
services
��L T
)
��T U
{
�� 	
if
�� 
(
�� 
services
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
services
��7 ?
)
��? @
)
��@ A
;
��A B
}
�� 
services
�� 
.
��  
AddJsonRpcHandlers
�� '
(
��' (
)
��( )
;
��) *
services
�� 
.
��  
AddJsonRpcServices
�� '
(
��' (
)
��( )
;
��) *
return
�� 
services
�� 
;
�� 
}
�� 	
public
�� 
static
��  
IServiceCollection
�� (

AddJsonRpc
��) 3
(
��3 4
this
��4 8 
IServiceCollection
��9 K
services
��L T
,
��T U
Action
��V \
<
��\ ]
JsonRpcOptions
��] k
>
��k l
configureOptions
��m }
)
��} ~
{
�� 	
if
�� 
(
�� 
services
�� 
==
�� 
null
��  
)
��  !
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
services
��7 ?
)
��? @
)
��@ A
;
��A B
}
�� 
if
�� 
(
�� 
configureOptions
��  
==
��! #
null
��$ (
)
��( )
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
configureOptions
��7 G
)
��G H
)
��H I
;
��I J
}
�� 
services
�� 
.
�� 
	Configure
�� 
(
�� 
configureOptions
�� /
)
��/ 0
;
��0 1
services
�� 
.
��  
AddJsonRpcHandlers
�� '
(
��' (
)
��( )
;
��) *
services
�� 
.
��  
AddJsonRpcServices
�� '
(
��' (
)
��( )
;
��) *
return
�� 
services
�� 
;
�� 
}
�� 	
}
�� 
}�� �
ND:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\MediaTypes.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
{ 
internal 
static 
class 

MediaTypes $
{ 
public 
const 
string 
ApplicationJson +
=, -
$str. @
;@ A
} 
}		 �

UD:\Workspace\aspnetcore-json-rpc\src\Anemonis.AspNetCore.JsonRpc\Resources\Strings.cs
	namespace 	
Anemonis
 
. 

AspNetCore 
. 
JsonRpc %
.% &
	Resources& /
{ 
internal 
static 
class 
Strings !
{		 
private

 
static

 
readonly

 
ResourceManager

  /
_resourceManager

0 @
=

A B
new 
ResourceManager 
(  
typeof  &
(& '
Strings' .
). /
./ 0
	Namespace0 9
+: ;
$str< ?
+@ A
nameofB H
(H I
StringsI P
)P Q
,Q R
typeofS Y
(Y Z
StringsZ a
)a b
.b c
Assemblyc k
)k l
;l m
public 
static 
string 
	GetString &
(& '
string' -
name. 2
)2 3
{ 	
return 
_resourceManager #
.# $
	GetString$ -
(- .
name. 2
,2 3
CultureInfo4 ?
.? @
CurrentCulture@ N
)N O
;O P
} 	
} 
} 