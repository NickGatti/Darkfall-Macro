While 1
	$pos = WinGetPos("Darkfall Online")
	$var = PixelSearch($pos[0], $pos[1], $pos[2], $pos[3], 13421772)
	If $var = 13421772 Then
		For $i = 1 To 15
			$var = PixelGetColor($pos[0], $pos[1])
			;ToolTip($pos[0] & "," & $pos[1])
			Next
;### Tidy Error -> "endif" is closing previous "for" on line 5
		EndIf
;### Tidy Error -> "wend" is closing previous "if" on line 4
	WEnd
;### Tidy Error -> while is never closed in your script.
