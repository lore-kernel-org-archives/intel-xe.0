Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7F2C87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C0810E35D;
	Wed, 30 Jul 2025 05:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuNPM7rR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F57610E35F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854579; x=1785390579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9ERMjNLINdxQUHZO75l1zebylCmBQmvSeeSopyc7QA=;
 b=SuNPM7rR7YVjsFnn5IEuVQh4zm+voDc95Do6W5H2w/Xp+Nn/KExdSdAa
 TEcg+wjwXLN8ratd5CdftdUwqDSibkCQvlZd7LqODvBfl5/Vw0IarYUFM
 cM7WAKHx8KNLYSTIfirrIUJvFGs3Yv2m6+LtmgY8snMWqyo9Irxx6SSNj
 WCkcUcm43ofL9tyA/p2nsTkLY++D0XjFMLl3QLsDCXe1iFNY+miD0vMT6
 AZIN0i+raWfTcAd74O0KXpKCwfES6rVsAfvtD6DzF6sQS5kwIB13jP7U6
 JzSynB2RQjPzs6RRHLUm7Gl/QQDSPDJidjx6EZjlCUCO8kmK9AHNVUII5 Q==;
X-CSE-ConnectionGUID: /ouMofA0TiSQWXsShqQ/eQ==
X-CSE-MsgGUID: 5uRrF9KMQ2yuG85r40wUkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215611"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215611"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:39 -0700
X-CSE-ConnectionGUID: MKfVq/b5RB2INishVsm8gA==
X-CSE-MsgGUID: CZkk2w+FR1O681pwFY3pyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240249"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:37 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 05/10] drm/xe: Support GSC hardware error reporting for PVC.
Date: Wed, 30 Jul 2025 11:18:09 +0530
Message-Id: <20250730054814.1376770-6-aravind.iddamsetty@linux.intel.com>
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

Add support to report GSC hw errors and counter update in case
of correctable errors.

v2
- skip FW_ERR reporting via counters.
- maintain uniform naming for enums.
- Use same convention for error reporting.(Aravind)

v3
- Move gsc error in same enum as tile.
- Leave blankline before comments.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h | 11 +++
 drivers/gpu/drm/xe/xe_device_types.h         |  1 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 96 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 14 +++
 4 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index 45bd6b85e115..3ab28b321622 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -5,10 +5,21 @@
 #ifndef XE_TILE_ERROR_REGS_H_
 #define XE_TILE_ERROR_REGS_H_
 
+
+#define _GSC_HEC_UNCOR_ERR_STATUS                      0x118
+#define _GSC_HEC_CORR_ERR_STATUS                       0x128
+#define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
+								(base) + _GSC_HEC_CORR_ERR_STATUS, \
+								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
+
 #define _DEV_ERR_STAT_NONFATAL                         0x100178
 #define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
 #define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
 								_DEV_ERR_STAT_CORRECTABLE, \
 								_DEV_ERR_STAT_NONFATAL))
 #define   XE_GT_ERROR				       0
