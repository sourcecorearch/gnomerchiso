#!/usr/bin/env bash
iso_name="EosOS-gnome-desktop"
iso_label="EOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="EosOS GNU-Linux <https://github.com/sourcecorearch>"
iso_application="EosOS Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/sudoers"]="0:0:0440"
  ["/etc/sudoers.d"]="0:0:750"
  ["/etc/sudoers.d/g_wheel"]="0:0:440"
  ["/root"]="0:0:750"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/root/customize_airootfs.sh"]="0:0:755"
  ["/usr/local/bin/customize-profile.sh"]="0:0:755"
)
