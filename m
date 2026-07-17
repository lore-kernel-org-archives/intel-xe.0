Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880B3C44515
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 19:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A22510E023;
	Fri, 17 Jul 2026 19:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgMnjeNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0F410E023
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jul 2026 19:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784317096; x=1815853096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z0p2iiWyWizbnLmJhiNY8lncMU3GdqUKa3xFy5CqnqQ=;
 b=EgMnjeNxLQRxzLxuSejuwlNG3ghHCab2GXyOStUIm2Cg69pcxpFx/zX0
 0x25uoDvmD1JwT6OLkN17eh8w0scYY+pi4q11pbQM6bALckv0XgL6IpIt
 TRcd69TnxrL2g3oZaYDxqqBbxnIQRrQ6Ku4A01cAC9DqF6RrwzCgaZEG3
 NLR/1wYt3kfNrvRYCnbTskPgkEGj9N0AoYCGachan78k1gnoR5rKdQ8vL
 sDSNBaNk+GkfD4SyoFNaBdU3CeJ3sjl8DKY4/ZSGsLRD6LEeodYneWgFi
 3PYYaXxuu57hHqS8hasTJih9ySmZSgG7OUrnuD9GpV3XwbQopCJ+iShmV Q==;
X-CSE-ConnectionGUID: pPmL450jRtOQ02MKKY6j/A==
X-CSE-MsgGUID: NBWjFzrNREiGVduntztAeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87538479"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="87538479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 12:38:16 -0700
X-CSE-ConnectionGUID: HppVO3vpRAyzjEfW78BolA==
X-CSE-MsgGUID: BR1prElgTbGK+g+f5cyPRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="260673209"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 12:38:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3] drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind()
Date: Fri, 17 Jul 2026 12:38:09 -0700
Message-Id: <20260717193809.131394-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

On L2-flush-optimized HW with a dma-resv (non-fault) VM, evicting a BO
only needs to flush the L2 cache before the migration copy runs; the
mappings themselves are torn down and rebuilt lazily via
drm_gpuvm_bo_evict() and a subsequent rebind. Today this flush is done
by waiting for the BO to go idle and then issuing a synchronous TLB
invalidation per mapping VMA from inside xe_bo_trigger_rebind(). Both
the idle wait and the synchronous invalidation stall the calling thread
while holding the BO dma-resv lock, serializing the move behind all
in-flight GPU work on the BO.

Replace this with an asynchronous flush. Add xe_vm_flush_vm_bo_tlb_async()
which, for each VMA mapping the BO on each present tile, queues a TLB
invalidation job on the tile migrate (kernel) exec queue. The jobs depend
on the BO's in-flight GPU work, captured once as a singleton over
DMA_RESV_USAGE_BOOKKEEP, so the flush only fires once the GPU is done with
the current mapping. Each job's completion fence is installed into the
BO's dma-resv as a DMA_RESV_USAGE_KERNEL fence, so the migration copy -
which waits on the resv - waits on the flush without stalling this thread.

No PTEs are zapped and vma->tile_invalidated is left untouched: the
mapping stays valid until the lazy rebind, and the only work performed
here is the L2 flush. On any failure the caller falls back to the
existing blocking wait-idle plus xe_vm_invalidate_vma() path.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v2: Less verbose comment (Thomas)
v3: Honor no_gpu_wait (Sashiko)
---
---
 drivers/gpu/drm/xe/xe_bo.c |   8 +++
 drivers/gpu/drm/xe/xe_vm.c | 125 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |   5 ++
 3 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1..bb9dbc592941 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -686,6 +686,14 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			 */
 			if (!xe_device_is_l2_flush_optimized(xe))
 				continue;
+
+			/*
+			 * Attempt to flush L2 async, fallback to sync flush on
+			 * no_wait_gpu or faliure
+			 */
+			if (!ctx->no_wait_gpu &&
+			    !xe_vm_flush_vm_bo_tlb_async(vm, bo, vm_bo))
+				continue;
 		}
 
 		if (!idle) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57bcf0660eb8..28223e32fd26 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -39,6 +39,7 @@
 #include "xe_sync.h"
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
+#include "xe_tlb_inval_job.h"
 #include "xe_trace_bo.h"
 #include "xe_vm_madvise.h"
 #include "xe_wa.h"
@@ -4432,6 +4433,130 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return ret;
 }
 
