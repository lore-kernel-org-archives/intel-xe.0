Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7DFC7EE3A
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD1610E3B7;
	Mon,  1 May 2023 07:51:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C6910E38E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927473; x=1714463473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tqzvsgblsVErEjkzJY5QH/qwh8Xlb27IURFZ0Ube4P8=;
 b=hfKpR4gTlmq3wsokBqeF57gyPcpou2if/gHkcY8o8fe0lC7ZPbiqteDy
 FgkkOHt6acuFknBAaFbsw2DRSNFiaW9F87H4awELyHa6HUR8mjhGzTqHn
 W/XZ5JKanYeN15/OuepvDkcxb1gXXoF3IE5hwgTq3UvYncEAIb1xNAXgV
 R9Y/BY7QEG0y4iSKNR8j9LIhdMK1gdzNsgZUvSrUSoF5/CV6sgWVxx6m2
 jpuUihEfzVtAitgrAcn7Ncy3qlp8s/w5LLcAr5AaAnI/sdmevBD+4JYu4
 KXwiWcyqoHEyetESmWNIcRTErQn3ghCyrAp/eF5bpFTaVy5U9Skztr5Jf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910728"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910728"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095246"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095246"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:51:06 -0700
Message-Id: <20230501075114.3108352-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 22/30] drm/gpuva: Move dma-resv to GPUVA manager
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

Logical place for this, will help with upcoming patches.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpuva_mgr.c  |  2 ++
 drivers/gpu/drm/xe/xe_bo.c       | 10 +++++-----
 drivers/gpu/drm/xe/xe_bo.h       |  2 +-
 drivers/gpu/drm/xe/xe_exec.c     |  4 ++--
 drivers/gpu/drm/xe/xe_migrate.c  |  4 ++--
 drivers/gpu/drm/xe/xe_pt.c       |  6 +++---
 drivers/gpu/drm/xe/xe_vm.c       | 34 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.h       | 12 ++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h |  6 +-----
 include/drm/drm_gpuva_mgr.h      |  6 ++++++
 10 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index 137322945e91..6d2d0f4d5018 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -443,6 +443,8 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
 	mgr->name = name ? name : "unknown";
 	mgr->ops = ops;
 
+	dma_resv_init(&mgr->resv);
+
 	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
 
 	if (reserve_range) {
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a475d0584916..e0422ffb6327 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -441,9 +441,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			 * that we indeed have it locked, put the vma an the
 			 * vm's notifier.rebind_list instead and scoop later.
 			 */
-			if (dma_resv_trylock(&vm->resv))
+			if (dma_resv_trylock(xe_vm_resv(vm)))
 				vm_resv_locked = true;
-			else if (ctx->resv != &vm->resv) {
+			else if (ctx->resv != xe_vm_resv(vm)) {
 				spin_lock(&vm->notifier.list_lock);
 				list_move_tail(&vma->notifier.rebind_link,
 					       &vm->notifier.rebind_list);
@@ -456,7 +456,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 				list_add_tail(&vma->rebind_link, &vm->rebind_list);
 
 			if (vm_resv_locked)
-				dma_resv_unlock(&vm->resv);
+				dma_resv_unlock(xe_vm_resv(vm));
 		}
 	}
 
@@ -1240,7 +1240,7 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		}
 	}
 
-	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
+	bo = __xe_bo_create_locked(xe, bo, gt, vm ? xe_vm_resv(vm) : NULL,
 				   vm && !xe_vm_no_dma_fences(vm) &&
 				   flags & XE_BO_CREATE_USER_BIT ?
 				   &vm->lru_bulk_move : NULL, size,
@@ -1555,7 +1555,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		xe_vm_assert_held(vm);
 
 		ctx.allow_res_evict = allow_res_evict;
-		ctx.resv = &vm->resv;
+		ctx.resv = xe_vm_resv(vm);
 	}
 
 	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 81051f456874..9b401d30a130 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -150,7 +150,7 @@ void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_BUG_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
