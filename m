Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D202CCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 04:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF610E583;
	Fri, 20 Oct 2023 04:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEF510E584
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 04:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697777348; x=1729313348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PYT1opYCmMAy4+HfQS16ugIg20Vg9ITa2eROftF9Qsc=;
 b=fo12lOlzJUcfXLCNJwvhxfupnRIanV7utMg6mF/YlHMW4FyxjwA9xriR
 3aSeMmKZpLgKbCe0BaI0GCC1UxVCXSVv4G9iZk/+g4+Mn4S7qGv3EEsDj
 ukXTJvTcjiHWFM/OILpJaEzBtkh3lKvNTc0dBtRs9sKO90oqmAbxAs8pQ
 hxai+ilFKuUWbNiEFkehjgF5yKLrnTHVxuHBnsEU80FjgZrXvXGqv/3S6
 93TrkIyLQVTahJVe7GoTuq4s3Fm88DWRm0EvbUokP1Mzinzom1XpjLKXw
 8CEYbdlfKc7iVDJ8/U7aGa9VPWS5Sashsnn5KMWX/HrBvzZO06c1L3oT8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390310835"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="390310835"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 21:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847959880"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="847959880"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 21:49:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 10:25:32 +0530
Message-Id: <20231020045533.1425375-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 11/12] drm/xe: Clear SOC CORRECTABLE error
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

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index e7b0bb1390be..a4dd2844d63d 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -639,8 +639,26 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
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
@@ -722,6 +740,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
 			mst_glb_errstat);
 
+unmask_gsysevtctl:
 	for (i = 0; i < XE_SOC_NUM_IEH; i++)
 		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
 				(HARDWARE_ERROR_MAX << 1) + 1);
-- 
2.25.1

