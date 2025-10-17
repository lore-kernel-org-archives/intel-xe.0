Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F28CCCD1A3
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E78810EAEC;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ax9Ul74A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714F110EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668039; x=1792204039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PYzq+/Fb3Ulkt1qtiKDn+kap9h8ropNDxF4lXZx2bbs=;
 b=Ax9Ul74ArUsd18eHRxKp/SbzWGfWpr3pH7Op508Hoh+fX8W+WRNOWfm7
 9taF6B8OlhjMMIajO9TH8P0gS74QUP6i42uNC5iPGrNR79XJzRE+VyU5G
 uTZ5vkiZSmjzhrVEwYbnaz3nyt6rHgYOvOjy0+2aoVQUPCRD7Wg4+HLaR
 tMYcXfdB3hdV4YjZNXDf0BAJ/7Uxz3aTi4yCjgPoilNtpWbgClgk+GJ78
 Jool0tJNjy0RpuqXRJJL/piDIBzAPrZdwUMlN8cZ2+N6esx77Q+lQvPIC
 kuQrK2XTmYrmzPSXcIqviE2KYIjAx3qi50UjMJGEy7nUCb5pu+X76xWYn w==;
X-CSE-ConnectionGUID: vq68ZTSARvCmTEhmR665PA==
X-CSE-MsgGUID: 93VH8XVJSZO/ZPD+N49r3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739221"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
X-CSE-ConnectionGUID: nLaMj5NZQ3GHd5EqzB/Uxg==
X-CSE-MsgGUID: w9RFRvNTSuiZUsZOWOdShw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089211"
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
Subject: [PATCH v3 18/24] drm/xe/irq: Split irq mask per engine class
Date: Thu, 16 Oct 2025 19:26:37 -0700
Message-ID: <20251016-xe3p-v3-18-3dd173a3097a@intel.com>
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

Each engine class has a different bitfield structure in the hw. We've
been just using a common mask for all of them, but this means that we
could inadvertently set a wrong bit in one class while enabling
something in another. Split them to make it more future proof.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Fix copy paste mistake: s/vcs/vecs/ (Matt Roper)
---
 drivers/gpu/drm/xe/xe_irq.c | 73 +++++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9c3a85c4585ed..142f422a5d97e 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -139,25 +139,28 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_mmio *mmio = &gt->mmio;
-	u32 irqs, dmask, smask;
-	u32 gsc_mask = 0;
-	u32 heci_mask = 0;
+	u32 common_mask, val, gsc_mask = 0, heci_mask = 0,
+	    rcs_mask = 0, bcs_mask = 0, vcs_mask = 0, vecs_mask = 0,
+	    ccs_mask = 0;
 
 	if (xe_device_uses_memirq(xe))
 		return;
 
 	if (xe_device_uc_enabled(xe)) {
-		irqs = GT_RENDER_USER_INTERRUPT |
-			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
+		common_mask = GT_RENDER_USER_INTERRUPT |
+			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
 	} else {
-		irqs = GT_RENDER_USER_INTERRUPT |
-		       GT_CS_MASTER_ERROR_INTERRUPT |
-		       GT_CONTEXT_SWITCH_INTERRUPT |
-		       GT_WAIT_SEMAPHORE_INTERRUPT;
+		common_mask = GT_RENDER_USER_INTERRUPT |
+			      GT_CS_MASTER_ERROR_INTERRUPT |
+			      GT_CONTEXT_SWITCH_INTERRUPT |
+			      GT_WAIT_SEMAPHORE_INTERRUPT;
 	}
 
-	dmask = irqs << 16 | irqs;
-	smask = irqs << 16;
+	rcs_mask |= common_mask;
+	bcs_mask |= common_mask;
+	vcs_mask |= common_mask;
+	vecs_mask |= common_mask;
+	ccs_mask |= common_mask;
 
 	if (xe_gt_is_main_type(gt)) {
 		/*
@@ -169,44 +172,62 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		u32 bcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
 
 		/* Enable interrupts for each engine class */
-		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
+		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE,
+				REG_FIELD_PREP(ENGINE1_MASK, rcs_mask) |
+				REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
 		if (ccs_fuse_mask)
-			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
+			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE,
+					REG_FIELD_PREP(ENGINE1_MASK, ccs_mask));
 
 		/* Unmask interrupts for each engine instance */
-		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
-		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
+		val = ~REG_FIELD_PREP(ENGINE1_MASK, rcs_mask);
+		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, val);
+		val = ~REG_FIELD_PREP(ENGINE1_MASK, bcs_mask);
+		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, val);
+
+		val = ~(REG_FIELD_PREP(ENGINE1_MASK, bcs_mask) |
+			REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
 		if (bcs_fuse_mask & (BIT(1)|BIT(2)))
-			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, val);
 		if (bcs_fuse_mask & (BIT(3)|BIT(4)))
-			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, val);
 		if (bcs_fuse_mask & (BIT(5)|BIT(6)))
-			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, val);
 		if (bcs_fuse_mask & (BIT(7)|BIT(8)))
-			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, val);
+
+		val = ~(REG_FIELD_PREP(ENGINE1_MASK, ccs_mask) |
+			REG_FIELD_PREP(ENGINE0_MASK, ccs_mask));
 		if (ccs_fuse_mask & (BIT(0)|BIT(1)))
-			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, val);
 		if (ccs_fuse_mask & (BIT(2)|BIT(3)))
-			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, ~dmask);
+			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, val);
 	}
 
 	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
 		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
 
 		/* Enable interrupts for each engine class */
-		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
+		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE,
+				REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
+				REG_FIELD_PREP(ENGINE0_MASK, vecs_mask));
 
 		/* Unmask interrupts for each engine instance */
-		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
-		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
-		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
+		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
+			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));
+		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
+		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
+
+		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vecs_mask) |
+			REG_FIELD_PREP(ENGINE0_MASK, vecs_mask));
+		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
 
 		/*
 		 * the heci2 interrupt is enabled via the same register as the
 		 * GSCCS interrupts, but it has its own mask register.
 		 */
 		if (other_fuse_mask) {
-			gsc_mask = irqs | GSC_ER_COMPLETE;
+			gsc_mask = common_mask | GSC_ER_COMPLETE;
 			heci_mask = GSC_IRQ_INTF(1);
 		} else if (xe->info.has_heci_gscfi) {
 			gsc_mask = GSC_IRQ_INTF(1);

-- 
2.51.0

