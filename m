Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA66FC87FCE
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8184F10E36E;
	Wed, 30 Jul 2025 05:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mtzq+W4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962BF10E035
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854581; x=1785390581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ydLiBxj3JgoaEOvqF/1wu0A3kviAxi6X+K4Fmk5syo=;
 b=Mtzq+W4E14LE3rk/C7y8HVEqG+BaK1R8GEYK615mN3kN/W5LeZGkjFF0
 PirAALJjkORBbVkkBaCE+6Kd0LtCvqiRPR7fDSt5HoWs7MsIP9txxjjR5
 9O4xNQwqc+58e5+NOj7kReh7yzuKU1Q+/VIg8btkQd6VBhY94ZVShMghp
 pxIqzC4RjW2wGElC3HmkLsIlocDwoO7yuvXEF9Su0SW8Qmks02vH54XCM
 /BGJmBt5AsTGcjCMLrntcKzPpzoLmriH6dPOPdC1fLMUNLssi+Q1WAN6Z
 aACqWGY8HiOXq1BhIE+HEpAOVUMeAjnyrtnqWWg00lsuGZW4mXlUrITdy Q==;
X-CSE-ConnectionGUID: Y5suuZXUTk+i1GxOIdzhtg==
X-CSE-MsgGUID: EPdXmzgzQYyM/g1LJu0r8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215612"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215612"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:41 -0700
X-CSE-ConnectionGUID: +DUZbZsCTTOFmCR4p8foNQ==
X-CSE-MsgGUID: uRpuiVqeRzKSqVIj30/2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240254"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:38 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 06/10] drm/xe: Support SOC FATAL error handling for PVC.
Date: Wed, 30 Jul 2025 11:18:10 +0530
Message-Id: <20250730054814.1376770-7-aravind.iddamsetty@linux.intel.com>
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

Report the SOC fatal hardware error and update the counters which will
increment incase of error.

v2
- Use xe_assign_hw_err_regs to initilaize registers.
- Use separate enums for SOC errors.
- Use xarray.
- No need to prepend register offsets with 0's.
- Dont use the counters if error is being reported by second level
  registers.
- Fix Num of IEH to 2.
- define the bits along with respective register and use.
- Follow the convention source_typeoferror_errorname for enum and error
reporting.(Aravind)

v3
- Fix the condition check.

v4
- Make soc errors as part of tile_hw_errors.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  32 ++++
 drivers/gpu/drm/xe/xe_device_types.h         |   4 +
 drivers/gpu/drm/xe/xe_hw_error.c             | 188 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             |  49 +++++
 4 files changed, 273 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index 3ab28b321622..31604138d511 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -11,6 +11,34 @@
 #define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
 								(base) + _GSC_HEC_CORR_ERR_STATUS, \
 								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
+#define _SOC_GCOERRSTS		                       0x200
+#define _SOC_GNFERRSTS		                       0x210
+#define _SOC_GFAERRSTS		                       0x220
+#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))
+#define   SOC_IEH1_LOCAL_ERR_STATUS                    0
+
+#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))
+#define   SOC_IEH0_LOCAL_ERR_STATUS                    0
+#define   SOC_IEH1_GLOBAL_ERR_STATUS                   1
+
+#define _SOC_GSYSEVTCTL		                       0x264
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GSYSEVTCTL, \
+								slave_base + _SOC_GSYSEVTCTL))
+
+#define _SOC_LERRCORSTS		                       0x294
+#define _SOC_LERRUNCSTS		                       0x280
+#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)
+#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)
+
 
 #define _DEV_ERR_STAT_NONFATAL                         0x100178
 #define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
@@ -19,6 +47,10 @@
 								_DEV_ERR_STAT_NONFATAL))
 #define   XE_GT_ERROR				       0
 #define   XE_GSC_ERROR				       8
