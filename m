Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B635FC5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77345112050;
	Fri,  8 Mar 2024 05:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkX6/h+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273B411259C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874474; x=1741410474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rvzhOQ6mQiK0Vc19eLOqHN0rJmJDN4nJg6gvwEwRdc=;
 b=OkX6/h+7AT7z6OPnKBw8GB04g8IU+PfgioeayA0++krvLHKMTydbAuNs
 v9R52+sI8poI+e4mCxt55PmQugTcTgq7KIJJogv1ExLVkS1T/R0idDN4/
 YvcyuXtzHHUXj2/hRSYQIBn55KZHQZoTwHPHDzezaRQpsZrrs8u4/Fgx3
 YMly+C50nAWW+0cqbUBK/e0xu8jGg9DuHn5/ACPHRLpkUhbEjxiOCxZI2
 w4Vzpy4hKR9OqHxgZz5xgLtfDA7XWEhOcI58ivb+buvG8yrfZrEklXGW1
 4esckrPkFNhZXgOXxeJS+opaMy1yIQTbpNdy3nno6HIUNl0S4dTUerpsb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761975"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403028"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 20/30] drm/xe: Update PT layer with better error handling
Date: Thu,  7 Mar 2024 21:07:56 -0800
Message-Id: <20240308050806.577176-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

Update PT layer so if a memory allocation for a PTE fails the error can
be propagated to the user without requiring to be killed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 211 ++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_pt_types.h |   2 +
 2 files changed, 165 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5a8523d0a049..6691efd13911 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -812,19 +812,27 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
 	}
 }
 
-static void xe_pt_abort_bind(struct xe_vma *vma,
-			     struct xe_vm_pgtable_update *entries,
-			     u32 num_entries)
+static void xe_pt_cancel_bind(struct xe_vma *vma,
+			      struct xe_vm_pgtable_update *entries,
+			      u32 num_entries)
 {
 	u32 i, j;
 
 	for (i = 0; i < num_entries; i++) {
-		if (!entries[i].pt_entries)
+		struct xe_pt *pt = entries[i].pt;
+
+		if (!pt)
 			continue;
 
-		for (j = 0; j < entries[i].qwords; j++)
-			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
+		if (pt->level) {
+			for (j = 0; j < entries[i].qwords; j++)
+				xe_pt_destroy(entries[i].pt_entries[j].pt,
+					      xe_vma_vm(vma)->flags, NULL);
+		}
+
 		kfree(entries[i].pt_entries);
+		entries[i].pt_entries = NULL;
+		entries[i].qwords = 0;
 	}
 }
 
@@ -840,10 +848,61 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	xe_vm_assert_held(vm);
 }
 
-static void xe_pt_commit_bind(struct xe_vma *vma,
-			      struct xe_vm_pgtable_update *entries,
-			      u32 num_entries, bool rebind,
-			      struct llist_head *deferred)
+static void xe_pt_commit(struct xe_vma *vma,
+			 struct xe_vm_pgtable_update *entries,
+			 u32 num_entries, struct llist_head *deferred)
+{
+	u32 i, j;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (i = 0; i < num_entries; i++) {
+		struct xe_pt *pt = entries[i].pt;
+
+		if (!pt->level)
+			continue;
+
+		for (j = 0; j < entries[i].qwords; j++) {
+			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
+
+			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
+		}
+	}
+}
+
+static void xe_pt_abort_bind(struct xe_vma *vma,
+			     struct xe_vm_pgtable_update *entries,
+			     u32 num_entries, bool rebind)
+{
+	int i, j;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (i = num_entries - 1; i >= 0; --i) {
+		struct xe_pt *pt = entries[i].pt;
+		struct xe_pt_dir *pt_dir;
+
+		if (!rebind)
+			pt->num_live -= entries[i].qwords;
+
+		if (!pt->level)
+			continue;
+
+		pt_dir = as_xe_pt_dir(pt);
+		for (j = 0; j < entries[i].qwords; j++) {
+			u32 j_ = j + entries[i].ofs;
+			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
+			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
+
+			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
+			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
+		}
+	}
+}
+
+static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
+				      struct xe_vm_pgtable_update *entries,
+				      u32 num_entries, bool rebind)
 {
 	u32 i, j;
 
@@ -863,12 +922,13 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 		for (j = 0; j < entries[i].qwords; j++) {
 			u32 j_ = j + entries[i].ofs;
 			struct xe_pt *newpte = entries[i].pt_entries[j].pt;
+			struct xe_pt *oldpte = NULL;
 
 			if (xe_pt_entry(pt_dir, j_))
-				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
-					      xe_vma_vm(vma)->flags, deferred);
+				oldpte = xe_pt_entry(pt_dir, j_);
 
 			pt_dir->children[j_] = &newpte->base;
+			entries[i].pt_entries[j].pt = oldpte;
 		}
 	}
 }
