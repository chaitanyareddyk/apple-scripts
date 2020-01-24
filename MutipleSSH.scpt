tell application "iTerm"
	set newWindow to (create window with default profile)
	set Servers to paragraphs of (do shell script "/bin/cat $HOME/serverlist")
	repeat with nextLine in Servers
		if length of nextLine is greater than 0 then
			set server to "nextLine"
			tell current window
				create tab with default profile
				tell current session of newWindow
					write text "ssh " & nextLine
					delay 1
				end tell
			end tell
		end if
	end repeat
end tell