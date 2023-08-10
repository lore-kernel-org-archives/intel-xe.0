Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D8DC001B0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 07:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4610E4C8;
	Thu, 10 Aug 2023 07:21:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A873610E4CA
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691652079; x=1723188079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fKedghBTb9s2ZiuwRh2vph0gRb6DaFLfy5Zu1zLXpNI=;
 b=NfDxTV2iILhVI9ercxwX1+EKVKZzLYSIbdTnQ30AhfqvMKcCygVye3pX
 b/tt+hJguJSOX5nGdnrJLX5XFhtB2QY0orHuRM+1TI1Sa5Ju7R21TWFKi
 iFin7CyLtjnc+dufYGAbSpzG7v8oQDGWebPEA3wZAVBkUz+B7defHf0H/
 2BP1WPWDZt5wmh3c4pJHE++r9LqWe8ju/hjwy7HNnHRVTgEerAoujwHD0
 E5d5OiXX5CdoSffB9EBWQTuE9Ap4xvYs1i3EMrACWj8r+6meIdWsBFuM4
 +iTwBHzfCwl5i7SCGWSUD6ou4Gn8U0kP2sFfGOJ28KkmShWNRniANX4mo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375037462"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="375037462"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 00:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761696724"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="761696724"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 00:21:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 10 Aug 2023 12:56:29 +0530
Message-Id: <20230810072631.722373-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230810072631.722373-1-himal.prasad.ghimiray@intel.com>
References: <20230810072631.722373-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/4] drm/xe: Log and count the GT hardware
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
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h |  48 ++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h           |   6 ++
 drivers/gpu/drm/xe/xe_irq.c                | 103 +++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
new file mode 100644
index 000000000000..6d51cfbddb61
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
@@ -0,0 +1,48 @@
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
+
+#define  ERR_GT_STAT_MAX_ERROR_BIT	(16)
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
+};
+
+#define XE_GT_HW_ERROR_MAX (XE_GT_HW_ERR_UNKNOWN_FATAL + 1)
+
+#define xe_gt_log_hw_err(gt, fmt, ...) \
+	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, \
+			    gt->info.id, ##__VA_ARGS__)
+
+#define xe_gt_log_hw_warn(gt, fmt, ...) \
+	drm_warn(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, \
+		 gt->info.id, ##__VA_ARGS__)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 35b8c19fa8bf..780e192e4cc8 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -13,6 +13,7 @@
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
+#include "regs/xe_gt_error_regs.h"
 
 struct xe_exec_queue_ops;
 struct xe_migrate;
@@ -346,6 +347,11 @@ struct xe_gt {
 		/** @oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @gt_hw_errors: hardware errors reported for the gt */
+	struct gt_hw_errors {
+		 unsigned long hw[XE_GT_HW_ERROR_MAX];
+	} errors;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 04a665faea23..ca9c4993be6a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -454,6 +454,44 @@ struct error_msg_counter_pair dev_err_stat_correctable_reg[] = {
 	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
 };
 
+struct error_msg_counter_pair err_stat_gt_fatal_reg[] = {
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	{"Array BIST",		XE_GT_HW_ERR_ARR_BIST_FATAL		/* Bit Pos 1 */},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	{"FPU",			XE_GT_HW_ERR_FPU_FATAL			/* Bit Pos 3 */},
+	{"L3 Double",		XE_GT_HW_ERR_L3_DOUB_FATAL		/* Bit Pos 4 */},
+	{"L3 ECC Checker",	XE_GT_HW_ERR_L3_ECC_CHK_FATAL		/* Bit Pos 5 */},
+	{"GUC SRAM",		XE_GT_HW_ERR_GUC_FATAL			/* Bit Pos 6 */},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	{"IDI PARITY",		XE_GT_HW_ERR_IDI_PAR_FATAL		/* Bit Pos 8 */},
+	{"SQIDI",		XE_GT_HW_ERR_SQIDI_FATAL		/* Bit Pos 9 */},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
+	{"SAMPLER",		XE_GT_HW_ERR_SAMPLER_FATAL		/* Bit Pos 12 */},
+	{"SLM",			XE_GT_HW_ERR_SLM_FATAL			/* Bit Pos 13 */},
+	{"EU IC",		XE_GT_HW_ERR_EU_IC_FATAL		/* Bit Pos 14 */},
+	{"EU GRF",		XE_GT_HW_ERR_EU_GRF_FATAL		/* Bit Pos 15 */},
+};
+
+struct error_msg_counter_pair err_stat_gt_correctable_reg[] = {
+	{"L3 SINGLE",		XE_GT_HW_ERR_L3_SNG_CORR		/* Bit Pos 0 */},
+	{"SINGLE BIT GUC SRAM",	XE_GT_HW_ERR_GUC_CORR			/* Bit Pos 1 */},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"Undefined",           XE_GT_HW_ERR_UNKNOWN_CORR},
+	{"SINGLE BIT SAMPLER",	XE_GT_HW_ERR_SAMPLER_CORR		/* Bit Pos 12 */},
+	{"SINGLE BIT SLM",	XE_GT_HW_ERR_SLM_CORR			/* Bit Pos 13 */},
+	{"SINGLE BIT EU IC",	XE_GT_HW_ERR_EU_IC_CORR			/* Bit Pos 14 */},
+	{"SINGLE BIT EU GRF",	XE_GT_HW_ERR_EU_GRF_CORR		/* Bit Pos 15 */},
+};
+
 static void update_valid_error_regs(struct xe_device *xe)
 {
 	unsigned long mask = 0;
@@ -493,6 +531,68 @@ static void update_valid_error_regs(struct xe_device *xe)
 	}
 }
 
