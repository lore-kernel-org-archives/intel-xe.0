Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF6C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72510E452;
	Mon, 12 May 2025 16:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1xyftGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FC710E452
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747067722; x=1778603722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2PqBE8A8gLVOdsSbbrl0Cy3KySh+cvvpqnLOCHeStM=;
 b=I1xyftGqv9g/E2CKg7Q48qTDV4fJg9jQYwGrqCIVORszKNLIvfMvvbS6
 pc+qMewTRU+OL9KvG9fIoI7awndWQxnZtXscNiyMPy218dGoB/+OFgNfW
 bsg4Y3sXUQiI0Jv7ex51tSi6Cd4UZd3nZNdyMmokI4AFYEFo2n/eW6ZQw
 S8VVLn3S5Orz1+K2fMX0AMu8JlUYOfvcjxHZXNPLK8o4skhsORvRabXo+
 AIOxUksXX0y6WwkFgi5kRZeugJePDKF0siACjp/Yw+jtgHGXAJCuM67y1
 cuOqKTDNtMfspncsbADNofnGRIfJYCRGGNz7DHQJGiyATmFoZZM+M7AA2 w==;
X-CSE-ConnectionGUID: ksaYOFpARQ69KClEVQVLAA==
X-CSE-MsgGUID: i5Akt6SsQkiXECR1ferPTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36501022"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="36501022"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:22 -0700
X-CSE-ConnectionGUID: nczm0+C1QYSsAGkIsyDjhQ==
X-CSE-MsgGUID: D32oU4dpT72VpJvy8YagUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137351564"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:21 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v2 1/4] drm/xe: Validate wedged_mode parameter and define enum
 for modes
Date: Mon, 12 May 2025 18:34:29 +0200
Message-Id: <20250512163432.22678-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250512163432.22678-1-lukasz.laguna@intel.com>
References: <20250512163432.22678-1-lukasz.laguna@intel.com>
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

Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++--
 drivers/gpu/drm/xe/xe_device.c       | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  6 +++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      |  4 ++--
 drivers/gpu/drm/xe/xe_guc_capture.c  |  3 ++-
 drivers/gpu/drm/xe/xe_module.c       |  5 +++--
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 8 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..7e14eb037295 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -163,8 +163,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (ret)
 		return ret;
 
-	if (wedged_mode > 2)
-		return -EINVAL;
+	ret = xe_device_wedged_mode_validate(xe, wedged_mode);
+	if (ret)
+		return ret;
 
 	if (xe->wedged.mode == wedged_mode)
 		return size;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 399ae5f40321..b2d4f1b7d46a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -729,7 +729,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->wedged.mode = xe_modparam.wedged_mode;
+	xe->wedged.mode = xe_device_wedged_mode_validate(xe, xe_modparam.wedged_mode) ?
+			  XE_WEDGED_MODE_FATAL_ERROR /* default */ :
+			  xe_modparam.wedged_mode;
+	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u)\n", xe->wedged.mode);
 
 	return 0;
 }
@@ -1143,7 +1146,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
-	if (xe->wedged.mode == 0) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_DISABLED) {
 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
 	}
@@ -1171,3 +1174,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 }
+
+/**
+ * xe_device_wedged_mode_validate() - Check if given mode is supported
+ * @xe: the &xe_device
+ * @mode: requested mode to validate
+ *
+ * Check whether the provided wedged mode is supported.
+ *
+ * Return: 0 if mode is supported, error code otherwise.
+ */
+int xe_device_wedged_mode_validate(struct xe_device *xe, unsigned int mode)
+{
+	if (mode > XE_WEDGED_MODE_FIRST_HANG) {
+		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..a22ebf394450 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -191,6 +191,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 }
 
 void xe_device_declare_wedged(struct xe_device *xe);
+int xe_device_wedged_mode_validate(struct xe_device *xe, unsigned int mode);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 06c65dace026..1bd96981628a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -556,7 +556,11 @@ struct xe_device {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
-		int mode;
+		enum xe_wedged_mode {
+			XE_WEDGED_MODE_DISABLED = 0,
+			XE_WEDGED_MODE_FATAL_ERROR = 1,
+			XE_WEDGED_MODE_FIRST_HANG = 2,
+		} mode;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 44c1fa2fe7c8..d9b7fff1d2a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -469,7 +469,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_FIRST_HANG)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
@@ -1018,7 +1018,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
 	policies->is_valid = 1;
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_FIRST_HANG)
 		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 	else
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 859a3ba91be5..c592b4f294cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1856,7 +1856,8 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 		return NULL;
 
 	xe = gt_to_xe(q->gt);
-	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
+	if (xe->wedged.mode == XE_WEDGED_MODE_FIRST_HANG || !xe_device_uc_enabled(xe) ||
+	    IS_SRIOV_VF(xe))
 		return NULL;
 
 	ss = &xe->devcoredump.snapshot;
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 05c7d0ae6d83..fb41bf76d48c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_module.h>
 
+#include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_configfs.h"
 #include "xe_hw_fence.h"
@@ -25,7 +26,7 @@ struct xe_modparam xe_modparam = {
 #ifdef CONFIG_PCI_IOV
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
 #endif
-	.wedged_mode = 1,
+	.wedged_mode = XE_WEDGED_MODE_FATAL_ERROR,
 	.svm_notifier_size = 512,
 	/* the rest are 0 by default */
 };
@@ -71,7 +72,7 @@ MODULE_PARM_DESC(max_vfs,
 		 "(0 = no VFs [default]; N = allow up to N VFs)");
 #endif
 
-module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
 MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 84339e509c80..fb674bc08955 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -22,7 +22,7 @@ struct xe_modparam {
 #ifdef CONFIG_PCI_IOV
 	unsigned int max_vfs;
 #endif
-	int wedged_mode;
+	unsigned int wedged_mode;
 	u32 svm_notifier_size;
 };
 
-- 
2.40.0

