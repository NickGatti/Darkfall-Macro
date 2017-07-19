;WinActivate("Darkfall Online", "")
Global $x, $y, $z, $Paused, $text, $var, $coords, $h, $direction, $heading, $xCurrentLoc, $xSavedLoc, $yCurrentLoc, $ySavedLoc
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{HOME}", "FindLoc")
HotKeySet("{END}", "fuck")
Call("test")
Dim $difarray[5]
$difarray[0] = Exp($xCurrentLoc > 0 And $yCurrentLoc > 0)
$difarray[1] = Exp($xCurrentLoc > 0 And $yCurrentLoc < 0)
$difarray[2] = Exp($xCurrentLoc < 0 And $yCurrentLoc < 0)
$difarray[3] = Exp($xCurrentLoc < 0 And $yCurrentLoc > 0)

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
	$var = StringRight($text, 62)
	$x = StringLeft($var, 9)
	$var = StringRight($text, 52)
	$y = StringLeft($var, 9)
	$var = StringRight($text, 42)
	$z = StringLeft($var, 8)
	$var = StringRight($text, 33)
	$h = StringLeft($var, 3)
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
	;Send("{W down}")
	Do
		Call("getcoords")
		For $i = 0 To 3
			If $difarray[$i] Then
				$xStep = $xSavedLoc - $xCurrentLoc
				$yStep = $ySavedLoc - $yCurrentLoc
				If $xStep > $yStep Then
					$ang = $xStep / $yStep
				ElseIf $xStep < $yStep Then
					$ang = $yStep / $xStep
				ElseIf $xStep = $yStep Then
					$ang = 90
				EndIf
			EndIf
		Next





		$lowx = $xSavedLoc - 10
		$highx = $xSavedLoc + 10
		$lowy = $ySavedLoc - 10
		$highy = $ySavedLoc + 10
	Until ($xCurrentLoc >= $lowx And $xCurrentLoc <= $highx) And ($yCurrentLoc >= $lowy And $yCurrentLoc <= $highy)
	;Send("{W up}")
EndFunc   ;==>FindLoc
