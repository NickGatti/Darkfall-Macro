;Rapid Group Sex BY Diminished Hail: Release Version 3.2
MsgBox(0, "Version", "Rapid Group Sex BY Diminished Hail: Release Version 3.2")
MsgBox(0, "WARNING!", "WARNING! If you get this file THROUGH an EMAIL, I DO NOT promise it being free of ANY virurs's etc... Please download from the correct location!")
WinActivate("Darkfall Online", "")
Do
	Sleep(1)
Until WinActive("Darkfall Online")
#include <ImageSearch.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
$GMResponseReg = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "input1")
$InputDiseaseREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputd")
$InputHasteREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputh")
$InputIronskinREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputi")
$AttackDelayREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputad")
$VMWareREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputvm")
$Main = GUICreate("Group Sex 3.2", 520, 370, 200, 200)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Label1 = GUICtrlCreateLabel("Auto Equip Armor?", 32, 32, 138, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Label2 = GUICtrlCreateLabel("GM Response:", 32, 72, 103, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Label3 = GUICtrlCreateLabel("Melee Haste/Rapid Shot:", 32, 120, 175, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Label4 = GUICtrlCreateLabel("Disease/Arrow Ward:", 32, 160, 150, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Label5 = GUICtrlCreateLabel("Ironskin:", 32, 200, 66, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Button1 = GUICtrlCreateButton("Start", 225, 330, 75, 25, $WS_GROUP)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Radio1 = GUICtrlCreateRadio("Yes", 184, 32, 49, 25)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Radio2 = GUICtrlCreateRadio("No", 240, 32, 49, 25)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$InputGMResponse = GUICtrlCreateInput($GMResponseReg, 136, 70, 345, 28)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$InputHaste = GUICtrlCreateInput($InputHasteREG, 208, 118, 121, 28)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$InputDisease = GUICtrlCreateInput($InputDiseaseREG, 182, 158, 121, 28)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$InputIronskin = GUICtrlCreateInput($InputIronskinREG, 98, 198, 117, 28)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Haste = GUICtrlCreateCheckbox("", 10, 122, 17, 17)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
GUICtrlSetState(-1, $GUI_CHECKED)
$Disease = GUICtrlCreateCheckbox("", 10, 160, 17, 17)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
GUICtrlSetState(-1, $GUI_CHECKED)
$Ironskin = GUICtrlCreateCheckbox("", 10, 200, 17, 17)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
GUICtrlSetState(-1, $GUI_CHECKED)
$Label6 = GUICtrlCreateLabel("Special Attack Delay (how fast it takes to swing one time):", 32, 234, 401, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$InputAttackDelay = GUICtrlCreateInput($AttackDelayREG, 434, 232, 61, 28)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$Label7 = GUICtrlCreateLabel("VM Ware slowdown:", 32, 266, 146, 24)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
$InputVMWare = GUICtrlCreateInput($VMWareREG, 178, 264, 61, 28)
GUICtrlSetFont(-1, 12, 800, 0, "Myriad Pro")
GUISetState(@SW_SHOW)
Global $radioval = -1, $equiparmor = -1, $gmresponse = -1, $menuGO = -1, $guiread, $CastDisease, $CastIron, $CastHaste, $gmx, $gmy, $AttackDelay, $VMWare, $notargetcolor, $notargetx, $notargety, $pixVar2
Global $i = 0
Global $Paused
Global $equiparmor, $outoftime
HotKeySet("{DEL}", "TogglePause")
HotKeySet("{END}", "Terminate")
Global $castingtimer, $castingtimerdif, $notcasting
Global $EquipDelay = 11000, $time5 = $EquipDelay
Global $EquipDelay2 = 200000, $time6 = $EquipDelay2
Global $SpecialAtk = 14500, $time4 = $SpecialAtk
Global $lowTargetHealthColor = 0, $lowTargetHealthx = 0, $fullTargetHealthx = 0, $fullTargetHealthColor = 0, $fullmanacolor = 0, $fullstamcolor = 0, $fullhealthcolor = 0, $targhealthy = 0, $x1 = 0, $y1 = 0, $go = 0, $mana = 0, $stam = 0, $health = 0, $manax = 0, $manay = 0, $stamx = 0, $stamy = 0, $healthx = 0, $healthy = 0, $hits = 0, $weaponimage = 0, $loopexit = False, $totalhits = 0, $hitCounterColorFull = 0, $xForHitCounterFull = 0, $xForHitCounterFullDefault = 0, $yForHitCtr = 0, $xForTargetCheck = 0, $z = 0
Global $unsheathe = "^\" ;<== Make this your unsheathe key ==>
Global $SWDK = "1" ;Sword
Global $SK = "2" ;Staff
Global $FDK = "3" ;Food
Global $SPCATTK = "4" ;Rage
Global $MTSK = "5" ;Mana To Stam
Global $DK = "6" ;Disease
Global $MHK = "7" ;Melee Haste
Global $ISK = "8" ;Ironskin
Global $WBK = "9" ;Witches Brew
Global $HOK = "0" ;Heal other
Global $FOOD2 = "^{F11}" ;Second Food Slot
Global $FOOD3 = "^{F12}" ;Third Food Slot
Global $HTMK = "{NUMPADDOT}" ;Health to Mana THIS IS NUMPAD PEROID . ON YOUR NUMPAD ASK ME IF YOU WANT TO CHANGE IT!
Global $weaponarray[13]
$weaponarray[0] = 11
$weaponarray[1] = "images\weapons\wpn-polearm.bmp"
$weaponarray[2] = "images\weapons\wpn-2hsword.bmp"
$weaponarray[3] = "images\weapons\wpn-1hsword.bmp"
$weaponarray[4] = "images\weapons\wpn-1hmace.bmp"
$weaponarray[5] = "images\weapons\wpn-sithera.bmp"
$weaponarray[6] = "images\weapons\wpn-2hmace.bmp"
$weaponarray[7] = "images\weapons\wpn-archery.bmp"
$weaponarray[8] = "images\weapons\wpn-2haxe.bmp"
$weaponarray[9] = "images\weapons\wpn-1haxe.bmp"
$weaponarray[10] = "images\weapons\wpn-dagger.bmp"
$weaponarray[11] = "images\weapons\wpn-seigehammer.bmp"
Global $functionarrary[12]
$functionarrary[0] = 10
$functionarrary[1] = "^{F1}"
$functionarrary[2] = "^{F2}"
$functionarrary[3] = "^{F3}"
$functionarrary[4] = "^{F4}"
$functionarrary[5] = "^{F5}"
$functionarrary[6] = "^{F6}"
$functionarrary[7] = "^{F7}"
$functionarrary[8] = "^{F8}"
$functionarrary[9] = "^{F9}"
$functionarrary[10] = "^{F10}"
Global $armorarray[12]
$armorarray[0] = 10
$armorarray[1] = "images\armor\pa-helm.bmp"
$armorarray[2] = "images\armor\pa-shoulderpads.bmp"
$armorarray[3] = "images\armor\pa-armguards.bmp"
$armorarray[4] = "images\armor\pa-elbowpads.bmp"
$armorarray[5] = "images\armor\pa-gloves.bmp"
$armorarray[6] = "images\armor\pa-boots.bmp"
$armorarray[7] = "images\armor\pa-greaves.bmp"
$armorarray[8] = "images\armor\pa-girdle.bmp"
$armorarray[9] = "images\armor\pa-legs.bmp"
$armorarray[10] = "images\armor\pa-chest.bmp"

Do
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Radio1
			$menuGO = 1
			$equiparmor = True
		Case $nMsg = $Radio2
			$menuGO = 1
			$equiparmor = False
		Case $nMsg = $Button1 And $menuGO <> -1
			$radioval = GUICtrlRead($Button1)
	EndSelect
	$guiread = GUICtrlRead($InputDisease)
	If $guiread Then
		Global $CastDisease = $guiread, $time3 = $CastDisease
	EndIf
	$guiread = GUICtrlRead($Disease)
	If $guiread = 4 Then
		Global $CastDisease = -1, $time3 = $CastDisease
	EndIf
	$guiread = GUICtrlRead($InputHaste)
	If $guiread Then
		Global $CastHaste = $guiread, $time2 = $CastHaste
	EndIf
	$guiread = GUICtrlRead($Haste)
	If $guiread = 4 Then
		Global $CastHaste = -1, $time2 = $CastHaste
	EndIf
	$guiread = GUICtrlRead($InputIronskin)
	If $guiread Then
		Global $CastIron = $guiread, $time1 = $CastIron
	EndIf
	$guiread = GUICtrlRead($Ironskin)
	If $guiread = 4 Then
		Global $CastIron = -1, $time1 = $CastIron
	EndIf
	$guiread = GUICtrlRead($InputAttackDelay)
	If $AttackDelay <> $guiread Then
		$AttackDelay = GUICtrlRead($InputAttackDelay)
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputad", "REG_SZ", $AttackDelay)
	EndIf
	$guiread = GUICtrlRead($InputVMWare)
	If $VMWare <> $guiread Then
		$VMWare = GUICtrlRead($InputVMWare)
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputvm", "REG_SZ", $VMWare)
	EndIf
	$guiread = GUICtrlRead($InputGMResponse)
	If $gmresponse <> $guiread Then
		$gmresponse = GUICtrlRead($InputGMResponse)
		RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "input1", "REG_SZ", $gmresponse)
	EndIf
Until $radioval <> -1

If $CastDisease <> -1 Then
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputd", "REG_SZ", $CastDisease)
EndIf
If $CastHaste <> -1 Then
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputh", "REG_SZ", $CastHaste)
EndIf
If $CastIron <> -1 Then
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputi", "REG_SZ", $CastIron)
EndIf

GUIDelete()

Func Terminate()
	Exit 0
EndFunc   ;==>Terminate

WinActivate("Darkfall Online", "")

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
		$result = _ImageSearch("images\stat-selfhp.bmp", 1, $x1, $y1, 30)
		If $result And $go = 0 Then
			ToolTip("Script is getting self health bar position", 0, 0)
			$healthx = $x1 + 30
			$healthy = $y1
			$pixVar = PixelGetColor($healthx, $y1)
			$fullhealthcolor = $pixVar
			$go = 1
		EndIf
		If $go = 1 Then
			ToolTip("Script is getting target health bar position", 0, 0)
			WinActivate("Darkfall Online", "")
			Do
				Sleep(1)
			Until WinActive("Darkfall Online")
			Sleep(500)
			$size = WinGetClientSize("Darkfall Online")
			$xcen = $size[0] / 2
			$ycen = $size[1] / 2
			If $size[0] <> 1152 Then
				MsgBox(0, "ERROR!", "ERROR Must be in windowed mode in 1152 x 864 @ 75")
				Exit
			EndIf
			$x1 = $xcen + 80
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
			$go = 2
		EndIf
		;$result = _ImageSearch("images\stat-targethp.bmp", 1, $x1, $y1, 35)
		;If $result And $go = 1 Then
		;	If $y1 <> $healthy And $x1 <> $healthx Then
		;		$lowTargetHealthx = $x1 - 25
		;		$targhealthy = $y1
		;		$fullTargetHealthx = $x1 + 25
		;		$pixVar = PixelGetColor($lowTargetHealthx, $y1)
		;		$lowTargetHealthColor = $pixVar
		;		$pixVar = PixelGetColor($fullTargetHealthx, $y1)
		;		$fullTargetHealthColor = $pixVar
		;		;<==
		;		$pixVar = PixelGetColor($x1, $y1)
		;		$hitCounterColorFull = $pixVar
		;		Do
		;			$x1 = $x1 + 1
		;			$pixVar = PixelGetColor($x1, $y1)
		;		Until $pixVar <> $hitCounterColorFull
		;		$x1 = $x1 - 2
		;		$pixVar = PixelGetColor($x1, $y1)
		;		$hitCounterColorFull = $pixVar
		;		$xForHitCounterFull = $x1
		;		$xForHitCounterFullDefault = $x1
		;		$yForHitCtr = $y1
		;		;==>
		;		$go = 2
		;	EndIf
		;EndIf
		$result = _ImageSearch("images\stat-selfstam.bmp", 1, $x1, $y1, 30)
		If $result And $go = 2 Then
			ToolTip("Script is getting the stamina bar position", 0, 0)
			$stamx = $x1 + 30
			$stamy = $y1
			$pixVar = PixelGetColor($stamx, $y1)
			$fullstamcolor = $pixVar
			$go = 3
		EndIf
		$result = _ImageSearch("images\stat-selfmana.bmp", 1, $x1, $y1, 30)
		If $result And $go = 3 Then
			ToolTip("Script is getting the mana bar position", 0, 0)
			$manax = $x1 + 30
			$manay = $y1
			$pixVar = PixelGetColor($manax, $y1)
			$fullmanacolor = $pixVar
			$go = 4
		EndIf
		If $go = 4 Then
			Call("GetWeapon")
		EndIf
		If $go = -1 Then
			Return
		EndIf
	WEnd
EndFunc   ;==>getStatusBar

While 1 = 1
	If $go = 0 Then
		Call("getstatusbar")
	EndIf
	Call("Melee")
WEnd

Func Melee()
	Call("ironskin")
	Call("meleehaste")
	Call("disease")
	While 1
		If Not WinActive("Darkfall Online") Then Call("TogglePause")
		$dif = TimerDiff($time6)
		If $dif >= $EquipDelay2 And $equiparmor Then
			ToolTip("Script is checking your armor.", 0, 0)
			Call("armor")
			$time6 = TimerInit()
		EndIf
		Call("GMCHECK")
		For $z = 0 To 50
			If Not WinActive("Darkfall Online") Then Call("TogglePause")
			$pixVar = PixelGetColor($notargetx, $notargety)
			If $pixVar <> $notargetcolor Then
				Do
					Sleep(100)
					$pixVar = PixelGetColor($notargetx, $notargety)
				Until $pixVar = $notargetcolor
			EndIf
			Call("ironskin")
			Call("meleehaste")
			Call("disease")
			Call("getstats")
			Call("getstam")
			Call("getmana")
			Call("Sword")
			ToolTip("Script is hitting the target.", 0, 0)
			$dif = TimerDiff($time4)
			If $dif >= $SpecialAtk Then
				Sleep($AttackDelay)
				Send($SPCATTK)
				Sleep(100)
				$time4 = TimerInit()
				MouseClick("left")
				Sleep(50)
				MouseClick("left")
			EndIf
			MouseClick("left")
			Sleep(50)
			MouseClick("left")
		Next
	WEnd
EndFunc   ;==>Melee

Func getmana()
	$pixVar = PixelGetColor($manax, $manay)
	If $pixVar <> $fullmanacolor Then
		Call("Checkstaff")
		Call("waitforcast")
		ToolTip("Script is casting health to mana", 0, 0)
		Send($HTMK)
		Sleep($VMWare)
		MouseClick("left")
		Call("startcast")
	EndIf
EndFunc   ;==>getmana

Func getstam()
	$pixVar = PixelGetColor($stamx, $stamy)
	If $pixVar <> $fullstamcolor Then
		Call("Checkstaff")
		Call("waitforcast")
		ToolTip("Script is casting mana to stam", 0, 0)
		Send($MTSK)
		Sleep($VMWare)
		MouseClick("left")
		Call("startcast")
	EndIf
	$result = _ImageSearch("images\misc-nourished.bmp", 1, $x1, $y1, 30)
	If Not $result Then
		Send($FDK) ;food
		Send($FOOD2) ;food
		Send($FOOD3) ;food
	EndIf
EndFunc   ;==>getstam

Func getstats()
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
			Call("CheckStaff")
			$result = _ImageSearch("images\misc-witchesbrew.bmp", 1, $x1, $y1, 30)
			If $result Then
				ToolTip("Script is casting witches brew on the target.", 0, 0)
				Send($WBK)
				Sleep($VMWare)
				MouseClick("left")
			EndIf
			$result = _ImageSearch("images\9healother.bmp", 1, $x1, $y1, 30)
			If $result Then
				ToolTip("Script is casting heal other on the target.", 0, 0)
				Send($HOK)
				Sleep($VMWare)
				MouseClick("left")
			EndIf
			$result = _ImageSearch("images\9sacrafice.bmp", 1, $x1, $y1, 30)
			If $result Then
				ToolTip("Script is casting sacrafice on the target.", 0, 0)
				Send($HOK)
				Sleep($VMWare)
				MouseClick("left")
			EndIf
			$pixVar = PixelGetColor($fullTargetHealthx, $targhealthy)
		Until $fullTargetHealthColor = $pixVar
		Call("startcast")
	EndIf
EndFunc   ;==>getstats

Func CheckStaff()
	Send($HOK)
	Sleep(50)
	$nostaff = _ImageSearch("images\weapons\wpn-selected.bmp", 1, $x1, $y1, 30)
	$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
	If $nostaff Or $result Then
		ToolTip("Script is drawing your staff.", 0, 0)
		Call("UnsheatheStaffFunc")
	EndIf
EndFunc   ;==>CheckStaff

Func IronSkin()
	If $CastIron = -1 Then
		Return
	EndIf
	$dif = TimerDiff($time1)
	If $dif >= $CastIron Then
		Call("checkstaff")
		Call("waitforcast")
		ToolTip("Script is casting ironskin.", 0, 0)
		Send($ISK) ;ironskin
		Sleep($VMWare)
		Call("startcast")
		MouseClick("left")
		$time1 = TimerInit()
	EndIf
EndFunc   ;==>IronSkin

Func MeleeHaste()
	If $CastHaste = -1 Then
		Return
	EndIf
	$dif = TimerDiff($time2)
	If $dif >= $CastHaste Then
		Call("checkstaff")
		Call("waitforcast")
		ToolTip("Script is casting melee haste.", 0, 0)
		Send($MHK) ;meleehaste
		Sleep($VMWare)
		Call("startcast")
		MouseClick("left")
		$time2 = TimerInit()
	EndIf
EndFunc   ;==>MeleeHaste

Func Disease()
	If $CastDisease = -1 Then
		Return
	EndIf
	$dif = TimerDiff($time3)
	If $dif >= $CastDisease Then
		Call("checkstaff")
		Call("waitforcast")
		ToolTip("Script is casting disease.", 0, 0)
		Send($DK) ;disease
		Sleep($VMWare)
		Call("startcast")
		MouseClick("left")
		$time3 = TimerInit()
	EndIf
EndFunc   ;==>Disease

Func Sword()
	$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
	If Not $result Then
		Send($SWDK)
		$exit = False
		$equip = 0
		Do
			If Not WinActive("Darkfall Online") Then Call("TogglePause")
			$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
			Sleep(85)
			Send($unsheathe) ;UNSHEATHE
			If $result Then
				$exit = True
				ExitLoop
			EndIf
			$equip = $equip + 1
		Until $equip = 4 Or $result Or $exit
		If Not $exit Then
			Call("UnsheatheWeaponFunc")
			Return
		EndIf
	EndIf
EndFunc   ;==>Sword

Func GetWeapon()
	ToolTip("Script is saving your weapon type.", 0, 0)
	If $weaponimage = 0 Then
		Do
			Send($SWDK)
			Sleep(150)
			Do
				$result = _ImageSearch("images\misc-equipped.bmp", 1, $x1, $y1, 30)
				Send($unsheathe)
			Until Not $result
			Sleep(200)
			$result = _ImageSearch("images\weapons\wpn-selected.bmp", 1, $x1, $y1, 60)
			If $result Then
				Send($SWDK)
				Sleep(200)
				Send($unsheathe)
			EndIf
			For $i = 1 To $weaponarray[0]
				$result = _ImageSearch($weaponarray[$i], 1, $x1, $y1, 30)
				If $result Then
					$weaponimage = $weaponarray[$i]
					$loopexit = True
				EndIf
			Next
		Until $loopexit = True
		$go = -1
	EndIf
EndFunc   ;==>GetWeapon

Func Armor()
	For $i = 1 To $armorarray[0]
		If $armorarray[$i] <> False Then
			$result = _ImageSearch($armorarray[$i], 1, $x1, $y1, 30)
			$dif = TimerDiff($time5)
			If $result And $dif >= $EquipDelay Then
				Send($functionarrary[$i])
				Call("waitforarmor", $armorarray[$i], $i)
			EndIf
		EndIf
	Next
	$time5 = TimerInit()
EndFunc   ;==>Armor

Func waitforarmor($piece, $num)
	$timeout = TimerInit()
	Do
		ToolTip("Script is equipping armor, timeout is: " & Int($outoftime) & " armor piece is: " & $piece, 0, 0)
		$outoftime = TimerDiff($timeout)
		Sleep(100)
		$result = _ImageSearch($piece, 1, $x1, $y1, 30)
	Until Not $result Or $outoftime > 11000
	If $outoftime > 11000 Then
		$armorarray[$num] = False
	EndIf
EndFunc   ;==>waitforarmor

;==> GM CHECK <==

Func GMCheck()
	$result = _ImageSearch("images\gmtell2.bmp", 1, $x1, $y1, 50)
	If $result Then
		$gmx = $x1
		$gmy = $y1
		Call("clickontab")
	EndIf
	$result = _ImageSearch("images\gmtell.bmp", 1, $x1, $y1, 50)
	If $result Then
		$gmx = $x1
		$gmy = $y1
		Call("clickontab")
	EndIf
	Call("recallbox")
EndFunc   ;==>GMCheck

Func Clickontab()
	Sleep(800)
	Call("guimode")
	MouseClick("left", $gmx, $gmy)
	Sleep(800)
	Send("{enter}")
	Sleep(800)
	Send($gmresponse)
	Sleep(800)
	Send("{enter}")
	Sleep(800)
	Send("{enter}")
	Sleep(800)
	While 1
		ToolTip("GM TELL RECIVED", 0, 0)
		SoundSetWaveVolume(100)
		SoundPlay("sounds\gmtell.wav", 1)
		Call("recallbox")
	WEnd
EndFunc   ;==>Clickontab

Func RecallBox()
	$result = _ImageSearch("images\gmconfirm.bmp", 1, $x1, $y1, 30)
	If $result Then
		$result = _ImageSearch("images\gmdecline.bmp", 1, $x1, $y1, 30)
		If $result Then
			$gmx = $x1
			$gmy = $y1
			Call("guimode")
			Sleep(400)
			MouseClick("left", $gmx, $gmy)
		EndIf
	EndIf
EndFunc   ;==>RecallBox

Func GUIMODE()
	$result = _ImageSearch("images\optionstab.bmp", 1, $x1, $y1, 30)
	If Not $result Then
		Do
			$result = _ImageSearch("images\optionstab.bmp", 1, $x1, $y1, 30)
			Send("{esc}")
			Sleep(800)
			$result = _ImageSearch("images\optionstab.bmp", 1, $x1, $y1, 30)
			MouseClick("right")
			Sleep(800)
			$result = _ImageSearch("images\optionstab.bmp", 1, $x1, $y1, 30)
			Send("`")
			Sleep(800)
			$result = _ImageSearch("images\optionstab.bmp", 1, $x1, $y1, 30)
			Sleep(800)
		Until $result
	EndIf
EndFunc   ;==>GUIMODE

;==> GM CHECK <==

Func startcast()
	$pos = MouseGetPos()
	$pos[1] = $pos[1] - 65
	$pos[0] = $pos[0] - 149
	$notcasting = PixelGetColor($pos[0], $pos[1])
	$castingtimer = TimerInit()
EndFunc   ;==>startcast

Func Waitforcast()
	Do
		$castingtimerdif = TimerDiff($castingtimer)
		$pos = MouseGetPos()
		$pos[1] = $pos[1] - 65
		$pos[0] = $pos[0] - 149
		$pixVar = PixelGetColor($pos[0], $pos[1])
		ToolTip("Script is waiting for spell to finish: " & $castingtimerdif, 0, 0)
	Until $pixVar = $notcasting Or $castingtimerdif > 2500
EndFunc   ;==>Waitforcast

Func UnsheatheStaffFunc()
	Do
		If Not WinActive("Darkfall Online") Then Call("TogglePause")
		Send($SK)
		Sleep(100)
		$result = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
		$result2 = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
		Send($unsheathe)
		Sleep(200)
		Send($HOK)
		$result = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
		$result2 = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
	Until Not $result And Not $result2
EndFunc   ;==>UnsheatheStaffFunc

Func UnsheatheWeaponFunc()
	Do
		If Not WinActive("Darkfall Online") Then Call("TogglePause")
		$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
		Send($unsheathe)
		Sleep(400)
		$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
		Send($SWDK)
		Sleep(400)
		$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
		Send($unsheathe)
		Sleep(400)
		$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
	Until $result
EndFunc   ;==>UnsheatheWeaponFunc
