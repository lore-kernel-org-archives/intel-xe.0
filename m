Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF3CEE49AF
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 08:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C487810E3FD;
	Wed, 23 Aug 2023 08:53:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC8F10E3FD
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692780789; x=1724316789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1UlQ+Gw6sy3PVpSTSIW1vWWnkUPlNfjHWuUDq+7hRdM=;
 b=afLFU2zbAYlbvxVq8pQvZHrym2rxEvKntbo4hMubCnAUJTM9vNM27PWG
 Cy1mWfIXnd8nhmGGY6g0j2QZZWJix2cLEeTZtkPBOpbk5hzfsK6GGnD4E
 BvtLTADAy/ecFYKvBdt8we0SHUDOQJFWxfM+7RjtJJn/okhmhbqH6ltjl
 RCTRgT/pfBYQtr4sP2p21SFYjxFhJOBo9SFC0Lnau5PzvtO0OISOCv2sX
 kUzOq90qVRchXsOZhOCu1taZDEGo3Qu5bQoleJjLmYF9Y/lyDRI2QMcSf
 bLb1/iJCTzj7pLHsIlqSECXKL2lnhU3vxYKIWfLYCnj3Fvue6iCJuX/xu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377868515"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="377868515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="713497229"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="713497229"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 23 Aug 2023 01:53:05 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 14:28:40 +0530
Message-Id: <20230823085842.1440523-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/4] drm/xe: Log and count the GT hardware
 errors.
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For the errors reported by GT unit, read the GT error register.
Log and count these errors and clear the error register.

Bspec: 53088, 53089, 53090

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h | 13 +++
 drivers/gpu/drm/xe/xe_device_types.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h           |  7 ++
 drivers/gpu/drm/xe/xe_hw_error.c           | 96 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_error.h           | 24 ++++++
 5 files changed, 140 insertions(+), 1 deletion(-)
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
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4e4184977709..96029d3348b3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -368,6 +368,7 @@ struct xe_device {
 	/** @hardware_errors_regs: list of hw error regs*/
 	struct hardware_errors_regs {
 		const struct err_msg_cntr_pair *dev_err_stat[HARDWARE_ERROR_MAX];
+		const struct err_msg_cntr_pair *err_stat_gt[HARDWARE_ERROR_MAX];
 	} hw_err_regs;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 35b8c19fa8bf..5daff5c434c7 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -9,10 +9,12 @@
 #include "xe_force_wake_types.h"
 #include "xe_gt_idle_sysfs_types.h"
 #include "xe_hw_engine_types.h"
+#include "xe_hw_error.h"
 #include "xe_hw_fence_types.h"
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
+#include "regs/xe_gt_error_regs.h"
 
 struct xe_exec_queue_ops;
 struct xe_migrate;
@@ -346,6 +348,11 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @gt_hw_errors: hardware errors reported for the gt */
+	struct gt_hw_errors {
+		 unsigned long count[XE_GT_HW_ERROR_MAX];
+	} errors;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 357d0f962d91..10aad0c396fb 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -118,14 +118,48 @@ static const struct err_msg_cntr_pair dev_err_stat_correctable_reg[] = {
 	[1 ... 31]  =  {"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
 };
 
+static const struct err_msg_cntr_pair err_stat_gt_fatal_reg[] = {
+	[0]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	[1]         =  {"Array BIST",		XE_GT_HW_ERR_ARR_BIST_FATAL},
+	[2]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	[3]         =  {"FPU",			XE_GT_HW_ERR_FPU_FATAL},
+	[4]         =  {"L3 Double",		XE_GT_HW_ERR_L3_DOUB_FATAL},
+	[5]         =  {"L3 ECC Checker",	XE_GT_HW_ERR_L3_ECC_CHK_FATAL},
+	[6]         =  {"GUC SRAM",		XE_GT_HW_ERR_GUC_FATAL},
+	[7]         =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	[8]         =  {"IDI PARITY",		XE_GT_HW_ERR_IDI_PAR_FATAL},
+	[9]	    =  {"SQIDI",		XE_GT_HW_ERR_SQIDI_FATAL},
+	[10 ... 11] =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	[12]        =  {"SAMPLER",		XE_GT_HW_ERR_SAMPLER_FATAL},
+	[13]        =  {"SLM",			XE_GT_HW_ERR_SLM_FATAL},
+	[14]        =  {"EU IC",		XE_GT_HW_ERR_EU_IC_FATAL},
+	[15]        =  {"EU GRF",		XE_GT_HW_ERR_EU_GRF_FATAL},
+	[16 ... 31] =  {"Undefined",            XE_GT_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair err_stat_gt_correctable_reg[] = {
+	[0]         = {"L3 SINGLE",		XE_GT_HW_ERR_L3_SNG_CORR},
+	[1]         = {"SINGLE BIT GUC SRAM",	XE_GT_HW_ERR_GUC_CORR},
+	[2 ... 11]  = {"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	[12]        = {"SINGLE BIT SAMPLER",	XE_GT_HW_ERR_SAMPLER_CORR},
+	[13]        = {"SINGLE BIT SLM",	XE_GT_HW_ERR_SLM_CORR},
+	[14]        = {"SINGLE BIT EU IC",	XE_GT_HW_ERR_EU_IC_CORR},
+	[15]        = {"SINGLE BIT EU GRF",	XE_GT_HW_ERR_EU_GRF_CORR},
+	[16 ... 31] = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
+};
+
 void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
+	const struct err_msg_cntr_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
 
 	if (xe->info.platform == XE_DG2) {
 		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
 		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
 		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
+
+		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = err_stat_gt_correctable_reg;
+		err_stat_gt[HARDWARE_ERROR_FATAL] = err_stat_gt_fatal_reg;
 	} else if (xe->info.platform == XE_PVC) {
 		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
 		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
@@ -135,9 +169,67 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
 		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dev_err_stat_correctable_reg;
 		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dev_err_stat_nonfatal_reg;
 		dev_err_stat[HARDWARE_ERROR_FATAL] = dev_err_stat_fatal_reg;
+
+		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = err_stat_gt_correctable_reg;
+		err_stat_gt[HARDWARE_ERROR_FATAL] = err_stat_gt_fatal_reg;
 	}
 }
 
+static void
+xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	const struct err_msg_cntr_pair *errstat;
+	struct hardware_errors_regs *err_regs;
+	unsigned long errsrc;
+	const char *errmsg;
+	u32 indx;
+	u32 errbit;
+
+	if (gt_to_xe(gt)->info.platform == XE_PVC)
+		return;
+
+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
+	err_regs = &gt_to_xe(gt)->hw_err_regs;
+	errsrc = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err));
+	if (!errsrc) {
+		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
+				    "GT%d detected ERR_STAT_GT_REG_%s blank!\n",
+				    gt->info.id, hw_err_str);
+		return;
+	}
+
+	drm_info(&gt_to_xe(gt)->drm, HW_ERR "GT%d ERR_STAT_GT_REG_%s=0x%08lx\n",
+		 gt->info.id, hw_err_str, errsrc);
+
+	if (hw_err == HARDWARE_ERROR_NONFATAL) {
+		/*  The GT Non Fatal Error Status Register has only reserved bits
+		 *  Nothing to service.
+		 */
+		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected %s error\n",
+				    gt->info.id, hw_err_str);
+		goto clear_reg;
+	}
+
+	errstat = err_regs->err_stat_gt[hw_err];
+	for_each_set_bit(errbit, &errsrc, 32) {
+		errmsg = errstat[errbit].errmsg;
+		indx = errstat[errbit].cntr_indx;
+
+		if (hw_err == HARDWARE_ERROR_FATAL)
+			drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
+					    "GT%d detected %s %s error, bit[%d] is set\n",
+					    gt->info.id, errmsg, hw_err_str, errbit);
+		else
+			drm_warn(&gt_to_xe(gt)->drm, HW_ERR
+				 "GT%d detected %s %s error, bit[%d] is set\n",
+				 gt->info.id, errmsg, hw_err_str, errbit);
+
+		gt->errors.count[indx]++;
+	}
+clear_reg: xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err), errsrc);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -174,7 +266,6 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 			drm_warn(&tile_to_xe(tile)->drm,
 				 HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
 				 tile->id, errmsg, hw_err_str, errbit);
