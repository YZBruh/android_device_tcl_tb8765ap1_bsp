# TWRP device tree for Alcatel 3T 10

|Basic               |Spec Sheet                                                    |
|--                  |--                                                            |
|CPU                 |Quad-core (4x1.28 GHz ARM Cortex A53)                         |
|Chipset             |MediaTek MT8765WB                                             |
|GPU                 |IMG PowerVR GE8100                                            |
|Memory              |2/3GB RAM                                                     |
|Android Version     |9                                                             |
|Storage             |16/32GB                                                       |

## Situation
- [X] Correct screen/recovery size
- [x] Working Touch, screen
- [X] Backup to internal/microSD
- [X] Restore from internal/microSD
- [x] reboot to system
- [X] ADB

Medium checks
- [X] update.zip sideload
- [X] UI colors (red/blue inversions)
- [X] Screen goes off and on
- [X] F2FS/EXT4 Support, exFAT/NTFS where supported
- [X] all important partitions listed in mount/backup lists
- [X] backup/restore to/from external (USB-OTG) storage
- [X] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [ ] decrypt /data
- [X] Correct date

Minor checks
- [X] MTP export
- [X] reboot to bootloader
- [X] reboot to recovery
- [X] poweroff
- [X] battery level
- [X] temperature
- [X] encrypted backups
- [x] input devices via USB (USB-OTG) - keyboard, mouse and disks
- [x] USB mass storage export
- [x] set brightness
- [x] vibrate (not supporting)
- [X] screenshot
- [x] partition SD card

## Credits
- [TeamWin Recovery Project (Source)](https://github.com/TeamWin)
- Thank you [kelexine](https://github.com/kelexine)
