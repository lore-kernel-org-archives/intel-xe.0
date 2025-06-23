Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA83C7EE33
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 14:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA03810E3CE;
	Mon, 23 Jun 2025 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NE9Fyw/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B15910E3CA
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750689852; x=1782225852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qvuegHA1/Jz4PaNRvUdPMzv5dB4xVscxsaSwl+4yW0=;
 b=NE9Fyw/Ft0J72tNSoq1kDNb8sS22mIgvhlou7O5lLbqblbmpbqWn9eAG
 slAAUYPp4kR3M7pDsyWKh9eAMNq4m63TculIasOj9AW5ZO4yO6YUmFQc+
 cCsCuPL7wQEmT+WvDT9jZ78oSOgZF5utH2NBMn2SE26gZ65iun5LH9I+g
 D8pIprlYZC35b+JaV1H9bKdGbDZALvXYc4rJFtzxj/lUM4HAXgIFiIASk
 2iI9Opkl9ZLa4KEBtbwwaGf41AtNesQQRMBs2/05tSt74BEMmmZCElHPt
 GFj7aWZgeijk3JV0bj4NZP3r6SKEyXPkPt4kqBJLgqV6xbeaq2yWAN7dq Q==;
X-CSE-ConnectionGUID: mkBf3ry2QIeNIvDP/Jgmyg==
X-CSE-MsgGUID: Gkr/Chj2QWaHTGza8Jmmtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52837056"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52837056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:11 -0700
X-CSE-ConnectionGUID: heGKAj4/SXyUAr4dQmR1Qw==
X-CSE-MsgGUID: ZNDgYYKCRzWSMZ3HK5J/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182661936"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 07:44:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 1/4] drm/xe: Only use delayed worker to destroy userptr VMAs
Date: Mon, 23 Jun 2025 07:45:45 -0700
Message-Id: <20250623144548.2388268-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623144548.2388268-1-matthew.brost@intel.com>
References: <20250623144548.2388268-1-matthew.brost@intel.com>
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

TTM has a delayed BO destruction mechanism based on dma-resv, which
eliminates the need for the delayed worker to destroy VMAs containing
BOs. However, userptr still requires this mechanism because DMA mappings
and notifiers cannot be removed until the GPU bindings are gone.
Therefore, move the delayed worker responsible for destroying userptr
VMAs to the userptr code and bypass this process for VMAs containing a
BO.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 80 +++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm_types.h | 13 +++---
 2 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 04d1a43b81e3..9309a5956f00 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1270,54 +1270,47 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	return vma;
 }
 
-static void xe_vma_destroy_late(struct xe_vma *vma)
+static void xe_vma_userptr_destroy_late(struct xe_userptr_vma *uvma)
 {
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_userptr *userptr = &uvma->userptr;
 	struct xe_vm *vm = xe_vma_vm(vma);
 
-	if (vma->ufence) {
-		xe_sync_ufence_put(vma->ufence);
-		vma->ufence = NULL;
-	}
-
-	if (xe_vma_is_userptr(vma)) {
-		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
-		struct xe_userptr *userptr = &uvma->userptr;
+	xe_assert(vm->xe, xe_vma_is_userptr(vma));
 
-		if (userptr->sg)
-			xe_hmm_userptr_free_sg(uvma);
+	if (userptr->sg)
+		xe_hmm_userptr_free_sg(uvma);
 
-		/*
-		 * Since userptr pages are not pinned, we can't remove
-		 * the notifier until we're sure the GPU is not accessing
-		 * them anymore
-		 */
-		mmu_interval_notifier_remove(&userptr->notifier);
-		mutex_destroy(&userptr->unmap_mutex);
-		xe_vm_put(vm);
-	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
-		xe_vm_put(vm);
-	} else {
-		xe_bo_put(xe_vma_bo(vma));
-	}
+	/*
+	 * Since userptr pages are not pinned, we can't remove
+	 * the notifier until we're sure the GPU is not accessing
+	 * them anymore
+	 */
+	mmu_interval_notifier_remove(&userptr->notifier);
+	mutex_destroy(&userptr->unmap_mutex);
+	xe_vm_put(vm);
 
 	xe_vma_free(vma);
 }
 
