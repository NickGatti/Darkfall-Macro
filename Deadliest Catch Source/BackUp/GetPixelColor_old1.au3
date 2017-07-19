while 1
	$pos = MouseGetPos()
	$var = PixelGetColor($pos[0],$pos[1])
	If $var = 13421772
	ToolTip($var)
	EndIf
WEnd