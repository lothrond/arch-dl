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

See the manual page (after insallation) with `man 1 archlinux-dl` for more information.

#### Copyright (C) 2024, lothrond <lothrond AT protonmail DOT com>
