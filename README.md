Dotfiles managed with [`chezmoi`](https://github.com/twpayne/chezmoi)

# Installation Instructions

1. [Download `laptop.sh`](dot_dotfiles/laptop.sh)
2. Run .laptop `sh /path/to/laptop.sh`
3. Pray it works correctly!

# Backup Steps

1. Backup External Data
	- Brewfile dump
		Keeps [`brew`](https://brew.sh) files up to date
		```
		brewfile bundle dump --force
		```
	- Raycast
		Keeps [Raycast](https://www.raycast.com/) configuration current
		- Open Raycast
		- Export Settings & Data
			- Password in Bitwarden
			- Located in `~/.dotfiles/System/Raycast`

2. Sync modified files to Chezmoi
	```
	chezmoi re-add
	```

3. Sync changes to Github
	```
	chezmoi cd
	git add .
	git commit -m "Backing up..."
	git push
	```
