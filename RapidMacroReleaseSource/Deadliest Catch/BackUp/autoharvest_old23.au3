;WinActivate("Darkfall Online", "")
Global $x, $y, $z, $Paused, $text, $var, $coords, $h, $direction, $heading, $xCurrentLoc, $xSavedLoc, $yCurrentLoc, $ySavedLoc
HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "RecordCoords")
HotKeySet("{HOME}", "FindLoc")
HotKeySet("{END}", "fuck")
Call("test")
Dim $difarray[5]

While 1
WEnd

Func fuck()
	MsgBox(0, "", $direction & "      " & $heading)
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
	$var = StringRight($text, 62)
	For $i = 1 To 62
		Local $coordV = ""
Local $expr = " "
Local $string
		$coordV = StringRight($var, $i)
		For $expr In $coordV
			$string = $string + $expr & @CRLF
		Next
		MsgBox(0,"",$string)
	Next
	;MsgBox(0, "", $var)
	$coords = StringLeft($var, 30)
	$x = StringLeft($coords, 10)
	$coords = StringRight($coords, 20)
	$y = StringLeft($coords, 10)
	$coords = StringRight($coords, 10)
	$z = StringLeft($coords, 9)
	$h = StringRight($coords, 3)
	;MsgBox(0, "", $h)
	$heading = Int($h)
	$xCurrentLoc = Int($x)
	$yCurrentLoc = Int($y)
	;MsgBox(0, "", $x)
	;MsgBox(0, "", $y)
	;MsgBox(0, "", $heading)
EndFunc   ;==>GetCoords

Func RecordCoords()
	Call("getcoords")
	$xSavedLoc = Int($x)
	$ySavedLoc = Int($y)
EndFunc   ;==>RecordCoords

Func FindLoc()
	;Send("{W down}")
	Do
		Call("getcoords")
		$difarray[0] = $xCurrentLoc > 0 And $yCurrentLoc > 0
		$difarray[1] = $xCurrentLoc > 0 And $yCurrentLoc < 0
		$difarray[2] = $xCurrentLoc < 0 And $yCurrentLoc < 0
		$difarray[3] = $xCurrentLoc < 0 And $yCurrentLoc > 0
		For $i = 0 To 3
			;MsgBox(0, "", $xCurrentLoc)
			If $difarray[1] Then
				;MsgBox(0, "", "sdf")
			EndIf
		Next





		$lowx = $xSavedLoc - 10
		$highx = $xSavedLoc + 10
		$lowy = $ySavedLoc - 10
		$highy = $ySavedLoc + 10
	Until ($xCurrentLoc >= $lowx And $xCurrentLoc <= $highx) And ($yCurrentLoc >= $lowy And $yCurrentLoc <= $highy)
	;Send("{W up}")
EndFunc   ;==>FindLoc
