#!/system/xbin/busybox sh
#

# mount emmc
busybox mount -t vfat -o rw,dirsync,nosuid,nodev,noexec,relatime,uid=1000,gid=1015,fmask=0702,dmask=0702,allow_utime=0020 /dev/block/mmcblk1p1 /storage/sdcard1
