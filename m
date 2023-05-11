Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1673FC7EE26
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9548610E599;
	Thu, 11 May 2023 03:47:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965E610E590
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/RWGAnCR6OvMJd7W6131pEuw5Zjku7VyhANyFF1TuA=;
 b=XG/p/8maxyaWl2BdTpK9c64LyukioPx3p5F4lcY7scf1AES64yRbvPiN
 9ocNdVFWwFo2XSdpd/rXRxyrwEr2Xyv8cm+r7bvb9I9EcyC0aY/1GqhjU
 QrlS/eLTBO+qEpK3F/H4tHPcY8ku1RWCp5er6de3WtjNctCOyc5JRmMwV
 o1hZidzJ5y1BJ2COmoQUMz3yOAOOVU0Ei8ZMpLXffMBHPqvDDiYcLhICN
 pfIEcv74Zkzq/nZVz+BQyun4hxFVH0q4kVp4+s0cWw9fKkFggotymHzAT
 uChrPUrOBU2Jc/3RSMuHkvXGvaKKbesAULBDGQPDTnfdruFaDpD4pQNeE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850649"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850649"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203236"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203236"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:15 -0700
Message-Id: <20230511034722.1929038-20-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 19/26] drm/xe/irq: Untangle postinstall functions
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The callstack for postinstall is a bit muddled with top-level device
interrupt enablement happening within platform-specific functions called
from the per-tile xe_gt_irq_postinstall() function.  If we pull
top-level irq enablement up to xe_irq_postinstall where we'd expect it
to be, we can eliminate some confusing layers of indirection.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2549fd9fb5cd..58745a5add87 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -122,7 +122,7 @@ static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
 }
 
-static void gt_irq_postinstall(struct xe_tile *tile)
+void xe_gt_irq_postinstall(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *mmio = tile->primary_gt;
@@ -181,15 +181,6 @@ static void gt_irq_postinstall(struct xe_tile *tile)
 	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
 }
 
-static void xelp_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
-{
-	/* TODO: PCH */
-
-	gt_irq_postinstall(tile);
-
-	xelp_intr_enable(xe, true);
-}
-
 static u32
 gt_engine_identity(struct xe_device *xe,
 		   struct xe_gt *mmio,
@@ -366,14 +357,6 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
 }
 
-static void dg1_irq_postinstall(struct xe_device *xe, struct xe_tile *tile)
-{
-	gt_irq_postinstall(tile);
-
-	if (tile->id == 0)
-		dg1_intr_enable(xe, true);
-}
-
 /*
  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
  * a "master tile" interrupt register which must be consulted before the
@@ -512,16 +495,6 @@ static void xe_irq_reset(struct xe_device *xe)
 	xe_display_irq_reset(xe);
 }
 
-void xe_gt_irq_postinstall(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-
-	if (GRAPHICS_VERx100(xe) >= 1210)
-		dg1_irq_postinstall(xe, tile);
-	else
-		xelp_irq_postinstall(xe, tile);
-}
-
 static void xe_irq_postinstall(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -538,6 +511,12 @@ static void xe_irq_postinstall(struct xe_device *xe)
 	 */
 	unmask_and_enable(xe_device_get_root_tile(xe),
 			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
+
+	/* Enable top-level interrupts */
+	if (GRAPHICS_VERx100(xe) >= 1210)
+		dg1_intr_enable(xe, true);
+	else
+		xelp_intr_enable(xe, true);
 }
 
 static irq_handler_t xe_irq_handler(struct xe_device *xe)
-- 
2.40.0

