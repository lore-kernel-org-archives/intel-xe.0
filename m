Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF16C71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E910E99E;
	Fri, 13 Jun 2025 12:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7xA5IRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EBE10E9A1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817833; x=1781353833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mA1R4dXfVb9ToiOjLTWBnJ8Tfmbk64urq2fP0VPPL0A=;
 b=Q7xA5IRh3QEQPVPkN8pITTLuxw0ewc7dT9vzp6xDO1W4jHK0S05J53p3
 3cUVMTY9E06ggMlKWlB9/a6oMFUMeYXiM8egA+o7kHWNG+YIxo9gjRP1u
 CKg+AQ7Yu+HM47k9trYEsJwCvumUTBs9xlEo3MmOsMkpZsswdSy1XfckU
 hzu5hKGuIBbuEmoRJwzA5FfDcO45QSfDC71KFZ8E5V+7FbUC/paRi4oVI
 AwFARKQ0dVyoUzKEujJnENlfp1+GbXCsUKcoe2CPlTXUcDXtPneuvUPO5
 0LdEViTEAnXWYi/48DGpzSTR8rpIkJJwG+HZLVOFa82YMeqAHfq/cU6NH A==;
X-CSE-ConnectionGUID: zW7Fz1GMRxOKIZGjxAkuEQ==
X-CSE-MsgGUID: pqUpChvjSoy1h6YuCizdWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610196"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610196"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:33 -0700
X-CSE-ConnectionGUID: VQTdvghEQ0W7/D+UpkwI6w==
X-CSE-MsgGUID: 9wzKOySPRDWEkO7TYzBBiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290380"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 20/20] drm/xe/madvise: Skip vma invalidation if mem attr
 are unchanged
Date: Fri, 13 Jun 2025 18:25:58 +0530
Message-Id: <20250613125558.2607665-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c         |  1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c | 57 ++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 ++++
 3 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d9ce25f3abf4..56d6c286e3d3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1226,6 +1226,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 	vma->attr = *attr;
+	vma->skip_invalidation = 0;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 5b96c8fc73a5..06e40ab0970e 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -88,13 +88,18 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
 
 	for (i = 0; i < num_vmas; i++) {
-		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
-
-		/* Till multi-device support is not added migration_policy
-		 * is of no use and can be ignored.
-		 */
-		vmas[i]->attr.preferred_loc.migration_policy =
+		if (vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		    vmas[i]->attr.preferred_loc.migration_policy ==
+		    op->preferred_mem_loc.migration_policy) {
+			vmas[i]->skip_invalidation = 1;
+		} else {
+			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			/* Till multi-device support is not added migration_policy
+			 * is of no use and can be ignored.
+			 */
+			vmas[i]->attr.preferred_loc.migration_policy =
 						op->preferred_mem_loc.migration_policy;
+		}
 	}
 }
 
@@ -109,7 +114,10 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
 
 	for (i = 0; i < num_vmas; i++) {
-		vmas[i]->attr.atomic_access = op->atomic.val;
+		if (vmas[i]->attr.atomic_access == op->atomic.val)
+			vmas[i]->skip_invalidation = 1;
+		else
+			vmas[i]->attr.atomic_access = op->atomic.val;
 
 		bo = xe_vma_bo(vmas[i]);
 		if (!bo)
@@ -134,9 +142,12 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 
 	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PAT);
 
-	for (i = 0; i < num_vmas; i++)
-		vmas[i]->attr.pat_index = op->pat_index.val;
-
+	for (i = 0; i < num_vmas; i++) {
+		if (vmas[i]->attr.pat_index == op->pat_index.val)
+			vmas[i]->skip_invalidation = 1;
+		else
+			vmas[i]->attr.pat_index = op->pat_index.val;
+	}
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -161,23 +172,25 @@ static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u
 				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
 		XE_WARN_ON(1);
 
-	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
-
 	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 
-		if (xe_vma_is_cpu_addr_mirror(vma))
+		if (vma->skip_invalidation)
 			continue;
 
-		if (xe_vma_is_userptr(vma)) {
-			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
-							     DMA_RESV_USAGE_BOOKKEEP));
-		}
-
-		for_each_tile(tile, vm->xe, id) {
-			if (xe_pt_zap_ptes(tile, vma)) {
-				*tile_mask |= BIT(id);
-				vma->tile_invalidated |= BIT(id);
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			*tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+								      xe_vma_start(vma),
+								      xe_vma_end(vma));
+		} else {
+			if (xe_vma_is_userptr(vma))
+				WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
+								     DMA_RESV_USAGE_BOOKKEEP));
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes(tile, vma)) {
+					*tile_mask |= BIT(id);
+					vma->tile_invalidated |= BIT(id);
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c7156f8e2ed2..3b3019ecbfab 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -151,6 +151,12 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
+	/**
+	 * @skip_invalidation: Used in madvise to avoid invalidation
+	 * if mem attributes doesn't change
+	 */
+	u32 skip_invalidation;
+
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
-- 
2.34.1

