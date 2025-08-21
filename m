Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BA6CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 13:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F167B10E279;
	Thu, 21 Aug 2025 13:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7v0bQ9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6500510E279
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755782492; x=1787318492;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cQkgc0444Y9meghamkhBS0QS+FFuVRAIbmZVjpCXJDI=;
 b=K7v0bQ9MSDldaLeRQ17NSnr0PjA0jMFMP9MGpt4kJE16aEo71A/Vw1/c
 v4Bk3c1LdPmme7KagCAg8B9VA2yVKxTmw6RY5oUv+INRRu6I9pbgW1EJM
 IUkLxdXaVNf1Ofnql08XA6XVFCdNVT1DazdW9C0xTVZQEgf5CwUen9Kej
 02+O/5fplm2qZunCwoyDq0ic62N4Lrptt+bkLXTLjmhVWDbaaupYiDiWw
 bpqguyoVWwpg9p3VOSjoX9kdxc6vs6XUMwJJgfyboyDWGNNGMnljgYLLu
 kD27wYE7D+LpQOfEUzQCDcwJhtojeDanVO3EurYC2Z6KJR1EZwqBMQqu7 w==;
X-CSE-ConnectionGUID: QrKhLCCeQLKstobG88wYvw==
X-CSE-MsgGUID: VSfxoJaIQte1B1SYpaEPYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57997195"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57997195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 06:21:32 -0700
X-CSE-ConnectionGUID: eOUl6ltkRO6lSWr1q/xjUg==
X-CSE-MsgGUID: MMBfBj1pQF6TkaEQyZL5BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="192092426"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.245.201])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 06:21:31 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] Two-pass MMU notifier for CI only
Date: Thu, 21 Aug 2025 15:21:14 +0200
Message-ID: <20250821132114.97325-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Squashed commit of the following:

commit 44b594b3bbbdd454dcab9e499b5275aa1c9f0109
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 7 22:27:10 2025 -0700

    drm/xe: Implement two pass MMU notifiers for SVM

    Implement two-pass MMU notifiers for SVM, enabling multiple VMs or
    devices with GPU mappings to pipeline costly TLB invalidations by
    issuing them in the first pass and waiting for completion in the second.

    v1:
    - Adjust naming.

    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

commit c783c6dabdab4ed92085e4fc0bed2689cf9249ba
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 7 22:27:10 2025 -0700

    drm/xe: Add fences argument to xe_vm_range_tilemask_tlb_invalidation

    Introduce a fences argument to xe_vm_range_tilemask_tlb_invalidation,
    allowing callers to provide fences and defer waiting to a later point.

    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

commit 9a5708c3ccd3f99102a29888eeff4fac3e5ec574
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 7 22:27:09 2025 -0700

    drm/xe: Skip waiting on unarmed fences in xe_gt_tlb_invalidation_fence_wait

    Avoids unnecessary waits when the TLB invalidation fence has not been
    armed, simplifying caller logic in cases where the fence status is
    uncertain.

    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

commit 55d8d77c804087e5fad1b5ca8d2e1d8ce816b646
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 7 22:27:08 2025 -0700

    drm/gpusvm: Add drm_gpusvm_in_notifier_* helpers

    Abstract drm_gpusvm_in_notifier_lock/unlock with helpers. Intended usage
    is a client side 2nd pass of a MMU notifier.

    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

commit 087aed38ceaee2daef97acd816fde538bd53b74e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 7 22:27:07 2025 -0700

    drm/gpusvm, drm/xe: Update GPU SVM / Xe to twopass MMU notifier

    Update GPU SVM and Xe to use two-pass MMU notifiers, enabling pipelined
    TLB invalidations across VMs or multiple devices.

    The driver-side (Xe) implementation is not yet implemented.

    v1:
    - Update function naming and comments.

    Signed-off-by: Matthew Brost <matthew.brost@intel.com>

