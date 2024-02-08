Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34F9C48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699C810EE09;
	Thu,  8 Feb 2024 21:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSmfQZRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D94F10EDFF
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707427163; x=1738963163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zu/cj+5xrYldM6N6ZZ7HLkdTA97errxK+hbTFLOmj+M=;
 b=eSmfQZRuJei9f/dYkYDPvQn9MmgMH8vwnkvJer6hcDIGvcUENDp+T/y7
 LxbM8iXG+I06b4XBqPM1J3S4v28AyyCHiyyIr5u8lrOSgQEF4kBgPo+Ao
 vwu08Ns94PpVWVDKqo7xIURkjEoHXLQGESLv01KB3wzuE9pbsjGCI4SXI
 m5VgFu7IcPkUJLAIu6nDIzGfD6hytyKKeSkuhf4OdI8LVJfPNAIKtyDbK
 Ebj2w04/6YGOKCRhXI0shk48g98G4hC15eI7Wz22Ig8JXEEXNSdGZ3yAn
 YjjZX/34b84JxzVP+bKWuBJ6s3pq4zB8dlh+XhgcNAkO1VkQ1oXHZHLKx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18823818"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="18823818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2141895"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 08 Feb 2024 13:19:22 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 8/8] drm/xe/guc: Plumb GuC-capture into dev coredump
Date: Thu,  8 Feb 2024 13:19:18 -0800
Message-Id: <20240208211918.81789-9-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208211918.81789-1-zhanjun.dong@intel.com>
References: <20240208211918.81789-1-zhanjun.dong@intel.com>
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

Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
node list.
Add data struct to map register to a snapshot field, although all
field is mapped now, which means the offset could be optimized out,
while in the future, depends on system configuration, the field might
not be consecutive, keep the offset is reserved for future.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c      |  46 ++--
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |   1 -
 drivers/gpu/drm/xe/xe_hw_engine.c        | 257 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_hw_engine.h        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  96 +++++----
 5 files changed, 279 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index e08998eed5a2..4c819be177b2 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -38,28 +38,33 @@
  *       from the engine-mmio-base
  */
 #define COMMON_XELP_BASE_GLOBAL \
-	{ FORCEWAKE_GT,		    0,      0, "FORCEWAKE" }
+	{ FORCEWAKE_GT,				0,	0}
 
 #define COMMON_BASE_ENGINE_INSTANCE \
-	{ RING_ESR(0),              0,      0, "ESR" }, \
-	{ RING_EMR(0),              0,      0, "EMR" }, \
-	{ RING_EIR(0),              0,      0, "EIR" }, \
-	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
-	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
-	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
-	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
-	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
-	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
-	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
-	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
-	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
-	{ RING_START(0),            0,      0, "START" }, \
-	{ RING_HEAD(0),             0,      0, "HEAD" }, \
-	{ RING_TAIL(0),             0,      0, "TAIL" }, \
-	{ RING_CTL(0),              0,      0, "CTL" }, \
-	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
-	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
-	{ RING_MODE(0),             0,      0, "GFX_MODE" }
+	{ RING_ESR(0),				0,	0}, \
+	{ RING_EMR(0),				0,	0}, \
+	{ RING_EIR(0),				0,	0}, \
+	{ RING_IMR(0),				0,	0}, \
+	{ RING_IPEHR(0),			0,	0}, \
+	{ RING_START(0),			0,	0}, \
+	{ RING_HEAD(0),				0,	0}, \
+	{ RING_TAIL(0),				0,	0}, \
+	{ RING_CTL(0),				0,	0}, \
+	{ RING_MI_MODE(0),			0,	0}, \
+	{ RING_HWSTAM(0),			0,	0}, \
+	{ RING_HWS_PGA(0),			0,	0}, \
+	{ RING_EXECLIST_STATUS_HI(0),		0,	0}, \
+	{ RING_EXECLIST_STATUS_LO(0),		0,	0}, \
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0),	0,	0}, \
+	{ RING_EXECLIST_SQ_CONTENTS_LO(0),	0,	0}, \
+	{ RING_DMA_FADD(0),			0,	0}, \
+	{ RING_DMA_FADD_UDW(0),			0,	0}, \
+	{ RING_BBADDR(0),			0,	0}, \
+	{ RING_BBADDR_UDW(0),			0,	0}, \
+	{ RING_ACTHD(0),			0,	0}, \
+	{ RING_ACTHD_UDW(0),			0,	0}, \
+	{ RING_MODE(0),				0,	0}, \
+	{ RCU_MODE,				0,	0}
 
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
@@ -218,7 +223,6 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
 	ext->reg = XE_REG(extlist->reg.__reg.addr);
 	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
 	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
