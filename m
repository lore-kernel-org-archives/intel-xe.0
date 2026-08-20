Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C0C5DF86
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 21:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8F310E614;
	Thu, 20 Aug 2026 21:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mm3YFh6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090E910E60F
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 21:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787260007; x=1818796007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wCJ+LSdyBVWf4UuzZEIPiQqXlY3vtakNVwjyQ3mMfnY=;
 b=Mm3YFh6H+02ACEhVX0WwIpluWrz+e9CfbLDtlkHo7IvlsexPOC3zzSaP
 b/+ie3r51labFQpWOR5AcxLMljWjxB7y1qB6kNdGg2R0gL1rwoF9GvC5R
 2kZWce6De2+ZhhFMip5Ui9WDcXux25pzDQ2rKgRm7ndfOlg6bHazioheD
 1F5z3AVq7c0Kvnq7j/5gThUFOVqaPUT2DVRFEE6Q9VX6xlNKDP1h51hKd
 fqK2SJm1kQAXYwHVc2zsfuxC2b8u+BoPMJmaGFxMutjlqCXr0Va4XERxl
 fHY2GQ8XnPuZoSWbpRWZfGb3cluMNBA6giBshjxlHVzogZddpGUdMRBzg Q==;
X-CSE-ConnectionGUID: Uo++6LWaQp+usn2Z6Cb6gQ==
X-CSE-MsgGUID: Z+g+aOviTJehrjplv6qhIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98965324"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98965324"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 14:06:46 -0700
X-CSE-ConnectionGUID: uoQoJ//WSviPWg+5tCrHig==
X-CSE-MsgGUID: Lv4qebYbSE+6ZE2q6+TfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="304342496"
Received: from dut4475arls.fm.intel.com ([10.105.8.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 14:06:45 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 09/10] drm/xe: Migrate existing debug configfs entries to
 params infrastructure
Date: Thu, 20 Aug 2026 21:06:48 +0000
Message-ID: <20260820210639.107524-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820210639.107524-12-stuart.summers@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
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

Move the existing debug configfs entries whose semantics fit the
generic show/store template into the new parameter list.

Add validators for the guc_log_level and guc_log_target.

Add a custom getter for the guc_log_level to fall back to the modparam.

The new parameters are intentionally longer than the normal 80
character limit for readability.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7,claude-sonnet-5
---
 drivers/gpu/drm/xe/xe_configfs.c              |  17 +-
 drivers/gpu/drm/xe/xe_configfs_debug.c        | 277 +-----------------
 drivers/gpu/drm/xe/xe_configfs_debug.h        |  20 +-
 drivers/gpu/drm/xe/xe_configfs_debug_params.c |   1 +
 drivers/gpu/drm/xe/xe_configfs_debug_params.h |  22 +-
 drivers/gpu/drm/xe/xe_configfs_types.h        |   7 +-
 drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
 drivers/gpu/drm/xe/xe_psmi.c                  |   2 +-
 drivers/gpu/drm/xe/xe_rtp.c                   |   2 +-
 9 files changed, 47 insertions(+), 303 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index c5d5017cd506..62d3406c61b6 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -100,11 +100,9 @@ const struct xe_config_device xe_configfs_device_defaults = {
 	.debug = {
 		.engines_allowed = U64_MAX,
 		.gt_types_allowed = U64_MAX,
-		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
-		.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
-		.enable_multi_queue = true,
-		.enable_psmi = false,
-		.survivability_mode = false,
+		.params = {
+			XE_CONFIGFS_DEBUG_PARAMS_DEFAULTS
+		},
 	},
 #endif
 	.sriov = {
@@ -420,11 +418,10 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
-	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
-	PRI_CUSTOM_ATTR("%d", debug.guc_log_target);
-	PRI_CUSTOM_ATTR("%d", debug.enable_multi_queue);
-	PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
-	PRI_CUSTOM_ATTR("%d", debug.survivability_mode);
+#define _XE_PARAM_DUMP(_T, _name, _def, _val, _vis, _get, _fallback) \
+	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);
+	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DUMP)
+#undef _XE_PARAM_DUMP
 #endif
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index b6eb30249855..2429d11f27a7 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -792,280 +792,21 @@ static ssize_t gt_types_allowed_store(struct config_item *item, const char *page
 	return len;
 }
 
-/**
- * xe_configfs_get_guc_log_level - get configfs guc_log_level setting
- * @pdev: pci device
- *
- * Returns the guc_log_level value configured via configfs. If the configfs
- * value is negative (the default is %XE_GUC_LOG_LEVEL_UNSET, -1), the value
- * of the ``guc_log_level`` module parameter is returned instead, allowing
- * the configfs entry to override the module parameter without affecting
- * users that rely solely on the module parameter.
- *
- * Return: GuC log level to use for this device.
- */
-int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_device(pdev);
-	int level = xe_modparam.guc_log_level;
-
-	if (!dev)
-		return level;
-
-	scoped_guard(mutex, &dev->lock)
-		if (dev->config.debug.guc_log_level >= 0)
-			level = dev->config.debug.guc_log_level;
-
-	config_group_put(&dev->group);
-
-	return level;
-}
-
-static ssize_t guc_log_level_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.guc_log_level);
-}
-
-static ssize_t guc_log_level_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
-	int val;
-	int ret;
-
-	ret = kstrtoint(page, 0, &val);
-	if (ret)
-		return ret;
-
-	if (val != XE_GUC_LOG_LEVEL_UNSET &&
-	    (val < 0 || val > GUC_LOG_LEVEL_MAX))
-		return -EINVAL;
-
-	guard(mutex)(&dev->lock);
-	if (xe_configfs_is_bound(dev))
-		return -EBUSY;
-
-	dev->config.debug.guc_log_level = val;
-
-	return len;
-}
-
-/**
- * xe_configfs_get_guc_log_target - get configfs GuC log target attribute
- * @pdev: pci device
- *
- * Return: guc_log_target attribute in configfs
- */
-u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_device(pdev);
-	u8 target;
-
-	if (!dev)
-		return xe_configfs_device_defaults.debug.guc_log_target;
-
-	scoped_guard(mutex, &dev->lock)
-		target = dev->config.debug.guc_log_target;
-	config_group_put(&dev->group);
-
-	return target;
-}
-
-static ssize_t guc_log_target_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.guc_log_target);
-}
-
-static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
-	u8 guc_log_target;
-	int ret;
-
-	ret = kstrtou8(page, 0, &guc_log_target);
-	if (ret)
-		return ret;
-
-	if (guc_log_target > GUC_LOG_TARGET_MAX)
-		return -EINVAL;
-
-	guard(mutex)(&dev->lock);
-	if (xe_configfs_is_bound(dev))
-		return -EBUSY;
-
-	dev->config.debug.guc_log_target = guc_log_target;
-
-	return len;
-}
-
-/**
- * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
- * @pdev: pci device
- *
- * Return: true if multi-queue is enabled for this device (the default),
- * false if it has been force-disabled via configfs.
- */
-bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_device(pdev);
-	bool ret;
-
-	if (!dev)
-		return xe_configfs_device_defaults.debug.enable_multi_queue;
-
-	scoped_guard(mutex, &dev->lock)
-		ret = dev->config.debug.enable_multi_queue;
-	config_group_put(&dev->group);
-
-	return ret;
-}
-
-static ssize_t enable_multi_queue_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.enable_multi_queue);
-}
-
-static ssize_t enable_multi_queue_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
-	bool val;
-	int ret;
-
-	ret = kstrtobool(page, &val);
-	if (ret)
-		return ret;
-
-	guard(mutex)(&dev->lock);
-	if (xe_configfs_is_bound(dev))
-		return -EBUSY;
-
-	dev->config.debug.enable_multi_queue = val;
-
-	return len;
-}
-
-/**
- * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
- * @pdev: pci device
- *
- * Return: enable_psmi setting in configfs
- */
-bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_device(pdev);
-	bool ret;
-
-	if (!dev)
-		return false;
-
-	scoped_guard(mutex, &dev->lock)
-		ret = dev->config.debug.enable_psmi;
-	config_group_put(&dev->group);
-
-	return ret;
-}
-
-static ssize_t enable_psmi_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.enable_psmi);
-}
-
-static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
-	bool val;
-	int ret;
-
-	ret = kstrtobool(page, &val);
-	if (ret)
-		return ret;
-
-	guard(mutex)(&dev->lock);
-	if (xe_configfs_is_bound(dev))
-		return -EBUSY;
-
-	dev->config.debug.enable_psmi = val;
-
-	return len;
-}
-
-/**
- * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
- * @pdev: pci device
- *
- * Return: survivability_mode attribute in configfs
- */
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
-{
-	struct xe_config_group_device *dev = find_device(pdev);
-	bool mode;
-
-	if (!dev)
-		return xe_configfs_device_defaults.debug.survivability_mode;
-
-	scoped_guard(mutex, &dev->lock)
-		mode = dev->config.debug.survivability_mode;
-	config_group_put(&dev->group);
-
-	return mode;
-}
-
-static ssize_t survivability_mode_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.survivability_mode);
-}
-
-static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
-	bool survivability_mode;
-	int ret;
-
-	ret = kstrtobool(page, &survivability_mode);
-	if (ret)
-		return ret;
-
-	guard(mutex)(&dev->lock);
-	if (xe_configfs_is_bound(dev))
-		return -EBUSY;
-
-	dev->config.debug.survivability_mode = survivability_mode;
-
-	return len;
-}
-
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
-CONFIGFS_ATTR(, guc_log_level);
-CONFIGFS_ATTR(, guc_log_target);
-CONFIGFS_ATTR(, enable_multi_queue);
-CONFIGFS_ATTR(, enable_psmi);
-CONFIGFS_ATTR(, survivability_mode);
 
 static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
