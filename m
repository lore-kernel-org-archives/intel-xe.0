Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A270BC87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6818510E88D;
	Thu,  7 Aug 2025 16:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcSsQ5e4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E4010E88D
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583438; x=1786119438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9NzuoHL40YhCKvl+vruq7a/KM2LYsxaCpYK4tF6N09s=;
 b=LcSsQ5e4tK1Bppz/9fzK82K+wHfXgTixOJgjVU3ZfIhXjsxBxfo8H1NX
 4wuwsoL/oO8qPH4mmp7EMZuE2WtsbzK+HP2aScEG5EyBqh1ijV+U9Lr0j
 p6dN3Y3kGHoakg/zvXiS+sG498P3BLLnwVIRCRyszuPEQSMNtzy0hqH3Q
 n7/bRWES/WQ1RB0M8ED+sQ/x+6WPPqIZcs/DT6/J0s+mKdCe0EGy5pSzO
 lJgPr/3VQS+ZQlpdjkwputfv45CTvFl6GA8gxNgbXBllEzNlrZ1bU4J+C
 U5+gwgQboD1Uy3ChBFG2+uCYgSSD1d5lL0/KLGyIqMzoHBHlNKE5zkS+L g==;
X-CSE-ConnectionGUID: U+HSdOJnT7CnQPT8uTuhxA==
X-CSE-MsgGUID: zxCQqwMSQTGmTXR+cd0uvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845627"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845627"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:18 -0700
X-CSE-ConnectionGUID: yciLKLvFTr+v1z4XNxBdRQ==
X-CSE-MsgGUID: ftI13ZpCRSCzlcBwZfj0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937934"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:17:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 22/26] drm/xe/madvise: Skip vma invalidation if mem attr
 are unchanged
Date: Thu,  7 Aug 2025 22:13:34 +0530
Message-Id: <20250807164338.1832254-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

If a VMA within the madvise input range already has the same memory
attribute as the one requested by the user, skip PTE zapping for that
VMA to avoid unnecessary invalidation.

v2 (Matthew Brost)
- fix skip_invalidation for new attributes
- s/u32/bool
- Remove unnecessary assignment  for kzalloc'ed

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 71 +++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 +++
 2 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b2a78774ca83..8a3b4cb59593 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -85,16 +85,20 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; i++) {
 		/*TODO: Extend attributes to bo based vmas */
-		if (!xe_vma_is_cpu_addr_mirror(vmas[i]))
-			continue;
-
-		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
-
-		/* Till multi-device support is not added migration_policy
-		 * is of no use and can be ignored.
-		 */
-		vmas[i]->attr.preferred_loc.migration_policy =
+		if ((vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		     vmas[i]->attr.preferred_loc.migration_policy ==
+		     op->preferred_mem_loc.migration_policy) ||
+		    !xe_vma_is_cpu_addr_mirror(vmas[i])) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			/* Till multi-device support is not added migration_policy
+			 * is of no use and can be ignored.
+			 */
+			vmas[i]->attr.preferred_loc.migration_policy =
 						op->preferred_mem_loc.migration_policy;
+		}
 	}
 }
 
@@ -109,17 +113,27 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
 
 	for (i = 0; i < num_vmas; i++) {
-		if ((xe_vma_is_userptr(vmas[i]) &&
-		     !(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
-		       xe->info.has_device_atomics_on_smem)))
+		if (xe_vma_is_userptr(vmas[i]) &&
+		    !(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
+		      xe->info.has_device_atomics_on_smem)) {
+			vmas[i]->skip_invalidation = true;
 			continue;
+		}
+
+		if (vmas[i]->attr.atomic_access == op->atomic.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.atomic_access = op->atomic.val;
+		}
 
 		vmas[i]->attr.atomic_access = op->atomic.val;
 
 		bo = xe_vma_bo(vmas[i]);
-		if (!bo)
+		if (!bo || bo->attr.atomic_access == op->atomic.val)
 			continue;
 
+		vmas[i]->skip_invalidation = false;
 		xe_bo_assert_held(bo);
 		bo->attr.atomic_access = op->atomic.val;
 
@@ -140,11 +154,14 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
 
 	for (i = 0; i < num_vmas; i++) {
-		if (!xe_vma_bo(vmas[i]) &&
-		    xe_pat_index_get_comp_mode(xe, op->pat_index.val))
-			continue;
-
-		vmas[i]->attr.pat_index = op->pat_index.val;
+		if ((!xe_vma_bo(vmas[i]) &&
+		     xe_pat_index_get_comp_mode(xe, op->pat_index.val)) ||
+		    vmas[i]->attr.pat_index == op->pat_index.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.pat_index = op->pat_index.val;
+		}
 	}
 }
 
@@ -162,7 +179,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 {
 	struct drm_gpuva *gpuva;
 	struct xe_tile *tile;
-	u8 id, tile_mask;
+	u8 id, tile_mask = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -171,17 +188,20 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
 		XE_WARN_ON(1);
 
-	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
-
 	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 
-		if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma))
+		if (vma->skip_invalidation || xe_vma_is_null(vma))
 			continue;
 
-		for_each_tile(tile, vm->xe, id) {
-			if (xe_pt_zap_ptes(tile, vma)) {
-				tile_mask |= BIT(id);
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+								      xe_vma_start(vma),
+								      xe_vma_end(vma));
+		} else {
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes(tile, vma)) {
+					tile_mask |= BIT(id);
 
 				/*
 				 * WRITE_ONCE pairs with READ_ONCE
@@ -189,6 +209,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				 */
 				WRITE_ONCE(vma->tile_invalidated,
 					   vma->tile_invalidated | BIT(id));
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index cd94d8b5819d..81d92d886578 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -157,6 +157,12 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
+	/**
+	 * @skip_invalidation: Used in madvise to avoid invalidation
+	 * if mem attributes doesn't change
+	 */
+	bool skip_invalidation;
+
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
-- 
2.34.1

