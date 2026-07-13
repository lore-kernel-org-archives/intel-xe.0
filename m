Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B02C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 13:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D2810E5E2;
	Mon, 13 Jul 2026 13:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsQ7Fbs5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F278C10E5D2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783950005; x=1815486005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rfcv60+zcBux+F6qE+tHxn6kMuVdT65M4ZxcWk8VIKs=;
 b=jsQ7Fbs5VAzY0t3Tdd3U0q1uRI3+xX9qFF1+Yo2rZNa2UJQMFCM9AMGd
 adsALLVs4a+qfDorwRG0y9TSPwMsvp/uUquywArTUv/CRwXIQaZAn6wxi
 QXyDj0Mjibte3usQtqQrpAGB/13Df0hNXeEBSx4M3nrkZlJaTUJoj2P1O
 /MU2+wxGwembbS0KPaI3Rc3ly+NdY6QKbUT4N/oVBqRSfHgwwUXT4Autw
 U5oTuOMOzKKfFTFwtiVn1z1sDwvy5EcysZZhPfIF4vqyERKABU9aO6fFg
 JR+fLBaQ+D2d1MWIsDnFHs75NMRSguClgIU/sJMkzwAYUmhIgiOxOvWxY A==;
X-CSE-ConnectionGUID: HIOiI3BIQNOSBEYv6TLJtA==
X-CSE-MsgGUID: PjdXIr28Q7GYpFOtHajlHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88382304"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88382304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:39:56 -0700
X-CSE-ConnectionGUID: qTDdhE1SQQqbPd2oz27fQg==
X-CSE-MsgGUID: 1E+hLMGMQYm41K4Rqqv4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="252927666"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 13 Jul 2026 06:39:53 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v10] drm/xe: Consolidate debugfs fault injection functions.
Date: Mon, 13 Jul 2026 19:06:12 +0530
Message-ID: <20260713133611.262732-2-mallesh.koujalagi@intel.com>
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

The fault injection code was scattered: the GT reset
hook lived in xe_gt.h as an inline function with its own global
variable, the CSC hook had a separate global in xe_hw_error.c with
an extern declaration, and each was individually registered in
xe_debugfs.c. Adding a new error type meant editing many files and
copy-pasting the same boilerplate.

Debugfs interface (under /sys/kernel/debug/dri/0/):
 - fail_gt_reset         - GT reset failure
 - inject_csc_hw_error   - CSC firmware error

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Add multiple platform support. (Vinay)
- Handle VF properly.
- Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
  create xe_fault_inject_types.h file including those name.

v3:
- Solved patch apply issue on tip.

v4:
- Add proper header file.

v5:
- Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
- Change xe_fault_inject_descs to xe_fault_inject_entry.
- Change 2025 to 2026.

v6:
- Change return comments of xe_fault_inject(). (Riana)
- Remove full description of xe_fault_inject_debugfs_register().

v7:
- Move all fault inject helper functions in xe_debugfs.c (Riana)
- Update commit message.

v8:
- Assign .attr pointer with DECLARE_FAULT_ATTR macro. (Riana)
- Remove CONFIG_FAULT_INJECTION block.

v9:
- Add single availability callback.
- Make an abstracted function. (Riana)
- Fix xe_fault_inject_entry struct.

v10:
- Swap attr and is_visible in xe_fault_inject_entry.
- Add is_visible instead of available. (Riana)
- Add FAULT_ACTION macro.
---
 drivers/gpu/drm/xe/xe_debugfs.c  | 46 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_debugfs.h  |  5 ++++
 drivers/gpu/drm/xe/xe_gt.c       |  5 ++--
 drivers/gpu/drm/xe/xe_gt.h       |  8 ------
 drivers/gpu/drm/xe/xe_hw_error.c | 11 ++------
 5 files changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..1fabb0b8d198 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
@@ -42,6 +43,47 @@
 DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
 
