Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89521C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5181710E35F;
	Wed, 30 Jul 2025 05:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bscz3JKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E68B10E35F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854577; x=1785390577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gTV3dqARPRnstn91PvBaFP3bFOXuVcjLBwG8tKm9sfk=;
 b=Bscz3JKxecwVYdgj2Ga9FS+5E5vtPwVvZRZikpSRIRejxsJ6FyM95s5r
 g/FRKK1oofR56p3r0eL4nmt5ws4FVtaptSnCDOAWxkL7IaXSbOTYNLRpX
 b444zhZySyQ6JiYyyntK+E5mL5fdaA/zCZ/pVc89V8eG675fNWXnCWOa6
 qupD3aF0r0cTWaCS+4QKmQ6d1Zdp61NavLT0NE0S9TuAN+KotvjNZe7aI
 6gSrvupH0peTXKGDluqlknqb8p/jrMQ05cAHG7fjKZQnAxEVOb/DTCoJP
 SWgI+cEip6O/2D8lLu4yPD8bP56hRNdie5YLfA4XP57zkAN6iUdDabGV0 w==;
X-CSE-ConnectionGUID: tRQq4YCBSpO4A1R9CqWMdg==
X-CSE-MsgGUID: YXX72ODXRUGyEYru1vhjsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215609"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:37 -0700
X-CSE-ConnectionGUID: hX5byTNLQiGxkVO6TgtBkQ==
X-CSE-MsgGUID: dogmhKbrS3eaJ+I3oBbIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240243"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:34 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 04/10] drm/xe: Support GT hardware error reporting for PVC.
Date: Wed, 30 Jul 2025 11:18:08 +0530
Message-Id: <20250730054814.1376770-5-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

PVC supports GT error reporting via vector registers alongwith
error status register. Add support to report these errors and
update respective counters.
Incase of Subslice error reported by vector register, process the
error status register for applicable bits.

Bspec: 54179, 54177, 53088, 53089

v6
- Define registers ascending order of their addresses.
- use xe_gt_hw_error_log_vector_reg instead of
  xe_gt_hw_error_vectr_reg_handler.
- use xe_assign_hw_err_regs for reg initialization.
- use switch-case instead of if-else.

v7
- Use all vctr for correctable too.
- Use helper functions to log gt hardware errors. (Aravind)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_error_regs.h |  16 +++
 drivers/gpu/drm/xe/xe_device_types.h       |   1 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 124 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_error.h           |  19 ++++
 4 files changed, 158 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
index 6180704a6149..59631c2e8e12 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
@@ -10,4 +10,20 @@
 #define ERR_STAT_GT_REG(x)              XE_REG(_PICK_EVEN((x), \
 						_ERR_STAT_GT_COR, \
 						_ERR_STAT_GT_NONFATAL))
