Global $lastCoord = False, $add = 0
WinActivate("Darkfall Online")
Sleep(1000)
While 1
	$pos = WinGetPos("Darkfall Online")
	Do
		$pos[0] += 1
		$pos[1] += 1
		$pos[2] += 1
		$pos[3] += 1
	$coord = PixelSearch(($pos[0] + $add), $pos[1], $pos[2], $pos[3], 11711154)
	$color = PixelGetColor($coord[0], $coord[1])
	If $color = 13421772 Then
		MsgBox(0, "", "Found It")
MouseMove($coord[0],$coord[1])
	EndIf
Until $lastCoord
WEnd