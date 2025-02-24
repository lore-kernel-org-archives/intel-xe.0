Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8320C021BC
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3633610E4CC;
	Mon, 24 Feb 2025 13:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVnZLnk2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5D10E0C5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740369869; x=1771905869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VbTHjmX8LpnroydqECvxaK884cE7+mT0AV8hTfDycm4=;
 b=eVnZLnk2oncq6aS0GRQAZeCEVBkPsEKFqoPOQT0+9QsGJTWiS9Pp6OiT
 fpPnkZ/qTsakguIzjizjZsWIngQpzARf4GCZhT5CXxSwoRAYxZosJSWqQ
 a9a+4yKXgFD2k5U6siNPGahQlyAtDU/Edq2tgZSbY1UbUVqOgYSR5ErPn
 XnPufL99xxZGa9gKe09kJligpPZ+3kY6ow6nWyts5Ob/vO3qwxohx+kQu
 5yNt3lhVHp+h0g4w4A1xrscRM0c/CdVjhSD/IZgbXe2+Z4LCrboQ3oeV2
 F0wuu/bm8NVn1Qt9aj+9f2NGTwXTTXNgIME7XjW8KHOHgk1KsSqEATAny A==;
X-CSE-ConnectionGUID: yjnqmmG4QxapawAC0hCjuA==
X-CSE-MsgGUID: 6xuQ3Di3QZKp3/i5hLcTvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="51740512"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51740512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:04:29 -0800
X-CSE-ConnectionGUID: vAPNBt6DTT+U+3r2FTw1Gg==
X-CSE-MsgGUID: th6zeiKwR9KFcoj25fwWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115788477"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 20:04:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH v2 2/3] drm/xe: Userptr invalidation race with binds fixes
Date: Sun, 23 Feb 2025 20:05:28 -0800
Message-Id: <20250224040529.3025963-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224040529.3025963-1-matthew.brost@intel.com>
References: <20250224040529.3025963-1-matthew.brost@intel.com>
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

Squash bind operation after userptr invalidation into a clearing of
PTEs. Will prevent valid GPU page tables from pointing to stale CPU
pages.

Fixup initial bind handling always add VMAs to invalidation list and
clear PTEs.

Remove unused rebind variable in xe_pt.

Always hold notifier across TLB invalidation in notifier to prevent a
UAF if an unbind races.

Including all of the above changes for Fixes patch in hopes of an easier
backport which fix a single patch.

v2:
 - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
 - Support scratch page on invalidation (Thomas)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org>
Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 146 +++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pt_types.h |   3 +-
 drivers/gpu/drm/xe/xe_vm.c       |   4 +-
 3 files changed, 115 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..add521b5c6ae 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -351,7 +351,8 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
  */
 static int
 xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
-		   pgoff_t offset, struct xe_pt *xe_child, u64 pte)
+		   pgoff_t offset, struct xe_pt *xe_child, u64 pte,
+		   unsigned int level)
 {
 	struct xe_pt_update *upd = &xe_walk->wupd.updates[parent->level];
 	struct xe_pt_update *child_upd = xe_child ?
@@ -389,6 +390,9 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		idx = offset - entry->ofs;
 		entry->pt_entries[idx].pt = xe_child;
 		entry->pt_entries[idx].pte = pte;
+		entry->pt_entries[idx].level = level;
+		if (likely(!xe_child))
+			entry->pt_entries[idx].level |= XE_PT_IS_LEAF;
 		entry->qwords++;
 	}
 
@@ -515,7 +519,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			}
 		}
 
-		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, NULL, pte);
+		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, NULL, pte,
+					 level);
 		if (unlikely(ret))
 			return ret;
 
@@ -571,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
-					 pte);
+					 pte, level);
 	}
 
 	*action = ACTION_SUBTREE;