-	ext->regname = extlist->name;
 }
 
 static int
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
index b975a65b64e7..92289584de61 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -86,7 +86,6 @@ struct __guc_mmio_reg_descr {
 	struct xe_reg reg;
 	u32 flags;
 	u32 mask;
-	const char *regname;
 };
 
 struct __guc_mmio_reg_descr_group {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0d17e32d70c8..ca16cf375bcd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -17,6 +17,9 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_gt_topology.h"
+#include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
@@ -258,6 +261,56 @@ static const struct engine_info engine_infos[] = {
 	},
 };
 
+struct __reg_map_descr capture_engine_reg[] = {
+	{offsetof(struct snap_shot_regs, ring_hwstam),	"HWSTAM",	RING_HWSTAM(0)	},
+	{offsetof(struct snap_shot_regs, ring_hws_pga),	"RING_HWS_PGA",	RING_HWS_PGA(0)	},
+	{offsetof(struct snap_shot_regs, ring_start),	"RING_START",	RING_START(0)	},
+	{offsetof(struct snap_shot_regs, ring_head),	"RING_HEAD",	RING_HEAD(0)	},
+	{offsetof(struct snap_shot_regs, ring_tail),	"RING_TAIL",	RING_TAIL(0)	},
+	{offsetof(struct snap_shot_regs, ring_ctl),	"RING_CTL",	RING_CTL(0)	},
+	{offsetof(struct snap_shot_regs, ring_mi_mode),	"RING_MI_MODE",	RING_MI_MODE(0)	},
+	{offsetof(struct snap_shot_regs, ring_mode),	"RING_MODE",	RING_MODE(0)	},
+	{offsetof(struct snap_shot_regs, ring_imr),	"RING_IMR",	RING_IMR(0)	},
+	{offsetof(struct snap_shot_regs, ring_esr),	"RING_ESR",	RING_ESR(0)	},
+	{offsetof(struct snap_shot_regs, ring_emr),	"RING_EMR",	RING_EMR(0)	},
+	{offsetof(struct snap_shot_regs, ring_eir),	"RING_EIR",	RING_EIR(0)	},
+	{offsetof(struct snap_shot_regs, ipehr),	"IPEHR",	RING_IPEHR(0)	},
+	{offsetof(struct snap_shot_regs, rcu_mode),	"RCU_MODE",	RCU_MODE	},
+};
+
+struct __reg_map_descr_64 capture_engine_reg_64[] = {
+	{
+		offsetof(struct snap_shot_regs, ring_acthd),
+		"ACTHD",
+		RING_ACTHD(0),
+		RING_ACTHD_UDW(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_bbaddr),
+		"RING_BBADDR",
+		RING_BBADDR(0),
+		RING_BBADDR_UDW(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_dma_fadd),
+		"RING_DMA_FADD",
+		RING_DMA_FADD(0),
+		RING_DMA_FADD_UDW(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_execlist_status),
+		"RING_EXECLIST_STATUS",
+		RING_EXECLIST_STATUS_LO(0),
+		RING_EXECLIST_STATUS_HI(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_execlist_sq_contents),
+		"RING_EXECLIST_SQ_CONTENTS",
+		RING_EXECLIST_SQ_CONTENTS_LO(0),
+		RING_EXECLIST_SQ_CONTENTS_HI(0)
+	}
+};
+
 static void hw_engine_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
