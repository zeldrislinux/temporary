#!/bin/bash

set -exv

# sync rom
repo init --depth=1 --no-repo-verify -u git://github.com/CipherOS/android_manifest.git -b eleven -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/DhruvChhura/manifest_personal.git --depth 1 -b cph .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build test
source build/envsetup.sh
lunch lineage_ysl-user
export TZ=Asia/Dhaka #put before last build command
date
make sepolicy
make bootimage
make init
date
