Global $lastCoord = False, $add = 0
WinActivate("Darkfall Online")
Sleep(1000)
While 1
	$pos = WinGetPos("Darkfall Online")
	If Not @error Then
	Do
		$z = 0
		$pos[0] += 1
		$pos[1] += 1
		$pos[2] += 1
		$pos[3] += 1
	$coord = PixelSearch(($pos[0] + $add), $pos[1], $pos[2], $pos[3], 11711154)
	$color = PixelGetColor($coord[0], $coord[1])
	If $color = 11711154 Then
		For $i = 1 To 4
			$color = PixelGetColor($coord[0], ($coord[1] + $i))
			If $color = 11711154 Then
				MouseMove($coord[0],$coord[1], 0)
				$z += 1
			EndIf
		Next
	EndIf
Until $z = 4
EndIf
MsgBox(0, "", "Found It")
MouseMove($coord[0],$coord[1])
WEnd