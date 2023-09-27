Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F400E810D0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6B10E4EB;
	Wed, 27 Sep 2023 11:40:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF93E10E4E8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814826; x=1727350826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aV4ce3LCX35SjZA8F13pZKrLcaSabYs2xNbGEPewg1I=;
 b=Zx4k6yXgpAHCl1g3KQ2DpyTLuN0UlVrx8B7npEZQAvvNCa3Djp83wyx7
 lFpsYiA4NfxBK0/iH9yJVoRs6TK3r1Haiu9RQhS9KeMNFUgfVGGWkVvnJ
 omDVmqWRq4keNBXi10aF3UaLU0y9cOQi1Xk89EqtIe73c+QGVrlnq3ajc
 anCjItTZzyXl6apGtpjAviw2abonHu4C8RH4RGWobtzLCApGJvZnwTHIy
 s+TOAj6Re4fIs4I/xZom0t1M/xE1Mx3veWycVNnW9tEBIRdLt03FDZqhj
 afPQobrR2YzU2X9IVzKE1BsSQtbFIiUl+TvI0WEa7MgZYSi/01pach19r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863222"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863222"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855656"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855656"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:25 +0530
Message-Id: <20230927114627.136925-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/11] drm/xe: Handle MDFI error severity.
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  7 +++++++
 drivers/gpu/drm/xe/xe_hw_error.c             | 16 ++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index 04701c62f0d9..8a5f6cd29304 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -48,4 +48,11 @@
 								(base) + _SOC_GCOERRSTS, \
 								(base) + _SOC_GNFERRSTS))
 
+#define LOCAL_FIRST_IEH_HEADER_LOG_REG			XE_REG(0x2822b0)
+#define MDFI_SEVERITY_FATAL		0x00330000
+#define MDFI_SEVERITY_NONFATAL		0x00310000
+#define MDFI_SEVERITY(x)				((x) == HARDWARE_ERROR_FATAL ? \
+								MDFI_SEVERITY_FATAL : \
+								MDFI_SEVERITY_NONFATAL)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index aeece9e705dc..dcf395bd985f 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -608,7 +608,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	const struct err_msg_cntr_pair *soc_mstr_lcl_err_reg;
 	const struct err_msg_cntr_pair *soc_slave_glbl_err_reg;
 	const struct err_msg_cntr_pair *soc_slave_lcl_err_reg;
-	u32 errbit, base, slave_base;
+	u32 errbit, base, slave_base, ieh_header;
 	int i;
 
 	const char *hwerr_to_str = hardware_error_type_to_str(hw_err);
@@ -684,9 +684,21 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 		drm_info(&tile_to_xe(tile)->drm, HW_ERR "Tile%d SOC_LOCAL_ERR_STAT_MASTER_REG_%s:0x%08lx\n",
 			 tile->id, hwerr_to_str, lcl_errstat);
 
-		for_each_set_bit(errbit, &lcl_errstat, 32)
+		for_each_set_bit(errbit, &lcl_errstat, 32) {
+			if (errbit == 4 || errbit == 6) {
+				ieh_header = xe_mmio_read32(gt, LOCAL_FIRST_IEH_HEADER_LOG_REG);
+				drm_info(&tile_to_xe(tile)->drm, HW_ERR "Tile%d LOCAL_FIRST_IEH_HEADER_LOG_REG:0x%08x\n",
+					 tile->id, ieh_header);
+
+				if (ieh_header != MDFI_SEVERITY(hw_err)) {
+					lcl_errstat &= ~REG_BIT(errbit);
+					continue;
+				}
+			}
+
 			xe_soc_log_err_update_cntr(tile, hw_err, errbit,
 						   soc_mstr_lcl_err_reg);
+		}
 
 		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
 	}
-- 
2.25.1

