Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629FCE93813
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570910E142;
	Mon, 13 Apr 2026 04:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN7p2ORW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320710E142
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 04:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776056032; x=1807592032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xlk1dY4RJFBBPNpWRAynZn2En9NewB+QbEuIwP/i3Zc=;
 b=eN7p2ORWrrv2ffteDN/Vva9E0uuQ2ym/xNjmuw0H3LjJxY7wOG/Kwbrt
 OPgurcOrO9pMh2/VbPJkGHQPPxEnG3yM/cWFXHrbrLGx5o4ygXKjQgQYB
 RiySMhyyURLZNyceWf1Z3joHVuoYPmCSCK34SdCUc8lUe09mQAkOwTt64
 UmzcjWjPdqEh9EmJz8Wgc3BuvzyJAucSz1t70FBh0K/0uGikA4acn9lVQ
 bU87TQD8u6E/uxpH61RtRG1OjYSdHgiB7AgXqF3Wf5TfWJbuvaOxO+sRx
 E+c3oyoaHzPNrwW6NqGg2kLAtHCfRVT11Mbz+XfDvciaNEKY21aonoJUe w==;
X-CSE-ConnectionGUID: dYP8XQ/cQgmppvbzooRdRQ==
X-CSE-MsgGUID: Xzdd0A5mSfWG6pTmej/QqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76945047"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="76945047"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:53:52 -0700
X-CSE-ConnectionGUID: N6NkzSqDTUy+hS+GDdjcjQ==
X-CSE-MsgGUID: GWZLnnXaQeS1730wJTUeXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="234090352"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 12 Apr 2026 21:53:48 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe: Unify fault injection hooks for CSC, GT reset
Date: Mon, 13 Apr 2026 10:21:19 +0530
Message-ID: <20260413045118.548328-2-mallesh.koujalagi@intel.com>
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
(xe_fault_inject.c/h) that manages all fault types through one
table. Each type is just an entry in an enum and a one-line row in
a descriptor array -- no more scattered globals, externs, or
per-type inline helpers.

Debugfs interface (under /sys/kernel/debug/dri/0/):
 - fail_gt_reset         - GT reset failure
 - inject_csc_hw_error   - CSC firmware error

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_debugfs.c      |  9 +---
 drivers/gpu/drm/xe/xe_fault_inject.c | 63 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_fault_inject.h | 41 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c           |  5 ++-
 drivers/gpu/drm/xe/xe_gt.h           |  8 ----
 drivers/gpu/drm/xe/xe_hw_error.c     | 11 +----
 7 files changed, 112 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
 create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 110fef511fe2..affa4d2d613a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -347,6 +347,7 @@ endif
 
 ifeq ($(CONFIG_DEBUG_FS),y)
 	xe-y += xe_debugfs.o \
+		xe_fault_inject.o \
 		xe_gt_debugfs.o \
 		xe_gt_sriov_vf_debugfs.o \
 		xe_gt_stats.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index c9d4484821af..d0ff603a0b03 100644
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
index 000000000000..775137930135
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fault_inject.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+#include <linux/fault-inject.h>
+
+#include "xe_device.h"
+#include "xe_fault_inject.h"
+#include "xe_platform_types.h"
+#include "xe_sriov.h"
+
+static struct {
+	const char *name;
+	enum xe_platform platform;
+	struct fault_attr attr;
+} xe_fi_descs[XE_FAULT_INJECT_MAX] = {
+	[XE_FAULT_INJECT_GT_RESET]	= { .name = "fail_gt_reset" },
+	[XE_FAULT_INJECT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
+					    .platform = XE_BATTLEMAGE },
+};
+
+/**
+ * xe_fault_inject - Check if a fault should be injected
+ * @type: fault injection type to check
+ *
+ * Returns true if a fault should be injected for the given type.
+ * Controlled via debugfs fault injection attributes.
+ */
+bool xe_fault_inject(enum xe_fault_inject_type type)
+{
+	if (type >= XE_FAULT_INJECT_MAX)
+		return false;
+
+	return should_fail(&xe_fi_descs[type].attr, 1);
+}
+
+/**
+ * xe_fault_inject_debugfs_register - Register fault injection debugfs entries
+ * @xe: xe device instance
+ * @root: debugfs root directory
+ *
+ * Creates debugfs fault injection attributes for all supported fault
+ * injection types. Platform-specific entries are only registered on
+ * matching platforms. Skipped for SR-IOV VF devices.
+ */
+void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root)
+{
+	int i;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	for (i = 0; i < XE_FAULT_INJECT_MAX; i++) {
+		if (xe_fi_descs[i].platform &&
+		    xe->info.platform != xe_fi_descs[i].platform)
+			continue;
+
+		fault_create_debugfs_attr(xe_fi_descs[i].name, root,
+					  &xe_fi_descs[i].attr);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h b/drivers/gpu/drm/xe/xe_fault_inject.h
new file mode 100644
index 000000000000..958213fe2eaa
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_fault_inject.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_FAULT_INJECT_H_
+#define _XE_FAULT_INJECT_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+struct dentry;
+
+/**
+ * enum xe_fault_inject_type - Fault injection types
+ * @XE_FAULT_INJECT_GT_RESET: GT reset failure injection
+ * @XE_FAULT_INJECT_CSC_HW_ERROR: CSC hardware error injection
+ * @XE_FAULT_INJECT_MAX: Number of fault injection types
+ */
+enum xe_fault_inject_type {
+	XE_FAULT_INJECT_GT_RESET,
+	XE_FAULT_INJECT_CSC_HW_ERROR,
+	XE_FAULT_INJECT_MAX
+};
+
+#ifdef CONFIG_DEBUG_FS
+bool xe_fault_inject(enum xe_fault_inject_type type);
+void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root);
+#else
+static inline bool xe_fault_inject(enum xe_fault_inject_type type)
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
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a31c963c372..7cbb9c3c2dc3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -23,6 +23,7 @@
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
+	if (xe_fault_inject(XE_FAULT_INJECT_GT_RESET)) {
 		err = -ECANCELED;
 		goto err_fail;
 	}
@@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
 	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
 
 	/* Don't do a reset while one is already in flight */
-	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
+	if (!xe_fault_inject(XE_FAULT_INJECT_GT_RESET) && xe_uc_reset_prepare(&gt->uc))
 		return;
 
 	xe_gt_info(gt, "reset queued\n");
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index de7e47763411..c7278247215e 100644
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
index 2a31b430570e..87b2a2cc0ef7 100644
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
@@ -160,11 +158,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
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
@@ -509,7 +502,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
 {
 	enum hardware_error hw_err;
 
-	if (fault_inject_csc_hw_error())
+	if (xe_fault_inject(XE_FAULT_INJECT_CSC_HW_ERROR))
 		schedule_work(&tile->csc_hw_error_work);
 
 	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
-- 
2.34.1

