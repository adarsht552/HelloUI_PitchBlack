#!/system/bin/sh
# Hello UI Pitch Black - runs at boot (late_start service)
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 2; done
sleep 10

cmd uimode night yes

LIST="system_neutral1_900 system_neutral2_900 system_neutral1_800 system_neutral2_800 system_surface_dark system_surface_dim_dark system_surface_bright_dark system_surface_variant_dark system_surface_container_lowest_dark system_surface_container_low_dark system_surface_container_dark system_surface_container_high_dark system_surface_container_highest_dark system_background_dark"

apply() {
  for c in $LIST; do
    cmd overlay fabricate --target android --name blk_$c android:color/$c 0x1c 0xff000000
    cmd overlay enable --user current com.android.shell:blk_$c
  done
}

apply

# Watcher: re-apply if overlays vanish (e.g. after a SystemUI restart)
while true; do
  sleep 5
  cmd overlay list 2>/dev/null | grep -q "\[x\] com.android.shell:blk_system_background_dark" || apply
done
