Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620161075290
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 10:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EECF10E962;
	Thu, 19 Mar 2026 10:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="b8sGWouO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7E810E96A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 10:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gKtioFY2QUuZ8vb3nfoZKm/kaOhvlvXKRytq+ZJlOr0=; b=b8sGWouOOBL3LNG4oP46Sz1DoD
 KYo0NjZzSpxgoUue/nuw7/j8nQUETmTkzNb4yBmURDzBRIEWRWnDA16mW2EBziKeCDCqEPigTzzsY
 GskdK4CzeiETBGstElJbxHmBjrZVLlNY3LdI7w5Hn12ibpjBWSDIYnvr3hi9OONmux5424+ahHCZx
 vA+6FJqgDyPtXWqHk9EPcO8BupmQdwKp1SkRKFFRd84fTPd189Ci8aRy4GV06hkyR3GOWrkMbm8x8
 LEs3tBz2Fj/8GevlhrSs8X3r+6Ild2oubYSmJfhwM9gpOR5RwxppBJubBcvs9sGAuLr3wMuUlxdh1
 GJlJ2XTA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w3AHh-003Hdm-Lt; Thu, 19 Mar 2026 11:07:21 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v23 06/12] drm/xe: Move aux table invalidation to ring ops
Date: Thu, 19 Mar 2026 10:07:01 +0000
Message-ID: <20260319100707.60157-7-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
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

Implement the suggestion of moving the aux invalidation from a helper to a
ring ops vfunc, together with the suggestion to split the vfunc table of
video decode and video enhance engines.

With this done the LRC code will be able to access the functionality via
the newly added ring ops vfunc.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v2:
 * Removed stray hunks from v1.

v3:
 * Include header for u32.

v4:
 * Forward declare struct xe_gt.
---
 drivers/gpu/drm/xe/xe_ring_ops.c       | 105 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ring_ops_types.h |   6 ++
 2 files changed, 83 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 596379e6d742..8947b3091873 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -48,22 +48,48 @@ static u32 preparser_disable(bool state)
 	return MI_ARB_CHECK | BIT(8) | state;
 }
 
-static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
-			      u32 *dw, int i)
+static u32 *
+__emit_aux_table_inv(u32 *cmd, const struct xe_reg reg, u32 adj_offset)
 {
-	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
-	dw[i++] = reg.addr + gt->mmio.adj_offset;
-	dw[i++] = AUX_INV;
-	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
-		  MI_SEMAPHORE_REGISTER_POLL |
-		  MI_SEMAPHORE_POLL |
-		  MI_SEMAPHORE_SAD_EQ_SDD;
-	dw[i++] = 0;
-	dw[i++] = reg.addr + gt->mmio.adj_offset;
-	dw[i++] = 0;
-	dw[i++] = 0;
+	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
+		 MI_LRI_MMIO_REMAP_EN;
+	*cmd++ = reg.addr + adj_offset;
+	*cmd++ = AUX_INV;
+	*cmd++ = MI_SEMAPHORE_WAIT_TOKEN | MI_SEMAPHORE_REGISTER_POLL |
+		 MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
+	*cmd++ = 0;
+	*cmd++ = reg.addr + adj_offset;
+	*cmd++ = 0;
+	*cmd++ = 0;
 
-	return i;
+	return cmd;
+}
+
+static u32 *emit_aux_table_inv_render_compute(struct xe_gt *gt, u32 *cmd)
+{
+	return __emit_aux_table_inv(cmd, CCS_AUX_INV, gt->mmio.adj_offset);
+}
+
+static u32 *emit_aux_table_inv_video_decode(struct xe_gt *gt, u32 *cmd)
+{
+	return __emit_aux_table_inv(cmd, VD0_AUX_INV, gt->mmio.adj_offset);
+}
+
+static u32 *emit_aux_table_inv_video_enhance(struct xe_gt *gt, u32 *cmd)
+{
+	return __emit_aux_table_inv(cmd, VE0_AUX_INV, gt->mmio.adj_offset);
+}
+
+static int emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *dw, int i)
+{
+	struct xe_gt *gt = hwe->gt;
+	u32 *(*emit)(struct xe_gt *gt, u32 *cmd) =
+		gt->ring_ops[hwe->class]->emit_aux_table_inv;
+
+	if (emit)
+		return emit(gt, dw + i) - dw;
+	else
+		return i;
 }
 
 static int emit_user_interrupt(u32 *dw, int i)
