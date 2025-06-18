# archlinux-dl

An Arch Linux download script.

### Whats this?
This is just a very simple way to download Arch Linux for installation, with signature verification.

### Configuration options for download

This script understands a very limited ENVIRONMENT, including:

`ARCHLINUX`
    This is the current name/architect of the download.

`DIR`
    This is the current download location from the host.

`MIRROR`
    This is the current download directory location to the system.

`COLOR`
    (0 or 1) Don't use or use color output.

### Installation

You will need the `make` package installed on your system.

Install with:

    sudo make install

This will install a shell script and a man page onto the system. By default, the directories are `/usr/local/bin` for the shell script, and `/usr/share/man/man1` for the manpage.

Removal can be done by:

    sudo rm /usr/bin/archlinux-dl &&
    sudo rm /usr/share/man/man1/archlinux-dl.1.gz

Or:

    sudo make remove

### Usage

After installation, cd into the needed directory and run `archlinux-dl` to download.

### Flashing to disk/USB

#### On Linux devices:

	dd if=/path/to/archlinux-x86_64.iso of=/dev/usb status=progress

#### On ChromeOS devices:

The `Chromebook Recovery Utility` extension needs to be installed.

Rename the `archlinux-x86_64.iso` to a `.bin` file:

	mv archlinux-x86_64.iso archlinux-x86_64.bin

Then, open `chrome` and open the `Chromebook Recovery Utility`.
Click the gear icon in the top right corner, and click `use local image`.
Plug in the drive. On the next screen make sure to select the correct drive, etc.

See the manual page (after insallation) with `man 1 archlinux-dl` for more information.

#### Copyright (C) 2025, lothrond <lothrond AT protonmail DOT com>
