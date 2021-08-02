
# Custom CEF Build with all codecs

## Update version
* Edit `--branch=<release-branch>` in **scripts/update.sh** Based on https://bitbucket.org/chromiumembedded/cef/wiki/BranchesAndBuilding.md#markdown-header-current-release-branches-supported

## Build 
* `docker build -t cef-build .`

## Extract Release

file name is based on \<release-branch\>

* `id=$(docker create cef-build) && docker cp $id:/usr/build/code/chromium_git/chromium/src/cef/binary_distrib/cef_binary_89.0.5+gc1f90d8+chromium-89.0.4389.40_linux64_minimal.tar.bz2 . && docker rm -v $id`


## Shell in container

`docker run -it --rm cef-build /bin/bash`
