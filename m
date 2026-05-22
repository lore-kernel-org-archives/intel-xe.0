Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2382ECD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 12:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E021210E25B;
	Fri, 22 May 2026 12:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHtoTWeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591E710E25B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779451774; x=1810987774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qB7wuVqxa+ZvzCI/wMkOSX9RULhrLQ9rMz1mhoPc5Wo=;
 b=WHtoTWeYrhrFZclh43GkUX3Cw/+RN+HOBREMiieflNXcbREM7mjp2Iz/
 R4n4YRhN7QeLlM5RsrCzaz9Pfry+Ja1Mp8CTDapDUdejKUFcN7ZBNhQj4
 UM5SaqgrurgbAD/IN+4xx42tq14JJARlHOV/Xwvz55kWz+25jdJc+yMi9
 T6+S9cy0wjEBcUG5U55R5lkgMpq/jv0k8SpNy2duJBR0LpgxoV553VeYD
 M3qim7ReNqT7whf3raFQszsrEdlrVohcz4qH6Vbwyue3YvTrLR0DXVZLj
 vQZhKpEjtprQyo5upJSwaBMqILzEc6S+JeDGciuPSpo7U1QBphEqIJ6bC w==;
X-CSE-ConnectionGUID: BVYxuOyNRyWWoxDXcn8C/Q==
X-CSE-MsgGUID: gZeS8f0WQre2S7hJLUbzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79412234"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="79412234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 05:09:34 -0700
X-CSE-ConnectionGUID: ZJeiiIBrR4CIzbCakgekwA==
X-CSE-MsgGUID: tidMZxYMSuiFi5xgxPSWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="264719154"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 22 May 2026 05:09:31 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6] drm/xe: Unify fault injection hooks for CSC, GT reset
Date: Fri, 22 May 2026 17:36:29 +0530
Message-ID: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Create a single, centralized fault injection module
(xe_fault_inject.c/h) that manages all fault types through
one table. Each type is just an entry in an enum and a one-line
row in a descriptor array -- no more scattered globals,
externs, or per-type inline helpers.

Debugfs interface (under /sys/kernel/debug/dri/0/):
 - fail_gt_reset         - GT reset failure
 - inject_csc_hw_error   - CSC firmware error

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
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
---
 drivers/gpu/drm/xe/Makefile                |  2 +
 drivers/gpu/drm/xe/xe_debugfs.c            |  9 +---
 drivers/gpu/drm/xe/xe_fault_inject.c       | 62 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_fault_inject.h       | 31 +++++++++++
 drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 ++++++++
 drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
 drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
 drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
 8 files changed, 123 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
 create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
 create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 09661f079d03..d4acb8e9c3b7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -361,6 +361,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
+	xe-$(CONFIG_FAULT_INJECTION) += xe_fault_inject.o
+
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
 		i915-display/intel_display_debugfs_params.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..8402189b24ef 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -6,7 +6,6 @@
 #include "xe_debugfs.h"
 
 #include <linux/debugfs.h>
-#include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
@@ -14,6 +13,7 @@
 #include "regs/xe_pmt.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_fault_inject.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
@@ -38,9 +38,6 @@
 #include "xe_vm.h"
 #endif
 