commit e43edf1f7e1a8fbe97157c10d0d9ec97aa7ba6e1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sat Aug 9 15:35:06 2025 +0200

    mm/mmu_notifier: Allow two-pass struct mmu_interval_notifiers

    GPU use-cases for mmu_interval_notifiers with hmm often involve
    starting a gpu operation and then waiting for it to complete.
    These operations are typically context preemption or TLB flushing.

    With single-pass notifiers per GPU this doesn't scale in
    multi-gpu scenarios. In those scenarios we'd want to first start
    preemption- or TLB flushing on all GPUs and as a second pass wait
    for them to complete.

    One can do this on per-driver basis multiplexing per-driver
    notifiers but that would mean sharing the notifier "user" lock
    across all GPUs and that doesn't scale well either, so adding support
    for multi-pass in the core appears to be the right choice.

    Implement two-pass capability in the mmu_interval_notifier. Use a
    linked list for the final passes to minimize the impact for
    use-cases that don't need the multi-pass functionality by avoiding
    a second interval tree walk, and to be able to easily pass data
    between the two passes.

    v1:
    - Restrict to two passes (Jason Gunthorpe)
    - Improve on documentation (Jason Gunthorpe)
    - Improve on function naming (Alistair Popple)

    Cc: Jason Gunthorpe <jgg@ziepe.ca>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: Simona Vetter <simona.vetter@ffwll.ch>
    Cc: Dave Airlie <airlied@gmail.com>
    Cc: Alistair Popple <apopple@nvidia.com>
    Cc: <dri-devel@lists.freedesktop.org>
    Cc: <linux-mm@kvack.org>
    Cc: <linux-kernel@vger.kernel.org>

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c                | 17 +++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 +-
 drivers/gpu/drm/xe/xe_svm.c                 | 83 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.c                  | 26 ++++---
 drivers/gpu/drm/xe/xe_vm.h                  |  6 +-
 include/drm/drm_gpusvm.h                    | 33 ++++++--
 include/linux/mmu_notifier.h                | 42 +++++++++++
 mm/mmu_notifier.c                           | 63 +++++++++++++---
 8 files changed, 223 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index e2a9a6ae1d54..7c0d04fd0e8e 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -317,10 +317,12 @@ drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
 
 /**
- * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
+ * drm_gpusvm_notifier_invalidate_start() - Invalidate a GPU SVM notifier,
+ * fist pass.
  * @mni: Pointer to the mmu_interval_notifier structure.
  * @mmu_range: Pointer to the mmu_notifier_range structure.
  * @cur_seq: Current sequence number.
+ * @final: First pass of MMU notifier
  *
  * This function serves as a generic MMU notifier for GPU SVM. It sets the MMU
  * notifier sequence number and calls the driver invalidate vfunc under
@@ -329,9 +331,10 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
  * Return: true if the operation succeeds, false otherwise.
  */
 static bool
-drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
-			       const struct mmu_notifier_range *mmu_range,
-			       unsigned long cur_seq)
+drm_gpusvm_notifier_invalidate_start(struct mmu_interval_notifier *mni,
+				     const struct mmu_notifier_range *mmu_range,
+				     unsigned long cur_seq,
+				     struct mmu_interval_notifier_finish **final)
 {
 	struct drm_gpusvm_notifier *notifier =
 		container_of(mni, typeof(*notifier), notifier);
@@ -342,7 +345,7 @@ drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
 
 	down_write(&gpusvm->notifier_lock);
 	mmu_interval_set_seq(mni, cur_seq);
-	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
+	gpusvm->ops->invalidate_start(gpusvm, notifier, mmu_range, final);
 	up_write(&gpusvm->notifier_lock);
 
 	return true;
@@ -352,7 +355,7 @@ drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
  * drm_gpusvm_notifier_ops - MMU interval notifier operations for GPU SVM
  */
 static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
-	.invalidate = drm_gpusvm_notifier_invalidate,
+	.invalidate_start = drm_gpusvm_notifier_invalidate_start,
 };
 
 /**
@@ -383,7 +386,7 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const struct drm_gpusvm_ops *ops,
 		    const unsigned long *chunk_sizes, int num_chunks)
 {
-	if (!ops->invalidate || !num_chunks)
+	if (!ops->invalidate_start || !num_chunks)
 		return -EINVAL;
 
 	gpusvm->name = name;
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index f7f0f2eaf4b5..c6d4398d3429 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -34,7 +34,8 @@ void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fe
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
 {
-	dma_fence_wait(&fence->base, false);
+	if (fence->seqno)
+		dma_fence_wait(&fence->base, false);
 }
 
 #endif	/* _XE_GT_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e35c6d4def20..a278c9dc5306 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -144,15 +144,8 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	 * invalidations spanning multiple ranges.
 	 */
 	for_each_tile(tile, xe, id)
