# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers
# parts taken from Flash Kenrel by @nathanchance
# parts taken from Fraco Kernel by @franciscofranco

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Nexus 6P Angler Kernel
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=angler
device.name2=Angler
device.name3=
device.name4=
device.name5=
'; } # end properties

# shell variables
block=/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## Alert of unsupported Android version
android_ver=$(mount /system; grep "^ro.build.version.release" /system/build.prop | cut -d= -f2; umount /system);
case "$android_ver" in
  "7.0"|"7.1"|"7.1.1"|"7.1.2"|"8.0.0") compatibility_string="your version is unsupported, expect no support!";;
  "8.1.0") compatibility_string="your version is supported!";;
esac;
ui_print "Running Android $android_ver, $compatibility_string";

## AnyKernel install
dump_boot;

# begin ramdisk changes

# fstab.angler
insert_line fstab.angler "data           f2fs" after "data           ext4" "/dev/block/platform/soc.0/f9824900.sdhci/by-name/userdata     /data           
f2fs    rw,nosuid,nodev,noatime,nodiratime,inline_xattr 
wait,formattable,encryptable=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata";
insert_line fstab.angler "cache          f2fs" after "cache          ext4" "/dev/block/platform/soc.0/f9824900.sdhci/by-name/cache        
/cache          f2fs    rw,nosuid,nodev,noatime,nodiratime,inline_xattr wait,check,formattable";
patch_fstab fstab.angler none swap flags "zramsize=533413200" "zramsize=1066826400";
patch_fstab fstab.angler /system ext4 flags "wait,verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata" "wait";
patch_fstab fstab.angler /vendor ext4 flags "wait,verify=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata" "wait";
patch_fstab fstab.angler /data ext4 flags "wait,check,forcefdeorfbe=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata" "wait,check,encryptable=/dev/block/platform/soc.0/f9824900.sdhci/by-name/metadata";

# init.rc
#insert_line init.angler.rc "init.fk.rc" after "import init.angler.sensorhub.rc" "import init.fk.rc";
#insert_line init.angler.rc "performance_profiles" after "import init.angler.sensorhub.rc" "import init.performance_profiles.rc";

# end ramdisk changes

write_boot;

## end install

