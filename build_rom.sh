# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Project-Fluid/manifest.git -b fluid-11 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/JamieHoSzeYui/manifest -b fluid --depth 1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
source device/google/crosshatch/vendorsetup.sh
lunch fluid_blueline-user
export TZ=Asia/Dhaka #put before last build command

# Pixels requires a special build workaround.
m
cd out/target/product/blueline/
zip -r images.zip *img 
curl -sL https://git.io/file-transfer | sh
./transfer wet images.zip 
rm -rf images.zip 
cd ../../../../

USER=
# Generate factory images pkg
m target-files-package
m otatools-package
python2 out/soong/host/linux-x86/bin/img_from_target_files \
    out/target/product/blueline/obj/PACKAGING/target_files_intermediates/blueline-target_files-eng.$USER.zip \
    out/target/product/blueline/obj/PACKAGING/target_files_intermediates/blueline-img-eng.$USER.zip
cd device/google/crosshatch/factory-images_blueline/
./generate-factory-images-package.sh
curl -sL https://git.io/file-transfer | sh
./transfer wet *.zip 

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
# rclone copy out/target/product/$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)/*.zip cirrus:$(grep unch $CIRRUS_WORKING_DIR/build_rom.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1) -P
