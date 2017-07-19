WinActivate("Darkfall Online", "")
#include <ImageSearch.au3>
Global $go = 0, $x1, $y1

Do
			$result = _ImageSearch("images\stat-selfstam.bmp", 1, $x1, $y1, 30)
		If $result = 1 And $go = 2 Then
			$stamx = $x1
			$stamy = $y1
			$pixVar = PixelGetColor($stamx, $y1)
			$fullstamcolor = $pixVar
			$go = 1
		EndIf
	Until $go = 1

