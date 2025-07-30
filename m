Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A34CC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EEA10E365;
	Wed, 30 Jul 2025 05:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hxxw1NcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438210E365
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854576; x=1785390576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E+CxgJwPTlTD7aSLmBFykx867O6/xD65vL6ojSw5uNM=;
 b=Hxxw1NcGI/yUtlhh4ybckqA3WT1ObEuFTJgc+AMq9S2B0sQE8dqmh28K
 tCKaeqmUDArId1yC4R+09l3QoZh9d1MR2pyepvwWDdXdhNRomSk3xRiXS
 ZrY+oHKCCw9Smu4lC9fzfTomCccnu4gi/ppfjKxkMgJfUNnakGyRXWuOm
 LbVCA4uMH3/YxKujabxXDDsaChquoEoMF3uhrpTRfMNL6Paumo5J87K4+
 PCNmsQ+zP26gcBwYskr/xGvSfCjJ8nQcV3c3KM90aXlZeNA214cUZM/L4
 XGwyUOQrLInaHElDmAPxsMwIy05jfjpCXNq9jXw27pzejYT1S3gzLjvjf g==;
X-CSE-ConnectionGUID: vFkixV6ZT8ql1zQJPC2ZSQ==
X-CSE-MsgGUID: XiGCMDOmRzWBQ7YxvmM+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215608"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:36 -0700
X-CSE-ConnectionGUID: 3QDrB1iCRJW3FBeQlvI6ZQ==
X-CSE-MsgGUID: F+40UpBNT1q8xAKByD8fjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240235"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:32 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 03/10] drm/xe: Log and count the GT hardware errors.
Date: Wed, 30 Jul 2025 11:18:07 +0530
Message-Id: <20250730054814.1376770-4-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

For the errors reported by GT unit, read the GT error register.
Log and count these errors and clear the error register.

Bspec: 53088, 53089, 53090

v6
- define the BIT and use it.
- Limit the GT error reporting to DG2 and PVC only.
- Rename function to xe_gt_hw_error_log_status_reg from
  xe_gt_hw_error_status_reg_handler. (Aravind)

v7
- ci fixes

v8
- Initialize xarray only for primary gt.
- maintain header orders.
- Use new defined helper for gt error loging. (Aravind)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h   | 13 +++
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  1 +
 drivers/gpu/drm/xe/xe_device.c               |  5 +-
 drivers/gpu/drm/xe/xe_device_types.h         |  1 +
 drivers/gpu/drm/xe/xe_gt.c                   |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h             |  6 ++
 drivers/gpu/drm/xe/xe_hw_error.c             | 94 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 23 +++++
 8 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
new file mode 100644
index 000000000000..6180704a6149
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef XE_GT_ERROR_REGS_H_
+#define XE_GT_ERROR_REGS_H_
+
+#define _ERR_STAT_GT_COR                0x100160
+#define _ERR_STAT_GT_NONFATAL           0x100164
+#define ERR_STAT_GT_REG(x)              XE_REG(_PICK_EVEN((x), \
+						_ERR_STAT_GT_COR, \
+						_ERR_STAT_GT_NONFATAL))
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index ba5480fb2789..45bd6b85e115 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -10,4 +10,5 @@
 #define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
 								_DEV_ERR_STAT_CORRECTABLE, \
 								_DEV_ERR_STAT_NONFATAL))
+#define   XE_GT_ERROR				       0
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e0625fa5b1ca..806dbdf8118c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -959,8 +959,11 @@ static void xe_hw_error_fini(struct xe_device *xe)
 	struct xe_tile *tile;
 	int i;
 
