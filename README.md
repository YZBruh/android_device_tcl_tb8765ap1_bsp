# TWRP device tree for Alcatel 3T 10

|Basic               |Spec Sheet                                                    |
|--                  |--                                                            |
|CPU                 |Quad-core (4x1.28 GHz ARM Cortex A53)                         |
|Chipset             |MediaTek MT8765WB                                             |
|GPU                 |IMG PowerVR GE8100                                            |
|Memory              |2/3GB RAM                                                     |
|Android Version     |9                                                             |
|Storage             |16/32GB                                                       |

## Working Feature
- Vibration (device does not support)
- Flashing .img/zip
- ADB Sideload
- Terminal/Console
- External Storage (SD and OTG)
- MTP

## Bugs and Issues
- Internal Storage (Since it is not a stock ROM, there are no necessary things. We are working on it)

## Notes
- To decrypt, execute the following command in TWRP terminal:
```
bash decrypt
```
To re-encrypt:
```
bash encrypt
```
Scripts language is Turkish! If the process is completed successfully, format the data partition as EXT4.
- Report problems.
- Stock images in publications

## Credits
- TeamWin Recovery Project (Source)
- Thank you @kelexine