+#define   XE_SOC_ERROR                                 16
+
+#define SOC_PVC_BASE	                               0x282000
+#define SOC_PVC_SLAVE_BASE                             0x283000
 
 #define PVC_GSC_HECI1_BASE                             0x284000
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5d5a730688d3..3a851c7a55dd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -587,6 +587,10 @@ struct xe_device {
 		const struct err_name_index_pair *err_stat_gt[HARDWARE_ERROR_MAX];
 		const struct err_name_index_pair *err_vctr_gt[HARDWARE_ERROR_MAX];
 		const struct err_name_index_pair *gsc_error[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *soc_mstr_glbl[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *soc_mstr_lcl[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *soc_slave_glbl[HARDWARE_ERROR_MAX];
+		const struct err_name_index_pair *soc_slave_lcl[HARDWARE_ERROR_MAX];
 	} hw_err_regs;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 2aff84339534..927bf2ab401f 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -191,12 +191,85 @@ static const struct err_name_index_pair pvc_gsc_correctable_err_reg[] = {
 	[2 ... 31] = {"Undefined",				XE_HW_ERR_GSC_CORR_UNKNOWN},
 };
 
+static const struct err_name_index_pair pvc_soc_mstr_glbl_err_reg_fatal[] = {
+	[0]         = {"MASTER LOCAL Reported",			XE_HW_ERR_TILE_UNSPEC},
+	[1]         = {"SLAVE GLOBAL Reported",			XE_HW_ERR_TILE_UNSPEC},
+	[2]         = {"HBM SS0: Channel0",			XE_HW_ERR_SOC_FATAL_HBM0_CHNL0},
+	[3]         = {"HBM SS0: Channel1",			XE_HW_ERR_SOC_FATAL_HBM0_CHNL1},
+	[4]         = {"HBM SS0: Channel2",			XE_HW_ERR_SOC_FATAL_HBM0_CHNL2},
+	[5]         = {"HBM SS0: Channel3",			XE_HW_ERR_SOC_FATAL_HBM0_CHNL3},
+	[6]         = {"HBM SS0: Channel4",			XE_HW_ERR_SOC_FATAL_HBM0_CHNL4},
+	[7]         = {"HBM SS0: Channel5",			XE_HW_ERR_SOC_FATAL_HBM0_CHNL5},
+	[8]         = {"HBM SS0: Channel6",                     XE_HW_ERR_SOC_FATAL_HBM0_CHNL6},
+	[9]         = {"HBM SS0: Channel7",                     XE_HW_ERR_SOC_FATAL_HBM0_CHNL7},
+	[10]        = {"HBM SS1: Channel0",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL0},
+	[11]        = {"HBM SS1: Channel1",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL1},
+	[12]        = {"HBM SS1: Channel2",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL2},
+	[13]        = {"HBM SS1: Channel3",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL3},
+	[14]        = {"HBM SS1: Channel4",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL4},
+	[15]        = {"HBM SS1: Channel5",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL5},
+	[16]        = {"HBM SS1: Channel6",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL6},
+	[17]        = {"HBM SS1: Channel7",                     XE_HW_ERR_SOC_FATAL_HBM1_CHNL7},
+	[18]	    = {"PUNIT",					XE_HW_ERR_SOC_FATAL_PUNIT},
+	[19 ... 31] = {"Undefined",				XE_HW_ERR_SOC_FATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_soc_slave_glbl_err_reg_fatal[] = {
+	[0]         = {"SLAVE LOCAL Reported",			XE_HW_ERR_TILE_UNSPEC},
+	[1]         = {"HBM SS2: Channel0",			XE_HW_ERR_SOC_FATAL_HBM2_CHNL0},
+	[2]         = {"HBM SS2: Channel1",			XE_HW_ERR_SOC_FATAL_HBM2_CHNL1},
+	[3]         = {"HBM SS2: Channel2",			XE_HW_ERR_SOC_FATAL_HBM2_CHNL2},
+	[4]         = {"HBM SS2: Channel3",			XE_HW_ERR_SOC_FATAL_HBM2_CHNL3},
+	[5]         = {"HBM SS2: Channel4",			XE_HW_ERR_SOC_FATAL_HBM2_CHNL4},
+	[6]         = {"HBM SS2: Channel5",			XE_HW_ERR_SOC_FATAL_HBM2_CHNL5},
+	[7]         = {"HBM SS2: Channel6",                     XE_HW_ERR_SOC_FATAL_HBM2_CHNL6},
+	[8]         = {"HBM SS2: Channel7",                     XE_HW_ERR_SOC_FATAL_HBM2_CHNL7},
+	[9]         = {"HBM SS3: Channel0",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL0},
+	[10]        = {"HBM SS3: Channel1",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL1},
+	[11]        = {"HBM SS3: Channel2",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL2},
+	[12]        = {"HBM SS3: Channel3",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL3},
+	[13]        = {"HBM SS3: Channel4",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL4},
+	[14]        = {"HBM SS3: Channel5",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL5},
+	[15]        = {"HBM SS3: Channel6",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL6},
+	[16]        = {"HBM SS3: Channel7",                     XE_HW_ERR_SOC_FATAL_HBM3_CHNL7},
+	[18]	    = {"ANR MDFI",				XE_HW_ERR_SOC_FATAL_ANR_MDFI},
+	[17]        = {"Undefined",                             XE_HW_ERR_SOC_FATAL_UNKNOWN},
+	[19 ... 31] = {"Undefined",				XE_HW_ERR_SOC_FATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_soc_slave_lcl_err_reg_fatal[] = {
+	[0]         = {"Local IEH Internal: Malformed PCIe AER",     XE_HW_ERR_SOC_FATAL_PCIE_AER},
+	[1]         = {"Local IEH Internal: Malformed PCIe ERR",     XE_HW_ERR_SOC_FATAL_PCIE_ERR},
+	[2]         = {"Local IEH Internal: UR CONDITIONS IN IEH",   XE_HW_ERR_SOC_FATAL_UR_COND},
+	[3]         = {"Local IEH Internal: FROM SERR SOURCES",      XE_HW_ERR_SOC_FATAL_SERR_SRCS},
+	[4 ... 31]  = {"Undefined",				     XE_HW_ERR_SOC_FATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_soc_mstr_lcl_err_reg_fatal[] = {
+	[0 ... 3]   = {"Undefined",				XE_HW_ERR_SOC_FATAL_UNKNOWN},
+	[4]         = {"Base Die MDFI T2T",			XE_HW_ERR_SOC_FATAL_MDFI_T2T},
+	[5]         = {"Undefined",				XE_HW_ERR_SOC_FATAL_UNKNOWN},
+	[6]         = {"Base Die MDFI T2C",			XE_HW_ERR_SOC_FATAL_MDFI_T2C},
+	[7]         = {"Undefined",				XE_HW_ERR_SOC_FATAL_UNKNOWN},
+	[8]         = {"Invalid CSC PSF Command Parity",	XE_HW_ERR_SOC_FATAL_CSC_PSF_CMD},
+	[9]         = {"Invalid CSC PSF Unexpected Completion",	XE_HW_ERR_SOC_FATAL_CSC_PSF_CMP},
+	[10]        = {"Invalid CSC PSF Unsupported Request",	XE_HW_ERR_SOC_FATAL_CSC_PSF_REQ},
+	[11]        = {"Invalid PCIe PSF Command Parity",	XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMD},
+	[12]        = {"PCIe PSF Unexpected Completion",	XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMP},
+	[13]        = {"PCIe PSF Unsupported Request",		XE_HW_ERR_SOC_FATAL_PCIE_PSF_REQ},
+	[14 ... 31] = {"Undefined",				XE_HW_ERR_SOC_FATAL_UNKNOWN},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
 	const struct err_name_index_pair **err_stat_gt = xe->hw_err_regs.err_stat_gt;
 	const struct err_name_index_pair **err_vctr_gt = xe->hw_err_regs.err_vctr_gt;
 	const struct err_name_index_pair **gsc_error = xe->hw_err_regs.gsc_error;
+	const struct err_name_index_pair **soc_mstr_glbl = xe->hw_err_regs.soc_mstr_glbl;
+	const struct err_name_index_pair **soc_mstr_lcl = xe->hw_err_regs.soc_mstr_lcl;
+	const struct err_name_index_pair **soc_slave_glbl = xe->hw_err_regs.soc_slave_glbl;
+	const struct err_name_index_pair **soc_slave_lcl = xe->hw_err_regs.soc_slave_lcl;
 
 	/* Error reporting is supported only for DG2 and PVC currently. */
 	if (xe->info.platform == XE_DG2) {
@@ -217,6 +290,10 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
 		err_vctr_gt[HARDWARE_ERROR_FATAL] = pvc_err_vectr_gt_fatal_reg;
 		gsc_error[HARDWARE_ERROR_CORRECTABLE] = pvc_gsc_correctable_err_reg;
 		gsc_error[HARDWARE_ERROR_NONFATAL] = pvc_gsc_nonfatal_err_reg;
+		soc_mstr_glbl[HARDWARE_ERROR_FATAL] = pvc_soc_mstr_glbl_err_reg_fatal;
+		soc_mstr_lcl[HARDWARE_ERROR_FATAL] = pvc_soc_mstr_lcl_err_reg_fatal;
+		soc_slave_glbl[HARDWARE_ERROR_FATAL] = pvc_soc_slave_glbl_err_reg_fatal;
+		soc_slave_lcl[HARDWARE_ERROR_FATAL] = pvc_soc_slave_lcl_err_reg_fatal;
 	}
 
 }
@@ -447,6 +524,114 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	xe_mmio_write32(&gt->tile->mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
 }
 
+static void
+xe_soc_log_err_update_cntr(struct xe_tile *tile, const enum hardware_error hw_err,
+			   u32 errbit, const struct err_name_index_pair *reg_info)
+{
+	const char *name;
+	u32 indx;
+
+	const char *hwerr_to_str = hardware_error_type_to_str(hw_err);
+
+	name = reg_info[errbit].name;
+	indx = reg_info[errbit].index;
+
+	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+			    "Tile%d reported SOC %s %s error, bit[%d] is set\n",
+			    tile->id, name, hwerr_to_str, errbit);
+
+	if (indx != XE_HW_ERR_TILE_UNSPEC)
+		xe_update_hw_error_cnt(&tile_to_xe(tile)->drm, &tile->errors.hw_error, indx);
+}
+
+static void
+xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
+	struct hardware_errors_regs *err_regs;
+	u32 errbit, base, slave_base;
+	int i;
+
+	struct xe_gt *gt = tile->primary_gt;
+
+	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
+
+	if ((tile_to_xe(tile)->info.platform != XE_PVC) ||  hw_err != HARDWARE_ERROR_FATAL)
+		return;
+
+	base = SOC_PVC_BASE;
+	slave_base = SOC_PVC_SLAVE_BASE;
+	err_regs = &tile_to_xe(tile)->hw_err_regs;
+
+	/*
+	 * Mask error type in GSYSEVTCTL so that no new errors of the type
+	 * will be reported. Read the master global IEH error register if
+	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
+	 * global error register is set then process the corresponding
+	 * Local error registers
+	 */
+	for (i = 0; i < XE_SOC_NUM_IEH; i++)
+		xe_mmio_write32(&gt->tile->mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));
+
+	mst_glb_errstat = xe_mmio_read32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
+	drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
+		 "Tile%d reported SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
+		 tile->id, mst_glb_errstat);
+
+	if (mst_glb_errstat & REG_BIT(SOC_IEH1_GLOBAL_ERR_STATUS)) {
+		slv_glb_errstat = xe_mmio_read32(&gt->tile->mmio,
+						 SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err));
+		 drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
+			  "Tile%d reported SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+			  tile->id, slv_glb_errstat);
+
+		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
+			lcl_errstat = xe_mmio_read32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
+										      hw_err));
+			 drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
+				  "Tile%d reported SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+				  tile->id, lcl_errstat);
+
+			for_each_set_bit(errbit, &lcl_errstat, XE_RAS_REG_SIZE)
+				xe_soc_log_err_update_cntr(tile, hw_err, errbit,
+							   err_regs->soc_slave_lcl[hw_err]);
+
+			xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+					lcl_errstat);
+		}
+
+		for_each_set_bit(errbit, &slv_glb_errstat, XE_RAS_REG_SIZE)
+			xe_soc_log_err_update_cntr(tile, hw_err, errbit,
+						   err_regs->soc_slave_glbl[hw_err]);
+
+		xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+				slv_glb_errstat);
+	}
+
+	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
+		lcl_errstat = xe_mmio_read32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
+		drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
+			"Tile%d reported SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
+			tile->id, lcl_errstat);
+
+		for_each_set_bit(errbit, &lcl_errstat, XE_RAS_REG_SIZE)
+			xe_soc_log_err_update_cntr(tile, hw_err, errbit,
+						   err_regs->soc_mstr_lcl[hw_err]);
+
+		xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
+	}
+
+	for_each_set_bit(errbit, &mst_glb_errstat, XE_RAS_REG_SIZE)
+		xe_soc_log_err_update_cntr(tile, hw_err, errbit, err_regs->soc_mstr_glbl[hw_err]);
+
+	xe_mmio_write32(&gt->tile->mmio, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
+			mst_glb_errstat);
+
+	for (i = 0; i < XE_SOC_NUM_IEH; i++)
+		xe_mmio_write32(&gt->tile->mmio, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+				(HARDWARE_ERROR_MAX << 1) + 1);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -502,6 +687,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 
 		if (errbit == XE_GSC_ERROR)
 			xe_gsc_hw_error_handler(tile, hw_err);