-		if (xe_pt_zap_ptes_range(tile, vm, range)) {
+		if (xe_pt_zap_ptes_range(tile, vm, range))
 			tile_mask |= BIT(id);
-			/*
-			 * WRITE_ONCE pairs with READ_ONCE in
-			 * xe_vm_has_valid_gpu_mapping()
-			 */
-			WRITE_ONCE(range->tile_invalidated,
-				   range->tile_invalidated | BIT(id));
-		}
 
 	return tile_mask;
 }
@@ -161,23 +154,69 @@ static void
 xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 				const struct mmu_notifier_range *mmu_range)
 {
+	struct xe_svm_range *range = to_xe_range(r);
 	struct drm_gpusvm_ctx ctx = { .in_notifier = true, };
 
 	xe_svm_assert_in_notifier(vm);
 
+	/*
+	 * WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping()
+	 */
+	WRITE_ONCE(range->tile_invalidated, range->tile_present);
+
 	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
 	if (!xe_vm_is_closed(vm) && mmu_range->event == MMU_NOTIFY_UNMAP)
 		xe_svm_garbage_collector_add_range(vm, to_xe_range(r),
 						   mmu_range);
 }
 
-static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
-			      struct drm_gpusvm_notifier *notifier,
-			      const struct mmu_notifier_range *mmu_range)
+struct xe_svm_invalidate_finish {
+	struct drm_gpusvm *gpusvm;
+	struct drm_gpusvm_notifier *notifier;
+#define XE_SVM_INVALIDATE_FENCE_COUNT	\
+	(XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE)
+	struct xe_gt_tlb_invalidation_fence fences[XE_SVM_INVALIDATE_FENCE_COUNT];
+	struct mmu_interval_notifier_finish f;
+};
+
+static void
+xe_svm_invalidate_finish(struct mmu_interval_notifier_finish *final,
+			 const struct mmu_notifier_range *mmu_range,
+			 unsigned long cur_seq)
+{
+	struct xe_svm_invalidate_finish *xe_final = container_of(final, typeof(*xe_final), f);
+	struct drm_gpusvm *gpusvm = xe_final->gpusvm;
+	struct drm_gpusvm_notifier *notifier = xe_final->notifier;
+	struct drm_gpusvm_range *r = NULL;
+	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
+	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
+	int id;
+
+	/* Adjust invalidation to notifier boundaries */
+	adj_start = max(drm_gpusvm_notifier_start(notifier), adj_start);
+	adj_end = min(drm_gpusvm_notifier_end(notifier), adj_end);
+
+	for (id = 0; id < XE_SVM_INVALIDATE_FENCE_COUNT; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&xe_final->fences[id]);
+
+	drm_gpusvm_in_notifier_lock(gpusvm);
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		xe_svm_range_notifier_event_end(vm, r, mmu_range);
+	drm_gpusvm_in_notifier_unlock(gpusvm);
+
+	kfree(xe_final);
+}
+
+static void xe_svm_invalidate_start(struct drm_gpusvm *gpusvm,
+				    struct drm_gpusvm_notifier *notifier,
+				    const struct mmu_notifier_range *mmu_range,
+				    struct mmu_interval_notifier_finish **final)
 {
 	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_range *r, *first;
+	struct xe_svm_invalidate_finish *xe_final = NULL;
+	struct xe_gt_tlb_invalidation_fence *fences = NULL;
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
 	u8 tile_mask = 0;
 	long err;
@@ -225,13 +264,25 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_device_wmb(xe);
 
-	err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start, adj_end, tile_mask);
+	xe_final = kzalloc(sizeof(*xe_final), GFP_NOWAIT);
+	if (xe_final) {
+		xe_final->gpusvm = gpusvm;
+		xe_final->notifier = notifier;
+		xe_final->f.finish = xe_svm_invalidate_finish;
+		fences = xe_final->fences;
+		*final = &xe_final->f;
+	}
+
+	err = xe_vm_range_tilemask_tlb_invalidation(vm, fences, adj_start,
+						    adj_end, tile_mask);
 	WARN_ON_ONCE(err);
 
 range_notifier_event_end:
