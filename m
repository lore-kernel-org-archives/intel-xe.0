Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D665C04E69
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 07:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004C510E4C8;
	Thu, 10 Aug 2023 07:22:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81D10E4C8
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691652118; x=1723188118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aBai8xN4XfjIn34sDEYNFiMRsPA9ME+CfTbHWd80APw=;
 b=kMHsQuyTLCAXcfbWGhWobkaSfn7e2L8NC/zuDM8xvfBwCJsGv5OvDuzr
 rbuLSf77R9gDnED5PVLLscc0AjAnywhiC2CLeAc8eqvLiYC47ltVy8u+X
 zMyh6LRSBvxM6XE0oG7ePYLTV+NG+iH/PSu486tZ/t71tKJdsBheQGnuR
 1uc2wTHgoC7BQlalSYVa05n+eiGF7cSy89i1UyOdDRvqRkQ0USmT8oq0d
 M46z9PKnJAAh+R0MRpumPAuVnnMz8nwVsvXqpwoj/ykqXLnjpiFg2DLlk
 /loamKir5VRL6+EXwDM2k5TSToXgHvQb4n3qHtnExvc3WfB1ReYQg18fZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375037534"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="375037534"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 00:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761696774"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="761696774"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2023 00:21:12 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 10 Aug 2023 12:56:30 +0530
Message-Id: <20230810072631.722373-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230810072631.722373-1-himal.prasad.ghimiray@intel.com>
References: <20230810072631.722373-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/4] drm/xe: Support GT hardware error
 reporting for PVC.
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PVC supports GT error reporting via vector registers alongwith
error status register. Add support to report these errors and
update respective counters.
Incase of Subslice error reported by vector register, process the
error status register for applicable bits.

Bspec: 54179, 54177, 53088, 53089

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h |  48 +++++++++
 drivers/gpu/drm/xe/xe_irq.c                | 112 ++++++++++++++++++++-
 2 files changed, 155 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
index 6d51cfbddb61..27a54b7c278a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
@@ -12,8 +12,40 @@
 						_ERR_STAT_GT_NONFATAL))
 
 #define  ERR_GT_STAT_MAX_ERROR_BIT	(16)
