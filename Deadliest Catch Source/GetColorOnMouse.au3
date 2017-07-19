While 1
	$pos = MouseGetPos()
	$color = PixelGetColor($pos[0],$pos[1])
	ToolTip($color);$pos[0],$pos[1])
WEnd
