Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AA2CA0EFC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 17:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673F10E398;
	Thu, 21 Aug 2025 17:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmgHJuWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8B310E397
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795842; x=1787331842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OKu34NhCla66l7lU1dASp446NhUZIEZwr1BiRLpm1Vw=;
 b=HmgHJuWkmdEPzp0FLawkalZWmFSWKwlMwz6PtOAtRga1RCW05l6QjGLG
 qTf0W/hw6Z2A/Ek8mR3jilGWBgu4gA+CeGauOjT+sSHAdvTFc39y9ndcM
 uQmCrEgqJWDz7MX4fTpwkXREz29Xv+eeCWxD/hxvlUnk+wt8QwgXqyTDX
 7tqdo/h2avdDtXWWBDTKj00GcVLXh16zpIuJn+757hRnbD2DpOVyO+Qrw
 J3P10c1+82HXQz/RAB85v8xggrvjP620aNbaLX9woDcG1AV2zvNnMXmrU
 76mktoDn+nh9l00zcZvRSZzPgO6WXCI+mfigoeIDzeDfBZMs7sK6vjqpC A==;
X-CSE-ConnectionGUID: 4j/JhdrqR9ebPDnijwcXCA==
X-CSE-MsgGUID: nrpAL2FwTJqlADAA5tVuZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57805845"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="57805845"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 10:04:02 -0700
X-CSE-ConnectionGUID: cGz1WZ+wSnalSFDu80qinQ==
X-CSE-MsgGUID: rN43RnSKQ5eQiUitqMRDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192143814"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 10:04:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 10/20] drm/xe/madvise: Update migration policy based on
 preferred location
Date: Thu, 21 Aug 2025 23:00:54 +0530
Message-Id: <20250821173104.3030148-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
References: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
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

When the user sets the valid devmem_fd as a preferred location, GPU fault
will trigger migration to tile of device associated with devmem_fd.

If the user sets an invalid devmem_fd the preferred location is current
placement(smem) only.

v2(Matthew Brost)
- Default should be faulting tile
- remove devmem_fd used as region

v3 (Matthew Brost)
- Add migration_policy
- Fix return condition
- fix migrate condition

v4
-Rebase

v5
- Add check for userptr and bo based vmas

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        | 45 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h        |  8 ++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 25 ++++++++++++++++-
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c660ccb21945..19585a3d9f69 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -806,6 +806,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	};
 	struct xe_svm_range *range;
 	struct dma_fence *fence;
+	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
@@ -835,8 +836,14 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
+	dpagemap = xe_vma_resolve_pagemap(vma, tile);
 	if (--migrate_try_count >= 0 &&
-	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
+	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
+		/* TODO : For multi-device dpagemap will be used to find the
+		 * remote tile and remote device. Will need to modify
+		 * xe_svm_alloc_vram to use dpagemap for future multi-device
+		 * support.
+		 */
 		err = xe_svm_alloc_vram(tile, range, &ctx);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
@@ -1100,6 +1107,37 @@ static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
 	return &tile->mem.vram->dpagemap;
 }
 
+/**
+ * xe_vma_resolve_pagemap - Resolve the appropriate DRM pagemap for a VMA
+ * @vma: Pointer to the xe_vma structure containing memory attributes
+ * @tile: Pointer to the xe_tile structure used as fallback for VRAM mapping
+ *
+ * This function determines the correct DRM pagemap to use for a given VMA.
+ * It first checks if a valid devmem_fd is provided in the VMA's preferred
+ * location. If the devmem_fd is negative, it returns NULL, indicating no
+ * pagemap is available and smem to be used as preferred location.
+ * If the devmem_fd is equal to the default faulting
+ * GT identifier, it returns the VRAM pagemap associated with the tile.
+ *
+ * Future support for multi-device configurations may use drm_pagemap_from_fd()
+ * to resolve pagemaps from arbitrary file descriptors.
+ *
+ * Return: A pointer to the resolved drm_pagemap, or NULL if none is applicable.
+ */
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
+{
+	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
+
+	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
+		return NULL;
+
+	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
+		return IS_DGFX(tile_to_xe(tile)) ? tile_local_pagemap(tile) : NULL;
+
+	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
+	return NULL;
+}
+
 /**
  * xe_svm_alloc_vram()- Allocate device memory pages for range,
  * migrating existing data.
@@ -1212,6 +1250,11 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 {
 	return 0;
 }
+
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
+{
+	return NULL;
+}
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 046a9c4e95c2..9d6a8840a8b7 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -94,6 +94,8 @@ void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
 
 u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
 
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -318,6 +320,12 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
 	return 0;
 }
 
+static inline
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
+{
+	return NULL;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 95258bb6a8ee..b5fc1eedf095 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -78,7 +78,23 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 				      struct xe_vma **vmas, int num_vmas,
 				      struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
+
+	for (i = 0; i < num_vmas; i++) {
+		/*TODO: Extend attributes to bo based vmas */
+		if (!xe_vma_is_cpu_addr_mirror(vmas[i]))
+			continue;
+
+		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+
+		/* Till multi-device support is not added migration_policy
+		 * is of no use and can be ignored.
+		 */
+		vmas[i]->attr.preferred_loc.migration_policy =
+						op->preferred_mem_loc.migration_policy;
+	}
 }
 
 static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
@@ -184,6 +200,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 
 	switch (args->type) {
 	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
+	{
+		s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
+
+		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
+			return false;
+
 		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
 				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
 			return false;
@@ -194,6 +216,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
 			return false;
 		break;
+	}
 	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
 		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
 			return false;
-- 
2.34.1

