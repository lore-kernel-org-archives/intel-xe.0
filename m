Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64563D0E6E8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 13:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028A410E400;
	Tue, 25 Nov 2025 13:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AvK9Yy94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050010E400
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 13:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764078876; x=1795614876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VFwfuLe6XY5mxkF/ShR8gqzRqc/AFwjULkGTaa4wsDw=;
 b=AvK9Yy949pXrJ6IeZy2yS3fCPWDCmU54NZHQhf3Ic/nN/cLTyv2ji7a8
 RX7FuLmLFZ1QOoCMEnUkV7IeMynTW/hJVy5E+5FPB+vbv8nZ0z8z24oQb
 eVari+17iZYX19JvIovlhNZgNDOOvuRsmYgQlQbYCWX9gF6KcijCW5MJV
 mzYbbqwb5lib4l+wh8egNj5Vc9gIqVL8TLMoPNgT98Vw8OH7DGurPmiC2
 Uq1FYR6PikKoQyUX8tpijxQ9ff6ENOjdDiwi2trt5RRY/rbdXBgzFm11Q
 bkskmPkIrtNQs85um2Z/AbbUveTgAzuVTwRTd5McOguQNgvi1dKKPQ1Rr w==;
X-CSE-ConnectionGUID: IUOOqnzkRP21PFPHyGCjYQ==
X-CSE-MsgGUID: c/zH4tBcTjOdUdbLTexmww==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802556"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65802556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:36 -0800
X-CSE-ConnectionGUID: NVdYBOSXS9W8PKxwBE8toQ==
X-CSE-MsgGUID: hbkRJmdxQemFd4a+atOQ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196954001"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:54:34 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v10 1/4] drm/xe: Validate wedged_mode parameter and define
 enum for modes
Date: Tue, 25 Nov 2025 14:54:19 +0100
Message-Id: <20251125135422.11244-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251125135422.11244-1-lukasz.laguna@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
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
---
v10:
 - define enum outside of the xe_device struct,
 - fix description of module parameter (Michal).
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  5 +--
 drivers/gpu/drm/xe/xe_device.c       | 46 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h | 19 +++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      |  4 +--
 drivers/gpu/drm/xe/xe_guc_capture.c  |  9 +++++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  7 +++--
 drivers/gpu/drm/xe/xe_module.c       | 10 +++---
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 9 files changed, 88 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1d5a2a43a9d7..e7cdfb1cda8c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -265,8 +265,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
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
index 1197f914ef77..f6216c4f83f9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -760,7 +760,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->wedged.mode = xe_modparam.wedged_mode;
+	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
+			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
+	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
+		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
 
 	err = xe_device_vram_alloc(xe);
 	if (err)
@@ -1250,7 +1253,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
-	if (xe->wedged.mode == 0) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
 	}
@@ -1284,3 +1287,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
 	}
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
index 32cc6323b7f6..2fffa88f91b0 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -189,6 +189,8 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
+int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
+const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6ce3247d1bd8..81bf4a70b888 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -43,6 +43,23 @@ struct xe_pat_ops;
 struct xe_pxp;
 struct xe_vram_region;
 
+/**
+ * enum xe_wedged_mode - possible wedged modes
+ * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
+ * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only in
+ *	case of critical errors. This is the default mode.
+ * @XE_WEDGED_MODE_UPON_ANY_HANG: Device will be declared wedged on any hang.
+ *	In this mode, engine resets are disabled.
+ */
+enum xe_wedged_mode {
+	XE_WEDGED_MODE_NEVER = 0,
+	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
+	XE_WEDGED_MODE_UPON_ANY_HANG = 2,
+};
+
+#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
+#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
+
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
@@ -583,7 +600,7 @@ struct xe_device {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
-		int mode;
+		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
 	} wedged;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index bcb85a1bf26d..466f192b6054 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -451,7 +451,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
@@ -1004,7 +1004,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
 	policies->is_valid = 1;
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
 		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 	else
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 0c1fbe97b8bf..45ba0c5308ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1889,7 +1889,14 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
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
index 7e0882074a99..4a93a2ff061f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -998,8 +998,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
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
 
@@ -1014,7 +1015,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	if (xe->wedged.mode != 2)
+	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG)
 		return false;
 
 	if (xe_device_wedged(xe))
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..cefd00eb7379 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_module.h>
 
+#include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_configfs.h"
 #include "xe_hw_fence.h"
@@ -29,7 +30,8 @@
 #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
 #define DEFAULT_MAX_VFS			~0
 #define DEFAULT_MAX_VFS_STR		"unlimited"
-#define DEFAULT_WEDGED_MODE		1
+#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
+#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
 #define DEFAULT_SVM_NOTIFIER_SIZE	512
 
 struct xe_modparam xe_modparam = {
@@ -88,10 +90,10 @@ MODULE_PARM_DESC(max_vfs,
 		 "[default=" DEFAULT_MAX_VFS_STR "])");
 #endif
 
-module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
 MODULE_PARM_DESC(wedged_mode,
-		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
-		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
+		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang "
+		 "[default=" DEFAULT_WEDGED_MODE_STR "])");
 
 static int xe_check_nomodeset(void)
 {
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

