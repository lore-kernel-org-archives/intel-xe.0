Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03449C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 09:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1B510F988;
	Wed, 27 Mar 2024 09:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mz2CDaSL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021FD10F42C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711530716; x=1743066716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kCzvE9/A5ib1+ACoIdz7FS857zdm6pFyWjuGPt9RgJ4=;
 b=mz2CDaSLeqAJ8TGvXNLCG1lFUdzyRilebvDQv2EwsOQqF6M7HYnVXW5z
 5oI52kaPpSAD5i9mllI6f6+NkJM7C2Sl/uHwQjXaMUMQysOfa0Opx2LRa
 aqGXednb5OHBtc1k4rR0l4hk2j/krDVF5Z2dcbB440d/FjWHJcemXsl20
 he/aKORAOPV55lCCO62iqvMvzn0TpMoDHY+8C1iPBgvYlcmSnWf7rZlWc
 0gyRtjVQUMPprlFnc04kEca+ckvW7/Pazwfi+WUdMBwIWijzKnOj5kB8N
 5Vnum6tB+/kvES3++tA6sRs2R7ZT0RD4XqplwWO0MTJc5yn6bNYrmU5Vv A==;
X-CSE-ConnectionGUID: iATcW9v6TcmdgxA9LL13Bg==
X-CSE-MsgGUID: oWgtJ+a5SqusNVGwUw6Fsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="29097866"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="29097866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16615105"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.184])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:11:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH v3 1/4] drm/xe: Use ring ops TLB invalidation for rebinds
Date: Wed, 27 Mar 2024 10:11:33 +0100
Message-ID: <20240327091136.3271-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
References: <20240327091136.3271-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For each rebind we insert a GuC TLB invalidation and add a
corresponding unordered TLB invalidation fence. This might
add a huge number of TLB invalidation fences to wait for so
rather than doing that, defer the TLB invalidation to the
next ring ops for each affected exec queue. Since the TLB
is invalidated on exec_queue switch, we need to invalidate
once for each affected exec_queue.

v2:
- Simplify if-statements around the tlb_flush_seqno.
  (Matthew Brost)
- Add some comments and asserts.

Fixes: 5387e865d90e ("drm/xe: Add TLB invalidation fence after rebinds issued from execs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_pt.c               |  6 ++++--
 drivers/gpu/drm/xe/xe_ring_ops.c         | 11 ++++-------
 drivers/gpu/drm/xe/xe_sched_job.c        | 10 ++++++++++
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h         |  5 +++++
 6 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 9cc689f50db0..ee78d497d838 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -146,6 +146,11 @@ struct xe_exec_queue {
 	const struct xe_ring_ops *ring_ops;
 	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
 	struct drm_sched_entity *entity;
+	/**
+	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
+	 * Protected by @vm's resv. Unused if @vm == NULL.
+	 */
+	u64 tlb_flush_seqno;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc lrc[];
 };
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8d3922d2206e..37117752cfc9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1254,11 +1254,13 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	 * non-faulting LR, in particular on user-space batch buffer chaining,
 	 * it needs to be done here.
 	 */
-	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
-	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
+	if ((!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence)
 			return ERR_PTR(-ENOMEM);
+	} else if (rebind && !xe_vm_in_lr_mode(vm)) {
+		/* We bump also if batch_invalidate_tlb is true */
+		vm->tlb_flush_seqno++;
 	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index c4edffcd4a32..5b2b37b59813 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -219,10 +219,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
-	struct xe_vm *vm = job->q->vm;
 	struct xe_gt *gt = job->q->gt;
 
-	if (vm && vm->batch_invalidate_tlb) {
+	if (job->ring_ops_flush_tlb) {
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, true, dw, i);
@@ -270,7 +269,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
-	struct xe_vm *vm = job->q->vm;
 
 	dw[i++] = preparser_disable(true);
 
@@ -282,13 +280,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
 	}
 
-	if (vm && vm->batch_invalidate_tlb)
+	if (job->ring_ops_flush_tlb)
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, true, dw, i);
 
 	dw[i++] = preparser_disable(false);
 
-	if (!vm || !vm->batch_invalidate_tlb)
+	if (!job->ring_ops_flush_tlb)
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, dw, i);
 
@@ -317,7 +315,6 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
-	struct xe_vm *vm = job->q->vm;
 	u32 mask_flags = 0;
 
 	dw[i++] = preparser_disable(true);
@@ -327,7 +324,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
-	i = emit_pipe_invalidate(mask_flags, vm && vm->batch_invalidate_tlb, dw, i);
+	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
 	if (has_aux_ccs(xe))
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index add5a8b89be8..80daee910ae9 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -252,6 +252,16 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 
 void xe_sched_job_arm(struct xe_sched_job *job)
 {
+	struct xe_exec_queue *q = job->q;
+	struct xe_vm *vm = q->vm;
+
+	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
+	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
+		xe_vm_assert_held(vm);
+		q->tlb_flush_seqno = vm->tlb_flush_seqno;
+		job->ring_ops_flush_tlb = true;
+	}
+
 	drm_sched_job_arm(&job->drm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index b1d83da50a53..5e12724219fd 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -39,6 +39,8 @@ struct xe_sched_job {
 	} user_fence;
 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
 	u32 migrate_flush_flags;
+	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
+	bool ring_ops_flush_tlb;
 	/** @batch_addr: batch buffer address of job */
 	u64 batch_addr[];
 };
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ae5fb565f6bf..5747f136d24d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -264,6 +264,11 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/**
+	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
+	 * protected by the vm resv.
+	 */
+	u64 tlb_flush_seqno;
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
-- 
2.44.0

