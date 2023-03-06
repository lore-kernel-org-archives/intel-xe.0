Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900A5C678D4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 13:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5510E0AC;
	Mon,  6 Mar 2023 13:18:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E90410E0AC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678108695; x=1709644695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IoKR2PEtEii35W2dwIqI+Ufl+cYqsMbURfaqNXhtZ8U=;
 b=VkXCdyILNH/dWvoJuQ19WG14g2j0gZOPrwsYm6EUke00EIqD9do5ndEK
 VKlz1lmesnJXJWPrprfWDxgHMowZcXenm3WfyPqjkyR5eagu/1PdHQArf
 UwDdQgWJ4jNDa496OT9gTI850Va1Nbg2r1V+/eF9AL7EfeJl87NDa90BM
 IRsxyJdDHTHGUI1FOP/FSgCLZMj+lffjt7MRUPWK8IYu2LyDF7pf/oY8e
 SSUl3Se/8PUIoH00StnCDEbiiXvK0+McAlMIHlnH0zgd958aJS0j4/WmC
 DN5AEcf6NueUvti6g+8bHIKhubwOCuO/lHkZ2fcQktjhdHYtVB1X1mQVh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337866728"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="337866728"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="653607259"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="653607259"
Received: from jsyrstad-mobl1.amr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.109])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:18:13 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 14:17:37 +0100
Message-Id: <20230306131738.197862-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306131738.197862-1-thomas.hellstrom@linux.intel.com>
References: <20230306131738.197862-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Use the xe page table walker rather
 than the drm one.
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

To be squashed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 110 +++++++++++++++----------------
 drivers/gpu/drm/xe/xe_pt_types.h |   4 +-
 2 files changed, 55 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 06fc7b206997..00d9fff53828 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -5,14 +5,13 @@
 
 #include "xe_pt.h"
 
-#include <drm/drm_pt_walk.h>
-
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
+#include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -20,8 +19,8 @@
 
 struct xe_pt_dir {
 	struct xe_pt pt;
-	/** @dir: Directory structure for the drm_pt_walk functionality */
-	struct drm_pt_dir dir;
+	/** @dir: Directory structure for the xe_pt_walk functionality */
+	struct xe_ptw_dir dir;
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
@@ -44,7 +43,7 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt *pt)
 
 static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 {
-	return container_of(pt_dir->dir.entries[index], struct xe_pt, drm);
+	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
 }
 
 /**
@@ -211,7 +210,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	int err;
 
 	size = !level ?  sizeof(struct xe_pt) : sizeof(struct xe_pt_dir) +
-		GEN8_PDES * sizeof(struct drm_pt *);
+		GEN8_PDES * sizeof(struct xe_ptw *);
 	pt = kzalloc(size, GFP_KERNEL);
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
@@ -227,7 +226,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	}
 	pt->bo = bo;
 	pt->level = level;
-	pt->drm.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
+	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
 
 	XE_BUG_ON(level > XE_VM_MAX_LEVEL);
 
@@ -404,8 +403,8 @@ struct xe_pt_update {
 };
 
 struct xe_pt_stage_bind_walk {
-	/** drm: The base class. */
-	struct drm_pt_walk drm;
+	/** base: The base class. */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @vm: The vm we're building for. */
@@ -532,7 +531,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		struct iosys_map *map = &parent->bo->vmap;
 
 		if (unlikely(xe_child))
-			parent->drm.dir->entries[offset] = &xe_child->drm;
+			parent->base.dir->entries[offset] = &xe_child->base;
 
 		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
 		parent->num_live++;
@@ -556,7 +555,7 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	u64 size, dma;
 
 	/* Does the virtual range requested cover a huge pte? */
-	if (!drm_pt_covers(addr, next, level, &xe_walk->drm))
+	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
 		return false;
 
 	/* Does the DMA segment cover the whole pte? */
@@ -618,15 +617,15 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 }
 
 static int
-xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
+xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		       unsigned int level, u64 addr, u64 next,
-		       struct drm_pt **child,
+		       struct xe_ptw **child,
 		       enum page_walk_action *action,
-		       struct drm_pt_walk *walk)
+		       struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_pt *xe_child;
 	bool covers;
 	int ret = 0;
@@ -675,7 +674,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		xe_walk->l0_end_addr = next;
 	}
 
