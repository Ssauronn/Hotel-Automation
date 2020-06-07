; Set up settings before continuing
CoordMode, Mouse, Screen


; Start printing night audit reports, then housekeeping reports if parameters passed allows
MouseMove, 60, 1000 ; Reports
MouseClick
Sleep, 27000
MouseMove, 13, 346 ; Night Audit Reports
MouseClick
Sleep, 500
MouseMove, 90, 374 ; Daily Activity
MouseClick
Sleep, 20000
MouseMove, 285, 225 ; Run Report
MouseClick
Sleep, 30000
MouseMove, 700, 305 ; Print
MouseClick
Sleep, 16000
Send, {Enter} ; Printing Daily Activity
Sleep, 8000
MouseMove, 90, 396 ; Department Audit
MouseClick
Sleep, 20000
MouseMove, 505, 233 ; Change Date
MouseClick
Sleep, 500
Send, {Left}
Sleep, 500
Loop 3
{
	Send, {Right}
	Sleep, 500
}
Send, {Down}
Sleep, 500
MouseMove, 580, 173
MouseClick
Sleep, 20000
MouseMove, 285, 225 ; Run Report
MouseClick
Sleep, 30000
MouseMove, 700, 305 ; Print
MouseClick
Sleep, 16000
Send, {Enter} ; Printing Department Audit
Sleep, 8000
MouseMove, 90, 443 ; Transaction Totals
MouseClick
Sleep, 20000
MouseMove, 505, 233 ; Change Date
MouseClick
Sleep, 500
Send, {Left}
Sleep, 500
Loop 3
{
	Send, {Right}
	Sleep, 500
}
Send, {Down}
Sleep, 500
MouseMove, 580, 173
MouseClick
Sleep, 20000
MouseMove, 747, 230 ; Set Accounting Group
MouseClick
Sleep, 10000
MouseMove, 285, 225 ; Run Report
MouseClick
Sleep, 30000
MouseMove, 700, 305 ; Print
MouseClick
Sleep, 16000
Send, {Enter} ; Printing Transaction Totals
Sleep, 8000
MouseMove, 90, 515 ; Room Rate Audit
MouseClick
Sleep, 20000
MouseMove, 337, 203 ; Set Expected Arrivals
MouseClick
Sleep, 10000
MouseMove, 285, 225 ; Run Report
MouseClick
Sleep, 30000
MouseMove, 700, 305 ; Print
MouseClick
Sleep, 16000
Send, {Enter} ; Printing Room Rate Audit
Sleep, 8000

