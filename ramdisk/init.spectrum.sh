#!/system/bin/sh
# SPECTRUM KERNEL MANAGER
# Profile initialization script by nathanchance

# If there is not a persist value, we need to set one
if [ ! -f /data/property/persist.spectrum.profile ]; then
    setprop persist.spectrum.profile 0
fi

## Profiles available in Spectrum app:
# 0 - Balance v1.1 by savagezen (default)
# 1 - Performance v2.2 by savagezen
# 2 - Battery v1.3 by savagezen
# 3 - Gaming v1 by savagezen

## Profiles only available in source:
# 4 - Flash Kernel Balance / glass cannon by phanotom146
# 5 - Flash Kernel Performance by nathanchance
# 6 - Flash Kernel Battery by nathanchance
# 7 - stable by SoniCron
# 8 - butterfly by SoniCron
# 9 - ghost pepper by SoniCron
# 10 - maddog by SoniCron
# 11 - silverfish by SoniCron
# 12 - wingoku by fpaste
# 13 - heimdall by heimdall
# 14 - vidar by heimdall
# 15 - pz_balance by deani77
# 16 - px_battery_extreme by deani77
# 17 - px_battery by deani77
# 18 - pz_battery by deani77
# 19 - px_mix by deani77
# 20 - black pepper by xperator
# 21 - deadpool by xperator
# 22 - Deus Ex by xperator
# 23 - Deus Ex Revolutionj by xperator
# 24 - Dragonfly by xperator
# 25 - Excalibur by xperator
# 26 - ReZero by xperator
# 27 - Saber by xperator
# 28 - DarkSpice by xSilas43
# 29 - Eclipse by xSilas43

