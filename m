Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA02C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C977C10E555;
	Thu, 20 Jul 2023 04:21:27 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FBA10E029
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 04:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689826881; x=1721362881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k1cf4vx4jBA/G3vWK/m1/CdtYFZqw5OpXtG9ZNitCq8=;
 b=U9Zg76JmFYSyrE9ISULKR88rjgwqnefEM687Un04lheLbLqitAuvzNHW
 gfJJVFiwoIjaKjPlq5rx4mHeKp9dLCtzrK6UWh0v8F36JXnOZncmA/YmB
 Pg/L/8lrryM5VEua90TfU+e72dpPbUrVqFuU/t3O8HVoukEWdDYfYSbf8
 /nz87+P5O03mq6FJcZkkFd5E+senrGba9dMb/ZbpIgLpd0NkN3nnug6iD
 wa5FlYcANHCeeTWkjJZ/RSwzCLY9/3mqmvLW5ffP7txZ/Ep6IEqvJI15r
 ElI5eo+d4ezgrLje/FoZS3PFcYuBJ06x30Bs3GI06p0NtCjtyUVqPRdLu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366661712"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366661712"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724245046"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="724245046"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 21:21:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 21:21:11 -0700
Message-Id: <20230720042115.119494-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720042115.119494-1-matthew.brost@intel.com>
References: <20230720042115.119494-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/7] drm/xe: Reduce the number list links in
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Combine the userptr, rebind, and destroy links into a union as
the lists these links belong to are mutually exclusive.

v2: Adjust which lists are combined (Thomas H)
v3: Add kernel doc why this is safe (Thomas H), remove related change
of list_del_init -> list_del (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  6 +++--
 drivers/gpu/drm/xe/xe_exec.c     |  2 +-
 drivers/gpu/drm/xe/xe_pt.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       | 43 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_vm_types.h | 37 ++++++++++++++++-----------
 5 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 828a9fea420b..538501c46b8b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -474,8 +474,10 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			}
 
 			xe_vm_assert_held(vm);
-			if (list_empty(&vma->rebind_link) && vma->tile_present)
-				list_add_tail(&vma->rebind_link, &vm->rebind_list);
+			if (list_empty(&vma->combined_links.rebind) &&
+			    vma->tile_present)
+				list_add_tail(&vma->combined_links.rebind,
+					      &vm->rebind_list);
 
 			if (vm_resv_locked)
 				dma_resv_unlock(&vm->resv);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 1f64d64a94fa..fff4a9d9d12a 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -120,7 +120,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 	 * BOs have valid placements possibly moving an evicted BO back
 	 * to a location where the GPU can access it).
 	 */
-	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
+	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
 		XE_WARN_ON(xe_vma_is_null(vma));
 
 		if (xe_vma_is_userptr(vma))
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index bbf37e5c8abb..303313adf3ef 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1690,7 +1690,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	}
 
 	if (!vma->tile_present)
-		list_del_init(&vma->rebind_link);
+		list_del_init(&vma->combined_links.rebind);
 
 	if (unbind_pt_update.locked) {
 		XE_WARN_ON(!xe_vma_is_userptr(vma));
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 19ce6b0c6564..87faf4b723b3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -467,7 +467,8 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 
 		list_del_init(&vma->notifier.rebind_link);
 		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
-			list_move_tail(&vma->rebind_link, &vm->rebind_list);
+			list_move_tail(&vma->combined_links.rebind,
+				       &vm->rebind_list);
 	}
 	spin_unlock(&vm->notifier.list_lock);
 
@@ -608,7 +609,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
+	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
 		if (xe_vma_has_no_bo(vma) ||
 		    vma->gpuva.flags & XE_VMA_DESTROYED)
 			continue;
@@ -780,17 +781,20 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
 				 userptr.invalidate_link) {
 		list_del_init(&vma->userptr.invalidate_link);
-		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
+		if (list_empty(&vma->combined_links.userptr))
+			list_move_tail(&vma->combined_links.userptr,
+				       &vm->userptr.repin_list);
 	}
 	spin_unlock(&vm->userptr.invalidated_lock);
 
 	/* Pin and move to temporary list */
-	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list, userptr_link) {
+	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
+				 combined_links.userptr) {
 		err = xe_vma_userptr_pin_pages(vma);
 		if (err < 0)
 			goto out_err;
 
-		list_move_tail(&vma->userptr_link, &tmp_evict);
+		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
 	}
 
 	/* Take lock and move to rebind_list for rebinding. */
