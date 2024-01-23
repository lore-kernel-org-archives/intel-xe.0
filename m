Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05315C47E49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB1210E67A;
	Tue, 23 Jan 2024 20:45:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE49C10E3F2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042713; x=1737578713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JC+j7vghb3Ay0Fn8SGLBfvAWL8Q2hmcygYPkwxGTCLc=;
 b=KlcX5/8FDw34sZv8EvGcQAWZVGz4NxbKpDzRB0e+I5XM45J9RfmRe9tT
 lbyMBQZ0SAeSUOq1Ag5KMppfM30isuL9BWYAcd0xDjqSsvHcBZYvE9HFp
 5wVtH1zZhMjWNrG2S4jM/GvDYFkfhW0gkJ4Tge4SepeganjMq+0Hwok1l
 xygDjoINTWHdhGOeLuzRTDKvuypvRufkKM249WeNyCEuZ91OzYwtfj9Fr
 59TueHOa5lVh565FyKXfpZZMpn3rhZn45LU3HeYdBSt5f0+0sJJG4QSsQ
 cFo4kaukAF0G6PeSQTXmh7qTeEkMtQp/xKBjPs+sS644YmIM2xVS3xt+v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8319870"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8319870"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909421970"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909421970"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:11 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 6/9] drm/xe: Print registers spread in 2 u32 as u64
Date: Tue, 23 Jan 2024 12:44:51 -0800
Message-ID: <20240123204454.246788-6-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
References: <20240123204454.246788-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This makes easier to use those registers when copying its values to
calculator also makes easier for tools to parse it.

To avoids padding holes in xe_hw_engine_snapshot the u64 variables
were moved to the top of xe_hw_engine_snapshot.reg.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 69 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 30 ++++-------
 2 files changed, 42 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 789736a34c1ba..f7d66b71f1d71 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -749,6 +749,7 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
+	u64 val;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
@@ -766,19 +767,31 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
 
-	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
-							   RING_HWS_PGA(0));
-	snapshot->reg.ring_execlist_status_lo =
+	snapshot->reg.ring_execlist_status =
 		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	snapshot->reg.ring_execlist_status_hi =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-	snapshot->reg.ring_execlist_sq_contents_lo =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_LO(0));
-	snapshot->reg.ring_execlist_sq_contents_hi =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_HI(0));
+	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
+	snapshot->reg.ring_execlist_status |= val << 32;
+
+	snapshot->reg.ring_execlist_sq_contents =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
+	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
+	snapshot->reg.ring_execlist_sq_contents |= val << 32;
+
+	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
+	val = hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
+	snapshot->reg.ring_acthd |= val << 32;
+
+	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
+	val = hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
+	snapshot->reg.ring_bbaddr |= val << 32;
+
+	snapshot->reg.ring_dma_fadd =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
+	val = hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
+	snapshot->reg.ring_dma_fadd |= val << 32;
+
+	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
+	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
 	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
 	snapshot->reg.ring_head =
 		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
@@ -792,16 +805,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
 	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
 	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
-	snapshot->reg.ring_acthd_udw =
-		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
-	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
-	snapshot->reg.ring_bbaddr_udw =
-		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
-	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
-	snapshot->reg.ring_dma_fadd_udw =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
-	snapshot->reg.ring_dma_fadd =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
 
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
@@ -830,14 +833,10 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
 	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
 	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
-	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
-		   snapshot->reg.ring_execlist_status_lo);
-	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
-		   snapshot->reg.ring_execlist_status_hi);
-	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
-		   snapshot->reg.ring_execlist_sq_contents_lo);
-	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
-		   snapshot->reg.ring_execlist_sq_contents_hi);
+	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
+		   snapshot->reg.ring_execlist_status);
+	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
+		   snapshot->reg.ring_execlist_sq_contents);
 	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
 	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
 	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
@@ -849,13 +848,9 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
 	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
 	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
-	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
-		   snapshot->reg.ring_acthd);
-	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
-		   snapshot->reg.ring_bbaddr);
-	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
-		   snapshot->reg.ring_dma_fadd_udw,
-		   snapshot->reg.ring_dma_fadd);
+	drm_printf(p, "\tACTHD:  0x%016llx\n", snapshot->reg.ring_acthd);
+	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
+	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
 	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 61d9027e4665a..d7f828c76cc5f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -173,18 +173,20 @@ struct xe_hw_engine_snapshot {
 	u32 mmio_base;
 	/** @reg: Useful MMIO register snapshot */
 	struct {
+		/** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
+		u64 ring_execlist_status;
+		/** @reg.ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
+		u64 ring_execlist_sq_contents;
+		/** @reg.ring_acthd: RING_ACTHD */
+		u64 ring_acthd;
+		/** @reg.ring_bbaddr: RING_BBADDR */
+		u64 ring_bbaddr;
+		/** @reg.ring_dma_fadd: RING_DMA_FADD */
+		u64 ring_dma_fadd;
 		/** @reg.ring_hwstam: RING_HWSTAM */
 		u32 ring_hwstam;
 		/** @reg.ring_hws_pga: RING_HWS_PGA */
 		u32 ring_hws_pga;
-		/** @reg.ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
-		u32 ring_execlist_status_lo;
-		/** @reg.ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
-		u32 ring_execlist_status_hi;
-		/** @reg.ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
-		u32 ring_execlist_sq_contents_lo;
-		/** @reg.ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
-		u32 ring_execlist_sq_contents_hi;
 		/** @reg.ring_start: RING_START */
 		u32 ring_start;
 		/** @reg.ring_head: RING_HEAD */
@@ -205,18 +207,6 @@ struct xe_hw_engine_snapshot {
 		u32 ring_emr;
 		/** @reg.ring_eir: RING_EIR */
 		u32 ring_eir;
-		/** @reg.ring_acthd_udw: RING_ACTHD_UDW */
-		u32 ring_acthd_udw;
-		/** @reg.ring_acthd: RING_ACTHD */
-		u32 ring_acthd;
-		/** @reg.ring_bbaddr_udw: RING_BBADDR_UDW */
-		u32 ring_bbaddr_udw;
-		/** @reg.ring_bbaddr: RING_BBADDR */
-		u32 ring_bbaddr;
-		/** @reg.ring_dma_fadd_udw: RING_DMA_FADD_UDW */
-		u32 ring_dma_fadd_udw;
-		/** @reg.ring_dma_fadd: RING_DMA_FADD */
-		u32 ring_dma_fadd;
 		/** @reg.ipehr: IPEHR */
 		u32 ipehr;
 		/** @reg.rcu_mode: RCU_MODE */
-- 
2.43.0

