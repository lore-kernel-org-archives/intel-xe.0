Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501C6CDB483
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 02:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D23610E364;
	Wed, 18 Oct 2023 02:51:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3410410E363
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 02:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697597483; x=1729133483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5m6GQXW8NriO/Ci7WhsdrLc37o2e0UnrldaQbCf7vuA=;
 b=b+d8JHxvXindjQuE/3V4D17W4h4GjMRWGZAChrMuWA0SEpaz2+CtSTwP
 dfxDDnGHOQelyQ7jo3f7NNfNsNpg+edFk15ne4KoYBRd1aZTydBiEiDw/
 PDR0ZirReKlYgnaRSdbKIy8TmWVpkZ5WhuG3M/46oWPCX9zTKN6Z0falD
 azLcxoz5LuOEKXg075yGZFBKPdsF60DFTCoiQztxO6J2DmGnyGN9bfxzb
 zrVc2wZRuxVRYppTFdSeIeSjboVvXLLfQNXGxCRSkckFaY2T4iCIsqrIE
 CWhOGh+rLW6OuCZkU3btSc13r4CLq+ZX/gCi2dZ+WQbmDg4BOCW1yjLBu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366180556"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="366180556"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 19:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="732967428"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="732967428"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 17 Oct 2023 19:51:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 08:27:47 +0530
Message-Id: <20231018025748.1225528-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018025748.1225528-1-himal.prasad.ghimiray@intel.com>
References: <20231018025748.1225528-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/10] drm/xe: Clear SOC CORRECTABLE error
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
index 62b4051c6633..5700f708425f 100644
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

