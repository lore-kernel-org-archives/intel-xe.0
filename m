Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5079CD3438
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A535F10E373;
	Mon,  4 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaSgrdTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5540510E366
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869833; x=1809405833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4c1t2V8oVRu9yUoQqDDRVaO1LoXb+zR5Xlgmx0nRm34=;
 b=GaSgrdTpZPgveTndYbTWMSqQcGTZcb6nf572sJbzA1NsnWP5+WNaeEya
 Uidzgxb7H6XzHg3sF1mKLmrffMmcMnDY0oStPddhvnixMjXvB7dGr8/+R
 Dq5C+ov+7Z8n7gqHtxfqOjQk+BXMjozOWh3xXaV6bXPwkuPz2npueU8Uh
 08Bn3AgSU3qUXMeJtV/TRHeVuT28VLBXAIO+g4tPhJhPSGZcUWmTNVXbK
 FFsdAPShWSLrNZW5n3GVkUL5vedq6Vn1wwtUMIN9Cw6LNLo2IJR70DYTe
 vWdHcBWySs5h/UIV5XSz2hF87nu3dbQn5QZG0DVxsLs+vcRNnUG9zV7p/ g==;
X-CSE-ConnectionGUID: 3Q6+/iS0SL6LZoNiugNDaQ==
X-CSE-MsgGUID: xIQoubPnQhublSvzML+Rfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293561"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293561"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:52 -0700
X-CSE-ConnectionGUID: aRbEXYk7QIiKrQd6N174QQ==
X-CSE-MsgGUID: EIVF+xYuQjWg66WJHkzzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773677"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:50 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 6/9] drm/xe/guc: Add configfs support for guc_log_level
Date: Mon,  4 May 2026 04:43:43 +0000
Message-ID: <20260504044348.209625-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
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
CONFIG_DRM_XE_DEBUG is set. Otherwise the expectation is a user will
always just use the default (1).

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/xe_configfs.c       |  2 +
 drivers/gpu/drm/xe/xe_configfs_debug.c | 84 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs_debug.h |  7 +++
 drivers/gpu/drm/xe/xe_configfs_types.h |  1 +
 drivers/gpu/drm/xe/xe_defaults.h       |  3 +
 drivers/gpu/drm/xe/xe_guc_log.c        |  3 +-
 6 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 89e163ce56aa..babe33e84af2 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -106,6 +106,7 @@ const struct xe_config_device xe_configfs_device_defaults = {
 		.enable_survivability_mode = false,
 		.engines_allowed = U64_MAX,
 		.gt_types_allowed = U64_MAX,
+		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
 	},
 #endif
 	.sriov = {
@@ -429,6 +430,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%d", debug.enable_survivability_mode);
 	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
+	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
 #endif
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index adf193d48a63..b5c06d1ec7c9 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -15,6 +15,7 @@
 #include "xe_configfs_debug.h"
 #include "xe_configfs_types.h"
 #include "xe_gt_types.h"
+#include "xe_guc_log.h"
 #include "xe_hw_engine_types.h"
 #include "xe_pci_types.h"
 
@@ -43,7 +44,8 @@
  *	        ├── enable_psmi
  *	        ├── enable_survivability_mode
  *	        ├── engines_allowed
- *	        └── gt_types_allowed
+ *	        ├── gt_types_allowed
+ *	        └── guc_log_level
  *
  * Configure Attributes
  * ====================
@@ -186,6 +188,27 @@
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
  */
 
 struct engine_info {
@@ -325,6 +348,34 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	return ret;
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
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	int level = xe_modparam.guc_log_level;
+
+	if (!dev)
+		goto out;
+
+	if (dev->config.debug.guc_log_level >= 0)
+		level = dev->config.debug.guc_log_level;
+
+	config_group_put(&dev->group);
+out:
+	return level;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
@@ -596,6 +647,35 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
 	return len;
 }
 
+static ssize_t guc_log_level_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = debug_to_device(item);
+
+	return sprintf(page, "%d\n", dev->debug.guc_log_level);
+}
+
+static ssize_t guc_log_level_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+	int val;
+	int ret;
+
+	ret = kstrtoint(page, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > GUC_LOG_LEVEL_MAX)
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
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -837,6 +917,7 @@ CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, enable_survivability_mode);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
+CONFIGFS_ATTR(, guc_log_level);
 
 static bool xe_configfs_debug_is_visible(struct config_item *item,
 					 struct configfs_attribute *attr,
@@ -863,6 +944,7 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_enable_survivability_mode,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
+	&attr_guc_log_level,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
index bfbfbda1073f..b29c739435c5 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -7,7 +7,9 @@
 
 #include <linux/types.h>
 
+#include "xe_defaults.h"
 #include "xe_hw_engine_types.h"
+#include "xe_module.h"
 
 struct pci_dev;
 
@@ -17,6 +19,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
+int xe_configfs_get_guc_log_level(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -33,6 +36,10 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
+static inline int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
+{
+	return xe_modparam.guc_log_level;
+}
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index 02d5709bcfd3..ba920c37c44d 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -37,6 +37,7 @@ struct xe_config_group_device {
 			bool enable_survivability_mode;
 			u64 engines_allowed;
 			u64 gt_types_allowed;
+			int guc_log_level;
 		} debug;
 		struct {
 			bool admin_only_pf;
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

