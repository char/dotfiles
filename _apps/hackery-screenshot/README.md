# hackery-screenshot

Uploads screenshots to `hackery.site`.

`hackery.site` runs a copy of [`super-simple-upload`](https://github.com/half-cambodian-hacker-man/super-simple-upload)

## Requirements

For `hackery-upload`, you will need:

- `curl`
- An upload key in `$HOME/.config/hackery-upload/key`.

For `hackery-screenshot`, you will need:

- All the requirements of `hackery-upload`
- `shotgun`
- `slop`
- `imagemagick`'s `convert`
- `xclip`
- `notify-send` (and therefore `libnotifyd`, as well as a notification daemon.)

## Notes

`hackery-screenshot` creates a folder called 'Screenshots' in your home directory.

## Installation

Place `hackery-upload` and `hackery-screenshot` on your `PATH`. I use `/usr/local/bin/`.
