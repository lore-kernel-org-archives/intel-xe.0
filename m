Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79040EE49AF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 17:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A00910E3BD;
	Tue, 22 Aug 2023 17:33:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2830D10E3BD
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692725626; x=1724261626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RyLnPTC8Vlvov9MTmI0f547KJHmN2U5Q7oh3Yo9WPwk=;
 b=drTv3esBfrryfwpVUvBPX0wu9rqIqrohP2fuQObDcViBpT2GD7jluY63
 1pLCt+oeHuWeFZTTatUd1HeyommZe1kWDkeEVfPEjzu+sUCYseZmfRP/5
 kFLR24gGeTcZDJLR0zx9Qe1JA74tz80IfyEOW/SuYBzB27x3tpct9S/WS
 tCKxSeTW5lTXcnolcZnDLG4lo09vBodBRiix0kI31dDcoyVYi3QIqhn1K
 XC1E8Z2pVVSAefF+oHbmBlncUWyxLnkjzOtuBYjRk69b6kDcMvqzzYU4L
 ToYB0rYiG9NzYoDam/ewo1rY6XY60wa3xRpgJV2m/SbG7+xHeSutoTA52 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376685279"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="376685279"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860009023"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="860009023"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 10:33:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 10:33:32 -0700
Message-ID: <20230822173334.1664332-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
References: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe: fix submissions without vm
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

Kernel queues can submit privileged batches directly in GGTT, so they
don't always need a vm. The submission front-end already supports
creating and submitting jobs without a vm, but some parts of the
back-end assume the vm is always there. Fix this by handling a lack of
vm in the back-end as well.

v2: s/XE_BUG_ON/XE_WARN_ON, s/engine/exec_queue

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c   | 8 ++++----
 drivers/gpu/drm/xe/xe_sched_job.c  | 3 +++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8f64b164987a..4614605d937f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1133,7 +1133,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	ge->q = q;
 	init_waitqueue_head(&ge->suspend_wait);
 
-	timeout = xe_vm_no_dma_fences(q->vm) ? MAX_SCHEDULE_TIMEOUT :
+	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 11a089ae79b2..ad5c3f9b80d3 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -213,7 +213,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_vm *vm = job->q->vm;
 
-	if (vm->batch_invalidate_tlb) {
+	if (vm && vm->batch_invalidate_tlb) {
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, true, dw, i);
@@ -271,13 +271,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 			i = emit_aux_table_inv(gt, VE0_AUX_NV, dw, i);
 	}
 
-	if (vm->batch_invalidate_tlb)
+	if (vm && vm->batch_invalidate_tlb)
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, true, dw, i);
 
 	dw[i++] = preparser_disable(false);
 
-	if (!vm->batch_invalidate_tlb)
+	if (!vm || !vm->batch_invalidate_tlb)
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, dw, i);
 
@@ -316,7 +316,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
-	i = emit_pipe_invalidate(mask_flags, vm->batch_invalidate_tlb, dw, i);
+	i = emit_pipe_invalidate(mask_flags, vm && vm->batch_invalidate_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
 	if (has_aux_ccs(xe))
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 753aab0cc6f4..6f33c50ec214 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -87,6 +87,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	int i, j;
 	u32 width;
 
+	/* only a kernel context can submit a vm-less job */
+	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
+
 	/* Migration and kernel engines have their own locking */
 	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM |
 			  EXEC_QUEUE_FLAG_WA))) {
-- 
2.41.0

