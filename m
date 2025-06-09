Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4186C61DB2
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 03:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5457810E34B;
	Mon,  9 Jun 2025 03:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpV3WeUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBC010E34B
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749441022; x=1780977022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vleTNWVHKPnyX50pUYhWOcIu9JbGy8extehl6gZH6NQ=;
 b=fpV3WeUQcpoGEQogfQxaZvaY3sXitlLOdRo4IwsnewhfKYd25zBEOn46
 hz2cP4sO9yxY48lYOFNxT7ttY27rrgQtiOctt6AUTAKZ8f8XIQ3zz/mOT
 VERRKqNvosPZocLHeAhdotHwkXwyXgrm1UwaFp8PxjIf4r78ZKsGdyhCt
 BJbf3gjqew1m9oaAz+eGbllrGg/7XEf58E21nNKnjSp2eBEGwN3iRih/O
 xfhnIHhFfhoTRDjB2034Ojv5emX2zNgUki0TPC0fdGm4X9/cBhRb/FiC2
 mqTAkY56IR+NSm1/cgO6AXi6QIhFId8PBoapgvTQ4O6ow6SHAzJMi1PbT Q==;
X-CSE-ConnectionGUID: DQZCGGEKTiGbmWWZ3yTZxw==
X-CSE-MsgGUID: vPCZ6nsIQiS/EVOa1Z7NlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51648284"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="51648284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 20:50:20 -0700
X-CSE-ConnectionGUID: OdpQtU6hRL+OUOovThbndQ==
X-CSE-MsgGUID: BmxLqy1xRwyn9ZREMQBAgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="151630038"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 08 Jun 2025 20:50:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Date: Mon,  9 Jun 2025 09:46:16 +0530
Message-Id: <20250609041616.1723636-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

Introduce xe_vm_range_tilemask_tlb_invalidation(), which issues a TLB
invalidation for a specified address range across GTs indicated by a
tilemask.

v2 (Matthew Brost)
- Move WARN_ON_ONCE to svm caller
- Remove xe_gt_tlb_invalidation_vma
- s/XE_WARN_ON/WARN_ON_ONCE

v3
- Rebase

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  24 -----
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   3 -
 drivers/gpu/drm/xe/xe_svm.c                 |  43 +-------
 drivers/gpu/drm/xe/xe_vm.c                  | 103 +++++++++++++-------
 drivers/gpu/drm/xe/xe_vm.h                  |   3 +
 5 files changed, 75 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 084cbdeba8ea..0111ee59b81d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -440,30 +440,6 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
 	xe_gt_tlb_invalidation_fence_wait(&fence);
 }
 
