Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A097C28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 16:22:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89FC10E4B2;
	Tue, 18 Mar 2025 16:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M0VukrOh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6850210E4B1
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Mar 2025 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KKEFlXxdu2TSjpwtPSOpztWoI8F50AMGEvtsM+GMNXc=; b=M0VukrOhGveAWwzGJYuw4mEWO8
 qkeJached8KoR4/UJRS7k3x/2JyN8Vc22vDBPdnP5wdDH1Xh1SgC82STcoTBDjORAQnVByXCgdeb+
 z7w3jp8iHB09SFYqT/XO+14dXAQzZhekKwMXnC+XkOMRRCetQxNWGM0nYM82HDNe5Ng/YWCExSklb
 CtNeUpbHSJjsmoOK3UgPbKdCYivWJYgJL5CPK0w8jl03RPWU2N0sqGATgqr2HS5tYqjaYl8WhsvzO
 wU2wJZdOUwBSX8sa3kT0hZXcBDddx27XYG3lf6yq8ceIp/0nKaJ/+3xryu9dDSWX+qLeHXOY+lB0h
 Y9Ad805g==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tuZi4-002odJ-NM; Tue, 18 Mar 2025 17:22:32 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 1/8] drm/xe: Add ring buffer handling for AuxCCS
Date: Tue, 18 Mar 2025 16:22:16 +0000
Message-ID: <20250318162224.78846-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
References: <20250318162224.78846-1-tvrtko.ursulin@igalia.com>
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

Align the ring buffer handling of required AuxCCS flushes and
invalidations with the reference implementation from i915.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              | 173 ++++++++++--------
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
 5 files changed, 106 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index a255946b6f77..93e4687feb71 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -45,6 +45,7 @@
 
 #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
 #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<27)
 #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
 #define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
 #define   PIPE_CONTROL_LRI_POST_SYNC			BIT(23)
diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index eba582058d55..ae62a8b83265 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -76,4 +76,10 @@
 #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
 #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
 
+#define MI_SEMAPHORE_WAIT_TOKEN		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(3)) /* XeLP+ */
+#define   MI_SEMAPHORE_REGISTER_POLL	REG_BIT(16)
+#define   MI_SEMAPHORE_POLL		REG_BIT(15)
+#define   MI_SEMAPHORE_CMP_OP_MASK	REG_GENMASK(14, 12)
+#define   MI_SEMAPHORE_SAD_EQ_SDD	REG_FIELD_PREP(MI_SEMAPHORE_CMP_OP_MASK, 4)
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index da1f198ac107..300335dc8c5e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -89,6 +89,7 @@
 #define CCS_AUX_INV				XE_REG(0x4208)
 
 #define VD0_AUX_INV				XE_REG(0x4218)
+#define BCS_AUX_INV				XE_REG(0x4248)
 #define VE0_AUX_INV				XE_REG(0x4238)
 
 #define VE1_AUX_INV				XE_REG(0x42b8)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 917fc16de866..a380964f3166 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -56,7 +56,14 @@ static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
 	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
 	dw[i++] = reg.addr + gt->mmio.adj_offset;
 	dw[i++] = AUX_INV;
-	dw[i++] = MI_NOOP;
+	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
+		  MI_SEMAPHORE_REGISTER_POLL |
+		  MI_SEMAPHORE_POLL |
+		  MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = 0;
+	dw[i++] = reg.addr + gt->mmio.adj_offset;
+	dw[i++] = 0;
+	dw[i++] = 0;
 
 	return i;
 }
@@ -167,9 +174,11 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 	return i;
 }
 
-static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
+static int emit_render_cache_flush(struct xe_sched_job *job, bool flush_l3,
+				   u32 *dw, int i)
 {
 	struct xe_gt *gt = job->q->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 flags;
 
@@ -184,6 +193,16 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 		 PIPE_CONTROL_DC_FLUSH_ENABLE |
 		 PIPE_CONTROL_FLUSH_ENABLE);
 
+	/*
+	 * L3 fabric flush is needed for AUX CCS invalidation
+	 * which happens as part of pipe-control so we can
+	 * ignore PIPE_CONTROL_FLUSH_L3. Also PIPE_CONTROL_FLUSH_L3
+	 * deals with Protected Memory which is not needed for
+	 * AUX CCS invalidation and lead to unwanted side effects.
+	 */
+	if (flush_l3 && GRAPHICS_VERx100(xe) < 1270)
+		flags |= PIPE_CONTROL_FLUSH_L3;
+
 	if (XE_WA(gt, 1409600907))
 		flags |= PIPE_CONTROL_DEPTH_STALL;
 
@@ -240,44 +259,6 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 	return i;
 }
 
