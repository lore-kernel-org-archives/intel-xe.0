Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29CDE810D4
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8434110E4E4;
	Wed, 27 Sep 2023 11:40:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720B810E4E8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695814828; x=1727350828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDxVNlKzoThCdA+tpG5fdvkv6ttYchrFrNiAJtfBmtQ=;
 b=nrvy+1i4/mvGrwaL12tIxsFXE6Pm7b6KITMv86Bs0wfBKNH0wSq/u7S3
 qHaxjHCxS7oIbuzD2j8yZXIifParAl9eYNvBw5GmhvwY3Nn0CvVA8B6RS
 dqJLm1NK3jZRLBE9tl0lTfakRqwkNxjuQrVzxfB60qAk+8BMUBaF4XdK8
 rdaqsTKxHJ5TJuVGt6hGRLGJDqJs+PCxk4nV3SUG9nLyBC35Ub8ECbpWX
 C6UxM31F9yeetsitTccViX4g2/Tit8v0R5lAUMNOb0rjpDyMvaWlZywaS
 ypfx5KW2Okvuu4Yi/qr1mNaIO+uhy6ybOm/P0Ghco2a4oOubc32Bm1t6w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366863226"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="366863226"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872855672"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872855672"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 04:40:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 17:16:26 +0530
Message-Id: <20230927114627.136925-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 10/11] drm/xe: Clear SOC CORRECTABLE error
 registers.
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

PVC doesn't support correctable SOC errors, if we receive MSI due to
correctable error, classify them as Undefined and clear the registers.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index dcf395bd985f..0bcb1bea7ffb 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -616,9 +616,30 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 
 	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
 
-	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err == HARDWARE_ERROR_CORRECTABLE)
+	if ((tile_to_xe(tile)->info.platform != XE_PVC))
 		return;
 
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
+		for (i = 0; i < PVC_NUM_IEH; i++)
+			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
+					~REG_BIT(hw_err));
+
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+				REG_GENMASK(31, 0));
+		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
+				REG_GENMASK(31, 0));
+
+		drm_info(&tile_to_xe(tile)->drm, HW_ERR
+			  "Tile%d Undefine SOC %s error.",
+			  tile->id, hwerr_to_str);
+
+		goto unmask_gsysevtctl;
+	}
+
 	if (hw_err == HARDWARE_ERROR_FATAL) {
 		soc_mstr_glbl_err_reg = soc_mstr_glbl_err_reg_fatal;
 		soc_mstr_lcl_err_reg = soc_mstr_lcl_err_reg_fatal;
@@ -709,6 +730,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
 			mst_glb_errstat);
 
+unmask_gsysevtctl:
 	for (i = 0; i < PVC_NUM_IEH; i++)
 		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
 				(HARDWARE_ERROR_MAX << 1) + 1);
-- 
2.25.1