if (%1% = 1) {
	iteration := 0
	Loop, 2
	{
		iteration += 1
		; Reset variables
		if (%iteration% = 1)
		{
			CLIArrivals := 0
			CLIDepartures := 0
			CLIStayovers := 0
			CLIDayOne := 0
			CLIDayTwo := 0
			CLIDayThree := 0
			CLIDayFour := 0
		}
		else
		{
			GMASArrivals := 0
			GMASDepartures := 0
			GMASStayovers := 0
			GMASDayOne := 0
			GMASDayTwo := 0
			GMASDayThree := 0
			GMASDayFour := 0
		}
		; Get variables
		if (%iteration% = 1)
		{
			Send, ^1
			Sleep, 5000
		}
		else ; Else if I'm currently attempting to get gma's info I need to first log into gma's
		{
			Send ^t
			Sleep, 15000
			; Log in to first system
			MouseMove, 830, 422
			MouseClick
			Send, {BackSpace 2} ; Append last two characters to select correct system
			Sleep, 50
			Send, 12
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
		}
		
		MouseMove, 521, 308 ; Prepare to Highlight Over Arrivals
		Clipboard := "" ; Clear the clipboard
		Click, down
		MouseMove, 497, 308, 50 ; Gradually move the mouse over the number to highlight it
		Click, up
		Send, ^c
		Clipwait
		if (%iteration% = 1)
		{
			CLIArrivals := clipboard ; Save number as a variable
		}
		else
		{
			GMASArrivals := clipboard
		}
		Sleep, 50
		MouseMove, 858, 308 ; Prepart to Highlight over Departures
		Clipboard := ""
		Click, down
		MouseMove, 834, 308, 50
		Click, up
		Send, ^c
		Clipwait
		if (%iteration% = 1)
		{
			CLIDepartures := clipboard
		}
		else
		{
			GMASDepartures := clipboard
		}
		Sleep, 50
		MouseMove, 1193, 308 ; Prepart to Highlight over Stayovers
		Clipboard := ""
		Click, down
		MouseMove, 1169, 308, 50
		Click, up
		Send, ^c
		Clipwait
		if (%iteration% = 1)
		{
			CLIStayovers := clipboard
		}
		else
		{
			GMASStayovers := clipboard
		}
		Sleep, 50
		
		; Now that data is saved, go to Availability and save the next 4 days
		;386, 817
		;615, 817
		;843, 817
		;1072, 817
		MouseMove, 50, 431
		MouseClick
		Sleep, 20000
		secondIteration := 0
		if (%iteration% = 1)
		{
			yValue := 817
		}
		else
		{
			yValue := 516
		}
		Loop, 4
		{
			MouseMove, (388 + (secondIteration * 228)), %yValue%
			Clipboard := ""
			MouseClick
			Sleep, 50
			MouseClick
			Send, ^c
			Clipwait
			secondIteration += 1
			if (%secondIteration% = 1) 
			{
				if (%iteration% = 1)
				{
					CLIDayOne := clipboard
				}
				else
				{
					GMASDayOne := clipboard
				}
			}
			else if (%secondIteration% = 2)
			{
				if (%iteration% = 1)
				{
					CLIDayTwo := clipboard
				}
				else
				{
					GMASDayTwo := clipboard
				}
			}
			else if (%secondIteration% = 3)
			{
				if (%iteration% = 1)
				{
					CLIDayThree := clipboard
				}
				else
				{
					GMASDayThree := clipboard
				}
			}
			else
			{
				if (%iteration% = 1)
				{
					CLIDayFour := clipboard
				}
				else
				{
					GMASDayFour := clipboard
				}
			}
			Sleep, 1000
		}
	}
	
	
	; Now that all necessary variables are saved, go back to Reports tab
	Send, ^3
	Sleep, 5000
	
	
	; Housekeeping Reports
	MouseMove, 13, 299 ; Open Housekeeping Reports
	MouseClick
	Sleep, 500
	MouseMove, 13, 276 ; Open Reservation Reports
	MouseClick
	Sleep, 500
	
	MouseMove, 90, 348 ; Guest Name List - Expected Departures
	MouseClick
	Sleep, 20000
	MouseMove, 517, 234 ; Sort By
	MouseClick
	Sleep, 500
	MouseMove, 517, 434 ; Room #
	MouseClick
	Sleep, 10000
	MouseMove, 517, 210 ; Type
	MouseClick
	Sleep, 2000
	MouseMove, 517, 391 ; Expected Departures
	MouseClick
	Sleep, 10000
	MouseMove, 285, 225 ; Run Report
	MouseClick
	Sleep, 30000
	MouseMove, 599, 304 ; Select Export Format
	MouseClick
	Sleep, 500
	Send, a ; Acrobat PDF
	Sleep, 15
	Send, c
	Sleep, 15
	Send, {Enter}
	Sleep, 500
	MouseMove, 638, 307 ; Export
	MouseClick
	Sleep, 5000
	MouseMove, 1278, 1022 ; Open
	MouseClick
	Sleep, 5000
	MouseMove, 1182, 1022 ; Open
	MouseClick
	Sleep, 10000
	Send, #{Up} ; Maximize the window
	Sleep, 5000
	MouseMove, 187, 68 ; Edit Button on PDF
	MouseClick
	Sleep, 5000
	MouseMove, 1763, 162 ; Add Text
	MouseClick
	Sleep, 5000
	MouseMove, 343, 116 ; First Line of Text for CLI
	MouseClick
	Sleep, 500
	printed := CLIDepartures + CLIStayovers
	Send, %printed% | %CLIDepartures%
	Sleep, 500
	MouseMove, 343, 150 ; Second Line of Text for CLI
	MouseClick
	Sleep, 500
	Send, %CLIDayOne% | %CLIDayTwo% | %CLIDayThree% | %CLIDayFour%
	Sleep, 500
	MouseMove, 1000, 116 ; First Line of Text for GMAS
	MouseClick
	Sleep, 500
	printed := GMASDepartures + GMASStayovers
	Send, %printed% | %GMASDepartures%
	Sleep, 500
	MouseMove, 1000, 150 ; Second Line of Text for GMAS
	MouseClick
	Sleep, 500
	Send, %GMASDayOne% | %GMASDayTwo% | %GMASDayThree% | %GMASDayFour%
	Sleep, 500
	Send, ^p ; Print 2 Copies
	Sleep, 10000
	Send, {Tab}
	Sleep, 10
	Send, {Up} ; Increment amount of copies by 2
	Sleep, 50
	Send, {Tab 4}
	Sleep, 50
	Send, {Enter}
	Sleep, 8000
	MouseMove, 1907, 10 ; Close out of PDF after printing
	MouseClick
	Sleep, 5000
	Send, {Tab}
	Sleep, 10
	Send, {Enter}
	Sleep, 2000
	
	MouseMove, 90, 638 ; Room Status
	MouseClick
	Sleep, 25000
	MouseMove, 285, 225 ; Run Report
	MouseClick
	Sleep, 30000
	MouseMove, 700, 305 ; Print
	MouseClick
	Sleep, 16000
	Send, {Enter} ; Printing Room Status
	Sleep, 8000
	
	MouseMove, 90, 348 ; Guest Name List - In House
	MouseClick
	Sleep, 20000
	MouseMove, 517, 234 ; Sort By
	MouseClick
	Sleep, 500
	MouseMove, 517, 434 ; Room #
	MouseClick
	Sleep, 10000
	MouseMove, 517, 210 ; Type
	MouseClick
	Sleep, 2000
	MouseMove, 517, 408 ; In House
	MouseClick
	Sleep, 10000
	MouseMove, 285, 225 ; Run Report
	MouseClick
	Sleep, 30000
	MouseMove, 700, 305 ; Print
	MouseClick
	Sleep, 16000
	Send, {Enter} ; Printing Guest Name List - In House
	Sleep, 8000
	
	MouseMove, 90, 708 ; Room Assignments
	MouseClick
	Sleep, 20000
	MouseMove, 582, 206 ; Include Guest Name on Report
	MouseClick
	Sleep, 10000
	MouseMove, 285, 225 ; Run Report
	MouseClick
	Sleep, 30000
	MouseMove, 700, 305 ; Print
	MouseClick
	Sleep, 16000
	Send, {Enter} ; Printing Room Assignments
	Sleep, 8000
}

Sleep, 10000


ExitApp
Esc::ExitApp