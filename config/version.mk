# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Gapps
ifeq ($(WITH_GAPPS),true)
	CATALYST_BUILD_ZIP_TYPE := GAPPS
else
	CATALYST_BUILD_ZIP_TYPE := VANILLA
endif

CATALYST_MOD_VERSION = 1.1
CATALYST_BUILD_TYPE := MOD

ifeq ($(CATALYST_BETA),true)
    CATALYST_BUILD_TYPE := BETA
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(CATALYST_OFFICIAL), true)
    IS_OFFICIAL=true
    CATALYST_BUILD_TYPE := OFFICIAL

PRODUCT_PACKAGES += \
    Updater

endif

CATALYST_VERSION := CatalystOS-$(CATALYST_MOD_VERSION)-$(CATALYST_BUILD_TYPE)-$(shell date -u +%Y%m%d)-$(CATALYST_BUILD_ZIP_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.catalyst.version=$(CATALYST_VERSION) \
  ro.catalyst.releasetype=$(CATALYST_BUILD_TYPE) \
  ro.catalyst.ziptype=$(CATALYST_BUILD_ZIP_TYPE) \
  ro.modversion=$(CATALYST_MOD_VERSION)

CATALYST_DISPLAY_VERSION := CatalystOS-$(CATALYST_MOD_VERSION)-$(CATALYST_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.catalyst.display.version=$(CATALYST_DISPLAY_VERSION)
