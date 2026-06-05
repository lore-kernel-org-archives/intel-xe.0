Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33850CD8C86
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71CA11ABC9;
	Fri,  5 Jun 2026 23:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivt88KtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6211ABBF
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701680; x=1812237680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jlk9Qv/s8DStFJdeiesU8n7QHG02lFhZNwmDP6On0Cs=;
 b=ivt88KtXQ+EErlKhgy1TfqE4P4n/rfs9gHGBTdqmO1y3CC0z7hq4wsu7
 YzYJtEW53ktd/GRR1lqXhlQirtl5C6rgZyFkG6SZiz+7eeoYw4T1UgraE
 Ys1SeKbOOYOJ1CbQa1StIhTgfw+xGDuxIMvY/OuQQJ6PxZ+2Rp/+fassG
 DN5bWoRNPk05aBMj1r+4zk6KOY11LOXpreuQUUIMax9QxHI1PDEjkD/ZR
 f9MnQTkI4qBljmEhmA6dX5bV7cL89Z3HlY19B3uAgIaDXbCoAw+329cvH
 hltTQyQmFlG35K3VQ58GDBXBNxjdjm1s6HhayRzTPk27162eiKdRi+yaj Q==;
X-CSE-ConnectionGUID: 6BgkJKJcT/emUkaURA1IYg==
X-CSE-MsgGUID: BHLdMzLhTgucEDenLEuxmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449687"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449687"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:20 -0700
X-CSE-ConnectionGUID: XVYqnyPWRZuNr3HgJySKeg==
X-CSE-MsgGUID: axtxbaRjRyaTZ+1vP1kckg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018317"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:20 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 12/12] drm/xe/memirq: Enable compute walker post-sync interrupt
Date: Fri,  5 Jun 2026 23:21:19 +0000
Message-ID: <20260605232108.674580-26-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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
index f94b75eac80f..c00c9f9695d2 100644
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