@@ -752,6 +757,10 @@ struct xe_pt_zap_ptes_walk {
 	/* Input parameters for the walk */
 	/** @tile: The tile we're building for */
 	struct xe_tile *tile;
+	/** @vm: VM we're building for */
+	struct xe_vm *vm;
+	/** @scratch: write entries with scratch */
+	bool scratch;
 
 	/* Output */
 	/** @needs_invalidate: Whether we need to invalidate TLB*/
@@ -779,9 +788,18 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	 */
 	if (xe_pt_nonshared_offsets(addr, next, --level, walk, action, &offset,
 				    &end_offset)) {
-		xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
-			      offset * sizeof(u64), 0,
-			      (end_offset - offset) * sizeof(u64));
+		if (unlikely(xe_walk->scratch)) {
+			u64 pte = __xe_pt_empty_pte(xe_walk->tile, xe_walk->vm,
+						    level);
+
+			for (; offset < end_offset; ++offset)
+				xe_pt_write(tile_to_xe(xe_walk->tile),
+					    &xe_child->bo->vmap, offset, pte);
+		} else {
+			xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
+				      offset * sizeof(u64), 0,
+				      (end_offset - offset) * sizeof(u64));
+		}
 		xe_walk->needs_invalidate = true;
 	}
 
@@ -792,6 +810,31 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
 
+struct xe_pt_zap_ptes_flags {
+	bool scratch:1;
+};
+
+static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma,
+			     struct xe_pt_zap_ptes_flags flags)
+{
+	struct xe_pt_zap_ptes_walk xe_walk = {
+		.base = {
+			.ops = &xe_pt_zap_ptes_ops,
+			.shifts = xe_normal_pt_shifts,
+			.max_level = XE_PT_HIGHEST_LEVEL,
+		},
+		.tile = tile,
+		.vm = xe_vma_vm(vma),
+		.scratch = flags.scratch,
+	};
+	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
+
+	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
+				xe_vma_end(vma), &xe_walk.base);
+
+	return xe_walk.needs_invalidate;
+}
+
 /**
  * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
  * @tile: The tile we're zapping for.
@@ -810,24 +853,13 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
  */
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 {
-	struct xe_pt_zap_ptes_walk xe_walk = {
-		.base = {
-			.ops = &xe_pt_zap_ptes_ops,
-			.shifts = xe_normal_pt_shifts,
-			.max_level = XE_PT_HIGHEST_LEVEL,
-		},
-		.tile = tile,
-	};
-	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
+	struct xe_pt_zap_ptes_flags flags = {};
 	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
-				xe_vma_end(vma), &xe_walk.base);
-
-	return xe_walk.needs_invalidate;
+	return __xe_pt_zap_ptes(tile, vma, flags);
 }
 
 static void
@@ -1201,7 +1233,46 @@ static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
 
 #endif
 
-static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
+static void
+vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma *vma,
+			    struct xe_vm_pgtable_update_ops *pt_update)
+{
+	struct xe_pt_zap_ptes_flags flags = { .scratch = true, };
+	int i, j, k;
+
+	/*
+	 * Need to update this function to bypass scratch setup if in fault mode
+	 */
+	xe_assert(xe_vma_vm(vma)->xe, !xe_vm_in_fault_mode(xe_vma_vm(vma)));
+
+	for (i = 0; i < pt_update->current_op; ++i) {
+		struct xe_vm_pgtable_update_op *op = &pt_update->ops[i];
+
+		if (vma != op->vma || (!op->bind && !op->rebind))
+			continue;
+
+		for (j = 0; j < op->num_entries; ++j) {
+			for (k = 0; k < op->entries[j].qwords; ++k) {
+				struct xe_pt_entry *entry =
+					&op->entries[j].pt_entries[k];
+				unsigned int level = entry->level;
+
+				if (!(level & XE_PT_IS_LEAF))
+					continue;
+
+				level &= ~XE_PT_IS_LEAF;
+				entry->pte = __xe_pt_empty_pte(tile,
+							       xe_vma_vm(vma),
+							       level);
+			}
+		}
+	}
+
+	__xe_pt_zap_ptes(tile, vma, flags);
+}
+
+static int vma_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
+			     struct xe_vma *vma,
 			     struct xe_vm_pgtable_update_ops *pt_update)
 {
 	struct xe_userptr_vma *uvma;
@@ -1215,9 +1286,6 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	uvma = to_userptr_vma(vma);
 	notifier_seq = uvma->userptr.notifier_seq;
 
-	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
-		return 0;
-
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
 				     notifier_seq) &&
 	    !xe_pt_userptr_inject_eagain(uvma))
