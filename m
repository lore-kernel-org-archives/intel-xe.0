Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84F2C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFB610E629;
	Fri, 19 May 2023 23:19:12 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CC610E621
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538331; x=1716074331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O7wnz8Ol215QeFz4JH+3kNo8ll7QAjUu9sT4MjSiebs=;
 b=JCvB3r/RLR3VH39uw7av+txX88T65CvKsl4JmRleHJl0Wp1fvXNWK7/4
 iC8FxR8t6VYl8GB8/pneRM7tQElD5ZDeh42818yTHU3my/D2UPepXJRqV
 ZiW02r/QbgI4/2KiYuy0K+daZlzykzrgVqOho8y0mlThZ1o1WR+9OYGec
 K6uWU6PzV+Q2lW/5DjnRmexPGsDK3Ub+GU4Sq2Wgku2c1DEGNXJ0MvBle
 h38TbxGIeb04cG5HA8tGIF2TnBK33MnECaTdcTt3fb5iqZBtJ8CS25+lK
 AjxCqM0Taadt01k95QBTMVqyAeOvML1k3va5LDfUCnvbxg0UKvN00ofD8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526382"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526382"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888756"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888756"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:21 -0700
Message-Id: <20230519231827.3572452-25-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 24/30] drm/xe: Replace xe_gt_irq_postinstall
 with xe_irq_enable_hwe
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

The majority of xe_gt_irq_postinstall() is really focused on the
hardware engine interrupts; other GT-related interrupts such as the GuC
are enabled/disabled independently.  Renaming the function and making it
truly GT-specific will make it more clear what the intended focus is.

Disabling/masking of other interrupts (such as GuC interrupts) is
unnecessary since that has already happened during the irq_reset stage,
and doing so will become harmful once the media GT is re-enabled since
calls to xe_gt_irq_postinstall during media GT initialization would
incorrectly disable the primary GT's GuC interrupts.

Also, since this function is called from gt_fw_domain_init(), it's not
necessary to also call it earlier during xe_irq_postinstall; just
xe_irq_resume to handle runtime resume should be sufficient.

v2:
 - Drop unnecessary !gt check.  (Lucas)
 - Reword some comments about enable/unmask for clarity.  (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |  4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c |  1 +
 drivers/gpu/drm/xe/xe_irq.c       | 87 +++++++++++++++----------------
 drivers/gpu/drm/xe/xe_irq.h       |  3 +-
 4 files changed, 48 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 290935e46059..b7bf8c01b4fe 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -303,8 +303,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
 	gt->info.engine_mask = gt->info.__engine_mask;
 
-	/* Enables per hw engine IRQs */
-	xe_gt_irq_postinstall(gt_to_tile(gt));
+	/* Enable per hw engine IRQs */
+	xe_irq_enable_hwe(gt);
 
 	/* Rerun MCR init as we now have hw engine list */
 	xe_gt_mcr_init(gt);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ab25513b753c..5a345b24b9a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -17,6 +17,7 @@
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_fence.h"
+#include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 85bb9bd6b6be..b4ed1e4a3388 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -122,13 +122,12 @@ static inline void xelp_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, GFX_MSTR_IRQ);
 }
 
-void xe_gt_irq_postinstall(struct xe_tile *tile)
+/* Enable/unmask the HWE interrupts for a specific GT's engines. */
+void xe_irq_enable_hwe(struct xe_gt *gt)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
-	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COMPUTE);
-	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt, XE_ENGINE_CLASS_COPY);
 
 	if (xe_device_guc_submission_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
@@ -140,45 +139,44 @@ void xe_gt_irq_postinstall(struct xe_tile *tile)
 		       GT_WAIT_SEMAPHORE_INTERRUPT;
 	}
 
+	ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
+	bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
+
 	dmask = irqs << 16 | irqs;
 	smask = irqs << 16;
 
