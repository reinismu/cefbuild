#!/bin/bash
export CEF_USE_GN=1
export GN_DEFINES="is_official_build=true proprietary_codecs=true ffmpeg_branding=Chrome use_gnome_keyring=false use_system_libdrm=false"

cd code/chromium_git/chromium/src/cef/tools

./make_distrib.sh --ninja-build --x64-build --minimal
