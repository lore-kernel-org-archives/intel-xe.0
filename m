Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8213C77B6E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 01:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB16110E53E;
	Tue,  4 Apr 2023 01:42:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0ED10E2C8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 01:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680572551; x=1712108551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WOMoJCeZEXKQU6bzijCs+MHZ1YO9SNx2o5ghfHaY0CU=;
 b=ALUmXwITyOI81A5wmcQSTW9XBqthOHGrNHbsrkXLVuGsnON0Bc+WSxGZ
 X98KSThnmumqY+yJVQFGif774Vpq7Jl3Ci6EH5q/T3x6Q3o9xO2huVJrd
 OPE8UK7lmycSkcD89cmOtIS2ZM0FOXYWjZ44Ke25s/1qfc+5xtahDlWSm
 5jse7q8j7AaTpYDpfIcoCHshxL+A5sdidviKRbvcaAWSFNjraEBQg0pi9
 fXTDH2s4QIgySWmSdPaDxfmvXraY5zZniYS6hLAxP31P9fHRCXiuNc6gK
 bWBKl/THe4Bz3Ro6+Q8tbVFSGbm+zvT6B+fZTknTiJm7ksxq6zwXD9glC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322456426"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="322456426"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755470839"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="755470839"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  3 Apr 2023 18:42:27 -0700
Message-Id: <20230404014228.3738347-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404014228.3738347-1-matthew.brost@intel.com>
References: <20230404014228.3738347-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 7/8] drm/xe: Reduce the number list links in
 xe_vma
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

5 list links in can be squashed into a union in xe_vma as being on the
various list is mutually exclusive.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c           |  5 +-
 drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++------
 drivers/gpu/drm/xe/xe_vm_types.h     | 71 +++++++++++++++-------------
 4 files changed, 55 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index cfffe3398fe4..d7bf6b0a0697 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -157,7 +157,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	if (xe_vma_is_userptr(vma) && write_locked) {
 		spin_lock(&vm->userptr.invalidated_lock);
-		list_del_init(&vma->userptr.invalidate_link);
+		list_del_init(&vma->invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 
 		ret = xe_vma_userptr_pin_pages(vma);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 43e5a1054411..195eb78e7a31 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1116,8 +1116,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
 
 		vma->userptr.divisor = divisor << 1;
 		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&vma->userptr.invalidate_link,
-			       &vm->userptr.invalidated);
+		list_move_tail(&vma->invalidate_link, &vm->userptr.invalidated);
 		spin_unlock(&vm->userptr.invalidated_lock);
 		return true;
 	}
@@ -1724,7 +1723,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 		if (!vma->gt_present) {
 			spin_lock(&vm->userptr.invalidated_lock);
-			list_del_init(&vma->userptr.invalidate_link);
+			list_del_init(&vma->invalidate_link);
 			spin_unlock(&vm->userptr.invalidated_lock);
 		}
 		up_read(&vm->userptr.notifier_lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c1e1b443cd2d..bacad720e7ba 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -677,8 +677,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	if (!xe_vm_in_fault_mode(vm) &&
 	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->gt_present) {
 		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&vma->userptr.invalidate_link,
-			       &vm->userptr.invalidated);
+		list_move_tail(&vma->invalidate_link, &vm->userptr.invalidated);
 		spin_unlock(&vm->userptr.invalidated_lock);
 	}
 
@@ -726,8 +725,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	/* Collect invalidated userptrs */
 	spin_lock(&vm->userptr.invalidated_lock);
 	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
-				 userptr.invalidate_link) {
-		list_del_init(&vma->userptr.invalidate_link);
+				 invalidate_link) {
+		list_del_init(&vma->invalidate_link);
 		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
 	}
 	spin_unlock(&vm->userptr.invalidated_lock);
@@ -830,12 +829,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		return vma;
 	}
 
-	/* FIXME: Way to many lists, should be able to reduce this */
+	/*
+	 * userptr_link, destroy_link, notifier.rebind_link,
+	 * invalidate_link
+	 */
 	INIT_LIST_HEAD(&vma->rebind_link);
-	INIT_LIST_HEAD(&vma->unbind_link);
-	INIT_LIST_HEAD(&vma->userptr_link);
-	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
-	INIT_LIST_HEAD(&vma->notifier.rebind_link);
 	INIT_LIST_HEAD(&vma->extobj.link);
 
 	INIT_LIST_HEAD(&vma->gpuva.head);
