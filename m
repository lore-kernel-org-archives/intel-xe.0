Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B5AFD461B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 04:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3859710E86D;
	Thu, 26 Feb 2026 04:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RE+DIb7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121F910E0FF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772080119; x=1803616119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jWTH7bQH15r+0RNw02vH5QuObG12vFob40G0RHRp/44=;
 b=RE+DIb7fbpGVQPf7RZ0NxdRTlKGw8rW8J/TGKOV8m/e+dly24YYQB5ro
 yjwQ44XLR3yFRw29jauEOokD9pL1DXO8Kp07d9wnXoBpSDBQ21vOFTpKn
 evTz0t6NszLczRkaoyVNMJAV8CzjjVInRLoFYqW2vmiIS9I7+1kwGdEGU
 RcQVOwIYJRawqo7ksMyfnjZj75MhriUOfgf75qmIPSjbUfnVu4kLpc6dH
 H66i5JfpxQa8ORY6pXjxDwOtav44pYFS+AENgo4g9WMzipXvvIJKB6TFH
 HLQdeh9jRE8//g/H2kKC0s86JGzZPJABYmiFMi7Rk63K3sLAWWG2l9jMU w==;
X-CSE-ConnectionGUID: rxbFdShfTKes7P6JjL5Jvg==
X-CSE-MsgGUID: 0S5jG7nLTZ25IquttvXCHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98603128"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="98603128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:39 -0800
X-CSE-ConnectionGUID: fDfM2BJNSWaXwA93kG9Yow==
X-CSE-MsgGUID: 8pGHs0UuQYKx1MVafBwrQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216334146"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v4 02/12] drm/xe: Allow prefetch-only VM bind IOCTLs to use VM
 read lock
Date: Wed, 25 Feb 2026 20:28:24 -0800
Message-Id: <20260226042834.2963245-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226042834.2963245-1-matthew.brost@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c       | 36 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3332a86f464f..204a89ca3397 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2336,10 +2336,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			.map.gem.offset = bo_offset_or_userptr,
 		};
 
+		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
 		break;
 	}
 	case DRM_XE_VM_BIND_OP_UNMAP:
+		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
 		break;
 	case DRM_XE_VM_BIND_OP_PREFETCH:
@@ -2348,6 +2350,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
 		xe_assert(vm->xe, bo);
 
+		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
 		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
@@ -2397,6 +2400,9 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			u8 id, tile_mask = 0;
 			u32 i;
 
+			if (xe_vma_is_userptr(vma))
+				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
+
 			if (!xe_vma_is_cpu_addr_mirror(vma)) {
 				op->prefetch.region = prefetch_region;
 				break;
@@ -2582,10 +2588,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2595,6 +2603,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		u8 tile_present =
 			gpuva_to_vma(op->base.remap.unmap->va)->tile_present;
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
 		op->flags |= XE_VMA_OP_COMMITTED;
@@ -2628,6 +2638,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		break;
 	}
 	case DRM_GPUVA_OP_UNMAP:
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
@@ -2849,10 +2861,12 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
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
@@ -2862,6 +2876,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		if (vma) {
 			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
@@ -2875,6 +2891,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.remap.unmap->va);
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		if (op->remap.prev) {
 			prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
 			xe_vma_destroy_unlocked(op->remap.prev);
@@ -3362,7 +3380,7 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	struct dma_fence *fence;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	xe_validation_guard(&ctx, &vm->xe->val, &exec,
 			    ((struct xe_val_flags) {
@@ -3664,7 +3682,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops = NULL;
-	struct xe_vma_ops vops;
+	struct xe_vma_ops vops = { .flags = 0, };
 	struct dma_fence *fence;
 	int err;
 	int i;
@@ -3839,6 +3857,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3875,7 +3898,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 free_bos:
 	kvfree(bos);
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
index 9c91934ec47f..db6e8e22a69f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -518,6 +518,8 @@ struct xe_vma_ops {
 #define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
 #define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
 #define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
+#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
+#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

