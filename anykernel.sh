# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Nexus 6P Angler Kernel
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=angler
device.name2=Angler
device.name3=
device.name4=
device.name5=
} # end properties

# shell variables
block=/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot;
is_slot_device=0;

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

# init.savagezen.rc
insert_line init.angler.rc "init.savagezen.rc" after "import.angler.sensorhub.rc" "import init.savagezen.rc";

# init.rc
#backup_file init.rc;
#replace_string init.rc "cpuctl cpu,timer_slack" "mount cgroup none /dev/cpuctl cpu" "mount cgroup none /dev/cpuctl cpu,timer_slack";
#append_file init.rc "run-parts" init;

# init.tuna.rc
#backup_file init.tuna.rc;
#insert_line init.tuna.rc "nodiratime barrier=0" after "mount_all /fstab.tuna" "\tmount ext4 /dev/block/platform/omap/omap_hsmmc.0/by-name/userdata /data remount nosuid nodev noatime nodiratime barrier=0";
#append_file init.tuna.rc "dvbootscript" init.tuna;

# fstab.tuna
#backup_file fstab.tuna;
#patch_fstab fstab.tuna /system ext4 options "noatime,barrier=1" "noatime,nodiratime,barrier=0";
#patch_fstab fstab.tuna /cache ext4 options "barrier=1" "barrier=0,nomblk_io_submit";
#patch_fstab fstab.tuna /data ext4 options "data=ordered" "nomblk_io_submit,data=writeback";
#append_file fstab.tuna "usbdisk" fstab;

# end ramdisk changes

write_boot;

## end install

