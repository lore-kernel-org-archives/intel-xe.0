Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23789C5AC79
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 23:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC41010F050;
	Wed,  5 Aug 2026 23:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjGGY9dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6236810E0A3
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785972025; x=1817508025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=znpVB6k4L9Vcrbz8awKMGSHyD+zk4uyoaJWnwPArTrE=;
 b=WjGGY9dpqQKyBaP9HO2pP+NAN/lTaoA3wHq3pFOE+xChcmRwpXD4DkaN
 z+R4EUCcHG2nF8ewsKD1xTDDnABkwNr91/LKcvQMo/hJNLG2gZ+hXHh0Z
 T/BM2ya4hm71NZw9Prs0ldUxCT7f0Sjt0u60qHGwejJGgtP4H0ge9AbEj
 8TlOMuIF2yN7BxST0giZKOO6W7MESjW8/qdm3CYT5acg4dBSkPwcDLMNw
 TZ3RCLIOemCrd5QqIqOi2NwI3K7PMQTpnxIZa9eKYD+UjBMb2WFKsN/nF
 D7cCkrBMSNzC18gHyIAIEUeuHuRPLeXu1XCFP60/soXiPufD6+RecQAvr w==;
X-CSE-ConnectionGUID: Axo3tjBCS0CXRGZHVOOgSg==
X-CSE-MsgGUID: 5bCkxKw9RwezQhKJoqJ6aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97206426"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="97206426"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 16:20:25 -0700
X-CSE-ConnectionGUID: N7MCmhI4R6GLAWs5Xk0O4Q==
X-CSE-MsgGUID: HAToalNnQzudZRhS8wE4RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="261395875"
Received: from dut4475arls.fm.intel.com ([10.105.10.28])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 16:20:26 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 07/10] drm/xe/guc: Add support for NPK as a GuC log target
Date: Wed,  5 Aug 2026 23:20:28 +0000
Message-ID: <20260805232021.337103-19-stuart.summers@intel.com>
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
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7,claude-sonnet-5
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h   |  8 ++++
 drivers/gpu/drm/xe/xe_configfs.c       |  2 +
 drivers/gpu/drm/xe/xe_configfs_debug.c | 63 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h |  5 ++
 drivers/gpu/drm/xe/xe_configfs_types.h |  1 +
 drivers/gpu/drm/xe/xe_defaults.h       |  2 +
 drivers/gpu/drm/xe/xe_guc.c            | 11 +++--
 7 files changed, 89 insertions(+), 3 deletions(-)

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
index ea09d5f9e925..c5d5017cd506 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -101,6 +101,7 @@ const struct xe_config_device xe_configfs_device_defaults = {
 		.engines_allowed = U64_MAX,
 		.gt_types_allowed = U64_MAX,
 		.guc_log_level = XE_GUC_LOG_LEVEL_UNSET,
+		.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
 		.enable_multi_queue = true,
 		.enable_psmi = false,
 		.survivability_mode = false,
@@ -420,6 +421,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%llx", debug.engines_allowed);
 	PRI_CUSTOM_ATTR("%llx", debug.gt_types_allowed);
 	PRI_CUSTOM_ATTR("%d", debug.guc_log_level);
+	PRI_CUSTOM_ATTR("%d", debug.guc_log_target);
 	PRI_CUSTOM_ATTR("%d", debug.enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", debug.enable_psmi);
 	PRI_CUSTOM_ATTR("%d", debug.survivability_mode);
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
index a65ff1f20917..052607d89a9a 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.c
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -46,6 +46,7 @@
  *	        ├── engines_allowed
  *	        ├── gt_types_allowed
  *	        ├── guc_log_level
+ *	        ├── guc_log_target
  *	        ├── enable_multi_queue
  *	        ├── enable_psmi
  *	        └── survivability_mode
@@ -190,6 +191,16 @@
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
  * Enable multi-queue
  * ------------------
  *
@@ -840,6 +851,56 @@ static ssize_t guc_log_level_store(struct config_item *item, const char *page, s
 	return len;
 }
 
+/**
+ * xe_configfs_get_guc_log_target - get configfs GuC log target attribute
+ * @pdev: pci device
+ *
+ * Return: guc_log_target attribute in configfs
+ */
+u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_device(pdev);
+	u8 target;
+
+	if (!dev)
+		return xe_configfs_device_defaults.debug.guc_log_target;
+
+	scoped_guard(mutex, &dev->lock)
+		target = dev->config.debug.guc_log_target;
+	config_group_put(&dev->group);
+
+	return target;
+}
+
+static ssize_t guc_log_target_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = xe_configfs_subgroup_to_device(item);
+
+	return sprintf(page, "%d\n", dev->debug.guc_log_target);
+}
+
+static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = xe_configfs_subgroup_to_group_device(item);
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
 /**
  * xe_configfs_get_enable_multi_queue - get configfs enable_multi_queue setting
  * @pdev: pci device
@@ -987,6 +1048,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, guc_log_level);
+CONFIGFS_ATTR(, guc_log_target);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, survivability_mode);
@@ -997,6 +1059,7 @@ static struct configfs_attribute *xe_configfs_debug_attrs[] = {
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_guc_log_level,
+	&attr_guc_log_target,
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
 	&attr_survivability_mode,
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
index 5fe39bb72f00..b97a7fff6652 100644
--- a/drivers/gpu/drm/xe/xe_configfs_debug.h
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -27,6 +27,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 int xe_configfs_get_guc_log_level(struct pci_dev *pdev);
+u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
@@ -49,6 +50,10 @@ static inline int xe_configfs_get_guc_log_level(struct pci_dev *pdev)
 {
 	return xe_modparam.guc_log_level;
 }
+static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_GUC_LOG_TARGET;
+}
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index e9460c3de891..1123f6e2a668 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -39,6 +39,7 @@ struct xe_config_group_device {
 			u64 engines_allowed;
 			u64 gt_types_allowed;
 			int guc_log_level;
+			u8 guc_log_target;
 			bool enable_multi_queue;
 			bool enable_psmi;
 			bool survivability_mode;
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
index b6322db368be..599134d3d027 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -75,13 +75,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 
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

