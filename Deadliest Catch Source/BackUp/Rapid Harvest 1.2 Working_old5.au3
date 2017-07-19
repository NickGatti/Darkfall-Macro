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
Global $result, $x1, $y1, $paused, $Mining, $go = 0, $posA, $posB, $isNode = False
Global $SavedLocationX, $SavedLocationY, $var, $i, $calcang, $directionIamFacing, $directionNeededToFace, $directionNeededToFaceAct, $positionX, $positionY
Global $paused, $arrayLoc, $currentSpot = 2, $totalUsed = 2
Global $currentX, $currentY, $spotX, $spotY, $currentDistance, $savedDistance = 0
Global $arrayLoc, $totalUsed, $currentSpot, $xCurrentLoc, $yCurrentLoc, $SavedLocationX, $SavedLocationY, $xStep, $yStep, $testXLoc, $testYLoc
Global $spotNumber = 1
Global $node[100]
Global $spot[100]
$spot[0] = $currentSpot
$spot[1] = $totalUsed
init()

HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "SetPathingCoords")
HotKeySet("{END}", "Drive")
HotKeySet("{HOME}", "readfile")
HotKeySet("{INS}", "setNode")

While 1
WEnd

Func TogglePause()
	$paused = Not $paused
	While $paused
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

Func setNode()
	getCurrentXY()
	$totalUsed += 1
	$spot[$totalUsed] = $xCurrentLoc & $yCurrentLoc
	recordToFileNode("Y")
	$SavedLocationX = $xCurrentLoc
	$SavedLocationY = $yCurrentLoc
EndFunc   ;==>setNode

Func setPathingCoords()
	getCurrentXY()
	$totalUsed += 1
	$spot[$totalUsed] = $xCurrentLoc & $yCurrentLoc
	recordToFile("")
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
	$isNode = False
	If StringInStr($loc, "Y") Then
		$isNode = True
		StringTrimRight($loc, 1)
	EndIf
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
			If $isNode Then
				hitnode()
			EndIf
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

Func recordToFile($node)
	IniWrite("RapidHarvestCoordinates.ini", $totalUsed, "key", ($spot[$totalUsed] & $node))
EndFunc   ;==>recordToFile

Func readFile()
	For $i = 3 To 100
		$var = IniRead("RapidHarvestCoordinates.ini", $i, "key", "NotFound")
		If $var = "NotFound" Then ExitLoop
		$totalUsed += 1
		$spot[$i] = $var
	Next
EndFunc   ;==>readFile

Func startOnNode()
	$result = _ImageSearch("images\Harvest\descBar.bmp", 1, $x1, $y1, 80)
	If $result Then
		$pos1 = $x1 - 94
		$pos2 = $y1
		$pos3 = $x1 + 94
		$pos4 = $y1 + 26
		$z = 0
		$limit = TimerInit()
		Do
			Send("{left}")
			$coord = PixelSearch($pos1, $pos2, $pos3, $pos4, 11711154)
			If Not @error Then
				$color = PixelGetColor($coord[0], $coord[1])
				If $color = 11711154 Then
					$color = PixelGetColor($coord[0], ($coord[1]));+ $i))
					If $color = 11711154 Then
						$z += 1
					EndIf
				EndIf
			EndIf
			$dif = TimerDiff($limit)
		Until $z = 2 Or $dif > 10000
		If $dif > 10000 Then
			ExitLoop
		Else
			hitnode()
		EndIf
	EndIf
EndFunc   ;==>startOnNode

Func hitnode()
	If Not $result Then
		Call("EquipWeapon", $FPK)
	EndIf
	$result = False
	MouseClick("left")
	Sleep(1000)
	startcast()
	Sleep(1000)
	Waitforcast()
EndFunc   ;==>hitnode

Func startcast()
	$pos = WinGetClientSize("Darkfall Online")
	$posA = ($pos[0] / 2) - 143
	$posB = ($pos[1] / 2) - 53
	$Mining = PixelGetColor($posA, $posB)
EndFunc   ;==>startcast

Func Waitforcast()
	$i = 0
	Do
		$i += 1
		ToolTip("Mining " & $i, 0, 0)
		Do
			Call("getstam")
			$result = _ImageSearch("images/misc-pickicon.bmp", 1, $x1, $y1, 30)
			If Not $result Then
				Call("EquipWeapon", $FPK)
				MouseClick("Left")
			EndIf
			$pos1 = $posA - 2
			$pos2 = $posB - 2
			$pos3 = $posA + 2
			$pos4 = $posB + 2
			$pixVar = PixelSearch($pos1, $pos2, $pos3, $pos4, $Mining, 10)
		Until @error
		For $z = 0 To 30
			Sleep(100)
			$pixVar = PixelSearch($pos1, $pos2, $pos3, $pos4, $Mining, 10)
			If Not @error Then $i = 0
		Next
	Until $i = 3
EndFunc   ;==>Waitforcast

Func EquipWeapon($sendkey)
	Sleep(350)
	Do
		ToolTip('Script is equipping a weapon.', 0, 0)
		$result = _ImageSearch("images/misc-equipped.bmp", 1, $x1, $y1, 30)
		Send($sendkey)
		Sleep(350)
		$result = _ImageSearch("images/misc-equipped.bmp", 1, $x1, $y1, 30)
		Send($unsheathe)
		Sleep(350)
		$result = _ImageSearch("images/misc-equipped.bmp", 1, $x1, $y1, 30)
	Until $result = 0
	Sleep(2000)
EndFunc   ;==>EquipWeapon

Func getstam()
	$pixVar = PixelGetColor($stamx, $stamy)
	If $pixVar <> $fullstamcolor Then
		Sleep(250)
		Send("s")
		Send("s")
		Send("s")
		Send("w")
		Send("w")
		Send("w")
		Send("s")
		Send("s")
		Send("s")
		Send("w")
		Send("w")
		Send("w")
		Sleep(250)
		Call("EquipWeapon", $SK)
		ToolTip("Script is casting mana to stam", 0, 0)
		Send($MTSK)
		Sleep(150)
		MouseClick("left")
		$pass = True
		Sleep(4000)
		MouseClick("left")
		Sleep(1000)
		startcast()
		Call("EquipWeapon", $FPK)
	EndIf
EndFunc   ;==>getstam

Func _ImageSearch($findImage, $resultPosition, ByRef $x, ByRef $y, $tolerance)
	$size = WinGetClientSize("Darkfall Online")
	Return _ImageSearchArea($findImage, $resultPosition, 0, 0, $size[0], $size[1], $x, $y, $tolerance)
EndFunc   ;==>_ImageSearch

Func _ImageSearchArea($findImage, $resultPosition, $x1, $y1, $right, $bottom, ByRef $x, ByRef $y, $tolerance)
	;MsgBox(0,"asd","" & $x1 & " " & $y1 & " " & $right & " " & $bottom)
	If $tolerance > 0 Then $findImage = "*" & $tolerance & " " & $findImage
	$result = DllCall("ImageSearchDLL.dll", "str", "ImageSearch", "int", $x1, "int", $y1, "int", $right, "int", $bottom, "str", $findImage)

	; If error exit
	If $result[0] = "0" Then Return 0

	; Otherwise get the x,y location of the match and the size of the image to
	; compute the centre of search
	$array = StringSplit($result[0], "|")

	$x = Int(Number($array[2]))
	$y = Int(Number($array[3]))
	If $resultPosition = 1 Then
		$x = $x + Int(Number($array[4]) / 2)
		$y = $y + Int(Number($array[5]) / 2)
	EndIf
	Return 1
EndFunc   ;==>_ImageSearchArea