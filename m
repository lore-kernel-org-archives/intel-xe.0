Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FEDCDB482
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 05:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F67210E266;
	Tue, 17 Oct 2023 05:03:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952F210E264
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 05:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697519000; x=1729055000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I2hBjWKPiXgnKv+EKfDaWSrdgwMwxP3lt9gJmfOXImU=;
 b=LWodrbO4eRJh4Y94o3MNJN5fUlDXvgLpw5OHC2LYKr8sN5WvpXSBm9lc
 DvwJef4uCVNgCp/ZsP3YfmTsiUHxcSBX1FokAuz8vU3q2L/KWwCGqULjY
 eDKPBqiO2Or8W1WLzoZb6FjTz7cSeoDnyh3y2NepO2E0taylst9TCCXZ1
 TSeT+hKotGW80bd5d664mfWmmd5asvSu5RD9Q07+dBQ/D/zzkrqOpL0v1
 pwQ6CbQvv86KJ0ecG/cR0zXZu44rJ+X6z61G7pTTMJ7kvi5MfunPpBLjo
 LDhhLym9s5isgeAAqYPi+5A/O8BGCSWL3q3zeEbzVSSaMKYDXiFmzduks A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365959421"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="365959421"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 22:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="826290003"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="826290003"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2023 22:03:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 10:39:48 +0530
Message-Id: <20231017050954.1174428-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017050954.1174428-1-himal.prasad.ghimiray@intel.com>
References: <20231017050954.1174428-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/10] drm/xe: Support GSC hardware error
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add support to report GSC hw errors and counter update in case
of correctable errors.

v2
- skip FW_ERR reporting via counters.
- maintain uniform naming for enums.
- Use same convention for error reporting.(Aravind)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  9 ++
 drivers/gpu/drm/xe/xe_device_types.h         |  1 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 96 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             | 19 +++-
 4 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index 2224f7d328e5..1d18f560f200 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -7,10 +7,19 @@
 
 #include <linux/stddef.h>
 
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
 #define XE_GT_ERROR				       0
+#define XE_GSC_ERROR				       8
+
+#define PVC_GSC_HECI1_BASE                             0x284000
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b86182dd89f3..2998ee517f0d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -416,6 +416,7 @@ struct xe_device {
 		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
 		const struct err_name_index_pair *err_stat_gt[HARDWARE_ERROR_MAX];
 		const struct err_name_index_pair *err_vctr_gt[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *gsc_error[HARDWARE_ERROR_MAX];
 	} hw_err_regs;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index d52b639b45fd..f2e751bf9dd5 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -165,11 +165,34 @@ static const struct err_name_index_pair pvc_err_vectr_gt_correctable_reg[] = {
 	[2 ... 3]         = {"L3BANK",		XE_HW_ERR_GT_CORR_L3BANK},
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
 void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
 	const struct err_name_index_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
 	const struct err_name_index_pair **err_vctr_gt = xe->hw_err_regs.err_vctr_gt;
+	const struct err_name_index_pair **gsc_error = xe->hw_err_regs.gsc_error;
 
 	/* Error reporting is supported only for DG2 and
 	 * PVC currently. Error reporting support for other
@@ -191,6 +214,8 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
 		err_stat_gt[HARDWARE_ERROR_FATAL] = pvc_err_stat_gt_fatal_reg;
 		err_vctr_gt[HARDWARE_ERROR_CORRECTABLE] = pvc_err_vectr_gt_correctable_reg;
 		err_vctr_gt[HARDWARE_ERROR_FATAL] = pvc_err_vectr_gt_fatal_reg;
+		gsc_error[HARDWARE_ERROR_CORRECTABLE] = pvc_gsc_correctable_err_reg;
+		gsc_error[HARDWARE_ERROR_NONFATAL] = pvc_gsc_nonfatal_err_reg;
 	}
 
 }
@@ -362,6 +387,72 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
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
+	/* GSC errors are valid only on root tile and for NONFATAL and
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
+	errsrc = xe_mmio_read32(gt, GSC_HEC_ERR_STAT_REG(base, hw_err));
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
+	xe_mmio_write32(gt, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -413,9 +504,14 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
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
+
 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err), errsrc);
 unlock:
 	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index ce924d2d6038..1dad66a85799 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -38,7 +38,24 @@ enum xe_tile_hw_errors {
 	XE_HW_ERR_TILE_CORR_SGUNIT,
 	XE_HW_ERR_TILE_CORR_UNKNOWN,
 	XE_HW_ERR_TILE_UNSPEC,
-	XE_HW_ERROR_TILE_MAX,
+};
+
+enum xe_gsc_hw_errors {
+	XE_HW_ERR_GSC_CORR_SRAM = XE_HW_ERR_TILE_UNSPEC + 1,
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
+	XE_HW_ERROR_TILE_MAX
 };
 
 enum gt_vctr_registers {
-- 
2.25.1

