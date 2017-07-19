#include <ImageSearch.au3>
Global $lastCoord = False, $add = 0
WinActivate("Darkfall Online")
Sleep(1000)
While 1
	$result = _ImageSearch("images\Harvest\descBar.bmp", 1, $x1, $y1, 30)
	If $result Then
			$pos1 = $x1 - 94
	$pos2 = $y1
	$pos3 = $x1 + 94
	$pos4 = $y1 + 26
		$z = 0
		Do
			$coord = PixelSearch(($pos1,$pos2,$pos3,$pos4, 11711154)
			$color = PixelGetColor($coord[0], $coord[1])
			If $color = 11711154 Then
				;For $i = 1 To 2
					$color = PixelGetColor($coord[0], ($coord[1]));+ $i))
					If $color = 11711154 Then
						MouseMove($coord[0], $coord[1])
						$z += 1
					EndIf
				;Next
			EndIf
		Until $z = 2
	MsgBox(0, "", "Found It")
	MouseMove($coord[0], $coord[1])
	EndIf
WEnd

