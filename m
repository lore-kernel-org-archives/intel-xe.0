Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A7CC3ABBE
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 01:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29710E166;
	Wed,  7 May 2025 01:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aH++8yB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B8510E107
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 01:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746581445; x=1778117445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AH+DYjBKvG65rOY4j2oQATevJmwmBdnw2LfP3WhzAgc=;
 b=aH++8yB4p2B/X50taJdm8+oI6VXiwIo3fQotKJig0obqdu9iDb5qSwCY
 C9yKKFwAterR1UVMUxypH4+vvYqO0BxkTifRXIpJak+8kXLrOyJkf8x2r
 7XxjT7PzFdgdZdwVK3K2xeW1iKALAx282Uu4p732Xg1NavpdR1NTDRPbP
 K0MOMynNrB8bduFoUC63kQJERgGfqAZDv2/MOKkAgDRjBSQ2ml3t0RT/s
 xmYjE5T/vmCEN0rOROufKXd7wIhWB0VTJIa9xFupc8ZoOqyjqpSdMAGQx
 zJ0CXsPv6T9uBbY9wmNrEiIj7DsZtaV25EwzDfrFAijHOj4GJN4qnJeTe g==;
X-CSE-ConnectionGUID: XavIozJwTWuSgmp/NXup4w==
X-CSE-MsgGUID: QcKIPV8fTGCZak+DOncL7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58913461"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58913461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 18:30:42 -0700
X-CSE-ConnectionGUID: Q8HRcRXFTpq3QHv/fGklLA==
X-CSE-MsgGUID: Xuh7F8jbS2S3Upm1CjjLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="135792211"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 18:30:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Cc: michal.wajdeczko@intel.com
Subject: [PATCH v4 4/4] drm/xe: Add WA BB to capture active context utilization
Date: Tue,  6 May 2025 18:30:43 -0700
Message-ID: <20250507013039.2043897-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
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

Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks
of the context, but only gets updated when the context switches out. In
order to check how long a context has been active before it switches
out, two things are required:

(1) Determine if the context is running:

To do so, we program the WA BB to set an initial value for CTX_TIMESTAMP
in the LRC. The value chosen is 1 since 0 is the initial value when the
LRC is initialized. During a query, we just check for this value to
determine if the context is active. If the context switched out, it
would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
Note that WA BB runs as the last part of the context restore, so reusing
this LRC location will not clobber anything.

(2) Calculate the time that the context has been active for:

The CTX_TIMESTAMP ticks only when the context is active. If a context is
active, we just use the CTX_TIMESTAMP MMIO as the new value of
utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
for the specific engine instance. Since we do not know which instance
the context is running on until it is scheduled, we also read the
ENGINE_ID MMIO in the WA BB and store it in the PPHSWP.

Using the above 2 instructions in a WA BB, capture active context
utilization.

v2: (Matt Brost)
- This breaks TDR, fix it by saving the CTX_TIMESTAMP register
  "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
- Drop tile from LRC if using gt
  "drm/xe: Save the gt pointer in LRC and drop the tile"

v3:
- Remove helpers for bb_per_ctx_ptr (Matt)
- Add define for context active value (Matt)
- Use 64 bit CTX TIMESTAMP for platforms that support it. For platforms
  that don't, live with the rare race. (Matt, Lucas)
- Convert engine id to hwe and get the MMIO value (Lucas)
- Correct commit message on when WA BB runs (Lucas)

v4:
- s/GRAPHICS_VER(...)/xe->info.has_64bit_timestamp/ (Matt)
- Drop support for active utilization on a VF (CI failure)
- In xe_lrc_init ensure the lrc value is 0 to begin with (CI regression)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 156 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |   5 +-
 drivers/gpu/drm/xe/xe_trace_lrc.h        |   8 +-
 7 files changed, 167 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 52f4c96c01dc..7ade41e2b7b3 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -43,6 +43,10 @@
 #define XEHPC_BCS8_RING_BASE			0x3ee000
 #define GSCCS_RING_BASE				0x11a000
 
