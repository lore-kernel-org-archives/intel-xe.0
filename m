Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C18CDB470
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 17:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8AD10E00D;
	Wed, 11 Oct 2023 17:43:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D576810E00D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697046198; x=1728582198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a+OzEMuvw0jYVvIvOqaXtaPUWTY1Xa9qYXYASCa7GAs=;
 b=HIbKKKYgn0cqlBXOqQEHmWq2/VksXxEJrpOeRqkLAvLxNlZud0cyqPQO
 XalTTvEPNZpHDlnxbsjC4gQqP4VeViPWAoCRdtCUkkl8WXptgZ6ZFRVmG
 KmHoUFsfhCU4lkfGmdA4T8MIqOfBEX5yJnVjFc7Otr5Q2C98IlJ5CnvaK
 SuAloVWCIo2oeG4ZWVXKw33KFOPT4IgXhzD+V8MTNzV8IJF2/C6I9g557
 7A9pUsyQ/yFL6FCBihPe+mgzhc6kAhM/u4ToItnIswREuhreNB28wnYCp
 XBqHrf+mgP7YuxKh+webKOR8TTD09whOeMPmSVmXU0q8NM9FDXJIESM37 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="448926748"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="448926748"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 10:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897719410"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="897719410"
Received: from dut134tglu.fm.intel.com ([10.105.22.35])
 by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 10:41:09 -0700
From: Bommithi Sakeena <bommithi.sakeena@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:42:52 +0000
Message-Id: <20231011174252.10427-1-bommithi.sakeena@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Encapsulate all the module paramters in one single global struct
variable inside the new xe_modparam.h.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   |  4 ++--
 drivers/gpu/drm/xe/xe_display.c  |  6 +++---
 drivers/gpu/drm/xe/xe_guc_log.c  |  4 ++--
 drivers/gpu/drm/xe/xe_mmio.c     |  4 ++--
 drivers/gpu/drm/xe/xe_modparam.h | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_module.c   | 32 +++++++++++++++-----------------
 drivers/gpu/drm/xe/xe_pci.c      |  8 ++++----
 drivers/gpu/drm/xe/xe_uc_fw.c    |  8 ++++----
 8 files changed, 55 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_modparam.h

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ef42c33e3055..0cf908089483 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -25,7 +25,7 @@
 #include "xe_gt.h"
 #include "xe_irq.h"
 #include "xe_mmio.h"
-#include "xe_module.h"
+#include "xe_modparam.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -224,7 +224,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = force_execlist;
+	xe->info.force_execlist = xe_mod_param.force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 391f08c1caca..0b55037c1da1 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -27,7 +27,7 @@
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
-#include "xe_module.h"
+#include "xe_modparam.h"
 
 /* Xe device functions */
 
