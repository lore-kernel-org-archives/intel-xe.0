Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F2EC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 21:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7723B10E2C1;
	Wed, 26 Jun 2024 21:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0/TYAmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACD410E9B7
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719436514; x=1750972514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IBrx8YitCgu2StqITTCZKPHZNKc5IcE0PybG/W3eIYo=;
 b=U0/TYAmbGfvRP9xgL7mOmGEsMv5EdqB38RI6YdsTjzZuinel66OdPsWh
 D8c9Kgy2AKDMp48JucJEY1DCkPkDd8I0GokQUFZTKfUizI+BBy0hXpGHA
 Xbuw4dsifclUm1KwklIJqwXw4F2DDYAJ1Df6y3A+BZ63odpCIx4/RZdDq
 P5b1/OYI2Y3WCj4+cRsdLMNPtDashsQT2hOcTMNZsXxsCDPBrapOaZhbi
 W73awpqwCljY2EaQRlbpBecspCwvbxH3NVXwS/9+MIJnK+AWTEr7P99t3
 uCPkP03MebcoNymfrf/9pDzWNoItEoAeEvSZBJpFuH2P54MYDyXN3BqOp A==;
X-CSE-ConnectionGUID: Oyauk1PiRq+8MywBLJ0dBA==
X-CSE-MsgGUID: onWv9CIjR4aLUX91I5XPXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16278570"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="16278570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:15:10 -0700
X-CSE-ConnectionGUID: aedl1VYZSD2ourI9c2ffzg==
X-CSE-MsgGUID: 1+2eryRnShCQZ/3dOlrzMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="49056219"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 14:15:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v6 6/7] drm/xe: Update PT layer with better error handling
Date: Wed, 26 Jun 2024 14:15:45 -0700
Message-Id: <20240626211546.4099339-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626211546.4099339-1-matthew.brost@intel.com>
References: <20240626211546.4099339-1-matthew.brost@intel.com>
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
be propagated to the user without requiring the VM to be killed.

v5:
 - change return value invalidation_fence_init to void (Matthew Auld)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 227 +++++++++++++++++++++++++++----------
 1 file changed, 164 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f46f46d46819..c043752c0308 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -846,19 +846,27 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
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
 
@@ -874,10 +882,61 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
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
 
@@ -897,12 +956,13 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
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
@@ -926,8 +986,6 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
-	else /* abort! */
-		xe_pt_abort_bind(vma, entries, *num_entries);
 
 	return err;
 }
@@ -1305,10 +1363,10 @@ static void invalidation_fence_work_func(struct work_struct *w)
 				     ifence->end, ifence->asid);
 }
 
-static int invalidation_fence_init(struct xe_gt *gt,
-				   struct invalidation_fence *ifence,
-				   struct dma_fence *fence,
-				   u64 start, u64 end, u32 asid)
+static void invalidation_fence_init(struct xe_gt *gt,
+				    struct invalidation_fence *ifence,
+				    struct dma_fence *fence,
+				    u64 start, u64 end, u32 asid)
 {
 	int ret;
 
@@ -1340,8 +1398,6 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	}
 
 	xe_gt_assert(gt, !ret || ret == -ENOENT);
-
-	return ret && ret != -ENOENT ? ret : 0;
 }
 
 struct xe_pt_stage_unbind_walk {
@@ -1441,7 +1497,7 @@ xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				     &end_offset))
 		return 0;
 
-	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, false);
+	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, true);
 	xe_walk->wupd.updates[level].update->qwords = end_offset - offset;
 
 	return 0;
@@ -1509,32 +1565,57 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
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
@@ -1580,7 +1661,6 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
-	struct llist_head *deferred = &pt_update_ops->deferred;
 	int err;
 
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1628,11 +1708,12 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			/* We bump also if batch_invalidate_tlb is true */
 			vm->tlb_flush_seqno++;
 
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
@@ -1644,7 +1725,6 @@ static int unbind_op_prepare(struct xe_tile *tile,
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
-	struct llist_head *deferred = &pt_update_ops->deferred;
 	int err;
 
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
@@ -1680,9 +1760,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
-	/* FIXME: Don't commit right away */
-	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
-			    deferred);
+	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
 
 	return 0;
 }
@@ -1903,7 +1981,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
-	int err = 0;
+	int err = 0, i;
 	struct xe_migrate_pt_update update = {
 		.ops = pt_update_ops->needs_userptr_lock ?
 			&userptr_migrate_ops :
@@ -1923,8 +2001,10 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
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
@@ -1939,6 +2019,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
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
 	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
 				  &xe_range_fence_kfree_ops,
 				  pt_update_ops->start,
@@ -1947,12 +2036,9 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	/* tlb invalidation must be done before signaling rebind */
 	if (ifence) {
-		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
-					      pt_update_ops->start,
-					      pt_update_ops->last,
-					      vm->usm.asid);
-		if (err)
-			goto put_fence;
+		invalidation_fence_init(tile->primary_gt, ifence, fence,
+					pt_update_ops->start,
+					pt_update_ops->last, vm->usm.asid);
 		fence = &ifence->base.base;
 	}
 
@@ -1969,14 +2055,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	return fence;
 
-put_fence:
-	if (pt_update_ops->needs_userptr_lock)
-		up_read(&vm->userptr.notifier_lock);
-	dma_fence_put(fence);
 free_rfence:
 	kfree(rfence);
 free_ifence:
 	kfree(ifence);
+kill_vm_tile1:
+	if (err != -EAGAIN && tile->id)
+		xe_vm_kill(vops->vm, false);
 
 	return ERR_PTR(err);
 }
@@ -1997,12 +2082,10 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
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
@@ -2016,10 +2099,28 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
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
-- 
2.34.1

