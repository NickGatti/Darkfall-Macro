;WinActivate("Darkfall Online", "")
Global $xParsed, $yParsed, $var, $i, $runonce = True
Global $Paused, $arrayLoc, $currentSpot = 2, $totalUsed = 2
Global $currentX, $currentY, $spotX, $spotY, $testX, $testY, $currentDistance, $savedDistance = 0
Global $arrayLoc, $totalUsed, $currentSpot, $xCurrentLoc, $yCurrentLoc, $xParsed, $yParsed
Global $spotNumber = 1
Global $spot[100]
$spot[0] = $currentSpot
$spot[1] = $totalUsed
;init()

HotKeySet("{Pause}", "TogglePause")
HotKeySet("{DEL}", "SetPathingCoords")
HotKeySet("{END}", "Drive")

Func TogglePause()
	$Paused = Not $Paused
	While $Paused
		Sleep(100)
		ToolTip('Script is "Paused"', 0, 0)
	WEnd
	ToolTip("")
EndFunc   ;==>TogglePause

While 1
WEnd

Func init()
	Local $text, $var
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
EndFunc   ;==>init

Func getCurrentXY()
	$text = WinGetText("Darkfall Tools", "")
	$var = StringRight($text, 62)
	$x = StringLeft($var, 9)
	$var = StringRight($text, 52)
	$y = StringLeft($var, 9)
	$var = StringRight($text, 42)
	$z = StringLeft($var, 8)
	$var = StringRight($text, 33)
	$h = StringLeft($var, 6)
	$heading = Int($h)
	$xCurrentLoc = Int($x)
	$yCurrentLoc = Int($y)
EndFunc   ;==>getCurrentXY

Func setPathingCoords()
	getCurrentXY()
	$totalUsed = $totalUsed + 1
	$spot[$totalUsed] = $xCurrentLoc & $yCurrentLoc
EndFunc   ;==>setPathingCoords

Func drive()
	findNearestCoord()
	MsgBox(0,"",$arrayLoc)
EndFunc   ;==>drive

Func findNearestCoord()
	getCurrentXY()
	For $i = 3 To $totalUsed ; For Loop Beginning from $i to the Max Number of Arrary Vars
		parseLoc($spot[$i]) ; Parse arrary x y
		$testXLoc = Int($xParsed) - Int($xCurrentLoc) ; testX is the distance between the pathing loc (static) and the current loc
		$testYLoc = Int($yParsed) - Int($yCurrentLoc); testY is the distance between the pathing loc (static) and the current loc
		$currentDistance = $testXLoc + $testYLoc ;This is an equation that solves the total distance of X and Y
		If $currentDistance < $savedDistance Or $runonce Then
			$savedDistance = $currentDistance
			$arrayLoc = $i
		EndIf
	Next
EndFunc   ;==>findNearestCoord

Func parseLoc($loc)
	$xParsed = StringLeft($loc, 8)
	$var = StringRight($loc, 8)
	$yParsed = StringLeft($var, 8)
EndFunc