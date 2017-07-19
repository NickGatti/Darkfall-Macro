Global $lastCoord = 0, $add = 0
WinActivate("Darkfall Online")
Sleep(1000)
While 1
	$pos = WinGetPos("Darkfall Online")
	If $lastCoord Then
		$add = 1
	Else
		$add = 0
	EndIf
	$lastCoord = False
	$coord = PixelSearch(($pos[0] + $add), $pos[1], $pos[2], $pos[3], 13421772)
	$color = PixelGetColor($coord[0],$coord[1])
	If $color = 13421772 Then
		For $i = 1 To 15
			$color = PixelGetColor($coord[0],($coord[1] + $i))
			If $color <> 13421772 Then
				$lastCoord = True
			ExitLoop
			EndIf
			;MouseMove($coord[0],$coord[1])
			If $i = 15 Then MsgBox(0,"","Found It")
		Next
	EndIf
WEnd