@@ -892,8 +952,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
-	else /* abort! */
-		xe_pt_abort_bind(vma, entries, *num_entries);
 
 	return err;
 }
@@ -1383,7 +1441,7 @@ xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				     &end_offset))
 		return 0;
 
-	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, false);
+	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, true);
 	xe_walk->wupd.updates[level].update->qwords = end_offset - offset;
 
 	return 0;
@@ -1451,32 +1509,57 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
 		memset64(ptr, empty, num_qwords);
 }
 
+static void xe_pt_abort_unbind(struct xe_vma *vma,
+			       struct xe_vm_pgtable_update *entries,
+			       u32 num_entries)
+{
+	int j, i;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (j = num_entries - 1; j >= 0; --j) {
+		struct xe_vm_pgtable_update *entry = &entries[j];
+		struct xe_pt *pt = entry->pt;
+		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
+
+		pt->num_live += entry->qwords;
+
+		if (!pt->level)
+			continue;
+
+		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++)
+			pt_dir->children[i] =
+				entries[j].pt_entries[i - entry->ofs].pt ?
+				&entries[j].pt_entries[i - entry->ofs].pt->base : 0;
+	}
+}
+
 static void
-xe_pt_commit_unbind(struct xe_vma *vma,
-		    struct xe_vm_pgtable_update *entries, u32 num_entries,
-		    struct llist_head *deferred)
+xe_pt_commit_prepare_unbind(struct xe_vma *vma,
+			    struct xe_vm_pgtable_update *entries,
+			    u32 num_entries)
 {
-	u32 j;
+	int j, i;
 
 	xe_pt_commit_locks_assert(vma);
 
 	for (j = 0; j < num_entries; ++j) {
 		struct xe_vm_pgtable_update *entry = &entries[j];
 		struct xe_pt *pt = entry->pt;
+		struct xe_pt_dir *pt_dir;
 
 		pt->num_live -= entry->qwords;
-		if (pt->level) {
-			struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
-			u32 i;
-
-			for (i = entry->ofs; i < entry->ofs + entry->qwords;
-			     i++) {
-				if (xe_pt_entry(pt_dir, i))
-					xe_pt_destroy(xe_pt_entry(pt_dir, i),
-						      xe_vma_vm(vma)->flags, deferred);
+		if (!pt->level)
+			continue;
 
-				pt_dir->children[i] = NULL;
-			}
+		pt_dir = as_xe_pt_dir(pt);
+		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++) {
+			if (xe_pt_entry(pt_dir, i))
+				entries[j].pt_entries[i - entry->ofs].pt =
+					xe_pt_entry(pt_dir, i);
+			else
+				entries[j].pt_entries[i - entry->ofs].pt = NULL;
+			pt_dir->children[i] = NULL;
 		}
 	}
 }
@@ -1513,7 +1596,6 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
-	struct llist_head *deferred = &pt_update_ops->deferred;
 	int err;
 
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1522,6 +1604,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	       "Preparing bind, with range [%llx...%llx)\n",
 	       xe_vma_start(vma), xe_vma_end(vma) - 1);
 
+	pt_op->vma = NULL;
 	pt_op->bind = true;
 	pt_op->rebind = BIT(tile->id) & vma->tile_present;
 
