Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85440C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 15:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FE510E3A7;
	Tue,  6 Aug 2024 15:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBXz5h0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A0C10E3AE
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722958798; x=1754494798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dJQjT6nC6Prjwzf8qa8IHYysQY5qs/FG9VqiMnYnXmw=;
 b=nBXz5h0/lDWFBHAy1+U6/AkKpVzye1IchPRuXeYcWEbmLMNrYTG7qvsj
 Mrk+5mrXcVwEXsIB2coWN++EPTcBOROPkZCoQMiNBEGbQDHiVeP4B9vZ3
 zuJSGdkAupd1dE6caH6QWLWr5trUALrpm7mo2HVUteI2NsogtTy3d7ZOT
 AnOpIrAuG0KvZTKl4WsADckIzb7N9jG+bH58dLxaKr845nn1KbuYHxfd/
 td2BQEEmUsWGdHtodbYeW3A9baWYoOqmvY7+CJS2/Na1lrTVlMuVlSvvI
 0DbUKM7PHOMiIYgF2K7y9a6rKe1FmQi7cM+x1NA6nijWh2fY3p3rgxndQ w==;
X-CSE-ConnectionGUID: DmW+bCKnQ0mQFM+vfe5otg==
X-CSE-MsgGUID: Q+/KLJs1Qu+5cdhJQFWJ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="12886159"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="12886159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 08:39:58 -0700
X-CSE-ConnectionGUID: Pzi94ouqRKCN3RYZGnoEZA==
X-CSE-MsgGUID: sSTiVcvNQnOoL+nV1m72ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="94117310"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 08:39:56 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 1/2] drm/xe: Export xe_hw_engine's mmio accessors
Date: Tue,  6 Aug 2024 18:30:08 +0300
Message-Id: <20240806153009.1081382-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Export hw engine's mmio accessors. This is in preparation
to use these from eudebug code.

v2: s/hw_engine_mmio/xe_hw_engine_mmio (Matthew)
v3: kernel doc (Matthew)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 88 +++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_hw_engine.h |  3 ++
 2 files changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 403eb1d2d20a..c7c44de7c30f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -277,8 +277,18 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 	hwe->gt = NULL;
 }
 
-static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
-				   u32 val)
+/**
+ * xe_hw_engine_mmio_write32() - Write engine register
+ * @hwe: engine
+ * @reg: register to write into
+ * @val: desired 32-bit value to write
+ *
+ * This function will write val into an engine specific register.
+ * Forcewake must be held by the caller.
+ *
+ */
+void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
+			       struct xe_reg reg, u32 val)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
@@ -288,7 +298,17 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
 	xe_mmio_write32(hwe->gt, reg, val);
 }
 
-static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
+/**
+ * xe_hw_engine_mmio_read32() - Read engine register
+ * @hwe: engine
+ * @reg: register to read from
+ *
+ * This function will read from an engine specific register.
+ * Forcewake must be held by the caller.
+ *
+ * Return: value of the 32-bit register.
+ */
+u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
@@ -307,14 +327,14 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 		xe_mmio_write32(hwe->gt, RCU_MODE,
 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
 
-	hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
-	hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
+	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
+	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 			       xe_bo_ggtt_addr(hwe->hwsp));
-	hw_engine_mmio_write32(hwe, RING_MODE(0),
+	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
 			       _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
-	hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
+	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
 			       _MASKED_BIT_DISABLE(STOP_RING));
-	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
+	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
 }
 
 static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
@@ -800,7 +820,7 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
 	unsigned int dss;
 	u16 group, instance;
 
-	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
+	snapshot->reg.instdone.ring = xe_hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
 
 	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
 		return;
@@ -896,53 +916,53 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 		return snapshot;
 
 	snapshot->reg.ring_execlist_status =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
+		xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
+	val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
 	snapshot->reg.ring_execlist_status |= val << 32;
 
 	snapshot->reg.ring_execlist_sq_contents =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
-	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
+		xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
+	val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
 	snapshot->reg.ring_execlist_sq_contents |= val << 32;
 
-	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
-	val = hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
+	snapshot->reg.ring_acthd = xe_hw_engine_mmio_read32(hwe, RING_ACTHD(0));
+	val = xe_hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
 	snapshot->reg.ring_acthd |= val << 32;
 
-	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
-	val = hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
+	snapshot->reg.ring_bbaddr = xe_hw_engine_mmio_read32(hwe, RING_BBADDR(0));
+	val = xe_hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
 	snapshot->reg.ring_bbaddr |= val << 32;
 
 	snapshot->reg.ring_dma_fadd =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
-	val = hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
+		xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
+	val = xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
 	snapshot->reg.ring_dma_fadd |= val << 32;
 
-	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
-	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
+	snapshot->reg.ring_hwstam = xe_hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
+	snapshot->reg.ring_hws_pga = xe_hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
+	snapshot->reg.ring_start = xe_hw_engine_mmio_read32(hwe, RING_START(0));
 	if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
-		val = hw_engine_mmio_read32(hwe, RING_START_UDW(0));
+		val = xe_hw_engine_mmio_read32(hwe, RING_START_UDW(0));
 		snapshot->reg.ring_start |= val << 32;
 	}
 	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
 		snapshot->reg.indirect_ring_state =
-			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
+			xe_hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
 	}
 
 	snapshot->reg.ring_head =
-		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
+		xe_hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
 	snapshot->reg.ring_tail =
-		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
-	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
+		xe_hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
+	snapshot->reg.ring_ctl = xe_hw_engine_mmio_read32(hwe, RING_CTL(0));
 	snapshot->reg.ring_mi_mode =
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
-	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
-	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
-	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
-	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
-	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
-	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+		xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
+	snapshot->reg.ring_mode = xe_hw_engine_mmio_read32(hwe, RING_MODE(0));
+	snapshot->reg.ring_imr = xe_hw_engine_mmio_read32(hwe, RING_IMR(0));
+	snapshot->reg.ring_esr = xe_hw_engine_mmio_read32(hwe, RING_ESR(0));
+	snapshot->reg.ring_emr = xe_hw_engine_mmio_read32(hwe, RING_EMR(0));
+	snapshot->reg.ring_eir = xe_hw_engine_mmio_read32(hwe, RING_EIR(0));
+	snapshot->reg.ipehr = xe_hw_engine_mmio_read32(hwe, RING_IPEHR(0));
 	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
 
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index d227ffe557eb..022819a4a8eb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -78,4 +78,7 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
+void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
+u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
+
 #endif
-- 
2.34.1

