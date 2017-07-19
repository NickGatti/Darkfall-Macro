#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
$dll = DllOpen("user32.dll")
Global $keylist[126]
$keylist[0] = "Left mouse button"
$keylist[1] = "Right mouse button"
$keylist[2] = "Middle mouse button (three-button mouse)"
$keylist[3] = "Windows 2000/XP: X1 mouse button"
$keylist[4] = "Windows 2000/XP: X2 mouse button"
$keylist[5] = "BACKSPACE key"
$keylist[6] = "TAB key"
$keylist[7] = "CLEAR key"
$keylist[8] = "ENTER key"
$keylist[9] = "SHIFT key"
$keylist[10] = "CTRL key"
$keylist[11] = "ALT key"
$keylist[12] = "PAUSE key"
$keylist[13] = "CAPS LOCK key"
$keylist[14] = "ESC key"
$keylist[15] = "SPACEBAR"
$keylist[16] = "PAGE UP key"
$keylist[17] = "PAGE DOWN key"
$keylist[18] = "END key"
$keylist[19] = "HOME key"
$keylist[20] = "LEFT ARROW key"
$keylist[21] = "UP ARROW key"
$keylist[22] = "RIGHT ARROW key"
$keylist[23] = "DOWN ARROW key"
$keylist[24] = "SELECT key"
$keylist[25] = "PRINT key"
$keylist[26] = "EXECUTE key"
$keylist[27] = "PRINT SCREEN key"
$keylist[28] = "INS key"
$keylist[29] = "DEL key"
$keylist[30] = "0 key"
$keylist[31] = "1 key"
$keylist[32] = "2 key"
$keylist[33] = "3 key"
$keylist[34] = "4 key"
$keylist[35] = "5 key"
$keylist[36] = "6 key"
$keylist[37] = "7 key"
$keylist[38] = "8 key"
$keylist[39] = "9 key"
$keylist[40] = "A key"
$keylist[41] = "B key"
$keylist[42] = "C key"
$keylist[43] = "D key"
$keylist[44] = "E key"
$keylist[45] = "F key"
$keylist[46] = "G key"
$keylist[47] = "H key"
$keylist[48] = "I key"
$keylist[49] = "J key"
$keylist[50] = "K key"
$keylist[51] = "L key"
$keylist[52] = "M key"
$keylist[53] = "N key"
$keylist[54] = "O key"
$keylist[55] = "P key"
$keylist[56] = "Q key"
$keylist[57] = "R key"
$keylist[58] = "S key"
$keylist[59] = "T key"
$keylist[60] = "U key"
$keylist[61] = "V key"
$keylist[62] = "W key"
$keylist[63] = "X key"
$keylist[64] = "Y key"
$keylist[65] = "Z key"
$keylist[66] = "Left Windows key"
$keylist[67] = "Right Windows key"
$keylist[68] = "Numeric keypad 0 key"
$keylist[69] = "Numeric keypad 1 key"
$keylist[70] = "Numeric keypad 2 key"
$keylist[71] = "Numeric keypad 3 key"
$keylist[72] = "Numeric keypad 4 key"
$keylist[73] = "Numeric keypad 5 key"
$keylist[74] = "Numeric keypad 6 key"
$keylist[75] = "Numeric keypad 7 key"
$keylist[76] = "Numeric keypad 8 key"
$keylist[77] = "Numeric keypad 9 key"
$keylist[78] = "Multiply key"
$keylist[79] = "Add key"
$keylist[80] = "Separator key"
$keylist[81] = "Subtract key"
$keylist[82] = "Decimal key"
$keylist[83] = "Divide key"
$keylist[84] = "F1 key"
$keylist[85] = "F2 key"
$keylist[86] = "F3 key"
$keylist[87] = "F4 key"
$keylist[88] = "F5 key"
$keylist[89] = "F6 key"
$keylist[90] = "F7 key"
$keylist[91] = "F8 key"
$keylist[92] = "F9 key"
$keylist[93] = "F10 key"
$keylist[94] = "F11 key"
$keylist[95] = "F12 key"
$keylist[96] = "F13 key"
$keylist[97] = "F14 key"
$keylist[98] = "F15 key"
$keylist[99] = "F16 key"
$keylist[100] = "F17 key"
$keylist[101] = "F18 key"
$keylist[102] = "F19 key"
$keylist[103] = "F20 key"
$keylist[104] = "F21 key"
$keylist[105] = "F22 key"
$keylist[106] = "F23 key"
$keylist[107] = "F24 key"
$keylist[108] = "NUM LOCK key"
$keylist[109] = "SCROLL LOCK key"
$keylist[110] = "Left SHIFT key"
$keylist[111] = "Right SHIFT key"
$keylist[112] = "Left CONTROL key"
$keylist[113] = "Right CONTROL key"
$keylist[114] = "Left MENU key"
$keylist[115] = "Right MENU key"
$keylist[116] = ";"
$keylist[117] = "="
$keylist[118] = ","
$keylist[119] = "-"
$keylist[120] = "."
$keylist[121] = "/"
$keylist[122] = "`"
$keylist[123] = "["
$keylist[124] = "\"
$keylist[125] = "]"
#Region ### START Koda GUI section ### Form=c:\program files\autoit3\rapidmacroreleasesource\form1.kxf
$Form1_1 = GUICreate("Group Sex 3.2", 634, 448, 192, 124)
$MenuItem1 = GUICtrlCreateMenu("&File")
$MenuItem2 = GUICtrlCreateMenuItem("Exit", $MenuItem1)
$MenuItem3 = GUICtrlCreateMenu("&About")
$MenuItem4 = GUICtrlCreateMenuItem("Author", $MenuItem3)
GUICtrlCreateCombo("", 348, 92, 245, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
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
$Label3 = GUICtrlCreateLabel("$", 390, 140, 140, 97)
GUISetState(@SW_SHOW)
Dim $Form1_1_AccelTable[2][2] = [["+0", $MenuItem2],["!+{F1}", $MenuItem4]]
GUISetAccelerators($Form1_1_AccelTable)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
	If $nMsg = $MenuItem2 Then Exit
	If $nMsg = $Button2 Then
		Local $key
		$Label3 = GUICtrlCreateLabel("Please press your hotkey..." , 390, 140, 140, 97)
		Do
			For $i = 0 To 125
				If _IsPressed(Hex($i,2),$DLL) Then
					$key = _IsPressed(Hex($i,2),$DLL)
					$Label3 = GUICtrlCreateLabel($keylist[$i], 390, 140, 140, 97)
				EndIf
			Next
		Until $key
	EndIf
WEnd
