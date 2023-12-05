Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC848C07E97
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:19:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A3910E57F;
	Tue,  5 Dec 2023 15:19:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FBD10E57D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701789577; x=1733325577;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=l8Yoy5iPsQ83urcnI5bBkL70qddzDQJrBb2/3aIBMy8=;
 b=CBYrGGgQFuJz9mt8vThVXI7+Yn5qLtAnqipShYWrB76N1pVldagaouqK
 sre9y5uxmLN67gVP9OJZ5NArXSX5bcMNfhOeGmYcA1qm654jBXJyw7TJf
 mXf6SZ4zH7vQYkOONBYZMPTRiA/LUQUOFtAywL5OJjAc5TE4lxTkyejac
 AkQGVuFQ0r1qq3coK1fgBEB2Gnh84lDX4I415Sx/NMkH4HAx/oQPGAXX2
 bNQTKM5EtVbnhMVpSs3SOvdqTLLHUD4pYU5LQNHvrsgB4l7rEdMl8+bPA
 kFPIL+a6UVfKW8c4w3dgqV/wgEgpq5FJDevlDT3jKOwVd126Yv/8yEV9p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393641604"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="393641604"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:19:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="770956852"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="770956852"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.119])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:19:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 16:19:10 +0100
Message-ID: <20231205151913.4259-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205151913.4259-1-thomas.hellstrom@linux.intel.com>
References: <20231205151913.4259-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 14/16] drm/xe: Adjust to commit drm/gpuvm: reference
 count drm_gpuvm structures
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
 drivers/gpu/drm/xe/xe_vm.c       | 30 ++++++++++++------------------
 drivers/gpu/drm/xe/xe_vm.h       |  5 ++---
 drivers/gpu/drm/xe/xe_vm_types.h |  2 --
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 034496ac2341..4c3a1b173646 100644
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
@@ -1346,7 +1349,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		return ERR_PTR(-ENOMEM);
 
 	vm->xe = xe;
-	kref_init(&vm->refcount);
 
 	vm->size = 1ull << xe->info.va_bits;
 
@@ -1498,7 +1500,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	}
 	dma_resv_unlock(xe_vm_resv(vm));
 err_put:
-	drm_gpuvm_destroy(&vm->gpuvm);
+	//	drm_gpuvm_destroy(&vm->gpuvm);
 err_no_resv:
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
@@ -1586,6 +1588,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
 					      NULL);
 		}
+		if (vm->pt_root[id]) {
+			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
+			vm->pt_root[id] = NULL;
+		}
 	}
 	xe_vm_unlock(vm);
 
@@ -1639,29 +1645,17 @@ static void vm_destroy_work_func(struct work_struct *w)
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
index 1d2b1917b33a..811b57232520 100644
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
index 5b449ec9c3e5..29271a8dbe48 100644
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

