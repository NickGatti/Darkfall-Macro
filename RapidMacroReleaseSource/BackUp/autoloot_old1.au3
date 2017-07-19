If $go = 4 Then
	ToolTip("Script is getting target health bar position", 0, 0)
	WinActivate("Darkfall Online", "")
	Sleep(500)
	$size = WinGetClientSize("Darkfall Online")
	$xcen = $size[0] / 2
	$ycen = $size[1] / 2
	$x1 = $xcen + 30
	Do
		$x1 = $x1 + 1
		$y1 = $ycen + 50
		Do
			$y1 = $y1 + 1
			$pixVar = PixelGetColor($x1, $y1)
		Until $pixVar = $fullhealthcolor Or $y1 > ($ycen + 60)
			Until $x1 > $size[0] Or $pixVar = $fullhealthcolor
			$notargetcolor = PixelGetColor($x1, $y1)
			$notargetx = $x1
			$notargety = $y1
			$lowTargetHealthx = $x1 + 25
			$targhealthy = $y1
			$lowTargetHealthColor = PixelGetColor(($x1 + 25), $y1)
			$fullTargetHealthColor = PixelGetColor(($x1 + 75), $y1)
			$fullTargetHealthx = $x1 + 75
			$go = 5
		EndIf
