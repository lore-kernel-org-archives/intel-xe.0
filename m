Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588D3C561E6
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 23:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B0A10F014;
	Wed,  5 Aug 2026 23:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyfAVWIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D1010E1CB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785972025; x=1817508025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QEIxUxiutDh6b5wWvDgK2QDyD99CxtNhR6oUIQAC8Ek=;
 b=HyfAVWIlEgCn+vS6CqkVBA6Vp+wfmPIiruc5rESXlqfXl3+VF7PSNyfC
 Mo8zXBPdcup1FTQAkGs9WfGT2BPefMRP+l9C0gZyew4gw56b0qSUpX3hI
 hrO22SxpaY0SDh+DV6o86H6pdADi5cjUk4Ojk9ZS4rTfFRTR7pK4tf3es
 zRC6Mv9L0XtPTx/pA1xBOgo0CdvLeomWd/LVpzz3k7yLU2kwItl4VBgyn
 iglDQf4v1mZqA4YzP4m/kMM2hsG/7Gqp9sCeJPHBYSuDNF+YQCQJRbj+R
 tzr2Y/BlttTNygtbmhBxQ2xc9jfTZTGQcM+FChx3VuxTSs2AdrfYB0GCF A==;
X-CSE-ConnectionGUID: 7/BWGlEBSnySlShbZqEDvQ==
X-CSE-MsgGUID: 7OC5D3nJRjGV8Jeb4SlCYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97206425"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="97206425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 16:20:25 -0700
X-CSE-ConnectionGUID: mLfiywwOT4CyPu3NNDietg==
X-CSE-MsgGUID: /V69Gk95STSkDAECF25xHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="261395872"
Received: from dut4475arls.fm.intel.com ([10.105.10.28])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 16:20:25 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/10] drm/xe/guc: Add configfs support for guc_log_level
Date: Wed,  5 Aug 2026 23:20:27 +0000
Message-ID: <20260805232021.337103-18-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805232021.337103-12-stuart.summers@intel.com>
References: <20260805232021.337103-12-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Allow the GuC log level to be selected per-device via configfs in
addition to the existing 'guc_log_level' module parameter. The configfs
attribute lives under the new 'debug' configfs subdirectory:

  /sys/kernel/config/xe/<bdf>/debug/guc_log_level

When the configfs attribute is set to a valid level (0-5), it overrides
the module parameter for that device. The default value is -1
(XE_GUC_LOG_LEVEL_UNSET), which means 'unset' and falls back to the
'guc_log_level' module parameter, ensuring existing users that rely
solely on the module parameter are unaffected by this change.

The module parameter implementation itself is untouched.

