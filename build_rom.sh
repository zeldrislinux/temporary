# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/StyxProject/manifest.git -b R -g default,-device,-mips,-darwin,-notdefault
<<<<<<< HEAD
\git clone https://github.com/JamieHoSzeYui/manifest --depth 1 -b styx .repo/local_manifests
=======
git clone https://github.com/JamieHoSzeYui/manifest --depth 1 -b styx .repo/local_manifests
>>>>>>> 290acbb0154f03bd81607ab34608ec83b72b45fc
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# apply required commits
bash .repo/local_manifests/fwb frameworks/base/

# build rom
source build/envsetup.sh
lunch styx_cheeseburger-userdebug
export TZ=Asia/Dhaka #put before last build command
m styx-ota

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
