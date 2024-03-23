git clone --depth 1 https://github.com/burhancodes/package_apps_MyUIWidgets packages/apps/MyUIWidgets

git clone --depth 1 https://github.com/burhancodes/package_apps_MotoClock packages/apps/MotoClock

git clone --depth 1 https://github.com/burhancodes/packages_apps_MotoCalendar packages/apps/MotoCalendar

git clone --depth 1 https://github.com/burhancodes/package_apps_micalculator packages/apps/MiCalculator

git clone --depth 1 https://github.com/burhancodes/packages_apps_GoogleCamera_8.1 packages/apps/GoogleCamera_8.1

git clone --depth 1 https://github.com/burhancodes/packages_apps_CustomPackageInstaller packages/apps/CustomPackageInstaller

git clone --depth 1 https://github.com/burhancodes/vendor_lmodroid_lancelot vendor/xiaomi/lancelot

git clone --depth 1 https://github.com/burhancodes/BlackSapphire -b 14 kernel/xiaomi/mt6768
cd kernel/xiaomi/mt6768
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
cd ../../..

rm -rf device/mediatek/sepolicy_vndr
git clone --depth 1 https://github.com/Burhanverse/android_device_mediatek_sepolicy_vndr -b lineage-20 device/mediatek/sepolicy_vndr

rm -rf hardware/mediatek
git clone --depth 1 https://github.com/Burhanverse/android_hardware_mediatek -b lineage-20 hardware/mediatek

git clone --depth 1 https://gitlab.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-r487747c prebuilts/clang/host/linux-x86/clang-r487747c

echo -e "Applying patches..."

# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/1fb1c48309cf01deb9e3f8253cb7fa5961c25595.patch")"

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/a727c1f68fd30c8e6a4068db9dc26670d4a78f6c.patch")"

# HACK: telephony: Conditionally force enable LTE_CA
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/burhancodes/frameworks_base/commit/b497d0a812b8c8eb3e70157e3e037726d93e2e9f.patch")"

# Settings: Add a toggle to force LTE_CA
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/burhancodes/packages_apps_Settings/commit/d594556228a30dcdc2129028b6124d872df299d4.patch")"

echo -e "Patch applied successfully."
