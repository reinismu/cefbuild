#!/bin/bash
export CEF_USE_GN=1
export GN_DEFINES="is_official_build=true proprietary_codecs=true ffmpeg_branding=Chrome use_gnome_keyring=false use_system_libdrm=false use_sysroot=true use_allocator=none symbol_level=1 is_cfi=false use_thin_lto=false"
export CEF_ARCHIVE_FORMAT=tar.bz2

python ../automate/automate-git.py --download-dir=/usr/build/code/chromium_git --depot-tools-dir=/usr/build/code/depot_tools --branch=4389 --minimal-distrib-only --force-clean --build-target=cefsimple --x64-build
