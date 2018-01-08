#!/system/bin/sh

# If there is not a persist value, we need to set one
if [ ! -f /data/property/persist.spectrum.profile ]; then
    setprop persist.spectrum.profile 0
fi

# 0 - Balance v1 by savagezen
# 1 - Battery v1.2 by savagezen (based on Flash Kernel Balance)
# 2 - Performance v2.1 by savagezen (based on Flash Kernel Performance)

# 3 - Glass Cannon by phantom146

# 4 - stable v2 by SoniCron
# 5 - butterfly v1.1 by SoniCron
# 6 - ghost pepper v1.1 by SoniCron
# 7 - maddog v1 by SoniCron
# 8 - silverfish v2.1 by SoniCron

# 9 - wingoku v4.1 by fapste (untested by me)

# 10 - heimdal v5 by heimdall
# 11 - vidar by heimdall (untested by me)

# 12 - pz_balance by deani77 (untested by me)
# 13 - px_battery_extreme by deani77 (untested by me)
# 14 - px_battery by deani77 (untested by me)
# 15 - px_battery by deani77 (untested by me)
# 16 - px_mix_7 by deani77 (untested by me)

# 17 - Black Pepper v1 by xperator
# 18 - Deadpool by xperator
# 19 - DeusEx by xperator
# 20 - DeusEx Revolution by xperator
# 21 - DragonFly v1 by xperator
# 22 - Excalibur v2 by xperator
# 23 - ReZero by xperator
# 24 - Saber v2 by xperator

# 25 - Dark Spice v7.5 by xSilas43
# 26 - eclipseR2 by xSilas43
