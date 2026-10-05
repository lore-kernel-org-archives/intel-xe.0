Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2152CA6004
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 19:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D086510EE54;
	Mon,  5 Oct 2026 19:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZjos/A6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B9310EE45
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 19:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791227177; x=1822763177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FVTGpH2bru6HL8GAo77Z3WjILpuAFdEnKVdqc9796GI=;
 b=GZjos/A61CdUYnUPvd/L9wCTea4eSSE8Nu5MAEKyoxuY5/LdfaJrPHKz
 zPTL/eUERyH8RMeDcTjgGi2xjezc+ogSjsrQwB6nl62TJE/MYlKDIcTZ1
 UcKKAz8XEvsP0XK2iN2b/knLTduSEjsQlIS3n7kyTd+Vh4a6pjEoK7AxQ
 tLERqCX+w48LQmHQ4+iFERCN1ie289fwGGXqfDhl+POhfy0SU9SRR3woy
 dyFjCfjgWRZ7iw7+vlcYDBp3lYGC33IfMT8SH7EWpJKCYs4tJe2rts5NX
 4CJkf00nB2HMEr9CKN8GUgFrIC3VdRgiAO2L62899/gJpEq0C8n+ZQ5Nw g==;
X-CSE-ConnectionGUID: CeyWebCESHKYd3max4y9ew==
X-CSE-MsgGUID: Up1V7GEsTX213V+qd+YhTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102578425"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102578425"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:16 -0700
X-CSE-ConnectionGUID: 0/FGjIyQQTu785fNM62ZAw==
X-CSE-MsgGUID: g8CETdSGR6iceGOEtPpkqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274690883"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 12:06:17 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 10/15] drm/xe/guc: Add configfs support for guc_log_level
Date: Mon,  5 Oct 2026 19:06:20 +0000
Message-ID: <20261005190611.332940-27-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
References: <20261005190611.332940-17-stuart.summers@intel.com>
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
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_configfs.c       |  2 +
 drivers/gpu/drm/xe/xe_configfs_debug.c | 86 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs_debug.h |  7 +++
 drivers/gpu/drm/xe/xe_configfs_types.h |  1 +
 drivers/gpu/drm/xe/xe_defaults.h       |  3 +
 drivers/gpu/drm/xe/xe_guc_log.c        |  3 +-
 6 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8e5ebb3ecfa7..4aa5b7c488eb 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -132,6 +132,7 @@ const struct xe_config_device xe_configfs_device_defaults = {
 	.debug = {
 		.engines_allowed = U64_MAX,
 		.gt_types_allowed = U64_MAX,
+		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
 		.enable_multi_queue = true,
 		.enable_psmi = false,
 		.enable_vram_page_offline = true,
@@ -578,6 +579,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
+	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
 	PRI_CUSTOM_ATTR("%d", debug.enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
 	PRI_CUSTOM_ATTR("%d", debug.enable_vram_page_offline);
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index a6800706eefa..cbfb12266bf4 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -17,6 +17,7 @@
 #include "xe_configfs_debug.h"
 #include "xe_configfs_types.h"
 #include "xe_gt_types.h"
+#include "xe_guc_log.h"
 #include "xe_hw_engine_types.h"
 #include "xe_pci_types.h"
 
@@ -46,7 +47,8 @@
  *	        ├── enable_psmi
  *	        ├── enable_vram_page_offline
  *	        ├── engines_allowed
- *	        └── gt_types_allowed
+ *	        ├── gt_types_allowed
+ *	        └── guc_log_level
  *
  * Configure Attributes
  * ====================
@@ -202,6 +204,27 @@
  * platforms, but may be allowed on igpu platforms in the future**::
  *
  *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/debug/gt_types_allowed
+ *
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
  */
 
 struct engine_info {
@@ -783,6 +806,65 @@ static ssize_t gt_types_allowed_store(struct config_item *item, const char *page
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
+		return level;
+
+	scoped_guard(mutex, &dev->lock)
+		if (dev->config.debug.guc_log_level >= 0)
+			level = dev->config.debug.guc_log_level;
+
+	config_group_put(&dev->group);
+
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
@@ -930,6 +1012,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
+CONFIGFS_ATTR(, guc_log_level);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, enable_vram_page_offline);
@@ -939,6 +1022,7 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
+	&attr_guc_log_level,
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
 	&attr_enable_vram_page_offline,
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
index 5d0875d47a1f..c4915832f539 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -7,7 +7,9 @@
 
 #include <linux/types.h>
 
+#include "xe_defaults.h"
 #include "xe_hw_engine_types.h"
+#include "xe_module.h"
 
 struct pci_dev;
 struct xe_config_device;
@@ -24,6 +26,7 @@ ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
+int xe_configfs_get_guc_log_level(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev);
@@ -45,6 +48,10 @@ static inline ssize_t xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
+static inline int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
+{
+	return xe_modparam.guc_log_level;
+}
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_vram_page_offline(struct pci_dev *pdev) { return true; }
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index 72f97dcad8f4..01903cb4423e 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -40,6 +40,7 @@ struct xe_config_group_device {
 			struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 			u64 engines_allowed;
 			u64 gt_types_allowed;
+			int guc_log_level;
 			bool enable_multi_queue;
 			bool enable_psmi;
 			bool enable_vram_page_offline;
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 0884224ef7c7..a9467b77fabd 100644
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
index 7d006268ce91..e22ab08ab172 100644
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
@@ -640,7 +641,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	xe_map_memset(xe, &bo->vmap, 0, 0, xe_bo_size(bo));
 	log->bo = bo;
-	log->level = xe_modparam.guc_log_level;
+	log->level = xe_configfs_get_guc_log_level(to_pci_dev(xe->drm.dev));
 
 	return 0;
 }
-- 
2.43.0

