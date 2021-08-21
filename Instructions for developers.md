## Steps:
##### 1. Find your device tree, kernel tree, and vendor tree. I found [here](https://github.com/LineageOS). You can find your device tree, common tree, kernel tree mostly in [LineageOS](https://github.com/LineageOS/). You can find vendor tree mostly in [here](https://gitlab.com/the-muppets/proprietary_vendor_xiaomi) or, [here](https://github.com/TheMuppets). If your device is very new, or no development done before, then you may need to create your own device tree. Which is another subject to learn.

##### 2. Initialize the PixelExperience plus Edition Source

repo init -u https://github.com/PixelExperience/manifest -b eleven-plus

##### 3. clone device tree, common device tree, kernel tree, vendor tree by local manifist too.

`git clone https://github.com/Mishrahpp/local-Manifests.git --depth 1 -b main .repo/local_manifests`

##### 4. Sync the source.

`repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8`

##### 5. Clone device tree, common device tree, kernel tree and vendor tree for Redmi Note 6pro to specific folder. 
`### If you used local manifest to clone these trees, you must skip cloning these trees in this step. ###
`
git clone https://github.com/Mishrahpp/android_device_xiaomi_tulip device/xiaomi/tulip -b eleven --depth=1
git clone https://github.com/Mishrahpp/android_device_xiaomi_sdm660-common device/xiaomi/sdm660-common -b eleven --depth=1
git clone https://github.com/Mishrahpp/vendor_xiaomi_tulip vendor/xiaomi -b eleven --depth=1
git clone https://github.com/Mishrahpp/android_kernel_xiaomi_sdm660 kernel/xiaomi/sdm660 -b lineage-18.1 --depth=1
```

##### 6. Run the build commands for building AospExtended.

# Set up environment
$ . build/envsetup.sh

# Choose a target
$ lunch aosp_tulip-user

# Build the code
$ mka bacon -j$(nproc --all)


##### 7. Upload the output zip file (PixelExperience_Plus_tulip-11.0*.zip) to a safe place
```
up(){
	curl --upload-file $1 https://transfer.sh/$(basename $1); echo
	# 14 days, 10 GB limit
}

up out/target/product/tulip/*.zip
```
##### 8. All these steps should be inside build_rom.sh script like [this](https://github.com/Apon77/mido-AospExtended-Apon77/blob/main/build_rom.sh).

##### 9. You can use this repository as a standard reference and edit things according to your device, ROM, and needs


Best Wishes...........
