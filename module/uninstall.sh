#!/system/bin/sh
# Runs when the module is removed
pkill -f blackui/service.sh
for c in system_neutral1_900 system_neutral2_900 system_neutral1_800 system_neutral2_800 system_surface_dark system_surface_dim_dark system_surface_bright_dark system_surface_variant_dark system_surface_container_lowest_dark system_surface_container_low_dark system_surface_container_dark system_surface_container_high_dark system_surface_container_highest_dark system_background_dark; do
  cmd overlay disable --user current com.android.shell:blk_$c
done
