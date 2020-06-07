; Set up settings before continuing
CoordMode, Mouse, Screen


; Start Night Audit
MouseMove, 34, 906 ; Front Office
MouseClick
Sleep, 20000
MouseMove, 330, 300 ; Close Shift
MouseClick
Sleep, 15000
MouseMove, 808, 734 ; OK
MouseClick
Sleep, 20000
MouseMove, 917, 644
MouseClick
Sleep, 20000
MouseMove, 330, 425 ; Post Room and Tax
MouseClick
Sleep, 60000
MouseMove, 330, 494 ; Close Business Day
MouseClick
Sleep, 10000
if (%3% = 1)
{
	MouseMove, 958, 730 ; OK
}
else
{
	MouseMove, 958, 719 ; OK
}
MouseClick
Sleep, 20000
MouseMove, 918, 643 ; OK
MouseClick
Sleep, 180000
MouseMove, 1384, 684 ; Scroll Right
MouseClick
Sleep, 1000
MouseMove, 1354, 478
Sleep, 100
MouseMove, 1386, 478 ; Checkmark All
MouseClick
Sleep, 200
MouseMove, 919, 726 ; OK
MouseClick
Sleep, 120000
MouseMove, 919, 726 ; OK
MouseClick
Sleep, 300000
MouseMove, 998, 665 ; Close
MouseClick
Sleep, 1000
MouseMove, 918, 641 ; OK
MouseClick
Sleep, 2000
MouseMove, 917, 686 ; OK
MouseClick
Sleep, 20000
MouseMove, 34, 1032 ; Settlement
MouseClick
Sleep, 20000
Send, %1%
Sleep, 100
Send, {Tab}
Sleep, 100
Send, %2%
Sleep, 100
Send, {Enter}
Sleep, 10000
MouseMove, 1655, 616 ; Settle
MouseClick
Sleep, 180000
MouseMove, 794, 182 ; Print Settlement Report
MouseClick
Sleep, 40000
MouseMove, 459, 149 ; Print
MouseClick
Sleep, 40000
Send, {Enter}
Sleep, 10000

ExitApp
Esc::ExitApp