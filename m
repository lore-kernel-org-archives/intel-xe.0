Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911E3C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6657810E8C0;
	Thu,  7 Dec 2023 14:12:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36A710E8C0
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958342; x=1733494342;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FXgtlWTdXv6/moFAK4n+jkXMc0dHNFgWIgSKJDkcrLM=;
 b=c2ZRW6pbTf/Mur4220DtbtFbwy83j8B+tisBvK0kg1QecFQp4YokPQwO
 FFQOBm+gzeN1d7RDIrJcgF923FpkpoC0v/yI+cOB/Tx6lPoprgb2RGuH1
 cqYNqVGAD+/q7RzfaKgaa9zN/16IcVTgT5Vj6DrZyulkZop7m2q2A1Zuf
 X5vBqUtTRAQP+ZmgUGLNAuoSXBbQ5n+reslA1avqb9Inmx+enK3/DyiVl
 yha5ZW16CuBsBDH4AQPSrcSAY9/DdqMnmbAGqByMKeHNWGcoIaJUIsli6
 QaMhcoch4zCEj5H/UNr70EYW5hvmGSp7J3yolbzqnjlpJMo69RJaPYccD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="12947576"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12947576"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721479789"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721479789"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:20 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/16] drm/xe: Adjust to commit drm/gpuvm: reference count
 drm_gpuvm structures
Date: Thu,  7 Dec 2023 15:11:54 +0100
Message-ID: <20231207141157.26014-15-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 65 +++++++++++---------------------
 drivers/gpu/drm/xe/xe_vm.h       |  5 +--
 drivers/gpu/drm/xe/xe_vm_types.h |  2 -
 3 files changed, 24 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 034496ac2341..6c8a84026af4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1197,8 +1197,11 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
 	return &op->base;
 }
 
+static void xe_vm_free(struct drm_gpuvm *gpuvm);
+
 static struct drm_gpuvm_ops gpuvm_ops = {
 	.op_alloc = xe_vm_op_alloc,
+	.vm_free = xe_vm_free,
 };
 
 static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
@@ -1337,7 +1340,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
 	struct xe_vm *vm;
-	int err, i = 0, number_tiles = 0;
+	int err, number_tiles = 0;
 	struct xe_tile *tile;
 	u8 id;
 
@@ -1346,7 +1349,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		return ERR_PTR(-ENOMEM);
 
 	vm->xe = xe;
-	kref_init(&vm->refcount);
 
 	vm->size = 1ull << xe->info.va_bits;
 
@@ -1392,7 +1394,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 	if (err)
-		goto err_put;
+		goto err_close;
 
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAG_64K;
@@ -1406,7 +1408,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		if (IS_ERR(vm->pt_root[id])) {
 			err = PTR_ERR(vm->pt_root[id]);
 			vm->pt_root[id] = NULL;
-			goto err_destroy_root;
+			goto err_unlock_close;
 		}
 	}
 
@@ -1417,7 +1419,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 			err = xe_pt_create_scratch(xe, tile, vm);
 			if (err)
-				goto err_scratch_pt;
+				goto err_unlock_close;
 		}
 		vm->batch_invalidate_tlb = true;
 	}
@@ -1456,8 +1458,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 						       create_flags);
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(q)) {
-				xe_vm_close_and_put(vm);
-				return ERR_CAST(q);
+				err = PTR_ERR(q);
+				goto err_close;
 			}
 			vm->q[id] = q;
 			number_tiles++;
@@ -1478,27 +1480,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	return vm;
 
-err_scratch_pt:
-	for_each_tile(tile, xe, id) {
-		if (!vm->pt_root[id])
-			continue;
-
-		i = vm->pt_root[id]->level;
-		while (i)
-			if (vm->scratch_pt[id][--i])
-				xe_pt_destroy(vm->scratch_pt[id][i],
-					      vm->flags, NULL);
-		xe_bo_unpin(vm->scratch_bo[id]);
-		xe_bo_put(vm->scratch_bo[id]);
-	}
-err_destroy_root:
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id])
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-	}
+err_unlock_close:
 	dma_resv_unlock(xe_vm_resv(vm));
-err_put:
-	drm_gpuvm_destroy(&vm->gpuvm);
+err_close:
+	xe_vm_close_and_put(vm);
+	return ERR_PTR(err);
+
 err_no_resv:
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
@@ -1586,6 +1573,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
 					      NULL);
 		}
+		if (vm->pt_root[id]) {
+			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
+			vm->pt_root[id] = NULL;
+		}
 	}
 	xe_vm_unlock(vm);
 
@@ -1639,29 +1630,17 @@ static void vm_destroy_work_func(struct work_struct *w)
 		}
 	}
 
-	/*
-	 * XXX: We delay destroying the PT root until the VM if freed as PT root
-	 * is needed for xe_vm_lock to work. If we remove that dependency this
-	 * can be moved to xe_vm_close_and_put.
-	 */
-	xe_vm_lock(vm, false);
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id]) {
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-			vm->pt_root[id] = NULL;
-		}
-	}
-	xe_vm_unlock(vm);
+	for_each_tile(tile, xe, id)
+		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
-	drm_gpuvm_destroy(&vm->gpuvm);
 	kfree(vm);
 }
 
-void xe_vm_free(struct kref *ref)
+static void xe_vm_free(struct drm_gpuvm *gpuvm)
 {
-	struct xe_vm *vm = container_of(ref, struct xe_vm, refcount);
+	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
 	queue_work(system_unbound_wq, &vm->destroy_work);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index e4b5cb8a0f08..12bb5d79487f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -24,20 +24,19 @@ struct xe_sync_entry;
 struct drm_exec;
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
-void xe_vm_free(struct kref *ref);
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
 
 static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
 {
-	kref_get(&vm->refcount);
+	drm_gpuvm_get(&vm->gpuvm);
 	return vm;
 }
 
 static inline void xe_vm_put(struct xe_vm *vm)
 {
-	kref_put(&vm->refcount, xe_vm_free);
+	drm_gpuvm_put(&vm->gpuvm);
 }
 
 int xe_vm_lock(struct xe_vm *vm, bool intr);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 4e540d013702..e70ec6b2fabe 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -142,8 +142,6 @@ struct xe_vm {
 
 	struct xe_device *xe;
 
-	struct kref refcount;
-
 	/* exec queue used for (un)binding vma's */
 	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
 
-- 
2.42.0

