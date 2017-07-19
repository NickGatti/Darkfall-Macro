#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global $unsheathe = "^{NumPadDiv}" ;<== Make this your unsheathe key ==>
Global $FPK = "1" ;Sword
Global $SK = "2" ;Staff
Global $MTSK = "3" ;Mana To Stam
Global $result, $x1, $y1, $paused, $Mining, $go = 0
HotKeySet("{Pause}", "TogglePause")
WinActivate("Darkfall Online")
Sleep(1000)
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

While 1
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
WEnd

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
	MsgBox(0, "", "Done")
EndFunc   ;==>hitnode

Func startcast()
	$pos = MouseGetPos()
	$pos[1] = $pos[1] - 65
	$pos[0] = $pos[0] - 149
	$Mining = PixelGetColor($pos[0], $pos[1])
EndFunc   ;==>startcast

Func Waitforcast()

	For $i = 0 To 10
		MouseClick("left")
	Do

		Call("getstam")
		$result = _ImageSearch("images/misc-pickicon.bmp", 1, $x1, $y1, 30)
		If Not $result Then
			Call("EquipWeapon", $FPK)
		EndIf
		Sleep(100)
		$pixVar = PixelGetColor($pos[0], $pos[1])
	Until $pixVar <> $Mining
	Sleep(1000)
Next
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

Func TogglePause()
	$paused = Not $paused
	While $paused
		Sleep(100)
		ToolTip('Script is "Paused"', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

Func defunct()
	If Not $result Then
		Call("EquipWeapon", $FPK)
		Local $nodeTimer, $nodeTimerDif, $i = 0
		$result = _ImageSearch("images/misc-pickicon.bmp", 1, $x1, $y1, 30)
		If Not $result Then
			Call("EquipWeapon", $FPK)
			Sleep(650)
			MouseClick("left")
			startcast()
		EndIf
	EndIf
	$nodeTimer = TimerInit()
	Do
		$nodeTimerDif = TimerDiff($nodeTimer)
		$pos = MouseGetPos()
		$pos[1] = $pos[1] - 64
		$pos[0] = $pos[0] - 149
		$pos1 = $pos[0] - 1
		$pos2 = $pos[1] - 1
		$pos3 = $pos[0] + 1
		$pos4 = $pos[1] + 1
		$pixVar = PixelSearch($pos1, $pos2, $pos3, $pos4, $Mining, 60)
		ToolTip("Script is waiting for node to finish: " & $nodeTimerDif, 0, 0)
	Until $pixVar <> $Mining Or $nodeTimerDif > 11000
	Sleep(500)
	$i = 0
	$nodeTimer = TimerInit()
	Do
		ToolTip("Script is waiting for node to finish: " & $nodeTimerDif, 0, 0)
		$result = _ImageSearch("images/misc-pickicon.bmp", 1, $x1, $y1, 30)
		If Not $result Then
			Call("EquipWeapon", $FPK)
			Sleep(650)
			MouseClick("left")
		EndIf
		$pixVar = PixelSearch($pos1, $pos2, $pos3, $pos4, $Mining, 60)
		If $pixVar <> $Mining Then
			$i += 1
		EndIf
		$nodeTimerDif = TimerDiff($nodeTimer)
		Sleep(100)
	Until $i = 10 Or $nodeTimerDif > 1500
	If $i = 10 Then
		$result = True
		Return ($result)
	ElseIf $nodeTimerDif > 1500 Then
		$result = False
		Return ($result)
	EndIf
EndFunc   ;==>defunct