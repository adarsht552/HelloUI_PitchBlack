#!/system/bin/sh
SKIPUNZIP=0
ui_print "- Hello UI Pitch Black"
ui_print "- Reboot after flashing."
ui_print "- Black is re-applied automatically after SystemUI restarts."
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/uninstall.sh 0 0 0755
