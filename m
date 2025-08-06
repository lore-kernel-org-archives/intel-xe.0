Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170CDCA0EC2
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDBB10E3AF;
	Wed,  6 Aug 2025 06:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Os1Qjcla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3993710E3A8
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z+252TU7pG9fDOkUUoCnhAOt0x5JOaJ3A87BWlmfLyM=;
 b=Os1QjclamfHJHA9u0xUWewS0gXEs8eXSgcAhEJinu6I83P+ilL1TaQTG
 dw34iwXmNnqDVSWRTey3OBVFRhgPzsRYasSkLYHKfD3+qQ9x0EP+iD/Ug
 2kAraTV/utmg9T3SUeSzV683eMSvexNKprrDmBPj8xIy6y2fEvt6MK0g1
 x0ce39aGH6uqcRJQqvMvnrKtGUQpwBmi6ojDZPB/Anfp8x2DS6qtA1U3H
 YJnF3k2xIKgB3oG1MnwK3/ikNdyKN/FFRJm4oymjn/trU1QGKx+KSjuUz
 xkFIINeLoUgEqjIuqEkOzCHY0vRvwr85gJE6RDSLJIqyVbje/mKH5mup3 g==;
X-CSE-ConnectionGUID: Lhav2C9JRlSC4Zle64zNoA==
X-CSE-MsgGUID: g65Q787CRQqizWonxQvmqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316938"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316938"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: Z8Tn//LMQHKCL7qaQMPCOg==
X-CSE-MsgGUID: s039esaCTJG4OF4X6zWGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868960"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 09/11] drm/xe: Allow prefetch-only VM bind IOCTLs to use VM
 read lock
Date: Tue,  5 Aug 2025 23:22:40 -0700
Message-Id: <20250806062242.1090416-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
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

Prefetch-only VM bind IOCTLs do not modify VMAs after pinning userptr
pages. Downgrade vm->lock to read mode once pinning is complete.

Lays the groundwork for prefetch IOCTLs to use threaded migration.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 41 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  4 +++-
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2498cff58fe7..3211827ef6d7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1763,6 +1763,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		err = xe_svm_init(vm);
 		if (err)
 			goto err_no_resv;
+	} else {
+		/*
+		 * Avoid lockdep explosions in
+		 * xe_vm_assert_write_mode_or_garbage_collector
+		 */
+		mutex_init(&vm->svm.garbage_collector.lock);
 	}
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
@@ -1996,6 +2002,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_fini(vm);
+	else
+		mutex_destroy(&vm->svm.garbage_collector.lock);
 
 	up_write(&vm->lock);
 
@@ -2365,10 +2373,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
+		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
 						  obj, bo_offset_or_userptr);
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP:
+		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
 		break;
 	case DRM_XE_VM_BIND_OP_PREFETCH:
@@ -2377,6 +2387,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
 		xe_assert(vm->xe, bo);
 
+		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
 		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
@@ -2584,10 +2595,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	int err = 0;
 
-	xe_vm_assert_write_mode_or_garbage_collector(vm);
+	lockdep_assert_held(&vm->lock);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		err |= xe_vm_insert_vma(vm, op->map.vma);
 		if (!err)
 			op->flags |= XE_VMA_OP_COMMITTED;
@@ -2597,6 +2610,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		u8 tile_present =
 			gpuva_to_vma(op->base.remap.unmap->va)->tile_present;
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
 		op->flags |= XE_VMA_OP_COMMITTED;
@@ -2630,6 +2645,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		break;
 	}
 	case DRM_GPUVA_OP_UNMAP:
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
@@ -2831,10 +2848,12 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
 {
-	xe_vm_assert_write_mode_or_garbage_collector(vm);
+	lockdep_assert_held(&vm->lock);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		if (op->map.vma) {
 			prep_vma_destroy(vm, op->map.vma, post_commit);
 			xe_vma_destroy_unlocked(op->map.vma);
@@ -2844,6 +2863,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		if (vma) {
 			down_read(&vm->userptr.notifier_lock);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
@@ -2857,6 +2878,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.remap.unmap->va);
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		if (op->remap.prev) {
 			prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
 			xe_vma_destroy_unlocked(op->remap.prev);
@@ -3313,7 +3336,7 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	struct dma_fence *fence;
 	int err;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
 		      DRM_EXEC_IGNORE_DUPLICATES, 0);
@@ -3587,7 +3610,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
-	struct xe_vma_ops vops;
+	struct xe_vma_ops vops = { .flags = 0 };
 	struct dma_fence *fence;
 	int err;
 	int i;
@@ -3753,6 +3776,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
+	if (!(vops.flags & XE_VMA_OPS_FLAG_MODIFIES_GPUVA)) {
+		vops.flags |= XE_VMA_OPS_FLAG_DOWNGRADE_LOCK;
+		downgrade_write(&vm->lock);
+	}
+
 	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
 	if (err)
 		goto unwind_ops;
@@ -3785,7 +3813,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (i = 0; i < args->num_binds; ++i)
 		xe_bo_put(bos[i]);
 release_vm_lock:
-	up_write(&vm->lock);
+	if (vops.flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK)
+		up_read(&vm->lock);
+	else
+		up_write(&vm->lock);
 put_exec_queue:
 	if (q)
 		xe_exec_queue_put(q);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1aabdedbfa92..332822e6ee7f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -481,7 +481,9 @@ struct xe_vma_ops {
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 	/** @flag: signify the properties within xe_vma_ops*/
-#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
+#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
+#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(1)
+#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(2)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

