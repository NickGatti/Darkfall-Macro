;WinActivate("Darkfall Online", "")
Global $x, $y, $z, $Paused, $text, $var, $coords, $h, $direction, $heading, $xCurrentLoc, $xSavedLoc, $yCurrentLoc, $ySavedLoc, $trueHeading
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{HOME}", "FindLoc")
Call("test")
Dim $difarray[5]
$difarray[0] = $xCurrentLoc > 0 And $yCurrentLoc > 0
$difarray[1] = $xCurrentLoc > 0 And $yCurrentLoc < 0
$difarray[2] = $xCurrentLoc < 0 And $yCurrentLoc < 0
$difarray[3] = $xCurrentLoc < 0 And $yCurrentLoc > 0

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

Func RecordCoords()
	Call("getcoords")
	$xSavedLoc = Int($x)
	$ySavedLoc = Int($y)
EndFunc   ;==>RecordCoords

Func FindLoc()
	While 1
		;Send("{W down}")
		;Do
		Call("getcoords")
		$difarray[0] = $xCurrentLoc > 0 And $yCurrentLoc > 0
		$difarray[1] = $xCurrentLoc > 0 And $yCurrentLoc < 0
		$difarray[2] = $xCurrentLoc < 0 And $yCurrentLoc < 0
		$difarray[3] = $xCurrentLoc < 0 And $yCurrentLoc > 0
		For $i = 0 To 3
			If $difarray[$i] Then
				$xStep = $xSavedLoc - $xCurrentLoc
				$yStep = $ySavedLoc - $yCurrentLoc
				If $xStep < $yStep Then
					$TriVar = $xStep / $yStep
				ElseIf $xStep > $yStep Then
					$TriVar = $yStep / $xStep
				ElseIf $xStep = $yStep Then
					$TriVar = 1
				EndIf
				$pi = 4 * ATan(1)
				$radToDeg = 180 / $pi
				$ang = ATan($TriVar) * $radToDeg
				;ToolTip($ang, 0, 0)
			EndIf
		Next
		If $heading < 360 And $heading > 270 Then $trueHeading = $heading - 270
		If $heading < 270 And $heading > 180 Then $trueHeading = $heading - 180
		If $heading < 180 And $heading > 90 Then $trueHeading = $heading - 90
		ToolTip($trueHeading,0,0)
		$lowx = $xSavedLoc - 10
		$highx = $xSavedLoc + 10
		$lowy = $ySavedLoc - 10
		$highy = $ySavedLoc + 10
		;Until ($xCurrentLoc >= $lowx And $xCurrentLoc <= $highx) And ($yCurrentLoc >= $lowy And $yCurrentLoc <= $highy)
		;Send("{W up}")
	WEnd
EndFunc   ;==>FindLoc
