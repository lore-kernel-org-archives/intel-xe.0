Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CAFE810D0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0510E4EA;
	Wed, 27 Sep 2023 11:40:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE9210E4E8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814820; x=1727350820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=86+W75sSVvA2ZLdROlzrN6MP8OraLv8qQ5TEIe+3i5M=;
 b=HifDPwpXYOhxJtFqR6rWnWJcn9P9GszWHzlZLUAt1yB2M4Nml5t2D/ur
 kN3vwFCDW/byGZv8Dj2L8CcjmypfTSEIJcKpdirCPq/G7+BwCAJE8IOaJ
 09+QMOSmgHu9lIZvAuWJWWOMbiSRlafruszCcnTgF4SrcwLX7+l3UbM2L
 aq6goJEJQRplOuG4gKDbL4lerjSSFUpcX25P4f489Nof10Enm2pxz7sjV
 aRecT1fI8FoYUtYrhsXJKx/AnWKQN3sO2rOs3bvFd6C2rnIAcszZwS9lF
 mrmSolPK89nkX3tOdUwFHZB4RxAGL/IA4rErcrVeKH235qx+ZVFZ4Gb9m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863202"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863202"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855580"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855580"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:21 +0530
Message-Id: <20230927114627.136925-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/11] drm/xe: Support GSC hardware error
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  8 ++
 drivers/gpu/drm/xe/xe_hw_error.c             | 96 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_error.h             | 16 ++++
 3 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index db78d6687213..fa16eaf9436b 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -12,4 +12,12 @@
 #define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
 								_DEV_ERR_STAT_CORRECTABLE, \
 								_DEV_ERR_STAT_NONFATAL))
+
+#define PVC_GSC_HECI1_BASE                             0x00284000
+#define PVC_GSC_HECI2_BASE                             0x00285000
+#define _GSC_HEC_CORR_ERR_STATUS                       0x128
+#define _GSC_HEC_UNCOR_ERR_STATUS                     0x118
+#define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
+								(base) + _GSC_HEC_CORR_ERR_STATUS, \
+								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 9595e3369656..eb76b8e6a338 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -183,6 +183,28 @@ static const struct err_msg_cntr_pair err_stat_gt_correctable_vectr_reg[] = {
 	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR},
 };
 
+static const struct err_msg_cntr_pair gsc_nonfatal_err_reg[] = {
+	[0]         = {"MinuteIA Unexpected Shutdown",		XE_GSC_HW_ERR_MIA_SHUTDOWN_UNCOR},
+	[1]         = {"MinuteIA Internal Error",		XE_GSC_HW_ERR_MIA_INTERNAL_UNCOR},
+	[2]         = {"Double bit error on SRAM",		XE_GSC_HW_ERR_SRAM_UNCOR},
+	[3]         = {"WDT 2nd Timeout",			XE_GSC_HW_ERR_WDG_UNCOR},
+	[4]         = {"ROM has a parity error",		XE_GSC_HW_ERR_ROM_PARITY_UNCOR},
+	[5]         = {"Ucode has a parity error",		XE_GSC_HW_ERR_UCODE_PARITY_UNCOR},
+	[6]         = {"Errors Reported to and Detected by FW",	XE_GSC_HW_ERR_FW_UNCOR},
+	[7]         = {"Glitch is detected on voltage rail",	XE_GSC_HW_ERR_VLT_GLITCH_UNCOR},
+	[8]         = {"Fuse Pull Error",			XE_GSC_HW_ERR_FUSE_PULL_UNCOR},
+	[9]         = {"Fuse CRC Check Failed on Fuse Pull",	XE_GSC_HW_ERR_FUSE_CRC_UNCOR},
+	[10]        = {"Self Mbist Failed",			XE_GSC_HW_ERR_SELF_MBIST_UNCOR},
+	[11]        = {"AON RF has parity error",		XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR},
+	[12 ... 31] = {"Undefined",				XE_GSC_HW_ERR_UNKNOWN_UNCOR},
+};
+
+static const struct err_msg_cntr_pair gsc_correctable_err_reg[] = {
+	[0]        = {"Single bit error on SRAM",			XE_GSC_HW_ERR_SRAM_CORR},
+	[1]        = {"Errors Reported to FW and Detected by FW",	XE_GSC_HW_ERR_FW_CORR},
+	[2 ... 31] = {"Undefined",					XE_GSC_HW_ERR_UNKNOWN_CORR},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
@@ -344,6 +366,71 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
 		xe_gt_hw_error_status_reg_handler(gt, hw_err);
 }
 