@@ -735,6 +788,121 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
+static void cp_reg_to_snapshot(u32 offset, u32 value, struct snap_shot_regs *regs)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg); i++)
+		if (offset == capture_engine_reg[i].reg.addr) {
+			u32 *field = (u32 *)((uintptr_t)regs + capture_engine_reg[i].dst_offset);
+			*field = value;
+			return;
+		}
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg_64); i++) {
+		if (offset == capture_engine_reg_64[i].reg_lo.addr) {
+			u64 *field = (u64 *)((uintptr_t)regs + capture_engine_reg_64[i].dst_offset);
+			*field = upper_32_bits(*field) | value;
+			return;
+		}
+		if (offset == capture_engine_reg_64[i].reg_hi.addr) {
+			u64 *field = (u64 *)((uintptr_t)regs + capture_engine_reg_64[i].dst_offset);
+			*field = ((u64)value << 32) | lower_32_bits(*field);
+			return;
+		}
+	}
+}
+
+static void guc_capture_find_ecode(struct __guc_capture_parsed_output *node,
+				   struct xe_hw_engine_snapshot *snapshot)
+{
+	struct gcap_reg_list_info *reginfo;
+	struct guc_mmio_reg *regs;
+	int i;
+
+	if (!node)
+		return;
+
+	reginfo = node->reginfo + GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE;
+	regs = reginfo->regs;
+	for (i = 0; i < reginfo->num_regs; i++)
+		cp_reg_to_snapshot(regs[i].offset, regs[i].value, &snapshot->reg);
+}
+
+/**
+ * xe_hw_engine_snapshot_from_capture - Take a engine snapshot from GuC capture.
+ * @hwe: Xe HW Engine.
+ * @snapshot: Xe HW Engine snapshot object to save data, copied from error capture
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: None
+ */
+void
+xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_guc *guc = &gt->uc.guc;
+	struct __guc_capture_parsed_output *n, *ntmp;
+
+	/* If no GuC capture available, take it from engine */
+	if (!guc->capture)
+		return xe_hw_engine_snapshot_from_engine(hwe, snapshot);
+
+	/*
+	 * Look for a matching GuC reported error capture node from
+	 * the internal output link-list based on engine class and instance.
+	 */
+	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+		u32 hwe_guc_class = xe_engine_class_to_guc_class(hwe->class);
+
+		if (n->eng_class == hwe_guc_class && n->eng_inst == hwe->instance) {
+			guc_capture_find_ecode(n, snapshot);
+			list_del(&n->link);
+			return;
+		}
+	}
+}
+#else	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
+
+void
+xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	xe_hw_engine_snapshot_from_engine(hwe, snapshot);
+}
+
+#endif	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
+
+/**
+ * xe_hw_engine_snapshot_from_engine - Take a quick engine snapshot from HW.
+ * @hwe: Xe HW Engine.
+ * @snapshot: Point to the Xe HW Engine snapshot object to save data.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: None
+ */
+void
+xe_hw_engine_snapshot_from_engine(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg); i++) {
+		u32 *field = (u32 *)((uintptr_t)&snapshot->reg + capture_engine_reg[i].dst_offset);
+		*field = hw_engine_mmio_read32(hwe, capture_engine_reg[i].reg);
+	}
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg_64); i++) {
+		u64 *field = (u64 *)((uintptr_t)&snapshot->reg +
+				      capture_engine_reg_64[i].dst_offset);
+		*field = hw_engine_mmio_read32(hwe, capture_engine_reg_64[i].reg_lo) |
+			 (u64)hw_engine_mmio_read32(hwe, capture_engine_reg_64[i].reg_hi) << 32;
+	}
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+}
+
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -749,7 +917,6 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
-	u64 val;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
@@ -767,48 +934,14 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
 
