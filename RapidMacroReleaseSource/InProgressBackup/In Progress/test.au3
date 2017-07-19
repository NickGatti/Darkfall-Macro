#include <Misc.au3>
$hDLL = DllOpen("user32.dll")
While 1 * Sleep(10)
	For $i = 0 To 255
		If _IsPressed(Hex($i,2),$hDLL) Then
			ToolTip(Hex($i,2))
		EndIf
	Next
WEnd
