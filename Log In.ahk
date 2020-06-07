; Set up settings before continuing
CoordMode, Mouse, Screen


; Start closing out of existing windows before starting actual script funciton
MouseMove, 1919, 0
MouseClick
Sleep, 500
MouseClick
Sleep, 500
MouseClick
Sleep, 500
Send, {Enter}
Sleep, 500


; Open a new internet explorer window and log into the system. Allows for lag due to computer slowness.
MouseMove, 26, 1060 ; Move to start bar
Sleep, 500
MouseClick
Sleep, 500
MouseMove, 26, 1020 ; Move to search bar
Sleep, 500
MouseClick
Sleep, 100
Send, cloud ; Search for cloud the first time. Due to hardware limitations, I need to cancel the first search and re-search again.
Sleep, 2000
MouseMove, 1600, 1060
MouseClick
Sleep, 100


; Start the entire search over again, this time continuing through and clicking on the correct result
MouseMove, 26, 1060 ; Move to start bar
Sleep, 500
MouseClick
Sleep, 500
MouseMove, 0, -40, 0, R ; Move to search bar
Sleep, 500
MouseClick
Sleep, 100
Send, cloud ; Search for cloud the second time.
Sleep, 2000
MouseMove, 86, 502
MouseClick
Sleep, 40000 ; Wait while the window loads
Send, #{Up} ; Maximize the window

; Set correct zoom
MouseMove, 260, 850
MouseClick
Send, {Control down}
Send, 0
Loop 5
{
	Sleep, 300
	Send, {WheelDown}
}
Send, {Control up}
Sleep, 100


; Log in to first system
MouseMove, 830, 422
MouseClick
Send, {BackSpace 2} ; Append last two characters to select correct system
Sleep, 50
Send, %1%
Sleep, 50
MouseMove 830, 508
MouseClick
Send, {BackSpace 3} ; Append last three characters to be able to type in correct username
Sleep, 50
Send, RR
Sleep, 50
MouseMove, 1160, 594
MouseClick
Send, {BackSpace 11} ; Remove the current password, in case it was autofilled
Sleep, 50
Send, %2%
Sleep, 50
MouseMove, 960, 740 ; Click on the log in button
MouseClick
Sleep, 20000 ; I've finally logged in


ExitApp
Esc::ExitApp