Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D40EC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 10:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4A410F5C4;
	Wed, 20 Mar 2024 10:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbVYdtBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1952310F58B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710929433; x=1742465433;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=y7qhm2k53lQZRDia9duVU1fYyQ6fwA3mTtj7sMuz5NQ=;
 b=KbVYdtBm/gjqSj1scnfYKsUlLkt63qZoet6TUoDeXyiDi/+f3dAV9ZKO
 5f5Ty7Gx+mQME8Kd5XdmsefrBZusHkKdy7zsxZFtgwyR1DR72SEC9z4+b
 /0rKXTJL6BuzYBoejYfgY6uBUpH6i1gUKkdt2dvUFqPRzY90EMPvqqeQk
 o5G8DCMXJDg1y3YpMTYb2Izfk3ws+grOmZVfc1dR5im6fTOFzwoMVOKYv
 TYiwFJaqQ9o1Wfs3mq9dzIV/r2VbCHRE1PsKnuOC97ROZfYuaYzCQP2G1
 LSRRwnCCTd3J2ho6Dmh7IqTQjkZC10lteZDk8XhJIs0pBz4UhA5iKKg1m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5723761"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5723761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="37232883"
Received: from suntharx-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.177])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/8] drm/xe: Rework rebinding
Date: Wed, 20 Mar 2024 11:10:16 +0100
Message-ID: <20240320101020.5611-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
References: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
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
index deda444b1045..70b1c0ef3fee 100644
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
@@ -264,35 +263,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index db3731365b81..17250abb0361 100644
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
index a087b637d2bf..c8416d1d0bd6 100644
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
@@ -763,14 +755,14 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
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
@@ -778,17 +770,17 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
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
@@ -1570,7 +1562,6 @@ static void vm_destroy_work_func(struct work_struct *w)
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
index 157a805b8621..6b504e2f51d8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -180,9 +180,6 @@ struct xe_vm {
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

