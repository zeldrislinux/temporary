# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/P-404/platform_manifest -b rippa -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/MLZ94/local_manifest -b p404 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
cd vendor/codeaurora/commonsys/telephony
git fetch https://github.com/CartelProject/vendor_codeaurora_telephony/
git cherry-pick 5182419988e51734d88d7428b9a22a5660c185af
cd ..
cd ..
cd ..

# build rom
source build/envsetup.sh
lunch p404_X00QD-userdebug
make bacon

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/pro*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
rclone copy out/target/product/pro*.zip cirrus:X00QD -P

