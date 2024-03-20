Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D7C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 10:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0610C10F58B;
	Wed, 20 Mar 2024 10:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzjAy0zb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4B10F58B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710929431; x=1742465431;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tBXzW9/sCVAVd/Rn/FoTYG94HIAK8/NsBTSEOc4EaVY=;
 b=FzjAy0zbb7HLVpNKWlV7lE/YtggdvTclXmWOloREb46yQfkWu7nwGqiU
 g8GKGucwNf83jasUX8P7Zag50caRibe+C6CgCLAN1it4CxAgl2h32OHzJ
 O48zVT3tYt0VMA2RMsYgqfC4PU5uauFYdxVFcetDhUBP6CktASck3MfTF
 AL4i8+h3rKPnO6sucpO0a9m8A2i0gu/WvIzqsxHDbO3fdTGne8eRmqf+Z
 bHAQMF+aEIBm42gkhY8QUcKTPOzPZMb9J6gmav1SndHbllGuEnOgS8B12
 QH9B603XyOB0gQUHW03v2tgUwIzZjqPqD2v6KV9ZWeDtfbCJq7+EAkqtg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5723747"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5723747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="37232877"
Received: from suntharx-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.177])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:29 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/8] drm/xe: Use ring ops TLB invalidation for rebinds
Date: Wed, 20 Mar 2024 11:10:14 +0100
Message-ID: <20240320101020.5611-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
References: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pt.c               |  5 +++--
 drivers/gpu/drm/xe/xe_ring_ops.c         | 11 ++++-------
 drivers/gpu/drm/xe/xe_sched_job.c        | 11 +++++++++++
 drivers/gpu/drm/xe/xe_sched_job_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h         |  5 +++++
 6 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 62b3d9d1d7cd..891ad30e906f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -148,6 +148,8 @@ struct xe_exec_queue {
 	const struct xe_ring_ops *ring_ops;
 	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
 	struct drm_sched_entity *entity;
+	/** @tlb_flush_seqno: The seqno of the last rebind tlb flush performed */
+	u64 tlb_flush_seqno;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc lrc[];
 };
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8e1b6456897b..8b15706a9979 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1253,11 +1253,12 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	 * non-faulting LR, in particular on user-space batch buffer chaining,
 	 * it needs to be done here.
 	 */
-	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
-	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
+	if ((!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence)
 			return ERR_PTR(-ENOMEM);
+	} else if (rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) {
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
index 8151ddafb940..d55458d915a9 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -250,6 +250,17 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 
 void xe_sched_job_arm(struct xe_sched_job *job)
 {
+	struct xe_exec_queue *q = job->q;
+	struct xe_vm *vm = q->vm;
+
+	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
+	    vm->tlb_flush_seqno != q->tlb_flush_seqno) {
+		q->tlb_flush_seqno = vm->tlb_flush_seqno;
+		job->ring_ops_flush_tlb = true;
+	} else if (vm && vm->batch_invalidate_tlb) {
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
index 79b5cab57711..157a805b8621 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -267,6 +267,11 @@ struct xe_vm {
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

