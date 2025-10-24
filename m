Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9735DCCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 10:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1675F10EA24;
	Fri, 24 Oct 2025 10:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ugops8lQ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53FA10EA24
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iCnjkvgebm5+s8Ic9/qkPxrWARyL2osNIgl+irFnft0=; b=Ugops8lQeLwO+Zdd7FfmBcEmOc
 dFvaPF3ZznqZ+Dz1aFpo/bJ0WJdAN3J3VoduusxFNHBteioNPX2fVEcyxGbK1EVi7mjQCcyqfTyBk
 iWonwp3YQ3JZDgHagSdOUNtrsVcen/VPNyB8Cs2+4TmR5mr0PfQs0sKPGK7UhXLAItprUdkJKFWUW
 R5BGEiJv7cT3kbAf29TaulahBZkuCN0Y65CQLWNmCqAEhlUkelImtFYyB+m6Tt4F+C0VqksiUYEqU
 K5pH6DOnTgNXKFRrHqdoCuf5SRA/L9BCSWfI5dTRZLRs/bU1G08VaVVnk+NzEYW9jzTkj4mqGufX9
 aj+e3ndg==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCFKX-00Eick-1i; Fri, 24 Oct 2025 12:47:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v14 04/13] drm/xe/xelp: Support auxccs invalidation on blitter
Date: Fri, 24 Oct 2025 11:47:17 +0100
Message-ID: <20251024104727.74886-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
References: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
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

Auxccs platforms need to be able to invalidate auxccs on the blitter
engine.

Add the relevant mmio register and enable this by refactoring the ring
emission a bit to consolidate all non-render engines.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   1 +
 drivers/gpu/drm/xe/xe_ring_ops.c     | 133 ++++++++++++---------------
 2 files changed, 58 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3545e0be06da..faa05a2282af 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -94,6 +94,7 @@
 #define CCS_AUX_INV				XE_REG(0x4208)
 
 #define VD0_AUX_INV				XE_REG(0x4218)
+#define BCS_AUX_INV				XE_REG(0x4248) /* 12.70+ */
 #define VE0_AUX_INV				XE_REG(0x4238)
 
 #define VE1_AUX_INV				XE_REG(0x42b8)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index f384c9968859..6071a493635c 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -248,47 +248,7 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 	return i;
 }
 
-/* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
-static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
-				    u64 batch_addr, u32 *head, u32 seqno)
-{
-	u32 dw[MAX_JOB_SIZE_DW], i = 0;
-	u32 ppgtt_flag = get_ppgtt_flag(job);
-	struct xe_gt *gt = job->q->gt;
-
-	*head = lrc->ring.tail;
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
-static bool has_aux_ccs(struct xe_device *xe)
+static bool has_aux_ccs(struct xe_device *xe, enum xe_engine_class class)
 {
 	/*
 	 * PVC is a special case that has no compression of either type
@@ -296,46 +256,67 @@ static bool has_aux_ccs(struct xe_device *xe)
 	 * onward, so any future platforms with no FlatCCS will not have
 	 * AuxCCS either.
 	 */
-	if (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC)
+	if (GRAPHICS_VER(xe) >= 20 ||
+	    xe->info.platform == XE_PVC ||
+	    xe->info.has_flat_ccs)
 		return false;
 
-	return !xe->info.has_flat_ccs;
+	if (class == XE_ENGINE_CLASS_RENDER ||
+	    class == XE_ENGINE_CLASS_COMPUTE ||
+	    class == XE_ENGINE_CLASS_VIDEO_DECODE ||
+	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
+		return true;
+
+	if (class == XE_ENGINE_CLASS_COPY && GRAPHICS_VERx100(xe) >= 1270)
+		return true;
+
+	return false;
 }
 
-static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
-				   u64 batch_addr, u32 *head, u32 seqno)
+static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
+				 u64 batch_addr, u32 *head, u32 seqno)
 {
-	u32 dw[MAX_JOB_SIZE_DW], i = 0;
-	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
+	const enum xe_engine_class class = job->q->class;
+	const bool aux_ccs = has_aux_ccs(xe, class);
+	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
+	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
 	*head = lrc->ring.tail;
 
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
+					MI_INVALIDATE_TLB,
+					dw, i);
+		/* hsdes: 1809175790 */
+		if (aux_ccs) {
+			struct xe_reg reg;
 
-	dw[i++] = preparser_disable(false);
+			switch (class) {
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
 
-	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
+	i = emit_bb_start(batch_addr, get_ppgtt_flag(job), dw, i);
 
 	if (job->user_fence.used) {
 		i = emit_flush_dw(dw, i);
@@ -363,7 +344,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
-	const bool aux_ccs = has_aux_ccs(xe);
+	const bool aux_ccs = has_aux_ccs(xe, job->q->class);
 	u32 mask_flags = 0;
 
 	*head = lrc->ring.tail;
@@ -455,10 +436,10 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 
 	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
 
-	__emit_job_gen12_simple(job, job->q->lrc[0],
-				job->ptrs[0].batch_addr,
-				&job->ptrs[0].head,
-				xe_sched_job_lrc_seqno(job));
+	__emit_job_gen12_xcs(job, job->q->lrc[0],
+			     job->ptrs[0].batch_addr,
+			     &job->ptrs[0].head,
+			     xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_copy(struct xe_sched_job *job)
@@ -473,10 +454,10 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 	}
 
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_simple(job, job->q->lrc[i],
-					job->ptrs[i].batch_addr,
-					&job->ptrs[i].head,
-					xe_sched_job_lrc_seqno(job));
+		__emit_job_gen12_xcs(job, job->q->lrc[i],
+				     job->ptrs[i].batch_addr,
+				     &job->ptrs[0].head,
+				     xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_video(struct xe_sched_job *job)
@@ -485,10 +466,10 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 
 	/* FIXME: Not doing parallel handshake for now */
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_video(job, job->q->lrc[i],
-				       job->ptrs[i].batch_addr,
-				       &job->ptrs[i].head,
-				       xe_sched_job_lrc_seqno(job));
+		__emit_job_gen12_xcs(job, job->q->lrc[i],
+				     job->ptrs[i].batch_addr,
+				     &job->ptrs[0].head,
+				     xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_render_compute(struct xe_sched_job *job)
-- 
2.48.0

