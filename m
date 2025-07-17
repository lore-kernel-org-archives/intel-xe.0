Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C066C83F3C
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C265D10E821;
	Thu, 17 Jul 2025 13:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S0rPEyWn";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E9A10E80F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dSNUM7oVx1h3/sM5l9DKOHsmF4ZbOF05dLEj7OXrrB8=; b=S0rPEyWn5susLhaWi5c4/BiYe1
 u3rXzOyNZw5Ru8kc2m7FKrn6EzFltMHKxHMv4qfCcIVJLyzc8mJV9DjEGj35Yj11KIEXb1V258QJO
 TQtpnumk8G9BXpTxZRXdX/EVGt6VUwwJYGbVvYWZZA1x6nSKrV8PG0Hk7moncWUilukUAWvLUIb3/
 jeVlKmozLJ5T6pYBlfU5CB/mvpLT44pQqmkJeH+0Q4quGQGr89JQPTNcgf3u3d9K0ear2ZvJwj9lL
 IMXxlxF+SrypHVtQVtnLx1jKEs+swQxquY+f2WSNeYzPOf2JX/JUYiAJeD0gcwo8rzzgAXoHM6Vqv
 CbryU3Bg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucOHv-0009Ou-29
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 15:04:39 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 05/17] drm/xe/xelp: Support auxccs invalidation on blitter
Date: Thu, 17 Jul 2025 14:04:21 +0100
Message-ID: <20250717130434.82251-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250717130434.82251-1-tvrtko.ursulin@igalia.com>
References: <20250717130434.82251-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/xe_ring_ops.c     | 104 +++++++++++----------------
 2 files changed, 41 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5cd5ab8529c5..db15801445b0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -88,6 +88,7 @@
 #define CCS_AUX_INV				XE_REG(0x4208)
 
 #define VD0_AUX_INV				XE_REG(0x4218)
+#define BCS_AUX_INV				XE_REG(0x4248)
 #define VE0_AUX_INV				XE_REG(0x4238)
 
 #define VE1_AUX_INV				XE_REG(0x42b8)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 10b3e3679457..2e16d45cff55 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -259,44 +259,6 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
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
@@ -311,36 +273,50 @@ static bool has_aux_ccs(struct xe_device *xe)
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
+					MI_INVALIDATE_TLB,
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
 
@@ -453,9 +429,9 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 
 	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
 
-	__emit_job_gen12_simple(job, job->q->lrc[0],
-				job->ptrs[0].batch_addr,
-				xe_sched_job_lrc_seqno(job));
+	__emit_job_gen12_xcs(job, job->q->lrc[0],
+			     job->ptrs[0].batch_addr,
+			     xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_copy(struct xe_sched_job *job)
@@ -469,9 +445,9 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
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
@@ -480,9 +456,9 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 
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
-- 
2.48.0

