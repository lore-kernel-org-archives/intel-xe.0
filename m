Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37418C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 13:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4D810E14E;
	Wed, 20 Mar 2024 13:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8jVsfCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA5C10E14E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710942252; x=1742478252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Lp4Gfn8si0HtBsaDAav04WJzoj3GA7QUNA1TrE13kac=;
 b=h8jVsfCBd1O30biMZ2LljWDpVYld15yUVELBXa0pn3V9ffMxFDEhbYAv
 EVgASuppNOKlDOLx8h1OvdjeXENh9ocr8KFBtfl81M2Fr5Oh+clKs+q2s
 6DXR+sUGjWa1ze4E+yG1pc6jaSesBtXHDSaLvpbDMyySSDmlcZoT/8kTg
 ORM1lLZPUur+piZM6Y0uI9nIo180avqKRQ1tP8QMzt///aO1woEWNvKTA
 gIBbsLWJZTNiluPZTb5DtBBopXNNdxMStEuZlb4wWeXCPki5LCmFNbuCP
 rnXmYH5gL//sKULNT3cmUNebrpSQK8G77cWFY8UY3XCyy+mEOHjQStFsR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="8811903"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="8811903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18810078"
Received: from prabaaax-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 06:44:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/8] drm/xe: Rework rebinding
Date: Wed, 20 Mar 2024 14:43:52 +0100
Message-ID: <20240320134356.73655-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320134356.73655-1-thomas.hellstrom@linux.intel.com>
References: <20240320134356.73655-1-thomas.hellstrom@linux.intel.com>
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

Instead of handling the vm's rebind fence separately,
attach rebind fences as kernel fences to the vm's resv.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c     | 31 +++----------------------------
 drivers/gpu/drm/xe/xe_pt.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++------------------
 drivers/gpu/drm/xe/xe_vm.h       |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h |  3 ---
 5 files changed, 14 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 511d23426a5e..397a49b731f1 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -127,7 +127,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs = 0, num_ufence = 0;
 	struct xe_sched_job *job;
-	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
 	ktime_t end = 0;
@@ -269,35 +268,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * Rebind any invalidated userptr or evicted BOs in the VM, non-compute
 	 * VM mode only.
 	 */
-	rebind_fence = xe_vm_rebind(vm, false);
-	if (IS_ERR(rebind_fence)) {
-		err = PTR_ERR(rebind_fence);
+	err = xe_vm_rebind(vm, false);
+	if (err)
 		goto err_put_job;
-	}
-
-	/*
-	 * We store the rebind_fence in the VM so subsequent execs don't get
-	 * scheduled before the rebinds of userptrs / evicted BOs is complete.
-	 */
-	if (rebind_fence) {
-		dma_fence_put(vm->rebind_fence);
-		vm->rebind_fence = rebind_fence;
-	}
-	if (vm->rebind_fence) {
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-			     &vm->rebind_fence->flags)) {
-			dma_fence_put(vm->rebind_fence);
-			vm->rebind_fence = NULL;
-		} else {
-			dma_fence_get(vm->rebind_fence);
-			err = drm_sched_job_add_dependency(&job->drm,
-							   vm->rebind_fence);
-			if (err)
-				goto err_put_job;
-		}
-	}
 
-	/* Wait behind munmap style rebinds */
+	/* Wait behind rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
 							  xe_vm_resv(vm),
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7add08b2954e..92cd660fbcef 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1304,7 +1304,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 		}
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
+		dma_resv_add_fence(xe_vm_resv(vm), fence, rebind ||
 				   last_munmap_rebind ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cff8db605743..33a85e702e2c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -529,7 +529,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct drm_exec exec;
-	struct dma_fence *rebind_fence;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	ktime_t end = 0;
@@ -575,18 +574,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	rebind_fence = xe_vm_rebind(vm, true);
-	if (IS_ERR(rebind_fence)) {
-		err = PTR_ERR(rebind_fence);
+	err = xe_vm_rebind(vm, true);
+	if (err)
 		goto out_unlock;
-	}
-
-	if (rebind_fence) {
-		dma_fence_wait(rebind_fence, false);
-		dma_fence_put(rebind_fence);
-	}
 
-	/* Wait on munmap style VM unbinds */
+	/* Wait on rebinds and munmap style VM unbinds */
 	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
@@ -780,14 +772,14 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	       struct xe_sync_entry *syncs, u32 num_syncs,
 	       bool first_op, bool last_op);
 
-struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
+int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
-	struct dma_fence *fence = NULL;
+	struct dma_fence *fence;
 	struct xe_vma *vma, *next;
 
 	lockdep_assert_held(&vm->lock);
 	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
-		return NULL;
+		return 0;
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry_safe(vma, next, &vm->rebind_list,
@@ -795,17 +787,17 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		xe_assert(vm->xe, vma->tile_present);
 
 		list_del_init(&vma->combined_links.rebind);
-		dma_fence_put(fence);
 		if (rebind_worker)
 			trace_xe_vma_rebind_worker(vma);
 		else
 			trace_xe_vma_rebind_exec(vma);
 		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
 		if (IS_ERR(fence))
-			return fence;
+			return PTR_ERR(fence);
+		dma_fence_put(fence);
 	}
 
-	return fence;
+	return 0;
 }
 
 static void xe_vma_free(struct xe_vma *vma)
@@ -1586,7 +1578,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
-	dma_fence_put(vm->rebind_fence);
 	kfree(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 47f3960120a0..20009d8b4702 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -207,7 +207,7 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
-struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
+int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5747f136d24d..badf3945083d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -177,9 +177,6 @@ struct xe_vm {
 	 */
 	struct list_head rebind_list;
 
-	/** @rebind_fence: rebind fence from execbuf */
-	struct dma_fence *rebind_fence;
-
 	/**
 	 * @destroy_work: worker to destroy VM, needed as a dma_fence signaling
 	 * from an irq context can be last put and the destroy needs to be able
-- 
2.44.0

