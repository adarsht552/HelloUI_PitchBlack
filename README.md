# Hello UI Pitch Black

A Magisk / KernelSU module that turns Motorola **Hello UI** dark mode into true AMOLED black, with no app installed on the phone.

It works by creating *fabricated runtime resource overlays* (`cmd overlay fabricate`) that override Android's Material You dark-theme colors with `#000000`. A small watcher re-applies them if they disappear (for example after a SystemUI restart).

## Requirements
- Rooted Motorola phone running Hello UI (tested on Android 15/16 based builds)
- Magisk v20.4+ or KernelSU

## Install
1. Download the zip from Releases (or run `./build.sh`).
2. Magisk / KernelSU → Modules → Install from storage → select the zip.
3. Reboot and wait about 30 seconds on the home screen.

Verify:
```
su -c 'cmd overlay list | grep blk_'
```
You should see about 14 entries marked `[x]`.

## What it changes
The colors overridden are in `module/service.sh` (`LIST=`): the `system_neutral1/2_800/900`, `system_surface_*_dark` and `system_background_dark` resources.

## Limitations
- Apps with their own hardcoded gray dark themes are not affected.
- The blurred notification-shade backdrop is not affected.
- Tile size and shape cannot be changed this way (the shell command only supports integer, bool and color types).
- Some resource names may not exist on every build; a missing one just prints an error and the rest still apply.

## Uninstall
Remove the module in Magisk / KernelSU and reboot. `uninstall.sh` disables the overlays.

## Build
```
./build.sh
```
The zip is written to `dist/`.

## License
MIT
