Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A68C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 23:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E9D10E0C0;
	Fri, 24 Jul 2026 23:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0oGtQgt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA12010E0C6
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 23:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784935566; x=1816471566;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+Zkm8Cn4Nl/FsPvL0UinkdIK0HMBb9M48UajS4MOfSg=;
 b=e0oGtQgt9myshW/BUNRQ9xBIHQ2uI+QDeJ0ZfBkFKlcRrgiz82I00gF/
 sVXKVhIMl9Glkw2ewjDoo8K+wyFmh8qtlzUTcyMAsDrix5kmsU3csK257
 QW/6rYvMOQMu78gZRo2mjJrPo9wldVHUECyPn42sEFhJnG3sruhEgyL4w
 /BMJ8OhrcbgrK5S3dTqhFno+QwSpuQBG+mpNMmx27SgkJnu7S5s07tpSG
 X9PCUXGV6CgEM+jB9i/HEI3XwPOs3pWSBJkLNFt1jxVXAdA44AcQQDirx
 71qVE8U7v8O04n44UMuGFtchcq6dVKea3q+eEV7LdwuoydrRj4p7hj2FA g==;
X-CSE-ConnectionGUID: +yX8Ji7FRyCN8cKHMBXmtQ==
X-CSE-MsgGUID: qVyYiXwiQOerFCD4UOoQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85652021"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="85652021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 16:26:05 -0700
X-CSE-ConnectionGUID: MSaJUGt6RqSXzqRr/mxDig==
X-CSE-MsgGUID: eiiPwMCJSiKwMvcmIKOoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="257073785"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 16:26:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 02/12] drm/xe: Allow prefetch-only VM bind IOCTLs to use VM
 read lock
Date: Fri, 24 Jul 2026 16:25:51 -0700
Message-Id: <20260724232601.1753977-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724232601.1753977-1-matthew.brost@intel.com>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
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

Prefetch-only VM bind IOCTLs do not modify VMAs or use userptr pages.
Downgrade vm->lock to read mode once setup is complete.

Lays the groundwork for prefetch IOCTLs to use threaded migration.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 36 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c064bff842fd..d7e6644df4bc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2451,10 +2451,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
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
@@ -2463,6 +2465,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
 		xe_assert(vm->xe, bo);
 
+		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
 		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
@@ -2523,6 +2526,9 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			u8 id, tile_mask = 0;
 			u32 i;
 
+			if (xe_vma_is_userptr(vma))
+				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
+
 			if (!xe_vma_is_cpu_addr_mirror(vma)) {
 				op->prefetch.region = prefetch_region;
 				continue;
@@ -2708,10 +2714,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2721,6 +2729,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		u8 tile_present =
 			gpuva_to_vma(op->base.remap.unmap->va)->tile_present;
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
 				 true);
 		op->flags |= XE_VMA_OP_COMMITTED;
@@ -2755,6 +2765,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		break;
 	}
 	case DRM_GPUVA_OP_UNMAP:
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
 		op->flags |= XE_VMA_OP_COMMITTED;
 		break;
@@ -2979,10 +2991,12 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
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
@@ -2992,6 +3006,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		if (vma) {
 			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
@@ -3005,6 +3021,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.remap.unmap->va);
 
+		xe_vm_assert_write_mode_or_garbage_collector(vm);
+
 		if (op->remap.prev) {
 			prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
 			xe_vma_destroy_unlocked(op->remap.prev);
@@ -3589,7 +3607,7 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	struct dma_fence *fence;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	xe_validation_guard(&ctx, &vm->xe->val, &exec,
 			    ((struct xe_val_flags) {
@@ -3912,7 +3930,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops = NULL;
-	struct xe_vma_ops vops;
+	struct xe_vma_ops vops = { .flags = 0, };
 	struct dma_fence *fence;
 	int err;
 	int i;
@@ -4087,6 +4105,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -4123,7 +4146,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index b94eb018d532..2f5f74fed9d2 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -561,6 +561,8 @@ struct xe_vma_ops {
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

