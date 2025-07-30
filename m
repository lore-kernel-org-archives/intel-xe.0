Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AF6C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9094210E3D2;
	Wed, 30 Jul 2025 05:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJNEvuJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9C710E035
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854583; x=1785390583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DTLZQb3qGeQ1WPUDcZONDxTc2bXqMYEUbc5PJ8j0+s=;
 b=KJNEvuJxj03voHfb4aXNc7jGACv7AEVHdTHol351DFmMAGAWAOQ9iHk3
 5iWHgw14PWEEWxDBzkCyKNP9zuAXYSH+uFzT5wyH5nvDVGONvc8HrMb1D
 xhPLilXmEddijWy9Aega+PvndSUVCeUSRnNuqytx3nc/NOgGN61DDPHlO
 RumcLVvY6ZiqlabN1OCcss/536uTvdSypqbGhNyXwcVkqtTbdkjJi9LTt
 q0X+FWUqEDc/i1mOhgjstf0HkmueiliHZx0+slRle8ydkBQWLUD3ba3Sb
 S2kjyFgimVjvRIQuiy/XFEs/ZbZSI/JIhzWFTUmPZnrcxvo6FaLRZlGme g==;
X-CSE-ConnectionGUID: 4wexPdcmSjuUZXwBFcKkLQ==
X-CSE-MsgGUID: 6Qa5UHOnQmqzHNapWHYi2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215615"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215615"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:43 -0700
X-CSE-ConnectionGUID: 9SEZVEP4RCiIsJQm022wJg==
X-CSE-MsgGUID: dnfAyJrqSsarhBE0riRvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240258"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:40 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 07/10] drm/xe: Support SOC NONFATAL error handling for PVC.
Date: Wed, 30 Jul 2025 11:18:11 +0530
Message-Id: <20250730054814.1376770-8-aravind.iddamsetty@linux.intel.com>
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

Report the SOC nonfatal hardware error and update the counters which
will increment incase of error.

v2
- Use xe_assign_hw_err_regs to initilaize registers.
- Dont use the counters if error is being reported by second level
  registers.
- Fix Num of IEH to 2.
- Follow the convention source_typeoferror_errorname for enum and error
reporting.(Aravind)

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 70 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_error.h | 39 ++++++++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 927bf2ab401f..705a670f01fc 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -260,6 +260,67 @@ static const struct err_name_index_pair pvc_soc_mstr_lcl_err_reg_fatal[] = {
 	[14 ... 31] = {"Undefined",				XE_HW_ERR_SOC_FATAL_UNKNOWN},
 };
 
