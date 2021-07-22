# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/StyxProject/manifest.git -b R -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/JamieHoSzeYui/manifest --depth 1 -b styx .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j16

# apply required commits
cd frameworks/base/
git fetch https://github.com/JamieHoSzeYui/frameworks_base --depth=3 
git cherry-pick 34b692197912697521dd5bd4f1fedc83f0ca3d96 &&git cherry-pick 32cc051c3d14f072503a524e9617130324a26f4c &&git cherry-pick a3e3616b3327f56cc01da1bc529e20b755d2c0bb
cd ../../

# build rom
source build/envsetup.sh
lunch styx_cheeseburger-userdebug
export TZ=Asia/Dhaka #put before last build command
m styx-ota

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