-	snapshot->reg.ring_execlist_status =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-	snapshot->reg.ring_execlist_status |= val << 32;
-
-	snapshot->reg.ring_execlist_sq_contents =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
-	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
-	snapshot->reg.ring_execlist_sq_contents |= val << 32;
-
-	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
-	val = hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
-	snapshot->reg.ring_acthd |= val << 32;
-
-	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
-	val = hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
-	snapshot->reg.ring_bbaddr |= val << 32;
-
-	snapshot->reg.ring_dma_fadd =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
-	val = hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
-	snapshot->reg.ring_dma_fadd |= val << 32;
-
-	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
-	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
-	snapshot->reg.ring_head =
-		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
-	snapshot->reg.ring_tail =
-		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
-	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
-	snapshot->reg.ring_mi_mode =
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
-	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
-	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
-	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
-	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
-	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
-	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+	if (xe_device_uc_enabled(gt_to_xe(hwe->gt)))
+		xe_hw_engine_snapshot_from_capture(hwe, snapshot);
+	else
+		xe_hw_engine_snapshot_from_engine(hwe, snapshot);
 
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+	/* appy mask for ring head and tail */
+	snapshot->reg.ring_head &= HEAD_ADDR;
+	snapshot->reg.ring_tail &= TAIL_ADDR;
 
 	return snapshot;
 }
@@ -823,6 +956,8 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 				 struct drm_printer *p)
 {
+	int i;
+
 	if (!snapshot)
 		return;
 
@@ -831,27 +966,23 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 		   snapshot->logical_instance);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
-	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
-	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
-		   snapshot->reg.ring_execlist_status);
-	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
-		   snapshot->reg.ring_execlist_sq_contents);
-	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
-	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
-	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
-	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
-	drm_printf(p, "\tRING_MI_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
-	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		   snapshot->reg.ring_mode);
-	drm_printf(p, "\tRING_IMR: 0x%08x\n", snapshot->reg.ring_imr);
-	drm_printf(p, "\tRING_ESR: 0x%08x\n", snapshot->reg.ring_esr);
-	drm_printf(p, "\tRING_EMR: 0x%08x\n", snapshot->reg.ring_emr);
-	drm_printf(p, "\tRING_EIR: 0x%08x\n", snapshot->reg.ring_eir);
-	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
-	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
-	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
-	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
+
+	for (i = 0;
+	     /* Skip RCU_MODE, the last print */
+	     i < ARRAY_SIZE(capture_engine_reg) - 1;
+	     i++) {
+		u32 *field = (u32 *)((uintptr_t)&snapshot->reg + capture_engine_reg[i].dst_offset);
+
+		drm_printf(p, "\t%s: 0x%08x\n", capture_engine_reg[i].regname, *field);
+	}
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg_64); i++) {
+		u64 *field = (u64 *)((uintptr_t)&snapshot->reg +
+				     capture_engine_reg_64[i].dst_offset);
+
+		drm_printf(p, "\t%s: 0x%016llx\n", capture_engine_reg_64[i].regname, *field);
+	}
+
+	/* Last RCU_MODE print */
 	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..937ce20ea8de 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -62,6 +62,10 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
+void xe_hw_engine_snapshot_from_engine(struct xe_hw_engine *hwe,
+				       struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe,
+					struct xe_hw_engine_snapshot *snapshot);
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
 	return hwe->name;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index d7f828c76cc5..2c2af771e5e7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -150,6 +150,61 @@ struct xe_hw_engine {
 	struct xe_hw_engine_class_intf *eclass;
 };
 
