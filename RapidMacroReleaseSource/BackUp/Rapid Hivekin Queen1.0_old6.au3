;Rapid Magic BY Diminished Hail: Release Version 1.3
MsgBox(0, "Version", "Rapid Hivekin Queen BY Diminished Hail: Release Version 1.0")
MsgBox(0, "WARNING!", "WARNING! If you get this file THROUGH an EMAIL, I DO NOT promise it being free of ANY virurs's etc... Please download from the correct location!")
WinActivate("Darkfall Online", "")
#include <ImageSearch.au3>
Global $Paused
HotKeySet("{DEL}", "TogglePause")
HotKeySet("{END}", "Terminate")
;THIS IS AN ARRAY FOR YOUR SPELL HOTKEYS
Global $SLT[6]
$SLT[0] = "1" ;Spell 1
$SLT[1] = "2" ;Spell 2
$SLT[2] = "3" ;Spell 3
$SLT[3] = "4" ;Spell 4
$SLT[4] = "5" ;Spell 5
;REST OF HOTKEYS
Global $SK = "6" ;Staff
Global $HTMK = "7" ;Health to mana
Global $MTSK = "8" ;Mana to stam
Global $STHK = "9" ;Stam to health
Global $HOK = "0" ;Heal Other
Global $unsheathe = "^\" ;<== Make this your unsheathe key ==>
Global $x1 = 0, $y1 = 0, $go = 0, $manax = 0, $manay = 0, $fullmanacolor = 0, $stamx = 0, $stamy = 0, $fullstamcolor = 0, $healthx = 0, $healthy = 0, $fullhealthcolor = 0, $stamicon, $stamiconx, $stamicony, $stamicon2, $notargetcolor, $notargetx, $notargety, $pixVar2, $lowTargetHealthColor, $lowTargetHealthx, $fullTargetHealthx, $fullTargetHealthColor, $targhealthy
Global $weaponarray[12]
$weaponarray[0] = 10
$weaponarray[1] = "images\wpn-polearm.bmp"
$weaponarray[2] = "images\wpn-2hsword.bmp"
$weaponarray[3] = "images\wpn-1hsword.bmp"
$weaponarray[4] = "images\wpn-1hmace.bmp"
$weaponarray[5] = "images\wpn-sithera.bmp"
$weaponarray[6] = "images\wpn-2hmace.bmp"
$weaponarray[7] = "images\wpn-archery.bmp"
$weaponarray[8] = "images\wpn-2haxe.bmp"
$weaponarray[9] = "images\wpn-1haxe.bmp"
$weaponarray[10] = "images\wpn-dagger.bmp"
Global $i = 0

Func Terminate()
	Exit 0
