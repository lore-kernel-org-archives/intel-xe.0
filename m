Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA806CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 08:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDE610E1AC;
	Fri,  7 Nov 2025 08:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEJZxeFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C999A10E1AC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762503981; x=1794039981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1WbY0gNYD/f5/iOCTyf2at/e8z9fXRu7z0xE2UvaCDA=;
 b=iEJZxeFg0/v9pVBgmZx95x19rdFTh/LJEZS4BWvMgPpsaTmZ7C6TwiEZ
 F+POk9lw31g+9kiNDRAodl+Pb5YfINx/R2jTBkyZQoRCnEKAzZKlXtd1+
 24Zl5sjDkKCnCEsXWaAF8uIvtkDbCBdkyrMHuq2TF7gZ13TDJSGY0GmpO
 dvahvqTvyJXffN3ElTVgMm7mzwlo+txCxcEFNyTa9+DaLMKoJP6U6eLLS
 cDv4nudXC+da9pL2L3fJAdeog9s9o8B/rdIEDY+HnSezHUB1RkXKV3INr
 fC6ucbtNagrNL/s4jjOvC2oRKngrZm6WRpacQKVVB9ZYVSs+0/G805wJr A==;
X-CSE-ConnectionGUID: Zx3n6WMNR/KZWA+2EIPlLw==
X-CSE-MsgGUID: gjJycl6FT26Drvij9DiUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63663028"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="63663028"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 00:26:19 -0800
X-CSE-ConnectionGUID: UGAvLGWXSFibYKm0brJ9Mw==
X-CSE-MsgGUID: qlNB88YjQJ60VwSWmh5Xrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188420436"
Received: from vnayana.iind.intel.com ([10.190.239.33])
 by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2025 00:26:17 -0800
From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com
Subject: [PATCH] drm/xe/irq: Handle msix vector0 interrupt
Date: Fri,  7 Nov 2025 14:01:41 +0530
Message-Id: <20251107083141.2080189-1-venkata.ramana.nayana@intel.com>
X-Mailer: git-send-email 2.34.1
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

Current gu2host handler registered as MSI-X vector 0 and as per bspec for
a msix vector 0 interrupt, the driver must check the legacy registers
190008(TILE_INT_REG), 190060h (GT INTR Identity Reg 0) and other registers
mentioned in "Interrupt Service Routine Pseudocode" otherwise it will block
the next interrupts. To overcome this issue replacing guc2host handler
with legacy xe_irq_handler.

Fixes: da889070be7b2 ("drm/xe/irq: Separate MSI and MSI-X flows")
Bspec: 62357
Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index e5ed0242f7b1..024e13e606ec 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -897,22 +897,6 @@ static int xe_irq_msix_init(struct xe_device *xe)
 	return 0;
 }
 
-static irqreturn_t guc2host_irq_handler(int irq, void *arg)
-{
-	struct xe_device *xe = arg;
-	struct xe_tile *tile;
-	u8 id;
-
-	if (!atomic_read(&xe->irq.enabled))
-		return IRQ_NONE;
-
-	for_each_tile(tile, xe, id)
-		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
-				   GUC_INTR_GUC2HOST);
-
-	return IRQ_HANDLED;
-}
-
 static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
 {
 	unsigned int tile_id, gt_id;
@@ -1029,7 +1013,7 @@ int xe_irq_msix_request_irqs(struct xe_device *xe)
 	u16 msix;
 
 	msix = GUC2HOST_MSIX;
-	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
+	err = xe_irq_msix_request_irq(xe, xe_irq_handler(xe), xe,
 				      DRIVER_NAME "-guc2host", false, &msix);
 	if (err)
 		return err;
-- 
2.34.1

