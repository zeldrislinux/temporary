# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/AOSPA/manifest -b ruby -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/flashokiller/mainfest_personal/ --depth 1 -b pa-ysl .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
#source build/envsetup.sh
#lunch pa_ysl-userdebug
export TZ=Asia/kolkata #put before last build command
./rom-build.sh ysl 

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
rclone copy out/target/product/ysl/2021
