Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB80FCCD1A7
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5075310EAEE;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRdeo1js";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46B310EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668039; x=1792204039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwSq2RXBlH72KeoydTIlwyHfRCgF2x45m3ccei2lGSo=;
 b=fRdeo1jsdtFhsNCr2TbWOEoDy5pA+2VO6Kvg9E6ZWa2NBMzyUw95skb2
 mVnQmnRBdYqECfsLDgfldsZfHFbeFaU2RzuXUssVpW/1r2eoHaCvb9Kfq
 HpWLsCm+PvOpaFRW0HHL5rAns8NXLrCJjS3aEA9Id9w3jdaK4CKUNnTvX
 CU5Icqvbse/4vMKLfLNi3jcJtFJMHGEv/zQpEZEHvR1ibOPFO5wjjV79C
 7sjOz6OGPshq3XXWTzoIcIjT4TY60poo5Hv9GxOuwDBnpkI8SM3sm2B+e
 OSBo8PnkMCxnS3nx+xo7yJEGbeeY3qs0C7gdkhw7vhFh++Z4c8uvbM0/v w==;
X-CSE-ConnectionGUID: xiKxUG7oTwiv4npmFf//1g==
X-CSE-MsgGUID: 2jiPWxWyRqqSTEg0+3Wutw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739224"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:19 -0700
X-CSE-ConnectionGUID: zLFSH0mnTs+1PEmnyC3W6w==
X-CSE-MsgGUID: wjWp0zUMQZeRXJcxsB7oGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089217"
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
Subject: [PATCH v3 20/24] drm/xe/irq: Check fuse mask for media engines
Date: Thu, 16 Oct 2025 19:26:39 -0700
Message-ID: <20251016-xe3p-v3-20-3dd173a3097a@intel.com>
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

Just like the other engines, check xe_hw_engine_mask_per_class() for VCS
and VECS to account for architectural availability of those registers.
With that, all the possibly available media engines can have their
interrupts enabled.

Bspec: 54030
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_irq.c           | 17 ++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index f6117720963b6..815d5e3d22099 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -65,7 +65,10 @@
 #define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
 #define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
 #define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
+#define VCS4_VCS5_INTR_MASK			XE_REG(0x1900b0, XE_REG_OPTION_VF)
+#define VCS6_VCS7_INTR_MASK			XE_REG(0x1900b4, XE_REG_OPTION_VF)
 #define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
+#define VECS2_VECS3_INTR_MASK			XE_REG(0x1900d4, XE_REG_OPTION_VF)
 #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
 #define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
 #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2108c86ed478d..8f2c8d3ae5f8a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -205,6 +205,8 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	}
 
 	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
+		u32 vcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
+		u32 vecs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
 		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
 
 		/* Enable interrupts for each engine class */
@@ -215,12 +217,21 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		/* Unmask interrupts for each engine instance */
 		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
 			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));
-		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
-		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
+		if (vcs_fuse_mask & (BIT(0) | BIT(1)))
+			xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
+		if (vcs_fuse_mask & (BIT(2) | BIT(3)))
+			xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
+		if (vcs_fuse_mask & (BIT(4) | BIT(5)))
+			xe_mmio_write32(mmio, VCS4_VCS5_INTR_MASK, val);
+		if (vcs_fuse_mask & (BIT(6) | BIT(7)))
+			xe_mmio_write32(mmio, VCS6_VCS7_INTR_MASK, val);
 
 		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vecs_mask) |
 			REG_FIELD_PREP(ENGINE0_MASK, vecs_mask));
-		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
+		if (vecs_fuse_mask & (BIT(0) | BIT(1)))
+			xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
+		if (vecs_fuse_mask & (BIT(2) | BIT(3)))
+			xe_mmio_write32(mmio, VECS2_VECS3_INTR_MASK, val);
 
 		/*
 		 * the heci2 interrupt is enabled via the same register as the

-- 
2.51.0

