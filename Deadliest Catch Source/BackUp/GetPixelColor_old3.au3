While 1
	$pos = WinGetPos("Darkfall Online")
	$var = PixelSearch($pos[0],$pos[1],$pos[2],$pos[3],13421772)
	If $var = 13421772 Then
		For $i = 1 to 15
			$var = PixelGetColor($pos[0], $pos[1])
		;ToolTip($pos[0] & "," & $pos[1])
	EndIf
WEnd