+struct __reg_map_descr {
+	u32 dst_offset;
+	const char *regname;
+	struct xe_reg reg;
+};
+
+struct __reg_map_descr_64 {
+	u32 dst_offset;
+	const char *regname;
+	struct xe_reg reg_lo;
+	struct xe_reg reg_hi;
+};
+
+/** @reg: Useful MMIO register snapshot */
+struct snap_shot_regs {
+	/** @reg.ring_acthd: RING_ACTHD */
+	u64 ring_acthd;
+	/** @reg.ring_bbaddr: RING_BBADDR */
+	u64 ring_bbaddr;
+	/** @reg.ring_dma_fadd: RING_DMA_FADD */
+	u64 ring_dma_fadd;
+	/** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
+	u64 ring_execlist_status;
+	/** @reg.ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
+	u64 ring_execlist_sq_contents;
+	/** @reg.ring_hwstam: RING_HWSTAM */
+	u32 ring_hwstam;
+	/** @reg.ring_hws_pga: RING_HWS_PGA */
+	u32 ring_hws_pga;
+	/** @reg.ring_start: RING_START */
+	u32 ring_start;
+	/** @reg.ring_head: RING_HEAD */
+	u32 ring_head;
+	/** @reg.ring_tail: RING_TAIL */
+	u32 ring_tail;
+	/** @reg.ring_ctl: RING_CTL */
+	u32 ring_ctl;
+	/** @reg.ring_mi_mode: RING_MI_MODE */
+	u32 ring_mi_mode;
+	/** @reg.ring_mode: RING_MODE */
+	u32 ring_mode;
+	/** @reg.ring_imr: RING_IMR */
+	u32 ring_imr;
+	/** @reg.ring_esr: RING_ESR */
+	u32 ring_esr;
+	/** @reg.ring_emr: RING_EMR */
+	u32 ring_emr;
+	/** @reg.ring_eir: RING_EIR */
+	u32 ring_eir;
+	/** @reg.ipehr: IPEHR */
+	u32 ipehr;
+	/** @reg.rcu_mode: RCU_MODE */
+	u32 rcu_mode;
+};
+
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -172,46 +227,7 @@ struct xe_hw_engine_snapshot {
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/** @reg: Useful MMIO register snapshot */
-	struct {
-		/** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
-		u64 ring_execlist_status;
-		/** @reg.ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
-		u64 ring_execlist_sq_contents;
-		/** @reg.ring_acthd: RING_ACTHD */
-		u64 ring_acthd;
-		/** @reg.ring_bbaddr: RING_BBADDR */
-		u64 ring_bbaddr;
-		/** @reg.ring_dma_fadd: RING_DMA_FADD */
-		u64 ring_dma_fadd;
-		/** @reg.ring_hwstam: RING_HWSTAM */
-		u32 ring_hwstam;
-		/** @reg.ring_hws_pga: RING_HWS_PGA */
-		u32 ring_hws_pga;
-		/** @reg.ring_start: RING_START */
-		u32 ring_start;
-		/** @reg.ring_head: RING_HEAD */
-		u32 ring_head;
-		/** @reg.ring_tail: RING_TAIL */
-		u32 ring_tail;
-		/** @reg.ring_ctl: RING_CTL */
-		u32 ring_ctl;
-		/** @reg.ring_mi_mode: RING_MI_MODE */
-		u32 ring_mi_mode;
-		/** @reg.ring_mode: RING_MODE */
-		u32 ring_mode;
-		/** @reg.ring_imr: RING_IMR */
-		u32 ring_imr;
-		/** @reg.ring_esr: RING_ESR */
-		u32 ring_esr;
-		/** @reg.ring_emr: RING_EMR */
-		u32 ring_emr;
-		/** @reg.ring_eir: RING_EIR */
-		u32 ring_eir;
-		/** @reg.ipehr: IPEHR */
-		u32 ipehr;
-		/** @reg.rcu_mode: RCU_MODE */
-		u32 rcu_mode;
-	} reg;
+	struct snap_shot_regs reg;
 };
 
 #endif
-- 
2.34.1

