;WinActivate("Darkfall Online", "")
Global $x, $y, $z, $xdistance, $xvarcurrent, $xvarstatic, $ydistance, $yvarcurrent, $yvarstatic
Global $Paused
Global $turn = False
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{HOME}", "FindLoc")
HotKeySet("{END}", "DifCoords")
Call("test")

While 1
WEnd

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip('Script is "Paused"', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

Func Test()
	Run("loader.exe")
	Do
		Sleep(100)
	Until WinExists("Darkfall Tools")
	Do
		Sleep(250)
		$text = WinGetText("Darkfall Tools", "")
		$var = StringLeft($text, 13)
		ControlCommand("Darkfall Tools", "", "[Class:SysTabControl32; instance:1]", "TabRight", "")
	Until "Debug Console" = $var
EndFunc   ;==>Test

Func GetCoords()
	$text = WinGetText("Darkfall Tools", "")
	$var = StringRight($text, 56)
	$coords = StringLeft($var, 30)
	$x = StringLeft($coords, 10)
	$coords = StringRight($coords, 20)
	$y = StringLeft($coords, 10)
	$coords = StringRight($coords, 16)
	$z = StringLeft($coords, 9)
	$heading = StringRight($coords, 7)
EndFunc   ;==>GetCoords

Func RecordCoords()
	Call("getcoords")
	$xvarstatic = Int($x)
	$yvarstatic = Int($y)
EndFunc   ;==>RecordCoords

Func DifCoords()
	Call("getcoords")
	$xvarcurrent = Int($x)
	$xdistance = Int($xvarstatic - $xvarcurrent)
	$yvarcurrent = Int($y)
	$ydistance = Int($yvarstatic - $yvarcurrent)
EndFunc   ;==>DifCoords

Func FindLoc()
	Send("{W down}")
	Call("DifCoords")
	$begin = TimerInit()
	$xtraveled = $xdistance
	Do
		Call("difcoords")
		ToolTip($xdistance, 0, 0)
		$xgo = $xvarstatic * 2
		$ygo = $yvarstatic * 2
		$direction = $xgo - $ygo
		If Int($direction) <> Int($heading) Then
					$xgo = $xvarstatic * 2
		$ygo = $yvarstatic * 2
		$direction = $xgo - $ygo
	EndIf
		If $xvarstatic < 0 And $yvarstatic < 0 Then
		EndIf
		If $xvarstatic < 0 And $yvarstatic > 0 Then
		EndIf
		If $xvarstatic > 0 And $yvarstatic < 0 Then
		EndIf
		If $xvarstatic > 0 And $yvarstatic > 0 Then
		EndIf
		$lowx = $xvarstatic - 50000
		$highx = $xvarstatic + 50000
		$lowy = $yvarstatic - 50000
		$highy = $yvarstatic + 50000
	Until ($xvarcurrent >= $lowx And $xvarcurrent <= $highx) And ($yvarcurrent >= $lowy And $yvarcurrent <= $highy)
	Send("{W up}")
	MsgBox(0, "", "sdfsdfsdf")
EndFunc   ;==>FindLoc








;Sudo
;load loader
;get control tab
;gui > check which locations you want to use > start program
;parse coords
;load location file
;parse loaction file
;check for tools staff resin etc...
;check for bank loc
;find heading for next location
;run
;find locations of nodes
;
;
;
;
;
;
;
;
;
;
;





