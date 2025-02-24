Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18747C021A6
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AC610E4FA;
	Mon, 24 Feb 2025 13:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0umKA7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CB210E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 03:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740367417; x=1771903417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YDijQVIPtvWt8FE9v72+P05kGRUsSFlePK9J+Iya/e4=;
 b=B0umKA7sma4gXPfEpOy3McDqf2RhiE3bxgp1xA6kcxCsKiQsRLlOLgxW
 dZIIohOtIJYbFo0rp6RMIixO1QOa7QKNVR11FpfsFt5ufT5T4M5nuff+K
 T6sJtIebxmryXZI6LGUnNeHqjQ8LiljyJSYBeYEBn3zDu6ip23d0CuoTW
 dl3XE1AVKSkoBFESl0/ThwajNAxFFLYnW71U/I4dq1yO3CtJXviP+9Hzx
 hRrZ+25g5Z69EMMm2/ZKsRiH7SaNoJ5sGdO+mzhf10b0IB2ZL0pkSuax4
 A1EMx5pg8GFhupMJBkLG83+lqsZ1VD16EVBDEgtgxK9NIRdYeZ0NKBu+s A==;
X-CSE-ConnectionGUID: T0OMj6SOR86A7hHlnwRXGQ==
X-CSE-MsgGUID: I4GYUPcjSUG8eTNzC0o0fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41126882"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41126882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 19:23:36 -0800
X-CSE-ConnectionGUID: luGgX/adSLWGsHoP7BKKvA==
X-CSE-MsgGUID: kJQ3CFDTRme6Xkx1hs0myw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115907823"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 19:23:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 3/3] drm/xe: Add staging tree for VM binds
Date: Sun, 23 Feb 2025 19:24:38 -0800
Message-Id: <20250224032438.3025464-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224032438.3025464-1-matthew.brost@intel.com>
References: <20250224032438.3025464-1-matthew.brost@intel.com>
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

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org>
Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error handling")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c      | 50 +++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pt_walk.c |  3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h |  4 +++
 3 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index add521b5c6ae..118b81cd7205 100644
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
@@ -50,7 +52,7 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt *pt)
 
 static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 {
-	return container_of(pt_dir->children[index], struct xe_pt, base);
+	return container_of(pt_dir->staging[index], struct xe_pt, base);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -125,6 +127,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	}
 	pt->bo = bo;
 	pt->base.children = level ? as_xe_pt_dir(pt)->children : NULL;
+	pt->base.staging = level ? as_xe_pt_dir(pt)->staging : NULL;
 
 	if (vm->xef)
 		xe_drm_client_add_bo(vm->xef->client, pt->bo);
@@ -377,8 +380,10 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		/* Continue building a non-connected subtree. */
 		struct iosys_map *map = &parent->bo->vmap;
 
-		if (unlikely(xe_child))
+		if (unlikely(xe_child)) {
 			parent->base.children[offset] = &xe_child->base;
+			parent->base.staging[offset] = &xe_child->base;
+		}
 
 		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
 		parent->num_live++;
@@ -619,6 +624,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			.ops = &xe_pt_stage_bind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
+			.staging = true,
 		},
 		.vm = xe_vma_vm(vma),
 		.tile = tile,
@@ -812,6 +818,7 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 
 struct xe_pt_zap_ptes_flags {
 	bool scratch:1;
+	bool staging:1;
 };
 
 static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma,
@@ -822,6 +829,7 @@ static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma,
 			.ops = &xe_pt_zap_ptes_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
+			.staging = flags.staging,
 		},
 		.tile = tile,
 		.vm = xe_vma_vm(vma),
@@ -905,7 +913,7 @@ static void xe_pt_cancel_bind(struct xe_vma *vma,
 	}
 }
 
-static void xe_pt_commit_locks_assert(struct xe_vma *vma)
+static void xe_pt_commit_prepare_locks_assert(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 
@@ -917,6 +925,16 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
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
@@ -927,13 +945,17 @@ static void xe_pt_commit(struct xe_vma *vma,
 
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
@@ -945,7 +967,7 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
 {
 	int i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = num_entries - 1; i >= 0; --i) {
 		struct xe_pt *pt = entries[i].pt;
@@ -963,7 +985,7 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
 			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
 			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
 
-			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
+			pt_dir->staging[j_] = oldpte ? &oldpte->base : 0;
 			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
 		}
 	}
@@ -975,7 +997,7 @@ static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
 {
 	u32 i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = 0; i < num_entries; i++) {
 		struct xe_pt *pt = entries[i].pt;
@@ -996,7 +1018,7 @@ static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
 			if (xe_pt_entry(pt_dir, j_))
 				oldpte = xe_pt_entry(pt_dir, j_);
 
-			pt_dir->children[j_] = &newpte->base;
+			pt_dir->staging[j_] = &newpte->base;
 			entries[i].pt_entries[j].pt = oldpte;
 		}
 	}
@@ -1237,7 +1259,10 @@ static void
 vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma *vma,
 			    struct xe_vm_pgtable_update_ops *pt_update)
 {
-	struct xe_pt_zap_ptes_flags flags = { .scratch = true, };
+	struct xe_pt_zap_ptes_flags flags = {
+		.scratch = true,
+		.staging = true,
+	};
 	int i, j, k;
 
 	/*
@@ -1590,6 +1615,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 			.ops = &xe_pt_stage_unbind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
+			.staging = true,
 		},
 		.tile = tile,
 		.modified_start = xe_vma_start(vma),
@@ -1631,7 +1657,7 @@ static void xe_pt_abort_unbind(struct xe_vma *vma,
 {
 	int i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = num_entries - 1; i >= 0; --i) {
 		struct xe_vm_pgtable_update *entry = &entries[i];
@@ -1644,7 +1670,7 @@ static void xe_pt_abort_unbind(struct xe_vma *vma,
 			continue;
 
 		for (j = entry->ofs; j < entry->ofs + entry->qwords; j++)
-			pt_dir->children[j] =
+			pt_dir->staging[j] =
 				entries[i].pt_entries[j - entry->ofs].pt ?
 				&entries[i].pt_entries[j - entry->ofs].pt->base : NULL;
 	}
@@ -1657,7 +1683,7 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 {
 	int i, j;
 
-	xe_pt_commit_locks_assert(vma);
+	xe_pt_commit_prepare_locks_assert(vma);
 
 	for (i = 0; i < num_entries; ++i) {
 		struct xe_vm_pgtable_update *entry = &entries[i];
@@ -1672,7 +1698,7 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 		for (j = entry->ofs; j < entry->ofs + entry->qwords; j++) {
 			entry->pt_entries[j - entry->ofs].pt =
 				xe_pt_entry(pt_dir, j);
-			pt_dir->children[j] = NULL;
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

