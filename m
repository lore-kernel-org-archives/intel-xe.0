Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A02C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 15:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D64C10E666;
	Wed, 31 Jul 2024 15:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5rqRmJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AD510E666
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722440604; x=1753976604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vPqnfhxKUNdYwCUhIyBcLJY2moctEofjeeWhmbOCdW8=;
 b=k5rqRmJCXXeAySLjkIkyQi4eznGpQ+qxRlbG65OzzdoQDSdPiyo3gfbx
 M/f1FjfkED8Jm9B4v2IG8QfCdten0BQClKMsZKU9eqRn5xzqhBwbVjn0n
 C81xCei3JoD+ZxV29jZEpR7YybdiFbEwPNnZk8ZD0osynQbPbdU5pbSeo
 3TprAQYnlAqiCI5dUTeTzlwOUpuqPl+Y5j8qaCrM93tp43NhwR0onAMWr
 103S3KXnp8CrXU/LiXAr826zdsYllhSDhCawBcls7JNAkURotgK8NOW+i
 Odhmuo6nCIrppijOeVtIX9FFHc1CuxhWkCLYOd9wH6h9oyC+dL8jHiYlz g==;
X-CSE-ConnectionGUID: v7WgiTe7TDWuqBZWJmxtaQ==
X-CSE-MsgGUID: v9sZr/eoQ0yzVjKuiZOk/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24093097"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="24093097"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 08:43:24 -0700
X-CSE-ConnectionGUID: MEKhwWFOQUipVFZ2ZbXdiw==
X-CSE-MsgGUID: 96TRZRv7TwSb6mvNyqV3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59779073"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 08:43:21 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH] drm/xe: Export xe_hw_engine's mmio accessors
Date: Wed, 31 Jul 2024 18:34:22 +0300
Message-Id: <20240731153422.401458-1-mika.kuoppala@linux.intel.com>
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

Declare hw engine's mmio accessors in header file.
This is in preparation to use these from eudebug code.

v2: s/hw_engine_mmio/xe_hw_engine_mmio (Matthew)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 68 +++++++++++++++----------------
 drivers/gpu/drm/xe/xe_hw_engine.h |  3 ++
 2 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 00ace5fcc284..3c12442981e8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -277,8 +277,8 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 	hwe->gt = NULL;
 }
 
-static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
-				   u32 val)
+void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
+			       struct xe_reg reg, u32 val)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
@@ -288,7 +288,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
 	xe_mmio_write32(hwe->gt, reg, val);
 }
 
-static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
+u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
@@ -307,14 +307,14 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
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
@@ -794,7 +794,7 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
 	unsigned int dss;
 	u16 group, instance;
 
-	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
+	snapshot->reg.instdone.ring = xe_hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
 
 	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
 		return;
@@ -890,53 +890,53 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
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

