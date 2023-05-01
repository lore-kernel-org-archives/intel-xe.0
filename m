Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F403DC7EE2D
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3861810E363;
	Mon,  1 May 2023 07:51:16 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3410E315
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927473; x=1714463473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGob7MuM3rHKGjTQyynWRhgM6pKDKEYxaLkgrRcogFg=;
 b=YCKbIyRBo1W0fOrGq434fbjxEe4d+k2ROM2gILDfyGxJ1Od+o0tNnLix
 xord+ltuILQ/O1wOgG84tD+fByOWiWdb3s1QhRAdo4HVnBcVQ/8MXADhN
 /+ZWwBsJ1P89xjWttRL3UJkPO0ebebhCTu/za0+QkM87Fwgkxk3VffhFo
 F2pF1nlgIYos2HqB7WShHld63AVsv/UHzQ+RvQdtEbXrbJsZ3oYgAad3d
 d1MCe7D8v1q4KpeCWCJ+cRG+DVGAs9OerEva2NuQO5VU9P/9qKAP/fOJg
 0L5qy0SKUwy+FQEvTA3PJElDUQ4Vvqmn2GDi86W9P5pcojGg2m185GYbY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910725"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910725"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095237"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095237"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:51:03 -0700
Message-Id: <20230501075114.3108352-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 19/30] drm/xe: Reduce the number list links in
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
index 010f44260cda..8eab8e1bbaf0 100644
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
index 0712cf9d9894..0224ef916794 100644
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
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
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
@@ -1328,7 +1325,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 			continue;
 		}
 
-		list_add_tail(&vma->unbind_link, &contested);
+		if (!list_empty(&vma->destroy_link))
+			list_del_init(&vma->destroy_link);
+		list_add_tail(&vma->destroy_link, &contested);
 	}
 
 	/*
@@ -1356,8 +1355,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
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
index d55ec8156caa..22def5483c12 100644
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

