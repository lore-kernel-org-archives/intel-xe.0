Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CBFC25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4C510E2D9;
	Wed, 29 May 2024 18:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIyj7TQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAE310E7CB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717007480; x=1748543480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BO1EENopm+Bp+csbg5RsGW9ZZMBpnf2VR1ZNSOi9nFM=;
 b=TIyj7TQGjZSitUDxAYJXW9EuEYaaS0k/4B0p4RRQqejOFulAOi2DEOiK
 ExFlh+pVEkftmRN/6Uon7xC3K2S8t5dwUEvjRbENWoEjCdPoRFoWq9MA0
 FTMwImtLrWiB0VEOStfjorCVZigF6MeWB9AKLyzTNEwopLX95hLMQb+7Q
 DlZXW5/3u3G8H0FYiu11WAedDQdQhxuw0L3U4BsOdjaA/XQTL34IVCtEh
 wrq7Ekq8PTcF5jsuFISMQgZxTDeLX+TrX7lSV0X0Bj4NEd+6U+jo0yqnM
 aa37Ede6KhsU/rEw/RX0U73I10BGAB3pf4rHSwg//QB9vf9YlAiv9akFh w==;
X-CSE-ConnectionGUID: MK+dj/+2RGS/t1LpBkZgkg==
X-CSE-MsgGUID: g1OLv+i8TBiCcygwYfmPeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13280741"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13280741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:31:19 -0700
X-CSE-ConnectionGUID: f0EKwJnQRr2J3hxLQQSsng==
X-CSE-MsgGUID: bYWpUkypQzK4G8RiVdTHHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40388051"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:31:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 5/5] drm/xe: Update PT layer with better error handling
Date: Wed, 29 May 2024 11:31:48 -0700
Message-Id: <20240529183148.1713695-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529183148.1713695-1-matthew.brost@intel.com>
References: <20240529183148.1713695-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c | 208 ++++++++++++++++++++++++++++---------
 1 file changed, 160 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4353a3bdf6c8..e4dd385ee954 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -845,19 +845,27 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
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
 
@@ -873,10 +881,61 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
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
 
@@ -896,12 +955,13 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
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
@@ -925,8 +985,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
-	else /* abort! */
-		xe_pt_abort_bind(vma, entries, *num_entries);
 
 	return err;
 }
@@ -1447,7 +1505,7 @@ xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				     &end_offset))
 		return 0;
 
-	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, false);
+	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, true);
 	xe_walk->wupd.updates[level].update->qwords = end_offset - offset;
 
 	return 0;
@@ -1515,32 +1573,57 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
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
@@ -1586,7 +1669,6 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
-	struct llist_head *deferred = &pt_update_ops->deferred;
 	int err;
 
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1633,11 +1715,12 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			(!pt_op->rebind && vm->scratch_pt[tile->id] &&
 			 xe_vm_in_preempt_fence_mode(vm));
 
-		/* FIXME: Don't commit right away */
 		vma->tile_staged |= BIT(tile->id);
 		pt_op->vma = vma;
-		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
-				  pt_op->rebind, deferred);
+		xe_pt_commit_prepare_bind(vma, pt_op->entries,
+					  pt_op->num_entries, pt_op->rebind);
+	} else {
+		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
 	}
 
 	return err;
@@ -1649,7 +1732,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
-	struct llist_head *deferred = &pt_update_ops->deferred;
 	int err;
 
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
@@ -1685,9 +1767,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
-	/* FIXME: Don't commit right away */
-	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
-			    deferred);
+	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
 
 	return 0;
 }
@@ -1908,7 +1988,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
-	int err = 0;
+	int err = 0, i;
 	struct xe_migrate_pt_update update = {
 		.ops = pt_update_ops->needs_userptr_lock ?
 			&userptr_migrate_ops :
@@ -1928,8 +2008,10 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
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
@@ -1944,6 +2026,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		goto free_rfence;
 	}
 
+	/* Point of no return - VM killed if failure after this */
+	for (i = 0; i < pt_update_ops->current_op; ++i) {
+		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+
+		xe_pt_commit(pt_op->vma, pt_op->entries,
+			     pt_op->num_entries, &pt_update_ops->deferred);
+		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
+	}
+
 	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
 				    &xe_range_fence_kfree_ops,
 				    pt_update_ops->start,
@@ -1979,10 +2070,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
 	dma_fence_put(fence);
+	if (!tile->id)
+		xe_vm_kill(vops->vm, false);
 free_rfence:
 	kfree(rfence);
 free_ifence:
 	kfree(ifence);
+kill_vm_tile1:
+	if (err != -EAGAIN && tile->id)
+		xe_vm_kill(vops->vm, false);
 
 	return ERR_PTR(err);
 }
@@ -2003,12 +2099,10 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
-	/* FIXME: Not 100% correct */
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
+	for (i = 0; i < pt_update_ops->current_op; ++i) {
 		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
 
-		if (pt_op->bind)
-			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
+		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
 	}
 	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
 }
@@ -2022,10 +2116,28 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
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
- }
+}
-- 
2.34.1

