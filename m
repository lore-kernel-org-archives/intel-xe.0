Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F33CD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 10:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51E811A750;
	Fri,  5 Jun 2026 10:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPyeTIhV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209A11A750
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780656732; x=1812192732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DOvgYDcg0ypy/uYrErhJ6neCrpOvOTFcO/5JNnwN6AE=;
 b=EPyeTIhVFSJKWJ7hgydBwNeKfcG8vUwB/3v2fhv/ExToKLTdQqfOiCVG
 U2s5kDDCPtA1T98becQjtpQVpWFrFCVybhLjmsmiLlaceC96ceol2VOfw
 tloBbV98nFjaUvoAcydkAZO3Jxj7BtpZ2ixqnn52g8kUl7T+1V3rLVW4/
 sTqjvXqTqc7NLcxUMRDXTaTjAFReW5bj9h2Rc+4o7udxndWn47jaMXAuH
 G8plBz3EuW1aao4S/uuc9bFRcm+p45v40LpLx1n7mloKswWccZnxtxm6G
 hpK6BwkJAjwpsyc/XfJPcaPcO7dijtEnKUbJy9RiPKp6GBcuA2vEPfaZz Q==;
X-CSE-ConnectionGUID: Q9gkV1qiTHCI1EriIw7+Ng==
X-CSE-MsgGUID: aegAC3fpToKls4bnNDGR7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="99062902"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="99062902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 03:52:11 -0700
X-CSE-ConnectionGUID: vRjJisnERW+w2EnAtxuQlw==
X-CSE-MsgGUID: rDEPxNlOQxKTIDmV1ThMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249149719"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 03:52:09 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Fix use-after-free race in xe_pt_zap_ptes and
 xe_pt_zap_ptes_range
Date: Fri,  5 Jun 2026 12:52:02 +0200
Message-ID: <20260605105202.1664464-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_pt_zap_ptes() and xe_pt_zap_ptes_range() walk the page-table tree
holding only the BO reservation or SVM notifier_lock respectively.
Concurrently, xe_pt_update_ops_run() (vm->lock write) calls xe_pt_commit()
which swaps children[] pointers and immediately frees the replaced xe_pt
via xe_pt_destroy().  xe_vm_pt_destroy() has the same exposure during VM
teardown.  Either path can produce a use-after-free when a concurrent walk
dereferences a just-freed node. Fix by introducing a per-VM rw_semaphore
pt_lock.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 47 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.c       |  3 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  5 ++++
 3 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 15ce77ce7793..2dada51469c9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -919,10 +919,10 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
  * Eviction and Userptr invalidation needs to be able to zap the
  * gpu ptes of a given address range in pagefaulting mode.
  * In order to be able to do that, that function needs access to the shared
- * page-table entrieaso it can either clear the leaf PTEs or
- * clear the pointers to lower-level page-tables. The caller is required
- * to hold the necessary locks to ensure neither the page-table connectivity
- * nor the page-table entries of the range is updated from under us.
+ * page-table entries so it can either clear the leaf PTEs or
+ * clear the pointers to lower-level page-tables. The function acquires
+ * vm->pt_lock (read) to protect against concurrent page-table tree
+ * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
  *
  * Return: Whether ptes were actually updated and a TLB invalidation is
  * required.
@@ -937,19 +937,24 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 		},
 		.tile = tile,
 	};
-	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_pt *pt;
 	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
 
 	if (xe_vma_bo(vma))
 		xe_bo_assert_held(xe_vma_bo(vma));
 	else if (xe_vma_is_userptr(vma))
-		lockdep_assert_held(&xe_vma_vm(vma)->svm.gpusvm.notifier_lock);
+		lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
-				xe_vma_end(vma), &xe_walk.base);
+	down_read(&vm->pt_lock);
+	pt = vm->pt_root[tile->id];
+	if (pt)
+		(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
+					xe_vma_end(vma), &xe_walk.base);
+	up_read(&vm->pt_lock);
 
 	return xe_walk.needs_invalidate;
 }
