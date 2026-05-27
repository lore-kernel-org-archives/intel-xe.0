Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02754CD5BC9
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 10:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F88710E312;
	Wed, 27 May 2026 10:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqe3hBx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CCC10E312
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779876429; x=1811412429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pbJCmFEGF2KVD4hXR6NXekiH+BgUazr+1sQdz17Rdzk=;
 b=dqe3hBx+Q3KeqGWM5efs9Spr0XjzfVlwzZ06wydM8dzbkXxJ7lhRZV+i
 k0hPdtj/YweKrtvp4E1BylWpBwvSVHhnxKxhJdM6qfcTh/pcGm6lgvou7
 G6VQWf6FJGhgth7VIvtNJn37hqUrqy3Sqg6JxLuLUSl7U/gLGhOhyZ0We
 /x1Bwu/URFSgZ2O70teOf/IeWSe9Ps2/PkFBwJfcFwXk5wwP3bjWp7sin
 4nC2eKmXggcJNqvFxXlNZXia1ibDKSbzFWNX2gZJ3rxTnNA9BWCOtwZnn
 6acPeBl2uliahXsIfXDubVhRNomyq8GffeuDHB59XmdV17totasI8PyQF Q==;
X-CSE-ConnectionGUID: Y+eoexaJSCSBX6Wnn9bj/A==
X-CSE-MsgGUID: sdTiSEYGSma/hHhTjP1lgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80812641"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80812641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:07:09 -0700
X-CSE-ConnectionGUID: ds22FFFXTpuVl0nvvopUbQ==
X-CSE-MsgGUID: RH6iNhI2SEy0/cnGlFAWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="246221383"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2026 03:07:05 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe: add configfs knobs to disable RC6 and MC6 at driver
 load
Date: Wed, 27 May 2026 15:34:02 +0530
Message-ID: <20260527100401.612233-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

Currently RC6 (render C6) and MC6 (media C6) are always enabled by
the driver when it programs RC_CONTROL. There is no way to turn them
off before the driver starts using the device, which is needed for
power, perf and silicon debug.

Add two per-device configfs attributes that gate the C6 enable at
driver load time.

  /sys/kernel/config/xe/<BDF>/enable_rc6   (default: 1)
  /sys/kernel/config/xe/<BDF>/enable_mc6   (default: 1)

  echo 0 > enable_rc6   -> rc6 is not enabled on the render GT
  echo 0 > enable_mc6   -> mc6 is not enabled on the media  GT

The values must be written before the device is bound to the driver,
exactly like the other xe configfs attributes. Defaults are 1 so
existing setups keep prior behavior.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 119 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |   4 ++
 drivers/gpu/drm/xe/xe_gt_idle.c  |  33 ++++++++-
 drivers/gpu/drm/xe/xe_gt_idle.h  |   2 +-
 drivers/gpu/drm/xe/xe_guc_rc.c   |   2 +-
 5 files changed, 157 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..7ad488c0641a 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -61,6 +61,8 @@
  *	    ├── survivability_mode
  *	    ├── gt_types_allowed
  *	    ├── engines_allowed
+ *	    ├── enable_rc6
+ *	    ├── enable_mc6
  *	    └── enable_psmi
  *
  * After configuring the attributes as per next section, the device can be
@@ -159,6 +161,21 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * RC6 / MC6 idle states:
+ * ---------------------
+ *
+ * Enable or disable the HW RC6 (render) and MC6 (media) idle states. Both
+ * default to enabled (``1``); writing ``0`` causes the driver to skip
+ * programming the ``RC_CTL_RC6_ENABLE`` bit 18 of ``RC_CONTROL`` when
+ * the corresponding GT is initialized:
+ *
+ * The two flags are independent. Examples::
+ *
+ *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_rc6
+ *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_mc6
+ *
+ * These attributes can only be set before binding to the device.
+ *
  * Context restore BB
  * ------------------
  *
@@ -262,6 +279,8 @@ struct xe_config_group_device {
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
+		bool enable_rc6;
+		bool enable_mc6;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -281,6 +300,8 @@ static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
+	.enable_rc6 = true,
+	.enable_mc6 = true,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -575,6 +596,58 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 	return len;
 }
 
