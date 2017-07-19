WinActivate("Darkfall Online", "")
Global $x, $y, $z, $xdistance, $xvarcurrent, $xvarstatic, $ydistance, $yvarcurrent, $yvarstatic
Global $Paused
$pos = MouseGetPos()
$posx = $pos[0]
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{HOME}", "FindLoc")
HotKeySet("{END}", "DifCoords")
Call("test")
Global $goX1 = 477408726, $goY1 = 828745204
Global $goX2 = 478965420, $goY2 = 829173489


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
	$z = StringRight($coords, 10)
EndFunc   ;==>GetCoords

Func RecordCoords()
	Call("getcoords")
	$xvarstatic = Int($x)
	$yvarstatic = Int($y)
	;MsgBox(0, "Coords Are: ", $xvarstatic & " " & $yvarstatic)
EndFunc   ;==>RecordCoords

Func DifCoords()
	Call("getcoords")
	$xvarcurrent = Int($x)
	$xdistance = Int($xvarstatic - $xvarcurrent)
	$yvarcurrent = Int($y)
	$ydistance = Int($yvarstatic - $yvarcurrent)
	;MsgBox(0, "Distance is: ", $xdistance & " " & $ydistance)
EndFunc   ;==>DifCoords

Func FindLoc()
	Send("{W down}")
	Call("DifCoords")
	$xtraveled = $xdistance
	$ytraveled = $ydistance
	Do
		Call("difcoords")
		If $xtraveled > $xdistance Then
			If $posx = $pos[0] Then
				$posx = $pos[0] - 1
			EndIf
			If $posx <> $pos[0] Then
				$posx = $posx - 1
			EndIf
			MouseMove($posx, $pos[1])
			Sleep(20)
		EndIf
		If $ytraveled > $ydistance Then
			If $posx = $pos[0] Then
				$posx = $pos[0] - 1
			EndIf
			If $posx <> $pos[0] Then
				$posx = $posx - 1
			EndIf
			MouseMove($posx, $pos[1])
			Sleep(20)
EndIf
		$lowx = $xvarstatic - 50000
		$highx = $xvarstatic + 50000
		$lowy = $yvarstatic - 50000
		$highy = $yvarstatic + 50000
	Until ( $xvarcurrent >= $lowx And $xvarcurrent <= $highx ) Or ( $yvarcurrent >= $lowy And $yvarcurrent <= $highy )
	Send("{W up}")
	MsgBox(0,"","sdfsdfsdf")
EndFunc   ;==>FindLoc
