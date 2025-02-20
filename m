Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B75C021B4
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 23:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936D510E9F9;
	Thu, 20 Feb 2025 23:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KF5/hB+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D6710E9F5
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 23:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740095099; x=1771631099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+sMFLynyVQUJIGfFyJvixXECVGXWa5moYQSbVQDaaM=;
 b=KF5/hB+imzS28t4T8ThemCwUM6Svl5Fu0v4Duz7yE/Dd4FXO+iWGGtf0
 FT5UtkRBVFoytID6+smzk43TBMmZKLEKvbRKcSckaY0CnWJjCkHNMN5Y8
 335BpwWf85kEOK1Tt+JPCGHSqOMsz2tiGa9P+AUT1PSlRQOwh375QgCeu
 1XYIGfQUmW1sE+3vcHp5TGK3REqPl4jlrwo8W+ZcZdElz4iuiptI3GV2I
 ZekaqiAgfSnu5Aoc1iyJekpdjyT32LH4zd4nUEcbENV2RFNqJ6/J6rCP5
 TypeqfCHVSy07t10wC5RfSscUpOYOlCSN/8s5vWdizoMnXM27FWkGc6qc w==;
X-CSE-ConnectionGUID: WTeubgxZQMmLI1jbVwlzWQ==
X-CSE-MsgGUID: xGb2DphtQUWrEmrb39loJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44817004"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="44817004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:44:58 -0800
X-CSE-ConnectionGUID: K/ocgD+KR+KnDsuABVjcXw==
X-CSE-MsgGUID: KCgqntZRRsWI2AdCjjduiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115855813"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 15:44:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH 2/2] drm/xe: Userptr invalidation race with binds fixes
Date: Thu, 20 Feb 2025 15:45:57 -0800
Message-Id: <20250220234557.2613010-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220234557.2613010-1-matthew.brost@intel.com>
References: <20250220234557.2613010-1-matthew.brost@intel.com>
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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: <stable@vger.kernel.org>
Fixes: e8babb280b5e: ("drm/xe: Convert multiple bind ops into single job")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c            | 86 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pt_types.h      |  1 -
 drivers/gpu/drm/xe/xe_vm.c            |  4 +-
 4 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 4389e5a76f89..ab281e721d94 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -13,6 +13,7 @@
 
 #define GUC_GGTT_TOP		0xFEE00000
 
+#define XE_PPGTT_IS_LEAF		BIT_ULL(63)
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
 #define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
 #define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..26b513a54113 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -389,6 +389,8 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		idx = offset - entry->ofs;
 		entry->pt_entries[idx].pt = xe_child;
 		entry->pt_entries[idx].pte = pte;
+		if (!xe_child)
+			entry->pt_entries[idx].pte |= XE_PPGTT_IS_LEAF;
 		entry->qwords++;
 	}
 
@@ -792,6 +794,24 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
 
+static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
+{
+	struct xe_pt_zap_ptes_walk xe_walk = {
+		.base = {
+			.ops = &xe_pt_zap_ptes_ops,
+			.shifts = xe_normal_pt_shifts,
+			.max_level = XE_PT_HIGHEST_LEVEL,
+		},
+		.tile = tile,
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
@@ -810,24 +830,12 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
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
 	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
-				xe_vma_end(vma), &xe_walk.base);
-
-	return xe_walk.needs_invalidate;
+	return __xe_pt_zap_ptes(tile, vma);
 }
 
 static void
@@ -843,9 +851,10 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
 	for (i = 0; i < num_qwords; i++) {
 		if (map)
 			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
-				  sizeof(u64), u64, ptes[i].pte);
+				  sizeof(u64), u64, ptes[i].pte &
+				  ~XE_PPGTT_IS_LEAF);
 		else
-			ptr[i] = ptes[i].pte;
+			ptr[i] = ptes[i].pte & ~XE_PPGTT_IS_LEAF;
 	}
 }
 
@@ -1201,7 +1210,30 @@ static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
 
 #endif
 
-static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
+static void
+vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma *vma,
+			    struct xe_vm_pgtable_update_ops *pt_update)
+{
+	int i, j, k;
+
+	for (i = 0; i < pt_update->current_op; ++i) {
+		struct xe_vm_pgtable_update_op *op = &pt_update->ops[i];
+
+		if (vma == op->vma && (op->bind || op->rebind)) {
+			for (j = 0; j < op->num_entries; ++j) {
+				for (k = 0; k < op->entries[j].qwords; ++k)
+					if (op->entries[j].pt_entries[k].pte &
+					    XE_PPGTT_IS_LEAF)
+						op->entries[j].pt_entries[k].pte = 0;
+			}
+		}
+	}
+
+	__xe_pt_zap_ptes(tile, vma);
+}
+
+static int vma_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
+			     struct xe_vma *vma,
 			     struct xe_vm_pgtable_update_ops *pt_update)
 {
 	struct xe_userptr_vma *uvma;
@@ -1215,9 +1247,6 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	uvma = to_userptr_vma(vma);
 	notifier_seq = uvma->userptr.notifier_seq;
 
-	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
-		return 0;
-
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
 				     notifier_seq) &&
 	    !xe_pt_userptr_inject_eagain(uvma))
@@ -1231,6 +1260,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 			       &vm->userptr.invalidated);
 		spin_unlock(&vm->userptr.invalidated_lock);
 
+		vma_convert_to_invalidation(tile, vma, pt_update);
+
 		if (xe_vm_in_preempt_fence_mode(vm)) {
 			struct dma_resv_iter cursor;
 			struct dma_fence *fence;
@@ -1252,7 +1283,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
+static int op_check_userptr(struct xe_tile *tile, struct xe_vm *vm,
+			    struct xe_vma_op *op,
 			    struct xe_vm_pgtable_update_ops *pt_update)
 {
 	int err = 0;
@@ -1264,18 +1296,21 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
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
@@ -1301,7 +1336,8 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	down_read(&vm->userptr.notifier_lock);
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_check_userptr(vm, op, pt_update_ops);
+		err = op_check_userptr(&vm->xe->tiles[pt_update->tile_id],
+				       vm, op, pt_update_ops);
 		if (err) {
 			up_read(&vm->userptr.notifier_lock);
 			break;
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 384cc04de719..0f9b7650cd6f 100644
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

