#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:9648128:47889cc7eb0ae0be27b981101baadd7c697938d7; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:8691712:f70406af4cd8a937752cc5a0e11f96c39c614541 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 72d9ade740a6a0c97dc1875aab08647b8b32f5f1 9646080 f70406af4cd8a937752cc5a0e11f96c39c614541:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=9646080 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
