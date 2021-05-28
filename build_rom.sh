# sync ro
repo init --depth=1 --no-repo-verify -u https://github.com/Project-Xtended/manifest.git -b xr -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/Shazu-xD/local_manifest.git --depth 1 -b Msm .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch xtended_RMX1801-userdebug
mka bacon -j$(nproc --all)

# upload rom
rclone copy out/target/product/RMX1801/Xtended*.zip cirrus:RMX1801 -P
