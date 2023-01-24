#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Discord
# @raycast.mode silent

# Optional parameters:
# @raycast.icon /Users/isbell/.dotfiles/System/Raycast/Scripts/Images/discord_logo.png
# @raycast.packageName Arc Apps

# Documentation:
# @raycast.author Chloe Isbell
# @raycast.authorURL https://github.com/TheGoodDude22

tell application "Arc"
	# Search Arc for open Discord tab
	set _window_index to 1
	repeat with _window in windows
		set _tab_index to 1
		repeat with _tab in tabs of _window
			set _url to get URL of _tab
			if _url contains "discord.com" then
				set _tab_id to id of _tab
				tell front window
					tell _tab to select
				end tell
				activate
				return "Focusing Discord!"
			end if
			set _tab_index to _tab_index + 1
		end repeat
		set _window_index to _window_index + 1
	end repeat
	
	# Discord tab not found, open in Little Arc
	make new tab with properties {URL:"https://discord.com/app"}
	activate
	return "Opening Discord!"
end tell