@@ -45,7 +45,7 @@ static bool has_display(struct xe_device *xe)
  */
 bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 {
-	if (!enable_display)
+	if (!xe_mod_param.enable_display)
 		return 0;
 
 	return intel_display_driver_probe_defer(pdev);
@@ -69,7 +69,7 @@ static void xe_display_last_close(struct drm_device *dev)
  */
 void xe_display_driver_set_hooks(struct drm_driver *driver)
 {
-	if (!enable_display)
+	if (!xe_mod_param.enable_display)
 		return;
 
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 45c60a9c631c..111ca5433c69 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -10,7 +10,7 @@
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_map.h"
-#include "xe_module.h"
+#include "xe_modparam.h"
 
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
@@ -100,7 +100,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	xe_map_memset(xe, &bo->vmap, 0, 0, guc_log_size());
 	log->bo = bo;
-	log->level = xe_guc_log_level;
+	log->level = xe_mod_param.xe_guc_log_level;
 
 	err = drmm_add_action_or_reset(&xe->drm, guc_log_fini, log);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index e4cf9bfec422..717fcdcb5c7d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -18,7 +18,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
-#include "xe_module.h"
+#include "xe_modparam.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
@@ -73,7 +73,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
  */
 static void xe_resize_vram_bar(struct xe_device *xe)
 {
-	u64 force_vram_bar_size = xe_force_vram_bar_size;
+	u64 force_vram_bar_size = xe_mod_param.xe_force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct pci_bus *root = pdev->bus;
 	resource_size_t current_size;
diff --git a/drivers/gpu/drm/xe/xe_modparam.h b/drivers/gpu/drm/xe/xe_modparam.h
new file mode 100644
index 000000000000..efa246616d3f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_modparam.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MODPARAM_H_
+#define _XE_MODPARAM_H_
+
+#include <linux/types.h>
+
+/* Module modprobe variables */
+struct xe_module_parameters {
+	bool force_execlist;
+	bool enable_display;
+	u32 xe_force_vram_bar_size;
+	int xe_guc_log_level;
+	char *xe_guc_firmware_path;
+	char *xe_huc_firmware_path;
+	char *xe_param_force_probe;
+};
+extern struct xe_module_parameters xe_mod_param;
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7194595e7f31..31ed68fcd087 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -3,46 +3,44 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include "xe_module.h"
-
 #include <linux/init.h>
 #include <linux/module.h>
 
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
-#include "xe_module.h"
+#include "xe_modparam.h"
 #include "xe_pci.h"
 #include "xe_pmu.h"
 #include "xe_sched_job.h"
 
-bool force_execlist = false;
-module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
+struct xe_module_parameters xe_mod_param = {
+	.enable_display = true,
+	.xe_guc_log_level = 5,
+	.xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	/* the rest are 0 by default */
+};
+
+module_param_named_unsafe(force_execlist, xe_mod_param.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
-bool enable_display = true;
-module_param_named(enable_display, enable_display, bool, 0444);
+module_param_named(enable_display, xe_mod_param.enable_display, bool, 0444);
 MODULE_PARM_DESC(enable_display, "Enable display");
 
-u32 xe_force_vram_bar_size;
-module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
+module_param_named(vram_bar_size, xe_mod_param.xe_force_vram_bar_size, uint, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
 
-int xe_guc_log_level = 5;
-module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
+module_param_named(guc_log_level, xe_mod_param.xe_guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
 
-char *xe_guc_firmware_path;
-module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
+module_param_named_unsafe(guc_firmware_path, xe_mod_param.xe_guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,
 		 "GuC firmware path to use instead of the default one");
 
-char *xe_huc_firmware_path;
-module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
+module_param_named_unsafe(huc_firmware_path, xe_mod_param.xe_huc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(huc_firmware_path,
 		 "HuC firmware path to use instead of the default one - empty string disables");
 
-char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
-module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
+module_param_named_unsafe(force_probe, xe_mod_param.xe_param_force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 99ccee07f8cd..29bcf7565741 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,7 +21,7 @@
 #include "xe_drv.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
-#include "xe_module.h"
+#include "xe_modparam.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_step.h"
@@ -414,12 +414,12 @@ static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
 
 static bool id_forced(u16 device_id)
 {
-	return device_id_in_list(device_id, xe_param_force_probe, false);
+	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, false);
 }
 
 static bool id_blocked(u16 device_id)
 {
-	return device_id_in_list(device_id, xe_param_force_probe, true);
+	return device_id_in_list(device_id, xe_mod_param.xe_param_force_probe, true);
 }
 
 static const struct xe_subplatform_desc *
@@ -587,7 +587,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  enable_display &&
+				  xe_mod_param.enable_display &&
 				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 138960138872..854e4ba027e1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -15,7 +15,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
-#include "xe_module.h"
+#include "xe_modparam.h"
 #include "xe_uc_fw.h"
 
 /*
@@ -219,11 +219,11 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
 	/* empty string disables, but it's not allowed for GuC */
 	switch (uc_fw->type) {
 	case XE_UC_FW_TYPE_GUC:
-		if (xe_guc_firmware_path && *xe_guc_firmware_path)
-			path_override = xe_guc_firmware_path;
+		if (xe_mod_param.xe_guc_firmware_path && xe_mod_param.xe_guc_firmware_path)
+			path_override = xe_mod_param.xe_guc_firmware_path;
 		break;
 	case XE_UC_FW_TYPE_HUC:
-		path_override = xe_huc_firmware_path;
+		path_override = xe_mod_param.xe_huc_firmware_path;
 		break;
 	default:
 		break;
-- 
2.34.1

