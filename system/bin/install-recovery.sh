#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9111552:d5afd399b38b79c99850a2983f09303e8bd134bb; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8144896:f48225ac88c9390b921a9ee16f422bd65512b401 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery a9405a95507a0168c8f607d08aa99348bd72a57c 9109504 f48225ac88c9390b921a9ee16f422bd65512b401:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9109504 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
