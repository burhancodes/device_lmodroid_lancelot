color="\033[0;32m"
end="\033[0m"

export KBUILD_BUILD_USER=Burhanverse
export KBUILD_BUILD_HOST=burhancodes
export BUILD_USERNAME=Burhanverse
export BUILD_HOSTNAME=burhancodes
export TARGET_KERNEL_BUILD_USER=Burhanverse
export TARGET_KERNEL_BUILD_HOST=burhancodes

# Clone dependencies
echo -e "${color}Cloning dependencies...${end}"
#motowidgets
git clone --depth 1 https://github.com/burhancodes/package_apps_MyUIWidgets packages/apps/MyUIWidgets
#motoclock
git clone --depth 1 https://github.com/burhancodes/package_apps_MotoClock packages/apps/MotoClock
#motocalendar
git clone --depth 1 https://github.com/burhancodes/packages_apps_MotoCalendar packages/apps/MotoCalendar
#micalculator
git clone --depth 1 https://github.com/burhancodes/package_apps_micalculator packages/apps/MiCalculator
#GoogleCamera
git clone --depth 1 https://github.com/burhancodes/packages_apps_GoogleCamera_8.1 packages/apps/GoogleCamera_8.1
# custom installer
git clone --depth 1 https://github.com/burhancodes/packages_apps_CustomPackageInstaller packages/apps/CustomPackageInstaller
# vendor
git clone --depth 1 https://github.com/burhancodes/vendor_xiaomi_lancelot vendor/xiaomi/lancelot
# kernel
git clone --depth 1 https://github.com/Burhanverse/KernelTree kernel/xiaomi/mt6768
# mtk sepolicy vendor
rm -rf device/mediatek/sepolicy_vndr
git clone --depth 1 https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr
# mtk hardware 
rm -rf hardware/mediatek
git clone --depth 1 https://github.com/LineageOS/android_hardware_mediatek hardware/mediatek
# clang
git clone --depth 1 https://gitlab.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-r487747c prebuilts/clang/host/linux-x86/clang-r487747c

echo -e "Dependencies cloned successfully!"

# Configure the patches path
patchDir="device/xiaomi/lancelot/patches"
echo -e "Patches Path: ${patchDir}"

echo -e "${color}Applying patches !${end}"

# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/1fb1c48309cf01deb9e3f8253cb7fa5961c25595.patch")"

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/a727c1f68fd30c8e6a4068db9dc26670d4a78f6c.patch")"

echo -e "${color}Patch applied successfully!${end}"
# Navigate to the kernel directory
cd kernel/xiaomi/mt6768
# Install KernelSU
echo -e "${color}Patching Kernel for KernelSU...${end}"
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
# Return to the original directory
cd ../../..
echo -e "${color}Kernel patched!${end}"
