Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E443FC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 16:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CFA10E4C1;
	Mon, 24 Feb 2025 16:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/Lo/iJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342AA10E478
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740416123; x=1771952123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ihMkZ2sk12U+tVPdWloA8MSjsSiMcKzyTv9pqJstu6c=;
 b=M/Lo/iJpDeByz6rqNnDePwrZjogEJOzHUMZRQCzze7UhDdg/fNNmxZ1y
 PyS/wGnEAPX8m9FemLWrqUoq+dyt4BMeGiKlfJ1yT1Z9gsIx0TyT5we1E
 7OArS4VdglEk/Q5vwr0G6b3Cae+RwB8x/D4ph8jVsRZp8roHz1wfyotHB
 BCTHgHEYBUhr/eg+oTt/6eDCbrXk6wYLo2So9J1K/QmbzLGi45IpRRPuG
 d1cb171SheVTAgAwrMXAZq50AzyvTl+84NXDZ1EDF59VUiRWt+o8prwYk
 1fsGT4cChJlHvokNCzBCSoNzryVOC6Y7wmvQ8aiINPVOQ0/SCWUYxA5zx Q==;
X-CSE-ConnectionGUID: iKnDTiQKTj+RsJyDjZ4U1w==
X-CSE-MsgGUID: eTEdnR8jTXCkDpZh1+j+WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44838076"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="44838076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:55:23 -0800
X-CSE-ConnectionGUID: AL+QG46QQbeHlUoWeHAM3g==
X-CSE-MsgGUID: cQEoHS8NQ162o3LTD5vgbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="120730804"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:55:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v3 2/2] drm/xe: Add staging tree for VM binds
Date: Mon, 24 Feb 2025 08:56:23 -0800
Message-Id: <20250224165623.3077583-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224165623.3077583-1-matthew.brost@intel.com>
References: <20250224165623.3077583-1-matthew.brost@intel.com>
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

Concurrent VM bind staging and zapping of PTEs from a userptr notifier
do not work because the view of PTEs is not stable. VM binds cannot
acquire the notifier lock during staging, as memory allocations are
required. To resolve this race condition, use a staging tree for VM
binds that is committed only under the userptr notifier lock during the
final step of the bind. This ensures a consistent view of the PTEs in
the userptr notifier.

A follow up may only use staging for VM in fault mode as this is the
only mode in which the above race exists.

v3:
 - Drop zap PTE change (Thomas)
 - s/xe_pt_entry/xe_pt_entry_staging (Thomas)

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org>
Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error handling")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c      | 58 +++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pt_walk.c |  3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h |  4 +++
 3 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f42c1e06b342..c6fcf5ec1223 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -28,6 +28,8 @@ struct xe_pt_dir {
 	struct xe_pt pt;
 	/** @children: Array of page-table child nodes */
 	struct xe_ptw *children[XE_PDES];
+	/** @staging: Array of page-table staging nodes */
+	struct xe_ptw *staging[XE_PDES];
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
@@ -48,9 +50,10 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt *pt)
 	return container_of(pt, struct xe_pt_dir, pt);
 }
 
-static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
+static struct xe_pt *
+xe_pt_entry_staging(struct xe_pt_dir *pt_dir, unsigned int index)
 {
-	return container_of(pt_dir->children[index], struct xe_pt, base);
+	return container_of(pt_dir->staging[index], struct xe_pt, base);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -125,6 +128,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	}
 	pt->bo = bo;
 	pt->base.children = level ? as_xe_pt_dir(pt)->children : NULL;
+	pt->base.staging = level ? as_xe_pt_dir(pt)->staging : NULL;
 
 	if (vm->xef)
 		xe_drm_client_add_bo(vm->xef->client, pt->bo);
@@ -206,8 +210,8 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
 
 		for (i = 0; i < XE_PDES; i++) {
-			if (xe_pt_entry(pt_dir, i))
-				xe_pt_destroy(xe_pt_entry(pt_dir, i), flags,
+			if (xe_pt_entry_staging(pt_dir, i))
+				xe_pt_destroy(xe_pt_entry_staging(pt_dir, i), flags,
 					      deferred);
 		}
 	}
@@ -376,8 +380,10 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		/* Continue building a non-connected subtree. */
 		struct iosys_map *map = &parent->bo->vmap;
 
-		if (unlikely(xe_child))
+		if (unlikely(xe_child)) {
 			parent->base.children[offset] = &xe_child->base;
+			parent->base.staging[offset] = &xe_child->base;
+		}
 
 		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
 		parent->num_live++;
@@ -614,6 +620,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			.ops = &xe_pt_stage_bind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
+			.staging = true,
 		},
 		.vm = xe_vma_vm(vma),
 		.tile = tile,
@@ -873,7 +880,7 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
 	}
 }
 
-static void xe_pt_commit_locks_assert(struct xe_vma *vma)
+static void xe_pt_commit_prepare_locks_assert(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 
@@ -885,6 +892,16 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	xe_vm_assert_held(vm);
 }
 
+static void xe_pt_commit_locks_assert(struct xe_vma *vma)
+{
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	xe_pt_commit_prepare_locks_assert(vma);
+
+	if (xe_vma_is_userptr(vma))
+		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+}
+
 static void xe_pt_commit(struct xe_vma *vma,
 			 struct xe_vm_pgtable_update *entries,
 			 u32 num_entries, struct llist_head *deferred)
