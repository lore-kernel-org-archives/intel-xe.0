Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55389C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 20:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174CE89854;
	Wed,  1 Jul 2026 20:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4OvFh11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2463089854
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 20:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782938300; x=1814474300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qI9TFvJLg9jStfU/v/fEkObSR8U8rJdr68JRiGABsv4=;
 b=V4OvFh11NxU6axZA9nTqFIU3vNNo8EEpRkrOqNoWu/4hpsEM1ucRa1zE
 ZeMftNetLY120VjdzbT5/Y3OGx638YcebBrP2V0uqBnB0MeNxcQl7WxbX
 xWslbKFG6Wu/XZX0wHTNNXORPEyoa/vrkplOJNxfBqti5oFaTY8BP25Ud
 cO7fSUS7Fx7KqADJp8cLpFc87UKPYSy/AKk/WWmQnks2k8RprjIUToKdg
 bGhaNuZDg9hRNMe/2xfl3P3Pl7+CeFJrClfy3mIR7vjqa6ya5WHb+W63/
 +myv+BKTrx8/+SaPNyHDRJMjdvmzScKt5ECfditRAXvXPSUwzXKFGApx5 w==;
X-CSE-ConnectionGUID: FkldBMITTZeX6pM6rEqibw==
X-CSE-MsgGUID: 70AjGgsoROyGf3ZBYasKkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83770775"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="83770775"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 13:38:20 -0700
X-CSE-ConnectionGUID: VW+dFgd5TWmlCIwjFDq+QA==
X-CSE-MsgGUID: yQe7iquTSSyeMg9d0UwsZQ==
X-ExtLoop1: 1
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa003.fm.intel.com with ESMTP; 01 Jul 2026 13:38:18 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH] drm/xe/configfs: Add disable_multi_queue attribute
Date: Wed,  1 Jul 2026 20:38:05 +0000
Message-Id: <20260701203805.3007798-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Add a new configfs boolean attribute 'disable_multi_queue' that lets an
administrator force-disable multi-queue support on a device before it
binds to the driver. This is intended for debugging and for validating
non-multi-queue code paths on hardware that would otherwise expose
multi-queue.

The hook disables multi-queue at two levels:

- UAPI: In alloc_primary_gt(), clear
  gt->info.multi_queue_engine_class_mask on the primary GT so that
  xe_gt_supports_multi_queue() returns false and attempts to create
  a multi-queue group via DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP
  are rejected.

- GuC: In guc_ctl_feature_flags(), set the GUC_CTL_DISABLE_MULTI_QUEUE
  (BIT(24)) init-params bit on GuC firmware older than 70.66. On GuC
  firmware 70.66 and above, guc_waklv_init() emits the new
  GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE Feature KLV (0x5001) via the ADS
  WA/Feature KLV buffer instead. Feature KLVs share the WA KLV buffer.

The attribute is rejected after the device has been bound, so it only
takes effect during probe:

	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  3 +-
 drivers/gpu/drm/xe/xe_configfs.c      | 63 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h      |  2 +
 drivers/gpu/drm/xe/xe_guc.c           |  8 ++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 14 ++++++
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  1 +
 drivers/gpu/drm/xe/xe_pci.c           |  2 +
 7 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 644f5a4226d7..998272a007e5 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -491,9 +491,10 @@ enum  {
 #define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MIN_LEN	1u
 #define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MAX_LEN	GUC_MAX_SCHED_GROUPS
 /*
- * Workaround keys:
+ * Feature and Workaround keys:
  */
 enum xe_guc_klv_ids {
+	GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE						= 0x5001,
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
 	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT		= 0x9004,
 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..cd94f0d80edd 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -237,6 +237,16 @@
  *
  * This setting only takes effect when probing the device.
  *
+ * Disable multi-queue
+ * -------------------
+ *
+ * Disable multi-queue support on the device. Multi-queue exec-queue
+ * group creation via ioctl is refused, and the GuC feature is disabled.
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -262,6 +272,7 @@ struct xe_config_group_device {
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
+		bool disable_multi_queue;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -281,6 +292,7 @@ static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
+	.disable_multi_queue = false,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -575,6 +587,33 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 	return len;
 }
 
+static ssize_t disable_multi_queue_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->disable_multi_queue);
+}
+
+static ssize_t disable_multi_queue_store(struct config_item *item, const char *page,
+					 size_t len)
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
+	dev->config.disable_multi_queue = val;
+
+	return len;
+}
+
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -812,6 +851,7 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
+CONFIGFS_ATTR(, disable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
@@ -820,6 +860,7 @@ CONFIGFS_ATTR(, survivability_mode);
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
+	&attr_disable_multi_queue,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
@@ -1098,6 +1139,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
+	PRI_CUSTOM_ATTR("%d", disable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
@@ -1225,6 +1267,27 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_disable_multi_queue - get configfs disable_multi_queue setting
+ * @pdev: pci device
+ *
+ * Return: true if multi-queue should be disabled for this device, false
+ * otherwise.
+ */
+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	bool ret;
+
+	if (!dev)
+		return false;
+
+	ret = dev->config.disable_multi_queue;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 07d62bf0c152..d41f52bd66b7 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -23,6 +23,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -42,6 +43,7 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev) { return false; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4023700ff2a9..cdd096a37e05 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -101,6 +101,14 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (xe_device_is_l2_flush_optimized(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
 		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
 
+	/*
+	 * On GuC firmware 70.66 and above, the GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE
+	 * Feature KLV is used instead.
+	 */
+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev)) &&
+	    !GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 66))
+		flags |= GUC_CTL_DISABLE_MULTI_QUEUE;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index c98454545a85..898ec2c6f015 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -16,6 +16,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_gt_mcr.h"
@@ -364,6 +365,19 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
 
+	/*
+	 * On GuC firmware 70.66 and above, use the Feature KLV (shared with the
+	 * WA KLV buffer); older firmware uses GUC_CTL_DISABLE_MULTI_QUEUE in
+	 * the init params instead.
+	 */
+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(gt_to_xe(gt)->drm.dev)) &&
+	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 66)) {
+		u32 data = 1;
+
+		guc_waklv_enable(ads, &data, 1, &offset, &remain,
+				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
+	}
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 3fbda4798cff..971b850f2136 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -68,6 +68,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 #define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
+#define   GUC_CTL_DISABLE_MULTI_QUEUE	BIT(24)
 
 #define GUC_CTL_DEBUG			3
 #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 03362480e3e0..23ef2c7b6bce 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -862,6 +862,8 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.id = tile->id * xe->info.max_gt_per_tile;
 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev)))
+		gt->info.multi_queue_engine_class_mask = 0;
 	gt->info.engine_mask = graphics_desc->hw_engine_mask;
 	gt->info.num_geometry_xecore_fuse_regs = graphics_desc->num_geometry_xecore_fuse_regs;
 	gt->info.num_compute_xecore_fuse_regs = graphics_desc->num_compute_xecore_fuse_regs;
-- 
2.43.0