+static void
+xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	struct error_msg_counter_pair *errstat;
+	unsigned long errsrc;
+	const char *errmsg;
+	u32 counter;
+	u32 errcntr;
+	u32 errbit;
+
+	if (gt_to_xe(gt)->info.platform == XE_PVC)
+		return;
+
+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
+	errsrc = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err));
+	if (!errsrc) {
+		xe_gt_log_hw_err(gt, "ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
+		return;
+	}
+
+	switch (hw_err) {
+	case HARDWARE_ERROR_FATAL:
+		errstat = (struct error_msg_counter_pair *)err_stat_gt_fatal_reg;
+		counter = XE_GT_HW_ERR_UNKNOWN_FATAL;
+		break;
+	case HARDWARE_ERROR_NONFATAL:
+		/*  The GT Non Fatal Error Status Register has only reserved bits
+		 *  Nothing to service.
+		 */
+		xe_gt_log_hw_err(gt, "%s error\n", hw_err_str);
+		goto clear_reg;
+	case HARDWARE_ERROR_CORRECTABLE:
+		errstat = (struct error_msg_counter_pair *)err_stat_gt_correctable_reg;
+		counter = XE_GT_HW_ERR_UNKNOWN_CORR;
+		break;
+	default:
+		return;
+	}
+
+	for_each_set_bit(errbit, &errsrc, 32) {
+		if (errbit < ERR_GT_STAT_MAX_ERROR_BIT) {
+			errmsg = errstat[errbit].errmsg;
+			errcntr = errstat[errbit].errcounter;
+		} else {
+			errmsg = "Undefined";
+			errcntr = counter;
+		}
+
+		if (hw_err == HARDWARE_ERROR_FATAL)
+			xe_gt_log_hw_err(gt, "%s %s error bit[%d] is set\n",
+					   errmsg, hw_err_str, errbit);
+		else
+			xe_gt_log_hw_warn(gt, "%s %s error bit[%d] is set\n",
+					    errmsg, hw_err_str, errbit);
+
+		gt->errors.hw[counter]++;
+	}
+
+clear_reg: xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err), errsrc);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -549,6 +649,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 					   errmsg, hw_err_str, errbit);
 
 		tile->errors.hw[errcntr]++;
+
+		if (errbit == 0)
+			xe_gt_hw_error_handler(tile->primary_gt, hw_err);
 	}
 
 	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
-- 
2.25.1

