Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E674CD11DB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 11:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EDC10E75F;
	Thu, 21 Mar 2024 11:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsU+kJ5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298E510E6C3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711021061; x=1742557061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QMqEltyllkRGdUS9PVLGTwAMbC5LqVH+Ewx3bvml+s0=;
 b=UsU+kJ5QOIzyE9g6W92+4+5gG2WnRGo7Laxru/CNQ0QnC3XbLdtrwz+H
 S7/khtLoV4AP89O60mvPaZb1+qi1MvKPZ5ogsiqwW74INgRzl/Vk8DXko
 B19M64oROyx/b8wNmWKmzJpr8/haFHAzHPKCaHJ/KxVjji95OJcIrnrDG
 pCJdYEWUQXngofT8fezAOIZDCAJ5kxJ5BU5LERdNG3o/arQ+7VwoKDnWK
 h2TUAnhuBRTNHwXwMv6JPX+35FdSmBZCpdGb1Dd/fD6+0YnILvUonofum
 oeged0OAz60wAzOME9Z31pmWp9fk2FCWNx50Nv6hv3pGuFrDN+I5nQDIg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6127343"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="6127343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19053248"
Received: from dinieasx-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.100])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:37:39 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH 2/7] drm/xe: Rework rebinding
Date: Thu, 21 Mar 2024 12:37:12 +0100
Message-ID: <20240321113720.120865-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
References: <20240321113720.120865-1-thomas.hellstrom@linux.intel.com>
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
which is error prone if they are not strictly ordered,
attach rebind fences as kernel fences to the vm's resv.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c     | 31 +++----------------------------
 drivers/gpu/drm/xe/xe_pt.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++------------------
 drivers/gpu/drm/xe/xe_vm.h       |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h |  3 ---
 5 files changed, 14 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7692ebfe7d47..759497d4a102 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -152,7 +152,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs = 0, num_ufence = 0;
 	struct xe_sched_job *job;
-	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
 	ktime_t end = 0;
@@ -294,35 +293,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 21bc0d13fccf..0484ed5b495f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1298,7 +1298,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 		}
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
+		dma_resv_add_fence(xe_vm_resv(vm), fence, rebind ||
 				   last_munmap_rebind ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80d43d75b1da..35fba6e3f889 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -522,7 +522,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct drm_exec exec;
-	struct dma_fence *rebind_fence;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	ktime_t end = 0;
@@ -568,18 +567,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
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
@@ -773,14 +765,14 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
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
@@ -788,17 +780,17 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
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
@@ -1588,7 +1580,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
-	dma_fence_put(vm->rebind_fence);
 	kfree(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6df1f1c7f85d..4853354336f2 100644
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

