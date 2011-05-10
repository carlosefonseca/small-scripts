-- Save this as an App and use it when creating keynotes
-- It will save your presentations every N minutes.
-- Don't set it to low because saving takes a few seconds
-- and the app actually blocks while doing it.

-- Carlos Fonseca

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