+		XE_BUG_ON(bo->vm && bo->ttm.base.resv != &bo->vm->mgr.resv);
 		if (bo->vm)
 			xe_vm_assert_held(bo->vm);
 		else
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 68f876afd13c..b352fd6e1f4d 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -327,7 +327,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	/* Wait behind munmap style rebinds */
 	if (!xe_vm_no_dma_fences(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
-							  &vm->resv,
+							  xe_vm_resv(vm),
 							  DMA_RESV_USAGE_KERNEL);
 		if (err)
 			goto err_put_job;
@@ -355,7 +355,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_arm(job);
 	if (!xe_vm_no_dma_fences(vm)) {
 		/* Block userptr invalidations / BO eviction */
-		dma_resv_add_fence(&vm->resv,
+		dma_resv_add_fence(xe_vm_resv(vm),
 				   &job->drm.s_fence->finished,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0a393c5772e5..91a06c925a1e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1049,7 +1049,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 					  DMA_RESV_USAGE_KERNEL))
 		return ERR_PTR(-ETIME);
 
-	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
+	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
 					       DMA_RESV_USAGE_BOOKKEEP)) {
 		vm_dbg(&xe_vm_device(vm)->drm, "wait on VM for munmap");
 		return ERR_PTR(-ETIME);
@@ -1264,7 +1264,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 */
 	if (first_munmap_rebind) {
 		vm_dbg(&xe_vm_device(vm)->drm, "wait on first_munmap_rebind");
-		err = job_add_deps(job, &vm->resv,
+		err = job_add_deps(job, xe_vm_resv(vm),
 				   DMA_RESV_USAGE_BOOKKEEP);
 		if (err)
 			goto err_job;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4167f666d98d..0f40f1950686 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1020,7 +1020,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	else if (!xe_vma_is_null(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
-	dma_resv_assert_held(&vm->resv);
+	dma_resv_assert_held(xe_vm_resv(vm));
 }
 
 static void xe_pt_commit_bind(struct xe_vma *vma,
@@ -1381,7 +1381,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 		}
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence, !rebind &&
+		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
 				   last_munmap_rebind ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
@@ -1701,7 +1701,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 		fence = &ifence->base.base;
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence,
+		dma_resv_add_fence(xe_vm_resv(vm), fence,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/* This fence will be installed by caller when doing eviction */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 77220a17d29c..ab840f74b7a0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -307,7 +307,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	list_for_each_entry(e, &vm->preempt.engines, compute.link) {
 		e->ops->resume(e);
 
-		dma_resv_add_fence(&vm->resv, e->compute.pfence,
+		dma_resv_add_fence(xe_vm_resv(vm), e->compute.pfence,
 				   DMA_RESV_USAGE_BOOKKEEP);
 		xe_vm_fence_all_extobjs(vm, e->compute.pfence,
 					DMA_RESV_USAGE_BOOKKEEP);
@@ -345,7 +345,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 
 	down_read(&vm->userptr.notifier_lock);
 
-	dma_resv_add_fence(&vm->resv, pfence,
+	dma_resv_add_fence(xe_vm_resv(vm), pfence,
 			   DMA_RESV_USAGE_BOOKKEEP);
 
 	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
@@ -603,7 +603,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	/* Wait on munmap style VM unbinds */
-	wait = dma_resv_wait_timeout(&vm->resv,
+	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 	if (wait <= 0) {
@@ -689,13 +689,13 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	 * unbinds to complete, and those are attached as BOOKMARK fences
 	 * to the vm.
 	 */
-	dma_resv_iter_begin(&cursor, &vm->resv,
+	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 			    DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence)
 		dma_fence_enable_sw_signaling(fence);
 	dma_resv_iter_end(&cursor);
 
-	err = dma_resv_wait_timeout(&vm->resv,
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
 				    DMA_RESV_USAGE_BOOKKEEP,
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
@@ -742,12 +742,12 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	}
 
 	/* Take lock and move to rebind_list for rebinding. */
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
+	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 	if (err)
 		goto out_err;
 
 	list_splice_tail(&tmp_evict, &vm->rebind_list);
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 
 	return 0;
 
@@ -1085,7 +1085,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		return ERR_PTR(-ENOMEM);
 
 	kref_init(&vm->refcount);
-	dma_resv_init(&vm->resv);
 
 	vm->size = 1ull << xe_pt_shift(xe->info.vm_max_level + 1);
 
@@ -1120,12 +1119,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_device_mem_access_get(xe);
 	}
 
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
+	drm_gpuva_manager_init(&vm->mgr, &xe->drm, "Xe VM", 0, vm->size, 0, 0,
+			       &gpuva_ops);
+
+	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 	if (err)
 		goto err_put;
 
-	drm_gpuva_manager_init(&vm->mgr, &xe->drm, "Xe VM", 0, vm->size, 0, 0,
-			       &gpuva_ops);
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAGS_64K;
 
@@ -1173,7 +1173,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 		xe_pt_populate_empty(gt, vm, vm->pt_root[id]);
 	}
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1230,10 +1230,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		if (vm->pt_root[id])
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 	}
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 	drm_gpuva_manager_destroy(&vm->mgr);
 err_put:
-	dma_resv_fini(&vm->resv);
+	dma_resv_fini(xe_vm_resv(vm));
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
 		xe_device_mem_access_put(xe);
@@ -1422,7 +1422,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
-	dma_resv_fini(&vm->resv);
+	dma_resv_fini(xe_vm_resv(vm));
 	kfree(vm);
 }
 
@@ -3294,7 +3294,7 @@ int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 
 void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
 {
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 	ww_acquire_fini(ww);
 }
 
@@ -3327,7 +3327,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&vma->userptr.notifier,
 				      vma->userptr.notifier_seq));
-			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vma_resv(vma),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
 		} else {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index cbbe95d6291f..81a9271be728 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -57,6 +57,11 @@ static inline struct xe_device *xe_vm_device(struct xe_vm *vm)
 	return container_of(vm->mgr.drm, struct xe_device, drm);
 }
 
+static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
+{
+	return &vm->mgr.resv;
+}
+
 static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
 {
 	return container_of(gpuva->mgr, struct xe_vm, mgr);
@@ -112,6 +117,11 @@ static inline struct xe_device *xe_vma_device(struct xe_vma *vma)
 	return xe_vm_device(xe_vma_vm(vma));
 }
 
+static inline struct dma_resv *xe_vma_resv(struct xe_vma *vma)
+{
+	return xe_vm_resv(xe_vma_vm(vma));
+}
+
 static inline bool xe_vma_read_only(struct xe_vma *vma)
 {
 	return vma->gpuva.flags & XE_VMA_READ_ONLY;
@@ -122,7 +132,7 @@ static inline u64 xe_vma_userptr(struct xe_vma *vma)
 	return vma->gpuva.gem.offset;
 }
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
+#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->mgr.resv)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_gt *full_gt);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fca42910dcae..26571d171a43 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -8,7 +8,6 @@
 
 #include <drm/drm_gpuva_mgr.h>
 
-#include <linux/dma-resv.h>
 #include <linux/kref.h>
 #include <linux/mmu_notifier.h>
 #include <linux/scatterlist.h>
@@ -131,7 +130,7 @@ struct xe_vma {
 
 struct xe_device;
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
+#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->mgr.resv)
 
 struct xe_vm {
 	/** @mgr: base GPUVA used to track VMAs */
@@ -142,9 +141,6 @@ struct xe_vm {
 	/* engine used for (un)binding vma's */
 	struct xe_engine *eng[XE_MAX_GT];
 
-	/** Protects @rebind_list and the page-table structures */
-	struct dma_resv resv;
-
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
 
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index 55b0acfdcc44..010b649e363f 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -25,6 +25,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-resv.h>
 #include <linux/maple_tree.h>
 #include <linux/mm.h>
 #include <linux/rbtree.h>
@@ -177,6 +178,11 @@ struct drm_gpuva_manager {
 	 */
 	const char *name;
 
+	/**
+	 * @resv: dma-resv for all private GEMs mapped in this address space
+	 */
+	struct dma_resv resv;
+
 	/**
 	 * @mm_start: start of the VA space
 	 */
-- 
2.34.1

