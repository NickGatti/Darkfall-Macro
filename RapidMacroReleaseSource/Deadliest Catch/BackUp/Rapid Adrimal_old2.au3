WinActivate("Darkfall Online", "")
Global $x, $y, $z, $xstatic1, $distance, $xvarcurrent, $xvarstatic
Call("test")
;HotKeySet("{DEL}", "TellCoords1")
;HotKeySet("{END}", "TellCoords2")
Global $staticdistance = 67000000
Global $Paused
HotKeySet("{Pause}", "TogglePause")

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip('Script is "Paused"', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

While 1
	Call("TellCoords1")
	$delay = TimerInit()
	Do
		$dif = TimerDiff($delay)
		Sleep(100)
		Until $dif >= 2000000
	Send("`")
	Do
		ToolTip("Script is moving " & $distance & " units.", 0, 0)
		Call("tellcoords2")
		Sleep(100)
	Until $distance >= $staticdistance
	Send("s")
	Send("s")
	Send("s")
	Send("s")
	ToolTip('Script is waiting', 0, 0)
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
	$var = StringRight($text, 62)
	$x = StringLeft($var, 9)
	$var = StringRight($text, 52)
	$y = StringLeft($var, 9)
	$var = StringRight($text, 42)
	$z = StringLeft($var, 8)
	$var = StringRight($text, 33)
	$h = StringLeft($var, 6)
	$heading = Int($h)
	$xCurrentLoc = Int($x)
	$yCurrentLoc = Int($y)
EndFunc   ;==>GetCoords

Func TellCoords1()
	Call("getcoords")
	$xvarstatic = Int($x)
EndFunc   ;==>TellCoords1

Func TellCoords2()
	Call("getcoords")
	$xvarcurrent = Int($x)
	$distance = Int($xvarstatic - $xvarcurrent)
	;MsgBox(0, "Distance is ", $distance)
EndFunc   ;==>TellCoords2
