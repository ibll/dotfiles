Dotfiles managed with [`chezmoi`](https://github.com/twpayne/chezmoi)

# Installation Instructions

1. [Download `laptop.sh`](dot_dotfiles/laptop.sh)
2. Run laptop.sh:
 ```
 sh /path/to/laptop.sh
 ```

3. Pray it works correctly!

# Backup Steps

1. Backup External Data
 - Brewfile dump - Keeps [`brew`](https://brew.sh) files up to date
  ```
  brew bundle dump --force
  ```

  - Raycast Export - Keeps [Raycast](https://www.raycast.com/) configuration current
  1. Open Raycast
  2. Export Settings & Data
   - Password in Bitwarden
   - Located in `~/.dotfiles/System/Raycast/Backups/`
 
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

# Special Notes

1. I have the following at the top of my `/private/etc/pam.d/sudo` file.

  ```
  auth       sufficient     pam_tid.so
  ```

  This opens the TouchID prompt when using `sudo`.
