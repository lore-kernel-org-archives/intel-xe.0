Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E69ECD342F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E78310E36D;
	Mon,  4 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhHV7bqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3F810E36A
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869833; x=1809405833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GKqmbvN95ufCqhaUf9unXDFQzgq2eDaAlJWXe0vB83g=;
 b=EhHV7bqz0gKdYG1rMBZ7BDquY15rd4yvM1Im+PPUEJyWTAb01BMcFYPK
 toCRPQ8X9IwkSknIQFo18Kze0DwkX8I3S50K8C/tcpdFBYfEUHHupXw13
 EQh5TiU1zKKahMayBQI53KnfkDLi8QUgJP2O76PDLWWJI6vCAa425kyuw
 UOJLJ0j/s8k2R1AXehWKUrxEE2IQz9+hsbghdrJMRDjYFPxBe0wTqoeFF
 QqoPCU5eFfjzhYhfioSgmkM5zLzJ/gXOPYGyXX9e+9+ajIufLF43u96/j
 U98FCAADB1yC1aMcL7rWQH/hCHxODvci6wYcJ7xG1ah8CrI8DxvXfkAux Q==;
X-CSE-ConnectionGUID: 5FQ6xguzSS+XfpN8phlR6Q==
X-CSE-MsgGUID: iZ6HPa23Shq0mUcGN2NKOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293564"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:52 -0700
X-CSE-ConnectionGUID: 58+3m/LpQ6Kq11GBsqwnUQ==
X-CSE-MsgGUID: F0R5PDHOSgqs664iCL6g8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773686"
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
Subject: [PATCH 9/9] drm/xe: Migrate existing debug configfs entries to params
 infrastructure
Date: Mon,  4 May 2026 04:43:46 +0000
Message-ID: <20260504044348.209625-10-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
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

Move the four existing debug configfs entries whose semantics fit the
generic show/store template into the new parameter list:

  - enable_psmi                (bool)
  - enable_survivability_mode  (bool)
  - guc_log_level              (int, validated against GUC_LOG_LEVEL_MAX,
                                accepting any negative value as "unset")
  - guc_log_target             (u8,  validated against GUC_LOG_TARGET_MAX)

guc_log_level keeps its module-parameter fallback in the public getter
xe_configfs_get_guc_log_level(): a negative value stored in configfs
(the default is %XE_GUC_LOG_LEVEL_UNSET, -1) means "use the modparam";
only a value >= 0 overrides it. The validator therefore allows any
negative value through so the sentinel can be written back from
userspace.

The remaining hand-written entries (ctx_restore_mid_bb,
ctx_restore_post_bb, engines_allowed, gt_types_allowed) all have
custom string parsing or per-class indexing that does not fit the
generic template and stay as-is.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/xe_configfs.c              |   8 --
 drivers/gpu/drm/xe/xe_configfs_debug.c        | 133 +-----------------
 drivers/gpu/drm/xe/xe_configfs_debug_params.h |  18 ++-
 drivers/gpu/drm/xe/xe_configfs_types.h        |   4 -
 4 files changed, 21 insertions(+), 142 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 59cd83c2ac53..aa4d9fbb967a 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -102,12 +102,8 @@
 const struct xe_config_device xe_configfs_device_defaults = {
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	.debug = {
-		.enable_psmi = false,
-		.enable_survivability_mode = false,
 		.engines_allowed = U64_MAX,
 		.gt_types_allowed = U64_MAX,
-		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
-		.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
 		.params = {
 			XE_CONFIGFS_DEBUG_PARAMS_DEFAULTS
 		},
@@ -430,12 +426,8 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	} while (0)
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-	PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
-	PRI_CUSTOM_ATTR("%d", debug.enable_survivability_mode);
 	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
-	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
-	PRI_CUSTOM_ATTR("%d", debug.guc_log_target);
 #define _XE_PARAM_DUMP(_T, _name, _def, _val) \
 	PRI_CUSTOM_ATTR(XE_PARAM_FMT_##_T, debug.params._name);
 	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DUMP)
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index fcd6c81de3bb..87ec6ee0f05a 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -288,9 +288,9 @@ bool xe_configfs_get_enable_survivability_mode(struct pci_dev *pdev)
 	bool mode;
 
 	if (!dev)
-		return xe_configfs_device_defaults.debug.enable_survivability_mode;
+		return xe_configfs_device_defaults.debug.params.enable_survivability_mode;
 
-	mode = dev->config.debug.enable_survivability_mode;
+	mode = dev->config.debug.params.enable_survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
@@ -308,9 +308,9 @@ u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
 	u8 target;
 
 	if (!dev)
-		return xe_configfs_device_defaults.debug.guc_log_target;
+		return xe_configfs_device_defaults.debug.params.guc_log_target;
 
-	target = dev->config.debug.guc_log_target;
+	target = dev->config.debug.params.guc_log_target;
 	config_group_put(&dev->group);
 
 	return target;
@@ -374,7 +374,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	ret = dev->config.debug.enable_psmi;
+	ret = dev->config.debug.params.enable_psmi;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -400,8 +400,8 @@ int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
 	if (!dev)
 		goto out;
 
-	if (dev->config.debug.guc_log_level >= 0)
-		level = dev->config.debug.guc_log_level;
+	if (dev->config.debug.params.guc_log_level >= 0)
+		level = dev->config.debug.params.guc_log_level;
 
 	config_group_put(&dev->group);
 out:
@@ -460,33 +460,6 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	return len;
 }
 