+
+enum gt_vctr_registers {
+	ERR_STAT_GT_VCTR0 = 0,
+	ERR_STAT_GT_VCTR1,
+	ERR_STAT_GT_VCTR2,
+	ERR_STAT_GT_VCTR3,
+	ERR_STAT_GT_VCTR4,
+	ERR_STAT_GT_VCTR5,
+	ERR_STAT_GT_VCTR6,
+	ERR_STAT_GT_VCTR7,
+};
+
+#define ERR_STAT_GT_COR_VCTR_LEN        (4)
+#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
+#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
+#define ERR_STAT_GT_COR_VCTR_REG(x)     XE_REG(_PICK_EVEN((x), \
+						_ERR_STAT_GT_COR_VCTR_0, \
+						_ERR_STAT_GT_COR_VCTR_1))
+
+#define ERR_STAT_GT_FATAL_VCTR_LEN      (8)
+#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
+#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
+#define ERR_STAT_GT_FATAL_VCTR_REG(x)   XE_REG(_PICK_EVEN((x), \
+						_ERR_STAT_GT_FATAL_VCTR_0, \
+						_ERR_STAT_GT_FATAL_VCTR_1))
+
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))
+
 /* Count of GT Correctable and FATAL HW ERRORS */
 enum xe_gt_hw_errors {
+	XE_GT_HW_ERR_SUBSLICE_CORR,
+	XE_GT_HW_ERR_L3BANK_CORR,
 	XE_GT_HW_ERR_L3_SNG_CORR,
 	XE_GT_HW_ERR_GUC_CORR,
 	XE_GT_HW_ERR_SAMPLER_CORR,
@@ -21,6 +53,8 @@ enum xe_gt_hw_errors {
 	XE_GT_HW_ERR_EU_IC_CORR,
 	XE_GT_HW_ERR_EU_GRF_CORR,
 	XE_GT_HW_ERR_UNKNOWN_CORR,
+	XE_GT_HW_ERR_SUBSLICE_FATAL,
+	XE_GT_HW_ERR_L3BANK_FATAL,
 	XE_GT_HW_ERR_ARR_BIST_FATAL,
 	XE_GT_HW_ERR_FPU_FATAL,
 	XE_GT_HW_ERR_L3_DOUB_FATAL,
@@ -32,11 +66,25 @@ enum xe_gt_hw_errors {
 	XE_GT_HW_ERR_SLM_FATAL,
 	XE_GT_HW_ERR_EU_IC_FATAL,
 	XE_GT_HW_ERR_EU_GRF_FATAL,
+	XE_GT_HW_ERR_TLB_FATAL,
+	XE_GT_HW_ERR_L3_FABRIC_FATAL,
 	XE_GT_HW_ERR_UNKNOWN_FATAL,
 };
 
 #define XE_GT_HW_ERROR_MAX (XE_GT_HW_ERR_UNKNOWN_FATAL + 1)
 
+#define PVC_ERR_STAT_GT_FATAL_MASK \
+		(REG_BIT(3) | \
+		 REG_BIT(6) | \
+		 REG_BIT(13) | \
+		 REG_BIT(15))
+
+#define PVC_ERR_STAT_GT_CORRECTABLE_MASK \
+		(REG_BIT(1) | \
+		 REG_BIT(13) | \
+		 REG_BIT(14) | \
+		 REG_BIT(15))
+
 #define xe_gt_log_hw_err(gt, fmt, ...) \
 	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, \
 			    gt->info.id, ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ca9c4993be6a..ab29ac625d3a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -492,6 +492,24 @@ struct error_msg_counter_pair err_stat_gt_correctable_reg[] = {
 	{"SINGLE BIT EU GRF",	XE_GT_HW_ERR_EU_GRF_CORR		/* Bit Pos 15 */},
 };
 
+struct error_msg_counter_pair err_stat_gt_fatal_vectr_reg[] = {
+	{"SUBSLICE",		XE_GT_HW_ERR_SUBSLICE_FATAL		/* vector reg 0 */},
+	{"SUBSLICE",		XE_GT_HW_ERR_SUBSLICE_FATAL		/* vector reg 1 */},
+	{"L3BANK",		XE_GT_HW_ERR_L3BANK_FATAL		/* vector reg 2 */},
+	{"L3BANK",		XE_GT_HW_ERR_L3BANK_FATAL		/* vector reg 3 */},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL		/* vector reg 4 */},
+	{"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL              /* vector reg 5 */},
+	{"TLB",			XE_GT_HW_ERR_TLB_FATAL			/* vector reg 6 */},
+	{"L3 FABRIC",		XE_GT_HW_ERR_L3_FABRIC_FATAL		/* vector reg 7 */},
+};
+
+struct error_msg_counter_pair err_stat_gt_correctable_vectr_reg[] = {
+	{"SUBSLICE",		XE_GT_HW_ERR_SUBSLICE_CORR		/* vector reg 0 */},
+	{"SUBSLICE",		XE_GT_HW_ERR_SUBSLICE_CORR		/* vector reg 1 */},
+	{"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR		/* vector reg 2 */},
+	{"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR		/* vector reg 3 */},
+};
+
 static void update_valid_error_regs(struct xe_device *xe)
 {
 	unsigned long mask = 0;
@@ -528,11 +546,21 @@ static void update_valid_error_regs(struct xe_device *xe)
 		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
 			dev_err_stat_correctable_reg[i] = (struct error_msg_counter_pair)
 			{.errmsg = "Undefined", .errcounter = XE_TILE_HW_ERR_UNKNOWN_CORR};
+
+		mask = ~(0 | PVC_ERR_STAT_GT_FATAL_MASK);
+		for_each_set_bit(i, &mask, ERR_GT_STAT_MAX_ERROR_BIT)
+			err_stat_gt_fatal_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = "Undefined", .errcounter = XE_GT_HW_ERR_UNKNOWN_FATAL};
+
+		mask = ~(0 | PVC_ERR_STAT_GT_CORRECTABLE_MASK);
+		for_each_set_bit(i, &mask, ERR_GT_STAT_MAX_ERROR_BIT)
+			err_stat_gt_correctable_reg[i] = (struct error_msg_counter_pair)
+			{.errmsg = "Undefined", .errcounter = XE_GT_HW_ERR_UNKNOWN_CORR};
 	}
 }
 
 static void
-xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+xe_gt_hw_error_status_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 {
 	const char *hw_err_str = hardware_error_type_to_str(hw_err);
 	struct error_msg_counter_pair *errstat;
@@ -542,10 +570,6 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 	u32 errcntr;
 	u32 errbit;
 
-	if (gt_to_xe(gt)->info.platform == XE_PVC)
-		return;
-
-	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
 	errsrc = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err));
 	if (!errsrc) {
 		xe_gt_log_hw_err(gt, "ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
@@ -593,6 +617,84 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 clear_reg: xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err), errsrc);
 }
 
