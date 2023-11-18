LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Debloater
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := \
    bcr \
    Browser2 \
    FMRadio \
    Browser \
    F-Droid \
    F-DroidPrivilegedExtension \
    AndroidAutoStubPrebuilt \
    AmbientSensePrebuilt \
    CalculatorGooglePrebuilt \
    CalendarGooglePrebuilt \
    Chrome-Stub \
    DeskClock \
    Drive \
    Eleven \
    Etar \
    ExactCalculator \
    yetCalc \
    Gallery2 \
    Jelly \
    Music \
    MusicPlayerGO \
    MaestroPrebuilt \
    MatLog \
    Maps \
    Gmail2 \
    PersonalSafety \
    Photos \
    PrebuiltDeskClockGoogle \
    Recorder \
    RecorderPrebuilt \
    SafetyHubPrebuilt \
    Snap \
    Turbo \
    TurboPrebuilt \
    TipsPrebuilt \
    Velvet \
    YouTube
    
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)