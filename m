Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E15D3B9B5
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFAE10E641;
	Wed, 10 Dec 2025 00:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpyFd+1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37F510E5D1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327163; x=1796863163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vcXNYITMGnYqWWUPZ35kFoa2mtCOXd/W+cChlLuw6bM=;
 b=LpyFd+1f3Ygqb71Cf4OfhsDApJEYLsC2ovWRK3OHd3lOjE+gDveuYr8F
 mfEm4tWbOySrzYOJ3NHInD0O6rGPnxhl8QH+ztxicLySQPZys4Tf5DFQY
 tgz8CQC4o8XcvdmuZhpPzmYzunt5bdfc+2SmlmJkfDogRUJocm5iXueMS
 HZNGtvfe8oMJ5sWVXsR5nUth3Rc8nP9xsjN75thNvZJW1ReYAyf/sqh+C
 DA5K2lV2XVeGIp4XF91JZXIo4Lkuixhjb4ySSnPr2RUzco+smiC5txer4
 Gt7qQsn9HPGi0QI9pyDfFVoXQQdYYQjW0n0a2HIgz7fK83+gO7pfwg1ze g==;
X-CSE-ConnectionGUID: eNrwfKRwRW+UUh0PTxwi6w==
X-CSE-MsgGUID: +N7K3TgtTqG3t5KfcTk25g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180376"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:23 -0800
X-CSE-ConnectionGUID: 9fE3MYgXROG3XuIBNPdpSg==
X-CSE-MsgGUID: K3j14gwrSVG5Z1YRqIQv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421529"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v5 10/17] drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi
 Queue batches
Date: Tue,  9 Dec 2025 16:39:21 -0800
Message-ID: <20251210003913.1612141-29-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
References: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
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

To properly support soft light restore between batches
being arbitrated at the CFEG, PIPE_CONTROL instructions
have a new bit in the first DW, QUEUE_DRAIN_MODE. When
set, this indicates to the CFEG that it should only
drain the current queue.

Additionally we no longer want to set the CS_STALL bit
for these multi queue queues as this causes the entire
pipeline to stall waiting for completion of the prior
batch, preventing this soft light restore from occurring
between queues in a queue group.

v4: Assert !multi_queue where applicable (Matt Roper)

Bspec: 56551
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c              | 64 ++++++++++++-------
 2 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 5d41ca297447..885fcf211e6d 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -47,6 +47,7 @@
 
 #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
 
+#define   PIPE_CONTROL0_QUEUE_DRAIN_MODE		BIT(12)
 #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
 #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ac0c6dcffe15..96a14fb74507 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -12,7 +12,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
-#include "xe_exec_queue_types.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -135,12 +135,11 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
 	return i;
 }
 
-static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
-				int i)
+static int emit_pipe_invalidate(struct xe_exec_queue *q, u32 mask_flags,
+				bool invalidate_tlb, u32 *dw, int i)
 {
 	u32 flags0 = 0;
-	u32 flags1 = PIPE_CONTROL_CS_STALL |
-		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
+	u32 flags1 = PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
 		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
 		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
 		PIPE_CONTROL_VF_CACHE_INVALIDATE |
@@ -152,6 +151,11 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 	if (invalidate_tlb)
 		flags1 |= PIPE_CONTROL_TLB_INVALIDATE;
 
+	if (xe_exec_queue_is_multi_queue(q))
+		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
+	else
+		flags1 |= PIPE_CONTROL_CS_STALL;
+
 	flags1 &= ~mask_flags;
 
 	if (flags1 & PIPE_CONTROL_VF_CACHE_INVALIDATE)
@@ -175,37 +179,47 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 
 static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 {
-	struct xe_gt *gt = job->q->gt;
+	struct xe_exec_queue *q = job->q;
+	struct xe_gt *gt = q->gt;
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
-	u32 flags;
+	u32 flags0, flags1;
 
 	if (XE_GT_WA(gt, 14016712196))
 		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
 				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
 
-	flags = (PIPE_CONTROL_CS_STALL |
-		 PIPE_CONTROL_TILE_CACHE_FLUSH |
+	flags0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+	flags1 = (PIPE_CONTROL_TILE_CACHE_FLUSH |
 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
 		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
 		 PIPE_CONTROL_DC_FLUSH_ENABLE |
 		 PIPE_CONTROL_FLUSH_ENABLE);
 
 	if (XE_GT_WA(gt, 1409600907))
-		flags |= PIPE_CONTROL_DEPTH_STALL;
+		flags1 |= PIPE_CONTROL_DEPTH_STALL;
 
 	if (lacks_render)
-		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+		flags1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
-		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
+		flags1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
+
+	if (xe_exec_queue_is_multi_queue(q))
+		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
+	else
+		flags1 |= PIPE_CONTROL_CS_STALL;
 
-	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
+	return emit_pipe_control(dw, i, flags0, flags1, 0, 0);
 }
 
-static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
+static int emit_pipe_control_to_ring_end(struct xe_exec_queue *q, u32 *dw, int i)
 {
+	struct xe_hw_engine *hwe = q->hwe;
+
 	if (hwe->class != XE_ENGINE_CLASS_RENDER)
 		return i;
 
+	xe_gt_assert(q->gt, !xe_exec_queue_is_multi_queue(q));
+
 	if (XE_GT_WA(hwe->gt, 16020292621))
 		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
 				      RING_NOPID(hwe->mmio_base).addr, 0);
@@ -213,16 +227,20 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
 	return i;
 }
 
-static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
-			      int i)
+static int emit_pipe_imm_ggtt(struct xe_exec_queue *q, u32 addr, u32 value,
+			      bool stall_only, u32 *dw, int i)
 {
-	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
-		    PIPE_CONTROL_QW_WRITE;
+	u32 flags0 = 0, flags1 = PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE;
 
 	if (!stall_only)
-		flags |= PIPE_CONTROL_FLUSH_ENABLE;
+		flags1 |= PIPE_CONTROL_FLUSH_ENABLE;
+
+	if (xe_exec_queue_is_multi_queue(q))
+		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
+	else
+		flags1 |= PIPE_CONTROL_CS_STALL;
 
-	return emit_pipe_control(dw, i, 0, flags, addr, value);
+	return emit_pipe_control(dw, i, flags0, flags1, addr, value);
 }
 
 static u32 get_ppgtt_flag(struct xe_sched_job *job)
@@ -371,7 +389,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
-	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
+	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
 	if (has_aux_ccs(xe))
@@ -391,11 +409,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
+	i = emit_pipe_imm_ggtt(job->q, xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
-	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
+	i = emit_pipe_control_to_ring_end(job->q, dw, i);
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
-- 
2.43.0