EndFunc   ;==>Terminate

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip('Script is "Paused"', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

Func getStatusBar()
	While 1 = 1
		If $go = 0 Then
			ToolTip("Script is getting mana bar position", 0, 0)
		EndIf
		If $go = 1 Then
			ToolTip("Script is getting stam bar position", 0, 0)
		EndIf
		If $go = 2 Then
			ToolTip("Script is getting health bar position", 0, 0)
		EndIf
		If $go = 3 Then
			ToolTip("Script is getting hottbar color.", 0, 0)
		EndIf
		If $go = 4 Then
			ToolTip("Script is getting target health bar position", 0, 0)
		EndIf
		$result = _ImageSearch("images\stat-selfmana.bmp", 1, $x1, $y1, 30) ;gets mana pos in center of image
		If $result = 1 And $go = 0 Then
			$manax = $x1 + 30
			$manay = $y1
			$pixVar = PixelGetColor($manax, $y1)
			$fullmanacolor = $pixVar
			$go = 1
		EndIf
		$result = _ImageSearch("images\stat-selfstam.bmp", 1, $x1, $y1, 30)
		If $result = 1 And $go = 1 Then
			$stamx = $x1 + 30
			$stamy = $y1
			$pixVar = PixelGetColor($stamx, $y1)
			$fullstamcolor = $pixVar
			$go = 2
		EndIf
		$result = _ImageSearch("images\stat-selfhp.bmp", 1, $x1, $y1, 30)
		If $result = 1 And $go = 2 Then
			$healthx = $x1 + 30
			$healthy = $y1
			$pixVar = PixelGetColor($healthx, $y1)
			$fullhealthcolor = $pixVar
			$go = 3
		EndIf
		If $go = 3 Then
			Send($STHK)
			Sleep(10)
			$result = _ImageSearch("images\8stamtohealth.bmp", 1, $x1, $y1, 30)
			If Not $result Then
				Do
					Send($SK)
					$result2 = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
					$result = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
					Sleep(200)
					Send($unsheathe)
					Sleep(200)
					Send($STHK)
					$result2 = _ImageSearch("images\8stamtohealth.bmp", 1, $x1, $y1, 30)
					$result = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
				Until $result Or $result2
			EndIf
			Sleep(250)
			$result = _ImageSearch("images\8stamtohealth.bmp", 1, $x1, $y1, 30)
			If $result Then
				Sleep(150)
				$stamicon = PixelGetColor($x1, $y1)
				$stamiconx = $x1
				$stamicony = $y1
			EndIf
			$go = 4
		EndIf
		If $go = 4 Then
			WinActivate("Darkfall Online", "")
			Do
				Sleep(1)
			Until WinActive("Darkfall Online")
			Sleep(500)
			$size = WinGetClientSize("Darkfall Online")
			$xcen = $size[0] / 2
			$ycen = $size[1] / 2
			$x1 = $xcen
			$y1 = $ycen
			Do
				$x1 = $x1 + 1
				$y1 = $ycen
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
		If $go = 5 Then
			Return
		EndIf
	WEnd
EndFunc   ;==>getStatusBar

Call("getstatusbar")

While 1 = 1
	Call("cast")
	Call("checkstaff")
WEnd

Func cast()
	For $z = 0 To 8
		For $i = 0 To 5
			If Not WinActive("Darkfall Online") Then Call("TogglePause")
			$pixVar = PixelGetColor($notargetx, $notargety)
			If $pixVar <> $notargetcolor Then
				Do
					Sleep(100)
					$pixVar = PixelGetColor($notargetx, $notargety)
				Until $pixVar = $notargetcolor
			EndIf
			Send($SLT[$i])
			ToolTip("Script is on spell #" & $i, 0, 0)
			Sleep(150)
			MouseClick("left")
			Call("getstats")
		Next
	Next
EndFunc   ;==>cast

Func getstats()
	If Not WinActive("Darkfall Online") Then Call("TogglePause")
	$pixVar = PixelGetColor($notargetx, $notargety)
	If $pixVar <> $notargetcolor Then
		Do
			Sleep(100)
			$pixVar = PixelGetColor($notargetx, $notargety)
		Until $pixVar = $notargetcolor
	EndIf
	$pixVar = PixelGetColor($manax, $manay)
	If $pixVar <> $fullmanacolor Then
		ToolTip("Script is casting health to mana", 0, 0)
		Send($HTMK)
		Sleep(150)
		MouseClick("left")
	EndIf
	$pixVar = PixelGetColor($stamx, $stamy)
	If $pixVar <> $fullstamcolor Then
		ToolTip("Script is casting mana to stam", 0, 0)
		Send($MTSK)
		Sleep(150)
		MouseClick("left")
	EndIf
	$pixVar = PixelGetColor($healthx, $healthy)
	If $pixVar <> $fullhealthcolor Then
		ToolTip("Script is casting stam to health", 0, 0)
		Send($STHK)
		Sleep(150)
		MouseClick("left")
	EndIf
	$pixVar = PixelGetColor($lowTargetHealthx, $targhealthy)
	If $pixVar <> $lowTargetHealthColor Then
		Do
			$pixVar2 = PixelGetColor($notargetx, $notargety)
			If $pixVar2 <> $notargetcolor Then
				Do
					Sleep(100)
					$pixVar2 = PixelGetColor($notargetx, $notargety)
				Until $pixVar2 = $notargetcolor
			EndIf
			If Not WinActive("Darkfall Online") Then Call("TogglePause")
			$pixVar = PixelGetColor($notargetx, $notargety)
			If $pixVar <> $notargetcolor Then
				Do
					Sleep(100)
					$pixVar = PixelGetColor($notargetx, $notargety)
				Until $pixVar = $notargetcolor
			EndIf
			Call("CheckStaff")
			$result = _ImageSearch("images\9healother.bmp", 1, $x1, $y1, 30)
			If $result Then
				ToolTip("Script is casting heal other on the target.", 0, 0)
				Send($HOK)
				Sleep(200)
				MouseClick("left")
			EndIf
			$result = _ImageSearch("images\9sacrafice.bmp", 1, $x1, $y1, 30)
			If $result Then
				ToolTip("Script is casting sacrafice on the target.", 0, 0)
				Send($HOK)
				Sleep(200)
				MouseClick("left")
			EndIf
			$pixVar = PixelGetColor($fullTargetHealthx, $targhealthy)
		Until $fullTargetHealthColor = $pixVar
	EndIf
EndFunc   ;==>getstats

Func checkstaff()
	Send($STHK)
	Sleep(100)
	$pixVar = PixelGetColor($stamiconx, $stamicony)
	If $pixVar <> $stamicon Then
		Do
			If Not WinActive("Darkfall Online") Then Call("TogglePause")
			Send($SK)
			$result2 = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
			$result = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
			Sleep(200)
			Send($unsheathe)
			Sleep(200)
			Send($STHK)
			$result2 = _ImageSearch("images\8stamtohealth.bmp", 1, $x1, $y1, 30)
			$result = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
		Until $result Or $result2
	EndIf
EndFunc   ;==>checkstaff