+#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
+#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
+#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
+
 #define RING_TAIL(base)				XE_REG((base) + 0x30)
 #define   TAIL_ADDR				REG_GENMASK(20, 3)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 8619244b7c7b..994af591a2e8 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -11,6 +11,7 @@
 #define CTX_RING_TAIL			(0x06 + 1)
 #define CTX_RING_START			(0x08 + 1)
 #define CTX_RING_CTL			(0x0a + 1)
+#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
 #define CTX_TIMESTAMP			(0x22 + 1)
 #define CTX_TIMESTAMP_UDW		(0x24 + 1)
 #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 606922d9dd73..cd9b1c32f30f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -830,7 +830,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_lrc *lrc;
-	u32 old_ts, new_ts;
+	u64 old_ts, new_ts;
 	int idx;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index b5f5547c7c4f..c78a7987739f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -24,6 +24,7 @@
 #include "xe_hw_fence.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_trace_lrc.h"
 #include "xe_vm.h"
@@ -655,6 +656,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
+#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
 
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
 {
@@ -704,6 +706,11 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
 }
 
+static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
+{
+	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
+}
+
 static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
 {
 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
@@ -745,6 +752,7 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
 DECL_MAP_ADDR_HELPERS(parallel)
 DECL_MAP_ADDR_HELPERS(indirect_ring)
+DECL_MAP_ADDR_HELPERS(engine_id)
 
 #undef DECL_MAP_ADDR_HELPERS
 
@@ -932,6 +940,65 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 	xe_bo_unpin(lrc->bo);
 	xe_bo_unlock(lrc->bo);
 	xe_bo_put(lrc->bo);
+	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
+}
+
+/*
+ * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
+ * context run ticks.
+ * @lrc: Pointer to the lrc.
+ *
+ * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
+ * context, but only gets updated when the context switches out. In order to
+ * check how long a context has been running before it switches out, two things
+ * are required:
+ *
+ * (1) Determine if the context is running
+ * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
+ * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
+ * initialized. During a query, we just check for this value to determine if the
+ * context is active. If the context switched out, it would overwrite this
+ * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
+ * after the context has been restored, so reusing this lrc location will not
+ * clobber anything.
+ *
+ * (2) Calculate the time that the context has been running for
+ * The CTX_TIMESTAMP ticks only when the context is active. If a context is
+ * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
+ * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
+ * engine instance. Since we do not know which instance the context is running
+ * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
+ * store it in the PPHSWP.
+ */
+#define CONTEXT_ACTIVE 1ULL
+static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
+{
+	u32 *cmd;
+
+	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+
+	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
+	*cmd++ = ENGINE_ID(0).addr;
+	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
+	*cmd++ = 0;
+
+	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
+	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
+	*cmd++ = 0;
+	*cmd++ = lower_32_bits(CONTEXT_ACTIVE);
+
+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
+		*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
+		*cmd++ = __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
+		*cmd++ = 0;
+		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
+	}
+
+	*cmd++ = MI_BATCH_BUFFER_END;
+
+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
+			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
+
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
@@ -973,10 +1040,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
+	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
+						  ttm_bo_type_kernel,
+						  bo_flags);
+	if (IS_ERR(lrc->bb_per_ctx_bo)) {
+		err = PTR_ERR(lrc->bb_per_ctx_bo);
+		goto err_lrc_finish;
+	}
+
 	lrc->size = lrc_size;
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
-	lrc->ctx_timestamp = 0;
 
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
@@ -1049,7 +1123,11 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
 				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
 
+	lrc->ctx_timestamp = 0;
 	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
+		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
+	}
 
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
@@ -1078,6 +1156,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
+	xe_lrc_setup_utilization(lrc);
+
 	return 0;
 
 err_lrc_finish:
@@ -1297,6 +1377,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
 	return __xe_lrc_parallel_map(lrc);
 }
 
+/**
+ * xe_lrc_engine_id() - Read engine id value
+ * @lrc: Pointer to the lrc.
+ *
+ * Returns: context id value
+ */
+static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map;
+
+	map = __xe_lrc_engine_id_map(lrc);
+	return xe_map_read32(xe, &map);
+}
+
 static int instr_dw(u32 cmd_header)
 {
 	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
@@ -1844,22 +1939,75 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
 	kfree(snapshot);
 }
 
