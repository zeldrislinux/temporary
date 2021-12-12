# sync rom
<<<<<<< HEAD
repo init --depth=1 --no-repo-verify -u git://github.com/AOSPK/manifest.git -b twelve -g default,-mips,-darwin,-notdefault
git clone https://github.com/ECr34T1v3/android_.repo_local_manifests.git --depth 1 -b beyond0-aospk .repo/local_manifests
=======
repo init --depth=1 --no-repo-verify -u https://github.com/AOSPK/manifest -b eleven -g default,-mips,-darwin,-notdefault
git clone https://github.com/ECr34T1v3/android_.repo_local_manifests --depth 1 -b beyond0-aospk .repo/local_manifests
>>>>>>> 4124ef631bbb28b5ec0b3ea11d42e4d51c15e11a
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch aosp_beyond0lte-userdebug
export TZ=Asia/Dhaka #put before last build command
make bacon

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
