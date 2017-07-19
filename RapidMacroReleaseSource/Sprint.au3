HotKeySet("{TAB}", "SprintToggle")
HotKeySet("{Pause}", "TogglePause")
Global $Toggle
Global $Paused
$Toggle = Not $Toggle

While 1
	Sleep(100)
WEnd

Func SprintToggle()
	If $Toggle Then
		Send("{/ down}")
		$Toggle = Not $Toggle
		While 1
			Sleep(100)
		WEnd
		Sleep(100)
	ElseIf Not $Toggle Then
		Send("{/ up}")
		$Toggle = True
		While 1
			Sleep(100)
		WEnd
		Sleep(100)
	EndIf
	Sleep(100)
EndFunc   ;==>SprintToggle

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		;send("f")
		MouseClick("left")
		Sleep(100)
	WEnd
EndFunc   ;==>TogglePause
