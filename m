Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8659AD0D145
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C8C10E2B6;
	Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ma/rDggi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D7C10E2B6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808074; x=1799344074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jYT1rSHGDP86hJsAMXDDrnAg0TmEMmoJdUXZHUZQ9p4=;
 b=ma/rDggi+EN5ZjlZzhxGD927OW8vABh6WbZTDuZ0Fy56bOQxXsCBXB5y
 0q4hXksUdRattB68RwO4Chmf5Y/qzk1AacadvhPurVFQuUJPOjJmwlcG6
 eTqU0QfvMw4Sym8htTfi+hn6nN/2RvvLwZ8UGcv9AKdVKz2sfIO7Ec0nT
 A11shQ2uB98l1G/6PLINmiVP1RTpNeiCrqtI0X7rb2cpC12lJNdyMXOm+
 1TZDeNjQ3ttObSHUISNEmFLJgSm9e4pJaquJVEyZyWj9W7+7RMDMP9u3x
 uwvhOeNFqt7DRsCwoSgsbZiHbsRr6PCX9vpxJ8e3Wmt60+EN1eGqB75j6 A==;
X-CSE-ConnectionGUID: 5I2xMhDbQAyyjhYRyE9huA==
X-CSE-MsgGUID: ERVOzHLdQ0OGGEDNdqfq9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69096474"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69096474"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:48 -0800
X-CSE-ConnectionGUID: DzLcfKhFSNyE7llx30b4XA==
X-CSE-MsgGUID: Gid16bwOR5CeEkWgQgnXWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202768585"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:47 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v12 1/4] drm/xe: Validate wedged_mode parameter and define
 enum for modes
Date: Wed,  7 Jan 2026 18:47:38 +0100
Message-Id: <20260107174741.29163-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260107174741.29163-1-lukasz.laguna@intel.com>
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
index 0907868b32d6..db2afd60d8bc 100644
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
index f4741cbe4c45..62ec2e2d6436 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -784,7 +784,10 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe->wedged.mode = xe_modparam.wedged_mode;
+	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
+			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
+	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
+		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
 
 	err = xe_device_vram_alloc(xe);
 	if (err)
@@ -1267,10 +1270,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
@@ -1335,7 +1338,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
-	if (xe->wedged.mode == 0) {
+	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
 	}
@@ -1369,3 +1372,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
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
index 3e72fa4609f8..3740143790db 100644
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
index a85be9ba175e..d790129a06db 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -46,6 +46,25 @@ struct xe_pat_ops;
 struct xe_pxp;
 struct xe_vram_region;
 
+/**
+ * enum xe_wedged_mode - possible wedged modes
+ * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
+ * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
+ *	when critical error occurs like GT reset failure or firmware failure.
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
@@ -626,7 +645,7 @@ struct xe_device {
 		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
-		int mode;
+		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
 	} wedged;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 5feeb91426ee..2b47e897d2ea 100644
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
index 7a4218f76024..45aa56b30a12 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1339,8 +1339,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
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
 
@@ -1355,7 +1356,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
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

