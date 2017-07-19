;WinActivate("Darkfall Online", "")
Global $xParsed, $yParsed, $var, $i
Global $Paused, $arrayLoc, $currentSpot = 2, $totalUsed = 2
Global $currentX, $currentY, $spotX, $spotY, $testX, $testY, $currentDistance, $savedDistance = 0
Global $arrayLoc, $totalUsed, $currentSpot, $xCurrentLoc, $yCurrentLoc, $xParsed, $yParsed
Global $spotNumber = 1
Global $spot[100]
$spot[0] = $currentSpot
$spot[1] = $totalUsed
;init()

HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "SetPathingCoords")
HotKeySet("{END}", "Drive")
;HotKeySet("{HOME}", "getcurrentxy")

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
	$text = WinGetText("Darkfall Tools", "")
	$var = StringRight($text, 62)
	$result = StringInStr($var, ":")
	If $result Then
		$text = StringRight($text, 60)
		$x = StringLeft($text, 10)
		$text = StringRight($text, 50)
		$y = StringLeft($text, 10)
		$text = StringRight($text, 41)
		$z = StringLeft($text, 9)
		$text = StringRight($text, 31)
		$h = StringLeft($text, 4)
	EndIf
	If Not $result Then
		$x = StringLeft($var, 10)
		$var = StringRight($text, 52)
		$y = StringLeft($var, 10)
		$var = StringRight($text, 42)
		$z = StringLeft($var, 8)
		$var = StringRight($text, 33)
		$h = StringLeft($var, 6)
	EndIf
	$heading = Int($h)
	$xCurrentLoc = Int($x)
	$yCurrentLoc = Int($y)
	;MsgBox(0, "heading", "(" & $heading & ")")
	;MsgBox(0, "xCurrent", "(" & $xCurrentLoc & ")")
	;MsgBox(0, "yCurrent", "(" & $yCurrentLoc & ")")
EndFunc   ;==>getCurrentXY

Func setPathingCoords()
	getCurrentXY()
	$totalUsed += 1
	$spot[$totalUsed] = $xCurrentLoc & $yCurrentLoc
	$xParsed = $xCurrentLoc
	$yParsed = $yCurrentLoc
EndFunc   ;==>setPathingCoords

Func drive()
	findNearestCoord()
	parseLoc($spot[$arrayLoc])
		$testXLoc = Abs($xParsed) - Abs($xCurrentLoc)
		$testYLoc = Abs($yParsed) - Abs($yCurrentLoc)
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
	;ToolTip($arrayLoc, 0, 0)
EndFunc   ;==>drive

Func findNearestCoord()
	$runonce = True
	For $i = 3 To $totalUsed
		getCurrentXY()
		parseLoc($spot[$i])
		$testXLoc = Abs($xParsed) - Abs($xCurrentLoc)
		$testYLoc = Abs($yParsed) - Abs($yCurrentLoc)
		$currentDistance = Sqrt(($testXLoc * $testXLoc) + ($testYLoc * $testYLoc))
		If $currentDistance < $savedDistance Or $runonce Then
			$savedDistance = $currentDistance
			$arrayLoc = $i
			$runonce = False
		EndIf
	Next
EndFunc   ;==>findNearestCoord

Func parseLoc($loc)
	$xParsed = StringLeft($loc, 9)
	$var = StringRight($loc, 9)
	$yParsed = StringLeft($var, 9)
EndFunc   ;==>parseLoc