+static bool csc_hw_error_available(struct xe_device *xe)
+{
+	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
+}
+
+static struct {
+	const char *name;
+	struct fault_attr *attr;
+	bool (*is_visible)(struct xe_device *xe);
+} xe_fault_inject_entry[] = {
+	{ .name = "fail_gt_reset",
+	  .attr = &gt_reset_failure },
+	{ .name = "inject_csc_hw_error",
+	  .attr = &inject_csc_hw_error,
+	  .is_visible = csc_hw_error_available },
+};
+
+#define FAULT_ACTION(name, fault_attr)			\
+bool xe_fault_##name(void)				\
+{							\
+	return should_fail(&(fault_attr), 1);		\
+}
+
+FAULT_ACTION(gt_reset, gt_reset_failure)
+FAULT_ACTION(csc_hw_error, inject_csc_hw_error)
+
+static void xe_fault_inject_debugfs_register(struct xe_device *xe,
+					     struct dentry *root)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(xe_fault_inject_entry); i++) {
+		if (xe_fault_inject_entry[i].is_visible &&
+		    !xe_fault_inject_entry[i].is_visible(xe))
+			continue;
+
+		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
+					  xe_fault_inject_entry[i].attr);
+	}
+}
+
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, const char *name, struct drm_printer *p)
 {
@@ -583,8 +625,6 @@ void xe_debugfs_register(struct xe_device *xe)
 		drm_debugfs_create_files(debugfs_residencies,
 					 ARRAY_SIZE(debugfs_residencies),
 					 root, minor);
-		fault_create_debugfs_attr("inject_csc_hw_error", root,
-					  &inject_csc_hw_error);
 	}
 
 	/*
@@ -642,7 +682,7 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	xe_psmi_debugfs_register(xe);
 
-	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+	xe_fault_inject_debugfs_register(xe, root);
 
 	if (IS_SRIOV_PF(xe))
 		xe_sriov_pf_debugfs_register(xe, root);
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 17f4c2f1b5e4..e8e65f2507cb 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -6,8 +6,13 @@
 #ifndef _XE_DEBUGFS_H_
 #define _XE_DEBUGFS_H_
 
+#include <linux/types.h>
+
 struct xe_device;
 
+bool xe_fault_gt_reset(void);
+bool xe_fault_csc_hw_error(void);
+
 #ifdef CONFIG_DEBUG_FS
 void xe_debugfs_register(struct xe_device *xe);
 #else
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d904527a8898..dfdacc0f6de9 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -21,6 +21,7 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
+#include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_eu_stall.h"
 #include "xe_exec_queue.h"
@@ -926,7 +927,7 @@ static void gt_reset_worker(struct work_struct *w)
 
 	xe_gt_info(gt, "reset started\n");
 
-	if (xe_fault_inject_gt_reset()) {
+	if (xe_fault_gt_reset()) {
 		err = -ECANCELED;
 		goto err_fail;
 	}
@@ -986,7 +987,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		return;
 
 	/* Don't do a reset while one is already in flight */
-	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
+	if (!xe_fault_gt_reset() && xe_uc_reset_prepare(&gt->uc))
 		return;
 
 	xe_gt_info(gt, "reset queued from %ps\n", __builtin_return_address(0));
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index a6cfaa1af23f..65a4655b0994 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -6,8 +6,6 @@
 #ifndef _XE_GT_H_
 #define _XE_GT_H_
 
-#include <linux/fault-inject.h>
-
 #include <drm/drm_util.h>
 
 #include "xe_device.h"
@@ -38,12 +36,6 @@
 	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
 })
 
-extern struct fault_attr gt_reset_failure;
-static inline bool xe_fault_inject_gt_reset(void)
-{
-	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
-}
-
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 4a4b363fc844..ad2ec603df4e 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/bitmap.h>
-#include <linux/fault-inject.h>
 
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
@@ -12,6 +11,7 @@
 
 #include "xe_device.h"
 #include "xe_drm_ras.h"
+#include "xe_debugfs.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
 #include "xe_survivability_mode.h"
@@ -25,8 +25,6 @@
 						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
 						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
 
-extern struct fault_attr inject_csc_hw_error;
-
 static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
 
 static const char * const hec_uncorrected_fw_errors[] = {
@@ -167,11 +165,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
 						 pvc_master_local_fatal_err_reg : \
 						 pvc_master_local_nonfatal_err_reg)
 
-static bool fault_inject_csc_hw_error(void)
-{
-	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
-}
-
 static void csc_hw_error_work(struct work_struct *work)
 {
 	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
@@ -517,7 +510,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 {
 	enum hardware_error hw_err;
 
-	if (fault_inject_csc_hw_error())
+	if (xe_fault_csc_hw_error())
 		schedule_work(&tile->csc_hw_error_work);
 
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
-- 
2.34.1

