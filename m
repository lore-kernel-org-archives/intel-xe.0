Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D420E810D2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6603410E4DB;
	Wed, 27 Sep 2023 11:40:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB50410E4E4
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814823; x=1727350823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6PB19s4ABPTpEeHLoVwhFWv/GJLuclr6oYdutIBUyvI=;
 b=OaiWJug+DEXljh1Hr7eeTz60JXd4nENwvHoz8iToiIKsEUlnu5TSQA8X
 cyyWQXgPuoA9pTtXQBfYVsmX6ACijWJB/1U7tpZowRjBlCuzFrCc88UPb
 nO4sfLcKrfGeYC/VPSpJX3W52bq/eVu+tzWOUDxMyocYd4upvBb/9Tsod
 ed6OGTZb4z3T1vRwpJt7oqfWSX+folsz41LcdAexhvm1Uzk2Rm4CyT6LB
 Tp0anJsdwG4QwxEp1oVtlD4bgCjP5UN5ocn1Fw/nZlYHqoPs8fHlqP99x
 MqKdXIWOa4Ca51qDDINFxI/eILHJuDPPh1e4nv6Sw+qEYxhdj+3mIRewc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863209"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855617"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855617"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:23 +0530
Message-Id: <20230927114627.136925-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/11] drm/xe: Support SOC FATAL error handling
 for PVC.
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

Report the SOC fatal hardware error and update the counters which will
increment incase of error.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  28 +++
 drivers/gpu/drm/xe/xe_hw_error.c             | 170 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h             |  58 ++++++-
 3 files changed, 254 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index fa16eaf9436b..04701c62f0d9 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -20,4 +20,32 @@
 #define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
 								(base) + _GSC_HEC_CORR_ERR_STATUS, \
 								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
+#define SOC_PVC_BASE	               0x00282000
+#define SOC_PVC_SLAVE_BASE             0x00283000
+
+#define _SOC_LERRCORSTS		       0x000294
+#define _SOC_LERRUNCSTS		       0x000280
+#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)
+
+#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
+								(base) + _SOC_LERRUNCSTS : \
+								(base) + _SOC_LERRCORSTS)
+#define _SOC_GSYSEVTCTL		        0x000264
+
+#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GSYSEVTCTL, \
+								slave_base + _SOC_GSYSEVTCTL))
+#define _SOC_GCOERRSTS		        0x000200
+#define _SOC_GNFERRSTS		        0x000210
+#define _SOC_GFAERRSTS		        0x000220
+#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))
+
+#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
+								(base) + _SOC_GCOERRSTS, \
+								(base) + _SOC_GNFERRSTS))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 76ae12df013c..fa05bad5e684 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -207,6 +207,75 @@ static const struct err_msg_cntr_pair gsc_correctable_err_reg[] = {
 	[2 ... 31] = {"Undefined",					XE_GSC_HW_ERR_UNKNOWN_CORR},
 };
 
