#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
$dll = DllOpen("user32.dll")
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
$Input1 = GUICtrlCreateInput("Input1", 200, 90, 121, 21)
$Input2 = GUICtrlCreateInput("Input2", 200, 130, 121, 21)
$Input3 = GUICtrlCreateInput("Input3", 200, 170, 121, 21)
$Input4 = GUICtrlCreateInput("Input4", 200, 210, 121, 21)
$Input5 = GUICtrlCreateInput("Input5", 200, 250, 121, 21)
$Checkbox1 = GUICtrlCreateCheckbox("Melee Haste / Rapid Shot", 10, 130, 147, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Disease / Arrow Ward / Etc", 10, 90, 157, 17)
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
		Do
			For $i = 0 To 255
				If _IsPressed(Hex($i, 2), $hDLL) Then
					ToolTip(Hex($i, 2))
				EndIf
			Next
		Until _IsPressed("BF", $dll)
	EndIf
WEnd;### Tidy Error -> while is never closed in your script.
