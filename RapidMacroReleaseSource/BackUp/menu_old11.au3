#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include "FontConstants.au3"
#include "StructureConstants.au3"
#include "WinAPIError.au3"
$dll = DllOpen("user32.dll")
Global $hotkey
Global $comboxarray[21]
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
$comboxarray[15] = "Armor Slot 1 (Helm)|Armor Slot 2 (Shoulders)"
$comboxarray[16] = "Armor Slot 3 (Arms)|Armor Slot 4 (Elbows)"
$comboxarray[17] = "Armor Slot 5 (Hands)|Armor Slot 6 (Boots)"
$comboxarray[18] = "Armor Slot 7 (Greaves)|Armor Slot 8 (Girdle)"
$comboxarray[19] = "Armor Slot 9 (Legs)"
$comboxarray[20] = "Armor Slot 0 (Chest)"
Global $keyarrary[21]
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
Global $keylist[126]
$keylist[0] = ""
$keylist[1] = "Left Mouse Button CAN NOT SEND"
$keylist[2] = "Right Mouse Button CAN NOT SEND"
$keylist[3] = "Windows 2000/XP: X1 mouse button CAN NOT SEND"
$keylist[4] = "Middle Mouse Button CAN NOT SEND"
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
$keylist[27] = ""
$keylist[28] = "{ESC}"
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
$keylist[110] = ""
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
#Region ### START Koda GUI section ### Form=c:\program files\autoit3\rapidmacroreleasesource\form1.kxf
$Form1_1 = GUICreate("Group Sex 3.2", 634, 448, 192, 124)
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
$Input1 = GUICtrlCreateInput("", 200, 90, 121, 21)
$Input2 = GUICtrlCreateInput("", 200, 130, 121, 21)
$Input3 = GUICtrlCreateInput("", 200, 170, 121, 21)
$Input4 = GUICtrlCreateInput("", 200, 210, 121, 21)
$Input5 = GUICtrlCreateInput("", 200, 250, 121, 21)
$Checkbox1 = GUICtrlCreateCheckbox("Disease / Arrow Ward / Etc", 10, 90, 157, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Melee Haste / Rapid Shot", 10, 130, 147, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Ironskin / Etc", 10, 170, 97, 17)
$Checkbox4 = GUICtrlCreateCheckbox("Weapon C/D", 10, 210, 97, 17)
GUICtrlSetTip(-1, "How long it takes for you to fully swing your weapon one time so the script can use the special attack.")
$Checkbox5 = GUICtrlCreateCheckbox("VM Ware Slowdown (Default 150)", 10, 250, 177, 17)
$Label2 = GUICtrlCreateLabel("Hot Key Bindings", 390, 60, 164, 28)
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("Save", 430, 250, 75, 25, $WS_GROUP)
$Label3 = GUICtrlCreateLabel("", 390, 140, 140, 97)
GUISetState(@SW_SHOW)
Dim $Form1_1_AccelTable[2][2] = [["+0", $MenuItem2],["!+{F1}", $MenuItem4]]
GUISetAccelerators($Form1_1_AccelTable)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			DllClose($dll)
			Exit
	EndSwitch
	If $nMsg = $MenuItem2 Then
		DllClose($dll)
		Exit
	EndIf
	If $nMsg = $MenuItem4 Then $Label3 = GUICtrlCreateLabel("Author: Diminished Hail", 390, 140, 140, 97)







	Select
		Case $nMsg = $Button2
			For $i = 0 To 21
			Select
				Case GUICtrlRead($combobox) = $comboxarray[$i]
					Call("gethotkey")
					$keyarrary[$i] = $hotkey
					$Label3 = GUICtrlCreateLabel($hotkey & "...Saved!", 390, 140, 140, 97)
			EndSelect
			Next
	EndSelect






WEnd

Func _IsPressed($sHexKey, $vDLL = 'user32.dll')
	; $hexKey must be the value of one of the keys.
	; _Is_Key_Pressed will return 0 if the key is not pressed, 1 if it is.
	Local $a_R = DllCall($vDLL, "short", "GetAsyncKeyState", "int", '0x' & $sHexKey)
	If @error Then Return SetError(@error, @extended, False)
	Return BitAND($a_R[0], 0x8000) <> 0
EndFunc   ;==>_IsPressed

Func gethotkey()
	Local $key = False
	Local $z
	$Label3 = GUICtrlCreateLabel("Please press your hotkey...", 390, 140, 140, 97)
	Do
		For $i = 1 To 125
			If _IsPressed(Hex($i, 2), $dll) Then
				$z = Hex($i, 2)
				$key = _IsPressed(Hex($i, 2), $dll)
				$hotkey = $keylist[$i]
				;$Label3 = GUICtrlCreateLabel($keylist[$i] & "...Saved!", 390, 140, 140, 97)
				;$Label3 = GUICtrlCreateLabel(Hex($i, 2), 390, 140, 140, 97)
			EndIf
		Next
	Until $key
EndFunc   ;==>gethotkey
