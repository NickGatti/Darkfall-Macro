Dim $aArray[4]

$aArray[0]=" a"
$aArray[1]=0
$aArray[2]=1.3434
$aArray[3]="test"

$string = "d"
FOR $element IN $aArray
    $string = $string & $element & @CRLF
NEXT

Msgbox(0,"For..IN Arraytest","Result is: " & @CRLF & $string)