+
+		if (errbit == XE_SOC_ERROR)
+			xe_soc_hw_error_handler(tile, hw_err);
 	}
 
 	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 20036a523963..ecd7edfcd38b 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -12,6 +12,8 @@
 
 #define ERR_STAT_GT_VCTR_LEN (8)
 
+#define XE_SOC_NUM_IEH 2
+
 /* Error categories reported by hardware */
 enum hardware_error {
 	HARDWARE_ERROR_CORRECTABLE = 0,
@@ -51,6 +53,53 @@ enum xe_tile_hw_errors {
 	XE_HW_ERR_GSC_NONFATAL_SELF_MBIST,
 	XE_HW_ERR_GSC_NONFATAL_AON_RF_PARITY,
 	XE_HW_ERR_GSC_NONFATAL_UNKNOWN,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL0,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL1,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL2,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL3,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL4,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL5,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL6,
+	XE_HW_ERR_SOC_FATAL_HBM0_CHNL7,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL0,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL1,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL2,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL3,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL4,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL5,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL6,
+	XE_HW_ERR_SOC_FATAL_HBM1_CHNL7,
+	XE_HW_ERR_SOC_FATAL_PUNIT,
+	XE_HW_ERR_SOC_FATAL_UNKNOWN,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL0,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL1,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL2,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL3,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL4,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL5,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL6,
+	XE_HW_ERR_SOC_FATAL_HBM2_CHNL7,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL0,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL1,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL2,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL3,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL4,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL5,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL6,
+	XE_HW_ERR_SOC_FATAL_HBM3_CHNL7,
+	XE_HW_ERR_SOC_FATAL_ANR_MDFI,
+	XE_HW_ERR_SOC_FATAL_PCIE_AER,
+	XE_HW_ERR_SOC_FATAL_PCIE_ERR,
+	XE_HW_ERR_SOC_FATAL_UR_COND,
+	XE_HW_ERR_SOC_FATAL_SERR_SRCS,
+	XE_HW_ERR_SOC_FATAL_MDFI_T2T,
+	XE_HW_ERR_SOC_FATAL_MDFI_T2C,
+	XE_HW_ERR_SOC_FATAL_CSC_PSF_CMD,
+	XE_HW_ERR_SOC_FATAL_CSC_PSF_CMP,
+	XE_HW_ERR_SOC_FATAL_CSC_PSF_REQ,
+	XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMD,
+	XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMP,
+	XE_HW_ERR_SOC_FATAL_PCIE_PSF_REQ,
 };
 
 enum gt_vctr_registers {
-- 
2.25.1

