#!/bin/bash
export CEF_USE_GN=1
export GN_DEFINES="is_official_build=true proprietary_codecs=true ffmpeg_branding=Chrome use_gnome_keyring=false use_system_libdrm=false use_sysroot=true use_allocator=none symbol_level=1 is_cfi=false use_thin_lto=false"

./cef_create_projects.sh