-	covers = drm_pt_covers(addr, next, level, &xe_walk->drm);
+	covers = xe_pt_covers(addr, next, level, &xe_walk->base);
 	if (covers || !*child) {
 		u64 flags = 0;
 
@@ -689,7 +688,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		if (!covers)
 			xe_pt_populate_empty(xe_walk->gt, xe_walk->vm, xe_child);
 
-		*child = &xe_child->drm;
+		*child = &xe_child->base;
 
 		/*
 		 * Prefer the compact pagetable layout for L0 if possible.
@@ -712,7 +711,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 	return ret;
 }
 
-static const struct drm_pt_walk_ops xe_pt_stage_bind_ops = {
+static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 	.pt_entry = xe_pt_stage_bind_entry,
 };
 
@@ -742,7 +741,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_stage_bind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -785,8 +784,8 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
 				vma->end - vma->start + 1, &curs);
 
-	ret = drm_pt_walk_range(&pt->drm, pt->level, vma->start, vma->end + 1,
-				&xe_walk.drm);
+	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
+				&xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -812,20 +811,17 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
  * be shared page tables also at lower levels, so it adjusts the walk action
  * accordingly.
  *
- * Note that the function is not device-specific so could be made a drm
- * pagewalk helper.
- *
  * Return: true if there were non-shared entries, false otherwise.
  */
 static bool xe_pt_nonshared_offsets(u64 addr, u64 end, unsigned int level,
-				    struct drm_pt_walk *walk,
+				    struct xe_pt_walk *walk,
 				    enum page_walk_action *action,
 				    pgoff_t *offset, pgoff_t *end_offset)
 {
 	u64 size = 1ull << walk->shifts[level];
 
-	*offset = drm_pt_offset(addr, level, walk);
-	*end_offset = drm_pt_num_entries(addr, end, level, walk) + *offset;
+	*offset = xe_pt_offset(addr, level, walk);
+	*end_offset = xe_pt_num_entries(addr, end, level, walk) + *offset;
 
 	if (!level)
 		return true;
@@ -849,8 +845,8 @@ static bool xe_pt_nonshared_offsets(u64 addr, u64 end, unsigned int level,
 }
 
 struct xe_pt_zap_ptes_walk {
-	/** @drm: The walk base-class */
-	struct drm_pt_walk drm;
+	/** @base: The walk base-class */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @gt: The gt we're building for */
@@ -861,15 +857,15 @@ struct xe_pt_zap_ptes_walk {
 	bool needs_invalidate;
 };
 
-static int xe_pt_zap_ptes_entry(struct drm_pt *parent, pgoff_t offset,
+static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 				unsigned int level, u64 addr, u64 next,
-				struct drm_pt **child,
+				struct xe_ptw **child,
 				enum page_walk_action *action,
-				struct drm_pt_walk *walk)
+				struct xe_pt_walk *walk)
 {
 	struct xe_pt_zap_ptes_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 	pgoff_t end_offset;
 
 	XE_BUG_ON(!*child);
@@ -891,7 +887,7 @@ static int xe_pt_zap_ptes_entry(struct drm_pt *parent, pgoff_t offset,
 	return 0;
 }
 
-static const struct drm_pt_walk_ops xe_pt_zap_ptes_ops = {
+static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
 
@@ -914,7 +910,7 @@ static const struct drm_pt_walk_ops xe_pt_zap_ptes_ops = {
 bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 {
 	struct xe_pt_zap_ptes_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_zap_ptes_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -926,8 +922,8 @@ bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 	if (!(vma->gt_present & BIT(gt->info.id)))
 		return false;
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
+				 &xe_walk.base);
 
 	return xe_walk.needs_invalidate;
 }
@@ -1013,7 +1009,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
 					      vma->vm->flags, deferred);
 
-			pt_dir->dir.entries[j_] = &newpte->drm;
+			pt_dir->dir.entries[j_] = &newpte->base;
 		}
 		kfree(entries[i].pt_entries);
 	}
@@ -1373,8 +1369,8 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 }
 
 struct xe_pt_stage_unbind_walk {
-	/** @drm: The pagewalk base-class. */
-	struct drm_pt_walk drm;
+	/** @base: The pagewalk base-class. */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @gt: The gt we're unbinding from. */
@@ -1402,10 +1398,10 @@ struct xe_pt_stage_unbind_walk {
 static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 			     const struct xe_pt *child,
 			     enum page_walk_action *action,
-			     struct drm_pt_walk *walk)
+			     struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_unbind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
+		container_of(walk, typeof(*xe_walk), base);
 	unsigned int shift = walk->shifts[level];
 	u64 size = 1ull << shift;
 
@@ -1426,13 +1422,13 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 	return false;
 }
 
-static int xe_pt_stage_unbind_entry(struct drm_pt *parent, pgoff_t offset,
+static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 				    unsigned int level, u64 addr, u64 next,
-				    struct drm_pt **child,
+				    struct xe_ptw **child,
 				    enum page_walk_action *action,
-				    struct drm_pt_walk *walk)
+				    struct xe_pt_walk *walk)
 {
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 
 	XE_BUG_ON(!*child);
 	XE_BUG_ON(!level && xe_child->is_compact);
@@ -1443,15 +1439,15 @@ static int xe_pt_stage_unbind_entry(struct drm_pt *parent, pgoff_t offset,
 }
 
 static int
-xe_pt_stage_unbind_post_descend(struct drm_pt *parent, pgoff_t offset,
+xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				unsigned int level, u64 addr, u64 next,
-				struct drm_pt **child,
+				struct xe_ptw **child,
 				enum page_walk_action *action,
-				struct drm_pt_walk *walk)
+				struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_unbind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 	pgoff_t end_offset;
 	u64 size = 1ull << walk->shifts[--level];
 
@@ -1475,7 +1471,7 @@ xe_pt_stage_unbind_post_descend(struct drm_pt *parent, pgoff_t offset,
 	return 0;
 }
 
-static const struct drm_pt_walk_ops xe_pt_stage_unbind_ops = {
+static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
 	.pt_entry = xe_pt_stage_unbind_entry,
 	.pt_post_descend = xe_pt_stage_unbind_post_descend,
 };
@@ -1498,7 +1494,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 				       struct xe_vm_pgtable_update *entries)
 {
 	struct xe_pt_stage_unbind_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -1510,8 +1506,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 	};
 	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
+				 &xe_walk.base);
 
 	return xe_walk.wupd.num_used_entries;
 }
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 2bb5d0e319b7..2ed64c0a4485 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -6,7 +6,7 @@
 #ifndef _XE_PT_TYPES_H_
 #define _XE_PT_TYPES_H_
 
-#include <drm/drm_pt_walk.h>
+#include "xe_pt_walk.h"
 
 enum xe_cache_level {
 	XE_CACHE_NONE,
@@ -17,7 +17,7 @@ enum xe_cache_level {
 #define XE_VM_MAX_LEVEL 4
 
 struct xe_pt {
-	struct drm_pt drm;
+	struct xe_ptw base;
 	struct xe_bo *bo;
 	unsigned int level;
 	unsigned int num_live;
-- 
2.39.2

