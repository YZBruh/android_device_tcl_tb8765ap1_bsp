/*
   Copyright (C) 2017-2018 The Android Open Source Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <unistd.h>
#include <fcntl.h>
#include <fstream>
#include <string>
#include <iostream>
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <sys/mount.h>
#include <sys/stat.h>

#include "property_service.h"
#include "log.h"

namespace android {
namespace init {

void load_model(const char *model) {
    property_set("ro.product.model", model);
    property_set("ro.build.product", "tb8765ap1_bsp");
    property_set("ro.product.device", "tb8765ap1_bsp");
    property_set("ro.vendor.product.device", "tb8765ap1_bsp");
    property_set("ro.display.series", "Alcatel 3T 10");
}

void vendor_load_properties() {
    /* Create the directory to which the vendor will connect  */
    if (mkdir("/vendorcontrol", 0644) != 0) {
        LOG(ERROR) << __func__ << ": control dir cannot generate!";
    }

    /* flag */
    unsigned long mount_flags = MS_RDONLY;
    /* mount vendor read-only*/
    if (mount("/dev/block/by-name/vendor", "/vendorcontrol", "ext4", mount_flags, nullptr) != 0) {
        LOG(ERROR) << __func__ << ": vendor not mounting!";
    }
    std::string file_path = "/vendorcontrol/build.prop";
    std::ifstream file(file_path);

    /* open /vendor/build.prop */
    if (!file.is_open()) {
        LOG(ERROR) << __func__ << ": vendor propertie file not found!";
    }

    std::string line;
    std::string target_property = "ro.product.vendor.model";
    std::string property_value;

    /* get ro.product.vendor.model */
    while (std::getline(file, line)) {
        if (line.find(target_property) != std::string::npos) {
            size_t pos = line.find("=");
            if (pos != std::string::npos) {
                property_value = line.substr(pos + 1);
                break;
            }
        }
    }

    /* close file */
    file.close();

    /* check prop value */
    if (!property_value.empty()) {
        switch (property_value) {
            /* load global props */
           case "8088X":
                load_model("8088X");
                break;
            /* load eea props */
           case "8088X_EEA":
                load_model("8088X_EEA");
                break;
            /* I hope not */
            case '?':
                LOG(ERROR) << __func__ << ": unexpected propertie!";
                break;
        }
    } else {
        LOG(ERROR) << __func__ << ": vendor propertie not found; ro.product.vendor.model";
    }

    /* umount vendor */
    if (umount("/vendorcontrol") != 0) {
        LOG(ERROR) << __func__ << ": vendor not unmounting!";
    }

    /* delete control dir */
    if (rmdir("/vendorcontrol") != 0) {
        LOG(ERROR) << __func__ << ": control dir cannot delete!";
    }
}

}  // namespace init
}  // namespace android
