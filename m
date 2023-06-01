Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACE9C7EE32
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F170310E5F8;
	Thu,  1 Jun 2023 21:52:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B26310E5FB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656370; x=1717192370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=szMOtzJGl9OogaJyZLvK3DFYvfQy4k+TLtFoXQzcqas=;
 b=FszUYTAzxQpiomNOGm/LxJpYYImhnPn/a08azpClwE1ZM+Bz6tTW7+aN
 g3EQK07jjlksJ2uURu2lY+1tYSOdctdcO4kwDqV+44QblDfdqDQx9H7uw
 JCZRXuNkl47J8NprMbXW7/ob7g5GOiTfXnPcPsW6K2drjaicbLubznozA
 6+l1w7hgUjzLnlo2nfLZsQKZ/9BATCQEkmmGYmJ/IEonvLA9wSkyuin0H
 g4wv+63CNWP4919pH1/HsVZYfSelZBBU/upcPl5s1BKqyPgDUonMNtcD+
 JrXU6g38G3XaaXbyEjCuLQTD1CgneheUFCFtsXKrHQEf2NPer14bVDEm6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313631"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313631"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563623"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563623"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:37 -0700
Message-Id: <20230601215244.678611-25-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 24/31] drm/xe/irq: Untangle postinstall functions
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

The xe_irq_postinstall() never actually gets called after installing the
interrupt handler.  This oversight seems to get papered over due to the
fact that the (misnamed) xe_gt_irq_postinstall does more than it really
should and gets called in the middle of the GT initialization.  The
callstack for postinstall is also a bit muddled with top-level device
interrupt enablement happening within platform-specific functions called
from the per-tile xe_gt_irq_postinstall() function.

Clean this all up by adding the missing call to xe_irq_postinstall()
after installing the interrupt handler and pull top-level irq enablement
up to xe_irq_postinstall where we'd expect it to be.

The xe_gt_irq_postinstall() function is still a bit misnamed here; an
upcoming patch will refocus its purpose and rename it.

v2:
 - Squash in patch to actually call xe_irq_postinstall() after
   installing the interrupt handler.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index c069e374a947..85bb9bd6b6be 100644
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
@@ -588,6 +567,8 @@ int xe_irq_install(struct xe_device *xe)
 		return err;
 	}
 
+	xe_irq_postinstall(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
 	if (err)
 		return err;
-- 
2.40.1