@@ -963,8 +968,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
  * SVM invalidation needs to be able to zap the gpu ptes of a given address
  * range. In order to be able to do that, that function needs access to the
  * shared page-table entries so it can either clear the leaf PTEs or
- * clear the pointers to lower-level page-tables. The caller is required
- * to hold the SVM notifier lock.
+ * clear the pointers to lower-level page-tables. The function acquires
+ * vm->pt_lock (read) to protect against concurrent page-table tree
+ * modifications by xe_pt_update_ops_run() and xe_vm_pt_destroy().
  *
  * Return: Whether ptes were actually updated and a TLB invalidation is
  * required.
@@ -980,14 +986,16 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 		},
 		.tile = tile,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt;
 	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
 
 	/*
 	 * Locking rules:
 	 *
-	 * - notifier_lock (write): full protection against page table changes
-	 *   and MMU notifier invalidations.
+	 * - notifier_lock (write): excludes concurrent MMU notifier
+	 *   invalidations, but does NOT exclude xe_pt_update_ops_run() which
+	 *   holds vm->lock (write).  pt_lock (read) is therefore required to
+	 *   serialise against concurrent xe_pt_commit() / xe_pt_destroy() calls.
 	 *
 	 * - notifier_lock (read) + vm_lock (write): combined protection against
 	 *   invalidations and concurrent page table modifications. (e.g., madvise)
@@ -1000,8 +1008,13 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
-				xe_svm_range_end(range), &xe_walk.base);
+	down_read(&vm->pt_lock);
+	pt = vm->pt_root[tile->id];
+	if (pt)
+		(void)xe_pt_walk_shared(&pt->base, pt->level,
+					xe_svm_range_start(range),
+					xe_svm_range_end(range), &xe_walk.base);
+	up_read(&vm->pt_lock);
 
 	return xe_walk.needs_invalidate;
 }
@@ -1079,6 +1092,8 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 
 	if (xe_vma_is_userptr(vma))
 		xe_svm_assert_held_read(vm);
+
+	lockdep_assert_held_write(&vm->pt_lock);
 }
 
 static void xe_pt_commit(struct xe_vma *vma,
@@ -2638,6 +2653,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	}
 
 	/* Point of no return - VM killed if failure after this */
+	down_write(&vm->pt_lock);
 	for (i = 0; i < pt_update_ops->current_op; ++i) {
 		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
 
@@ -2645,6 +2661,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			     pt_op->num_entries, &pt_update_ops->deferred);
 		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
 	}
+	up_write(&vm->pt_lock);
 
 	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
 				  &xe_range_fence_kfree_ops,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..b711c12bf751 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1580,12 +1580,14 @@ static void xe_vm_pt_destroy(struct xe_vm *vm)
 
 	xe_vm_assert_held(vm);
 
+	down_write(&vm->pt_lock);
 	for_each_tile(tile, vm->xe, id) {
 		if (vm->pt_root[id]) {
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 			vm->pt_root[id] = NULL;
 		}
 	}
+	up_write(&vm->pt_lock);
 }
 
 static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
@@ -1644,6 +1646,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	} else {
 		init_rwsem(&vm->lock);
 	}
+	init_rwsem(&vm->pt_lock);
 	mutex_init(&vm->snap_mutex);
 
 	INIT_LIST_HEAD(&vm->rebind_list);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..3bc45991f607 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -271,6 +271,11 @@ struct xe_vm {
 	 * VM
 	 */
 	struct rw_semaphore lock;
+	/**
+	 * @pt_lock: Protects page-table tree structural modifications from
+	 * concurrent reads during page-table walks (e.g., xe_pt_zap_ptes).
+	 */
+	struct rw_semaphore pt_lock;
 	/**
 	 * @snap_mutex: Mutex used to guard insertions and removals from gpuva,
 	 * so we can take a snapshot safely from devcoredump.
-- 
2.43.0