+static void
+xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	const struct err_msg_cntr_pair *errstat;
+	struct xe_gt *mmio;
+	unsigned long errsrc;
+	const char *errmsg;
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
+				    "Undefined GSC %s error on tile%d\n", hw_err_str, tile->id);
+		return;
+	}
+
+	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
+		errstat = gsc_correctable_err_reg;
+	else
+		errstat = gsc_nonfatal_err_reg;
+
+	mmio = tile->primary_gt;
+	errsrc = xe_mmio_read32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err));
+	if (!errsrc) {
+		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+				    "GSC detected GSC_HEC_ERR_STAT_REG_%s blank!\n",  hw_err_str);
+		goto clear_reg;
+	}
+
+	drm_info(&tile_to_xe(tile)->drm, HW_ERR
+		 "GSC_HEC_ERR_STAT_REG_%s=0x%08lx\n", hw_err_str, errsrc);
+
+	for_each_set_bit(errbit, &errsrc, 32) {
+		errmsg = errstat[errbit].errmsg;
+		indx = errstat[errbit].cntr_indx;
+
+		if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
+			drm_warn(&tile_to_xe(tile)->drm,
+				 HW_ERR "GSC detected %s %s error, bit[%d] is set\n",
+				 errmsg, hw_err_str, errbit);
+
+		} else {
+			drm_err_ratelimited(&tile_to_xe(tile)->drm,
+					    HW_ERR "GSC detected %s %s error, bit[%d] is set\n",
+					    errmsg, hw_err_str, errbit);
+		}
+		tile->errors.count[indx]++;
+	}
+
+clear_reg:
+	xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -385,10 +472,13 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 					    HW_ERR "TILE%d detected %s %s error, bit[%d] is set\n",
 					    tile->id, errmsg, hw_err_str, errbit);
 		tile->errors.count[indx]++;
-	}
 
-	if (errsrc & REG_BIT(0))
-		xe_gt_hw_error_handler(tile->primary_gt, hw_err);
+		if (errbit == 0)
+			xe_gt_hw_error_handler(tile->primary_gt, hw_err);
+
+		if (errbit == 8)
+			xe_gsc_hw_error_handler(tile, hw_err);
+	}
 
 	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
 unlock:
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 2812407dd4bf..155722a0af4c 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -48,6 +48,22 @@ enum xe_tile_hw_errors {
 	XE_TILE_HW_ERR_GSC_CORR,
 	XE_TILE_HW_ERR_SOC_CORR,
 	XE_TILE_HW_ERR_UNKNOWN_CORR,
+	XE_GSC_HW_ERR_SRAM_CORR,
+	XE_GSC_HW_ERR_FW_CORR,
+	XE_GSC_HW_ERR_UNKNOWN_CORR,
+	XE_GSC_HW_ERR_MIA_SHUTDOWN_UNCOR,
+	XE_GSC_HW_ERR_MIA_INTERNAL_UNCOR,
+	XE_GSC_HW_ERR_SRAM_UNCOR,
+	XE_GSC_HW_ERR_WDG_UNCOR,
+	XE_GSC_HW_ERR_ROM_PARITY_UNCOR,
+	XE_GSC_HW_ERR_UCODE_PARITY_UNCOR,
+	XE_GSC_HW_ERR_FW_UNCOR,
+	XE_GSC_HW_ERR_VLT_GLITCH_UNCOR,
+	XE_GSC_HW_ERR_FUSE_PULL_UNCOR,
+	XE_GSC_HW_ERR_FUSE_CRC_UNCOR,
+	XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
+	XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
+	XE_GSC_HW_ERR_UNKNOWN_UNCOR,
 	XE_TILE_HW_ERROR_MAX,
 };
 
-- 
2.25.1