@@ -1555,9 +1638,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			(!pt_op->rebind && vm->scratch_pt[tile->id] &&
 			 xe_vm_in_preempt_fence_mode(vm));
 
-		/* FIXME: Don't commit right away */
-		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
-				  pt_op->rebind, deferred);
+		pt_op->vma = vma;
+		xe_pt_commit_prepare_bind(vma, pt_op->entries,
+					  pt_op->num_entries, pt_op->rebind);
+	} else {
+		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
 	}
 
 	return err;
@@ -1569,7 +1654,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
-	struct llist_head *deferred = &pt_update_ops->deferred;
 
 	xe_bo_assert_held(xe_vma_bo(vma));
 
@@ -1577,6 +1661,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	       "Preparing unbind, with range [%llx...%llx)\n",
 	       xe_vma_start(vma), xe_vma_end(vma) - 1);
 
+	pt_op->vma = vma;
 	pt_op->bind = false;
 	pt_op->rebind = false;
 
@@ -1589,9 +1674,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
-	/* FIXME: Don't commit right away */
-	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
-			    deferred);
+	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
 
 	return 0;
 }
@@ -1806,7 +1889,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
-	int err = 0;
+	int err = 0, i;
 	struct xe_migrate_pt_update update = {
 		.ops = pt_update_ops->needs_userptr_lock ?
 			&userptr_migrate_ops :
@@ -1820,8 +1903,10 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	if (pt_update_ops->needs_invalidation) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-		if (!ifence)
-			return ERR_PTR(-ENOMEM);
+		if (!ifence) {
+			err = -ENOMEM;
+			goto kill_vm_tile1;
+		}
 	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
@@ -1830,10 +1915,19 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		goto free_ifence;
 	}
 
+	/* FIXME: Point of no return - VM killed if failure after this */
+	for (i = 0; i < pt_update_ops->num_ops; ++i) {
+		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+
+		xe_pt_commit(pt_op->vma, pt_op->entries,
+			     pt_op->num_entries, &pt_update_ops->deferred);
+		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
+	}
+
 	fence = xe_migrate_update_pgtables(tile->migrate, &update);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
-		goto free_rfence;
+		goto kill_vm_tile0;
 	}
 
 	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
@@ -1871,10 +1965,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
 	dma_fence_put(fence);
-free_rfence:
+kill_vm_tile0:
+	if (!tile->id)
+		xe_vm_kill(vops->vm, false);
 	kfree(rfence);
 free_ifence:
 	kfree(ifence);
+kill_vm_tile1:
+	if (tile->id)
+		xe_vm_kill(vops->vm, false);
 
 	return ERR_PTR(err);
 }
@@ -1895,12 +1994,10 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
-	/* FIXME: Not 100% correct */
 	for (i = 0; i < pt_update_ops->num_ops; ++i) {
 		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
 
-		if (pt_op->bind)
-			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
+		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
 	}
 	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
 }
@@ -1914,10 +2011,28 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
  */
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	int i;
+
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
-	/* FIXME: Just kill VM for now + cleanup PTs */
+	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			&pt_update_ops->ops[i];
+
+		if (!pt_op->vma || i >= pt_update_ops->current_op)
+			continue;
+
+		if (pt_op->bind)
+			xe_pt_abort_bind(pt_op->vma, pt_op->entries,
+					 pt_op->num_entries,
+					 pt_op->rebind);
+		else
+			xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
+					   pt_op->num_entries);
+	}
+
 	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
-	xe_vm_kill(vops->vm, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 16252f1be055..384cc04de719 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -78,6 +78,8 @@ struct xe_vm_pgtable_update {
 struct xe_vm_pgtable_update_op {
 	/** @entries: entries to update for this operation */
 	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
+	/** @vma: VMA for operation, operation not valid if NULL */
+	struct xe_vma *vma;
 	/** @num_entries: number of entries for this update operation */
 	u32 num_entries;
 	/** @bind: is a bind */
-- 
2.34.1