-/* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
-static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
-				    u64 batch_addr, u32 seqno)
-{
-	u32 dw[MAX_JOB_SIZE_DW], i = 0;
-	u32 ppgtt_flag = get_ppgtt_flag(job);
-	struct xe_gt *gt = job->q->gt;
-
-	i = emit_copy_timestamp(lrc, dw, i);
-
-	if (job->ring_ops_flush_tlb) {
-		dw[i++] = preparser_disable(true);
-		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, MI_INVALIDATE_TLB, dw, i);
-		dw[i++] = preparser_disable(false);
-	} else {
-		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, dw, i);
-	}
-
-	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
-
-	if (job->user_fence.used) {
-		i = emit_flush_dw(dw, i);
-		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
-						job->user_fence.value,
-						dw, i);
-	}
-
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
-
-	i = emit_user_interrupt(dw, i);
-
-	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
-
-	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
-}
-
 static bool has_aux_ccs(struct xe_device *xe)
 {
 	/*
@@ -292,36 +273,51 @@ static bool has_aux_ccs(struct xe_device *xe)
 	return !xe->info.has_flat_ccs;
 }
 
-static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
-				   u64 batch_addr, u32 seqno)
+static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
+				 u64 batch_addr, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
+	const unsigned int class = job->q->class;
+	const bool aux_ccs = has_aux_ccs(xe) &&
+			     (class == XE_ENGINE_CLASS_COPY ||
+			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
+	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
-	dw[i++] = preparser_disable(true);
-
-	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe)) {
-		if (decode)
-			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
-		else
-			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
-	}
-
-	if (job->ring_ops_flush_tlb)
+	if (invalidate_tlb) {
+		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, MI_INVALIDATE_TLB, dw, i);
+					seqno,
+					MI_INVALIDATE_TLB |
+					(aux_ccs ? MI_FLUSH_DW_CCS : 0),
+					dw, i);
+		/* hsdes: 1809175790 */
+		if (aux_ccs) {
+			struct xe_reg reg;
 
-	dw[i++] = preparser_disable(false);
+			switch (job->q->class) {
+			case XE_ENGINE_CLASS_COPY:
+				reg = BCS_AUX_INV;
+				break;
+			case XE_ENGINE_CLASS_VIDEO_DECODE:
+				reg = VD0_AUX_INV;
+				break;
+			default:
+				reg = VE0_AUX_INV;
+			};
 
-	if (!job->ring_ops_flush_tlb)
+			i = emit_aux_table_inv(gt, reg, dw, i);
+		}
+		dw[i++] = preparser_disable(false);
+	} else {
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, dw, i);
+	}
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
@@ -350,10 +346,16 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	const bool aux_ccs = has_aux_ccs(xe);
+	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
 	u32 mask_flags = 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
+	/* hsdes: 1809175790 */
+	if (aux_ccs)
+		i = emit_render_cache_flush(job, 0, dw, i);
+
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
@@ -361,10 +363,10 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
-	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
+	i = emit_pipe_invalidate(mask_flags, invalidate_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe))
+	if (aux_ccs)
 		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
 
 	dw[i++] = preparser_disable(false);
@@ -374,7 +376,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
-	i = emit_render_cache_flush(job, dw, i);
+	i = emit_render_cache_flush(job, true, dw, i);
 
 	if (job->user_fence.used)
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
@@ -395,12 +397,29 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 seqno)
 {
+	struct xe_gt *gt = job->q->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	const bool aux_ccs = has_aux_ccs(xe);
+	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
-	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-				seqno, dw, i);
+	if (invalidate_tlb) {
+		dw[i++] = preparser_disable(true);
+		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
+					seqno,
+					MI_INVALIDATE_TLB |
+					(aux_ccs ? MI_FLUSH_DW_CCS : 0),
+					dw, i);
+		/* hsdes: 1809175790 */
+		if (aux_ccs)
+			i = emit_aux_table_inv(gt, BCS_AUX_INV, dw, i);
+		dw[i++] = preparser_disable(false);
+	} else {
+		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
+					seqno, dw, i);
+	}
 
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
 
@@ -410,16 +429,18 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 		/* XXX: Do we need this? Leaving for now. */
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_invalidate(dw, i);
+		if (aux_ccs)
+			i = emit_aux_table_inv(gt, BCS_AUX_INV, dw, i);
 		dw[i++] = preparser_disable(false);
 	}
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
-		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
-	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
-	dw[i++] = 0;
-	dw[i++] = seqno; /* value */
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
+				MI_INVALIDATE_TLB |
+				(aux_ccs ? MI_FLUSH_DW_CCS : 0) |
+				job->migrate_flush_flags,
+				dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
@@ -434,9 +455,9 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 
 	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
 
-	__emit_job_gen12_simple(job, job->q->lrc[0],
-				job->ptrs[0].batch_addr,
-				xe_sched_job_lrc_seqno(job));
+	__emit_job_gen12_xcs(job, job->q->lrc[0],
+			     job->ptrs[0].batch_addr,
+			     xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_copy(struct xe_sched_job *job)
@@ -450,9 +471,9 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 	}
 
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_simple(job, job->q->lrc[i],
-					job->ptrs[i].batch_addr,
-					xe_sched_job_lrc_seqno(job));
+		__emit_job_gen12_xcs(job, job->q->lrc[i],
+				     job->ptrs[i].batch_addr,
+				     xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_video(struct xe_sched_job *job)
@@ -461,9 +482,9 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 
 	/* FIXME: Not doing parallel handshake for now */
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_video(job, job->q->lrc[i],
-				       job->ptrs[i].batch_addr,
-				       xe_sched_job_lrc_seqno(job));
+		__emit_job_gen12_xcs(job, job->q->lrc[i],
+				     job->ptrs[i].batch_addr,
+				     xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_render_compute(struct xe_sched_job *job)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index 1ae56e2ee7b4..d7e3e150a9a5 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -8,7 +8,7 @@
 
 struct xe_sched_job;
 
-#define MAX_JOB_SIZE_DW 48
+#define MAX_JOB_SIZE_DW 58
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
 /**
-- 
2.48.0

