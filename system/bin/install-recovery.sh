#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9111552:69ed4c12f3c6d13beed6d86b5f2a7bfc2328c097; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8144896:d2f20bb6585d1bcc49450d392087b3d743ab264e EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 49b42c2ab0eb6181c1058b570b5b8bef087d1500 9109504 d2f20bb6585d1bcc49450d392087b3d743ab264e:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9109504 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