-
 		else
 			drm_err_ratelimited(&tile_to_xe(tile)->drm,
 					    HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
@@ -182,6 +273,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 		tile->errors.count[indx]++;
 	}
 
+	if (errsrc & REG_BIT(0))
+		xe_gt_hw_error_handler(tile->primary_gt, hw_err);
+
 	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
 unlock:
 	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index c0c05b9130eb..82c947247c27 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -51,6 +51,30 @@ enum xe_tile_hw_errors {
 	XE_TILE_HW_ERROR_MAX,
 };
 
+/* Count of GT Correctable and FATAL HW ERRORS */
+enum xe_gt_hw_errors {
+	XE_GT_HW_ERR_L3_SNG_CORR,
+	XE_GT_HW_ERR_GUC_CORR,
+	XE_GT_HW_ERR_SAMPLER_CORR,
+	XE_GT_HW_ERR_SLM_CORR,
+	XE_GT_HW_ERR_EU_IC_CORR,
+	XE_GT_HW_ERR_EU_GRF_CORR,
+	XE_GT_HW_ERR_UNKNOWN_CORR,
+	XE_GT_HW_ERR_ARR_BIST_FATAL,
+	XE_GT_HW_ERR_FPU_FATAL,
+	XE_GT_HW_ERR_L3_DOUB_FATAL,
+	XE_GT_HW_ERR_L3_ECC_CHK_FATAL,
+	XE_GT_HW_ERR_GUC_FATAL,
+	XE_GT_HW_ERR_IDI_PAR_FATAL,
+	XE_GT_HW_ERR_SQIDI_FATAL,
+	XE_GT_HW_ERR_SAMPLER_FATAL,
+	XE_GT_HW_ERR_SLM_FATAL,
+	XE_GT_HW_ERR_EU_IC_FATAL,
+	XE_GT_HW_ERR_EU_GRF_FATAL,
+	XE_GT_HW_ERR_UNKNOWN_FATAL,
+	XE_GT_HW_ERROR_MAX,
+};
+
 struct err_msg_cntr_pair {
 	const char *errmsg;
 	const u32 cntr_indx;
-- 
2.25.1

