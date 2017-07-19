While 1
	$pos = MouseGetPos()
	$var = PixelGetColor($pos[0], $pos[1])
;### Tidy Error: If/ElseIf statement without a then..
	If $var = 13421772 Then
		ToolTip($var)
	EndIf
WEnd