@@ -1226,6 +1294,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_vm_in_fault_mode(vm)) {
 		return -EAGAIN;
 	} else {
+		long err;
+
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_move_tail(&uvma->userptr.invalidate_link,
 			       &vm->userptr.invalidated);
@@ -1234,25 +1304,27 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 		if (xe_vm_in_preempt_fence_mode(vm)) {
 			struct dma_resv_iter cursor;
 			struct dma_fence *fence;
-			long err;
 
 			dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 					    DMA_RESV_USAGE_BOOKKEEP);
 			dma_resv_for_each_fence_unlocked(&cursor, fence)
 				dma_fence_enable_sw_signaling(fence);
 			dma_resv_iter_end(&cursor);
-
-			err = dma_resv_wait_timeout(xe_vm_resv(vm),
-						    DMA_RESV_USAGE_BOOKKEEP,
-						    false, MAX_SCHEDULE_TIMEOUT);
-			XE_WARN_ON(err <= 0);
 		}
+
+		err = dma_resv_wait_timeout(xe_vm_resv(vm),
+					    DMA_RESV_USAGE_BOOKKEEP,
+					    false, MAX_SCHEDULE_TIMEOUT);
+		XE_WARN_ON(err <= 0);
+
+		vma_convert_to_invalidation(tile, vma, pt_update);
 	}
 
 	return 0;
 }
 
-static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
+static int op_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
+			    struct xe_vma_op *op,
 			    struct xe_vm_pgtable_update_ops *pt_update)
 {
 	int err = 0;
@@ -1264,18 +1336,21 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
 			break;
 
-		err = vma_check_userptr(vm, op->map.vma, pt_update);
+		err = vma_check_userptr(tile, vm, op->map.vma, pt_update);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		if (op->remap.prev)
-			err = vma_check_userptr(vm, op->remap.prev, pt_update);
+			err = vma_check_userptr(tile, vm, op->remap.prev,
+						pt_update);
 		if (!err && op->remap.next)
-			err = vma_check_userptr(vm, op->remap.next, pt_update);
+			err = vma_check_userptr(tile, vm, op->remap.next,
+						pt_update);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va),
+		err = vma_check_userptr(tile, vm,
+					gpuva_to_vma(op->base.prefetch.va),
 					pt_update);
 		break;
 	default:
@@ -1301,7 +1376,8 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	down_read(&vm->userptr.notifier_lock);
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_check_userptr(vm, op, pt_update_ops);
+		err = op_check_userptr(&vm->xe->tiles[pt_update->tile_id],
+				       vm, op, pt_update_ops);
 		if (err) {
 			up_read(&vm->userptr.notifier_lock);
 			break;
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 384cc04de719..6f99ff2b8fce 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -29,7 +29,6 @@ struct xe_pt {
 	struct xe_bo *bo;
 	unsigned int level;
 	unsigned int num_live;
-	bool rebind;
 	bool is_compact;
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 	/** addr: Virtual address start address of the PT. */
@@ -52,6 +51,8 @@ struct xe_pt_ops {
 struct xe_pt_entry {
 	struct xe_pt *pt;
 	u64 pte;
+#define XE_PT_IS_LEAF	BIT(31)
+	unsigned int level;
 };
 
 struct xe_vm_pgtable_update {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ea2e287e6526..f90e5c92010c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		spin_unlock(&vm->userptr.invalidated_lock);
 	}
 
-	up_write(&vm->userptr.notifier_lock);
-
 	/*
 	 * Preempt fences turn into schedule disables, pipeline these.
 	 * Note that even in fault mode, we need to wait for binds and
@@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		XE_WARN_ON(err);
 	}
 
+	up_write(&vm->userptr.notifier_lock);
+
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
-- 
2.34.1

