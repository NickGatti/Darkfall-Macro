#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Add_Constants=n
#AutoIt3Wrapper_Au3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global $unsheathe = "^{NumPadDiv}" ;<== Make this your unsheathe key ==>
Global $FPK = "1" ;Pick
Global $SK = "2" ;Staff
Global $MTSK = "3" ;Mana To Stam
Global $result, $x1, $y1, $paused, $Mining, $go = 0, $posA, $posB
Global $SavedLocationX, $SavedLocationY, $var, $i, $calcang, $directionIamFacing, $directionNeededToFace, $directionNeededToFaceAct, $positionX, $positionY
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
HotKeySet("{HOME}", "readfile")

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
	EndIf
	WinWaitActive("Darkfall Online")
	Do
	ToolTip("Script is getting stamina bar position.", 0, 0)
	$result = _ImageSearch("images\stat-selfstam.bmp", 1, $x1, $y1, 30)
	If $result = 1 Then
		$stamx = $x1 + 30
		$stamy = $y1
		$pixVar = PixelGetColor($stamx, $y1)
		$fullstamcolor = $pixVar
		$go = 1
	EndIf
Until $go = 1
EndFunc   ;==>init

Func getCurrentXY()
	$text = WinGetText("Darkfall Tools", "")
	$var = StringTrimLeft($text, 32)
	$left = StringInStr($var, " ")
	$x = StringLeft($var, $left)
	$var = StringTrimLeft($var, $left)
	$left = StringInStr($var, " ")
	$y = StringLeft($var, $left)
	$var = StringTrimLeft($var, $left)
	$left = StringInStr($var, " ")
	$z = StringLeft($var, $left)
	$var = StringTrimLeft($var, $left)
	$left = StringInStr($var, ".")
	$h = StringLeft($var, ($left - 1))
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
		$directionNeededToFace = 90 + $absAng
	EndIf
	If $SavedLocationX < $xCurrentLoc And $SavedLocationY > $yCurrentLoc Then
		$directionNeededToFace = 90 - $absAng
	EndIf
	If $SavedLocationX > $xCurrentLoc And $SavedLocationY > $yCurrentLoc Then
		$directionNeededToFace = 360 - $absAng
	EndIf
	If $SavedLocationX > $xCurrentLoc And $SavedLocationY < $yCurrentLoc Then
		$directionNeededToFace = 180 + $absAng
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
	$left = StringInStr($loc, " ")
	$x = StringLeft($loc, $left)
	$var = StringTrimLeft($loc, $left)
	$left = StringLen($var)
	$y = StringLeft($var, $left)
	$SavedLocationX = Int($x)
	$SavedLocationY = Int($y)
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
		$pos = WinGetClientSize("Darkfall Online")
		$positionX = $pos[0] / 2
		$positionY = $pos[1] / 2
		For $i = 3 To $totalUsed
			Send("{w down}")
			Do
				findFacing($i)
				$directionNeededToFaceAct = $directionIamFacing
				$directionIamFacingLeft = $directionNeededToFaceAct - 8
				$directionIamFacingRight = $directionNeededToFaceAct + 8
				findDistance($i)
				If ($directionNeededToFace > $directionIamFacingLeft And $directionNeededToFace < $directionIamFacingRight) <> True And $currentDistance > 100000 Then
					facetowaypoint($i)
				EndIf
				ToolTip("Facing", 0, 0)
			Until $currentDistance < 100000
			ToolTip("Complete", 0, 0)
		Next
		Send("{w up}")
	WEnd
EndFunc   ;==>drive

Func facetowaypoint($i)
	Send("{w up}")
	Do
		findFacing($i)
		findDistance($i)
		$directionNeededToFaceAct = $directionIamFacing
		$directionIamFacingLeft = $directionNeededToFaceAct - 8
		$directionIamFacingRight = $directionNeededToFaceAct + 8
		If $directionNeededToFace < $directionNeededToFaceAct Then
			$positionX = $positionX + 1
			MouseMove($positionX, $positionY, 0)
		ElseIf $directionNeededToFace > $directionNeededToFaceAct Then
			$positionX = $positionX - 1
			MouseMove($positionX, $positionY, 0)
		EndIf
		Sleep(50)
		ToolTip("Not Facing, need to face: " & $directionNeededToFace, 0, 0)
	Until ($directionNeededToFace > $directionIamFacingLeft And $directionNeededToFace < $directionIamFacingRight) Or $currentDistance < 100000
	Send("{w down}")
EndFunc   ;==>facetowaypoint

Func recordToFile()
	IniWrite("RapidHarvestCoordinates.ini", $totalUsed, "key", $spot[$totalUsed])
EndFunc   ;==>recordToFile

Func readFile()
	For $i = 3 To 100
		$var = IniRead("RapidHarvestCoordinates.ini", $i, "key", "NotFound")
		If $var = "NotFound" Then ExitLoop
		$totalUsed += 1
		$spot[$i] = $var
	Next
EndFunc   ;==>readFile