+static void
+xe_gt_hw_error_vectr_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	struct error_msg_counter_pair *errvctr;
+	const char *errmsg;
+	bool errstat_read;
+	u32 num_vctr_reg;
+	u32 counter;
+	u32 vctr;
+	u32 i;
+
+	switch (hw_err) {
+	case HARDWARE_ERROR_FATAL:
+		num_vctr_reg = ERR_STAT_GT_FATAL_VCTR_LEN;
+		errvctr = (struct error_msg_counter_pair *)err_stat_gt_fatal_vectr_reg;
+		counter = XE_GT_HW_ERR_UNKNOWN_FATAL;
+		break;
+	case HARDWARE_ERROR_NONFATAL:
+		/*  The GT Non Fatal Error Status Register has only reserved bits
+		 *  Nothing to service.
+		 */
+		xe_gt_log_hw_err(gt, "%s error\n", hw_err_str);
+		return;
+	case HARDWARE_ERROR_CORRECTABLE:
+		num_vctr_reg = ERR_STAT_GT_COR_VCTR_LEN;
+		errvctr = (struct error_msg_counter_pair *)err_stat_gt_correctable_vectr_reg;
+		counter = XE_GT_HW_ERR_UNKNOWN_CORR;
+		break;
+	default:
+		return;
+	}
+
+	errstat_read = false;
+
+	for (i = 0 ; i < num_vctr_reg; i++) {
+		vctr = xe_mmio_read32(gt, ERR_STAT_GT_VCTR_REG(hw_err, i));
+		if (!vctr)
+			continue;
+
+		errmsg = errvctr[i].errmsg;
+		counter = errvctr[i].errcounter;
+
+		if (hw_err == HARDWARE_ERROR_FATAL)
+			xe_gt_log_hw_err(gt, "%s %s error. ERR_VECT_GT_%s_[%d]:0x%08x\n",
+					 errmsg, hw_err_str, hw_err_str, i, vctr);
+		else
+			xe_gt_log_hw_warn(gt, "%s %s error. ERR_VECT_GT_%s_[%d]:0x%08x\n",
+					  errmsg, hw_err_str, hw_err_str, i, vctr);
+		if (i < ERR_STAT_GT_VCTR4)
+			gt->errors.hw[counter] += hweight32(vctr);
+
+		if (i == ERR_STAT_GT_VCTR6)
+			gt->errors.hw[counter] += hweight16(vctr);
+
+		if (i == ERR_STAT_GT_VCTR7)
+			gt->errors.hw[counter] += hweight8(vctr);
+
+		if (i < ERR_STAT_GT_VCTR2 && !errstat_read) {
+			xe_gt_hw_error_status_reg_handler(gt, hw_err);
+			errstat_read = true;
+		}
+
+		xe_mmio_write32(gt, ERR_STAT_GT_VCTR_REG(hw_err, i), vctr);
+	}
+}
+
+static void
+xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
+
+	if (gt_to_xe(gt)->info.platform == XE_PVC)
+		xe_gt_hw_error_vectr_reg_handler(gt, hw_err);
+	else
+		xe_gt_hw_error_status_reg_handler(gt, hw_err);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
-- 
2.25.1