-	&attr_guc_log_level,
-	&attr_guc_log_target,
-	&attr_enable_multi_queue,
-	&attr_enable_psmi,
-	&attr_survivability_mode,
+	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(XE_PARAM_ATTR_PTR)
 	NULL,
 };
 
+
 /*
  * Per-parameter visibility predicates.
  *
@@ -1084,16 +825,18 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 static bool xe_configfs_debug_is_visible(struct config_item *item,
 					 struct configfs_attribute *attr, int n)
 {
-	if (attr == &attr_survivability_mode) {
-		struct xe_config_group_device *dev =
-			xe_configfs_to_group_device(item->ci_parent);
-
-		return dev->desc->is_dgfx && dev->desc->platform >= XE_BATTLEMAGE;
-	}
+#define _XE_PARAM_VIS_CHECK(_T, _name, _def, _val, _vis, _get, _fallback) \
+	if (attr == &xe_configfs_attr_##_name) \
+		return _vis(item);
+	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_VIS_CHECK)
+#undef _XE_PARAM_VIS_CHECK
 
 	return true;
 }
 
+#undef XE_PARAM_VISIBLE_ALWAYS
+#undef XE_PARAM_VISIBLE_SURVIVABILITY
+
 static struct configfs_group_operations xe_configfs_debug_group_ops = {
 	.is_visible	= xe_configfs_debug_is_visible,
 };
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
index b97a7fff6652..375ddc17ba36 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -7,7 +7,7 @@
 
 #include <linux/types.h>
 
-#include "xe_defaults.h"
+#include "xe_configfs_debug_params.h"
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
 
@@ -26,11 +26,7 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
-int xe_configfs_get_guc_log_level(struct pci_dev *pdev);
-u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
-bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
-bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(XE_PARAM_DECLARE_GETTER)
 #else
 /*
  * Dummy values here are not used since these function accesses are always
@@ -46,17 +42,7 @@ static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
-static inline int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
-{
-	return xe_modparam.guc_log_level;
-}
-static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
-{
-	return XE_DEFAULT_GUC_LOG_TARGET;
-}
-static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
-static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
+XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(XE_PARAM_DECLARE_GETTER_STUB)
 #endif
 
 #endif /* _XE_CONFIGFS_DEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.c b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
index c28d2e4693f8..b85bd82c8c94 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug_params.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.c
@@ -40,6 +40,7 @@
 
 #include "xe_configfs_debug_params.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 
 #define _XE_PARAM_DEFINE_OPS_NUMERIC(_T, _name, _kstrto, _fmt, _validator) \
 static ssize_t _name##_show(struct config_item *item, char *page) \
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.h b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
index 3ed7ed22961f..d20c1f1250a1 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug_params.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
@@ -10,6 +10,12 @@
 #include <linux/errno.h>
 #include <linux/types.h>
 
+#include "abi/guc_log_abi.h"
+#include "xe_defaults.h"
+#include "xe_guc_fwif.h"
+#include "xe_guc_log.h"
+#include "xe_module.h"
+
 struct pci_dev;
 
 /*
@@ -49,6 +55,12 @@ struct pci_dev;
  */
 #define XE_PARAM_VALIDATE_NONE(_v)		(0)
 
