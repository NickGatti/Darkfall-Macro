WinActivate("Darkfall Online", "")
Global $Paused
Global $spotNumber = 1, $spotCurrent = 0
Global $spot[$spotNumber]
$spot[0] = $spotCurrent
_init()

HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "SetPathingCoords")

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
	Local $text, $var
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
EndFunc   ;==>init

Func getCurrentXY()
	Local $text, $var, $x, $y, $z, $h, $heading, $xCurrentLoc, $yCurrentLoc
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
	Return $heading, $xCurrentLoc, $yCurrentLoc
EndFunc   ;==>getCurrentXY

Func setPathingCoords()
	_getCurrentXY()
	$spotnumber += 1
	$spotCurrent += 1
	Global $spot[$spotnumber]
	$spot[0] = $spotCurrent
	$spot[$spotCurrent] = $result[0] &= $result[1] &= $result[2]
EndFunc   ;==>setPathingCoords