#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11720704 33586c39a7090fc357b67c58a99bba7749b311c2 8960000 d7ff82f9f9bce5eda9e9e63746df95498c0ee62d
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:11720704:33586c39a7090fc357b67c58a99bba7749b311c2; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8960000:d7ff82f9f9bce5eda9e9e63746df95498c0ee62d EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 33586c39a7090fc357b67c58a99bba7749b311c2 11720704 d7ff82f9f9bce5eda9e9e63746df95498c0ee62d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
