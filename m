Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4000CCD19F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90810E904;
	Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+MZCIsj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E435210E901
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566032; x=1792102032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ajHAZQn18A/X4x5mW8a0rF9UU9T07Dtdf+HIgva/Pgg=;
 b=P+MZCIsjaCGco0Kp20u7RwJTr1qwJPsY2uNQqBTCi3Pz5sZvkSY54rTx
 ipQ+9ENltcQxWU0fLLH/5rE+uNQ6Qc5LdjzGHETdHt+Mhl33VgkVfCW7d
 ESGAyV83PG39Rr4kXk1zUylVDlYBJCnqc2ewoH+KCRjhdH85KcWooDiZk
 +bkDgVs29RaglSs569OuMDGqmpPdkNUo/udqZ+Vh9hM44gwJ8VGQRWcZa
 /A/jZHdoqjej5jQFvOC+AeMJ3hQG+m/bDV907kwfZksP7bq6w9aJ5yChw
 VE+ILEtMveph9dCWYUBpmzZ6qMUx221AYywS2QSZyFazwiYa/hZ+e2FjG Q==;
X-CSE-ConnectionGUID: FF41ppIPQjO+x5W8pm2YyA==
X-CSE-MsgGUID: USiuXEM3TeejGGDPLCXVEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794062"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794062"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: QmaYO2svRVe9HD9FgF7yzg==
X-CSE-MsgGUID: edg5noJFRXWz+Ts7hL+79w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298313"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 17/22] drm/xe/irq: Rename fuse mask variables
Date: Wed, 15 Oct 2025 15:06:32 -0700
Message-ID: <20251015-xe3p-v2-17-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

It's confusing to refer to some masks as the interrupt masks and others
as the fuse masks. Rename the fuse one to make it clearer.

Note that the most important role they play here is that the call
to xe_hw_engine_mask_per_class() will not only limit the engines
according to the fuses, but also by what is available in the specific
architecture - the latter is more important information to know what
interrupts should be enabled. Add a comment about that.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 838fb512b7779..9c3a85c4585ed 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -139,7 +139,6 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_mmio *mmio = &gt->mmio;
-	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
 	u32 gsc_mask = 0;
 	u32 heci_mask = 0;
@@ -157,36 +156,43 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		       GT_WAIT_SEMAPHORE_INTERRUPT;
 	}
 
-	ccs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
-	bcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
-
 	dmask = irqs << 16 | irqs;
 	smask = irqs << 16;
 
 	if (xe_gt_is_main_type(gt)) {
+		/*
+		 * For enabling the interrupts, the information about fused off
+		 * engines doesn't matter much, but this also allows to check if
+		 * the engine is available architecturally in the platform
+		 */
+		u32 ccs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COMPUTE);
+		u32 bcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
+
 		/* Enable interrupts for each engine class */
 		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
-		if (ccs_mask)
+		if (ccs_fuse_mask)
 			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
 
 		/* Unmask interrupts for each engine instance */
 		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
 		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
-		if (bcs_mask & (BIT(1)|BIT(2)))
+		if (bcs_fuse_mask & (BIT(1)|BIT(2)))
 			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
-		if (bcs_mask & (BIT(3)|BIT(4)))
+		if (bcs_fuse_mask & (BIT(3)|BIT(4)))
 			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
-		if (bcs_mask & (BIT(5)|BIT(6)))
+		if (bcs_fuse_mask & (BIT(5)|BIT(6)))
 			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
-		if (bcs_mask & (BIT(7)|BIT(8)))
+		if (bcs_fuse_mask & (BIT(7)|BIT(8)))
 			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
-		if (ccs_mask & (BIT(0)|BIT(1)))
+		if (ccs_fuse_mask & (BIT(0)|BIT(1)))
 			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
-		if (ccs_mask & (BIT(2)|BIT(3)))
+		if (ccs_fuse_mask & (BIT(2)|BIT(3)))
 			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, ~dmask);
 	}
 
 	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
+		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
+
 		/* Enable interrupts for each engine class */
 		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
 
@@ -199,7 +205,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		 * the heci2 interrupt is enabled via the same register as the
 		 * GSCCS interrupts, but it has its own mask register.
 		 */
-		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
+		if (other_fuse_mask) {
 			gsc_mask = irqs | GSC_ER_COMPLETE;
 			heci_mask = GSC_IRQ_INTF(1);
 		} else if (xe->info.has_heci_gscfi) {

-- 
2.51.0

