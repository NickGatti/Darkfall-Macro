;WinActivate("Darkfall Online", "")
Global $x, $y, $z, $xdistance, $xvarcurrent, $xvarstatic, $ydistance, $yvarcurrent, $yvarstatic, $headinghigh, $headinglow, $angle, $xgo, $ygo, $heading, $direction
Global $Paused
Global Const $pi = 3.14159265358979
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{HOME}", "FindLoc")
HotKeySet("{END}", "fuck")
Call("test")
Global $difarray[5]
$difarray[0] = $xCurrentLoc > 0 Or $yCurrentLoc > 0
$difarray[1] = $xCurrentLoc > 0 Or $yCurrentLoc < 0
$difarray[2] = $xCurrentLoc < 0 Or $yCurrentLoc < 0
$difarray[3] = $xCurrentLoc < 0 Or $yCurrentLoc > 0

While 1
WEnd

Func fuck()
	MsgBox(0, "", $direction & "      " & $heading)
EndFunc   ;==>fuck

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
	$coords = StringRight($coords, 16)
	$z = StringLeft($coords, 9)
	$h = StringRight($coords, 7)
	$heading = Int($h)
	$xCurrentLoc = Int($x)
	$yCurrentLoc = Int($y)
EndFunc   ;==>GetCoords

Func RecordCoords()
	Call("getcoords")
	$xSavedLoc = Int($x)
	$ySavedLoc = Int($y)
EndFunc   ;==>RecordCoords

Func FindLoc()
	Send("{W down}")
	Do
		Call getcoords()
		For $i = 0 To 4
;### Tidy Error: If/ElseIf statement without a then..
			If $difarray[1] Then
				MsgBox(0,"","sdf")
			EndIf






				$lowx = $xvarstatic - 10
				$highx = $xvarstatic + 10
				$lowy = $yvarstatic - 10
				$highy = $yvarstatic + 10
;### Tidy Error -> "until" is closing previous "if" on line 72
			Until ($xvarcurrent >= $lowx And $xvarcurrent <= $highx) And ($yvarcurrent >= $lowy And $yvarcurrent <= $highy)
			Send("{W up}")
;### Tidy Error -> "endfunc" is closing previous "for" on line 70
		EndFunc   ;==>FindLoc;### Tidy Error -> do is never closed in your script.
;### Tidy Error -> do is never closed in your script.