+#define   XE_GSC_ERROR				       8
+
+#define PVC_GSC_HECI1_BASE                             0x284000
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7b93335b58f1..5d5a730688d3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -586,6 +586,7 @@ struct xe_device {
 		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
 		const struct err_name_index_pair *err_stat_gt[HARDWARE_ERROR_MAX];
 		const struct err_name_index_pair *err_vctr_gt[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *gsc_error[HARDWARE_ERROR_MAX];
 	} hw_err_regs;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 5325557b2931..2aff84339534 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -169,11 +169,34 @@ static const struct err_name_index_pair pvc_err_vectr_gt_correctable_reg[] = {
 	[4 ... 7]         = {"Undefined",       XE_HW_ERR_GT_CORR_UNKNOWN},
 };
 
+static const struct err_name_index_pair pvc_gsc_nonfatal_err_reg[] = {
+	[0]  = {"MinuteIA Unexpected Shutdown",		 XE_HW_ERR_GSC_NONFATAL_MIA_SHUTDOWN},
+	[1]  = {"MinuteIA Internal Error",		 XE_HW_ERR_GSC_NONFATAL_MIA_INTERNAL},
+	[2]  = {"Double bit error on SRAM",		 XE_HW_ERR_GSC_NONFATAL_SRAM},
+	[3]  = {"WDT 2nd Timeout",			 XE_HW_ERR_GSC_NONFATAL_WDG},
+	[4]  = {"ROM has a parity error",		 XE_HW_ERR_GSC_NONFATAL_ROM_PARITY},
+	[5]  = {"Ucode has a parity error",		 XE_HW_ERR_GSC_NONFATAL_UCODE_PARITY},
+	[6]  = {"Errors Reported to and Detected by FW", XE_HW_ERR_TILE_UNSPEC},
+	[7]  = {"Glitch is detected on voltage rail",	 XE_HW_ERR_GSC_NONFATAL_VLT_GLITCH},
+	[8]  = {"Fuse Pull Error",			 XE_HW_ERR_GSC_NONFATAL_FUSE_PULL},
+	[9]  = {"Fuse CRC Check Failed on Fuse Pull",	 XE_HW_ERR_GSC_NONFATAL_FUSE_CRC},
+	[10] = {"Self Mbist Failed",			 XE_HW_ERR_GSC_NONFATAL_SELF_MBIST},
+	[11] = {"AON RF has parity error",		 XE_HW_ERR_GSC_NONFATAL_AON_RF_PARITY},
+	[12 ... 31] = {"Undefined",			 XE_HW_ERR_GSC_NONFATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_gsc_correctable_err_reg[] = {
+	[0]  = {"Single bit error on SRAM",			XE_HW_ERR_GSC_CORR_SRAM},
+	[1]  = {"Errors Reported to FW and Detected by FW",	XE_HW_ERR_TILE_UNSPEC},
+	[2 ... 31] = {"Undefined",				XE_HW_ERR_GSC_CORR_UNKNOWN},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
 	const struct err_name_index_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
 	const struct err_name_index_pair **err_vctr_gt = xe->hw_err_regs.err_vctr_gt;
+	const struct err_name_index_pair **gsc_error = xe->hw_err_regs.gsc_error;
 
 	/* Error reporting is supported only for DG2 and PVC currently. */
 	if (xe->info.platform == XE_DG2) {
@@ -192,6 +215,8 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
 		err_stat_gt[HARDWARE_ERROR_FATAL] = pvc_err_stat_gt_fatal_reg;
 		err_vctr_gt[HARDWARE_ERROR_CORRECTABLE] = pvc_err_vectr_gt_correctable_reg;
 		err_vctr_gt[HARDWARE_ERROR_FATAL] = pvc_err_vectr_gt_fatal_reg;
+		gsc_error[HARDWARE_ERROR_CORRECTABLE] = pvc_gsc_correctable_err_reg;
+		gsc_error[HARDWARE_ERROR_NONFATAL] = pvc_gsc_nonfatal_err_reg;
 	}
 
 }
@@ -355,6 +380,73 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 		xe_gt_hw_error_log_vector_reg(gt, hw_err);
 }
 
+static void
+xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	const struct err_name_index_pair *errstat;
+	struct hardware_errors_regs *err_regs;
+	struct xe_gt *gt;
+	unsigned long errsrc;
+	const char *name;
+	u32 indx;
+	u32 errbit;
+	u32 base;
+
+	if ((tile_to_xe(tile)->info.platform != XE_PVC))
+		return;
+
+	/*
+	 * GSC errors are valid only on root tile and for NONFATAL and
+	 * CORRECTABLE type.For non root tiles or FATAL type it should
+	 * be categorized as undefined GSC HARDWARE ERROR
+	 */
+	base = PVC_GSC_HECI1_BASE;
+
+	if (tile->id || hw_err == HARDWARE_ERROR_FATAL) {
+		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+				    "Tile%d reported GSC %s Undefined error.\n",
+				    tile->id, hw_err_str);
+		return;
+	}
+
+	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
+	err_regs = &tile_to_xe(tile)->hw_err_regs;
+	errstat = err_regs->gsc_error[hw_err];
+	gt = tile->primary_gt;
+	errsrc = xe_mmio_read32(&gt->tile->mmio, GSC_HEC_ERR_STAT_REG(base, hw_err));
+	if (!errsrc) {
+		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+				    "Tile0 reported GSC_HEC_ERR_STAT_REG_%s blank!\n", hw_err_str);
+		goto clear_reg;
+	}
+
+	drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
+		 "Tile0 reported GSC_HEC_ERR_STAT_REG_%s=0x%08lx\n", hw_err_str, errsrc);
+
+	for_each_set_bit(errbit, &errsrc, XE_RAS_REG_SIZE) {
+		name = errstat[errbit].name;
+		indx = errstat[errbit].index;
+
+		if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
+			drm_warn(&tile_to_xe(tile)->drm,
+				 HW_ERR "Tile0 reported GSC %s %s error, bit[%d] is set\n",
+				 name, hw_err_str, errbit);
+
+		} else {
+			drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+					    "Tile0 reported GSC %s %s error, bit[%d] is set\n",
+					    name, hw_err_str, errbit);
+		}
+		if (indx != XE_HW_ERR_TILE_UNSPEC)
+			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
+					       &tile->errors.hw_error, indx);
+	}
+
+clear_reg:
+	xe_mmio_write32(&gt->tile->mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -404,8 +496,12 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 		if (indx != XE_HW_ERR_TILE_UNSPEC)
 			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
 					       &tile->errors.hw_error, indx);
+
 		if (errbit == XE_GT_ERROR)
 			xe_gt_hw_error_handler(tile->primary_gt, hw_err);
+
+		if (errbit == XE_GSC_ERROR)
+			xe_gsc_hw_error_handler(tile, hw_err);
 	}
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index ff1c4671b589..20036a523963 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -37,6 +37,20 @@ enum xe_tile_hw_errors {
 	XE_HW_ERR_TILE_NONFATAL_UNKNOWN,
 	XE_HW_ERR_TILE_CORR_SGUNIT,
 	XE_HW_ERR_TILE_CORR_UNKNOWN,
+	XE_HW_ERR_GSC_CORR_SRAM,
+	XE_HW_ERR_GSC_CORR_UNKNOWN,
+	XE_HW_ERR_GSC_NONFATAL_MIA_SHUTDOWN,
+	XE_HW_ERR_GSC_NONFATAL_MIA_INTERNAL,
+	XE_HW_ERR_GSC_NONFATAL_SRAM,
+	XE_HW_ERR_GSC_NONFATAL_WDG,
+	XE_HW_ERR_GSC_NONFATAL_ROM_PARITY,
+	XE_HW_ERR_GSC_NONFATAL_UCODE_PARITY,
+	XE_HW_ERR_GSC_NONFATAL_VLT_GLITCH,
+	XE_HW_ERR_GSC_NONFATAL_FUSE_PULL,
+	XE_HW_ERR_GSC_NONFATAL_FUSE_CRC,
+	XE_HW_ERR_GSC_NONFATAL_SELF_MBIST,
+	XE_HW_ERR_GSC_NONFATAL_AON_RF_PARITY,
+	XE_HW_ERR_GSC_NONFATAL_UNKNOWN,
 };
 
 enum gt_vctr_registers {
-- 
2.25.1