+static const struct err_name_index_pair pvc_soc_mstr_glbl_err_reg_nonfatal[] = {
+	[0]         = {"MASTER LOCAL Reported",			XE_HW_ERR_TILE_UNSPEC},
+	[1]         = {"SLAVE GLOBAL Reported",			XE_HW_ERR_TILE_UNSPEC},
+	[2]         = {"HBM SS0: Channel0",			XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL0},
+	[3]         = {"HBM SS0: Channel1",			XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL1},
+	[4]         = {"HBM SS0: Channel2",			XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL2},
+	[5]         = {"HBM SS0: Channel3",			XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL3},
+	[6]         = {"HBM SS0: Channel4",			XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL4},
+	[7]         = {"HBM SS0: Channel5",			XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL5},
+	[8]         = {"HBM SS0: Channel6",                     XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL6},
+	[9]         = {"HBM SS0: Channel7",                     XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL7},
+	[10]        = {"HBM SS1: Channel0",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL0},
+	[11]        = {"HBM SS1: Channel1",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL1},
+	[12]        = {"HBM SS1: Channel2",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL2},
+	[13]        = {"HBM SS1: Channel3",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL3},
+	[14]        = {"HBM SS1: Channel4",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL4},
+	[15]        = {"HBM SS1: Channel5",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL5},
+	[16]        = {"HBM SS1: Channel6",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL6},
+	[17]        = {"HBM SS1: Channel7",                     XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL7},
+	[18 ... 31] = {"Undefined",				XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_soc_slave_glbl_err_reg_nonfatal[] = {
+	[0]         = {"SLAVE LOCAL Reported",			XE_HW_ERR_TILE_UNSPEC},
+	[1]         = {"HBM SS2: Channel0",			XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL0},
+	[2]         = {"HBM SS2: Channel1",			XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL1},
+	[3]         = {"HBM SS2: Channel2",			XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL2},
+	[4]         = {"HBM SS2: Channel3",			XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL3},
+	[5]         = {"HBM SS2: Channel4",			XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL4},
+	[6]         = {"HBM SS2: Channel5",			XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL5},
+	[7]         = {"HBM SS2: Channel6",                     XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL6},
+	[8]         = {"HBM SS2: Channel7",                     XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL7},
+	[9]         = {"HBM SS3: Channel0",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL0},
+	[10]        = {"HBM SS3: Channel1",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL1},
+	[11]        = {"HBM SS3: Channel2",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL2},
+	[12]        = {"HBM SS3: Channel3",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL3},
+	[13]        = {"HBM SS3: Channel4",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL4},
+	[14]        = {"HBM SS3: Channel5",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL5},
+	[15]        = {"HBM SS3: Channel6",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL6},
+	[16]        = {"HBM SS3: Channel7",                     XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL7},
+	[18]	    = {"ANR MDFI",				XE_HW_ERR_SOC_NONFATAL_ANR_MDFI},
+	[17]        = {"Undefined",                             XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+	[19 ... 31] = {"Undefined",				XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_soc_slave_lcl_err_reg_nonfatal[] = {
+	[0 ... 31]  = {"Undefined",			XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+};
+
+static const struct err_name_index_pair pvc_soc_mstr_lcl_err_reg_nonfatal[] = {
+	[0 ... 3]   = {"Undefined",				XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+	[4]         = {"Base Die MDFI T2T",			XE_HW_ERR_SOC_NONFATAL_MDFI_T2T},
+	[5]         = {"Undefined",				XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+	[6]         = {"Base Die MDFI T2C",			XE_HW_ERR_SOC_NONFATAL_MDFI_T2C},
+	[7]         = {"Undefined",				XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+	[8]         = {"Invalid CSC PSF Command Parity",	XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMD},
+	[9]         = {"Invalid CSC PSF Unexpected Completion",	XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMP},
+	[10]        = {"Invalid CSC PSF Unsupported Request",	XE_HW_ERR_SOC_NONFATAL_CSC_PSF_REQ},
+	[11 ... 31] = {"Undefined",				XE_HW_ERR_SOC_NONFATAL_UNKNOWN},
+};
+
 static void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
@@ -294,6 +355,10 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
 		soc_mstr_lcl[HARDWARE_ERROR_FATAL] = pvc_soc_mstr_lcl_err_reg_fatal;
 		soc_slave_glbl[HARDWARE_ERROR_FATAL] = pvc_soc_slave_glbl_err_reg_fatal;
 		soc_slave_lcl[HARDWARE_ERROR_FATAL] = pvc_soc_slave_lcl_err_reg_fatal;
+		soc_mstr_glbl[HARDWARE_ERROR_NONFATAL] = pvc_soc_mstr_glbl_err_reg_nonfatal;
+		soc_mstr_lcl[HARDWARE_ERROR_NONFATAL] = pvc_soc_mstr_lcl_err_reg_nonfatal;
+		soc_slave_glbl[HARDWARE_ERROR_NONFATAL] = pvc_soc_slave_glbl_err_reg_nonfatal;
+		soc_slave_lcl[HARDWARE_ERROR_NONFATAL] = pvc_soc_slave_lcl_err_reg_nonfatal;
 	}
 
 }
@@ -556,7 +621,10 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 
 	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
 
-	if ((tile_to_xe(tile)->info.platform != XE_PVC) ||  hw_err != HARDWARE_ERROR_FATAL)
+	if (tile_to_xe(tile)->info.platform != XE_PVC)
+		return;
+
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
 		return;
 
 	base = SOC_PVC_BASE;
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index ecd7edfcd38b..e43157aae938 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -100,6 +100,45 @@ enum xe_tile_hw_errors {
 	XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMD,
 	XE_HW_ERR_SOC_FATAL_PCIE_PSF_CMP,
 	XE_HW_ERR_SOC_FATAL_PCIE_PSF_REQ,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL0,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL1,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL2,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL3,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL4,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL5,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL6,
+	XE_HW_ERR_SOC_NONFATAL_HBM0_CHNL7,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL0,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL1,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL2,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL3,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL4,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL5,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL6,
+	XE_HW_ERR_SOC_NONFATAL_HBM1_CHNL7,
+	XE_HW_ERR_SOC_NONFATAL_UNKNOWN,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL0,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL1,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL2,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL3,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL4,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL5,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL6,
+	XE_HW_ERR_SOC_NONFATAL_HBM2_CHNL7,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL0,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL1,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL2,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL3,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL4,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL5,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL6,
+	XE_HW_ERR_SOC_NONFATAL_HBM3_CHNL7,
+	XE_HW_ERR_SOC_NONFATAL_ANR_MDFI,
+	XE_HW_ERR_SOC_NONFATAL_MDFI_T2T,
+	XE_HW_ERR_SOC_NONFATAL_MDFI_T2C,
+	XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMD,
+	XE_HW_ERR_SOC_NONFATAL_CSC_PSF_CMP,
+	XE_HW_ERR_SOC_NONFATAL_CSC_PSF_REQ,
 };
 
 enum gt_vctr_registers {
-- 
2.25.1

