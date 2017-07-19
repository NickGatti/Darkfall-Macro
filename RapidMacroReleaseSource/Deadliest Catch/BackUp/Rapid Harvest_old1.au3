
HotKeySet("{END}", "Test")

While True
WEnd


Func Test()
	;Run("loader.exe")
	Do
		Sleep(100)
	Until WinExists("Darkfall Tools")
	Do
	Sleep(250)
	$text = WinGetText("Darkfall Tools", "")
	$var =  StringLeft($text,13)
	ControlCommand("Darkfall Tools", "", "[Class:SysTabControl32; instance:1]", "TabRight", "")
Until "Debug Console" = $var
$var = StringRight($text,56)
$coords = StringLeft($var,30)
$x = StringLeft($coords,10)
$coords = StringRight($coords,20)
$y = StringLeft($coords,10)
$z = StringRight($coords,10)
EndFunc

Func GetCoords()
		$text = WinGetText("Darkfall Tools", "")
	$var =  StringLeft($text,13)
	$var = StringRight($text,56)
$coords = StringLeft($var,30)
$x = StringLeft($coords,10)
$coords = StringRight($coords,20)
$y = StringLeft($coords,10)
$z = StringRight($coords,10)
