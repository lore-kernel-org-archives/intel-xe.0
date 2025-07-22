Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CBDC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2D910E68E;
	Tue, 22 Jul 2025 13:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ona2Eo34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4B410E68E
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189744; x=1784725744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XKveCWgwDC56indzhhi1ztSWzXkB+w/Dl8nEWiZJnTk=;
 b=Ona2Eo34qs0ZE4pJg2Cc7sjk6lphTfkiPez9URuZq0Zxa5sUdZXtNnGV
 NuVCr7W3/8ogXvwJdb2nAECCPhlN96Nam1fyUyl1A//doCzdfTx0KCcZ8
 okCxJjQ8Q6RMYAtMB9qU37vYeCZORw6LSg02vkZZUuWfFazhujBnz0zu2
 NTx+1BQkn3fZ1aKv70M6+PhdB/LX+5ZcVVtO+lJyLZ0rdG9jHSvCt9N4Z
 R1tacqWovEGsb+IRpV0t7ZvP7zY1jtFIkBHdaTwSKXwvAknI/FdVkxgii
 1MKreRhzzrLa9GVzQSuA4cABkhaO2lKYpbtXVoteHi41dmtO+miyJ5LKU Q==;
X-CSE-ConnectionGUID: qes+Jq8cRJCjf2XToAA71g==
X-CSE-MsgGUID: 9GsaG69BSvql8wxf73tMkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530381"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:04 -0700
X-CSE-ConnectionGUID: lbRXbYxrSJa1grNnplsomA==
X-CSE-MsgGUID: kWvDpZyuS9e9Pi61bx5xUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420616"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 12/23] drm/xe/madvise: Update migration policy based on
 preferred location
Date: Tue, 22 Jul 2025 19:05:15 +0530
Message-Id: <20250722133526.3550547-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        | 40 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h        |  8 ++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 21 +++++++++++++++-
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 49d3405aacb9..ba1233d0d5a2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -790,6 +790,37 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return true;
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
+		return IS_DGFX(tile_to_xe(tile)) ? xe_tile_local_pagemap(tile) : NULL;
+
+	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
+	return NULL;
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -821,6 +852,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	};
 	struct xe_svm_range *range;
 	struct dma_fence *fence;
+	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
@@ -850,8 +882,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
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
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b0da0e85f0b8..494823afaa98 100644
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
index 62dc5cec8950..17959257ee1d 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -78,7 +78,19 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 				      struct xe_vma **vmas, int num_vmas,
 				      struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
+
+	for (i = 0; i < num_vmas; i++) {
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
@@ -178,6 +190,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 
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
@@ -188,6 +206,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
 			return false;
 		break;
+	}
 	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
 		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
 			return false;
-- 
2.34.1

