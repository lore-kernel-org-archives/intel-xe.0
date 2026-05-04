Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC45CD343C
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5A510E376;
	Mon,  4 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFJxTqZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C70010E183
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869833; x=1809405833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6O767TVhJre7OxbSwitWH7SE1T4GUJfJJCqy7NU3Y5U=;
 b=VFJxTqZKPVi907VPD2FY4Iosxv8V1YXx6ZfjOO4S3YnJtKMYXknoeAYt
 XNWL1eAqVndaYw0T+URCYf8pgMoKHHZK7djUPX8nDHKaFXfju8Vsew1cC
 jeSFoIRcWelX8BE+PAtLFHWjI2NCw5Xhv77DVP6U7/6Nsvo7cCCaVyCn9
 wX0QIW3ysNevkwtJ9KrefMgOxwT1BY1MEbDDpo9xlRwW3ouStoBhosaIE
 N1loT0uZs8Fs4qBMpBXsNjhpKSbKa8zFgniOndfEE+BuuLTb5YFm+jNDc
 U22jQkFOp9DfhYJ+QbzpaGxTSxcvAGx+jD1TA4MsvhwP+3IgVu1BKbTYk Q==;
X-CSE-ConnectionGUID: cXDALjZFT7+IWBKUdxJllg==
X-CSE-MsgGUID: 3YXMyVT+RfOPQ5q7UaocwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293562"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:52 -0700
X-CSE-ConnectionGUID: 9/uP/SIwSMCG+KekIkDr8w==
X-CSE-MsgGUID: aFZy5Ge2T3ijOC0FGTypSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773680"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:51 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 7/9] drm/xe/guc: Add support for NPK as a GuC log target
Date: Mon,  4 May 2026 04:43:44 +0000
Message-ID: <20260504044348.209625-8-stuart.summers@intel.com>
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

GuC provides the ability to gather logs through a hardware interface
called NPK. For certain debugging scenarios this can be advantageous
over getting logs from memory (or in addition to).

Add a hook for this alternate debugging mode via a configfs. This
translates into a parameter passed to GuC during load time.

v2: Convert to configfs from modparam (Matt)
v3: Configfs documentation formatting (Shuicheng)
    Kerneldoc/comment add + configfs entry ordering
    Only set the guc_log_target when GuC log is enabled (Daniele)

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h   |  8 ++++
 drivers/gpu/drm/xe/xe_configfs.c       |  2 +
 drivers/gpu/drm/xe/xe_configfs_debug.c | 64 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs_debug.h |  5 ++
 drivers/gpu/drm/xe/xe_configfs_types.h |  1 +
 drivers/gpu/drm/xe/xe_defaults.h       |  2 +
 drivers/gpu/drm/xe/xe_guc.c            | 11 +++--
 7 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index fbf212d59a40..e1b121bff549 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -51,6 +51,14 @@ enum guc_log_type {
 
 #define GUC_LOG_BUFFER_TYPE_MAX		3
 
+enum guc_log_target {
+	GUC_LOG_TARGET_MEM = 0,
+	GUC_LOG_TARGET_NPK,
+	GUC_LOG_TARGET_MEM_AND_NPK,
+};
+
+#define GUC_LOG_TARGET_MAX	GUC_LOG_TARGET_MEM_AND_NPK
+
 /**
  * struct guc_log_buffer_state - GuC log buffer state
  *
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index babe33e84af2..4a5bd53af443 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -107,6 +107,7 @@ const struct xe_config_device xe_configfs_device_defaults = {
 		.engines_allowed = U64_MAX,
 		.gt_types_allowed = U64_MAX,
 		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
+		.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
 	},
 #endif
 	.sriov = {
@@ -431,6 +432,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
 	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
+	PRI_CUSTOM_ATTR("%d", debug.guc_log_target);
 #endif
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index b5c06d1ec7c9..af4ee420cf6f 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -45,7 +45,8 @@
  *	        ├── enable_survivability_mode
  *	        ├── engines_allowed
  *	        ├── gt_types_allowed
- *	        └── guc_log_level
+ *	        ├── guc_log_level
+ *	        └── guc_log_target
  *
  * Configure Attributes
  * ====================
@@ -209,6 +210,16 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * GuC log target:
+ * ---------------
+ *
+ * Set the destination for the GuC log. 0 - memory only (default),
+ * 1 - NPK only, 2 - memory + NPK. Example::
+ *
+ *	# echo 2 > /sys/kernel/config/xe/0000:03:00.0/debug/guc_log_target
+ *
+ * This attribute can only be set before binding to the device.
+ *
  */
 
 struct engine_info {
@@ -284,6 +295,26 @@ bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev)
 	return mode;
 }
 