-	r = first;
-	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
-		xe_svm_range_notifier_event_end(vm, r, mmu_range);
+	if (!xe_final) {
+		r = first;
+		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+			xe_svm_range_notifier_event_end(vm, r, mmu_range);
+	}
 }
 
 static int __xe_svm_garbage_collector(struct xe_vm *vm,
@@ -553,7 +604,7 @@ static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
-	.invalidate = xe_svm_invalidate,
+	.invalidate_start = xe_svm_invalidate_start,
 };
 
 static const unsigned long fault_chunk_sizes[] = {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f35d69c0b4c6..e30c60158bd4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3878,6 +3878,7 @@ void xe_vm_unlock(struct xe_vm *vm)
  * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
  * address range
  * @vm: The VM
+ * @fences: Caller provided fences, caller owns waiting if non-NULL
  * @start: start address
  * @end: end address
  * @tile_mask: mask for which gt's issue tlb invalidation
@@ -3886,10 +3887,12 @@ void xe_vm_unlock(struct xe_vm *vm)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
-					  u64 end, u8 tile_mask)
+int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm,
+					  struct xe_gt_tlb_invalidation_fence *fences,
+					  u64 start, u64 end, u8 tile_mask)
 {
 	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	struct xe_gt_tlb_invalidation_fence *__fence = fences ?: fence;
 	struct xe_tile *tile;
 	u32 fence_id = 0;
 	u8 id;
@@ -3901,37 +3904,41 @@ int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
 	for_each_tile(tile, vm->xe, id) {
 		if (tile_mask & BIT(id)) {
 			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[fence_id], true);
+							 __fence, true);
 
 			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
-							   &fence[fence_id],
+							   __fence,
 							   start,
 							   end,
 							   vm->usm.asid);
 			if (err)
 				goto wait;
 			++fence_id;
+			++__fence;
 
 			if (!tile->media_gt)
 				continue;
 
 			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id], true);
+							  __fence, true);
 
 			err = xe_gt_tlb_invalidation_range(tile->media_gt,
-							   &fence[fence_id],
+							   __fence,
 							   start,
 							   end,
 							   vm->usm.asid);
 			if (err)
 				goto wait;
 			++fence_id;
+			++__fence;
 		}
 	}
 
 wait:
-	for (id = 0; id < fence_id; ++id)
-		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	if (!fences) {
+		for (id = 0; id < fence_id; ++id)
+			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	}
 
 	return err;
 }
@@ -3990,7 +3997,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	xe_device_wmb(xe);
 
-	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
+	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), NULL,
+						    xe_vma_start(vma),
 						    xe_vma_end(vma), tile_mask);
 
 	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 2f213737c7e5..0b08b22e3bb3 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -22,6 +22,7 @@ struct dma_fence;
 
 struct xe_exec_queue;
 struct xe_file;
+struct xe_gt_tlb_invalidation_fence;
 struct xe_sync_entry;
 struct xe_svm_range;
 struct drm_exec;
@@ -228,8 +229,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 				     struct xe_svm_range *range);
 
