WinActivate("Darkfall Online", "")
Global $x, $y, $z, $xdistance, $xvarcurrent, $xvarstatic, $ydistance, $yvarcurrent, $yvarstatic
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{END}", "DifCoords")
Call("test")
;Global $goY1 = , $goX1 =
;Global $goY2 = , $goX2 =


While 1
WEnd

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip('Script is "Paused"', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

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

Func RecordCoords()
	Call("getcoords")
	$xvarstatic = Int($x)
	$yvarstatic = Int($y)
EndFunc   ;==>TellCoords1

Func DifCoords()
	Call("getcoords")
	$xvarcurrent = Int($x)
	$xdistance = Int($xvarstatic - $xvarcurrent)
	$yvarcurrent = Int($y)
	$ydistance = Int($yvarstatic - $yvarcurrent)
	;MsgBox(0, "Distance is ", $distance)
EndFunc   ;==>TellCoords2
