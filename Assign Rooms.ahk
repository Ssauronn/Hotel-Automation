; Set up settings before continuing
CoordMode, Mouse, Screen



; +33 for each room, +34 occasionally to keep allignment
; For Rooms starting with a 1
; +48 for the odd rooms
; + 70 for the even rooms

; For Rooms starting with a 2
; + 90 for the odd rooms
; + 114 for the even rooms

; Assign Housekeeping Rooms before Printing (CLI Only)
MouseMove, 60,938 ; Housekeeping
MouseClick
Sleep, 15000
MouseMove, 30, 280 ; Room Assignments
MouseClick
Sleep, 10000

; If Assigning Country Lane Inn Rooms
if (%1% = 1) {

	; Loop through the rooms starting with a 1 (before I need to scrool down and restart the loop)
	; Loops through rooms 100 - 117 inclusive
	iteration := 0
	Loop 18
	{
		MouseMove, 921, (270 + (33.5 * iteration))
		MouseClick
		Sleep, 2000
		iteration += 1
		If iteration & 1 = 0
		{
			; if the iteration is odd, meaning the room is odd
			MouseMove, 921, (270 + (33.5 * (iteration - 1)) + 48)
		}
		Else
		{
			; if the iteration is even, meaning the room is even
			MouseMove, 921, (270 + (33.5 * (iteration - 1)) + 70)
		}
		MouseClick
		Sleep, 500
	}

	MouseMove, 1911, 1024 ; Scroll down to access more rooms to assign
	Loop 6
	{
		MouseClick
		Sleep, 150
	}
	
	; Loop through the rooms starting with a 1 (before special cases kick in and I need to restart the loop)
	; Loop through 118 - 124 inclusive
	iteration := 0
	Loop 7
	{
		MouseMove, 921, (275 + (33.5 * iteration))
		MouseClick
		Sleep, 2000
		iteration += 1
		If iteration & 1 = 0
		{
			; if the iteration is odd, meaning the room is odd
			MouseMove, 921, (275 + (33.5 * (iteration - 1)) + 48)
		}
		Else
		{
			; if the iteration is even, meaning the room is even
			MouseMove, 921, (275 + (33.5 * (iteration - 1)) + 70)
		}
		MouseClick
		Sleep, 500
	}
	
	MouseMove, 921, 510 ; 219
	MouseClick
	Sleep, 2000
	MouseMove, 921, 624
	MouseClick
	Sleep, 500
	MouseMove, 921, 544 ; 221
	MouseClick
	Sleep, 2000
	MouseMove, 921, 634
	MouseClick
	Sleep, 500
	MouseMove, 921, 577 ; 223
	MouseClick
	Sleep, 2000
	MouseMove, 921, 667
	MouseClick
	Sleep, 500
	
	; Loop through the rooms starting with a 2 (before I need to scrool down and restart the loop)
	; Loops through rooms 225 - 231 inclusive
	iteration := 0
	Loop 7
	{
		MouseMove, 921, (610 + (33.5 * iteration))
		MouseClick
		Sleep, 2000
		iteration += 1
		If iteration & 1 = 0
		{
			; if the iteration is odd, meaning the room is even
			MouseMove, 921, (610 + (33.5 * (iteration - 1)) + 114)
		}
		Else
		{
			; if the iteration is even, meaning the room is odd
			MouseMove, 921, (610 + (33.5 * (iteration - 1)) + 90)
		}
		MouseClick
		Sleep, 500
	}
	
	MouseMove, 1911, 1024
	Loop 5 ; Scroll down to access the rest of the rooms
	{
		MouseClick
		Sleep, 150
	}
	
	
	; Loop through the rooms starting with a 2 (before special cases kick in)
	; Loops through rooms 232 - 247 inclusive
	iteration := 0
	Loop 16
	{
		MouseMove, 921, (393 + (33.5 * iteration))
		MouseClick
		Sleep, 2000
		iteration += 1
		If iteration & 1 = 0
		{
			; if the iteration is odd, meaning the room is even
			MouseMove, 921, (393 + (33.5 * (iteration - 1)) + 90)
		}
		Else
		{
			; if the iteration is even, meaning the room is odd
			MouseMove, 921, (393 + (33.5 * (iteration - 1)) + 114)
		}
		MouseClick
		Sleep, 500
	}
	
	; Special cases
	MouseMove, 921, 928 ; 248
	MouseClick
	Sleep, 2000
	MouseMove, 921, 902
	MouseClick
	Sleep, 500
	MouseMove, 921, 962 ; 249
	MouseClick
	Sleep, 2000
	MouseMove, 921, 914
	MouseClick
	Sleep, 500
	MouseMove, 921, 995 ; 250
	MouseClick
	Sleep, 2000
	MouseMove, 921, 970
	MouseClick
	Sleep, 500
	MouseMove, 921, 1029 ; 251
	MouseClick
	Sleep, 2000
	MouseMove, 921, 982
	MouseClick
	Sleep, 500
	MouseMove, 237, 175 ; Save
	MouseClick
	Sleep, 15000
}
else {

	; Loop through the rooms starting with a 1
	; Loops through rooms 131-137 inclusive
	iteration := 0
	Loop 7 {
		MouseMove, 921, (270 + (iteration * 33.5))
		MouseClick
		Sleep, 2000
		MouseMove, 921, (270 + (iteration * 33.5) + 48)
		MouseClick
		Sleep, 500
		iteration += 1
	}
	; Loop through the rooms starting with a 1
	; Loops through rooms 201 - 207 inclusive
	iteration := 0 
	Loop 7 {
		MouseMove, 921, (504 + (iteration * 33.5))
		MouseClick
		Sleep, 2000
		MouseMove, 921, (504 + (iteration * 33.5) + 71)
		MouseClick
		Sleep, 500
		iteration += 1
	}
	MouseMove, 237, 175 ; Save
	MouseClick
	Sleep, 15000
}

Sleep, 10000



ExitApp
Esc::ExitApp
