Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98FECDB484
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 04:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2E710E269;
	Tue, 17 Oct 2023 04:09:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C7D10E263
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 04:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697515767; x=1729051767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=afH5yqerYFtfa+MisBqKx5lJtC3kk07wEN88dp47+nc=;
 b=j2c1shx4zeAVYpBxd9rDddBmg+HPhT6tXk2bJPaNccf9Gt3wTsSAJ5Mr
 qM2Cmal7JNVgxxSuZNRbC9dSUX24u8iV/ax3S/aNp4DuZsfjl8vl/0+vp
 nIojh2B923nSBI1hsQRJoQL5HJUoVsfo93ytvUVcm+dnUIAmGmSbviDgc
 Vh92EbjtjxVOo8J0UQSYk/CCeg6oYWTpZ99R55asFQpm94phy+kYWpmGP
 JLxwVhRvunK/cUc9kGmTpspmnUQ+RExhW4bsAiPBeBFflyd/oO9SCE9FF
 SWQE2sSvb7wfAFUrDul4mJYeVKGW8Pjnzs5AsWdz+vEu/hXElLHSLTEAM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416769943"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="416769943"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 21:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="791073918"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="791073918"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga001.jf.intel.com with ESMTP; 16 Oct 2023 21:09:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 09:45:49 +0530
Message-Id: <20231017041550.1172643-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
References: <20231017041550.1172643-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/10] drm/xe: Clear SOC CORRECTABLE error
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

PVC doesn't support correctable SOC error reporting, classify them as
Undefined and clear the registers.

v2
- Fix commit message.
- Although the errors are correctable but they are spurious interrupt.
Hence use drm_err instead of drm_warn.(Aravind)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index beed87f7d70b..fbadaf307a92 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -646,8 +646,26 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	if (tile_to_xe(tile)->info.platform != XE_PVC)
 		return;
 
-	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
-		return;
+	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
+		for (i = 0; i < XE_SOC_NUM_IEH; i++)
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
+		drm_err(&tile_to_xe(tile)->drm, HW_ERR
+			"Tile%d reported Undefine SOC CORRECTABLE error.",
+			tile->id);
+
+		goto unmask_gsysevtctl;
+	}
 
 	base = SOC_PVC_BASE;
 	slave_base = SOC_PVC_SLAVE_BASE;
@@ -729,6 +747,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
 			mst_glb_errstat);
 
+unmask_gsysevtctl:
 	for (i = 0; i < XE_SOC_NUM_IEH; i++)
 		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
 				(HARDWARE_ERROR_MAX << 1) + 1);
-- 
2.25.1

