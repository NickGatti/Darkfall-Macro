HotKeySet("{TAB}", "Activate")

While 1
WEnd

Func activate()
	Opt("SendKeyDownDelay", 10)
	Send("c")
	Opt("SendKeyDownDelay", 1)
EndFunc   ;==>activate