+static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
+{
+	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
+	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
+	struct xe_hw_engine *hwe;
+	u64 val;
+
+	hwe = xe_gt_hw_engine(lrc->gt, class, instance, false);
+	if (xe_gt_WARN_ONCE(lrc->gt, !hwe || xe_hw_engine_is_reserved(hwe),
+			    "Unexpected engine class:instance %d:%d for context utilization\n",
+			    class, instance))
+		return -1;
+
+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
+		val = xe_mmio_read64_2x32(&hwe->gt->mmio,
+					  RING_CTX_TIMESTAMP(hwe->mmio_base));
+	else
+		val = xe_mmio_read32(&hwe->gt->mmio,
+				     RING_CTX_TIMESTAMP(hwe->mmio_base));
+
+	*reg_ctx_ts = val;
+
+	return 0;
+}
+
 /**
  * xe_lrc_update_timestamp() - Update ctx timestamp
  * @lrc: Pointer to the lrc.
  * @old_ts: Old timestamp value
  *
  * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
- * update saved value.
+ * update saved value. With support for active contexts, the calculation may be
+ * slightly racy, so follow a read-again logic to ensure that the context is
+ * still active before returning the right timestamp.
  *
  * Returns: New ctx timestamp value
  */
-u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
 {
+	u64 lrc_ts, reg_ts;
+	u32 engine_id;
+
 	*old_ts = lrc->ctx_timestamp;
 
-	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
+	lrc_ts = xe_lrc_ctx_timestamp(lrc);
+	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
+	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
+		lrc->ctx_timestamp = lrc_ts;
+		goto done;
+	}
+
+	if (lrc_ts == CONTEXT_ACTIVE) {
+		engine_id = xe_lrc_engine_id(lrc);
+		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
+			lrc->ctx_timestamp = reg_ts;
+
+		/* read lrc again to ensure context is still active */
+		lrc_ts = xe_lrc_ctx_timestamp(lrc);
+	}
+
+	/*
+	 * If context switched out, just use the lrc_ts. Note that this needs to
+	 * be a separate if condition. Do not convert this to an else block
+	 * corresponding to the above if.
+	 */
+	if (lrc_ts != CONTEXT_ACTIVE)
+		lrc->ctx_timestamp = lrc_ts;
 
+done:
 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
 
 	return lrc->ctx_timestamp;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 513093c2b5d6..a0661ac6b1bc 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -138,6 +138,6 @@ u64 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
  *
  * Returns the current LRC timestamp
  */
-u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts);
+u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index cd38586ae989..ae24cf6f8dd9 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -52,7 +52,10 @@ struct xe_lrc {
 	struct xe_hw_fence_ctx fence_ctx;
 
 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
-	u32 ctx_timestamp;
+	u64 ctx_timestamp;
+
+	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
+	struct xe_bo *bb_per_ctx_bo;
 };
 
 struct xe_lrc_snapshot;
diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
index 5c669a0b2180..d525cbee1e34 100644
--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
@@ -19,12 +19,12 @@
 #define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
 
 TRACE_EVENT(xe_lrc_update_timestamp,
-	    TP_PROTO(struct xe_lrc *lrc, uint32_t old),
+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
 	    TP_ARGS(lrc, old),
 	    TP_STRUCT__entry(
 		     __field(struct xe_lrc *, lrc)
-		     __field(u32, old)
-		     __field(u32, new)
+		     __field(u64, old)
+		     __field(u64, new)
 		     __string(name, lrc->fence_ctx.name)
 		     __string(device_id, __dev_name_lrc(lrc))
 	    ),
@@ -36,7 +36,7 @@ TRACE_EVENT(xe_lrc_update_timestamp,
 		   __assign_str(name);
 		   __assign_str(device_id);
 		   ),
-	    TP_printk("lrc=:%p lrc->name=%s old=%u new=%u device_id:%s",
+	    TP_printk("lrc=:%p lrc->name=%s old=%llu new=%llu device_id:%s",
 		      __entry->lrc, __get_str(name),
 		      __entry->old, __entry->new,
 		      __get_str(device_id))
-- 
2.43.0