-/**
- * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
- * @gt: GT structure
- * @fence: invalidation fence which will be signal on TLB invalidation
- * completion, can be NULL
- * @vma: VMA to invalidate
- *
- * Issue a range based TLB invalidation if supported, if not fallback to a full
- * TLB invalidation. Completion of TLB is asynchronous and caller can use
- * the invalidation fence to wait for completion.
- *
- * Return: Negative error code on error, 0 on success
- */
-int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-			       struct xe_gt_tlb_invalidation_fence *fence,
-			       struct xe_vma *vma)
-{
-	xe_gt_assert(gt, vma);
-
-	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
-					    xe_vma_end(vma),
-					    xe_vma_vm(vma)->usm.asid);
-}
-
 /**
  * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
  * @guc: guc
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index abe9b03d543e..31072dbcad8e 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -19,9 +19,6 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
 
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
-int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-			       struct xe_gt_tlb_invalidation_fence *fence,
-			       struct xe_vma *vma);
 void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 83c63fd7b481..3fd2d63c73a2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 {
 	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
 	struct xe_device *xe = vm->xe;
-	struct xe_tile *tile;
 	struct drm_gpusvm_range *r, *first;
-	struct xe_gt_tlb_invalidation_fence
-		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
 	u8 tile_mask = 0;
-	u8 id;
-	u32 fence_id = 0;
 	long err;
 
 	xe_svm_assert_in_notifier(vm);
@@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_device_wmb(xe);
 
-	for_each_tile(tile, xe, id) {
-		if (tile_mask & BIT(id)) {
-			int err;
-
-			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[fence_id], true);
-
-			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
-							   &fence[fence_id],
-							   adj_start,
-							   adj_end,
-							   vm->usm.asid);
-			if (WARN_ON_ONCE(err < 0))
-				goto wait;
-			++fence_id;
-
-			if (!tile->media_gt)
-				continue;
-
-			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id], true);
-
-			err = xe_gt_tlb_invalidation_range(tile->media_gt,
-							   &fence[fence_id],
-							   adj_start,
-							   adj_end,
-							   vm->usm.asid);
-			if (WARN_ON_ONCE(err < 0))
-				goto wait;
-			++fence_id;
-		}
-	}
-
-wait:
-	for (id = 0; id < fence_id; ++id)
-		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start, adj_end, tile_mask);
+	WARN_ON_ONCE(err);
 
 range_notifier_event_end:
 	r = first;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 18f967ce1f1a..a0c70698265a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3842,6 +3842,68 @@ void xe_vm_unlock(struct xe_vm *vm)
 	dma_resv_unlock(xe_vm_resv(vm));
 }
 
+/**
+ * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
+ * address range
+ * @vm: The VM
+ * @start: start address
+ * @end: end address
+ * @tile_mask: mask for which gt's issue tlb invalidation
+ *
+ * Issue a range based TLB invalidation for gt's in tilemask
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
+					  u64 end, u8 tile_mask)
+{
+	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	struct xe_tile *tile;
+	u32 fence_id = 0;
+	u8 id;
+	int err;
+
+	if (!tile_mask)
+		return 0;
+
+	for_each_tile(tile, vm->xe, id) {
+		if (tile_mask & BIT(id)) {
+			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
+							   &fence[fence_id],
+							   start,
+							   end,
+							   vm->usm.asid);
+			if (err)
+				goto wait;
+			++fence_id;
+
+			if (!tile->media_gt)
+				continue;
+
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->media_gt,
+							   &fence[fence_id],
+							   start,
+							   end,
+							   vm->usm.asid);
+			if (err)
+				goto wait;
+			++fence_id;
+		}
+	}
+
+wait:
+	for (id = 0; id < fence_id; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+
+	return err;
+}
+
 /**
  * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
  * @vma: VMA to invalidate
@@ -3857,11 +3919,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_tile *tile;
-	struct xe_gt_tlb_invalidation_fence
-		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
-	u8 id;
-	u32 fence_id = 0;
+	u8 tile_mask = 0;
 	int ret = 0;
+	u8 id;
 
 	xe_assert(xe, !xe_vma_is_null(vma));
 	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
@@ -3892,37 +3952,14 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		}
 	}
 
-	for_each_tile(tile, xe, id) {
-		if (xe_pt_zap_ptes(tile, vma)) {
-			xe_device_wmb(xe);
-			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[fence_id],
-							  true);
-
-			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
-							 &fence[fence_id], vma);
-			if (ret)
-				goto wait;
-			++fence_id;
-
-			if (!tile->media_gt)
-				continue;
-
-			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id],
-							  true);
+	for_each_tile(tile, xe, id)
+		if (xe_pt_zap_ptes(tile, vma))
+			tile_mask |= BIT(id);
 
-			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
-							 &fence[fence_id], vma);
-			if (ret)
-				goto wait;
-			++fence_id;
-		}
-	}
+	xe_device_wmb(xe);
 
-wait:
-	for (id = 0; id < fence_id; ++id)
-		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
+						    xe_vma_end(vma), tile_mask);
 
 	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
 	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 88d6c0ef89c7..acd3fd6c605b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -228,6 +228,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 				     struct xe_svm_range *range);
 
+int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
+					  u64 end, u8 tile_mask);
+
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 int xe_vm_validate_protected(struct xe_vm *vm);
-- 
2.34.1