+#define XE_PARAM_VALIDATE_GUC_LOG_LEVEL(_v) \
+	(((_v) == XE_GUC_LOG_LEVEL_UNSET || \
+	  ((_v) >= 0 && (_v) <= GUC_LOG_LEVEL_MAX)) ? 0 : -EINVAL)
+#define XE_PARAM_VALIDATE_GUC_LOG_TARGET(_v) \
+	(((_v) <= GUC_LOG_TARGET_MAX) ? 0 : -EINVAL)
+
 /*
  * Per-parameter getter helpers.
  *
@@ -71,6 +83,10 @@ struct pci_dev;
  */
 #define XE_PARAM_GETTER_READ(_dev, _name)	((_dev)->config.debug.params._name)
 
+#define XE_PARAM_GETTER_GUC_LOG_LEVEL(_dev, _name) \
+	({ typeof((_dev)->config.debug.params._name) __v = (_dev)->config.debug.params._name; \
+	   __v >= 0 ? __v : xe_modparam.guc_log_level; })
+
 /**
  * XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH - iterate over debug configfs params
  * @param: function-like macro called as
@@ -106,7 +122,11 @@ struct pci_dev;
  * at runtime if needed.
  */
 #define XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(param) \
-	/* No parameters yet - add entries above this line. */
+	param(int,  guc_log_level,      XE_GUC_LOG_LEVEL_UNSET,    XE_PARAM_VALIDATE_GUC_LOG_LEVEL,  XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_GUC_LOG_LEVEL, xe_modparam.guc_log_level) \
+	param(u8,   guc_log_target,     XE_DEFAULT_GUC_LOG_TARGET, XE_PARAM_VALIDATE_GUC_LOG_TARGET, XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          XE_DEFAULT_GUC_LOG_TARGET) \
+	param(bool, enable_multi_queue, true,                      XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          true) \
+	param(bool, enable_psmi,        false,                     XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_ALWAYS,        XE_PARAM_GETTER_READ,          false) \
+	param(bool, survivability_mode, false,                     XE_PARAM_VALIDATE_NONE,           XE_PARAM_VISIBLE_SURVIVABILITY, XE_PARAM_GETTER_READ,          false)
 
 /* Generate the struct that backs all debug params in xe_config_device. */
 #define _XE_PARAM_MEMBER(_T, _name, _def, _val, _vis, _get, _fallback) XE_PARAM_TYPE_##_T _name;
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index 1123f6e2a668..c6eb90573866 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -9,6 +9,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#include "xe_configfs_debug_params.h"
 #include "xe_hw_engine_types.h"
 #include "xe_pci_types.h"
 #include "xe_sriov_types.h"
