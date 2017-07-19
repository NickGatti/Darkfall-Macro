#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global $result, $x1, $y1
WinActivate("Darkfall Online")
Sleep(1000)
While 1
	$result = _ImageSearch("images\Harvest\descBar.bmp", 1, $x1, $y1, 80)
	If $result Then
		MsgBox(0,"","sdf")
		$pos1 = $x1 - 94
		$pos2 = $y1
		$pos3 = $x1 + 94
		$pos4 = $y1 + 26
		$z = 0
		Do
			$coord = PixelSearch($pos1, $pos2, $pos3, $pos4, 11711154)
			If Not @error Then
			$color = PixelGetColor($coord[0], $coord[1])
			If $color = 11711154 Then
				;For $i = 1 To 2
				$color = PixelGetColor($coord[0], ($coord[1]));+ $i))
				If $color = 11711154 Then
					MouseMove($coord[0], $coord[1])
					$z += 1
				EndIf
				;Next
			EndIf
			EndIf
		Until $z = 2
		MsgBox(0, "", "Found It")
		MouseMove($coord[0], $coord[1])
	EndIf
WEnd

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