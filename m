Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC417C47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CB910EFBF;
	Mon, 22 Jan 2024 21:26:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE99710EFC8
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705958763; x=1737494763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xOZuuRn8Jo95/qDWYE4REQv1f6GzO8TaWty+dFyUy74=;
 b=gz10IiAzTkJszlM+Uk6XA72TplWsA5IbQgCtqroohi+4LVPa1CLqCMv0
 7wdN+8dJ9+K7sllui9/8yQBwHlNyuLiaiMOD1PZk/Oo3ZWuV0o1YdRzof
 +Gyam0iUl9Y7yplTEsWJlZXBqWefeeFzVPNZd0tTOtSgT1VU0nhD85U7q
 /s8Eiq1q1uTkibo8TtOmgppK7zOlMCcQBQKGaUAxG/hZj89wpFMXFvQBQ
 ROkQCsGGqisZCqxWTmxo0YtBGs8G+9U1HLccxNEfy4UlCgRsFarrfHPXv
 imiE04k611yYo+dZ6imm24o2XN8d3nD5LpkuOFHFdPXqp6mhoAaN9G/3R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432488203"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432488203"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1432777"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2024 13:26:02 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 9/9] drm/xe/guc: Plumb GuC-capture into dev coredump
Date: Mon, 22 Jan 2024 13:25:57 -0800
Message-Id: <20240122212557.55929-10-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122212557.55929-1-zhanjun.dong@intel.com>
References: <20240122212557.55929-1-zhanjun.dong@intel.com>
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
 drivers/gpu/drm/xe/xe_hw_engine.c       | 173 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_hw_engine.h       |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 108 ++++++++-------
 3 files changed, 196 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 3aaab507f37f..77fc39cbf263 100644
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
@@ -258,6 +261,33 @@ static const struct engine_info engine_infos[] = {
 	},
 };
 
+struct __reg_map_descr capture_engine_reg[] = {
+	{offsetof(struct snap_shot_regs, ring_hwstam),			RING_HWSTAM(0)},
+	{offsetof(struct snap_shot_regs, ring_hws_pga),			RING_HWS_PGA(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_status_lo),	RING_EXECLIST_STATUS_LO(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_status_hi),	RING_EXECLIST_STATUS_HI(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_lo),	RING_EXECLIST_SQ_CONTENTS_LO(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_hi),	RING_EXECLIST_SQ_CONTENTS_HI(0)},
+	{offsetof(struct snap_shot_regs, ring_start),			RING_START(0)},
+	{offsetof(struct snap_shot_regs, ring_head),			RING_HEAD(0)},
+	{offsetof(struct snap_shot_regs, ring_tail),			RING_TAIL(0)},
+	{offsetof(struct snap_shot_regs, ring_ctl),			RING_CTL(0)},
+	{offsetof(struct snap_shot_regs, ring_mi_mode),			RING_MI_MODE(0)},
+	{offsetof(struct snap_shot_regs, ring_mode),			RING_MODE(0)},
+	{offsetof(struct snap_shot_regs, ring_imr),			RING_IMR(0)},
+	{offsetof(struct snap_shot_regs, ring_esr),			RING_ESR(0)},
+	{offsetof(struct snap_shot_regs, ring_emr),			RING_EMR(0)},
+	{offsetof(struct snap_shot_regs, ring_eir),			RING_EIR(0)},
+	{offsetof(struct snap_shot_regs, ring_acthd_udw),		RING_ACTHD_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_acthd),			RING_ACTHD(0)},
+	{offsetof(struct snap_shot_regs, ring_bbaddr_udw),		RING_BBADDR_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_bbaddr),			RING_BBADDR(0)},
+	{offsetof(struct snap_shot_regs, ring_dma_fadd_udw),		RING_DMA_FADD_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_dma_fadd),		RING_DMA_FADD(0)},
+	{offsetof(struct snap_shot_regs, ipehr),			RING_IPEHR(0)},
+	{offsetof(struct snap_shot_regs, rcu_mode),			RCU_MODE},
+};
+
 static void hw_engine_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
@@ -735,6 +765,103 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
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
+ * xe_hw_engine_snapshot_from_capture - Take a quick snapshot of the HW Engine.
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
+	if (!guc->capture)
+		return;
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
+
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
+ * xe_hw_engine_snapshot_from_capture - Take a quick snapshot of the HW Engine.
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
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+}
+
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -766,46 +893,14 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
 
