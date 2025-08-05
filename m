Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54156C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDC510E6EF;
	Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZPBhfmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8E910E5C8
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437325; x=1785973325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+xAldBkWQOjQMaosQBHqqROehlyVFW9LWPYJ+iU8fCw=;
 b=LZPBhfmZr5QqVeab+Kk4LmDL2tRpawtqwjhhLscBjO53KMcqZWbwMv4Z
 7O+tJzb6ogZlwN0cvIWFaPPd8qfMr+a8SsDSuWt/+b1Qxb8EbscmV/5PZ
 NBaG24xkzm5X8q/QcxLkz83X72VUxyrv4CXAEAVLAqsQLVbPsOIWmov+Y
 Y+SQCRWOcIY/61AK2o+ORVs2LAICiXlwvTh0g0/vucj54KxTzEpihgtQP
 9SXSu25koTKZ5iuAwFiC5GBrG1rJcpo5hBW5hN3qIVVneu8aKphO6mU14
 wNhGE/5+pW7Y/fWG0vPc2G9zR4N1DIC5Wyebw91mDkAbJQQfRrzdVubBb Q==;
X-CSE-ConnectionGUID: OAYTHYq0TMuIw+rD4TRRIw==
X-CSE-MsgGUID: 2MhMiIBNQr+HYYSOZ0G03Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119062"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119062"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
X-CSE-ConnectionGUID: oB6rfLQ1Tj+MNT1wnOniRQ==
X-CSE-MsgGUID: tx9XzqwrRJaXkBKFamTPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641625"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 06/15] drm/xe: Do not create a VM bind queue per tile
Date: Tue,  5 Aug 2025 16:41:51 -0700
Message-Id: <20250805234200.1035609-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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

Now that we have a CPU binds, no need to create VM bind queue per tile.
Remove all the logic associated with this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 43 ++++--------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 15 ++-------
 drivers/gpu/drm/xe/xe_vm.c               | 32 ++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h         |  2 +-
 4 files changed, 25 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6c176183ed58..fccd87770588 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -119,7 +119,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
-	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
 
@@ -319,17 +318,11 @@ ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
-	struct xe_exec_queue *eq, *next;
 
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 
 	xe_exec_queue_last_fence_put_unlocked(q);
-	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
-		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
-					 multi_gt_link)
-			xe_exec_queue_put(eq);
-	}
 
 	q->ops->fini(q);
 }
@@ -637,7 +630,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
 	struct xe_vm *vm;
-	struct xe_tile *tile;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
 	u32 flags = 0;
@@ -670,26 +662,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
 			return -EINVAL;
 
-		for_each_tile(tile, xe, id) {
-			struct xe_exec_queue *new;
-
-			flags |= EXEC_QUEUE_FLAG_VM;
-			if (id)
-				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
-
-			new = xe_exec_queue_create_bind(xe, tile, flags,
-							args->extensions);
-			if (IS_ERR(new)) {
-				err = PTR_ERR(new);
-				if (q)
-					goto put_exec_queue;
-				return err;
-			}
-			if (id == 0)
-				q = new;
-			else
-				list_add_tail(&new->multi_gt_list,
-					      &q->multi_gt_link);
+		flags |= EXEC_QUEUE_FLAG_VM;
+
+		q = xe_exec_queue_create_bind(xe, xe_device_get_root_tile(xe),
+					      flags, args->extensions);
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			return err;
 		}
 	} else {
 		logical_mask = calc_validate_logical_mask(xe, eci,
@@ -903,14 +882,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
  */
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *eq = q, *next;
-
-	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
-				 multi_gt_link) {
-		q->ops->kill(eq);
-		xe_vm_remove_compute_exec_queue(q->vm, eq);
-	}
-
 	q->ops->kill(q);
 	xe_vm_remove_compute_exec_queue(q->vm, q);
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ba443a497b38..561d3a3517e9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -81,14 +81,12 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
 #define EXEC_QUEUE_FLAG_VM			BIT(2)
-/* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(3)
 /* flag to indicate low latency hint to guc */
-#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(4)
 /* for migration (kernel copy, clear, bind) jobs */
-#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
+#define EXEC_QUEUE_FLAG_MIGRATE			BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
@@ -96,13 +94,6 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
-	union {
-		/** @multi_gt_list: list head for VM bind engines if multi-GT */
-		struct list_head multi_gt_list;
-		/** @multi_gt_link: link for VM bind engines if multi-GT */
-		struct list_head multi_gt_link;
-	};
-
 	union {
 		/** @execlist: execlist backend specific state for exec queue */
 		struct xe_execlist_exec_queue *execlist;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index eb2810bb7414..6601c0650298 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1794,13 +1794,16 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			if (!vm->pt_root[id])
 				continue;
 
+			number_tiles++;
+			if (vm->q)
+				continue;
+
 			q = xe_exec_queue_create_bind(xe, tile, create_flags, 0);
 			if (IS_ERR(q)) {
 				err = PTR_ERR(q);
 				goto err_close;
 			}
-			vm->q[id] = q;
-			number_tiles++;
+			vm->q = q;
 		}
 	}
 
@@ -1892,19 +1895,14 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_close(vm);
 
-	down_write(&vm->lock);
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id])
-			xe_exec_queue_last_fence_put(vm->q[id], vm);
-	}
-	up_write(&vm->lock);
+	if (vm->q) {
+		down_write(&vm->lock);
+		xe_exec_queue_last_fence_put(vm->q, vm);
+		up_write(&vm->lock);
 
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id]) {
-			xe_exec_queue_kill(vm->q[id]);
-			xe_exec_queue_put(vm->q[id]);
-			vm->q[id] = NULL;
-		}
+		xe_exec_queue_kill(vm->q);
+		xe_exec_queue_put(vm->q);
+		vm->q = NULL;
 	}
 
 	down_write(&vm->lock);
@@ -2044,7 +2042,7 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 static struct xe_exec_queue *
 to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	return q ? q : vm->q[0];
+	return q ? q : vm->q;
 }
 
 static struct xe_user_fence *
@@ -3110,10 +3108,8 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 
 		if (q) {
 			vops->pt_update_ops[id].q = q;
-			if (vm->pt_root[id] && !list_empty(&q->multi_gt_list))
-				q = list_next_entry(q, multi_gt_list);
 		} else {
-			vops->pt_update_ops[id].q = vm->q[id];
+			vops->pt_update_ops[id].q = vm->q;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bed6088e1bb3..832ab344ebb0 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -180,7 +180,7 @@ struct xe_vm {
 	struct xe_device *xe;
 
 	/* exec queue used for (un)binding vma's */
-	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
+	struct xe_exec_queue *q;
 
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
-- 
2.34.1

