#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Add_Constants=n
#AutoIt3Wrapper_Au3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
MsgBox(0, "Author", "Diminished Hail")
Global $SavedLocationX, $SavedLocationY, $var, $calcang, $directionIamFacing, $directionNeededToFace
Global $Paused, $arrayLoc, $currentSpot = 2, $totalUsed = 2
Global $currentX, $currentY, $spotX, $spotY, $currentDistance, $savedDistance = 0
Global $arrayLoc, $totalUsed, $currentSpot, $xCurrentLoc, $yCurrentLoc, $SavedLocationX, $SavedLocationY, $xStep, $yStep, $testXLoc, $testYLoc
Global $spotNumber = 1
Global $spot[100]
$spot[0] = $currentSpot
$spot[1] = $totalUsed
init()

HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "SetPathingCoords")
HotKeySet("{END}", "Drive")
HotKeySet("{HOME}", "readFile")

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

Func init()
	If Not WinExists("Darkfall Tools") Then
		Local $text, $var
		Run("loader.exe")
		Do
			Sleep(100)
		Until WinExists("Darkfall Tools")
		Do
			$text = WinGetText("Darkfall Tools", "")
			$var = StringLeft($text, 13)
			ControlCommand("Darkfall Tools", "", "[Class:SysTabControl32; instance:1]", "TabRight", "")
		Until "Debug Console" = $var
		WinActivate("Darkfall Online", "")
	EndIf
EndFunc   ;==>init

Func getCurrentXY()
	$text = WinGetText("Darkfall Tools", "")
	$var = StringTrimLeft($text, 62)
	MsgBox(0, "", $var)
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
	$directionIamFacing = Int($h)
	$xCurrentLoc = Int($x)
	$yCurrentLoc = Int($y)
EndFunc   ;==>getCurrentXY

Func setPathingCoords()
	getCurrentXY()
	$totalUsed += 1
	$spot[$totalUsed] = $xCurrentLoc & $yCurrentLoc
	recordToFile()
	$SavedLocationX = $xCurrentLoc
	$SavedLocationY = $yCurrentLoc
EndFunc   ;==>setPathingCoords

Func findFacing($arrayLoc)
	getCurrentXY()
	Dim $directionNeededToFace
	parseLoc($spot[$arrayLoc])
	AoverA($SavedLocationX, $SavedLocationY, $xCurrentLoc, $yCurrentLoc)
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
	If $SavedLocationX < $xCurrentLoc And $SavedLocationY < $yCurrentLoc Then
		$directionNeededToFace = 270 + $absAng
	EndIf
	If $SavedLocationX < $xCurrentLoc And $SavedLocationY > $yCurrentLoc Then
		$directionNeededToFace = 270 - $absAng
	EndIf
	If $SavedLocationX > $xCurrentLoc And $SavedLocationY > $yCurrentLoc Then
		$directionNeededToFace = $absAng
	EndIf
	If $SavedLocationX > $xCurrentLoc And $SavedLocationY < $yCurrentLoc Then
		$directionNeededToFace = $absAng
	EndIf
EndFunc   ;==>findFacing

Func findNearestCoord()
	$runonce = True
	For $i = 3 To $totalUsed
		getCurrentXY()
		parseLoc($spot[$i])
		AoverA($SavedLocationX, $SavedLocationY, $xCurrentLoc, $yCurrentLoc)
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
	AoverA($SavedLocationX, $SavedLocationY, $xCurrentLoc, $yCurrentLoc)
	$currentDistance = Sqrt(($testXLoc * $testXLoc) + ($testYLoc * $testYLoc))
EndFunc   ;==>findDistance

Func parseLoc($loc)
	$SavedLocationX = StringLeft($loc, 9)
	$var = StringRight($loc, 9)
	$SavedLocationY = StringLeft($var, 9)
EndFunc   ;==>parseLoc

Func AoverA($SavedLocationX, $SavedLocationY, $xCurrentLoc, $yCurrentLoc)
	Local $xP, $yP, $xC, $yC, $tX, $tY
	$xP = Abs($SavedLocationX)
	$yP = Abs($SavedLocationY)
	$xC = Abs($xCurrentLoc)
	$yC = Abs($yCurrentLoc)
	$tX = $xP - $xC
	$tY = $yP - $yC
	Dim $testXLoc = ($tX)
	Dim $testYLoc = ($tY)
EndFunc   ;==>AoverA

Func drive()
	While 1
		Send("{w down}")
		For $i = 3 To $totalUsed
			Do
				findFacing($i)
				$directionNeededToFaceLeft = $directionNeededToFace - 12
				$directionNeededToFaceRight = $directionNeededToFace + 12
				findDistance($i)
				If ($directionIamFacing > $directionNeededToFaceLeft And $directionIamFacing < $directionNeededToFaceRight) <> True And $currentDistance > 90000 Then
					facetowaypoint($i)
				EndIf
				ToolTip("Facing", 0, 0)
			Until $currentDistance < 90000
			ToolTip("Complete", 0, 0)
		Next
		Send("{w up}")
	WEnd
EndFunc   ;==>drive

Func facetowaypoint($i)
	Do
		findFacing($i)
		findDistance($i)
		$directionNeededToFaceLeft = $directionNeededToFace - 12
		$directionNeededToFaceRight = $directionNeededToFace + 12
		If $directionNeededToFace < $directionIamFacing Then
			Send("{a up}")
			Send("{d down}")
		ElseIf $directionNeededToFace > $directionIamFacing Then
			Send("{d up}")
			Send("{a down}")
		EndIf
		Sleep(50)
		ToolTip("Not Facing, need to face: " & $directionNeededToFace, 0, 0)
	Until ($directionIamFacing > $directionNeededToFaceLeft And $directionIamFacing < $directionNeededToFaceRight) Or $currentDistance < 90000
	Send("{a up}")
	Send("{d up}")
EndFunc   ;==>facetowaypoint

Func recordToFile()
	IniWrite("RapidAdmiralCoordinates.ini", $totalUsed, "key", $spot[$totalUsed])
EndFunc   ;==>recordToFile

Func readFile()
	For $i = 3 To 100
		$var = IniRead("RapidAdmiralCoordinates.ini", $i, "key", "NotFound")
		If $var = "NotFound" Then ExitLoop
		$spot[$i] = $var
		$totalUsed += 1
	Next
EndFunc   ;==>readFile