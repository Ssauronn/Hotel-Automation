; Set up settings before continuing
CoordMode, Mouse, Screen

; Log into first system
Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Log In.ahk" %1% %3%
Sleep, 80000

; Log into second system
Send, ^t ; Open a new tab
Sleep, 10000
MouseMove, 830, 422
MouseClick
Send, {BackSpace 2} ; Append last two characters to select correct system
Sleep, 50
Send, %2%
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
Send, %3%
Sleep, 50
MouseMove, 960, 740 ; Click on the log in button
MouseClick
Sleep, 10000 ; I've finally logged in
Send, ^1 ; Swap back to CLI tab. I'm done!



ExitApp
Esc::ExitApp