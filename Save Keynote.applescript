property minutesBetweenSaves : 10

on run
	launch application "Keynote"
end run

on idle
	tell application "Keynote" to save (every slideshow whose name is not "untitled")
	return minutesBetweenSaves * 60
end idle

on quit
	quit application "Keynote"
	continue quit
end quit