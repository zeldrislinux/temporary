# sync rom
repo init --depth=1 --no-repo-verify -u git://github.com/Spark-Rom/manifest.git -b fire -g default,-mips,-darwin,-notdefault
git clone https://github.com/Th30utlaw/local_manifest.git --depth 1 -b spark .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch spark_olives-user
export TZ=Asia/Dhaka #put before last build command
mka spark

# upload rom (if you don't need to upload multiple files, then you don't need to edit next line)
curl -sL https://git.io/file-transfer | sh 
./transfer wet out/target/product/olives/Spark*.zip
