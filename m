Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895C9C48BC4
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31030112F75;
	Tue,  6 Feb 2024 23:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+e7hc4i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48026112F67
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NjI95osSm5r2Oa9IwoYHl8TiDdJtKRX+kLyk5Atc1Fg=;
 b=K+e7hc4ihDvXTz94Vi9w/VirbKkmqyKLbGr9f3zSTpKku1O3TxbyGUme
 PkNal5g83X2vFsPqjzhINjIlUA1Sj73EZW9NEx5AHnjVtiofyCGDquiCU
 +cA0CIxgHpS4cN/cOP5JbzDnIw0K3BTPJvO4q0zF9lraqbX2r75i6aiyX
 UMzl12zqbZfBIbb0Y3R4t0fqWgZrsmjd4KexFaesBSJj9lQk2kl5bYq5K
 a/qpil0b0i2Z4R3+T02qjXGrQuJGYaW19hbfjrVe2So+Bzq4fegONUt5B
 KVaMjTdhHx586IwaAGSig8d+0rN7StQYjZwjTybKgvwpJXwL1Xh3dbv1u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776796"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793818"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 13/22] drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
Date: Tue,  6 Feb 2024 15:37:20 -0800
Message-Id: <20240206233729.3173206-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

Will help with the converstion to 1 job per VM bind IOCTL. Allocation
only implemented in this patch.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt_types.h | 12 ++++++
 drivers/gpu/drm/xe/xe_vm.c       | 67 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
 3 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index cee70cb0f014..2093150f461e 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -74,4 +74,16 @@ struct xe_vm_pgtable_update {
 	u32 flags;
 };
 
+/** struct xe_vm_pgtable_update_op - Page table update operation */
+struct xe_vm_pgtable_update_op {
+	/** @entries: entries to update for this operation */
+	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
+	/** @num_entries: number of entries for this update operation */
+	u32 num_entries;
+	/** @bind: is a bind */
+	bool bind;
+	/** @rebind: is a rebind */
+	bool rebind;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c66e8cff07f8..13776d988b49 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1297,6 +1297,45 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->num_syncs = num_syncs;
 }
 
+static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
+{
+	int i, j;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
+		if (!vops->pt_update_ops[i].num_ops)
+			continue;
+
+		vops->pt_update_ops[i].ops =
+			kmalloc_array(vops->pt_update_ops[i].num_ops,
+				      sizeof(*vops->pt_update_ops[i].ops),
+				      GFP_KERNEL);
+		if (!vops->pt_update_ops[i].ops)
+			return -ENOMEM;
+
+		for (j = 0; j < vops->pt_update_ops[i].num_ops; ++j)
+			vops->pt_update_ops[i].ops[j].num_entries = 0;
+	}
+
+	return 0;
+}
+
+static void xe_vma_ops_fini(struct xe_vma_ops *vops)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		kfree(vops->pt_update_ops[i].ops);
+}
+
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		if (BIT(i) & tile_mask)
+			++vops->pt_update_ops[i].num_ops;
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1320,6 +1359,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
 	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
 	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
+	for (id = 0; id < XE_MAX_TILES_PER_DEVICE; ++id)
+		vm->dummy_ops.vops.pt_update_ops[id].num_ops = 1;
+	err = xe_vma_ops_alloc(&vm->dummy_ops.vops);
+	if (err)
+		goto err_free;
 
 	INIT_LIST_HEAD(&vm->rebind_list);
 
@@ -1445,11 +1489,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	return ERR_PTR(err);
 
 err_no_resv:
+	if (!(flags & XE_VM_FLAG_MIGRATION))
+		xe_device_mem_access_put(xe);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
+err_free:
+	xe_vma_ops_fini(&vm->dummy_ops.vops);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1585,6 +1631,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
+	xe_vma_ops_fini(&vm->dummy_ops.vops);
 	kfree(vm);
 }
 
@@ -2239,7 +2286,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
-
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
@@ -2288,6 +2334,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
+			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+				xe_vma_ops_incr_pt_update_ops(vops,
+							      op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2326,6 +2375,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 						xe_vma_end(vma) -
 						xe_vma_start(old);
 					op->remap.start = xe_vma_end(vma);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
 
@@ -2356,13 +2407,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->remap.range -=
 						xe_vma_end(old) -
 						xe_vma_start(vma);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
 		case DRM_GPUVA_OP_PREFETCH:
-			/* Nothing to do */
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -3127,11 +3181,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto unwind_ops;
+
 	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 unwind_ops:
 	if (err && err != -ENODATA)
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	xe_vma_ops_fini(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
 			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 4ba05315476f..1506c0d1338d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -21,6 +21,7 @@ struct xe_bo;
 struct xe_device;
 struct xe_sync_entry;
 struct xe_vm;
+struct xe_vm_pgtable_update_op;
 
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
 #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
@@ -209,6 +210,13 @@ struct xe_vma_ops {
 	struct xe_sync_entry *syncs;
 	/** @num_syncs: number of syncs */
 	u32 num_syncs;
+	/** @pt_update_ops: page table update operations */
+	struct {
+		/** @ops: operations */
+		struct xe_vm_pgtable_update_op *ops;
+		/** @num_ops: number of operations */
+		u32 num_ops;
+	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 };
 
 struct xe_vm {
-- 
2.34.1

