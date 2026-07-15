Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D992C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F8810E14C;
	Wed, 15 Jul 2026 08:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMzqIR93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C3710E14C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784105752; x=1815641752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OVOgxIPxeb8GUMI+6PAogvkYGVoIjGZTpA2oi1j9Qzo=;
 b=NMzqIR93lglySGyPrHnE6i0yOh+OQblI/tu5ApTxXlQiQ4IVWp223lkB
 A7NolZ/RG7ktVK8REQ8p5Q5pAnScHc6sU6gn+taySh1XF7O9s7ZglecMy
 du9ukJRoDVQl0RWxDjIQmyApxE0R1D+j9BnBjfJbcpqluL9psdBrBe2iM
 QC9HOxh/7oVEkR+W7s+xvtQITjk00OdpauHotL03uDha829nyn8MYiDhM
 2BMXVg0+HxV1z6F2GBKyQ0EOTBJEACjsorGS3I2hqvDagG5bHXhSg2Dul
 lqGMgbXrztr+9KvXfl6JIUyK724H0hnHLu9qDw7HY7wiKPCbpGNI+5oVu Q==;
X-CSE-ConnectionGUID: iSHrrEA8Qhem83wn41puQw==
X-CSE-MsgGUID: a/tivkpDS9WG/kVZVsl1hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107532973"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="107532973"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 01:55:52 -0700
X-CSE-ConnectionGUID: 0SdlW9NiQ9qPJje/3G/Rkw==
X-CSE-MsgGUID: VI2k6rqjTtafrHZo8ZFnyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="256164991"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 15 Jul 2026 01:55:49 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v11] drm/xe: Consolidate debugfs fault injection functions.
Date: Wed, 15 Jul 2026 14:21:59 +0530
Message-ID: <20260715085159.424040-2-mallesh.koujalagi@intel.com>
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

v11:
- Resolve linker issue. (Sashiko)
- Make header order correctly.
- Add comments.
---
 drivers/gpu/drm/xe/xe_debugfs.c  | 54 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_debugfs.h  |  6 ++++
 drivers/gpu/drm/xe/xe_gt.c       |  5 +--
 drivers/gpu/drm/xe/xe_gt.h       |  8 -----
 drivers/gpu/drm/xe/xe_hw_error.c | 11 ++-----
 5 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8c391c7b017a..5a3877fcb0f0 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
@@ -42,6 +43,55 @@
 DECLARE_FAULT_ATTR(gt_reset_failure);
 DECLARE_FAULT_ATTR(inject_csc_hw_error);
 
+static bool csc_hw_error_available(struct xe_device *xe)
+{
+	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
+}
+
+/*
+ * Fault injection table.  Each entry registers a debugfs attribute; add a
+ * matching FAULT_ACTION() below for every entry added here.
+ */
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
+/*
+ * FAULT_ACTION(name, fault_attr) - generate xe_fault_<name>() accessor.
+ * Add one entry per row in xe_fault_inject_entry[].
+ */
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
@@ -583,8 +633,6 @@ void xe_debugfs_register(struct xe_device *xe)
 		drm_debugfs_create_files(debugfs_residencies,
 					 ARRAY_SIZE(debugfs_residencies),
 					 root, minor);
-		fault_create_debugfs_attr("inject_csc_hw_error", root,
-					  &inject_csc_hw_error);
 	}
 
 	/*
@@ -642,7 +690,7 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	xe_psmi_debugfs_register(xe);
 
-	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+	xe_fault_inject_debugfs_register(xe, root);
 
 	if (IS_SRIOV_PF(xe))
 		xe_sriov_pf_debugfs_register(xe, root);
diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
index 17f4c2f1b5e4..cd56f7442b99 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_debugfs.h
@@ -6,11 +6,17 @@
 #ifndef _XE_DEBUGFS_H_
 #define _XE_DEBUGFS_H_
 
+#include <linux/types.h>
+
 struct xe_device;
 
 #ifdef CONFIG_DEBUG_FS
+bool xe_fault_gt_reset(void);
+bool xe_fault_csc_hw_error(void);
 void xe_debugfs_register(struct xe_device *xe);
 #else
+static inline bool xe_fault_gt_reset(void) { return false; }
+static inline bool xe_fault_csc_hw_error(void) { return false; }
 static inline void xe_debugfs_register(struct xe_device *xe) { }
 #endif
 
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
index 4a4b363fc844..5f2abc9485ff 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -4,12 +4,12 @@
  */
 
 #include <linux/bitmap.h>
-#include <linux/fault-inject.h>
 
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
 
+#include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
 #include "xe_hw_error.h"
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