+static const struct err_msg_cntr_pair soc_mstr_glbl_err_reg_fatal[] = {
+	[0]         = {"MASTER LOCAL Reported",			XE_SOC_HW_ERR_MSTR_LCL_FATAL},
+	[1]         = {"SLAVE GLOBAL Reported",			XE_SOC_HW_ERR_SLAVE_GLBL_FATAL},
+	[2]         = {"HBM SS0: Channel0",			XE_SOC_HW_ERR_HBM0_CHNL0_FATAL},
+	[3]         = {"HBM SS0: Channel1",			XE_SOC_HW_ERR_HBM0_CHNL1_FATAL},
+	[4]         = {"HBM SS0: Channel2",			XE_SOC_HW_ERR_HBM0_CHNL2_FATAL},
+	[5]         = {"HBM SS0: Channel3",			XE_SOC_HW_ERR_HBM0_CHNL3_FATAL},
+	[6]         = {"HBM SS0: Channel4",			XE_SOC_HW_ERR_HBM0_CHNL4_FATAL},
+	[7]         = {"HBM SS0: Channel5",			XE_SOC_HW_ERR_HBM0_CHNL5_FATAL},
+	[8]         = {"HBM SS0: Channel6",                     XE_SOC_HW_ERR_HBM0_CHNL6_FATAL},
+	[9]         = {"HBM SS0: Channel7",                     XE_SOC_HW_ERR_HBM0_CHNL7_FATAL},
+	[10]        = {"HBM SS1: Channel0",                     XE_SOC_HW_ERR_HBM1_CHNL0_FATAL},
+	[11]        = {"HBM SS1: Channel1",                     XE_SOC_HW_ERR_HBM1_CHNL1_FATAL},
+	[12]        = {"HBM SS1: Channel2",                     XE_SOC_HW_ERR_HBM1_CHNL2_FATAL},
+	[13]        = {"HBM SS1: Channel3",                     XE_SOC_HW_ERR_HBM1_CHNL3_FATAL},
+	[14]        = {"HBM SS1: Channel4",                     XE_SOC_HW_ERR_HBM1_CHNL4_FATAL},
+	[15]        = {"HBM SS1: Channel5",                     XE_SOC_HW_ERR_HBM1_CHNL5_FATAL},
+	[16]        = {"HBM SS1: Channel6",                     XE_SOC_HW_ERR_HBM1_CHNL6_FATAL},
+	[17]        = {"HBM SS1: Channel7",                     XE_SOC_HW_ERR_HBM1_CHNL7_FATAL},
+	[18]	    = {"PUNIT",					XE_SOC_HW_ERR_PUNIT_FATAL},
+	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_slave_glbl_err_reg_fatal[] = {
+	[0]         = {"SLAVE LOCAL Reported",			XE_SOC_HW_ERR_SLAVE_LCL_FATAL},
+	[1]         = {"HBM SS2: Channel0",			XE_SOC_HW_ERR_HBM2_CHNL0_FATAL},
+	[2]         = {"HBM SS2: Channel1",			XE_SOC_HW_ERR_HBM2_CHNL1_FATAL},
+	[3]         = {"HBM SS2: Channel2",			XE_SOC_HW_ERR_HBM2_CHNL2_FATAL},
+	[4]         = {"HBM SS2: Channel3",			XE_SOC_HW_ERR_HBM2_CHNL3_FATAL},
+	[5]         = {"HBM SS2: Channel4",			XE_SOC_HW_ERR_HBM2_CHNL4_FATAL},
+	[6]         = {"HBM SS2: Channel5",			XE_SOC_HW_ERR_HBM2_CHNL5_FATAL},
+	[7]         = {"HBM SS2: Channel6",                     XE_SOC_HW_ERR_HBM2_CHNL6_FATAL},
+	[8]         = {"HBM SS2: Channel7",                     XE_SOC_HW_ERR_HBM2_CHNL7_FATAL},
+	[9]         = {"HBM SS3: Channel0",                     XE_SOC_HW_ERR_HBM3_CHNL0_FATAL},
+	[10]        = {"HBM SS3: Channel1",                     XE_SOC_HW_ERR_HBM3_CHNL1_FATAL},
+	[11]        = {"HBM SS3: Channel2",                     XE_SOC_HW_ERR_HBM3_CHNL2_FATAL},
+	[12]        = {"HBM SS3: Channel3",                     XE_SOC_HW_ERR_HBM3_CHNL3_FATAL},
+	[13]        = {"HBM SS3: Channel4",                     XE_SOC_HW_ERR_HBM3_CHNL4_FATAL},
+	[14]        = {"HBM SS3: Channel5",                     XE_SOC_HW_ERR_HBM3_CHNL5_FATAL},
+	[15]        = {"HBM SS3: Channel6",                     XE_SOC_HW_ERR_HBM3_CHNL6_FATAL},
+	[16]        = {"HBM SS3: Channel7",                     XE_SOC_HW_ERR_HBM3_CHNL7_FATAL},
+	[18]	    = {"ANR MDFI",				XE_SOC_HW_ERR_ANR_MDFI_FATAL},
+	[17]        = {"Undefined",                             XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_slave_lcl_err_reg_fatal[] = {
+	[0]         = {"Local IEH Internal: Malformed PCIe AER",     XE_SOC_HW_ERR_PCIE_AER_FATAL},
+	[1]         = {"Local IEH Internal: Malformed PCIe ERR",     XE_SOC_HW_ERR_PCIE_ERR_FATAL},
+	[2]         = {"Local IEH Internal: UR CONDITIONS IN IEH",   XE_SOC_HW_ERR_UR_COND_FATAL},
+	[3]         = {"Local IEH Internal: FROM SERR SOURCES",      XE_SOC_HW_ERR_SERR_SRCS_FATAL},
+	[4 ... 31]  = {"Undefined",				     XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
+static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_fatal[] = {
+	[0 ... 3]   = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[4]         = {"Base Die MDFI T2T",			XE_SOC_HW_ERR_MDFI_T2T_FATAL},
+	[5]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[6]         = {"Base Die MDFI T2C",			XE_SOC_HW_ERR_MDFI_T2C_FATAL},
+	[7]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+	[8]         = {"Invalid CSC PSF Command Parity",	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL},
+	[9]         = {"Invalid CSC PSF Unexpected Completion",	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL},
+	[10]        = {"Invalid CSC PSF Unsupported Request",	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL},
+	[11]        = {"Invalid PCIe PSF Command Parity",	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL},
+	[12]        = {"PCIe PSF Unexpected Completion",	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL},
+	[13]        = {"PCIe PSF Unsupported Request",		XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL},
+	[14 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
@@ -451,6 +520,104 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
 }
 
+static void
+xe_soc_log_err_update_cntr(struct xe_tile *tile,
+			   u32 errbit, const struct err_msg_cntr_pair *reg_info)
+{
+	const char *errmsg;
+	u32 indx;
+
+	errmsg = reg_info[errbit].errmsg;
+	indx = reg_info[errbit].cntr_indx;
+
+	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
+			    "Tile%d %s SOC FATAL error, bit[%d] is set\n",
+			    tile->id, errmsg, errbit);
+	tile->errors.count[indx]++;
+}
+
+static void
+xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
+{
+	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
+	u32 errbit, base, slave_base;
+	int i;
+	struct xe_gt *gt = tile->primary_gt;
+
+	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
+
+	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err != HARDWARE_ERROR_FATAL)
+		return;
+
+	base = SOC_PVC_BASE;
+	slave_base = SOC_PVC_SLAVE_BASE;
+
+	/*
+	 * Mask error type in GSYSEVTCTL so that no new errors of the type
+	 * will be reported. Read the master global IEH error register if
+	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
+	 * global error register is set then process the corresponding
+	 * Local error registers
+	 */
+	for (i = 0; i < PVC_NUM_IEH; i++)
+		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));
+
+	mst_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
+	drm_info(&tile_to_xe(tile)->drm, HW_ERR
+		 "Tile%d SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
+		 tile->id, mst_glb_errstat);
+
+	if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
+		slv_glb_errstat = xe_mmio_read32(gt,
+						 SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err));
+		 drm_info(&tile_to_xe(tile)->drm, HW_ERR
+			  "Tile%d SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+			  tile->id, slv_glb_errstat);
+
+		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
+			lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
+										      hw_err));
+			 drm_info(&tile_to_xe(tile)->drm, HW_ERR
+				  "Tile%d SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
+				  tile->id, lcl_errstat);
+
+			for_each_set_bit(errbit, &lcl_errstat, 32)
+				xe_soc_log_err_update_cntr(tile, errbit,
+							   soc_slave_lcl_err_reg_fatal);
+
+			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+					lcl_errstat);
+		}
+
+		for_each_set_bit(errbit, &slv_glb_errstat, 32)
+			xe_soc_log_err_update_cntr(tile, errbit, soc_slave_glbl_err_reg_fatal);
+
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+				slv_glb_errstat);
+	}
+
+	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
+		lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
+		drm_info(&tile_to_xe(tile)->drm, HW_ERR "SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
+			 lcl_errstat);
+
+		for_each_set_bit(errbit, &lcl_errstat, 32)
+			xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_lcl_err_reg_fatal);
+
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
+	}
+
+	for_each_set_bit(errbit, &mst_glb_errstat, 32)
+		xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_glbl_err_reg_fatal);
+
+	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
+			mst_glb_errstat);
+
+	for (i = 0; i < PVC_NUM_IEH; i++)
+		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+				(HARDWARE_ERROR_MAX << 1) + 1);
+}
+
 static void
 xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
