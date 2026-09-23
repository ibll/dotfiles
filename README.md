Dotfiles managed with [`chezmoi`](https://github.com/twpayne/chezmoi)

# Backup Steps

1. Backup External Data

- Brewfile dump - Keeps [`brew`](https://brew.sh) files up to date

  ```
  brew bundle dump --force
  ```

2. Sync modified files to Chezmoi

```
chezmoi re-add
```

This may be more complex if new files need to be added or have been removed.

3. Push to git

```
chezmoi cd
git add .
git commit
git push
```

# Special Notes

## TouchID Sudo

I have the following at the top of my `/private/etc/pam.d/sudo` file.

```plaintext
auth       sufficient     pam_tid.so
```

## Music Setup

I have [MPD](https://mpd.readthedocs.io/en/latest/user.html) set up. [RMPC](https://mierak.github.io/rmpc/) is my music client, and [MPDScribble](https://www.musicpd.org/clients/mpdscribble/) scrobbles to last.fm.

```bash
# ~/.config/mpdscribble/mpdscribble.conf

[lastfm]
url = https://post.audioscrobbler.com/
username = USERNAME
password = PASSWORD
journal = ~/.config/mpdscribble/journal.txt
```