-	/* Enable RCS, BCS, VCS and VECS class interrupts. */
-	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
-	xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
-	if (ccs_mask)
-		xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
+	if (!xe_gt_is_media_type(gt)) {
+		/* Enable interrupts for each engine class */
+		xe_mmio_write32(gt, RENDER_COPY_INTR_ENABLE, dmask);
+		if (ccs_mask)
+			xe_mmio_write32(gt, CCS_RSVD_INTR_ENABLE, smask);
 
-	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
-	xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
-	xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
-	if (bcs_mask & (BIT(1)|BIT(2)))
-		xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
-	if (bcs_mask & (BIT(3)|BIT(4)))
-		xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
-	if (bcs_mask & (BIT(5)|BIT(6)))
-		xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
-	if (bcs_mask & (BIT(7)|BIT(8)))
-		xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
-	xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
-	xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
-	xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
-	if (ccs_mask & (BIT(0)|BIT(1)))
-		xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
-	if (ccs_mask & (BIT(2)|BIT(3)))
-		xe_mmio_write32(mmio,  CCS2_CCS3_INTR_MASK, ~dmask);
+		/* Unmask interrupts for each engine instance */
+		xe_mmio_write32(gt, RCS0_RSVD_INTR_MASK, ~smask);
+		xe_mmio_write32(gt, BCS_RSVD_INTR_MASK, ~smask);
+		if (bcs_mask & (BIT(1)|BIT(2)))
+			xe_mmio_write32(gt, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
+		if (bcs_mask & (BIT(3)|BIT(4)))
+			xe_mmio_write32(gt, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
+		if (bcs_mask & (BIT(5)|BIT(6)))
+			xe_mmio_write32(gt, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
+		if (bcs_mask & (BIT(7)|BIT(8)))
+			xe_mmio_write32(gt, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
+		if (ccs_mask & (BIT(0)|BIT(1)))
+			xe_mmio_write32(gt, CCS0_CCS1_INTR_MASK, ~dmask);
+		if (ccs_mask & (BIT(2)|BIT(3)))
+			xe_mmio_write32(gt,  CCS2_CCS3_INTR_MASK, ~dmask);
+	}
 
-	/*
-	 * RPS interrupts will get enabled/disabled on demand when RPS itself
-	 * is enabled/disabled.
-	 */
-	/* TODO: gt->pm_ier, gt->pm_imr */
-	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
-	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
+	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
+		/* Enable interrupts for each engine class */
+		xe_mmio_write32(gt, VCS_VECS_INTR_ENABLE, dmask);
 
-	/* Same thing for GuC interrupts */
-	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE, 0);
-	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,  ~0);
+		/* Unmask interrupts for each engine instance */
+		xe_mmio_write32(gt, VCS0_VCS1_INTR_MASK, ~dmask);
+		xe_mmio_write32(gt, VCS2_VCS3_INTR_MASK, ~dmask);
+		xe_mmio_write32(gt, VECS0_VECS1_INTR_MASK, ~dmask);
+	}
 }
 
 static u32
@@ -497,12 +495,6 @@ static void xe_irq_reset(struct xe_device *xe)
 
 static void xe_irq_postinstall(struct xe_device *xe)
 {
-	struct xe_tile *tile;
-	u8 id;
-
-	for_each_tile(tile, xe, id)
-		xe_gt_irq_postinstall(tile);
-
 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
 
 	/*
@@ -591,9 +583,16 @@ void xe_irq_suspend(struct xe_device *xe)
 
 void xe_irq_resume(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	int id;
+
 	spin_lock_irq(&xe->irq.lock);
 	xe->irq.enabled = true;
 	xe_irq_reset(xe);
 	xe_irq_postinstall(xe);
+
+	for_each_gt(gt, xe, id)
+		xe_irq_enable_hwe(gt);
+
 	spin_unlock_irq(&xe->irq.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 69113c21e1cd..bc42bc90d967 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -8,11 +8,12 @@
 
 struct xe_device;
 struct xe_tile;
+struct xe_gt;
 
 int xe_irq_install(struct xe_device *xe);
-void xe_gt_irq_postinstall(struct xe_tile *tile);
 void xe_irq_shutdown(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
+void xe_irq_enable_hwe(struct xe_gt *gt);
 
 #endif
-- 
2.40.0

