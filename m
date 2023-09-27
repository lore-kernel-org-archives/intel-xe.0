Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0EEE810D5
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D0C10E4E9;
	Wed, 27 Sep 2023 11:40:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B5E10E4E8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814825; x=1727350825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYBLy53DDLlslLnYm+GStR8hmYo1yFv7wKdwDqD4wvk=;
 b=DTu991tV0q22jgQth+bI53T5mF5/49+5O1QU0RTmo6IMSRvIn4+3QUtR
 p/2QSkg9TQp1AtQMasQL/UcWMY1xM6ZnjMvSd2ypp2E4a8c+NR+b71A5I
 E1LDog2fW921bcC7Jj/dkVw5b2LoszIqMMxT2nkVh3i3Zmq+wzvZpQ/ZN
 FtUZHfTSUapeilHEkptP9AFWdEUH6jTUX98Alv5XVIChSfyMGRNy/ff7M
 AlI6Ruc/lmHaQjkQVcZ+5uFdUreGPGbIFPvoYjanupA5sjyEPjVMXGWSz
 7h1a95S0tzw8jY1mpRO09C609MOZUL3YAYbi4ahDOejqfr6RSKMFsw3th w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863217"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863217"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855637"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855637"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:24 +0530
Message-Id: <20230927114627.136925-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/11] drm/xe: Support SOC NONFATAL error
 handling for PVC.
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

