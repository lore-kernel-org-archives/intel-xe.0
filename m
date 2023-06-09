Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66802C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 08:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A02110E65A;
	Fri,  9 Jun 2023 08:59:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3210E65A
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686301139; x=1717837139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G4Wi40vdHPy4cB5juOyXDa9ZQSRbgsfjrE8W/jDpUNc=;
 b=J5NIl6K94enOQ6OxfLTLgppkdp+LZx/IL3TV12biuKX3C7HkBeQjD8Oc
 WV3Frt6pAq5aD2FL1b5Wz9EbK20KdGYGFS0YBLzpoPkFAcJjkgGahx/4T
 UyJHK2PKDm2MbqQ+008glgC5zpwUVkKsgHP+jtyRHn2QsFFeT3amGhI8I
 y7lHNS1qVetZ4aLDN9Apa8VWHpg/h0Swzz5B+VOJTu8stMxqZck2TRC8p
 zxG1NaiQcA5zM1ZbtZYYRdn8AerViMG6vpew47lZvk7SbY8LdDZ2nfPe6
 8NCSzgGNKIfd9vnGuFf0juAO9p8cbNFESo/gYxYgAeDx8D0XPXR5qpmmU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337913047"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="337913047"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740103258"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="740103258"
Received: from uniemimu-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.208])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:58:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 10:58:39 +0200
Message-Id: <20230609085840.114729-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
References: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Invalidate TLB also on bind if in
 scratch page mode
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

For scratch table mode we need to cover the case where a scratch PTE might
have been pre-fetched and cached and used instead of that of the newly
bound vma.
For compute vms, invalidate TLB globally using GuC before signalling
bind complete. For !long-running vms, invalidate TLB at batch start.

Also document how TLB invalidation works.

v2:
- Fix a pointer to the comment about TLB invalidation (Jose Souza).
- Add a bool to the vm whether we want to invalidate TLB at batch start.
- Invalidate TLB also on BCS- and video engines at batch start where
  needed.
- Use BIT() macro instead of explicit shift.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Tested-by: José Roberto de Souza <jose.souza@intel.com> #v1
Reported-by: José Roberto de Souza <jose.souza@intel.com> #v1
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/291
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/291
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c                | 17 +++++++-
 drivers/gpu/drm/xe/xe_ring_ops.c          | 47 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_vm.c                |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h          |  3 ++
 5 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 0f9c5b0b8a3b..1a744c508174 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -73,6 +73,7 @@
 #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
 #define   PIPE_CONTROL_CS_STALL				(1<<20)
 #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
+#define	  PIPE_CONTROL_TLB_INVALIDATE			BIT(18)
 #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
 #define   PIPE_CONTROL_QW_WRITE				(1<<14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index bef265715000..2c472fafc811 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1297,7 +1297,20 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 
-	if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+	/*
+	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
+	 * cached PTEs point to freed memory. on LR vms this is done
+	 * automatically when the context is re-enabled by the rebind worker,
+	 * or in fault mode it was invalidated on PTE zapping.
+	 *
+	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
+	 * PTE is already cached in the TLB so it needs to be invalidated.
+	 * on !LR VMs this is done in the ring ops preceding a batch, but on
+	 * non-faulting LR, in particular on user-space batch buffer chaining,
+	 * it needs to be done here.
+	 */
+	if ((rebind && !xe_vm_no_dma_fences(vm) && !vm->batch_invalidate_tlb) ||
+	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence)
 			return ERR_PTR(-ENOMEM);
@@ -1313,7 +1326,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		LLIST_HEAD(deferred);
 
 		/* TLB invalidation must be done before signaling rebind */
-		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+		if (ifence) {
 			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
 							  vma);
 			if (err) {
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 2deee7a2bb14..dbf06f996568 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -15,6 +15,7 @@
 #include "xe_macros.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
+#include "xe_vm.h"
 
 /*
  * 3D-related flags that can't be set on _engines_ that lack access to the 3D
@@ -74,9 +75,11 @@ static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
 	return i;
 }
 
-static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
+static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
+			       u32 *dw, int i)
 {
-	dw[i++] = (MI_FLUSH_DW + 1) | MI_FLUSH_DW_OP_STOREDW;
+	dw[i++] = (MI_FLUSH_DW + 1) | MI_FLUSH_DW_OP_STOREDW |
+		(invalidate_tlb ? MI_INVALIDATE_TLB : 0);
 	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
 	dw[i++] = value;
@@ -107,7 +110,8 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
 	return i;
 }
 
-static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
+static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
+				int i)
 {
 	u32 flags = PIPE_CONTROL_CS_STALL |
 		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
@@ -119,6 +123,9 @@ static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
 		PIPE_CONTROL_QW_WRITE |
 		PIPE_CONTROL_STORE_DATA_INDEX;
 
+	if (invalidate_tlb)
+		flags |= PIPE_CONTROL_TLB_INVALIDATE;
+
 	flags &= ~mask_flags;
 
 	dw[i++] = GFX_OP_PIPE_CONTROL(6);
@@ -170,9 +177,17 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
-
-	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-				seqno, dw, i);
+	struct xe_vm *vm = job->engine->vm;
+
+	if (vm->batch_invalidate_tlb) {
+		dw[i++] = preparser_disable(true);
+		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
+					seqno, true, dw, i);
+		dw[i++] = preparser_disable(false);
+	} else {
+		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
+					seqno, dw, i);
+	}
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
@@ -181,7 +196,7 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, dw, i);
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
@@ -210,6 +225,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	struct xe_gt *gt = job->engine->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool decode = job->engine->class == XE_ENGINE_CLASS_VIDEO_DECODE;
+	struct xe_vm *vm = job->engine->vm;
 
 	dw[i++] = preparser_disable(true);
 
@@ -220,10 +236,16 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 		else
 			i = emit_aux_table_inv(gt, VE0_AUX_NV, dw, i);
 	}
+
+	if (vm->batch_invalidate_tlb)
+		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
+					seqno, true, dw, i);
+
 	dw[i++] = preparser_disable(false);
 
-	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-				seqno, dw, i);
+	if (!vm->batch_invalidate_tlb)
+		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
+					seqno, dw, i);
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
@@ -232,7 +254,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 						job->user_fence.value,
 						dw, i);
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, dw, i);
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
@@ -250,6 +272,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->engine->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	struct xe_vm *vm = job->engine->vm;
 	u32 mask_flags = 0;
 
 	dw[i++] = preparser_disable(true);
@@ -257,7 +280,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
 	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
-	i = emit_pipe_invalidate(mask_flags, dw, i);
+
+	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
+	i = emit_pipe_invalidate(mask_flags, vm->batch_invalidate_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
 	if (has_aux_ccs(xe))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1c380ad7f6b..efaef437ea97 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1237,11 +1237,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			if (err)
 				goto err_scratch_pt;
 		}
+		vm->batch_invalidate_tlb = true;
 	}
 
 	if (flags & DRM_XE_VM_CREATE_COMPUTE_MODE) {
 		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
 		vm->flags |= XE_VM_FLAG_COMPUTE_MODE;
+		vm->batch_invalidate_tlb = false;
 	}
 
 	if (flags & DRM_XE_VM_CREATE_ASYNC_BIND_OPS) {
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 76af6ac0fa84..5242236b4b0e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -337,6 +337,9 @@ struct xe_vm {
 		/** @capture_once: capture only one error per VM */
 		bool capture_once;
 	} error_capture;
+
+	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
+	bool batch_invalidate_tlb;
 };
 
 #endif
-- 
2.39.2

