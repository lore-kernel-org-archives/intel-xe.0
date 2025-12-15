Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCD7D5B85E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94210E49B;
	Mon, 15 Dec 2025 17:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GINeCDwm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA9810E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765820783; x=1797356783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0PHGp9//TRAULiT/zHX37Qr4hCW3hBxWNOoWUO5nJPo=;
 b=GINeCDwmY/YRqAO9ktQ2/cUeSISPWU1MIcxJuuNA7oIDsUQdqphSV+k+
 3S3MpbSCWpTqiO9nz0c6vjPCsitcxeZqXHjmu9n9HXG1PZ3+uCqol1cN3
 7NqcqM66M9iJUU36mw9Dr3Xs+XJRI0kXO+Q9CIsvHVdesGWO6J3mY9we/
 AWuBluqKgPocnNndq0QPOClndYwBKbPxQjQSw085Huj2Lkc/XBluXap4d
 3jMVRcqwTQyD6TwWtHDD9kriFuycWUYqB3gQj4hGYZDG5JTmfTc1SMXiJ
 njBM8CEy4X2hj6ngfTJcOncE70sN4S1e8kSmWqA1HT5gl+DcapDKP0uM3 A==;
X-CSE-ConnectionGUID: 3OIf8MdaRY2u+dWboW7/Yg==
X-CSE-MsgGUID: BgiXgXkcRGuG95SEg7r4Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67612343"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67612343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:23 -0800
X-CSE-ConnectionGUID: gg3QtsPzS1qCE/C6F/D29Q==
X-CSE-MsgGUID: NDESJ6BCQ1ecWBAS+ET76w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="198610924"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:21 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v11 1/4] drm/xe: Validate wedged_mode parameter and define
 enum for modes
Date: Mon, 15 Dec 2025 18:46:10 +0100
Message-Id: <20251215174613.3701-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251215174613.3701-1-lukasz.laguna@intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
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
v11:
 - update the Xe Device Wedging doc (Rodrigo),
 - change the name of XE_WEDGED_MODE_UPON_ANY_HANG (Rodrigo).
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  5 +--
 drivers/gpu/drm/xe/xe_device.c       | 54 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_device.h       |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h | 21 ++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.c      |  4 +--
 drivers/gpu/drm/xe/xe_guc_capture.c  |  9 ++++-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  7 ++--
 drivers/gpu/drm/xe/xe_module.c       | 10 +++---
 drivers/gpu/drm/xe/xe_module.h       |  2 +-
 9 files changed, 94 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index ad070055cef1..0b65c3940f41 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -267,8 +267,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
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
index cdaa1c1e73f5..492446fdc4dc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -767,7 +767,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->wedged.mode = xe_modparam.wedged_mode;
+	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
+			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
+	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
+		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
 
 	err = xe_device_vram_alloc(xe);
 	if (err)
@@ -1246,10 +1249,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * DOC: Xe Device Wedging
  *
  * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
- * When device is in wedged state, every IOCTL will be blocked and GT cannot be
- * used. Certain critical errors like gt reset failure, firmware failures can cause
- * the device to be wedged. The default recovery method for a wedged state
- * is rebind/bus-reset.
+ * When device is in wedged state, every IOCTL will be blocked and GT cannot
+ * be used. The conditions under which the driver declares the device wedged
+ * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
+ * default recovery method for a wedged state is rebind/bus-reset.
  *
  * Another recovery method is vendor-specific. Below are the cases that send
  * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
@@ -1314,7 +1317,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
-	if (xe->wedged.mode == 0) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
 	}
@@ -1348,3 +1351,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
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
+	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
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
+	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
+		return "upon-any-hang-no-reset";
+	default:
+		return "<invalid>";
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6604b89330d5..b6ef72e95a3d 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -194,6 +194,8 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
+int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
+const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 96acc43b94e1..20a847965b20 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -44,6 +44,25 @@ struct xe_pat_ops;
 struct xe_pxp;
 struct xe_vram_region;
 
+/**
+ * enum xe_wedged_mode - possible wedged modes
+ * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
+ * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
+ * 	when critical error occurs like GT reset failure or firmware failure.
+ *	This is the default mode.
+ * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
+ *	any hang. In this mode, engine resets are disabled to avoid automatic
+ *	recovery attempts. This mode is primarily intended for debugging hangs.
+ */
+enum xe_wedged_mode {
+	XE_WEDGED_MODE_NEVER = 0,
+	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
+	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
+};
+
+#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
+#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
+
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
@@ -604,7 +623,7 @@ struct xe_device {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
-		int mode;
+		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
 	} wedged;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e06c6aa335bf..e95604416f2d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -451,7 +451,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
 
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 
 	ads_blob_write(ads, policies.global_flags, global_flags);
@@ -1004,7 +1004,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
 	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
 	policies->is_valid = 1;
-	if (xe->wedged.mode == 2)
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
 	else
 		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 2cda92f7b323..bdd700ac1e54 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1889,7 +1889,14 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
 		return NULL;
 
 	xe = gt_to_xe(q->gt);
-	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
+
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		return NULL;
+
+	if (!xe_device_uc_enabled(xe))
+		return NULL;
+
+	if (IS_SRIOV_VF(xe))
 		return NULL;
 
 	ss = &xe->devcoredump.snapshot;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21a8bd2ec672..fd41b06d11df 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1288,8 +1288,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
 				       guc_submit_wedged_fini, guc);
 	if (err) {
-		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
-			  "Although device is wedged.\n");
+		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
+			  "Although device is wedged.\n",
+			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
 		return;
 	}
 
@@ -1304,7 +1305,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	if (xe->wedged.mode != 2)
+	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 		return false;
 
 	if (xe_device_wedged(xe))
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index d08338fc3bc1..9934f90691fd 100644
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
+		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
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