+/**
+ * xe_configfs_get_guc_log_target - get configfs GuC log target attribute
+ * @pdev: pci device
+ *
+ * Return: guc_log_target attribute in configfs
+ */
+u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = xe_configfs_find_device(pdev);
+	u8 target;
+
+	if (!dev)
+		return xe_configfs_device_defaults.debug.guc_log_target;
+
+	target = dev->config.debug.guc_log_target;
+	config_group_put(&dev->group);
+
+	return target;
+}
+
 /**
  * xe_configfs_primary_gt_allowed - determine whether primary GTs are supported
  * @pdev: pci device
@@ -911,6 +942,35 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 	return wa_bb_store(dev->config.debug.ctx_restore_post_bb, dev, data, sz);
 }
 
+static ssize_t guc_log_target_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = debug_to_device(item);
+
+	return sprintf(page, "%d\n", dev->debug.guc_log_target);
+}
+
+static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = debug_to_group_device(item);
+	u8 guc_log_target;
+	int ret;
+
+	ret = kstrtou8(page, 0, &guc_log_target);
+	if (ret)
+		return ret;
+
+	if (guc_log_target > GUC_LOG_TARGET_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+	if (xe_configfs_is_bound(dev))
+		return -EBUSY;
+
+	dev->config.debug.guc_log_target = guc_log_target;
+
+	return len;
+}
+
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
@@ -918,6 +978,7 @@ CONFIGFS_ATTR(, enable_survivability_mode);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, guc_log_level);
+CONFIGFS_ATTR(, guc_log_target);
 
 static bool xe_configfs_debug_is_visible(struct config_item *item,
 					 struct configfs_attribute *attr,
@@ -945,6 +1006,7 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_guc_log_level,
+	&attr_guc_log_target,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
index b29c739435c5..68e34307b560 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -15,6 +15,7 @@ struct pci_dev;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG) && IS_ENABLED(CONFIG_CONFIGFS_FS)
 bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev);
+u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
@@ -32,6 +33,10 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
  * wrapped in CONFIG_DRM_XE_DEBUG.
  */
 static inline bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_GUC_LOG_TARGET;
+}
 static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index ba920c37c44d..8773adeffd4e 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -38,6 +38,7 @@ struct xe_config_group_device {
 			u64 engines_allowed;
 			u64 gt_types_allowed;
 			int guc_log_level;
+			u8 guc_log_target;
 		} debug;
 		struct {
 			bool admin_only_pf;
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index df88078e84b8..9330e08727a8 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -5,6 +5,7 @@
 #ifndef _XE_DEFAULTS_H_
 #define _XE_DEFAULTS_H_
 
+#include "abi/guc_log_abi.h"
 #include "xe_device_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -12,6 +13,7 @@
 #else
 #define XE_DEFAULT_GUC_LOG_LEVEL		1
 #endif
+#define XE_DEFAULT_GUC_LOG_TARGET		GUC_LOG_TARGET_MEM
 
 /* Sentinel value for guc_log_level configfs: not set, fall back to module param */
 #define XE_GUC_LOG_LEVEL_UNSET			-1
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e520afbf1f22..c486b9641178 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -74,13 +74,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 
 static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 {
+	struct pci_dev *pdev = to_pci_dev(guc_to_xe(guc)->drm.dev);
 	u32 level = xe_guc_log_get_level(&guc->log);
 	u32 flags = 0;
 
-	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
+	if (!GUC_LOG_LEVEL_IS_VERBOSE(level)) {
 		flags |= GUC_LOG_DISABLED;
-	else
-		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
+	} else {
+		flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
+				    GUC_LOG_LEVEL_TO_VERBOSITY(level));
+		flags |= FIELD_PREP(GUC_LOG_DESTINATION,
+				    xe_configfs_get_guc_log_target(pdev));
+	}
 
 	return flags;
 }
-- 
2.43.0

