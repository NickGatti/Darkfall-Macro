Global $onScreenTextColor = 12373128, $pixvar1, $pixvar2, $pixvar3, $pixvar4
Global $h1[3]
$h1[0] = 665
$h1[1] = 464
Global $h2[3]
$h2[0] = 665
$h2[1] = 451
Global $h3[3]
$h3[0] = 675
$h3[1] = 452
Global $h4[3]
$h4[0] = 677
$h4[1] = 465

While 1
	$pixvar1 = PixelGetColor($h1[0],$h1[1])
	$pixvar2 = PixelGetColor($h2[0],$h2[1])
	$pixvar3 = PixelGetColor($h3[0],$h3[1])
	$pixvar4 = PixelGetColor($h4[0],$h4[1])
	If $pixvar1 = $onScreenTextColor And $pixvar2 = $onScreenTextColor And $pixvar3 = $onScreenTextColor And $pixvar4 = $onScreenTextColor Then
		ToolTip("Found a corpse",0,0")
	EndIf
	ToolTip("",0,0)
WEnd

