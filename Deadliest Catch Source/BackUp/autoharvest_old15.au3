;WinActivate("Darkfall Online", "")
Global $x, $y, $z, $xdistance, $xvarcurrent, $xvarstatic, $ydistance, $yvarcurrent, $yvarstatic, $headinghigh, $headinglow, $angle, $xgo, $ygo, $heading, $direction
Global $Paused
Global Const $pi = 3.14159265358979
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{HOME}", "FindLoc")
HotKeySet("{END}", "fuck")
Call("test")

While 1
WEnd

Func fuck()
	MsgBox(0,"", $direction & "      " & $heading)
EndFunc   ;==>fuck

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
	$h = StringRight($coords, 7)
	$heading = Int($h)
		$xSavedLoc = Int($x)
	$ySavedLoc = Int($y)
EndFunc   ;==>GetCoords

Func RecordCoords()
	Call("getcoords")
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
		Call("getcoords")
		Call("directionangle", $xvarstatic, $yvarstatic)
		ToolTip($heading & "     " & $direction,0,0)
			Do
				Call("getcoords")
				Call("directionangle", $xvarstatic, $yvarstatic)
				If $heading < $direction Then
					ToolTip($heading & "     " & $direction,0,0)
					Send("{right}")
					$pos = MouseGetPos()
					$pos[0] = $pos[0] - 1
					MouseMove($pos[0], $pos[1])
				EndIf
				Call("getcoords")
				Call("directionangle", $xvarstatic, $yvarstatic)
				If $heading < $direction Then
					ToolTip($heading & "     " & $direction,0,0)
					Send("{left}")
					;$pos = MouseGetPos()
					;$pos[0] = $pos[0] + 1
					;MouseMove($pos[0], $pos[1])
				EndIf
				Call("getcoords")
				Call("directionangle", $xvarstatic, $yvarstatic)
				$headinglow = $heading - 3
				$headinghigh = $heading + 3
			Until $direction <= $headinglow Or $direction >= $headinghigh
		Call("getcoords")
		Call("difcoords")
		$lowx = $xvarstatic - 10
		$highx = $xvarstatic + 10
		$lowy = $yvarstatic - 10
		$highy = $yvarstatic + 10
	Until ($xvarcurrent >= $lowx And $xvarcurrent <= $highx) And ($yvarcurrent >= $lowy And $yvarcurrent <= $highy)
	Send("{W up}")
EndFunc   ;==>FindLoc

Func DirectionAngle($deltaX, $deltaY)
	Local $angle = ATan($deltaY / $deltaX)
	$angle += (($deltaY <= 0) And ($deltaX < 0)) * $pi
	$angle += (($deltaY > 0) And ($deltaX < 0)) * $pi
	$direction = Round(Mod($angle * 180 / $pi + 360, 360), 12)
EndFunc   ;==>DirectionAngle




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
