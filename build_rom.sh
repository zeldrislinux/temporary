# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/BlissRoms/platform_manifest -b arcadia -g default,-mips,-darwin,-notdefault
git clone https://github.com/00p513-dev/local_manifests -b bliss-arcadia-sargo --depth 1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch bliss_sargo-user
export BLISS_BUILD_VARIANT=gapps
export BLISS_BUILDTYPE=OFFICIAL
export TZ=Asia/Dhaka #put before last build command
m blissify

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P

for file in out/target/product/*/Bliss*.zip*
  curl --upload-file "$file" https://transfer.sh/$file
done
