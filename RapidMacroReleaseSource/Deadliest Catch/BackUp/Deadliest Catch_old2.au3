WinActivate("Darkfall Online", "")
#include <ImageSearch.au3>
Global $go = 0, $x1, $y1

Do
	$result = _ImageSearch("images\stat-selfstam.bmp", 1, $x1, $y1, 30)
	If $result = 1 And $go = 2 Then
		$stamx = $x1
		$stamy = $y1
		$pixVar = PixelGetColor($stamx, $y1)
		$fullstamcolor = $pixVar
		$go = 1
	EndIf
Until $go = 1

While 1
	Call("CheckStam")
WEnd

Func getstam()
	$pixVar = PixelGetColor($stamx, $stamy)
	If $pixVar <> $fullstamcolor Then
		EndIf
		Call("CheckStaff")
		ToolTip("Script is casting mana to stam", 0, 0)
		Send($MTSK)
		Sleep(150)
		MouseClick("left")
	EndIf
	$result = _ImageSearch("images\misc-nourished.bmp", 1, $x1, $y1, 30)
	If $result <> 1 Then
		Send($FDK) ;food
	EndIf
EndFunc   ;==>getstam

Func EquipWeapon($sendkey)
		Sleep(350)
		Send($unsheathe)
		Sleep(350)
		Do
			$result = _ImageSearch("images/misc-equipped.bmp", 1, $x1, $y1, 30)
			Send($sendkey)
			Sleep(350)
		Send($unsheathe)
		Sleep(350)
		Until $result = 1
EndFunc   ;==>CheckStaff

Func Pole()
	Send($unsheathe) ;UNSHEATHE
	$exit = False
	$equip = 0
	Do
		$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
		If $result = 1 Then
			$exit = True
			ExitLoop
		EndIf
		$equip = $equip + 1
	Until $equip = 4
	If $exit <> True Then
		Do
			ToolTip("Script is drawing your weapon.", 0, 0)
			$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
			Send($unsheathe) ;UNSHEATHE
			Sleep(300)
			$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
			Send($SWDK) ;sword
			Sleep(300)
			$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
			Send($unsheathe) ;UNSHEATHE
			Sleep(300)
		Until $result = 1
		Return
	EndIf
EndFunc   ;==>Sword