@@ -38,11 +39,7 @@ struct xe_config_group_device {
 			struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 			u64 engines_allowed;
 			u64 gt_types_allowed;
-			int guc_log_level;
-			u8 guc_log_target;
-			bool enable_multi_queue;
-			bool enable_psmi;
-			bool survivability_mode;
+			struct xe_configfs_debug_params params;
 		} debug;
 #endif
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f463adff2737..1140f72406ee 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -100,7 +100,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (!xe->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
 
-	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
+	if (xe_configfs_get_enable_psmi(to_pci_dev(xe->drm.dev)))
 		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
 
 	if (xe_guc_using_main_gamctrl_queues(guc))
diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
index 59af3d145418..ff9a14949339 100644
--- a/drivers/gpu/drm/xe/xe_psmi.c
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -34,7 +34,7 @@
 
 static bool psmi_enabled(struct xe_device *xe)
 {
-	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
+	return xe_configfs_get_enable_psmi(to_pci_dev(xe->drm.dev));
 }
 
 static void psmi_free_object(struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 62068189320f..3ead1eac93f5 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -450,7 +450,7 @@ bool xe_rtp_match_psmi_enabled(const struct xe_device *xe,
 			       const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe)
 {
-	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
+	return xe_configfs_get_enable_psmi(to_pci_dev(xe->drm.dev));
 }
 
 bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_device *xe,
-- 
2.43.0

