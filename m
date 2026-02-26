Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D46FD9E22
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 23:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A3710E0CF;
	Thu, 26 Feb 2026 23:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Epi7DvMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC90910E0CF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 23:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772148411; x=1803684411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n4XUo+2Xvy8NJH5NPodUql7J6n8zxZ8+jB8Tv8Q+c1U=;
 b=Epi7DvMie68RSzZd+sdWHlQqJA+GpH+Q6n+WbJj5fnnNRKeIJXMLZW1E
 b2T2Zj6Ch30M4d/quOElafNpXV0UtV1yn8slU9DSzjZuZLNL3C0t7kNp+
 RyfV8Ov/CPHoV6BhTwYjAlyEqvEPRwmUo88kieU+9p7L4T3N4o8GupkkZ
 nAC0goFxK0QpOJfabNmfzFPy5BDD5VppvUmP3B6sf+FNPpJ490Zie3LuW
 PWQKz8fZvmMIUcuLf9cS8DPoMYvndmkJJAjXz/KIqEZga9pqszMxf5kVE
 CWodloUVpYxjNKVFIteY22MwG6IfRuCjLOJvBHEAXlpQhm2O8Ie379cY1 Q==;
X-CSE-ConnectionGUID: NZe6S3doQ66G2LIVrWwzJQ==
X-CSE-MsgGUID: tJbBHtixRKqeg7Io6LQfhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77061619"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="77061619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:26:50 -0800
X-CSE-ConnectionGUID: h/uTrmcjR565aW80n3Ghww==
X-CSE-MsgGUID: yUtMCYZuQM6BnXMH3m+ZYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="221230328"
Received: from dut4480arlh.fm.intel.com ([10.105.8.53])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:26:50 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: shuicheng.lin@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Date: Thu, 26 Feb 2026 23:26:48 +0000
Message-Id: <20260226232648.675128-1-stuart.summers@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

GuC provides the ability to gather logs through a hardware interface
called NPK. For certain debugging scenarios this can be advantageous
over getting logs from memory (or in addition to).

Add a hook for this alternate debugging mode via a configfs. This
translates into a parameter passed to GuC during load time.

v2: Convert to configfs from modparam (Matt)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 60 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  5 +++
 drivers/gpu/drm/xe/xe_defaults.h |  1 +
 drivers/gpu/drm/xe/xe_guc.c      |  7 +++-
 4 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 078dee985d24..e0c21328af75 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -83,6 +83,16 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * GuC log target:
+ * -------------
+ *
+ * Set the destination for the GuC log. 0 - memory only (default),
+ * 1 - NPK only, 2 - memory + NPK.
+ *
+ * 	# echo 2 > /sys/kernel/config/xe/0000:03:00.0/guc_log_target
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Allowed GT types:
  * -----------------
  *
@@ -256,6 +266,7 @@ struct xe_config_group_device {
 	struct config_group sriov;
 
 	struct xe_config_device {
+		u8 guc_log_target;
 		u64 gt_types_allowed;
 		u64 engines_allowed;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
@@ -277,6 +288,7 @@ struct xe_config_group_device {
 };
 
 static const struct xe_config_device device_defaults = {
+	.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
 	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
@@ -357,6 +369,37 @@ static bool is_bound(struct xe_config_group_device *dev)
 	return ret;
 }
 
+static ssize_t guc_log_target_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->guc_log_target);
+}
+
+static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u8 guc_log_target;
+	int ret;
+
+	ret = kstrtou8(page, 0, &guc_log_target);
+	if (ret)
+		return ret;
+
+#define GUC_LOG_TARGET_MAX	2
+	if (guc_log_target > GUC_LOG_TARGET_MAX)
+		return -EINVAL;
+#undef GUC_LOG_TARGET_MAX
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.guc_log_target = guc_log_target;
+
+	return len;
+}
+
 static ssize_t survivability_mode_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -814,6 +857,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, guc_log_target);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
@@ -822,6 +866,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_post_bb,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
+	&attr_guc_log_target,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
@@ -1094,6 +1139,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
+	PRI_CUSTOM_ATTR("%d", guc_log_target);
 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
@@ -1146,6 +1192,20 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	return mode;
 }
 
+u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u8 target;
+
+	if (!dev)
+		return device_defaults.guc_log_target;
+
+	target = dev->config.guc_log_target;
+	config_group_put(&dev->group);
+
+	return target;
+}
+
 static u64 get_gt_types_allowed(struct pci_dev *pdev)
 {
 	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 07d62bf0c152..fb5cb7c57e75 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -19,6 +19,7 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
@@ -38,6 +39,10 @@ static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_GUC_LOG_TARGET;
+}
 static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index c8ae1d5f3d60..fbe670668a04 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -12,6 +12,7 @@
 #else
 #define XE_DEFAULT_GUC_LOG_LEVEL		1
 #endif
+#define XE_DEFAULT_GUC_LOG_TARGET		0
 
 #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 54d2fc780127..d98d5d051f1b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -73,13 +73,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 
 static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 {
+	struct pci_dev *pdev = to_pci_dev(guc_to_xe(guc)->drm.dev);
 	u32 level = xe_guc_log_get_level(&guc->log);
 	u32 flags = 0;
 
 	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
 		flags |= GUC_LOG_DISABLED;
 	else
-		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
+		flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
+				    GUC_LOG_LEVEL_TO_VERBOSITY(level));
+
+	flags |= FIELD_PREP(GUC_LOG_DESTINATION,
+			    xe_configfs_get_guc_log_target(pdev));
 
 	return flags;
 }
-- 
2.34.1

