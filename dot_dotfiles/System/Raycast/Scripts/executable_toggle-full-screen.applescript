#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Full Screen
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🖥

# Documentation:
# @raycast.author Chloe Isbell
# @raycast.authorURL https://github.com/TheGoodDude22

tell application "System Events"
	set frontApp to first application process whose frontmost is true
	set value of attribute "AXFullScreen" of window 1 of frontApp to not value of attribute "AXFullScreen" of window 1 of frontApp
end tell