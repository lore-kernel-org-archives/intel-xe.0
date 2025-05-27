Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B3BC5B555
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764DC10E546;
	Tue, 27 May 2025 16:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0PQmdSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55210E527
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362520; x=1779898520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRxjOmqbt38bdLTDl7VJy+T7k5FCnQ0IfvBlzeXznVk=;
 b=l0PQmdSBAVYdzuwufOaiPBaRvDeCKFXxhoKEHJcLXLHb95AJER0Rxs7x
 1ENCsFpODLVwoRLU4BOaP01JzeS3SOHhxawkLxOPANYpTHU6tAq36V+E5
 M5pqG6V/FaOh5pyik8F8SvqI6QBM5UQv0W14kQBDWSKLBY3SpujeVt3n9
 trwrLjcbo5L35ahseJ3TP/tvN2uCGONVcxyoq5Cnn0CjxcyLSmqiFP09z
 wIMag0Qs7ZbnTA2rMVjhWfNw59mZp42U1aJJFFmdv9nQe1KmDd5YEGg7a
 QxaysyQTnanCPRI9Kx5GS8Mjd05oE8/X9f8xm2gV3mz2I8W6zN5PQ4w+p g==;
X-CSE-ConnectionGUID: svc9VAyiRui4NSZ5+AdzQw==
X-CSE-MsgGUID: hDyO4ND+SFSZzB3VFCotiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471921"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471921"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:44 -0700
X-CSE-ConnectionGUID: sPeWF0s0QyuIvaD8SuQxkw==
X-CSE-MsgGUID: E+s7XYS3R9iVpilDEXpDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646188"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 16/19] drm/xe/svm: Consult madvise preferred location in
 prefetch
Date: Tue, 27 May 2025 22:10:00 +0530
Message-Id: <20250527164003.1068118-17-himal.prasad.ghimiray@intel.com>
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

When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
ranges to preferred location provided by madvise.

v2 (Matthew Brost)
- Fix region, devmem_fd usages
- consult madvise is applicable for other vma's too.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c  | 30 ++++++++++++++++++++----------
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 8b6546ebac72..0c929eb192e7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -822,6 +822,17 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 	return NULL;
 }
 
+/**
+ * xe_tile_from_dpagemap - Find xe_tile from drm_pagemap
+ * @dpagemap: pointer to struct drm_pagemap
+ *
+ * Return: Pointer to xe_tile
+ */
+struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
+{
+	return container_of(dpagemap, struct xe_tile, mem.vram.dpagemap);
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 344349313001..a8b5bebf7a54 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -97,6 +97,8 @@ void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
 
 struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
 
+struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -328,6 +330,11 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 	return NULL;
 }
 
+static inline
+struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
+{
+	return NULL;
+}
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e5fc2c2be8b2..4520e475399e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2917,15 +2917,24 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	int err = 0;
 
 	struct xe_svm_range *svm_range;
+	struct drm_pagemap *dpagemap;
 	struct drm_gpusvm_ctx ctx = {};
-	struct xe_tile *tile;
+	struct xe_tile *tile = NULL;
 	unsigned long i;
 	u32 region;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
 
-	region = op->prefetch_range.region;
+	if (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
+		dpagemap = xe_vma_resolve_pagemap(vma, tile);
+		if (dpagemap)
+			tile = xe_tile_from_dpagemap(dpagemap);
+	} else {
+		region = op->prefetch_range.region;
+		if (region)
+			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+	}
 
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
@@ -2935,18 +2944,18 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, region);
+		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile);
 
 		if (!needs_vram) {
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 		} else if (needs_vram) {
-			/* If  migration is mandated by atomic attributes
-			 * in vma and prefetch region is smem force prefetch
+			/* If migration is mandated by atomic attributes
+			 * in vma, and prefetch region is smem, force prefetch
 			 * in vram of root tile.
 			 */
-			region = region ? region : 1;
+			if (!tile)
+				tile = xe_device_get_root_tile(vm->xe);
 
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
@@ -3014,7 +3023,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		else
 			region = op->prefetch.region;
 
-		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
+			  region <= ARRAY_SIZE(region_to_mem_type));
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
@@ -3432,8 +3442,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
-				       xe->info.mem_region_mask)) ||
+		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
+				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
-- 
2.34.1

