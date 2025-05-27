Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9FCC5B553
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D0610E527;
	Tue, 27 May 2025 16:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQ1dHnQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91910E169
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362519; x=1779898519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ArBTotZg8LGZmy2VnznQmzRvGLRqOa5pkX9e+6EplhU=;
 b=FQ1dHnQB7d+qOSbWub2eP39mnwFOI/BPzlD7F9s1ipaUAhMK9H4UFNLt
 KVO8iLhZJ4M1j8EbVI5u/KO/5/m3pfBRE7xRTgd7e21vW5fLuCbGbrOAf
 rXHD1v0USl1w+mdAlikyXnhrDRHeAP8mNcYOVdimVIVIcupKMv27gPzQl
 OKYOZZQHVTQBIC/vgRQ9fYzsorDsitm7oxx2ImnslVG5jvfYU1HtKIIEq
 K4QGnX+uqdEJcJA5pg99h1IhCVcaqAh6awDbvT4UKWP0P/xwZY+voVx/X
 cRUGMinkBvoK0wxk6Cp0ZVcdiT8xCAH6OU8la6BKH1xocJSCxoRBTyqtb A==;
X-CSE-ConnectionGUID: EAkAV1gnSwO8/hpPXSb40A==
X-CSE-MsgGUID: 7DhrO19iSUeLU0NbUiGIjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471867"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:32 -0700
X-CSE-ConnectionGUID: sleS33cWTHqTNWAWbXWd/g==
X-CSE-MsgGUID: okiI/5CJSDecXxWB0ATW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646033"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:30 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 07/19] drm/xe/vm: Add a helper
 xe_vm_range_tilemask_tlb_invalidation()
Date: Tue, 27 May 2025 22:09:51 +0530
Message-Id: <20250527164003.1068118-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  43 +--------------
 drivers/gpu/drm/xe/xe_vm.c  | 103 ++++++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.h  |   3 ++
 3 files changed, 75 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 871ac81bb04a..59e73187114d 100644
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
+	XE_WARN_ON(err);
 
 range_notifier_event_end:
 	r = first;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index de6ecff237a6..d60b711e97e9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3851,6 +3851,68 @@ void xe_vm_unlock(struct xe_vm *vm)
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
+			if (WARN_ON_ONCE(err < 0))
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
+			if (WARN_ON_ONCE(err < 0))
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
@@ -3865,11 +3927,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
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
@@ -3893,37 +3953,14 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
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
+	for_each_tile(tile, xe, id)
+		if (xe_pt_zap_ptes(tile, vma))
+			tile_mask |= BIT(id);
 
-			if (!tile->media_gt)
-				continue;
+	xe_device_wmb(xe);
 
-			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id],
-							  true);
-
-			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
-							 &fence[fence_id], vma);
-			if (ret)
-				goto wait;
-			++fence_id;
-		}
-	}
-
-wait:
-	for (id = 0; id < fence_id; ++id)
-		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
+						    xe_vma_end(vma), tile_mask);
 
 	vma->tile_invalidated = vma->tile_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 99e164852f63..1ef98113fa5b 100644
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

