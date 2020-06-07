# Hotel-Automation
Completely automates the daily tasks of the night audit shift


To Start:
Click on "Full Night Audit.ahk" to run the script, then 'Control' + 'J' to start the script.

Purpose:
Designed to utterly and completely automate the daily responsibilities for the night audit shift at the Best Western in Juneau, Alaska. Exclusive to the hotel only.

Description:
Begins the audit starting with user input to sign into the system, finishes audit, prints out all necessary forms and even applies custom annotations, requested by housekeeping, via PDF editting.

Issues:
I wanted to make the script universal, to work on any computer using any screen aspect ratio, but its impossible. The system is cloud based, and works off of the internet browser, and adjusts itself according to the aspect ratio (not monitor shape, it specifically adjusts to aspect ratio) of the screen. The adjustments in the cloud system are not based off of ratios themselves but rather pure pixel distances, meaning I can't just adjust the mouse click placements to work off of screen ratios. And the owner of the hotel did not authorize scraping information off the website, citing security concerns. I could have changed the mouse click placements to automatically adjust themselves along with the Cloud system when using different aspect ratios, but because the Cloud based system is proprietary software, I can't see their exact adjustment model and my own adjustments would have been based off of guess work, most likely not working in extreme circumstances. So, my hands are tied - I can only get each script to work on a specific aspect ratio, and if that changes, the mouse click locations would all have to be changed. For now, however, it will work for the forseeable future.