-DECLARE_FAULT_ATTR(gt_reset_failure);
-DECLARE_FAULT_ATTR(inject_csc_hw_error);
-
 static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
 				   u32 offset, const char *name, struct drm_printer *p)
 {
@@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
 		drm_debugfs_create_files(debugfs_residencies,
 					 ARRAY_SIZE(debugfs_residencies),
 					 root, minor);
-		fault_create_debugfs_attr("inject_csc_hw_error", root,
-					  &inject_csc_hw_error);
 	}
 
 	debugfs_create_file("forcewake_all", 0400, root, xe,
@@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	xe_psmi_debugfs_register(xe);
 
-	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+	xe_fault_inject_debugfs_register(xe, root);
 
 	if (IS_SRIOV_PF(xe))
 		xe_sriov_pf_debugfs_register(xe, root);
diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c b/drivers/gpu/drm/xe/xe_fault_inject.c
new file mode 100644
index 000000000000..096e1949624d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fault_inject.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/bits.h>
+#include <linux/fault-inject.h>
+
+#include "xe_device.h"
+#include "xe_fault_inject.h"
+#include "xe_platform_types.h"
+#include "xe_sriov.h"
+
+static struct {
+	const char *name;
+	u32 platforms;
+	bool skip_on_vf;
+	struct fault_attr attr;
+} xe_fault_inject_entry[XE_FAULT_MAX] = {
+	[XE_FAULT_GT_RESET]	= { .name = "fail_gt_reset",
+				    .attr = FAULT_ATTR_INITIALIZER },
+	[XE_FAULT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
+				    .platforms = BIT(XE_BATTLEMAGE),
+				    .skip_on_vf = true,
+				    .attr = FAULT_ATTR_INITIALIZER },
+};
+
+/**
+ * xe_fault_inject - Check if a fault should be injected
+ * @type: fault injection type to check
+ *
+ * Return: true if fault injection is triggered, false otherwise.
+ */
+bool xe_fault_inject(enum xe_fault_type type)
+{
+	if (type >= XE_FAULT_MAX)
+		return false;
+
+	return should_fail(&xe_fault_inject_entry[type].attr, 1);
+}
+
+/**
+ * xe_fault_inject_debugfs_register - Register fault injection debugfs entries
+ * @xe: xe device instance
+ * @root: debugfs root directory
+ */
+void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root)
+{
+	int i;
+
+	for (i = 0; i < XE_FAULT_MAX; i++) {
+		if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
+			continue;
+
+		if (xe_fault_inject_entry[i].platforms &&
+		    !(xe_fault_inject_entry[i].platforms & BIT(xe->info.platform)))
+			continue;
+
+		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
+					  &xe_fault_inject_entry[i].attr);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h b/drivers/gpu/drm/xe/xe_fault_inject.h
new file mode 100644
index 000000000000..91883ffb5f4b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fault_inject.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_FAULT_INJECT_H_
+#define _XE_FAULT_INJECT_H_
+
+#include <linux/types.h>
+
+#include "xe_fault_inject_types.h"
+
+struct xe_device;
+struct dentry;
+
+#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_FAULT_INJECTION)
+bool xe_fault_inject(enum xe_fault_type type);
+void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root);
+#else
+static inline bool xe_fault_inject(enum xe_fault_type type)
+{
+	return false;
+}
+
+static inline void xe_fault_inject_debugfs_register(struct xe_device *xe,
+						    struct dentry *root)
+{
+}
+#endif
+
+#endif /* _XE_FAULT_INJECT_H_ */
diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h b/drivers/gpu/drm/xe/xe_fault_inject_types.h
new file mode 100644
index 000000000000..d5402b5a3fd6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_FAULT_INJECT_TYPES_H_
+#define _XE_FAULT_INJECT_TYPES_H_
+
+/**
+ * enum xe_fault_type - Fault injection types
+ * @XE_FAULT_GT_RESET: GT reset failure injection
+ * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
+ * @XE_FAULT_MAX: Number of fault injection types
+ */
+enum xe_fault_type {
+	XE_FAULT_GT_RESET,
+	XE_FAULT_CSC_HW_ERROR,
+	XE_FAULT_MAX
+};
+
+#endif /* _XE_FAULT_INJECT_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 783eb6d631b5..242683cd5906 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -25,6 +25,7 @@
 #include "xe_eu_stall.h"
 #include "xe_exec_queue.h"
 #include "xe_execlist.h"
+#include "xe_fault_inject.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gsc.h"
@@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
 
 	xe_gt_info(gt, "reset started\n");
 
-	if (xe_fault_inject_gt_reset()) {
+	if (xe_fault_inject(XE_FAULT_GT_RESET)) {
 		err = -ECANCELED;
 		goto err_fail;
 	}
@@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
 	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
 
 	/* Don't do a reset while one is already in flight */
-	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
+	if (!xe_fault_inject(XE_FAULT_GT_RESET) && xe_uc_reset_prepare(&gt->uc))
 		return;
 
 	xe_gt_info(gt, "reset queued\n");
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 4150aa594f05..f8e3ca63aabb 100644
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
index 5135e8e4093f..192e68e847a5 100644
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
+#include "xe_fault_inject.h"
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
@@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 {
 	enum hardware_error hw_err;
 
-	if (fault_inject_csc_hw_error())
+	if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
 		schedule_work(&tile->csc_hw_error_work);
 
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
-- 
2.34.1