@@ -895,13 +912,17 @@ static void xe_pt_commit(struct xe_vma *vma,
 
 	for (i = 0; i < num_entries; i++) {
 		struct xe_pt *pt = entries[i].pt;
+		struct xe_pt_dir *pt_dir;
 
 		if (!pt->level)
 			continue;
 
+		pt_dir = as_xe_pt_dir(pt);
 		for (j = 0; j < entries[i].qwords; j++) {
 			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
+			int j_ = j + entries[i].ofs;
 
+			pt_dir->children[j_] = pt_dir->staging[j_];
 			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
 		}
 	}
@@ -913,7 +934,7 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
 {
 	int i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = num_entries - 1; i >= 0; --i) {
 		struct xe_pt *pt = entries[i].pt;
@@ -928,10 +949,10 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
 		pt_dir = as_xe_pt_dir(pt);
 		for (j = 0; j < entries[i].qwords; j++) {
 			u32 j_ = j + entries[i].ofs;
-			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
+			struct xe_pt *newpte = xe_pt_entry_staging(pt_dir, j_);
 			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
 
-			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
+			pt_dir->staging[j_] = oldpte ? &oldpte->base : 0;
 			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
 		}
 	}
@@ -943,7 +964,7 @@ static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
 {
 	u32 i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = 0; i < num_entries; i++) {
 		struct xe_pt *pt = entries[i].pt;
@@ -961,10 +982,10 @@ static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
 			struct xe_pt *newpte = entries[i].pt_entries[j].pt;
 			struct xe_pt *oldpte = NULL;
 
-			if (xe_pt_entry(pt_dir, j_))
-				oldpte = xe_pt_entry(pt_dir, j_);
+			if (xe_pt_entry_staging(pt_dir, j_))
+				oldpte = xe_pt_entry_staging(pt_dir, j_);
 
-			pt_dir->children[j_] = &newpte->base;
+			pt_dir->staging[j_] = &newpte->base;
 			entries[i].pt_entries[j].pt = oldpte;
 		}
 	}
@@ -1522,6 +1543,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 			.ops = &xe_pt_stage_unbind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
+			.staging = true,
 		},
 		.tile = tile,
 		.modified_start = xe_vma_start(vma),
@@ -1563,7 +1585,7 @@ static void xe_pt_abort_unbind(struct xe_vma *vma,
 {
 	int i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = num_entries - 1; i >= 0; --i) {
 		struct xe_vm_pgtable_update *entry = &entries[i];
@@ -1576,7 +1598,7 @@ static void xe_pt_abort_unbind(struct xe_vma *vma,
 			continue;
 
 		for (j = entry->ofs; j < entry->ofs + entry->qwords; j++)
-			pt_dir->children[j] =
+			pt_dir->staging[j] =
 				entries[i].pt_entries[j - entry->ofs].pt ?
 				&entries[i].pt_entries[j - entry->ofs].pt->base : NULL;
 	}
@@ -1589,7 +1611,7 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 {
 	int i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = 0; i < num_entries; ++i) {
 		struct xe_vm_pgtable_update *entry = &entries[i];
@@ -1603,8 +1625,8 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 		pt_dir = as_xe_pt_dir(pt);
 		for (j = entry->ofs; j < entry->ofs + entry->qwords; j++) {
 			entry->pt_entries[j - entry->ofs].pt =
-				xe_pt_entry(pt_dir, j);
-			pt_dir->children[j] = NULL;
+				xe_pt_entry_staging(pt_dir, j);
+			pt_dir->staging[j] = NULL;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c b/drivers/gpu/drm/xe/xe_pt_walk.c
index b8b3d2aea492..be602a763ff3 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.c
+++ b/drivers/gpu/drm/xe/xe_pt_walk.c
@@ -74,7 +74,8 @@ int xe_pt_walk_range(struct xe_ptw *parent, unsigned int level,
 		     u64 addr, u64 end, struct xe_pt_walk *walk)
 {
 	pgoff_t offset = xe_pt_offset(addr, level, walk);
-	struct xe_ptw **entries = parent->children ? parent->children : NULL;
+	struct xe_ptw **entries = walk->staging ? (parent->staging ?: NULL) :
+		(parent->children ?: NULL);
 	const struct xe_pt_walk_ops *ops = walk->ops;
 	enum page_walk_action action;
 	struct xe_ptw *child;
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
index 5ecc4d2f0f65..5c02c244f7de 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.h
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -11,12 +11,14 @@
 /**
  * struct xe_ptw - base class for driver pagetable subclassing.
  * @children: Pointer to an array of children if any.
+ * @staging: Pointer to an array of staging if any.
  *
  * Drivers could subclass this, and if it's a page-directory, typically
  * embed an array of xe_ptw pointers.
  */
 struct xe_ptw {
 	struct xe_ptw **children;
+	struct xe_ptw **staging;
 };
 
 /**
@@ -41,6 +43,8 @@ struct xe_pt_walk {
 	 * as shared pagetables.
 	 */
 	bool shared_pt_mode;
+	/** @staging: Walk staging PT structure */
+	bool staging;
 };
 
 /**
-- 
2.34.1

