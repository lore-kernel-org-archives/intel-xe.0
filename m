Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2863CA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 10:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B781A10E84E;
	Thu, 14 Aug 2025 10:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8Pgnu0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E2410E84E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755167598; x=1786703598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wmr3kNzlgViRmFSGQDY3AqILsmx0QaNLJNHMptymFwc=;
 b=D8Pgnu0ehPvLiGAmMrVH+PV4YxYjKZzUfaP1KPQRdvdAEyIgYFRmnzfK
 sji85pzhtV6EqX1EN4xv8gU9IihQ/yBsekIMLRNNz2KpUYh52297wBoXM
 pHLRX3alwWVLUelZAsItvPxukqzSAQvsjF3Y2YDNIWKisOGwfxd4CetPj
 tb12hBWK31D4HGyWPUaeZIFRLYCD/U/br4E3ZNqBrQu64JHZLQemTjeyJ
 dexMME0o+bIj8UCsBOIteNLFftiXZVQ1dKEHYY0lSca05TFRqv38arCbc
 3uJL2OTSPqRVnNSg7/A5T6bpVLyT/8isKiUaJbygjDDgCyp19X1Fa2VCk Q==;
X-CSE-ConnectionGUID: T1o3xfTpS26ge5ov7/PncQ==
X-CSE-MsgGUID: 4ZTZs0l0S2a7BbpZ8KVbgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68083790"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68083790"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:33:18 -0700
X-CSE-ConnectionGUID: Oykh3dm9SOGPOmwoRltrPg==
X-CSE-MsgGUID: 7eTyMem1TpWxciiTN51trg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197579429"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 03:33:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 20/24] drm/xe/madvise: Skip vma invalidation if mem attr
 are unchanged
Date: Thu, 14 Aug 2025 16:29:46 +0530
Message-Id: <20250814105950.2177480-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_vm_madvise.c | 68 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 +++
 2 files changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 212a03178d65..7813bdedacaa 100644
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
 
@@ -139,8 +153,14 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
 
-	for (i = 0; i < num_vmas; i++)
-		vmas[i]->attr.pat_index = op->pat_index.val;
+	for (i = 0; i < num_vmas; i++) {
+		if (vmas[i]->attr.pat_index == op->pat_index.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.pat_index = op->pat_index.val;
+		}
+	}
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -157,7 +177,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 {
 	struct drm_gpuva *gpuva;
 	struct xe_tile *tile;
-	u8 id, tile_mask;
+	u8 id, tile_mask = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -166,17 +186,20 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
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
@@ -184,6 +207,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				 */
 				WRITE_ONCE(vma->tile_invalidated,
 					   vma->tile_invalidated | BIT(id));
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5704f379c225..35b6344158f5 100644
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

