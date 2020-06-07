; Set up settings before continuing
CoordMode, Mouse, Screen


; Get user input beforehand to make sure passwords are correct.
InputBox, sysPassword, Get Sys Password, Enter Ryan's Password for the MSI CLOUD SYSTEM (Escape to Cancel this Program), , , , , , , 2147482, Ryan1902
InputBox, settlePassword, Get Settlement Pass, Enter Ryan's Password for the SETTLEMENT DURING AUDIT (Escape to Cancel this Program), , , , , , , 2147482, Ryan1902


; ---CLI Audit---
Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Log In.ahk" 06 %sysPassword%
Sleep, 80000

Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Audit.ahk" RR %settlePassword% 1
Sleep, 840000

Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Log In.ahk" 06 %sysPassword%
Sleep, 80000

; 1 = Country Lane Inn, 2 = Grandma's
Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Assign Rooms.ahk" 1
Sleep, 202000

Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Print Forms.ahk" 1 %sysPassword%
Sleep, 815000


; ---Grandma's Audit---
Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Log In.ahk" 12 %sysPassword%
Sleep, 80000

Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Audit.ahk" RR %settlePassword% 2
Sleep, 840000

Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Log In.ahk" 12 %sysPassword%
Sleep, 80000

; 1 = Country Lane Inn, 2 = Grandma's
Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Assign Rooms.ahk" 2
Sleep, 135000

Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Print Forms.ahk" 2 %sysPassword%
Sleep, 815000


; Log into both systems
Run "C:\Users\reservations\My Documents\ahk\AutoHotkeyA32.exe" "Log into Both Systems.ahk" 06 12 %sysPassword%
Sleep, 120000


ExitApp
Esc::ExitApp