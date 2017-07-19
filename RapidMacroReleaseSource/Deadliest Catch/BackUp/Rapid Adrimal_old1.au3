Global $x, $y, $z, $xstatic1, $distance, $xvarcurrent, $xvarstatic
Call("test")
HotKeySet("{DEL}", "TellCoords1")
HotKeySet("{END}", "TellCoords2")
Global $staticdistance = 67000000

While 1
	Call("TellCoords1")
	Do
		Call("tellcoords2")
		Sleep(100)
		Until $distance >= $staticdistance
WEnd


Func Test()
	Run("loader.exe")
	Do
		Sleep(100)
	Until WinExists("Darkfall Tools")
	Do
		Sleep(250)
		$text = WinGetText("Darkfall Tools", "")
		$var = StringLeft($text, 13)
		ControlCommand("Darkfall Tools", "", "[Class:SysTabControl32; instance:1]", "TabRight", "")
	Until "Debug Console" = $var
EndFunc   ;==>Test

Func GetCoords()
	$text = WinGetText("Darkfall Tools", "")
	$var = StringRight($text, 56)
	$coords = StringLeft($var, 30)
	$x = StringLeft($coords, 10)
	$coords = StringRight($coords, 20)
	$y = StringLeft($coords, 10)
	$z = StringRight($coords, 10)
EndFunc   ;==>GetCoords

Func TellCoords1()
	Call("getcoords")
	$xvarstatic = Int($x)
EndFunc

Func TellCoords2()
	Call("getcoords")
	$xvarcurrent = Int($x)
	$distance = Int($xvarstatic - $xvarcurrent)
	MsgBox(0,"Distance is ", $distance)
EndFunc