@@ -498,6 +665,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
 
 		if (errbit == 8)
 			xe_gsc_hw_error_handler(tile, hw_err);
+
+		if (errbit == 16)
+			xe_soc_hw_error_handler(tile, hw_err);
 	}
 
 	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index ee7705b3343b..05838e082abd 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -65,6 +65,56 @@ enum xe_tile_hw_errors {
 	XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
 	XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
 	XE_GSC_HW_ERR_UNKNOWN_UNCOR,
+	XE_SOC_HW_ERR_MSTR_LCL_FATAL,
+	XE_SOC_HW_ERR_SLAVE_GLBL_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM0_CHNL7_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM1_CHNL7_FATAL,
+	XE_SOC_HW_ERR_PUNIT_FATAL,
+	XE_SOC_HW_ERR_UNKNOWN_FATAL,
+	XE_SOC_HW_ERR_SLAVE_LCL_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM2_CHNL7_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL0_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL1_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL2_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL3_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL4_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL5_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL6_FATAL,
+	XE_SOC_HW_ERR_HBM3_CHNL7_FATAL,
+	XE_SOC_HW_ERR_ANR_MDFI_FATAL,
+	XE_SOC_HW_ERR_PCIE_AER_FATAL,
+	XE_SOC_HW_ERR_PCIE_ERR_FATAL,
+	XE_SOC_HW_ERR_UR_COND_FATAL,
+	XE_SOC_HW_ERR_SERR_SRCS_FATAL,
+	XE_SOC_HW_ERR_MDFI_T2T_FATAL,
+	XE_SOC_HW_ERR_MDFI_T2C_FATAL,
+	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL,
+	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL,
+	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL,
+	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
+	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
+	XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
 	XE_TILE_HW_ERROR_MAX,
 };
 
@@ -109,8 +159,12 @@ enum xe_gt_hw_errors {
 	XE_GT_HW_ERROR_MAX,
 };
 
-#define ERR_STAT_GT_COR_VCTR_LEN (4)
-#define ERR_STAT_GT_FATAL_VCTR_LEN (8)
+#define ERR_STAT_GT_COR_VCTR_LEN	(4)
+#define ERR_STAT_GT_FATAL_VCTR_LEN	(8)
+#define PVC_NUM_IEH			(1)
+#define SOC_SLAVE_IEH                   (1)
+#define SOC_IEH0_LOCAL_ERR_STATUS       (0)
+#define SOC_IEH1_LOCAL_ERR_STATUS       (0)
 
 struct err_msg_cntr_pair {
 	const char *errmsg;
-- 
2.25.1

