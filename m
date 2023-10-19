Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF515CDB482
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 13:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F8710E4D9;
	Thu, 19 Oct 2023 13:21:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189BE10E4E6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697721682; x=1729257682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oRqNJnC7bW4ammnkMl0W4yi3W/7dVHhCdW5ry8j42hU=;
 b=PdpXaXZiJ0RtjsrybQfi1DPdC4njeJc8kFEeO3ObvRO82R/6WylZYJjF
 +vAfow3s9npWkLP/OuGlYMwIVgc8qH7CFGl7U0YDy9pHOiqEkalCWLW62
 g9L6yYdS4HaBfzBE0hlKEzPwCugxcAlTPKb6AgFeCW4TpENhe6lMTYweY
 CV8QSc76NflH+gN5cVHRq4rHMf/1q6JoEG3g29/pRQdPV+gVPADmQ1/3M
 mJZCDiAfFgPRlnVRAikP4K/y7UdpAyS7c7qM7szyONbUN/e8RyNcWKi/B
 1tnQKBSVkJBLHhnLpsCCowMYF4GdY3TyfOzDm1pbesAOfGsSP8WbKlJe2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385124037"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="385124037"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 06:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757028209"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="757028209"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 06:19:05 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 18:55:31 +0530
Message-Id: <20231019132534.1374903-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/11] drm/xe: Support SOC NONFATAL error
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
index 084be7ddb551..7c41e51fbb11 100644
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
 void xe_assign_hw_err_regs(struct xe_device *xe)
 {
 	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
@@ -294,6 +355,10 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
 		soc_mstr_lcl[HARDWARE_ERROR_FATAL] = pvc_soc_mstr_lcl_err_reg_fatal;
 		soc_slave_glbl[HARDWARE_ERROR_FATAL] = pvc_soc_slave_glbl_err_reg_fatal;
 		soc_slave_lcl[HARDWARE_ERROR_FATAL] = pvc_soc_slave_lcl_err_reg_fatal;
+		soc_mstr_glbl[HARDWARE_ERROR_NONFATAL] = pvc_soc_mstr_glbl_err_reg_nonfatal;
+		soc_mstr_lcl[HARDWARE_ERROR_NONFATAL] = pvc_soc_mstr_lcl_err_reg_nonfatal;
+		soc_slave_glbl[HARDWARE_ERROR_NONFATAL] = pvc_soc_slave_glbl_err_reg_nonfatal;
+		soc_slave_lcl[HARDWARE_ERROR_NONFATAL] = pvc_soc_slave_lcl_err_reg_nonfatal;
 	}
 
 }
@@ -571,7 +636,10 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 
 	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
 
-	if ((tile_to_xe(tile)->info.platform != XE_PVC) ||  hw_err != HARDWARE_ERROR_FATAL)
+	if (tile_to_xe(tile)->info.platform != XE_PVC)
+		return;
+
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
 		return;
 
 	base = SOC_PVC_BASE;
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index bd380b7a7130..e53a3f0c8b67 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -105,6 +105,45 @@ enum xe_tile_hw_errors {
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
 	XE_TILE_HW_ERROR_MAX,
 };
 
-- 
2.25.1