Note that the expectation is a user will only set the log level when
CONFIG_DRM_XE_DEBUG is set.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7,claude-sonnet-5,claude-opus-5
---
 drivers/gpu/drm/xe/xe_configfs.c       |  2 +
 drivers/gpu/drm/xe/xe_configfs_debug.c | 84 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h |  7 +++
 drivers/gpu/drm/xe/xe_configfs_types.h |  1 +
 drivers/gpu/drm/xe/xe_defaults.h       |  3 +
 drivers/gpu/drm/xe/xe_guc_log.c        |  3 +-
 6 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 111aacce8a84..ea09d5f9e925 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -100,6 +100,7 @@ const struct xe_config_device xe_configfs_device_defaults = {
 	.debug = {
 		.engines_allowed = U64_MAX,
 		.gt_types_allowed = U64_MAX,
+		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
 		.enable_multi_queue = true,
 		.enable_psmi = false,
 		.survivability_mode = false,
@@ -418,6 +419,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
+	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
 	PRI_CUSTOM_ATTR("%d", debug.enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
 	PRI_CUSTOM_ATTR("%d", debug.survivability_mode);
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index b2667573efbe..a65ff1f20917 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -17,6 +17,7 @@
 #include "xe_configfs_debug.h"
 #include "xe_configfs_types.h"
 #include "xe_gt_types.h"
+#include "xe_guc_log.h"
 #include "xe_hw_engine_types.h"
 #include "xe_pci_types.h"
 
@@ -44,6 +45,7 @@
  *	        ├── ctx_restore_post_bb
  *	        ├── engines_allowed
  *	        ├── gt_types_allowed
+ *	        ├── guc_log_level
  *	        ├── enable_multi_queue
  *	        ├── enable_psmi
  *	        └── survivability_mode
@@ -167,6 +169,27 @@
  *
  *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
  *
+ * GuC log level:
+ * --------------
+ *
+ * Set the GuC firmware logging verbosity for this device. Accepted values
+ * match the ``guc_log_level`` module parameter:
+ *
+ *   - 0: disable
+ *   - 1: normal (non-verbose)
+ *   - 2..%GUC_LOG_LEVEL_MAX: verbose levels
+ *
+ * Example::
+ *
+ *	# echo 3 > /sys/kernel/config/xe/0000:03:00.0/debug/guc_log_level
+ *
+ * The default value is %XE_GUC_LOG_LEVEL_UNSET (-1), which means the value
+ * of the ``guc_log_level`` module parameter is used. Any value greater
+ * than -1 written to this attribute overrides the module parameter for
+ * this device.
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Enable multi-queue
  * ------------------
  *
@@ -758,6 +781,65 @@ static ssize_t gt_types_allowed_store(struct config_item *item, const char *page
 	return len;
 }
 
+/**
+ * xe_configfs_get_guc_log_level - get configfs guc_log_level setting
+ * @pdev: pci device
+ *
+ * Returns the guc_log_level value configured via configfs. If the configfs
+ * value is negative (the default is %XE_GUC_LOG_LEVEL_UNSET, -1), the value
+ * of the ``guc_log_level`` module parameter is returned instead, allowing
+ * the configfs entry to override the module parameter without affecting
+ * users that rely solely on the module parameter.
+ *
+ * Return: GuC log level to use for this device.
+ */
+int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_device(pdev);
+	int level = xe_modparam.guc_log_level;
+
+	if (!dev)
+		goto out;
+
+	scoped_guard(mutex, &dev->lock)
+		if (dev->config.debug.guc_log_level >= 0)
+			level = dev->config.debug.guc_log_level;
+
+	config_group_put(&dev->group);
+out:
+	return level;
+}
+
+static ssize_t guc_log_level_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
+
+	return sprintf(page, "%d\n", dev->debug.guc_log_level);
+}
+
+static ssize_t guc_log_level_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
+	int val;
+	int ret;
+
+	ret = kstrtoint(page, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val != XE_GUC_LOG_LEVEL_UNSET &&
+	    (val < 0 || val > GUC_LOG_LEVEL_MAX))
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+	if (xe_configfs_is_bound(dev))
+		return -EBUSY;
+
+	dev->config.debug.guc_log_level = val;
+
+	return len;
+}
+
 /**
  * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
  * @pdev: pci device
@@ -904,6 +986,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
+CONFIGFS_ATTR(, guc_log_level);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, survivability_mode);
@@ -913,6 +996,7 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
+	&attr_guc_log_level,
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
 	&attr_survivability_mode,
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
index 4a027ea2082d..5fe39bb72f00 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -7,7 +7,9 @@
 
 #include <linux/types.h>
 
+#include "xe_defaults.h"
 #include "xe_hw_engine_types.h"
+#include "xe_module.h"
 
 struct pci_dev;
 struct xe_config_device;
@@ -24,6 +26,7 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
+int xe_configfs_get_guc_log_level(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
@@ -42,6 +45,10 @@ static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
+{
+	return xe_modparam.guc_log_level;
+}
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index 6e8ba6f85fad..e9460c3de891 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -38,6 +38,7 @@ struct xe_config_group_device {
 			struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 			u64 engines_allowed;
 			u64 gt_types_allowed;
+			int guc_log_level;
 			bool enable_multi_queue;
 			bool enable_psmi;
 			bool survivability_mode;
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index c8ae1d5f3d60..df88078e84b8 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -13,6 +13,9 @@
 #define XE_DEFAULT_GUC_LOG_LEVEL		1
 #endif
 
+/* Sentinel value for guc_log_level configfs: not set, fall back to module param */
+#define XE_GUC_LOG_LEVEL_UNSET			-1
+
 #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 538d4df0f7aa..531b9759d520 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -13,6 +13,7 @@
 #include "abi/guc_lfd_abi.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
+#include "xe_configfs_debug.h"
 #include "xe_devcoredump.h"
 #include "xe_force_wake.h"
 #include "xe_gt_printk.h"
@@ -637,7 +638,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	xe_map_memset(xe, &bo->vmap, 0, 0, xe_bo_size(bo));
 	log->bo = bo;
-	log->level = xe_modparam.guc_log_level;
+	log->level = xe_configfs_get_guc_log_level(to_pci_dev(xe->drm.dev));
 
 	return 0;
 }
-- 
2.43.0

