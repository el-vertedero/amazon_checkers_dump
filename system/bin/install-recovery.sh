#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9111552:2a19ba282ae734ef6b88cf96a9590ab8dfed05f3; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8144896:fb25cf67edfc1651957764a33a05a4980f5c9147 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery f6d3ce0ca255070fc419f9b2004fe5980e16d4f9 9109504 fb25cf67edfc1651957764a33a05a4980f5c9147:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9109504 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
