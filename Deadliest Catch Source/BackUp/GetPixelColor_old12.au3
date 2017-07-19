#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global $result, $x1, $y1, $paused
HotKeySet("{Pause}", "TogglePause")
WinActivate("Darkfall Online")
Sleep(1000)
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
						MouseMove($coord[0], $coord[1])
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
	startcast()
	MouseClick("left")
EndFunc


;### Tidy Error -> func Not closed before "Func" statement.
;### Tidy Error -> "func" cannot be inside any IF/Do/While/For/Case/Func statement.
	Func startcast()
		$pos = MouseGetPos()
		$pos[1] = $pos[1] - 65
		$pos[0] = $pos[0] - 149
		$notMining = PixelGetColor($pos[0], $pos[1])
	EndFunc   ;==>startcast

;### Tidy Error -> func Not closed before "Func" statement.
;### Tidy Error -> "func" cannot be inside any IF/Do/While/For/Case/Func statement.
	Func Waitforcast()
		Do
			$nodeTimer = TimerInit()
			Do
				$nodeTimerDif = TimerDiff($nodeTimer)
				$pos = MouseGetPos()
				$pos[1] = $pos[1] - 65
				$pos[0] = $pos[0] - 149
				$pixVar = PixelGetColor($pos[0], $pos[1])
				ToolTip("Script is waiting for node to finish: " & $nodeTimerDif, 0, 0)
			Until $pixVar = $notMining
		Until $nodeTimerDif > 20000
	EndFunc   ;==>Waitforcast

;### Tidy Error -> func Not closed before "Func" statement.
;### Tidy Error -> "func" cannot be inside any IF/Do/While/For/Case/Func statement.
	Func _ImageSearch($findImage, $resultPosition, ByRef $x, ByRef $y, $tolerance)
		$size = WinGetClientSize("Darkfall Online")
		Return _ImageSearchArea($findImage, $resultPosition, 0, 0, $size[0], $size[1], $x, $y, $tolerance)
	EndFunc   ;==>_ImageSearch

;### Tidy Error -> func Not closed before "Func" statement.
;### Tidy Error -> "func" cannot be inside any IF/Do/While/For/Case/Func statement.
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

;### Tidy Error -> func Not closed before "Func" statement.
;### Tidy Error -> "func" cannot be inside any IF/Do/While/For/Case/Func statement.
	Func TogglePause()
		$paused = Not $paused
		While $paused
			Sleep(100)
			ToolTip('Script is "Paused"', 0, 0)
		WEnd
		ToolTip("")
	EndFunc   ;==>TogglePause
;### Tidy Error -> func is never closed in your script.
