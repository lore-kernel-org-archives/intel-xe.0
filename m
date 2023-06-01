Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F25C87FE1
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FF110E52A;
	Thu,  1 Jun 2023 00:04:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDF010E51A
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577856; x=1717113856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=szMOtzJGl9OogaJyZLvK3DFYvfQy4k+TLtFoXQzcqas=;
 b=bwvX2SO4U43MExSrH+2VMN/xKcK+/kT1qlhfWAjjS31CuKjElVRXk7mi
 2032kUsvaooN8sH3VfaBS8v1LWyFIhQ7318YNfnrwoLyOZWIUjQBSrqTz
 VyiX3uPXnbW+CKTAs7ogLsqLlLb7D2s6BgxRqrMfLbsGD8AVbKTJncJCC
 /iqT0SbSAuXRlXbFaHMaQue4U+MmRir7xjH/55mFyZ3p+S4bpsQTil8Lc
 H4RJ7FFoTRw+eZVwbl5CqeAODj+/Omh3yzfEMmLnio5i5bXWj+sjX0yNy
 VkQYvEVkAjqPRiTE+sOBRfia/p36qah15n6r6ICfWhKr82DJpui6MAeFb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996863"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996863"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556231"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556231"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:56 -0700
Message-Id: <20230601000403.432517-25-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 24/31] drm/xe/irq: Untangle postinstall
 functions
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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