@@ -953,15 +951,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	struct xe_vm *vm = xe_vma_vm(vma);
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_BUG_ON(!list_empty(&vma->unbind_link));
 
 	if (xe_vma_is_userptr(vma)) {
 		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
 
 		spin_lock(&vm->userptr.invalidated_lock);
-		list_del_init(&vma->userptr.invalidate_link);
+		if (!list_empty(&vma->invalidate_link))
+			list_del_init(&vma->invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
-		list_del(&vma->userptr_link);
 	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 		drm_gpuva_unlink(&vma->gpuva);
@@ -1325,7 +1322,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 			continue;
 		}
 
-		list_add_tail(&vma->unbind_link, &contested);
+		if (!list_empty(&vma->destroy_link))
+			list_del_init(&vma->destroy_link);
+		list_add_tail(&vma->destroy_link, &contested);
 	}
 
 	/*
@@ -1353,8 +1352,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	 * Since we hold a refcount to the bo, we can remove and free
 	 * the members safely without locking.
 	 */
-	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
-		list_del_init(&vma->unbind_link);
+	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
+		list_del_init(&vma->destroy_link);
 		xe_vma_destroy_unlocked(vma);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 21c46b71b7d8..a049dfa9450a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -50,21 +50,32 @@ struct xe_vma {
 	 */
 	u64 gt_present;
 
-	/** @userptr_link: link into VM repin list if userptr */
-	struct list_head userptr_link;
+	union {
+		/** @userptr_link: link into VM repin list if userptr */
+		struct list_head userptr_link;
 
-	/**
-	 * @rebind_link: link into VM if this VMA needs rebinding, and
-	 * if it's a bo (not userptr) needs validation after a possible
-	 * eviction. Protected by the vm's resv lock.
-	 */
-	struct list_head rebind_link;
+		/**
+		 * @rebind_link: link into VM if this VMA needs rebinding, and
+		 * if it's a bo (not userptr) needs validation after a possible
+		 * eviction. Protected by the vm's resv lock.
+		 */
+		struct list_head rebind_link;
 
-	/**
-	 * @unbind_link: link or list head if an unbind of multiple VMAs, in
-	 * single unbind op, is being done.
-	 */
-	struct list_head unbind_link;
+		/** @destroy_link: link for contested VMAs on VM close */
+		struct list_head destroy_link;
+
+		/** @invalidate_link: Link for the vm::userptr.invalidated list */
+		struct list_head invalidate_link;
+
+		struct {
+			 /*
+			  * @notifier.rebind_link: link for
+			  * vm->notifier.rebind_list, protected by
+			  * vm->notifier.list_lock
+			  */
+			struct list_head rebind_link;
+		} notifier;
+	};
 
 	/** @destroy_cb: callback to destroy VMA when unbind job is done */
 	struct dma_fence_cb destroy_cb;
@@ -72,10 +83,22 @@ struct xe_vma {
 	/** @destroy_work: worker to destroy this BO */
 	struct work_struct destroy_work;
 
+	/** @usm: unified shared memory state */
+	struct {
+		/** @gt_invalidated: VMA has been invalidated */
+		u64 gt_invalidated;
+	} usm;
+
+	struct {
+		/**
+		 * @extobj.link: Link into vm's external object list.
+		 * protected by the vm lock.
+		 */
+		struct list_head link;
+	} extobj;
+
 	/** @userptr: user pointer state */
 	struct {
-		/** @invalidate_link: Link for the vm::userptr.invalidated list */
-		struct list_head invalidate_link;
 		/**
 		 * @notifier: MMU notifier for user pointer (invalidation call back)
 		 */
@@ -96,24 +119,6 @@ struct xe_vma {
 		u32 divisor;
 #endif
 	} userptr;
-
-	/** @usm: unified shared memory state */
-	struct {
-		/** @gt_invalidated: VMA has been invalidated */
-		u64 gt_invalidated;
-	} usm;
-
-	struct {
-		struct list_head rebind_link;
-	} notifier;
-
-	struct {
-		/**
-		 * @extobj.link: Link into vm's external object list.
-		 * protected by the vm lock.
-		 */
-		struct list_head link;
-	} extobj;
 };
 
 struct xe_device;
-- 
2.34.1

