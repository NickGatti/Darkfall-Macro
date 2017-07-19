;Rapid Magic BY Diminished Hail: Release Version 1.1
MsgBox(0, "Version", "Rapid Magic BY Diminished Hail: Release Version 1.1")
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
Global $unsheathe = "^\" ;<== Make this your unsheathe key ==>
Global $x1 = 0, $y1 = 0, $go = 0, $mana = 0, $stam = 0, $health = 0, $manax = 0, $manay = 0, $fullmanacolor = 0, $stamx = 0, $stamy = 0, $fullstamcolor = 0, $healthx = 0, $healthy = 0, $fullhealthcolor = 0, $HOK = $SLT[0]
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
			Return
		EndIf
	WEnd
EndFunc   ;==>getStatusBar

While 1 = 1
	If $go = 0 Then
		Call("getstatusbar")
	EndIf
	Call("checkstaff")
	Call("cast")
WEnd

Func cast()
	For $z = 0 To 10
	For $i = 0 To 5
		Send($SLT[$i])
		ToolTip("Script is on spell #" & $i, 0, 0)
		Sleep(150)
		MouseClick("left")
		Call("getstats")
	Next
	Next
EndFunc   ;==>cast

Func getstats()
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
EndFunc   ;==>getstats

Func checkstaff()
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
EndFunc   ;==>checkstaff