@@ -327,7 +353,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
 	*head = lrc->ring.tail;
 
@@ -336,12 +361,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	dw[i++] = preparser_disable(true);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe)) {
-		if (decode)
-			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
-		else
-			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
-	}
+	i = emit_aux_table_inv(job->q->hwe, dw, i);
 
 	if (job->ring_ops_flush_tlb)
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
@@ -384,7 +404,6 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
-	const bool aux_ccs = has_aux_ccs(xe);
 	u32 mask_flags = 0;
 
 	*head = lrc->ring.tail;
@@ -395,7 +414,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	 * On AuxCCS platforms the invalidation of the Aux table requires
 	 * quiescing the memory traffic beforehand.
 	 */
-	if (aux_ccs)
+	if (has_aux_ccs(xe))
 		i = emit_render_cache_flush(job, dw, i);
 
 	dw[i++] = preparser_disable(true);
@@ -408,8 +427,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
-	if (aux_ccs)
-		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
+	i = emit_aux_table_inv(job->q->hwe, dw, i);
 
 	dw[i++] = preparser_disable(false);
 
@@ -534,7 +552,11 @@ static const struct xe_ring_ops ring_ops_gen12_copy = {
 	.emit_job = emit_job_gen12_copy,
 };
 
-static const struct xe_ring_ops ring_ops_gen12_video = {
+static const struct xe_ring_ops ring_ops_gen12_video_decode = {
+	.emit_job = emit_job_gen12_video,
+};
+
+static const struct xe_ring_ops ring_ops_gen12_video_enhance = {
 	.emit_job = emit_job_gen12_video,
 };
 
@@ -542,20 +564,47 @@ static const struct xe_ring_ops ring_ops_gen12_render_compute = {
 	.emit_job = emit_job_gen12_render_compute,
 };
 
+static const struct xe_ring_ops auxccs_ring_ops_gen12_video_decode = {
+	.emit_job = emit_job_gen12_video,
+	.emit_aux_table_inv = emit_aux_table_inv_video_decode,
+};
+
+static const struct xe_ring_ops auxccs_ring_ops_gen12_video_enhance = {
+	.emit_job = emit_job_gen12_video,
+	.emit_aux_table_inv = emit_aux_table_inv_video_enhance,
+};
+
+static const struct xe_ring_ops auxccs_ring_ops_gen12_render_compute = {
+	.emit_job = emit_job_gen12_render_compute,
+	.emit_aux_table_inv = emit_aux_table_inv_render_compute,
+};
+
 const struct xe_ring_ops *
 xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
 	switch (class) {
 	case XE_ENGINE_CLASS_OTHER:
 		return &ring_ops_gen12_gsc;
 	case XE_ENGINE_CLASS_COPY:
 		return &ring_ops_gen12_copy;
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		if (has_aux_ccs(xe))
+			return &auxccs_ring_ops_gen12_video_decode;
+		else
+			return &ring_ops_gen12_video_decode;
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		return &ring_ops_gen12_video;
+		if (has_aux_ccs(xe))
+			return &auxccs_ring_ops_gen12_video_enhance;
+		else
+			return &ring_ops_gen12_video_enhance;
 	case XE_ENGINE_CLASS_RENDER:
 	case XE_ENGINE_CLASS_COMPUTE:
-		return &ring_ops_gen12_render_compute;
+		if (has_aux_ccs(xe))
+			return &auxccs_ring_ops_gen12_render_compute;
+		else
+			return &ring_ops_gen12_render_compute;
 	default:
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index 1197fc0bf2af..52ff96bc4100 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -6,6 +6,9 @@
 #ifndef _XE_RING_OPS_TYPES_H_
 #define _XE_RING_OPS_TYPES_H_
 
+#include <linux/types.h>
+
+struct xe_gt;
 struct xe_sched_job;
 
 #define MAX_JOB_SIZE_DW 74
@@ -17,6 +20,9 @@ struct xe_sched_job;
 struct xe_ring_ops {
 	/** @emit_job: Write job to ring */
 	void (*emit_job)(struct xe_sched_job *job);
+
+	/** @emit_aux_table_inv: Emit aux table invalidation to the ring */
+	u32 *(*emit_aux_table_inv)(struct xe_gt *gt, u32 *cmd);
 };
 
 #endif
-- 
2.52.0

