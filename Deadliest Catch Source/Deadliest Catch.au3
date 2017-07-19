#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Add_Constants=n
#AutoIt3Wrapper_Au3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
WinActivate("Darkfall Online", "")
#include <ImageSearch.au3>
Global $go = 0, $x1, $y1, $Paused, $posy
Global $Timer = 50000, $TimerDefault = $Timer, $pass
Global $unsheathe = "^{NumPadDiv}" ;<== Make this your unsheathe key ==>
Global $FPK = "1" ;Sword
Global $SK = "2" ;Staff
Global $MTSK = "3" ;Mana To Stam
HotKeySet("{DEL}", "TogglePause")
HotKeySet("{END}", "Terminate")

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

Do
	ToolTip("Script is getting stamina bar position.", 0, 0)
	$result = _ImageSearch("images\stat-selfstam.bmp", 1, $x1, $y1, 30)
	If $result = 1 Then
		$stamx = $x1 + 30
		$stamy = $y1
		$pixVar = PixelGetColor($stamx, $y1)
		$fullstamcolor = $pixVar
		$go = 1
	EndIf
Until $go = 1

While 1
	Call("EquipWeapon", $FPK)
	ToolTip('Script is fishing', 0, 0)
	$pos = MouseGetPos()
	$posy = $pos[1] + 40
	MouseMove($pos[0], $posy)
	Sleep(1000)
	MouseWheel("up", 10)
	Sleep(3000)
	MouseClick("Left")
	Do
		ToolTip('Script is waiting', 0, 0)
		Call("getstam")
		Sleep(100)
		$dif = TimerDiff($Timer)
	Until $dif > $TimerDefault Or $pass = True
	$pass = False
	$Timer = TimerInit()
WEnd

Func getstam()
	$pixVar = PixelGetColor($stamx, $stamy)
	If $pixVar <> $fullstamcolor Then
		Sleep(250)
		Send("s")
		Sleep(250)
		Call("EquipWeapon", $SK)
		ToolTip("Script is casting mana to stam", 0, 0)
		Send($MTSK)
		Sleep(150)
		MouseClick("left")
		$pass = True
		Sleep(4000)
	EndIf
EndFunc   ;==>getstam

Func EquipWeapon($sendkey)
	Sleep(350)
	$result = _ImageSearch("images/misc-fishicon.bmp", 1, $x1, $y1, 30)
	If $result = 0 Then
		Send($sendkey)
	EndIf
	Sleep(350)
	Do
		ToolTip('Script is equipping a weapon.', 0, 0)
		$result = _ImageSearch("images/misc-equipped.bmp", 1, $x1, $y1, 30)
		Send($sendkey)
		Sleep(350)
		$result = _ImageSearch("images/misc-equipped.bmp", 1, $x1, $y1, 30)
		Send($unsheathe)
		Sleep(350)
		$result = _ImageSearch("images/misc-equipped.bmp", 1, $x1, $y1, 30)
	Until $result = 0
EndFunc   ;==>EquipWeapon