+/*
+ * xe_vma_tlb_flush_client - Queue an async TLB flush for one VMA on one client
+ *
+ * Create and push a TLB invalidation job on the tile migrate (kernel) exec
+ * queue covering @vma's range, depending on @dep (the BO's in-flight GPU work)
+ * so the flush only fires once the GPU is done with the current mapping. The
+ * job's completion fence is installed into @resv as a KERNEL fence so the
+ * subsequent migration waits on the flush. No PTEs are zapped; this only
+ * flushes L2 via the TLB invalidation.
+ */
+static int xe_vma_tlb_flush_client(struct xe_vm *vm, struct xe_vma *vma,
+				   struct xe_tile *tile, struct xe_gt *gt,
+				   struct dma_resv *resv, struct dma_fence *dep,
+				   int type)
+{
+	struct xe_exec_queue *q = xe_migrate_exec_queue(tile->migrate);
+	struct xe_tlb_inval_job *job;
+	struct dma_fence *fence;
+	int err;
+
+	job = xe_tlb_inval_job_create(q, &gt->tlb_inval,
+				      q->tlb_inval[type].dep_scheduler, vm,
+				      xe_vma_start(vma), xe_vma_end(vma), type);
+	if (IS_ERR(job))
+		return PTR_ERR(job);
+
+	err = xe_tlb_inval_job_alloc_dep(job);
+	if (err)
+		goto out_put;
+
+	err = dma_resv_reserve_fences(resv, 1);
+	if (err)
+		goto out_put;
+
+	/* Cannot fail; consumes a ref on @dep and returns a referenced fence. */
+	fence = xe_tlb_inval_job_push(job, tile->migrate, dep);
+	dma_resv_add_fence(resv, fence, DMA_RESV_USAGE_KERNEL);
+	dma_fence_put(fence);
+
+out_put:
+	/* Drop the creation reference (destroys the job if it was not pushed). */
+	xe_tlb_inval_job_put(job);
+	return err;
+}
+
+/**
+ * xe_vm_flush_vm_bo_tlb_async - Asynchronously flush TLBs for a vm_bo's mappings
+ * @vm: The VM @vm_bo belongs to
+ * @bo: The buffer object being moved
+ * @vm_bo: The gpuvm_bo linking @bo into @vm
+ *
+ * On L2-flush-optimized HW a BO move only needs to flush L2 (via a TLB
+ * invalidation) for the BO's live mappings; the mappings themselves are torn
+ * down and rebuilt lazily via the eviction/rebind path, so no PTEs need to be
+ * zapped here. Rather than blocking the caller on a synchronous invalidation,
+ * issue a TLB invalidation job per VMA per TLB-invalidation client (per present
+ * tile, primary and media GT). Each job waits on the BO's in-flight GPU work
+ * (all dma-resv usages) and its completion fence is installed into the BO's
+ * dma-resv KERNEL slots, so the following migration waits on the flush without
+ * stalling this thread.
+ *
+ * The caller must hold the BO's dma-resv lock and @vm must not be in fault
+ * mode.
+ *
+ * Return: 0 on success, negative error code on failure. On failure the caller
+ * should fall back to the blocking xe_vm_invalidate_vma() path; any jobs
+ * already queued install harmless extra flush fences.
+ */
+int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
+				struct drm_gpuvm_bo *vm_bo)
+{
+	struct xe_device *xe = vm->xe;
+	struct dma_resv *resv = bo->ttm.base.resv;
+	struct dma_fence *dep = NULL;
+	struct drm_gpuva *gpuva;
+	int err;
+
+	dma_resv_assert_held(resv);
+	xe_assert(xe, !xe_vm_in_fault_mode(vm));
+
+	/*
+	 * Single fence capturing all in-flight GPU work on the BO; the TLB
+	 * invalidation jobs depend on it so the flush fires only once the GPU
+	 * is done with the current mapping.
+	 */
+	err = dma_resv_get_singleton(resv, DMA_RESV_USAGE_BOOKKEEP, &dep);
+	if (err)
+		return err;
+	if (!dep)
+		dep = dma_fence_get_stub();
+
+	drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_tile *tile;
+		u8 id;
+
+		if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma))
+			continue;
+
+		for_each_tile(tile, xe, id) {
+			if (!(vma->tile_present & BIT(id)))
+				continue;
+
+			err = xe_vma_tlb_flush_client(vm, vma, tile,
+						      tile->primary_gt, resv, dep,
+						      XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+			if (err)
+				goto out;
+
+			if (tile->media_gt) {
+				err = xe_vma_tlb_flush_client(vm, vma, tile,
+							      tile->media_gt, resv, dep,
+							      XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
+				if (err)
+					goto out;
+			}
+		}
+	}
+
+out:
+	dma_fence_put(dep);
+	return err;
+}
+
 int xe_vm_validate_protected(struct xe_vm *vm)
 {
 	struct drm_gpuva *gpuva;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c5b900f38ded..dd5b070eaede 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -26,6 +26,8 @@ struct ttm_buffer_object;
 
 struct dma_fence;
 
+struct xe_bo;
+struct drm_gpuvm_bo;
 struct xe_exec_queue;
 struct xe_file;
 struct xe_pagefault;
@@ -254,6 +256,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *batch);
 
+int xe_vm_flush_vm_bo_tlb_async(struct xe_vm *vm, struct xe_bo *bo,
+				struct drm_gpuvm_bo *vm_bo);
+
 int xe_vm_validate_protected(struct xe_vm *vm);
 
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
-- 
2.34.1