Report the SOC nonfatal hardware error and update the counters which
will increment incase of error.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 118 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_hw_error.h |  42 +++++++++++
 2 files changed, 143 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index fa05bad5e684..aeece9e705dc 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -276,6 +276,67 @@ static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_fatal[] = {
 	[14 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
 };
 
+static const struct err_msg_cntr_pair soc_mstr_glbl_err_reg_nonfatal[] = {
+	[0]         = {"MASTER LOCAL Reported",			XE_SOC_HW_ERR_MSTR_LCL_NONFATAL},
+	[1]         = {"SLAVE GLOBAL Reported",			XE_SOC_HW_ERR_SLAVE_GLBL_NONFATAL},
+	[2]         = {"HBM SS0: Channel0",			XE_SOC_HW_ERR_HBM0_CHNL0_NONFATAL},
+	[3]         = {"HBM SS0: Channel1",			XE_SOC_HW_ERR_HBM0_CHNL1_NONFATAL},
+	[4]         = {"HBM SS0: Channel2",			XE_SOC_HW_ERR_HBM0_CHNL2_NONFATAL},
+	[5]         = {"HBM SS0: Channel3",			XE_SOC_HW_ERR_HBM0_CHNL3_NONFATAL},
+	[6]         = {"HBM SS0: Channel4",			XE_SOC_HW_ERR_HBM0_CHNL4_NONFATAL},
+	[7]         = {"HBM SS0: Channel5",			XE_SOC_HW_ERR_HBM0_CHNL5_NONFATAL},
+	[8]         = {"HBM SS0: Channel6",                     XE_SOC_HW_ERR_HBM0_CHNL6_NONFATAL},
+	[9]         = {"HBM SS0: Channel7",                     XE_SOC_HW_ERR_HBM0_CHNL7_NONFATAL},
+	[10]        = {"HBM SS1: Channel0",                     XE_SOC_HW_ERR_HBM1_CHNL0_NONFATAL},
+	[11]        = {"HBM SS1: Channel1",                     XE_SOC_HW_ERR_HBM1_CHNL1_NONFATAL},
+	[12]        = {"HBM SS1: Channel2",                     XE_SOC_HW_ERR_HBM1_CHNL2_NONFATAL},
+	[13]        = {"HBM SS1: Channel3",                     XE_SOC_HW_ERR_HBM1_CHNL3_NONFATAL},
+	[14]        = {"HBM SS1: Channel4",                     XE_SOC_HW_ERR_HBM1_CHNL4_NONFATAL},
+	[15]        = {"HBM SS1: Channel5",                     XE_SOC_HW_ERR_HBM1_CHNL5_NONFATAL},
+	[16]        = {"HBM SS1: Channel6",                     XE_SOC_HW_ERR_HBM1_CHNL6_NONFATAL},
+	[17]        = {"HBM SS1: Channel7",                     XE_SOC_HW_ERR_HBM1_CHNL7_NONFATAL},
+	[18 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_slave_glbl_err_reg_nonfatal[] = {
+	[0]         = {"SLAVE LOCAL Reported",			XE_SOC_HW_ERR_SLAVE_LCL_NONFATAL},
+	[1]         = {"HBM SS2: Channel0",			XE_SOC_HW_ERR_HBM2_CHNL0_NONFATAL},
+	[2]         = {"HBM SS2: Channel1",			XE_SOC_HW_ERR_HBM2_CHNL1_NONFATAL},
+	[3]         = {"HBM SS2: Channel2",			XE_SOC_HW_ERR_HBM2_CHNL2_NONFATAL},
+	[4]         = {"HBM SS2: Channel3",			XE_SOC_HW_ERR_HBM2_CHNL3_NONFATAL},
+	[5]         = {"HBM SS2: Channel4",			XE_SOC_HW_ERR_HBM2_CHNL4_NONFATAL},
+	[6]         = {"HBM SS2: Channel5",			XE_SOC_HW_ERR_HBM2_CHNL5_NONFATAL},
+	[7]         = {"HBM SS2: Channel6",                     XE_SOC_HW_ERR_HBM2_CHNL6_NONFATAL},
+	[8]         = {"HBM SS2: Channel7",                     XE_SOC_HW_ERR_HBM2_CHNL7_NONFATAL},
+	[9]         = {"HBM SS3: Channel0",                     XE_SOC_HW_ERR_HBM3_CHNL0_NONFATAL},
+	[10]        = {"HBM SS3: Channel1",                     XE_SOC_HW_ERR_HBM3_CHNL1_NONFATAL},
+	[11]        = {"HBM SS3: Channel2",                     XE_SOC_HW_ERR_HBM3_CHNL2_NONFATAL},
+	[12]        = {"HBM SS3: Channel3",                     XE_SOC_HW_ERR_HBM3_CHNL3_NONFATAL},
+	[13]        = {"HBM SS3: Channel4",                     XE_SOC_HW_ERR_HBM3_CHNL4_NONFATAL},
+	[14]        = {"HBM SS3: Channel5",                     XE_SOC_HW_ERR_HBM3_CHNL5_NONFATAL},
+	[15]        = {"HBM SS3: Channel6",                     XE_SOC_HW_ERR_HBM3_CHNL6_NONFATAL},
+	[16]        = {"HBM SS3: Channel7",                     XE_SOC_HW_ERR_HBM3_CHNL7_NONFATAL},
+	[18]	    = {"ANR MDFI",				XE_SOC_HW_ERR_ANR_MDFI_NONFATAL},
+	[17]        = {"Undefined",                             XE_SOC_HW_ERR_UNKNOWN_NONFATAL},
+	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_slave_lcl_err_reg_nonfatal[] = {
+	[0 ... 31]  = {"Undefined",			XE_SOC_HW_ERR_UNKNOWN_NONFATAL},
+};
+
+static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_nonfatal[] = {
+	[0 ... 3]   = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_NONFATAL},
+	[4]         = {"Base Die MDFI T2T",			XE_SOC_HW_ERR_MDFI_T2T_NONFATAL},
+	[5]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_NONFATAL},
+	[6]         = {"Base Die MDFI T2C",			XE_SOC_HW_ERR_MDFI_T2C_NONFATAL},
+	[7]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_NONFATAL},
+	[8]         = {"Invalid CSC PSF Command Parity",	XE_SOC_HW_ERR_CSC_PSF_CMD_NONFATAL},
+	[9]         = {"Invalid CSC PSF Unexpected Completion",	XE_SOC_HW_ERR_CSC_PSF_CMP_NONFATAL},
+	[10]        = {"Invalid CSC PSF Unsupported Request",	XE_SOC_HW_ERR_CSC_PSF_REQ_NONFATAL},
+	[11 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
@@ -521,18 +582,20 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 }
 
 static void
-xe_soc_log_err_update_cntr(struct xe_tile *tile,
+xe_soc_log_err_update_cntr(struct xe_tile *tile, const enum hardware_error hw_err,
 			   u32 errbit, const struct err_msg_cntr_pair *reg_info)
 {
 	const char *errmsg;
 	u32 indx;
 
+	const char *hwerr_to_str = hardware_error_type_to_str(hw_err);
+
 	errmsg = reg_info[errbit].errmsg;
 	indx = reg_info[errbit].cntr_indx;
 
 	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
-			    "Tile%d %s SOC FATAL error, bit[%d] is set\n",
-			    tile->id, errmsg, errbit);
+			    "Tile%d %s SOC %s error, bit[%d] is set\n",
+			    tile->id, hwerr_to_str, errmsg, errbit);
 	tile->errors.count[indx]++;
 }
 
@@ -540,15 +603,34 @@ static void
 xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
+
+	const struct err_msg_cntr_pair *soc_mstr_glbl_err_reg;
+	const struct err_msg_cntr_pair *soc_mstr_lcl_err_reg;
+	const struct err_msg_cntr_pair *soc_slave_glbl_err_reg;
+	const struct err_msg_cntr_pair *soc_slave_lcl_err_reg;
 	u32 errbit, base, slave_base;
 	int i;
+
+	const char *hwerr_to_str = hardware_error_type_to_str(hw_err);
 	struct xe_gt *gt = tile->primary_gt;
 
 	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
 
-	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err != HARDWARE_ERROR_FATAL)
+	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err == HARDWARE_ERROR_CORRECTABLE)
 		return;
 
