Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA9CC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 19:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD0110E99A;
	Thu,  2 Nov 2023 19:51:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86E510E99A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 19:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698954666; x=1730490666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gNWlp5+BjfZO0XfyrbMOR0fpTJsdFiTIgL2d96TuP0I=;
 b=FphWc7DQt2kEqU0/lk6xbw0rsAtxiYqIVz045M+TXO7OGideJWf9ZPb4
 CIXN/9OaypHXvmglTe07oWU+Kx34+/BzsHYRPUxHuTYLA+PsAHaSPBRlO
 ePHs4G3pZYKvmWfw34WEPuYJ4QcqfBZCTd3UzAVzVDFKHcwDa+6kOtHv9
 NPtzSqqJe2uifPhDU55MLo71vGBGodyi2iytxQ1p87YcqXtAySES/f+CV
 Af9U4Y7kQEFchuSkcjgpiS2hRucWifCPVhL4KRd2Dz+8+63n0J//AXdx7
 xwtbGTs5/3jdR07xqsQEzE9gNQFlNH8ET9q7aAoN6Sf/zQe+yzZyOHCaD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="387677563"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="387677563"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 12:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827249942"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="827249942"
Received: from dut125tglh.fm.intel.com ([10.105.23.10])
 by fmsmga008.fm.intel.com with ESMTP; 02 Nov 2023 12:51:05 -0700
From: Bommithi Sakeena <bommithi.sakeena@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Nov 2023 19:51:02 +0000
Message-Id: <20231102195102.4144-1-bommithi.sakeena@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Encapsulate all the module parameters
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Encapsulate all the module paramters in one single global struct
variable. This also removes the extra xe_module.h from includes.

v2: naming consistency as suggested by Jani and Lucas

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c  |  2 +-
 drivers/gpu/drm/xe/xe_display.c |  4 ++--
 drivers/gpu/drm/xe/xe_guc_log.c |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c    |  2 +-
 drivers/gpu/drm/xe/xe_module.c  | 29 ++++++++++++++---------------
 drivers/gpu/drm/xe/xe_module.h  | 23 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_pci.c     |  6 +++---
 drivers/gpu/drm/xe/xe_uc_fw.c   |  6 +++---
 8 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8341acf66e5f..5e682ba68ec4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -223,7 +223,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = force_execlist;
+	xe->info.force_execlist = xe_modparam.force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index da10f16e1c12..74391d9b11ae 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
  */
 bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 {
-	if (!enable_display)
+	if (!xe_modparam.enable_display)
 		return 0;
 
 	return intel_display_driver_probe_defer(pdev);
@@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
  */
 void xe_display_driver_set_hooks(struct drm_driver *driver)
 {
-	if (!enable_display)
+	if (!xe_modparam.enable_display)
 		return;
 
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 45c60a9c631c..27c3827bfd05 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
 	log->bo = bo;
-	log->level = xe_guc_log_level;
+	log->level = xe_modparam.guc_log_level;
 
 	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0da4f75c07bf..9f5a7e1bd695 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
  */
 static void xe_resize_vram_bar(struct xe_device *xe)
 {
-	u64 force_vram_bar_size = xe_force_vram_bar_size;
+	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct pci_bus *root = pdev->bus;
 	resource_size_t current_size;
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7194595e7f31..1ea883f48c63 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,39 +10,38 @@
 
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
-#include "xe_module.h"
 #include "xe_pci.h"
 #include "xe_pmu.h"
 #include "xe_sched_job.h"
 
-bool force_execlist = false;
-module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
+struct xe_modparam xe_modparam = {
+	.enable_display = true,
+	.guc_log_level = 5,
+	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	/* the rest are 0 by default */
+};
+
+module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
-bool enable_display = true;
-module_param_named(enable_display, enable_display, bool, 0444);
+module_param_named(enable_display, xe_modparam.enable_display, bool, 0444);
 MODULE_PARM_DESC(enable_display, "Enable display");
 
-u32 xe_force_vram_bar_size;
-module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
+module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, uint, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
 
-int xe_guc_log_level = 5;
-module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
+module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
 
-char *xe_guc_firmware_path;
-module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
+module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,
 		 "GuC firmware path to use instead of the default one");
 
-char *xe_huc_firmware_path;
-module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
+module_param_named_unsafe(huc_firmware_path, xe_modparam.huc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(huc_firmware_path,
 		 "HuC firmware path to use instead of the default one - empty string disables");
 
-char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
-module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
+module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index e1da1e9ca5cb..def912235007 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -3,13 +3,22 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#ifndef _XE_MODULE_H_
+#define _XE_MODULE_H_
+
 #include <linux/types.h>
 
 /* Module modprobe variables */
-extern bool force_execlist;
-extern bool enable_display;
-extern u32 xe_force_vram_bar_size;
-extern int xe_guc_log_level;
-extern char *xe_guc_firmware_path;
-extern char *xe_huc_firmware_path;
-extern char *xe_param_force_probe;
+struct xe_modparam {
+        bool force_execlist;
+        bool enable_display;
+        u32 force_vram_bar_size;
+        int guc_log_level;
+        char *guc_firmware_path;
+        char *huc_firmware_path;
+        char *force_probe;
+};
+extern struct xe_modparam xe_modparam;
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2fae45b9d88e..9de5bac4a5f3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -417,12 +417,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
 
 static bool id_forced(u16 device_id)
 {
-	return device_id_in_list(device_id, xe_param_force_probe, false);
+	return device_id_in_list(device_id, xe_modparam.force_probe, false);
 }
 
 static bool id_blocked(u16 device_id)
 {
-	return device_id_in_list(device_id, xe_param_force_probe, true);
+	return device_id_in_list(device_id, xe_modparam.force_probe, true);
 }
 
 static const struct xe_subplatform_desc *
@@ -591,7 +591,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  enable_display &&
+				  xe_modparam.enable_display &&
 				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3032c4f148d4..25778887d846 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -220,11 +220,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
 	/* empty string disables, but it's not allowed for GuC */
 	switch (uc_fw->type) {
 	case XE_UC_FW_TYPE_GUC:
-		if (xe_guc_firmware_path && *xe_guc_firmware_path)
-			path_override = xe_guc_firmware_path;
+		if (xe_modparam.guc_firmware_path && *xe_modparam.guc_firmware_path)
+			path_override = xe_modparam.guc_firmware_path;
 		break;
 	case XE_UC_FW_TYPE_HUC:
-		path_override = xe_huc_firmware_path;
+		path_override = xe_modparam.huc_firmware_path;
 		break;
 	default:
 		break;
-- 
2.34.1

