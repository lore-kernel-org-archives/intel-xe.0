Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C7CD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A835610EC12;
	Wed, 10 Jun 2026 21:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOzNXJel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4DA10EBF9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126920; x=1812662920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k7khLd2st4b1z7kVp50F5jO8DNsRfLY4+QwBvc+58rE=;
 b=mOzNXJelQp8oA5NF2AY6etX2a0WQ4dn5efLMvRvNQU+63XbAMGYlWpeU
 sibgyiFnquJuBwUjgynGWyyKos07oRImNFdsA19IC9X6vE/ncJRAwdw+3
 CsvMllikoGytf6/6niozdG3w4V+dSCJ8WFNYIekuvtB9GsNweGtklZ6YI
 Ozf5N7m9m7+Tm9gfghI/WwjP/FVDMXaM4E5g8Mz6ozqDoh5eSwwmz/41y
 C/DOE1xJSOyTrpcmI7CEnX0VgoQa4iHkXifXo44CPISrvE/H7FjmKnGOv
 c0g2Ldh+iJtGNSNnFnyI45aO1YsNYkqs2IwoY5BhYQ1FLyPDC6D6JaMzH A==;
X-CSE-ConnectionGUID: 8WOV9oymQGyE0coP4F4IdQ==
X-CSE-MsgGUID: 9sxNnL08QVaKn0IOMn/Tww==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934690"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934690"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:39 -0700
X-CSE-ConnectionGUID: 2T7VDu+JSWOCYqmut/F3Tg==
X-CSE-MsgGUID: y8BCu8n2QBOCYfhebRgbkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292079"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:38 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 11/11] drm/xe/memirq: Enable compute walker post-sync interrupt
Date: Wed, 10 Jun 2026 21:28:43 +0000
Message-ID: <20260610212833.153366-24-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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

Commit 2ddedd4b7b7c ("drm/xe/memirq: Enable GT_MI_USER_INTERRUPT only")
narrowed the MEMIRQ enable mask to GT_MI_USER_INTERRUPT only. Add
the interrupt enable bit for the compute walker post sync interrupt
as well to allow those to go through.

Additionally, the compute walker post sync interrupt vector offset
in the LRC register is currently incorrect. Fix that here.

Bspec: 62346, 72547
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 +++
 drivers/gpu/drm/xe/xe_lrc.c             | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_memirq.c          | 12 +++++++++---
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 4ab86fc369fd..3c0babaa7902 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -31,6 +31,9 @@
 #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
 #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
 
+#define CTX_CS_INT_VEC_USER_MASK	REG_GENMASK(9, 0)
+#define CTX_CS_INT_VEC_COMPUTE_MASK	REG_GENMASK(19, 10)
+
 #define CTX_CS_INT_VEC_REG		0x5a
 #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a4292a11391d..d6677980be2d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1527,11 +1527,24 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 		xe_lrc_set_ppgtt(lrc, vm);
 
 	if (xe_device_has_msix(xe)) {
+		/*
+		 * Each exec queue is only assigned one MSI-X vector, however
+		 * the LRC allows for different vectors for MI_USER_INT and
+		 * compute walker post sync interrupts. For now, just use the
+		 * same vector for each of the vector types.
+		 */
+		u32 lrc_msix_vec =
+			REG_FIELD_PREP(CTX_CS_INT_VEC_USER_MASK, msix_vec);
+
+		if (GRAPHICS_VERx100(xe) >= 3511)
+			lrc_msix_vec |=
+				REG_FIELD_PREP(CTX_CS_INT_VEC_COMPUTE_MASK, msix_vec);
+
 		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
 				     xe_memirq_status_ptr(&tile->memirq, hwe));
 		xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
 				     xe_memirq_source_ptr(&tile->memirq, hwe));
-		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix_vec << 16 | msix_vec);
+		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, lrc_msix_vec);
 	}
 
 	if (xe_gt_has_indirect_ring_state(gt)) {
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index dc21f154db71..d89f063a6c1f 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -238,12 +238,18 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 
 static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
 {
+	struct xe_device *xe = memirq_to_xe(memirq);
+	u32 int_enables = GT_MI_USER_INTERRUPT;
+
+	if (GRAPHICS_VERx100(xe) >= 3511)
+		int_enables |= GT_COMPUTE_WALKER_INTERRUPT;
+
 	/*
-	 * We only care about the GT_MI_USER_INTERRUPT from the engines and
-	 * the GuC does not look at the ENABLE mask at all.
+	 * Enable MI_USER_INTERRUPT and compute walker post-sync interrupts
+	 * from engines. The GuC does not look at the ENABLE mask at all.
 	 */
 	iosys_map_wr(&memirq->bo->vmap, XE_MEMIRQ_ENABLE_OFFSET, u32,
-		     enable ? GT_MI_USER_INTERRUPT : 0);
+		     enable ? int_enables : 0);
 
 	memirq->enabled = enable;
 }
-- 
2.43.0

