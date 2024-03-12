#!/sbin/sh

T6_TW="/mnt/vendor/persist/t6_tw"
T6="/mnt/vendor/persist/t6"

if [ -d $T6_TW ]; then
    rm -rf $T6_TW
    mkdir $T6_TW
else
    mkdir $T6_TW
fi

cp -rfp $T6/* $T6_TW/
if [ ! "$?" == "0" ]; then
    exit 1
fi