-static void vma_destroy_work_func(struct work_struct *w)
+static void userptr_destroy_work_func(struct work_struct *w)
 {
-	struct xe_vma *vma =
-		container_of(w, struct xe_vma, destroy_work);
+	struct xe_userptr *userptr =
+		container_of(w, typeof(*userptr), destroy_work);
+	struct xe_userptr_vma *uvma = container_of(userptr, typeof(*uvma),
+						   userptr);
 
-	xe_vma_destroy_late(vma);
+	xe_vma_userptr_destroy_late(uvma);
 }
 
-static void vma_destroy_cb(struct dma_fence *fence,
-			   struct dma_fence_cb *cb)
+static void userptr_destroy_cb(struct dma_fence *fence,
+			       struct dma_fence_cb *cb)
 {
-	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
+	struct xe_userptr *userptr =
+		container_of(cb, typeof(*userptr), destroy_cb);
 
-	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
-	queue_work(system_unbound_wq, &vma->destroy_work);
+	INIT_WORK(&userptr->destroy_work, userptr_destroy_work_func);
+	queue_work(system_unbound_wq, &userptr->destroy_work);
 }
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
@@ -1327,6 +1320,11 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
 
+	if (vma->ufence) {
+		xe_sync_ufence_put(vma->ufence);
+		vma->ufence = NULL;
+	}
+
 	if (xe_vma_is_userptr(vma)) {
 		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
 
@@ -1338,19 +1336,25 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		xe_bo_assert_held(xe_vma_bo(vma));
 
 		drm_gpuva_unlink(&vma->gpuva);
+		xe_bo_put(xe_vma_bo(vma));
+	} else {
+		xe_vm_put(vm);
 	}
 
 	xe_vm_assert_held(vm);
-	if (fence) {
-		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
-						 vma_destroy_cb);
+	if (fence && xe_vma_is_userptr(vma)) {
+		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+		int ret = dma_fence_add_callback(fence, &userptr->destroy_cb,
+						 userptr_destroy_cb);
 
 		if (ret) {
 			XE_WARN_ON(ret != -ENOENT);
-			xe_vma_destroy_late(vma);
+			xe_vma_userptr_destroy_late(to_userptr_vma(vma));
 		}
+	} else if (xe_vma_is_userptr(vma)) {
+		xe_vma_userptr_destroy_late(to_userptr_vma(vma));
 	} else {
-		xe_vma_destroy_late(vma);
+		xe_vma_free(vma);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bed6088e1bb3..cb4b9fbcf75d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -64,6 +64,12 @@ struct xe_userptr {
 	unsigned long notifier_seq;
 	/** @unmap_mutex: Mutex protecting dma-unmapping */
 	struct mutex unmap_mutex;
+	union {
+		/** @destroy_cb: callback to destroy usertpr when unbind job is done */
+		struct dma_fence_cb destroy_cb;
+		/** @destroy_work: worker to destroy this usertpr */
+		struct work_struct destroy_work;
+	};
 	/**
 	 * @initial_bind: user pointer has been bound at least once.
 	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
@@ -93,13 +99,6 @@ struct xe_vma {
 		struct list_head destroy;
 	} combined_links;
 
-	union {
-		/** @destroy_cb: callback to destroy VMA when unbind job is done */
-		struct dma_fence_cb destroy_cb;
-		/** @destroy_work: worker to destroy this BO */
-		struct work_struct destroy_work;
-	};
-
 	/**
 	 * @tile_invalidated: Tile mask of binding are invalidated for this VMA.
 	 * protected by BO's resv and for userptrs, vm->userptr.notifier_lock in
-- 
2.34.1

