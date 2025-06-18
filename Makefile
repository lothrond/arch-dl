# Copyright 2025 (C), lothrond <lothrond AT protonmail DOT com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

USR_BIN := /usr/bin
USR_SHARE := /usr/share

man: archlinux-dl.1
	cp archlinux-dl.1 /tmp
	gzip /tmp/archlinux-dl.1

.PHONY: install_bin
install_bin: archlinux-dl.sh
	cp archlinux-dl.sh /tmp/archlinux-dl
	install -m 755 -t $(USR_BIN) /tmp/archlinux-dl

.PHONY: install_man
install_man: /tmp/archlinux-dl.1.gz
	mv /tmp/archlinux-dl.1.gz $(USR_SHARE)/man/man1

install: man install_bin install_man

remove:
	sudo rm $(USR_BIN)/archlinux-dl
	sudo rm $(USR_SHARE)/man/man1/archlinux-dl.1.gz
	
update: remove install

