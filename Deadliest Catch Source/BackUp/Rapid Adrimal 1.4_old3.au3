;WinActivate("Darkfall Online", "")
Global $xParsed, $yParsed, $var, $i, $calcang, $heading, $faceDir
Global $Paused, $arrayLoc, $currentSpot = 2, $totalUsed = 2
Global $currentX, $currentY, $spotX, $spotY, $currentDistance, $savedDistance = 0
Global $arrayLoc, $totalUsed, $currentSpot, $xCurrentLoc, $yCurrentLoc, $xParsed, $yParsed, $xStep, $yStep, $testXLoc, $testYLoc
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

Func findFacing($arrayLoc)
	Dim $faceDir
	parseLoc($spot[$arrayLoc])
	AoverA($xParsed, $yParsed, $xCurrentLoc, $yCurrentLoc)
	If $testXLoc > $testYLoc Then
		$hypot = $testXLoc / $testYLoc
	ElseIf $testXLoc < $testYLoc Then
		$hypot = $testYLoc / $testXLoc
	ElseIf $testXLoc = $testYLoc Then
		$hypot = 1
	EndIf
	$pi = 4 * ATan(1)
	$radToDeg = 180 / $pi
	$ang = ATan($hypot) * $radToDeg
	$absAng = Abs($ang)
	If $xParsed < $xCurrentLoc And $yParsed < $yCurrentLoc Then
		$faceDir = 90 + $absAng
	EndIf
	If $xParsed < $xCurrentLoc And $yParsed > $yCurrentLoc Then
		$faceDir = 90 - $absAng
	EndIf
	If $xParsed > $xCurrentLoc And $yParsed > $yCurrentLoc Then
		$faceDir = 360 - $absAng
	EndIf
	If $xParsed > $xCurrentLoc And $yParsed < $yCurrentLoc Then
		$faceDir = 180 + $absAng
	EndIf
EndFunc   ;==>findFacing

Func findNearestCoord()
	$runonce = True
	For $i = 3 To $totalUsed
		getCurrentXY()
		parseLoc($spot[$i])
		AoverA($xParsed, $yParsed, $xCurrentLoc, $yCurrentLoc)
		$currentDistance = Sqrt(($testXLoc * $testXLoc) + ($testYLoc * $testYLoc))
		If $currentDistance < $savedDistance Or $runonce Then
			$savedDistance = $currentDistance
			$arrayLoc = $i
			$runonce = False
		EndIf
	Next
EndFunc   ;==>findNearestCoord

Func findDistance($cur)
	getCurrentXY()
	parseLoc($spot[$cur])
	AoverA($xParsed, $yParsed, $xCurrentLoc, $yCurrentLoc)
	$currentDistance = Sqrt(($testXLoc * $testXLoc) + ($testYLoc * $testYLoc))
EndFunc   ;==>findDistance

Func parseLoc($loc)
	$xParsed = StringLeft($loc, 9)
	$var = StringRight($loc, 9)
	$yParsed = StringLeft($var, 9)
EndFunc   ;==>parseLoc

Func AoverA($xParsed, $yParsed, $xCurrentLoc, $yCurrentLoc)
	Local $xP, $yP, $xC, $yC, $tX, $tY
	$xP = Abs($xParsed)
	$yP = Abs($yParsed)
	$xC = Abs($xCurrentLoc)
	$yC = Abs($yCurrentLoc)
	$tX = $xP - $xC
	$tY = $yP - $yC
	Dim $testXLoc = ($tX)
	Dim $testYLoc = ($tY)
EndFunc   ;==>AoverA

Func drive()
	$pos = WinGetClientSize("Darkfall Online")
	$positionX = $pos[0] / 2
	$positionY = $pos[1] / 2
	For $i = 3 To $totalUsed
		Send("{w down}")
		Do
			findFacing($i)
			findDistance($i)
			getCurrentXY()
			If $heading = 360 Then $heading = 0
			$headingM = $heading - 10
			$headingP = $heading + 10
			Do
				findFacing($i)
				If $heading = 360 Then $heading = 0
				$headingM = $heading - 10
				$headingP = $heading + 10
				$positionX -= 1
				MouseMove($positionX, $positionY, 1)
				Sleep(50)
				ToolTip("Turning to Target", 0, 0)
;### Tidy Error -> "endif" is closing previous "do" on line 164

		Until $headingM <= $faceDir And $headingP >= $faceDir
		ToolTip("Facing Target", 0, 0)
;### Tidy Error -> "until" is closing previous "for" on line 155
	Until $currentDistance < 25000
	Send("{w up}")
;### Tidy Error -> "next" is closing previous "func" on line 151
Next
;### Tidy Error: next line creates a negative tablevel.
;### Tidy Error: next line creates a negative tablevel for the line after it.
EndFunc   ;==>drive