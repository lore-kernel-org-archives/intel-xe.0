Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A23CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEEA10EAF6;
	Fri, 17 Oct 2025 02:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PT/UhJNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4034310EAE9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668039; x=1792204039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZSKeu79w4YOZasltzgEDdUP93Gbj9GriSKtCHaQ2RWM=;
 b=PT/UhJNbguutw6D5cFF3oIdLkcIdGDI/t0CK/H1IANqun801Pvwv52cw
 G7opApP80WYv3BPhOqKK7ygw7ZNEIh1tPgYvzwSqbmPGE2LrRWC87w79A
 uI4RiJFKgBQkJFiFOhHzNl8YPIR/JRvAjvZjUeI6shbw08+XnAWFbR4hR
 YmdytuFm7h4I0/FQqXzQjcYyOiKSVniWlJ5PHKAsELVsfWI+bUdGhwvbH
 2zug4NrtnFGOHytu/bJJY+V8AzDOk+4P+dcmsmfykoBlx39AV9lSO2rcO
 L8KVSDh5pmmTZ9v4wian3HbjuD2sxWAweknc06/jLnXLYqRo3oF9umHM0 g==;
X-CSE-ConnectionGUID: 8sJKbCKcQG+Z6i2kbU2hSQ==
X-CSE-MsgGUID: jZJpN+C3TRCyjrmqfmu+rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739220"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739220"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
X-CSE-ConnectionGUID: uqsqsVYuS5KPCqGNK8fYyA==
X-CSE-MsgGUID: yzkn76bURR23pBKv7Cu5YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089208"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 17/24] drm/xe/irq: Rename fuse mask variables
Date: Thu, 16 Oct 2025 19:26:36 -0700
Message-ID: <20251016-xe3p-v3-17-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

