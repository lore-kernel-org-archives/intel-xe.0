Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA19CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 08:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5BE10E0F7;
	Tue, 12 Aug 2025 08:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lv3LZGcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D2C10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754988368; x=1786524368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rUfWtQHn4RWOTQ8dAugMvEtNLySp2RHt0Q3FVhf3uAQ=;
 b=Lv3LZGcVYiH5sSRH0h0A0bUxs88/FJkFsWGdtI6xWKwtZcFXSp80+GM+
 Ud3LknzC2CmfPyC8UyqnY9SXTrhyRxHfinsZIVW9Qk4RD9SAWmpGi3pIE
 yefLIne942xf5eidhtlZOytVzGT0aBqVVjADcj0eA9LEv+TS39vbPgr6U
 F1mWxDysjOUmy33dDR5q1w1Ll4uTgR7uWcwEM5GaU5Lq/0CswnpZKZ8Vo
 XtD4jFcPBH61w0DwseuXQxHhFb9hgccKK4a977ZTNF+nrL1HLegSLLHvd
 /36PJqjvkXJtrZ7Oyecrg7WuA5XrX22msoqtuCOsd70isPo1ZD/T/7et5 w==;
X-CSE-ConnectionGUID: El3v3TrxSDeRyZnmRITbCQ==
X-CSE-MsgGUID: HV+ax75kRGynZepKFNe4mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67857785"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67857785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 01:46:08 -0700
X-CSE-ConnectionGUID: V5uu7GzuQ26eRxMNUpBREA==
X-CSE-MsgGUID: S+ODRgg5QM2SUELCTT2Ykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165645694"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 01:46:06 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v9 1/4] drm/xe: Validate wedged_mode parameter and define enum
 for modes
Date: Tue, 12 Aug 2025 10:45:54 +0200
Message-Id: <20250812084557.7805-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250812084557.7805-1-lukasz.laguna@intel.com>
References: <20250812084557.7805-1-lukasz.laguna@intel.com>
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

Check correctness of the wedged_mode parameter input to ensure only
supported values are accepted. Additionally, replace magic numbers with
a clearly defined enum.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  5 +--
 drivers/gpu/drm/xe/xe_device.c       | 46 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h |  7 ++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      |  4 +--
 drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +++--
 drivers/gpu/drm/xe/xe_module.c       |  5 +--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 9 files changed, 73 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0b4a532f7c45..16b2e306559a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -264,8 +264,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (ret)
 		return ret;
 
-	if (wedged_mode > 2)
-		return -EINVAL;
+	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
+	if (ret)
+		return ret;
 
 	if (xe->wedged.mode == wedged_mode)
 		return size;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3e0402dff423..412da766ea79 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -749,7 +749,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->wedged.mode = xe_modparam.wedged_mode;
+	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
+			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
+	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
+		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
 
 	err = xe_device_vram_alloc(xe);
 	if (err)
@@ -1177,7 +1180,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
-	if (xe->wedged.mode == 0) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
 	}
@@ -1206,3 +1209,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 }
+
+/**
+ * xe_device_validate_wedged_mode - Check if given mode is supported
+ * @xe: the &xe_device
+ * @mode: requested mode to validate
+ *
+ * Check whether the provided wedged mode is supported.
+ *
+ * Return: 0 if mode is supported, error code otherwise.
+ */
+int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
+{
+	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
+		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_wedged_mode_to_string - Convert enum value to string.
+ * @mode: the &xe_wedged_mode to convert
+ *
+ * Returns: wedged mode as a user friendly string.
+ */
+const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
+{
+	switch (mode) {
+	case XE_WEDGED_MODE_NEVER:
+		return "never";
+	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
+		return "upon-critical-error";
+	case XE_WEDGED_MODE_UPON_ANY_HANG:
+		return "upon-any-hang";
+	default:
+		return "<invalid>";
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bc802e066a7d..8c780a502374 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -188,6 +188,8 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 }
 
 void xe_device_declare_wedged(struct xe_device *xe);
+int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
+const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 01e8fa0d2f9f..230e9ffd0b67 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -540,7 +540,12 @@ struct xe_device {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
-		int mode;
+		enum xe_wedged_mode {
+			XE_WEDGED_MODE_NEVER = 0,
+			XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
+			XE_WEDGED_MODE_UPON_ANY_HANG = 2,
+			XE_WEDGED_MODE_DEFAULT = XE_WEDGED_MODE_UPON_CRITICAL_ERROR,
+		} mode;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index d7da67637079..3b9884fe61a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -447,7 +447,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
@@ -996,7 +996,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
 	policies->is_valid = 1;
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
 		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 	else
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 243dad3e2418..50f86833e5bc 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1862,7 +1862,14 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 		return NULL;
 
 	xe = gt_to_xe(q->gt);
-	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
+
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
+		return NULL;
+
+	if (!xe_device_uc_enabled(xe))
+		return NULL;
+
+	if (IS_SRIOV_VF(xe))
 		return NULL;
 
 	ss = &xe->devcoredump.snapshot;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..ba03fd95cb2b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -952,8 +952,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 				       guc_submit_wedged_fini, guc);
 	if (err) {
-		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
-			  "Although device is wedged.\n");
+		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
+			  "Although device is wedged.\n",
+			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG));
 		return;
 	}
 
@@ -968,7 +969,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	if (xe->wedged.mode != 2)
+	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG)
 		return false;
 
 	if (xe_device_wedged(xe))
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..7f7067bcf394 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_module.h>
 
+#include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_configfs.h"
 #include "xe_hw_fence.h"
@@ -29,7 +30,7 @@
 #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
 #define DEFAULT_MAX_VFS			~0
 #define DEFAULT_MAX_VFS_STR		"unlimited"
-#define DEFAULT_WEDGED_MODE		1
+#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
 #define DEFAULT_SVM_NOTIFIER_SIZE	512
 
 struct xe_modparam xe_modparam = {
@@ -88,7 +89,7 @@ MODULE_PARM_DESC(max_vfs,
 		 "[default=" DEFAULT_MAX_VFS_STR "])");
 #endif
 
-module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
 MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
 		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 5a3bfea8b7b4..1c75f38ca393 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -21,7 +21,7 @@ struct xe_modparam {
 #ifdef CONFIG_PCI_IOV
 	unsigned int max_vfs;
 #endif
-	int wedged_mode;
+	unsigned int wedged_mode;
 	u32 svm_notifier_size;
 };
 
-- 
2.40.0