+	if (hw_err == HARDWARE_ERROR_FATAL) {
+		soc_mstr_glbl_err_reg = soc_mstr_glbl_err_reg_fatal;
+		soc_mstr_lcl_err_reg = soc_mstr_lcl_err_reg_fatal;
+		soc_slave_glbl_err_reg = soc_slave_glbl_err_reg_fatal;
+		soc_slave_lcl_err_reg = soc_slave_lcl_err_reg_fatal;
+	} else if (hw_err == HARDWARE_ERROR_NONFATAL) {
+		soc_mstr_glbl_err_reg = soc_mstr_glbl_err_reg_nonfatal;
+		soc_mstr_lcl_err_reg = soc_mstr_lcl_err_reg_nonfatal;
+		soc_slave_glbl_err_reg = soc_slave_glbl_err_reg_nonfatal;
+		soc_slave_lcl_err_reg = soc_slave_lcl_err_reg_nonfatal;
+	}
+
 	base = SOC_PVC_BASE;
 	slave_base = SOC_PVC_SLAVE_BASE;
 
@@ -564,33 +646,34 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 
 	mst_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
 	drm_info(&tile_to_xe(tile)->drm, HW_ERR
-		 "Tile%d SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
-		 tile->id, mst_glb_errstat);
+		 "Tile%d SOC_GLOBAL_ERR_STAT_MASTER_REG_%s:0x%08lx\n",
+		 tile->id, hwerr_to_str, mst_glb_errstat);
 
 	if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
 		slv_glb_errstat = xe_mmio_read32(gt,
 						 SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err));
 		 drm_info(&tile_to_xe(tile)->drm, HW_ERR
-			  "Tile%d SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
-			  tile->id, slv_glb_errstat);
+			  "Tile%d SOC_GLOBAL_ERR_STAT_SLAVE_REG_%s:0x%08lx\n",
+			  tile->id, hwerr_to_str, slv_glb_errstat);
 
 		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
 			lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
 										      hw_err));
 			 drm_info(&tile_to_xe(tile)->drm, HW_ERR
-				  "Tile%d SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
-				  tile->id, lcl_errstat);
+				  "Tile%d SOC_LOCAL_ERR_STAT_SLAVE_REG_%s:0x%08lx\n",
+				  tile->id, hwerr_to_str, lcl_errstat);
 
 			for_each_set_bit(errbit, &lcl_errstat, 32)
-				xe_soc_log_err_update_cntr(tile, errbit,
-							   soc_slave_lcl_err_reg_fatal);
+				xe_soc_log_err_update_cntr(tile, hw_err, errbit,
+							   soc_slave_lcl_err_reg);
 
 			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
 					lcl_errstat);
 		}
 
 		for_each_set_bit(errbit, &slv_glb_errstat, 32)
-			xe_soc_log_err_update_cntr(tile, errbit, soc_slave_glbl_err_reg_fatal);
+			xe_soc_log_err_update_cntr(tile, errbit, hw_err,
+						   soc_slave_glbl_err_reg);
 
 		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
 				slv_glb_errstat);
@@ -598,17 +681,18 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 
 	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
 		lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
-		drm_info(&tile_to_xe(tile)->drm, HW_ERR "SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
-			 lcl_errstat);
+		drm_info(&tile_to_xe(tile)->drm, HW_ERR "Tile%d SOC_LOCAL_ERR_STAT_MASTER_REG_%s:0x%08lx\n",
+			 tile->id, hwerr_to_str, lcl_errstat);
 
 		for_each_set_bit(errbit, &lcl_errstat, 32)
-			xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_lcl_err_reg_fatal);
+			xe_soc_log_err_update_cntr(tile, hw_err, errbit,
+						   soc_mstr_lcl_err_reg);
 
 		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
 	}
 
 	for_each_set_bit(errbit, &mst_glb_errstat, 32)
-		xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_glbl_err_reg_fatal);
+		xe_soc_log_err_update_cntr(tile, errbit, hw_err, soc_mstr_glbl_err_reg);
 
 	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
 			mst_glb_errstat);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 05838e082abd..a458a90b34a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -115,6 +115,48 @@ enum xe_tile_hw_errors {
 	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
 	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
 	XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
+	XE_SOC_HW_ERR_MSTR_LCL_NONFATAL,
+	XE_SOC_HW_ERR_SLAVE_GLBL_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL0_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL1_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL2_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL3_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL4_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL5_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL6_NONFATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL7_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL0_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL1_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL2_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL3_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL4_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL5_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL6_NONFATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL7_NONFATAL,
+	XE_SOC_HW_ERR_UNKNOWN_NONFATAL,
+	XE_SOC_HW_ERR_SLAVE_LCL_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL0_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL1_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL2_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL3_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL4_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL5_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL6_NONFATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL7_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL0_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL1_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL2_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL3_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL4_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL5_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL6_NONFATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL7_NONFATAL,
+	XE_SOC_HW_ERR_ANR_MDFI_NONFATAL,
+	XE_SOC_HW_ERR_MDFI_T2T_NONFATAL,
+	XE_SOC_HW_ERR_MDFI_T2C_NONFATAL,
+	XE_SOC_HW_ERR_CSC_PSF_CMD_NONFATAL,
+	XE_SOC_HW_ERR_CSC_PSF_CMP_NONFATAL,
+	XE_SOC_HW_ERR_CSC_PSF_REQ_NONFATAL,
 	XE_TILE_HW_ERROR_MAX,
 };
 
-- 
2.25.1

