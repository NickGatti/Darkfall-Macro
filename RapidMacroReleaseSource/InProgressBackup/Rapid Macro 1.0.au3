#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Opt("MustDeclareVars", 1)
MsgBox(0, "Version", "Rapid Macro BY Diminished Hail: Complete Version 1.0")
MsgBox(0, "Tip", "If you are running 32/64 bit Vista or Windows 7 its suggested you run the program as administrator.")
MsgBox(0, "WARNING!", "WARNING! If you get this file THROUGH an EMAIL, I DO NOT promise it being free of ANY virurs's etc... Please download from the correct location!")
WinActivate("Darkfall Online", "")
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include "FontConstants.au3"
#include "StructureConstants.au3"
#include "WinAPIError.au3"
;/***************************************************************************************************************************************************************************************************
Global $lowTargetHealthColor = 0, $lowTargetHealthx = 0, $fullTargetHealthx = 0, $fullTargetHealthColor = 0, $fullmanacolor = 0, $fullstamcolor = 0, $fullhealthcolor = 0, $targhealthy = 0, $x1 = 0, $y1 = 0, $go = 0, $mana = 0, $stam = 0, $health = 0, $manax = 0, $manay = 0, $stamx = 0, $stamy = 0, $healthx = 0, $healthy = 0, $hits = 0, $weaponimage = 0, $loopexit = False, $totalhits = 0, $hitCounterColorFull = 0, $xForHitCounterFull = 0, $xForHitCounterFullDefault = 0, $yForHitCtr = 0, $xForTargetCheck = 0, $z = 0
Global $Ironskin, $Disease, $Haste, $castingtimer, $CastDisease, $CastHaste, $CastIron, $AttackDelay, $AttackDelayREG, $castingtimerdif, $equip, $equiparmor, $exit, $gmresponse, $GMResponseReg, $gmx, $gmy, $go, $guiread, $hitCounterColorFull, $hits, $i, $InputAttackDelay, $InputDisease, $InputDiseaseREG, $InputHaste, $InputHasteREG, $InputIronskin, $InputIronskinREG, $InputVMWare, $menuGO, $nMsg, $nostaff, $num, $outoftime, $pixVar, $pixVar2, $result, $result2
Global $radioval = -1, $equiparmor = -1, $gmresponse = -1, $menuGO = -1, $guiread, $CastDisease, $CastIron, $CastHaste, $gmx, $gmy, $AttackDelay, $VMWare, $notargetcolor, $notargetx, $notargety, $pixVar2
Global $findImage, $resultPosition, $x, $y, $tolerance, $findImage, $result, $x1, $y1, $right, $bottom, $InputVMWareDelay, $unsheathekey, $Slot0, $Slot1, $Slot2, $slot3, $slot4, $slot5, $slot6, $slot7, $slot8, $slot9, $Slot0, $FOOD2, $FOOD3, $Healthtomana, $Form1_1, $MenuItem1, $MenuItem2, $MenuItem3, $MenuItem4, $combobox, $Radio1, $Radio2, $Radio3, $Label1, $Label2, $Label3, $Label4, $Label5, $Label6, $Button1, $Button2, $Input1, $Input2, $Input3, $Input4, $Input5, $Input6, $Checkbox1, $Checkbox2, $Checkbox3, $dll, $read, $time1, $time2, $time3, $dif, $timeout, $pos
Global $VMWareREG, $unsheathe, $HTMK, $guimode, $Checkbox4, $Checkbox5, $Checkbox6, $button3, $add1, $add2, $add3, $send, $state, $lbl3, $Label7, $Input7, $SpecialAttackCDREG, $time4, $SpecialAtk, $castingwait, $castingwaitREG, $label8, $Input8, $dummymode
$castingwaitREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputCastingWait")
$SpecialAttackCDREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputSpecialAttackCD")
$InputDiseaseREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputDisease")
$InputHasteREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputHaste")
$InputIronskinREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputIronSkin")
$GMResponseReg = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputGMResponse")
$AttackDelayREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputAttackDelay")
$VMWareREG = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputVMwareDelay")
$unsheathe = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "UnsheatheKey")
$Slot1 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot1")
$Slot2 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot2")
$slot3 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot3")
$slot4 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot4")
$slot5 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot5")
$slot6 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot6")
$slot7 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot7")
$slot8 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot8")
$slot9 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot9")
$Slot0 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot0")
$FOOD2 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Food2")
$FOOD3 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Food3")
$HTMK = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "HealthToMana")
Global $functionarrary[12]
$functionarrary[0] = 10
$functionarrary[1] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot1")
$functionarrary[2] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot2")
$functionarrary[3] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot3")
$functionarrary[4] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot4")
$functionarrary[5] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot5")
$functionarrary[6] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot6")
$functionarrary[7] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot7")
$functionarrary[8] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot8")
$functionarrary[9] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot9")
$functionarrary[10] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot0")
Global $hotkey
Global $comboxarray[26]
$comboxarray[0] = "Unsheathe Key"
$comboxarray[1] = "Health to Mana"
$comboxarray[2] = "GUI Mode Key"
$comboxarray[3] = "Food 2"
$comboxarray[4] = "Food 3"
$comboxarray[5] = "Slot 1 (Weapon)"
$comboxarray[6] = "Slot 2 (Staff)"
$comboxarray[7] = "Slot 3 (Food 1)"
$comboxarray[8] = "Slot 4 (Special Attack)"
$comboxarray[9] = "Slot 5 (Mana to Stam)"
$comboxarray[10] = "Slot 6 (Disease / Arrow Ward / Etc...)"
$comboxarray[11] = "Slot 7 (Melee Haste / Rapid Shot / Etc...)"
$comboxarray[12] = "Slot 8 (Ironskin / Etc...)"
$comboxarray[13] = "Slot 9 (Sacrafice / Heal Other / Witches Brew )"
$comboxarray[14] = "Slot 0 (Sacrafice / Heal Other / Witches Brew )"
$comboxarray[15] = "Armor Slot 1 (Helm)"
$comboxarray[16] = "Armor Slot 2 (Shoulders)"
$comboxarray[17] = "Armor Slot 3 (Arms)"
$comboxarray[18] = "Armor Slot 4 (Elbows)"
$comboxarray[19] = "Armor Slot 5 (Hands)"
$comboxarray[20] = "Armor Slot 6 (Boots)"
$comboxarray[21] = "Armor Slot 7 (Greaves)"
$comboxarray[22] = "Armor Slot 8 (Girdle)"
$comboxarray[23] = "Armor Slot 9 (Legs)"
$comboxarray[24] = "Armor Slot 0 (Chest)"
Global $regarray[26]
$regarray[0] = "UnsheatheKey"
$regarray[1] = "HealthtoMana"
$regarray[2] = "GUIModeKey"
$regarray[3] = "Food2"
$regarray[4] = "Food3"
$regarray[5] = "Slot1"
$regarray[6] = "Slot2"
$regarray[7] = "Slot3"
$regarray[8] = "Slot4"
$regarray[9] = "Slot5"
$regarray[10] = "Slot6"
$regarray[11] = "Slot7"
$regarray[12] = "Slot8"
$regarray[13] = "Slot9"
$regarray[14] = "Slot0"
$regarray[15] = "ArmorSlot1"
$regarray[16] = "ArmorSlot2"
$regarray[17] = "ArmorSlot3"
$regarray[18] = "ArmorSlot4"
$regarray[19] = "ArmorSlot5"
$regarray[20] = "ArmorSlot6"
$regarray[21] = "ArmorSlot7"
$regarray[22] = "ArmorSlot8"
$regarray[23] = "ArmorSlot9"
$regarray[24] = "ArmorSlot0"
Global $keyarrary[26]
$keyarrary[0] = ""
$keyarrary[1] = ""
$keyarrary[2] = ""
$keyarrary[3] = ""
$keyarrary[4] = ""
$keyarrary[5] = ""
$keyarrary[6] = ""
$keyarrary[7] = ""
$keyarrary[8] = ""
$keyarrary[9] = ""
$keyarrary[10] = ""
$keyarrary[11] = ""
$keyarrary[12] = ""
$keyarrary[13] = ""
$keyarrary[14] = ""
$keyarrary[15] = ""
$keyarrary[16] = ""
$keyarrary[17] = ""
$keyarrary[18] = ""
$keyarrary[19] = ""
$keyarrary[20] = ""
$keyarrary[21] = ""
$keyarrary[22] = ""
$keyarrary[23] = ""
$keyarrary[24] = ""
Global $keylist[126]
$keylist[0] = ""
$keylist[1] = "Left"
$keylist[2] = "Right"
$keylist[3] = "Windows 2000/XP: X1 mouse button CAN NOT SEND"
$keylist[4] = "Middle"
$keylist[5] = "Windows 2000/XP: X2 mouse button CAN NOT SEND"
$keylist[6] = ""
$keylist[7] = "{CTRL}"
$keylist[8] = "{BACKSPACE}"
$keylist[9] = "{TAB}"
$keylist[10] = ""
$keylist[11] = ""
$keylist[12] = ""
$keylist[13] = "{NUMPADENTER}"
$keylist[14] = ""
$keylist[15] = ""
$keylist[16] = "{SHIFT}"
$keylist[17] = "{CTRL}"
$keylist[18] = "{ALT}"
$keylist[19] = ""
$keylist[20] = "{CAPSLOCK toggle}"
$keylist[21] = ""
$keylist[22] = ""
$keylist[23] = "{PGUP}"
$keylist[24] = "{PGDN}"
$keylist[25] = "{END}"
$keylist[26] = "{HOME}"
$keylist[27] = "{ESC}"
$keylist[28] = ""
$keylist[29] = ""
$keylist[30] = ""
$keylist[31] = ""
$keylist[32] = "{SPACE}"
$keylist[33] = ""
$keylist[34] = ""
$keylist[35] = ""
$keylist[36] = ""
$keylist[37] = "{LEFT}"
$keylist[38] = "{UP}"
$keylist[39] = "{RIGHT}"
$keylist[40] = "{DOWN}"
$keylist[41] = ""
$keylist[42] = ""
$keylist[43] = ""
$keylist[44] = ""
$keylist[45] = "{INSERT}"
$keylist[46] = "{DEL}"
$keylist[47] = ""
$keylist[48] = "0"
$keylist[49] = "1"
$keylist[50] = "2"
$keylist[51] = "3"
$keylist[52] = "4"
$keylist[53] = "5"
$keylist[54] = "6"
$keylist[55] = "7"
$keylist[56] = "8"
$keylist[57] = "9"
$keylist[58] = ""
$keylist[59] = ""
$keylist[60] = ""
$keylist[61] = ""
$keylist[62] = ""
$keylist[63] = ""
$keylist[64] = ""
$keylist[65] = "A"
$keylist[66] = "B"
$keylist[67] = "C"
$keylist[68] = "D"
$keylist[69] = "E"
$keylist[70] = "F"
$keylist[71] = "G"
$keylist[72] = "H"
$keylist[73] = "I"
$keylist[74] = "J"
$keylist[75] = "K"
$keylist[76] = "L"
$keylist[77] = "M"
$keylist[78] = "N"
$keylist[79] = "O"
$keylist[80] = "P"
$keylist[81] = "Q"
$keylist[82] = "R"
$keylist[83] = "S"
$keylist[84] = "T"
$keylist[85] = "U"
$keylist[86] = "V"
$keylist[87] = "W"
$keylist[88] = "X"
$keylist[89] = "Y"
$keylist[90] = "Z"
$keylist[91] = ""
$keylist[92] = ""
$keylist[93] = ""
$keylist[94] = ""
$keylist[95] = ""
$keylist[96] = ""
$keylist[97] = ""
$keylist[98] = ""
$keylist[99] = ""
$keylist[100] = ""
$keylist[101] = ""
$keylist[102] = ""
$keylist[103] = ""
$keylist[104] = ""
$keylist[105] = ""
$keylist[106] = "{NUMPADMULT}"
$keylist[107] = "{NUMPADADD}"
$keylist[108] = ""
$keylist[109] = "{NUMPADSUB}"
$keylist[110] = "{NUMPADDOT}"
$keylist[111] = "{NUMPADDIV}"
$keylist[112] = "{F1}"
$keylist[113] = "{F2}"
$keylist[114] = "{F3}"
$keylist[115] = "{F4}"
$keylist[116] = "{F5}"
$keylist[117] = "{F6}"
$keylist[118] = "{F7}"
$keylist[119] = "{F8}"
$keylist[120] = "{F9}"
$keylist[121] = "{F10}"
$keylist[122] = "{F11}"
$keylist[123] = "{F12}"
$keylist[123] = ""
$keylist[124] = ""
$keylist[125] = ""
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
Global $result[2]
$result[0] = 0
Global $array[6]
$array[0] = 0
$array[1] = 0
$array[2] = 0
$array[3] = 0
$array[4] = 0
$array[5] = 0
Global $i = 0
Global $Paused
Global $equiparmor, $outoftime
Global $castingtimer, $castingtimerdif, $notcasting
Global $EquipDelay = 11000, $time5 = $EquipDelay
Global $EquipDelay2 = 200000, $time6 = $EquipDelay2
$dll = DllOpen("user32.dll")


;/***************************************************************************************************************************************************************************************************

#Region ### START Koda GUI section ### Form=c:\program files\autoit3\rapidmacroreleasesource\form1.kxf
$Form1_1 = GUICreate("Rapid Macro 1.0 By: Diminished Hail", 634, 448, 192, 124)
$MenuItem1 = GUICtrlCreateMenu("&File")
$MenuItem2 = GUICtrlCreateMenuItem("Exit", $MenuItem1)
$MenuItem3 = GUICtrlCreateMenu("&About")
$MenuItem4 = GUICtrlCreateMenuItem("Author", $MenuItem3)
$combobox = GUICtrlCreateCombo("", 348, 92, 245, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Unsheathe Key|Health to Mana|GUI Mode Key|Food 2|Food 3|Slot 1 (Weapon)|Slot 2 (Staff)|Slot 3 (Food 1)|Slot 4 (Special Attack)|Slot 5 (Mana to Stam)|Slot 6 (Disease / Arrow Ward / Etc...)|Slot 7 (Melee Haste / Rapid Shot / Etc...)|Slot 8 (Ironskin / Etc...)|Slot 9 (Sacrafice / Heal Other / Witches Brew )|Slot 0 (Sacrafice / Heal Other / Witches Brew )|Armor Slot 1 (Helm)|Armor Slot 2 (Shoulders)|Armor Slot 3 (Arms)|Armor Slot 4 (Elbows)|Armor Slot 5 (Hands)|Armor Slot 6 (Boots)|Armor Slot 7 (Greaves)|Armor Slot 8 (Girdle)|Armor Slot 9 (Legs)|Armor Slot 0 (Chest)")
$Radio1 = GUICtrlCreateRadio("On", 14, 42, 37, 17)
$Radio2 = GUICtrlCreateRadio("Off", 58, 42, 39, 17)
$Radio3 = GUICtrlCreateRadio("Dummy Mode", 108, 36, 89, 27)
$Label1 = GUICtrlCreateLabel("Auto Equip Armor:", 18, 10, 177, 28)
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
$Button1 = GUICtrlCreateButton("Start", 280, 390, 75, 25, $WS_GROUP)
GUICtrlSetState(-1, $GUI_DISABLE)
$Input1 = GUICtrlCreateInput($InputDiseaseREG, 200, 90, 121, 21)
$Input2 = GUICtrlCreateInput($InputHasteREG, 200, 130, 121, 21)
$Input3 = GUICtrlCreateInput($InputIronskinREG, 200, 170, 121, 21)
$Input4 = GUICtrlCreateInput($AttackDelayREG, 200, 210, 121, 21)
$Input5 = GUICtrlCreateInput($VMWareREG, 200, 250, 121, 21)
$Checkbox1 = GUICtrlCreateCheckbox("Disease / Arrow Ward / Etc", 10, 90, 157, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Melee Haste / Rapid Shot", 10, 130, 147, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Ironskin / Etc", 10, 170, 97, 17)
$Label4 = GUICtrlCreateLabel("Weapon C/D", 10, 210, 97, 17)
GUICtrlSetTip(-1, "How long it takes for you to fully swing your weapon one time so the script can use the special attack.")
$Label5 = GUICtrlCreateLabel("VM Ware Slowdown (Default 150)", 10, 250, 177, 17)
$Label2 = GUICtrlCreateLabel("Hot Key Bindings", 390, 60, 164, 28)
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("Save", 430, 250, 75, 25, $WS_GROUP)
GUICtrlSetState(-1, $GUI_DISABLE)
$Label3 = GUICtrlCreateLabel("", 390, 140, 140, 97)
$Label6 = GUICtrlCreateLabel("GM Response:", 10, 290, 142, 28)
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
$Input6 = GUICtrlCreateInput($GMResponseReg, 10, 320, 271, 21)
$Checkbox4 = GUICtrlCreateCheckbox("CTRL", 330, 210, 47, 27)
$Checkbox5 = GUICtrlCreateCheckbox("ALT", 330, 230, 47, 27)
$Checkbox6 = GUICtrlCreateCheckbox("SHIFT", 330, 190, 47, 27)
$button3 = GUICtrlCreateButton("Read", 430, 280, 75, 25, $WS_GROUP)
$Label7 = GUICtrlCreateLabel("Special Attack Cooldown", 340, 330, 123, 17)
$Input7 = GUICtrlCreateInput($SpecialAttackCDREG, 470, 326, 121, 21)
$label8 = GUICtrlCreateLabel("Casting Cooldown (Default 0)", 370, 355, 100, 30)
$Input8 = GUICtrlCreateInput($castingwaitREG, 470, 360, 121, 21)
GUICtrlSetState($Checkbox4, $GUI_DISABLE)
GUICtrlSetState($Checkbox5, $GUI_DISABLE)
GUICtrlSetState($Checkbox6, $GUI_DISABLE)
GUISetState(@SW_SHOW)
Dim $Form1_1_AccelTable[2][2] = [["+0", $MenuItem2],["!+{F1}", $MenuItem4]]
GUISetAccelerators($Form1_1_AccelTable)
#EndRegion ### END Koda GUI section ###

;/***************************************************************************************************************************************************************************************************

HotKeySet("{DEL}", "TogglePause")
HotKeySet("{END}", "Terminate")

;/***************************************************************************************************************************************************************************************************

Do
	$nMsg = GUIGetMsg()
	If $nMsg = $MenuItem2 Then
		DllClose($dll)
		Exit
	EndIf
	If $nMsg = $MenuItem4 Then GUICtrlSetData($Label3, "Author: Diminished Hail")
	If $nMsg = $button3 Then
		$add1 = ""
		$add2 = ""
		$add3 = ""
		GUICtrlSetState($Checkbox4, $GUI_UNCHECKED)
		GUICtrlSetState($Checkbox5, $GUI_UNCHECKED)
		GUICtrlSetState($Checkbox6, $GUI_UNCHECKED)
		GUICtrlSetState($Checkbox4, $GUI_Enable)
		GUICtrlSetState($Checkbox5, $GUI_Enable)
		GUICtrlSetState($Checkbox6, $GUI_Enable)
		For $i = 0 To 25
			Select
				Case GUICtrlRead($combobox) = $comboxarray[$i]
					$num = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", $regarray[$i])
					GUICtrlSetData($Label3, "Previous hokey is..." & $num)
					GUICtrlSetState($Button2, $GUI_Enable)
			EndSelect
		Next
	EndIf
	Select
		Case $nMsg = $Button2
			GUICtrlSetState($Checkbox4, $GUI_DISABLE)
			GUICtrlSetState($Checkbox5, $GUI_DISABLE)
			GUICtrlSetState($Checkbox6, $GUI_DISABLE)
			$state = GUICtrlRead($Checkbox4)
			If $state = 1 Then $add1 = "^"
			$state = GUICtrlRead($Checkbox5)
			If $state = 1 Then $add2 = "!"
			$state = GUICtrlRead($Checkbox6)
			If $state = 1 Then $add3 = "+"
			For $i = 0 To 25
				Select
					Case GUICtrlRead($combobox) = $comboxarray[$i]
						$num = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", $regarray[$i])
						Call("gethotkey", $num)
						If $hotkey <> "left" Or $hotkey <> "right" Or $hotkey <> "middle" Then
							$send = $add1 & $add2 & $add3 & $hotkey
						EndIf
						RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", $regarray[$i], "REG_SZ", $send)
						GUICtrlSetData($Label3, $send & "...Saved!")
						GUICtrlSetState($Button2, $GUI_DISABLE)
				EndSelect
			Next
	EndSelect
	$read = GUICtrlRead($Checkbox1)
	If $read = 4 Then
		$CastDisease = -1
	Else
		$CastDisease = GUICtrlRead($Input1)
		$time3 = $CastDisease
	EndIf
	$read = GUICtrlRead($Checkbox2)
	If $read = 4 Then
		$CastHaste = -1
	Else
		$CastHaste = GUICtrlRead($Input2)
		$time2 = $CastHaste
	EndIf
	$read = GUICtrlRead($Checkbox3)
	If $read = 4 Then
		$CastIron = -1
	Else
		$CastIron = GUICtrlRead($Input3)
		$time1 = $CastIron
	EndIf
	Select
		Case $nMsg = $Button1
			$Label3 = GUICtrlCreateLabel("Starting...", 390, 140, 140, 97)
			$read = GUICtrlRead($Input8)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputCastingWait", "REG_SZ", $read)
			$read = GUICtrlRead($Input7)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputSpecialAttackCD", "REG_SZ", $read)
			$read = GUICtrlRead($Input6)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputGMResponse", "REG_SZ", $read)
			$read = GUICtrlRead($Input4)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputAttackDelay", "REG_SZ", $read)
			$read = GUICtrlRead($Input5)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputVMwareDelay", "REG_SZ", $read)
			$read = GUICtrlRead($Input3)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputIronSkin", "REG_SZ", $read)
			$read = GUICtrlRead($Input1)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputDisease", "REG_SZ", $read)
			$read = GUICtrlRead($Input2)
			RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputHaste", "REG_SZ", $read)
			;****************************************************************************************
			$castingwait = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputCastingWait")
			$SpecialAtk = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "inputSpecialAttackCD")
			$time4 = $SpecialAtk
			$unsheathe = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "UnsheatheKey")
			$Slot1 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot1")
			$Slot2 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot2")
			$slot3 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot3")
			$slot4 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot4")
			$slot5 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot5")
			$slot6 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot6")
			$slot7 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot7")
			$slot8 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot8")
			$slot9 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot9")
			$Slot0 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Slot0")
			$FOOD2 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Food2")
			$FOOD3 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "Food3")
			$HTMK = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "HealthToMana")
			$guimode = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "guiModeKey")
			Global $functionarrary[12]
			$functionarrary[0] = 10
			$functionarrary[1] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot1")
			$functionarrary[2] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot2")
			$functionarrary[3] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot3")
			$functionarrary[4] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot4")
			$functionarrary[5] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot5")
			$functionarrary[6] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot6")
			$functionarrary[7] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot7")
			$functionarrary[8] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot8")
			$functionarrary[9] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot9")
			$functionarrary[10] = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\DimsMacro", "ArmorSlot0")
			$menuGO = 500
	EndSelect
	Select
		Case $nMsg = $Radio1
			GUICtrlSetState($Button1, $GUI_Enable)
			$equiparmor = True
			$dummymode = False
		Case $nMsg = $Radio2
			GUICtrlSetState($Button1, $GUI_Enable)
			$equiparmor = False
			$dummymode = False
		Case $nMsg = $Radio3
			GUICtrlSetState($Button1, $GUI_Enable)
			$equiparmor = True
			$dummymode = True
	EndSelect
Until $menuGO = 500

;/***************************************************************************************************************************************************************************************************
GUIDelete()

Func Terminate()
	DllClose($dll)
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
		If $go = 0 Then ToolTip("Script is getting self hp position.", 0, 0)
		If $go = 1 Then ToolTip("Script is getting target hp position.", 0, 0)
		If $go = 2 Then ToolTip("Script is getting stam position.", 0, 0)
		If $go = 3 Then ToolTip("Script is getting mana position.", 0, 0)
		$result = _ImageSearch("images\stat-selfhp.bmp", 1, $x1, $y1, 30)
		If $result And $go = 0 Then
			ToolTip("Script is getting self health bar position", 0, 0)
			$healthx = $x1 + 30
			$healthy = $y1
			$pixVar = PixelGetColor($healthx, $y1)
			$fullhealthcolor = $pixVar
			$go = 1
		EndIf
		;	If $go = 1 Then
		;		ToolTip("Script is getting target health bar position", 0, 0)
		;		WinActivate("Darkfall Online", "")
		;		Sleep(500)
		;		$size = WinGetClientSize("Darkfall Online")
		;		$xcen = $size[0] / 2
		;		$ycen = $size[1] / 2
		;		$x1 = $xcen + 0
		;		Do
		;			$x1 = $x1 + 1
		;			$y1 = $ycen + 0
		;			Do
		;				$y1 = $y1 + 1
		;				$pixVar = PixelGetColor($x1, $y1)
		;			Until $pixVar = $fullhealthcolor Or $y1 > ($ycen + 60)
		;		Until $x1 > $size[0] Or $pixVar = $fullhealthcolor
		;		$notargetcolor = PixelGetColor($x1, $y1)
		;		$notargetx = $x1
		;		$notargety = $y1
		;		$lowTargetHealthx = $x1 + 25
		;		$targhealthy = $y1
		;		$lowTargetHealthColor = PixelGetColor(($x1 + 25), $y1)
		;		$fullTargetHealthColor = PixelGetColor(($x1 + 75), $y1)
		;		$fullTargetHealthx = $x1 + 75
		;		$go = 2
		;	EndIf
		$result = _ImageSearch("images\stat-targethp.bmp", 1, $x1, $y1, 35)
		If $result And $go = 1 Then
			If $y1 <> $healthy And $x1 <> $healthx Then
				$targhealthy = $y1
				$notargetx = $x1 - 45
				$notargety = $y1
				$lowTargetHealthx = $x1 - 25
				$fullTargetHealthx = $x1 + 25
				$notargetcolor = PixelGetColor($x1, $y1)
				$pixVar = PixelGetColor($lowTargetHealthx, $y1)
				$lowTargetHealthColor = $pixVar
				$pixVar = PixelGetColor($fullTargetHealthx, $y1)
				$fullTargetHealthColor = $pixVar
				$go = 2
			EndIf
		EndIf
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
If $dummymode = True Then Call("dummymode")
If $dummymode = False Then Call("melee")
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
					ToolTip("Paused, no target found.", 0, 0)
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
				Send($slot4)
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

Func Dummymode()
	While 1
		ToolTip("Script is being a dummy.", 0, 0)
		If Not WinActive("Darkfall Online") Then Call("TogglePause")
		$dif = TimerDiff($time6)
		If $dif >= $EquipDelay2 Then
			ToolTip("Script is checking your armor.", 0, 0)
			Call("armor")
			$time6 = TimerInit()
		EndIf
		$pixVar = PixelGetColor($notargetx, $notargety)
		If $pixVar <> $notargetcolor Then
			Do
				ToolTip("Paused, no target found.", 0, 0)
				Sleep(100)
				$pixVar = PixelGetColor($notargetx, $notargety)
			Until $pixVar = $notargetcolor
		EndIf
		Call("GMCHECK")
		Call("ironskin")
		Call("meleehaste")
		Call("disease")
	WEnd
EndFunc   ;==>Dummymode

Func getmana()
	$pixVar = PixelGetColor($manax, $manay)
	If $pixVar <> $fullmanacolor Then
		Call("Checkstaff")
		Sleep(250)
		Call("waitforcast")
		ToolTip("Script is casting health to mana", 0, 0)
		Send($HTMK)
		Sleep($VMWare)
		MouseClick("left")
		Sleep(250)
		Call("startcast")
	EndIf
EndFunc   ;==>getmana

Func getstam()
	$pixVar = PixelGetColor($stamx, $stamy)
	If $pixVar <> $fullstamcolor Then
		Call("Checkstaff")
		Sleep(250)
		Call("waitforcast")
		ToolTip("Script is casting mana to stam", 0, 0)
		Send($slot5)
		Sleep($VMWare)
		MouseClick("left")
		Sleep(250)
		Call("startcast")
	EndIf
	$result = _ImageSearch("images\misc-nourished.bmp", 1, $x1, $y1, 30)
	If Not $result Then
		Send($slot3) ;food
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
					ToolTip("Paused, no target found.", 0, 0)
					Sleep(100)
					$pixVar2 = PixelGetColor($notargetx, $notargety)
				Until $pixVar2 = $notargetcolor
			EndIf
			If Not WinActive("Darkfall Online") Then Call("TogglePause")
			Call("CheckStaff")
			Sleep(250)
			ToolTip("Script is healing the target.", 0, 0)
			Send($slot9)
			Sleep(500)
			Sleep($VMWare)
			MouseClick("left")
			Sleep(500)
			Send($Slot0)
			Sleep(500)
			Sleep($VMWare)
			MouseClick("left")
			Sleep(500)
			$pixVar = PixelGetColor($fullTargetHealthx, $targhealthy)
		Until $fullTargetHealthColor = $pixVar
		Sleep(250)
		Call("startcast")
	EndIf
EndFunc   ;==>getstats

Func CheckStaff()
	Send($Slot0)
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
		Sleep(250)
		Call("waitforcast")
		ToolTip("Script is casting ironskin.", 0, 0)
		Send($slot8) ;ironskin
		Sleep($VMWare)
		MouseClick("left")
		Call("startcast")
		Sleep(250)
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
		Sleep(250)
		Call("waitforcast")
		ToolTip("Script is casting melee haste.", 0, 0)
		Send($slot7) ;meleehaste
		Sleep($VMWare)
		MouseClick("left")
		Call("startcast")
		Sleep(250)
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
		Sleep(250)
		Call("waitforcast")
		ToolTip("Script is casting disease.", 0, 0)
		Send($slot6) ;disease
		Sleep($VMWare)
		MouseClick("left")
		Call("startcast")
		Sleep(250)
		$time3 = TimerInit()
	EndIf
EndFunc   ;==>Disease

Func Sword()
	$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
	If Not $result Then
		Send($Slot1)
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

			Do
				$result = _ImageSearch("images\weapons\wpn-selected.bmp", 1, $x1, $y1, 30)
				Send($Slot1)
				Sleep(1000)
				Send($unsheathe)
			Until Not $result
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
			If $hotkey <> "left" Or $hotkey <> "right" Or $hotkey <> "middle" Then
				Send($guimode)
			Else
				MouseClick($guimode)
			EndIf
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
	Sleep(500)
	Sleep($castingwait)
EndFunc   ;==>Waitforcast

Func UnsheatheStaffFunc()
	Do
		If Not WinActive("Darkfall Online") Then Call("TogglePause")
		Send($Slot2)
		Sleep(100)
		$result = _ImageSearch("images\misc-nospell.bmp", 1, $x1, $y1, 30)
		$result2 = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
		Send($unsheathe)
		Sleep(200)
		Send($Slot0)
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
		Send($Slot1)
		Sleep(400)
		$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
		Send($unsheathe)
		Sleep(400)
		$result = _ImageSearch($weaponimage, 1, $x1, $y1, 30)
	Until $result
EndFunc   ;==>UnsheatheWeaponFunc

Func _ImageSearch($findImage, $resultPosition, ByRef $x, ByRef $y, $tolerance)
	Return _ImageSearchArea($findImage, $resultPosition, 0, 0, @DesktopWidth, @DesktopHeight, $x, $y, $tolerance)
EndFunc   ;==>_ImageSearch

Func _ImageSearchArea($findImage, $resultPosition, $x1, $y1, $right, $bottom, ByRef $x, ByRef $y, $tolerance)
	;MsgBox(0,"asd","" & $x1 & " " & $y1 & " " & $right & " " & $bottom)
	If $tolerance > 0 Then $findImage = "*" & $tolerance & " " & $findImage
	$result = DllCall("ImageSearchDLL.dll", "str", "ImageSearch", "int", $x1, "int", $y1, "int", $right, "int", $bottom, "str", $findImage)

	; If error exit
	If $result[0] = "0" Then Return 0

	; Otherwise get the x,y location of the match and the size of the image to
	; compute the centre of search
	$array = StringSplit($result[0], "|")

	$x = Int(Number($array[2]))
	$y = Int(Number($array[3]))
	If $resultPosition = 1 Then
		$x = $x + Int(Number($array[4]) / 2)
		$y = $y + Int(Number($array[5]) / 2)
	EndIf
	Return 1
EndFunc   ;==>_ImageSearchArea

Func _IsPressed($sHexKey, $vDLL = 'user32.dll')
	; $hexKey must be the value of one of the keys.
	; _Is_Key_Pressed will return 0 if the key is not pressed, 1 if it is.
	Local $a_R = DllCall($vDLL, "short", "GetAsyncKeyState", "int", '0x' & $sHexKey)
	If @error Then Return SetError(@error, @extended, False)
	Return BitAND($a_R[0], 0x8000) <> 0
EndFunc   ;==>_IsPressed

Func gethotkey($current)
	Local $key = False
	Local $z
	$Label3 = GUICtrlCreateLabel("Please press your hotkey...Previous is: " & $current, 390, 140, 140, 97)
	Do
		For $i = 1 To 125
			If _IsPressed(Hex($i, 2), $dll) Then
				$z = Hex($i, 2)
				$key = _IsPressed(Hex($i, 2), $dll)
				$hotkey = $keylist[$i]
				GUICtrlSetData($Label3, Hex($i, 2))
				Sleep(1000)
			EndIf
		Next
	Until $key
EndFunc   ;==>gethotkey
