Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A338FB5175
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 22:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0523110E302;
	Mon,  6 Apr 2026 22:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbAORA+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B738E10E302
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 22:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775516022; x=1807052022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tHyCW/+XcnWzePp3Mzz2asSMI2egvTzMDf51HAfQD3w=;
 b=bbAORA+GcGukfyGy7ELzArzt6TdfhYV9ZP1Lgja9bWDvnxgYcL5xRMpy
 +dkNX1NBfZXjvDr2jjHRQttSdN2i0MIr2kLLT+OpiAINb/Ky388jHX/Ds
 heZ4wng/hPDFkreVTCwGkwNNywa3EvNP2a9QpMgt3Hlxk+ocs3+rYib5+
 QhUeth9tSTfecUjUSlN5mq/8+QuoErZjM99+iLjqoOqq44cbyflQ9yF9v
 UXJxzMcL3jbOz0/aycW8TOoQXLN92OBCb/SLglThBEVrvS4YxDZpufo7m
 HuKqnH+/g6tHkq6/+MkYQe3lhH0wCXYT3UiWTki8CcayMBZsm4LtWTRtt w==;
X-CSE-ConnectionGUID: M8CwC74kToy4pTAgEAF17Q==
X-CSE-MsgGUID: oE7mRVhXRX2wGlMuf0HZUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76658998"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76658998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:53:41 -0700
X-CSE-ConnectionGUID: 8uEtrmfBR62h4v19hjG0Nw==
X-CSE-MsgGUID: /fU9gNsVR6uSwpcq29iD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="265967970"
Received: from dut4402arlh.fm.intel.com ([10.105.10.127])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:53:41 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.d.roper@intel.com, fei.yang@intel.com, shuicheng.lin@intel.com,
 daniele.ceraolospurio@intel.com, intel-xe@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Date: Mon,  6 Apr 2026 22:53:34 +0000
Message-ID: <20260406225338.98533-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
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
v3: Configfs documentation formatting (Shuicheng)
    Kerneldoc/comment add + configfs entry ordering
    Only set the guc_log_target when GuC log is enabled (Daniele)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Acked-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 70 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  5 +++
 drivers/gpu/drm/xe/xe_defaults.h |  1 +
 drivers/gpu/drm/xe/xe_guc.c      | 11 +++--
 4 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 32102600a148..e4511ee4e135 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -83,6 +83,16 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * GuC log target:
+ * ---------------
+ *
+ * Set the destination for the GuC log. 0 - memory only (default),
+ * 1 - NPK only, 2 - memory + NPK. Example::
+ *
+ *	# echo 2 > /sys/kernel/config/xe/0000:03:00.0/guc_log_target
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
@@ -357,6 +369,41 @@ static bool is_bound(struct xe_config_group_device *dev)
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
+	/*
+	 * No need to define full enumeration set since this is directly
+	 * applied from the user here to GuC.
+	 */
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
@@ -815,6 +862,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
+CONFIGFS_ATTR(, guc_log_target);
 CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
@@ -823,6 +871,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_psmi,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
+	&attr_guc_log_target,
 	&attr_survivability_mode,
 	NULL,
 };
@@ -1095,6 +1144,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 				 dev->config.attr_); \
 	} while (0)
 
+	PRI_CUSTOM_ATTR("%d", guc_log_target);
 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
@@ -1147,6 +1197,26 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
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
index e762eada21db..c40bd4aec2ce 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -73,13 +73,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 
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

