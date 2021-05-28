# sync rom
repo init --depth=1 --no-repo-verify -u git://github.com/Havoc-OS/android_manifest.git -b eleven -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/boedhack/local_manifest.git --depth 1 -b havoc .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch havoc_mojito-userdebug
export WITH_GAPPS=true
export SKIP_API_CHECKS=true
export SKIP_ABI_CHECKS=true
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOWS=true
brunch mojito

# upload rom
rclone copy out/target/product/mojito/*.zip cirrus:mojito -P