-int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
-					  u64 end, u8 tile_mask);
+int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm,
+					  struct xe_gt_tlb_invalidation_fence *fences,
+					  u64 start, u64 end, u8 tile_mask);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 0e336148309d..9757a04d1de2 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -63,17 +63,20 @@ struct drm_gpusvm_ops {
 	void (*range_free)(struct drm_gpusvm_range *range);
 
 	/**
-	 * @invalidate: Invalidate GPU SVM notifier (required)
+	 * @invalidate_start: Invalidate first pass GPU SVM notifier (required)
 	 * @gpusvm: Pointer to the GPU SVM
 	 * @notifier: Pointer to the GPU SVM notifier
 	 * @mmu_range: Pointer to the mmu_notifier_range structure
+	 * @final: Final pass of MMU notifier, optionally populated by the driver side
+	 * if a final pass of MMU notifier is desired
 	 *
 	 * Invalidate the GPU page tables. It can safely walk the notifier range
 	 * RB tree/list in this function. Called while holding the notifier lock.
 	 */
-	void (*invalidate)(struct drm_gpusvm *gpusvm,
-			   struct drm_gpusvm_notifier *notifier,
-			   const struct mmu_notifier_range *mmu_range);
+	void (*invalidate_start)(struct drm_gpusvm *gpusvm,
+				 struct drm_gpusvm_notifier *notifier,
+				 const struct mmu_notifier_range *mmu_range,
+				 struct mmu_interval_notifier_finish **final);
 };
 
 /**
@@ -314,7 +317,7 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 #endif
 
 /**
- * drm_gpusvm_notifier_lock() - Lock GPU SVM notifier
+ * drm_gpusvm_notifier_lock() - Lock GPU SVM notifier, client side
  * @gpusvm__: Pointer to the GPU SVM structure.
  *
  * Abstract client usage GPU SVM notifier lock, take lock
@@ -323,7 +326,7 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 	down_read(&(gpusvm__)->notifier_lock)
 
 /**
- * drm_gpusvm_notifier_unlock() - Unlock GPU SVM notifier
+ * drm_gpusvm_notifier_unlock() - Unlock GPU SVM notifier, client side
  * @gpusvm__: Pointer to the GPU SVM structure.
  *
  * Abstract client usage GPU SVM notifier lock, drop lock
@@ -331,6 +334,24 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 #define drm_gpusvm_notifier_unlock(gpusvm__)	\
 	up_read(&(gpusvm__)->notifier_lock)
 
+/**
+ * drm_gpusvm_in_notifier_lock() - Lock GPU SVM notifier, in notifier
+ * @gpusvm__: Pointer to the GPU SVM structure.
+ *
+ * Abstract in notifier (2nd pass) usage GPU SVM notifier lock, take lock
+ */
+#define drm_gpusvm_in_notifier_lock(gpusvm__)	\
+	down_write(&(gpusvm__)->notifier_lock)
+
+/**
+ * drm_gpusvm_in_notifier_unlock() - Unlock GPU SVM notifier, in notifier
+ * @gpusvm__: Pointer to the GPU SVM structure.
+ *
+ * Abstract in notifier (2nd pass) GPU SVM notifier lock, drop lock
+ */
+#define drm_gpusvm_in_notifier_unlock(gpusvm__)	\
+	up_write(&(gpusvm__)->notifier_lock)
+
 /**
  * drm_gpusvm_range_start() - GPU SVM range start address
  * @range: Pointer to the GPU SVM range
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index d1094c2d5fb6..14cfb3735699 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -233,16 +233,58 @@ struct mmu_notifier {
 	unsigned int users;
 };
 
+/**
+ * struct mmu_interval_notifier_finish - mmu_interval_notifier two-pass abstraction
+ * @link: List link for the notifiers pending pass list
+ *
+ * Allocate, typically using GFP_NOWAIT in the interval notifier's first pass.
+ * If allocation fails (which is not unlikely under memory pressure), fall back
+ * to single-pass operation. Note that with a large number of notifiers
+ * implementing two passes, allocation with GFP_NOWAIT will become increasingly
+ * likely to fail, so consider implementing a small pool instead of using
+ * kmalloc() allocations.
+ *
+ * If the implementation needs to pass data between the two passes,
+ * the recommended way is to embed strct mmu_interval_notifier_finish into a larger
+ * structure that also contains the data needed to be shared. Keep in mind that
+ * a notifier callback can be invoked in parallel, and each invocation needs its
+ * own struct mmu_interval_notifier_finish.
+ */
+struct mmu_interval_notifier_finish {
+	struct list_head link;
+	/**
+	 * @finish: Driver callback for the finish pass.
+	 * @final: Pointer to the mmu_interval_notifier_finish structure.
+	 * @range: The mmu_notifier_range.
+	 * @cur_seq: The current sequence set by the first pass.
+	 *
+	 * Note that there is no error reporting for additional passes.
+	 */
+	void (*finish)(struct mmu_interval_notifier_finish *final,
+		       const struct mmu_notifier_range *range,
+		       unsigned long cur_seq);
+};
+
 /**
  * struct mmu_interval_notifier_ops
  * @invalidate: Upon return the caller must stop using any SPTEs within this
  *              range. This function can sleep. Return false only if sleeping
  *              was required but mmu_notifier_range_blockable(range) is false.
+ * @invalidate_start: Similar to @invalidate, but intended for two-pass notifier
+ *                    callbacks where the callto @invalidate_start is the first
+ *                    pass and any struct mmu_interval_notifier_finish pointer
+ *                    returned in the @fini parameter describes the final pass.
+ *                    If @fini is %NULL on return, then no final pass will be
+ *                    called.
  */
 struct mmu_interval_notifier_ops {
 	bool (*invalidate)(struct mmu_interval_notifier *interval_sub,
 			   const struct mmu_notifier_range *range,
 			   unsigned long cur_seq);
+	bool (*invalidate_start)(struct mmu_interval_notifier *interval_sub,
+				 const struct mmu_notifier_range *range,
+				 unsigned long cur_seq,
+				 struct mmu_interval_notifier_finish **final);
 };
 
 struct mmu_interval_notifier {
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 8e0125dc0522..fceadcd8ca24 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -260,6 +260,18 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
 }
 EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
 