-	for_each_tile(tile, xe, i)
+	for_each_tile(tile, xe, i) {
 		xa_destroy(&tile->errors.hw_error);
+		xa_destroy(&tile->primary_gt->errors.hw_error);
+	}
+
 }
 
 void xe_device_remove(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 233c2751d09f..4c7fb0d021c2 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -584,6 +584,7 @@ struct xe_device {
 	/** @hw_err_regs: list of hw error regs*/
 	struct hardware_errors_regs {
 		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *err_stat_gt[HARDWARE_ERROR_MAX];
 	} hw_err_regs;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c8eda36546d3..919bdb378798 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -88,6 +88,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 	if (err)
 		return ERR_PTR(err);
 
+	xa_init(&gt->errors.hw_error);
 	return gt;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index dfd4a16da5f0..a84baf22be70 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -13,6 +13,7 @@
 #include "xe_gt_sriov_vf_types.h"
 #include "xe_gt_stats_types.h"
 #include "xe_hw_engine_types.h"
+#include "xe_hw_error.h"
 #include "xe_hw_fence_types.h"
 #include "xe_oa_types.h"
 #include "xe_reg_sr_types.h"
@@ -449,6 +450,11 @@ struct xe_gt {
 
 	/** @eu_stall: EU stall counters subsystem per gt info */
 	struct xe_eu_stall_gt *eu_stall;
+
+	/** @errors: count of hardware errors reported for the gt */
+	struct gt_hw_errors {
+		struct xarray hw_error;
+	} errors;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 84830ad81813..66a1a0c288f8 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -3,8 +3,10 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "xe_gt_printk.h"
 #include "xe_hw_error.h"
 
+#include "regs/xe_gt_error_regs.h"
 #include "regs/xe_regs.h"
 #include "regs/xe_irq_regs.h"
 #include "regs/xe_tile_error_regs.h"
@@ -101,15 +103,48 @@ static const struct err_name_index_pair pvc_err_stat_correctable_reg[] = {
 	[9 ... 31]  =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
 };
 
+static const struct err_name_index_pair dg2_stat_gt_fatal_reg[] = {
+	[0]         =  {"Undefined",		XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[1]         =  {"Array BIST",		XE_HW_ERR_GT_FATAL_ARR_BIST},
+	[2]         =  {"Undefined",		XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[3]         =  {"FPU",			XE_HW_ERR_GT_FATAL_FPU},
+	[4]         =  {"L3 Double",		XE_HW_ERR_GT_FATAL_L3_DOUB},
+	[5]         =  {"L3 ECC Checker",	XE_HW_ERR_GT_FATAL_L3_ECC_CHK},
+	[6]         =  {"GUC SRAM",		XE_HW_ERR_GT_FATAL_GUC},
+	[7]         =  {"Undefined",		XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[8]         =  {"IDI PARITY",		XE_HW_ERR_GT_FATAL_IDI_PAR},
+	[9]	    =  {"SQIDI",		XE_HW_ERR_GT_FATAL_SQIDI},
+	[10 ... 11] =  {"Undefined",		XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[12]        =  {"SAMPLER",		XE_HW_ERR_GT_FATAL_SAMPLER},
+	[13]        =  {"SLM",			XE_HW_ERR_GT_FATAL_SLM},
+	[14]        =  {"EU IC",		XE_HW_ERR_GT_FATAL_EU_IC},
+	[15]        =  {"EU GRF",		XE_HW_ERR_GT_FATAL_EU_GRF},
+	[16 ... 31] =  {"Undefined",            XE_HW_ERR_GT_FATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair dg2_stat_gt_correctable_reg[] = {
+	[0]         = {"L3 SINGLE",		XE_HW_ERR_GT_CORR_L3_SNG},
+	[1]         = {"SINGLE BIT GUC SRAM",	XE_HW_ERR_GT_CORR_GUC},
+	[2 ... 11]  = {"Undefined",		XE_HW_ERR_GT_CORR_UNKNOWN},
+	[12]        = {"SINGLE BIT SAMPLER",	XE_HW_ERR_GT_CORR_SAMPLER},
+	[13]        = {"SINGLE BIT SLM",	XE_HW_ERR_GT_CORR_SLM},
+	[14]        = {"SINGLE BIT EU IC",	XE_HW_ERR_GT_CORR_EU_IC},
+	[15]        = {"SINGLE BIT EU GRF",	XE_HW_ERR_GT_CORR_EU_GRF},
+	[16 ... 31] = {"Undefined",             XE_HW_ERR_GT_CORR_UNKNOWN},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
+	const struct err_name_index_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
 
 	/* Error reporting is supported only for DG2 and PVC currently. */
 	if (xe->info.platform == XE_DG2) {
 		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
 		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
 		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
+		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = dg2_stat_gt_correctable_reg;
+		err_stat_gt[HARDWARE_ERROR_FATAL] = dg2_stat_gt_fatal_reg;
 	}
 
 	if (xe->info.platform == XE_PVC) {
@@ -117,6 +152,7 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
 		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
 		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
 	}
+
 }
 
 static bool xe_platform_has_ras(struct xe_device *xe)
@@ -143,6 +179,62 @@ xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned
 	xa_unlock_irqrestore(hw_error, flags);
 }
 
+static void
+xe_gt_hw_error_log_status_reg(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	const struct err_name_index_pair *errstat;
+	struct hardware_errors_regs *err_regs;
+	unsigned long errsrc;
+	const char *name;
+	u32 indx;
+	u32 errbit;
+
+	err_regs = &gt_to_xe(gt)->hw_err_regs;
+	errsrc = xe_mmio_read32(&gt->tile->mmio, ERR_STAT_GT_REG(hw_err));
+	if (!errsrc) {
+		xe_gt_log_hw_err(gt, "ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
+		return;
+	}
+
+	drm_dbg(&gt_to_xe(gt)->drm, HW_ERR "GT%d ERR_STAT_GT_REG_%s=0x%08lx\n",
+		gt->info.id, hw_err_str, errsrc);
+
+	if (hw_err == HARDWARE_ERROR_NONFATAL) {
+		/*  The GT Non Fatal Error Status Register has only reserved bits
+		 *  Nothing to service.
+		 */
+		xe_gt_log_hw_err(gt, "%s error\n", hw_err_str);
+		goto clear_reg;
+	}
+
+	errstat = err_regs->err_stat_gt[hw_err];
+	for_each_set_bit(errbit, &errsrc, XE_RAS_REG_SIZE) {
+		name = errstat[errbit].name;
+		indx = errstat[errbit].index;
+
+		if (hw_err == HARDWARE_ERROR_FATAL)
+			xe_gt_log_hw_err(gt, "%s %s error, bit[%d] is set\n",
+					 name, hw_err_str, errbit);
+		else
+			xe_gt_log_hw_err(gt, "%s %s error, bit[%d] is set\n",
+					 name, hw_err_str, errbit);
+
+		xe_update_hw_error_cnt(&gt_to_xe(gt)->drm, &gt->errors.hw_error, indx);
+	}
+clear_reg:
+	xe_mmio_write32(&gt->tile->mmio, ERR_STAT_GT_REG(hw_err), errsrc);
+}
+
+static void
+xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
+
+	if (gt_to_xe(gt)->info.platform == XE_DG2)
+		xe_gt_hw_error_log_status_reg(gt, hw_err);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -192,6 +284,8 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 		if (indx != XE_HW_ERR_TILE_UNSPEC)
 			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
 					       &tile->errors.hw_error, indx);
+		if (errbit == XE_GT_ERROR)
+			xe_gt_hw_error_handler(tile->primary_gt, hw_err);
 	}
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 398e2a7f2ac6..3dc32dbfc8bb 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -37,6 +37,29 @@ enum xe_tile_hw_errors {
 	XE_HW_ERR_TILE_CORR_UNKNOWN,
 };
 
+/* Count of GT Correctable and FATAL HW ERRORS */
+enum xe_gt_hw_errors {
+	XE_HW_ERR_GT_CORR_L3_SNG,
+	XE_HW_ERR_GT_CORR_GUC,
+	XE_HW_ERR_GT_CORR_SAMPLER,
+	XE_HW_ERR_GT_CORR_SLM,
+	XE_HW_ERR_GT_CORR_EU_IC,
+	XE_HW_ERR_GT_CORR_EU_GRF,
+	XE_HW_ERR_GT_CORR_UNKNOWN,
+	XE_HW_ERR_GT_FATAL_ARR_BIST,
+	XE_HW_ERR_GT_FATAL_FPU,
+	XE_HW_ERR_GT_FATAL_L3_DOUB,
+	XE_HW_ERR_GT_FATAL_L3_ECC_CHK,
+	XE_HW_ERR_GT_FATAL_GUC,
+	XE_HW_ERR_GT_FATAL_IDI_PAR,
+	XE_HW_ERR_GT_FATAL_SQIDI,
+	XE_HW_ERR_GT_FATAL_SAMPLER,
+	XE_HW_ERR_GT_FATAL_SLM,
+	XE_HW_ERR_GT_FATAL_EU_IC,
+	XE_HW_ERR_GT_FATAL_EU_GRF,
+	XE_HW_ERR_GT_FATAL_UNKNOWN,
+};
+
 struct err_name_index_pair {
 	const char *name;
 	const u32 index;
-- 
2.25.1