@@ -798,10 +802,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	if (err)
 		goto out_err;
 
-	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
-		list_del_init(&vma->userptr_link);
-		list_move_tail(&vma->rebind_link, &vm->rebind_list);
-	}
+	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
+		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
 
 	dma_resv_unlock(&vm->resv);
 
@@ -845,10 +847,11 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		return NULL;
 
 	xe_vm_assert_held(vm);
-	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
+	list_for_each_entry_safe(vma, next, &vm->rebind_list,
+				 combined_links.rebind) {
 		XE_WARN_ON(!vma->tile_present);
 
-		list_del_init(&vma->rebind_link);
+		list_del_init(&vma->combined_links.rebind);
 		dma_fence_put(fence);
 		if (rebind_worker)
 			trace_xe_vma_rebind_worker(vma);
@@ -883,9 +886,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		return vma;
 	}
 
-	INIT_LIST_HEAD(&vma->rebind_link);
-	INIT_LIST_HEAD(&vma->unbind_link);
-	INIT_LIST_HEAD(&vma->userptr_link);
+	INIT_LIST_HEAD(&vma->combined_links.rebind);
 	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
 	INIT_LIST_HEAD(&vma->notifier.rebind_link);
 	INIT_LIST_HEAD(&vma->extobj.link);
@@ -1058,7 +1059,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	struct xe_vm *vm = xe_vma_vm(vma);
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_BUG_ON(!list_empty(&vma->unbind_link));
+	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));
 
 	if (xe_vma_is_userptr(vma)) {
 		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
@@ -1066,7 +1067,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_del_init(&vma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
-		list_del(&vma->userptr_link);
 	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 
@@ -1087,9 +1087,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	}
 
 	xe_vm_assert_held(vm);
-	if (!list_empty(&vma->rebind_link))
-		list_del(&vma->rebind_link);
-
 	if (fence) {
 		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
 						 vma_destroy_cb);
@@ -1438,11 +1435,12 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 		/* easy case, remove from VMA? */
 		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
+			list_del_init(&vma->combined_links.rebind);
 			xe_vma_destroy(vma, NULL);
 			continue;
 		}
 
-		list_add_tail(&vma->unbind_link, &contested);
+		list_move_tail(&vma->combined_links.destroy, &contested);
 	}
 
 	/*
@@ -1470,8 +1468,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	 * Since we hold a refcount to the bo, we can remove and free
 	 * the members safely without locking.
 	 */
-	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
-		list_del_init(&vma->unbind_link);
+	list_for_each_entry_safe(vma, next_vma, &contested,
+				 combined_links.destroy) {
+		list_del_init(&vma->combined_links.destroy);
 		xe_vma_destroy_unlocked(vma);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 29ec04fa1e26..f1f3b619d996 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -49,21 +49,28 @@ struct xe_vma {
 	 */
 	u64 tile_present;
 
-	/** @userptr_link: link into VM repin list if userptr */
-	struct list_head userptr_link;
-
-	/**
-	 * @rebind_link: link into VM if this VMA needs rebinding, and
-	 * if it's a bo (not userptr) needs validation after a possible
-	 * eviction. Protected by the vm's resv lock.
-	 */
-	struct list_head rebind_link;
-
-	/**
-	 * @unbind_link: link or list head if an unbind of multiple VMAs, in
-	 * single unbind op, is being done.
-	 */
-	struct list_head unbind_link;
+	/** @combined_links: links into lists which are mutually exclusive */
+	union {
+		/**
+		 * @userptr: link into VM repin list if userptr. Protected by
+		 * vm->lock in write mode.
+		 */
+		struct list_head userptr;
+		/**
+		 * @rebind: link into VM if this VMA needs rebinding, and
+		 * if it's a bo (not userptr) needs validation after a possible
+		 * eviction. Protected by the vm's resv lock and typically
+		 * vm->lock is also held in write mode. The only place where
+		 * vm->lock isn't held is the BO eviction path which has
+		 * mutually exclusive execution with userptr.
+		 */
+		struct list_head rebind;
+		/**
+		 * @destroy: link to contested list when VM is being closed.
+		 * Protected by vm->lock in write mode and vm's resv lock.
+		 */
+		struct list_head destroy;
+	} combined_links;
 
 	/** @destroy_cb: callback to destroy VMA when unbind job is done */
 	struct dma_fence_cb destroy_cb;
-- 
2.34.1