-static ssize_t enable_survivability_mode_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = debug_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.enable_survivability_mode);
-}
-
-static ssize_t enable_survivability_mode_store(struct config_item *item, const char *page,
-					       size_t len)
-{
-	struct xe_config_group_device *dev = debug_to_group_device(item);
-	bool enable_survivability_mode;
-	int ret;
-
-	ret = kstrtobool(page, &enable_survivability_mode);
-	if (ret)
-		return ret;
-
-	guard(mutex)(&dev->lock);
-	if (xe_configfs_is_bound(dev))
-		return -EBUSY;
-
-	dev->config.debug.enable_survivability_mode = enable_survivability_mode;
-
-	return len;
-}
-
 static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = debug_to_device(item);
@@ -653,61 +626,6 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
-static ssize_t enable_psmi_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = debug_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.enable_psmi);
-}
-
-static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = debug_to_group_device(item);
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
-static ssize_t guc_log_level_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = debug_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.guc_log_level);
-}
-
-static ssize_t guc_log_level_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = debug_to_group_device(item);
-	int val;
-	int ret;
-
-	ret = kstrtoint(page, 0, &val);
-	if (ret)
-		return ret;
-
-	if (val > GUC_LOG_LEVEL_MAX)
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
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -943,43 +861,10 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 	return wa_bb_store(dev->config.debug.ctx_restore_post_bb, dev, data, sz);
 }
 
-static ssize_t guc_log_target_show(struct config_item *item, char *page)
-{
-	struct xe_config_device *dev = debug_to_device(item);
-
-	return sprintf(page, "%d\n", dev->debug.guc_log_target);
-}
-
-static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
-{
-	struct xe_config_group_device *dev = debug_to_group_device(item);
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
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
-CONFIGFS_ATTR(, enable_psmi);
-CONFIGFS_ATTR(, enable_survivability_mode);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
-CONFIGFS_ATTR(, guc_log_level);
-CONFIGFS_ATTR(, guc_log_target);
 
 static bool xe_configfs_debug_is_visible(struct config_item *item,
 					 struct configfs_attribute *attr,
@@ -1002,12 +887,8 @@ static struct configfs_group_operations xe_configfs_debug_group_ops = {
 static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
-	&attr_enable_psmi,
-	&attr_enable_survivability_mode,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
-	&attr_guc_log_level,
-	&attr_guc_log_target,
 	XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(XE_PARAM_ATTR_PTR)
 	NULL,
 };
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.h b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
index 9cf9256eb851..a5f8766d897c 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug_params.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.h
@@ -10,6 +10,10 @@
 #include <linux/errno.h>
 #include <linux/types.h>
 
+#include "abi/guc_log_abi.h"
+#include "xe_guc_fwif.h"
+#include "xe_guc_log.h"
+
 /*
  * Internal type/format aliases resolved by XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH().
  *
@@ -43,12 +47,15 @@
  * acceptable, a negative errno (typically -EINVAL) otherwise.
  *
  * XE_PARAM_VALIDATE_NONE is the no-op validator for parameters whose
- * full type range is acceptable. Param-specific validators are defined
- * alongside the X-macro list below so that the constraints live next to
- * the entries that depend on them.
+ * full type range is acceptable.
  */
 #define XE_PARAM_VALIDATE_NONE(_v)		(0)
 
+#define XE_PARAM_VALIDATE_GUC_LOG_LEVEL(_v) \
+	((((_v) < 0) || ((_v) <= GUC_LOG_LEVEL_MAX)) ? 0 : -EINVAL)
+#define XE_PARAM_VALIDATE_GUC_LOG_TARGET(_v) \
+	(((_v) <= GUC_LOG_TARGET_MAX) ? 0 : -EINVAL)
+
 /**
  * XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH - iterate over debug configfs params
  * @param: function-like macro called as
@@ -73,7 +80,10 @@
  * at runtime if needed.
  */
 #define XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(param) \
-	/* No parameters yet - add entries above this line. */
+	param(bool, enable_psmi, false, XE_PARAM_VALIDATE_NONE) \
+	param(bool, enable_survivability_mode, false, XE_PARAM_VALIDATE_NONE) \
+	param(int, guc_log_level, XE_GUC_LOG_LEVEL_UNSET, XE_PARAM_VALIDATE_GUC_LOG_LEVEL) \
+	param(u8, guc_log_target, XE_DEFAULT_GUC_LOG_TARGET, XE_PARAM_VALIDATE_GUC_LOG_TARGET)
 
 /* Generate the struct that backs all debug params in xe_config_device. */
 #define _XE_PARAM_MEMBER(_T, _name, _def, _val) XE_PARAM_TYPE_##_T _name;
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index 16e91d8072f4..a84a0c8eae7b 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -34,12 +34,8 @@ struct xe_config_group_device {
 		struct {
 			struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 			struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
-			bool enable_psmi;
-			bool enable_survivability_mode;
 			u64 engines_allowed;
 			u64 gt_types_allowed;
-			int guc_log_level;
-			u8 guc_log_target;
 			struct xe_configfs_debug_params params;
 		} debug;
 		struct {
-- 
2.43.0

