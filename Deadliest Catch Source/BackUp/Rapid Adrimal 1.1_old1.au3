WinActivate("Darkfall Online", "")
Global $x, $y, $z, $xstatic1, $distance, $xvarcurrent, $xvarstatic
Call("test")
;HotKeySet("{DEL}", "TellCoords1")
;HotKeySet("{END}", "TellCoords2")
Global $Paused
Global $spotnumber = 1
Global $spot[$spotnumber]

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
WEnd

Func init()
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

Func getCurrentXY()
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

Func setPathingCoords()
	_getCurrentXY
EndFunc