-	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
-							   RING_HWS_PGA(0));
-	snapshot->reg.ring_execlist_status_lo =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	snapshot->reg.ring_execlist_status_hi =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-	snapshot->reg.ring_execlist_sq_contents_lo =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_LO(0));
-	snapshot->reg.ring_execlist_sq_contents_hi =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_HI(0));
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
index c258228b244f..78447fea4efd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -153,6 +153,63 @@ struct xe_hw_engine {
 	struct xe_hw_engine_class_intf *eclass;
 };
 
+struct __reg_map_descr {
+	u32 dst_offset;
+	struct xe_reg reg;
+};
+
+/** @reg: Useful MMIO register snapshot */
+struct snap_shot_regs {
+	/** @ring_hwstam: RING_HWSTAM */
+	u32 ring_hwstam;
+	/** @ring_hws_pga: RING_HWS_PGA */
+	u32 ring_hws_pga;
+	/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
+	u32 ring_execlist_status_lo;
+	/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
+	u32 ring_execlist_status_hi;
+	/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
+	u32 ring_execlist_sq_contents_lo;
+	/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
+	u32 ring_execlist_sq_contents_hi;
+	/** @ring_start: RING_START */
+	u32 ring_start;
+	/** @ring_head: RING_HEAD */
+	u32 ring_head;
+	/** @ring_tail: RING_TAIL */
+	u32 ring_tail;
+	/** @ring_ctl: RING_CTL */
+	u32 ring_ctl;
+	/** @ring_mi_mode: RING_MI_MODE */
+	u32 ring_mi_mode;
+	/** @ring_mode: RING_MODE */
+	u32 ring_mode;
+	/** @ring_imr: RING_IMR */
+	u32 ring_imr;
+	/** @ring_esr: RING_ESR */
+	u32 ring_esr;
+	/** @ring_emr: RING_EMR */
+	u32 ring_emr;
+	/** @ring_eir: RING_EIR */
+	u32 ring_eir;
+	/** @ring_acthd_udw: RING_ACTHD_UDW */
+	u32 ring_acthd_udw;
+	/** @ring_acthd: RING_ACTHD */
+	u32 ring_acthd;
+	/** @ring_bbaddr_udw: RING_BBADDR_UDW */
+	u32 ring_bbaddr_udw;
+	/** @ring_bbaddr: RING_BBADDR */
+	u32 ring_bbaddr;
+	/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
+	u32 ring_dma_fadd_udw;
+	/** @ring_dma_fadd: RING_DMA_FADD */
+	u32 ring_dma_fadd;
+	/** @ipehr: IPEHR */
+	u32 ipehr;
+	/** @rcu_mode: RCU_MODE */
+	u32 rcu_mode;
+};
+
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -175,56 +232,7 @@ struct xe_hw_engine_snapshot {
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/** @reg: Useful MMIO register snapshot */
-	struct {
-		/** @ring_hwstam: RING_HWSTAM */
-		u32 ring_hwstam;
-		/** @ring_hws_pga: RING_HWS_PGA */
-		u32 ring_hws_pga;
-		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
-		u32 ring_execlist_status_lo;
-		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
-		u32 ring_execlist_status_hi;
-		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
-		u32 ring_execlist_sq_contents_lo;
-		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
-		u32 ring_execlist_sq_contents_hi;
-		/** @ring_start: RING_START */
-		u32 ring_start;
-		/** @ring_head: RING_HEAD */
-		u32 ring_head;
-		/** @ring_tail: RING_TAIL */
-		u32 ring_tail;
-		/** @ring_ctl: RING_CTL */
-		u32 ring_ctl;
-		/** @ring_mi_mode: RING_MI_MODE */
-		u32 ring_mi_mode;
-		/** @ring_mode: RING_MODE */
-		u32 ring_mode;
-		/** @ring_imr: RING_IMR */
-		u32 ring_imr;
-		/** @ring_esr: RING_ESR */
-		u32 ring_esr;
-		/** @ring_emr: RING_EMR */
-		u32 ring_emr;
-		/** @ring_eir: RING_EIR */
-		u32 ring_eir;
-		/** @ring_acthd_udw: RING_ACTHD_UDW */
-		u32 ring_acthd_udw;
-		/** @ring_acthd: RING_ACTHD */
-		u32 ring_acthd;
-		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
-		u32 ring_bbaddr_udw;
-		/** @ring_bbaddr: RING_BBADDR */
-		u32 ring_bbaddr;
-		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
-		u32 ring_dma_fadd_udw;
-		/** @ring_dma_fadd: RING_DMA_FADD */
-		u32 ring_dma_fadd;
-		/** @ipehr: IPEHR */
-		u32 ipehr;
-		/** @rcu_mode: RCU_MODE */
-		u32 rcu_mode;
-	} reg;
+	struct snap_shot_regs reg;
 };
 
 #endif
-- 
2.34.1

