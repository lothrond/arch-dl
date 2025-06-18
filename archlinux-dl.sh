#!/bin/bash
#
# archlinux-dl - an archlinux download script
#
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

set -e

# Set download mirror:
[ ${MIRROR} ] || \
	MIRROR=https://mirrors.edge.kernel.org/archlinux/iso/latest

# Set download directory:
[ ${DIR} ] || \
	DIR=$(pwd)

# Set archlinux:
# (See mirror for more options)
[ ${ARCHLINUX} ] || \
	ARCHLINUX=archlinux-x86_64

# Set color output:
# (0 or 1)
[ ${COLOR} ] || \
	COLOR=1

colr=""
colb=""
colg=""
fcol=""
xcol=""

if [ "${COLOR}" -eq 1 ]; then
	colr="\e[32m"
	colb="\e[96m"
	colg="\e[92m"
	fcol="\e[5m"
	xcol="\e[0m"
fi

# Display startup.
echo -e "${fcol}${colb}Downloading Arch Linux [${colr}${ARCHLINUX}${colb}]${xcol}"
echo

# Obtain archlinux gpg key.
echo -e "${colb}Adding Arch Linux gpg signature key to keyring:${xcol}"
gpg --auto-key-locate clear,wkd -v --locate-external-key pierre@archlinux.org

# Download archlinux iso and gpg signature.
cd ${DIR}

echo -e "${colb}Downloading [${colr}${ARCHLINUX}.iso${colb}]${xcol}:"
curl -LO ${MIRROR}/${ARCHLINUX}.iso
echo

echo -e "${colb}Downloading [${colr}${ARCHLINUX}.iso${colb}] verification signature:${xcol}"
curl -LO ${MIRROR}/${ARCHLINUX}.iso.sig
echo

# Check download.
echo -e "${colb}Checking [${colr}${ARCHLINUX}.iso${colb}]:${xcol}"
gpg --keyserver-options auto-key-retrieve --verify ${ARCHLINUX}.iso.sig ${ARCHLINUX}.iso

echo
echo -e "${fcol}${colg}:)${xcol}"

exit $?