+
+#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
+#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
+#define ERR_STAT_GT_FATAL_VCTR_REG(x)   XE_REG(_PICK_EVEN((x), \
+						_ERR_STAT_GT_FATAL_VCTR_0, \
+						_ERR_STAT_GT_FATAL_VCTR_1))
+
+#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
+#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
+#define ERR_STAT_GT_COR_VCTR_REG(x)     XE_REG(_PICK_EVEN((x), \
+						_ERR_STAT_GT_COR_VCTR_0, \
+						_ERR_STAT_GT_COR_VCTR_1))
+
+#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
+						ERR_STAT_GT_COR_VCTR_REG(x) : \
+						ERR_STAT_GT_FATAL_VCTR_REG(x))
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4c7fb0d021c2..7b93335b58f1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -585,6 +585,7 @@ struct xe_device {
 	struct hardware_errors_regs {
 		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
 		const struct err_name_index_pair *err_stat_gt[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *err_vctr_gt[HARDWARE_ERROR_MAX];
 	} hw_err_regs;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 66a1a0c288f8..5325557b2931 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -133,10 +133,47 @@ static const struct err_name_index_pair dg2_stat_gt_correctable_reg[] = {
 	[16 ... 31] = {"Undefined",             XE_HW_ERR_GT_CORR_UNKNOWN},
 };
 
+static const struct err_name_index_pair pvc_err_stat_gt_fatal_reg[] = {
+	[0 ... 2]   =  {"Undefined",		XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[3]         =  {"FPU",			XE_HW_ERR_GT_FATAL_FPU},
+	[4 ... 5]   =  {"Undefined",            XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[6]         =  {"GUC SRAM",		XE_HW_ERR_GT_FATAL_GUC},
+	[7 ... 12]  =  {"Undefined",		XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[13]        =  {"SLM",			XE_HW_ERR_GT_FATAL_SLM},
+	[14]        =  {"Undefined",		XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[15]        =  {"EU GRF",		XE_HW_ERR_GT_FATAL_EU_GRF},
+	[16 ... 31] =  {"Undefined",            XE_HW_ERR_GT_FATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_err_stat_gt_correctable_reg[] = {
+	[0]         = {"Undefined",             XE_HW_ERR_GT_CORR_UNKNOWN},
+	[1]         = {"SINGLE BIT GUC SRAM",	XE_HW_ERR_GT_CORR_GUC},
+	[2 ... 12]  = {"Undefined",		XE_HW_ERR_GT_CORR_UNKNOWN},
+	[13]        = {"SINGLE BIT SLM",	XE_HW_ERR_GT_CORR_SLM},
+	[14]        = {"SINGLE BIT EU IC",	XE_HW_ERR_GT_CORR_EU_IC},
+	[15]        = {"SINGLE BIT EU GRF",	XE_HW_ERR_GT_CORR_EU_GRF},
+	[16 ... 31] = {"Undefined",             XE_HW_ERR_GT_CORR_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_err_vectr_gt_fatal_reg[] = {
+	[0 ... 1]         = {"SUBSLICE",	XE_HW_ERR_GT_FATAL_SUBSLICE},
+	[2 ... 3]         = {"L3BANK",		XE_HW_ERR_GT_FATAL_L3BANK},
+	[4 ... 5]         = {"Undefined",	XE_HW_ERR_GT_FATAL_UNKNOWN},
+	[6]               = {"TLB",		XE_HW_ERR_GT_FATAL_TLB},
+	[7]               = {"L3 FABRIC",	XE_HW_ERR_GT_FATAL_L3_FABRIC},
+};
+
+static const struct err_name_index_pair pvc_err_vectr_gt_correctable_reg[] = {
+	[0 ... 1]         = {"SUBSLICE",	XE_HW_ERR_GT_CORR_SUBSLICE},
+	[2 ... 3]         = {"L3BANK",		XE_HW_ERR_GT_CORR_L3BANK},
+	[4 ... 7]         = {"Undefined",       XE_HW_ERR_GT_CORR_UNKNOWN},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
 	const struct err_name_index_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
+	const struct err_name_index_pair **err_vctr_gt = xe->hw_err_regs.err_vctr_gt;
 
 	/* Error reporting is supported only for DG2 and PVC currently. */
 	if (xe->info.platform == XE_DG2) {
@@ -151,6 +188,10 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
 		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
 		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
 		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
+		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_gt_correctable_reg;
+		err_stat_gt[HARDWARE_ERROR_FATAL] = pvc_err_stat_gt_fatal_reg;
+		err_vctr_gt[HARDWARE_ERROR_CORRECTABLE] = pvc_err_vectr_gt_correctable_reg;
+		err_vctr_gt[HARDWARE_ERROR_FATAL] = pvc_err_vectr_gt_fatal_reg;
 	}
 
 }
@@ -164,13 +205,14 @@ static bool xe_platform_has_ras(struct xe_device *xe)
 }
 
 static void
-xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned long index)
+xe_update_hw_error_cnt_with_value(struct drm_device *drm, struct xarray *hw_error,
+				  unsigned long index, unsigned long val)
 {
 	unsigned long flags;
 	void *entry;
 
 	entry = xa_load(hw_error, index);
-	entry = xa_mk_value(xa_to_value(entry) + 1);
+	entry = xa_mk_value(xa_to_value(entry) + val);
 
 	xa_lock_irqsave(hw_error, flags);
 	if (xa_is_err(__xa_store(hw_error, index, entry, GFP_ATOMIC)))
@@ -179,6 +221,12 @@ xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned
 	xa_unlock_irqrestore(hw_error, flags);
 }
 
+static void
+xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned long index)
+{
+	xe_update_hw_error_cnt_with_value(drm, hw_error, index, 1);
+}
+
 static void
 xe_gt_hw_error_log_status_reg(struct xe_gt *gt, const enum hardware_error hw_err)
 {
@@ -190,6 +238,7 @@ xe_gt_hw_error_log_status_reg(struct xe_gt *gt, const enum hardware_error hw_err
 	u32 indx;
 	u32 errbit;
 
+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
 	err_regs = &gt_to_xe(gt)->hw_err_regs;
 	errsrc = xe_mmio_read32(&gt->tile->mmio, ERR_STAT_GT_REG(hw_err));
 	if (!errsrc) {
@@ -226,6 +275,74 @@ xe_gt_hw_error_log_status_reg(struct xe_gt *gt, const enum hardware_error hw_err
 	xe_mmio_write32(&gt->tile->mmio, ERR_STAT_GT_REG(hw_err), errsrc);
 }
 
+static void
+xe_gt_hw_error_log_vector_reg(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	const struct err_name_index_pair *errvctr;
+	struct hardware_errors_regs *err_regs;
+	const char *name;
+	bool errstat_read;
+	unsigned long val;
+	u32 num_vctr_reg;
+	u32 indx;
+	u32 vctr;
+	u32 i;
+
+	if (hw_err == HARDWARE_ERROR_NONFATAL) {
+		/*  The GT Non Fatal Error Status Register has only reserved bits
+		 *  Nothing to service.
+		 */
+		xe_gt_log_hw_err(gt, "%s error\n", hw_err_str);
+		return;
+	}
+
+	errstat_read = false;
+	num_vctr_reg = ERR_STAT_GT_VCTR_LEN;
+	err_regs = &gt_to_xe(gt)->hw_err_regs;
+	errvctr = err_regs->err_vctr_gt[hw_err];
+	for (i = 0 ; i < num_vctr_reg; i++) {
+		vctr = xe_mmio_read32(&gt->tile->mmio, ERR_STAT_GT_VCTR_REG(hw_err, i));
+		if (!vctr)
+			continue;
+
+		name = errvctr[i].name;
+		indx = errvctr[i].index;
+
+		if (hw_err == HARDWARE_ERROR_FATAL)
+			xe_gt_log_hw_err(gt, "%s %s error. ERR_VECT_GT_%s[%d]:0x%08x\n",
+					 name, hw_err_str, hw_err_str, i, vctr);
+		else
+			xe_gt_log_hw_warn(gt, "%s %s error. ERR_VECT_GT_%s[%d]:0x%08x\n",
+					  name, hw_err_str, hw_err_str, i, vctr);
+
+		switch (i) {
+		case ERR_STAT_GT_VCTR0:
+		case ERR_STAT_GT_VCTR1:
+		case ERR_STAT_GT_VCTR2:
+		case ERR_STAT_GT_VCTR3:
+			val = hweight32(vctr);
+			if (i < ERR_STAT_GT_VCTR2 && !errstat_read) {
+				xe_gt_hw_error_log_status_reg(gt, hw_err);
+				errstat_read = true;
+			}
+			xe_update_hw_error_cnt_with_value(&gt_to_xe(gt)->drm,
+							  &gt->errors.hw_error, indx, val);
+			break;
+		case ERR_STAT_GT_VCTR6:
+		case ERR_STAT_GT_VCTR7:
+			val = (i == ERR_STAT_GT_VCTR6) ? hweight16(vctr) : hweight8(vctr);
+			xe_update_hw_error_cnt_with_value(&gt_to_xe(gt)->drm,
+							  &gt->errors.hw_error, indx, val);
+			break;
+		default:
+			break;
+		}
+
+		xe_mmio_write32(&gt->tile->mmio, ERR_STAT_GT_VCTR_REG(hw_err, i), vctr);
+	}
+}
+
 static void
 xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 {
@@ -233,6 +350,9 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 
 	if (gt_to_xe(gt)->info.platform == XE_DG2)
 		xe_gt_hw_error_log_status_reg(gt, hw_err);
+
+	if (gt_to_xe(gt)->info.platform == XE_PVC)
+		xe_gt_hw_error_log_vector_reg(gt, hw_err);
 }
 
 static void
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 3dc32dbfc8bb..ff1c4671b589 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -10,6 +10,8 @@
 
 #define XE_RAS_REG_SIZE 32
 
+#define ERR_STAT_GT_VCTR_LEN (8)
+
 /* Error categories reported by hardware */
 enum hardware_error {
 	HARDWARE_ERROR_CORRECTABLE = 0,
@@ -37,8 +39,21 @@ enum xe_tile_hw_errors {
 	XE_HW_ERR_TILE_CORR_UNKNOWN,
 };
 
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
 /* Count of GT Correctable and FATAL HW ERRORS */
 enum xe_gt_hw_errors {
+	XE_HW_ERR_GT_CORR_SUBSLICE,
+	XE_HW_ERR_GT_CORR_L3BANK,
 	XE_HW_ERR_GT_CORR_L3_SNG,
 	XE_HW_ERR_GT_CORR_GUC,
 	XE_HW_ERR_GT_CORR_SAMPLER,
@@ -46,6 +61,10 @@ enum xe_gt_hw_errors {
 	XE_HW_ERR_GT_CORR_EU_IC,
 	XE_HW_ERR_GT_CORR_EU_GRF,
 	XE_HW_ERR_GT_CORR_UNKNOWN,
+	XE_HW_ERR_GT_FATAL_SUBSLICE,
+	XE_HW_ERR_GT_FATAL_L3BANK,
+	XE_HW_ERR_GT_FATAL_TLB,
+	XE_HW_ERR_GT_FATAL_L3_FABRIC,
 	XE_HW_ERR_GT_FATAL_ARR_BIST,
 	XE_HW_ERR_GT_FATAL_FPU,
 	XE_HW_ERR_GT_FATAL_L3_DOUB,
-- 
2.25.1