+static ssize_t enable_rc6_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->enable_rc6);
+}
+
+static ssize_t enable_rc6_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.enable_rc6 = val;
+
+	return len;
+}
+
+static ssize_t enable_mc6_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->enable_mc6);
+}
+
+static ssize_t enable_mc6_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(page, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.enable_mc6 = val;
+
+	return len;
+}
+
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -813,6 +886,8 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
+CONFIGFS_ATTR(, enable_rc6);
+CONFIGFS_ATTR(, enable_mc6);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -821,6 +896,8 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
+	&attr_enable_rc6,
+	&attr_enable_mc6,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -1098,6 +1175,8 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
+	PRI_CUSTOM_ATTR("%d", enable_rc6);
+	PRI_CUSTOM_ATTR("%d", enable_mc6);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
@@ -1225,6 +1304,46 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_rc6_enabled - get configfs enable_rc6 setting
+ * @pdev: pci device
+ *
+ * Return: enable_rc6 setting in configfs (default: true)
+ */
+bool xe_configfs_get_rc6_enabled(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return device_defaults.enable_rc6;
+
+	ret = dev->config.enable_rc6;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
+/**
+ * xe_configfs_get_mc6_enabled - get configfs enable_mc6 setting
+ * @pdev: pci device
+ *
+ * Return: enable_mc6 setting in configfs (default: true)
+ */
+bool xe_configfs_get_mc6_enabled(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return device_defaults.enable_mc6;
+
+	ret = dev->config.enable_mc6;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 07d62bf0c152..971cfc24d1ff 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -23,6 +23,8 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+bool xe_configfs_get_rc6_enabled(struct pci_dev *pdev);
+bool xe_configfs_get_mc6_enabled(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -42,6 +44,8 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_get_rc6_enabled(struct pci_dev *pdev) { return true; }
+static inline bool xe_configfs_get_mc6_enabled(struct pci_dev *pdev) { return true; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 04b24e1c8b78..2d77b1331e7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -3,15 +3,18 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/pci.h>
 #include <linux/time64.h>
 
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
 #include "xe_force_wake.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_guc_pc.h"
 #include "regs/xe_gt_regs.h"
@@ -400,7 +403,7 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
 	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
 }
 
-void xe_gt_idle_enable_c6(struct xe_gt *gt)
+static void xe_gt_idle_enable_c6(struct xe_gt *gt)
 {
 	xe_device_assert_mem_access(gt_to_xe(gt));
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
@@ -415,6 +418,34 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
 }
 
+/**
+ * xe_gt_enable_c6 - Enable C6 (RC6/MC6) honoring configfs gating
+ * @gt: GT object
+ *
+ * If the corresponding configfs attribute is disabled, the HW C6
+ * enable is skipped and RC_CONTROL is left cleared (no RC6/MC6).
+ * Defaults are true so unconfigured devices keep prior behavior.
+ */
+void xe_gt_enable_c6(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	bool c6_allowed;
+
+	if (xe_gt_is_media_type(gt))
+		c6_allowed = xe_configfs_get_mc6_enabled(pdev);
+	else
+		c6_allowed = xe_configfs_get_rc6_enabled(pdev);
+
+	if (!c6_allowed) {
+		xe_gt_info(gt, "%s disabled via configfs\n",
+			   xe_gt_is_media_type(gt) ? "MC6" : "RC6");
+		return;
+	}
+
+	xe_gt_idle_enable_c6(gt);
+}
+
 int xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
 	xe_device_assert_mem_access(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 9c34a155e102..d9f21d7ef507 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -12,7 +12,7 @@ struct drm_printer;
 struct xe_gt;
 
 int xe_gt_idle_init(struct xe_gt_idle *gtidle);
-void xe_gt_idle_enable_c6(struct xe_gt *gt);
+void xe_gt_enable_c6(struct xe_gt *gt);
 int xe_gt_idle_disable_c6(struct xe_gt *gt);
 void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
index 99fa127b261f..5c16c159f518 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.c
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -123,7 +123,7 @@ int xe_guc_rc_enable(struct xe_guc *guc)
 	}
 
 	if (xe->info.skip_guc_pc) {
-		xe_gt_idle_enable_c6(gt);
+		xe_gt_enable_c6(gt);
 		return 0;
 	}
 
-- 
2.34.1