+static void mn_itree_final_pass(struct list_head *final_passes,
+				const struct mmu_notifier_range *range,
+				unsigned long cur_seq)
+{
+	struct mmu_interval_notifier_finish *f, *next;
+
+	list_for_each_entry_safe(f, next, final_passes, link) {
+		list_del(&f->link);
+		f->finish(f, range, cur_seq);
+	}
+}
+
 static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 			     struct mm_struct *mm)
 {
@@ -271,6 +283,7 @@ static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 		.end = ULONG_MAX,
 	};
 	struct mmu_interval_notifier *interval_sub;
+	LIST_HEAD(final_passes);
 	unsigned long cur_seq;
 	bool ret;
 
@@ -278,11 +291,25 @@ static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 		     mn_itree_inv_start_range(subscriptions, &range, &cur_seq);
 	     interval_sub;
 	     interval_sub = mn_itree_inv_next(interval_sub, &range)) {
-		ret = interval_sub->ops->invalidate(interval_sub, &range,
-						    cur_seq);
+		if (interval_sub->ops->invalidate_start) {
+			struct mmu_interval_notifier_finish *final = NULL;
+
+			ret = interval_sub->ops->invalidate_start(interval_sub,
+								  &range,
+								  cur_seq,
+								  &final);
+			if (ret && final)
+				list_add_tail(&final->link, &final_passes);
+
+		} else {
+			ret = interval_sub->ops->invalidate(interval_sub,
+							    &range,
+							    cur_seq);
+		}
 		WARN_ON(!ret);
 	}
 
+	mn_itree_final_pass(&final_passes, &range, cur_seq);
 	mn_itree_inv_end(subscriptions);
 }
 
@@ -430,7 +457,9 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 			       const struct mmu_notifier_range *range)
 {
 	struct mmu_interval_notifier *interval_sub;
+	LIST_HEAD(final_passes);
 	unsigned long cur_seq;
+	int err = 0;
 
 	for (interval_sub =
 		     mn_itree_inv_start_range(subscriptions, range, &cur_seq);
@@ -438,23 +467,39 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 	     interval_sub = mn_itree_inv_next(interval_sub, range)) {
 		bool ret;
 
-		ret = interval_sub->ops->invalidate(interval_sub, range,
-						    cur_seq);
+		if (interval_sub->ops->invalidate_start) {
+			struct mmu_interval_notifier_finish *final = NULL;
+
+			ret = interval_sub->ops->invalidate_start(interval_sub,
+								  range,
+								  cur_seq,
+								  &final);
+			if (ret && final)
+				list_add_tail(&final->link, &final_passes);
+
+		} else {
+			ret = interval_sub->ops->invalidate(interval_sub,
+							    range,
+							    cur_seq);
+		}
 		if (!ret) {
 			if (WARN_ON(mmu_notifier_range_blockable(range)))
 				continue;
-			goto out_would_block;
+			err = -EAGAIN;
+			break;
 		}
 	}
-	return 0;
 
-out_would_block:
+	mn_itree_final_pass(&final_passes, range, cur_seq);
+
 	/*
 	 * On -EAGAIN the non-blocking caller is not allowed to call
 	 * invalidate_range_end()
 	 */
-	mn_itree_inv_end(subscriptions);
-	return -EAGAIN;
+	if (err)
+		mn_itree_inv_end(subscriptions);
+
+	return err;
 }
 
 static int mn_hlist_invalidate_range_start(
-- 
2.50.1

