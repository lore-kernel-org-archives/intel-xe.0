Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3358DCD8CAC
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 08:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA1C10E1AE;
	Tue,  9 Jun 2026 08:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhIoRYEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE710E1AE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780994406; x=1812530406;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q81V/LjoOnvFxQYlrzQLAW9p9QTdH5m3g1GqN2R7qSs=;
 b=AhIoRYEmx3XwJ+8Y2BhfTvkDBq7zaIaTTihKuxXybLmOsAxJmAQr6eSV
 XYTx+8ZPuXcV0D24vJzRjxOXOM2+Pafhv8/rk/pNHDZNmeGFQWvvYfBAw
 e/oAa8NWmPsxhEh+oJgZlKWdot6goKRsfPaxCGjLCe2xshVvuULrAC7ek
 bjPDoSe6ApY3A4qAhLnLnoXIHL64BccFlBEU8EgkUoOkZcPWhMTjfEdH1
 PwPqtOr1xOrjysInMCTdNVV1wHOSd6m8uVIqMj0i+mi5/mcV9BX2WZeG1
 +Xfug/zvLkNXUPr3N/61xLGCBQHd9rNbxnswJA36dShADAJceHAoHu5VQ g==;
X-CSE-ConnectionGUID: +wCQMJJORiafOGrqCYUw4w==
X-CSE-MsgGUID: 6oSUaRtNSJO+5IceUSGrLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81812885"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81812885"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:40:06 -0700
X-CSE-ConnectionGUID: SUe1KuVBT6uvyoLj0ioecQ==
X-CSE-MsgGUID: W9iPmQOwQCKpA2a1aK7nLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="241633020"
Received: from dut2933pvc.iind.intel.com ([10.190.215.18])
 by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 01:40:04 -0700
From: Nishit Sharma <nishit.sharma@intel.com>
To: intel-xe@lists.freedesktop.org,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] [RFC]drm/xe: fix cross-tile SVM migration mapping on PVC and
 harden ENOSPC retry path
Date: Tue,  9 Jun 2026 08:40:03 +0000
Message-ID: <20260609084003.70975-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

This update addresses correctness and stability issues in unified memory migration on
multi-tile (such as PVC) systems where multiple tiles share a single device context.
In that environment, local and peer memory paths can appear equivalent at the device level,
which may cause cross-tile traffic to use an address form that is only valid on the owning tile.
Under page-fault-driven migration, that can intermittently fail when one tile accesses pages
currently resident on another tile.
The fix introduces explicit peer-aware mapping semantics so cross-tile accesses are resolved
through a valid peer-accessible DMA path rather than tile-local addressing.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c |  6 ++-
 drivers/gpu/drm/xe/xe_pt.c    | 14 +++--
 drivers/gpu/drm/xe/xe_svm.c   | 97 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sync.c  | 13 +++++
 include/drm/drm_gpusvm.h      |  1 +
 include/drm/drm_pagemap.h     |  6 +++
 6 files changed, 132 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 15c78eca180b..e781cbdfa494 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -267,11 +267,15 @@ drm_pagemap_migrate_map_device_private_pages(struct device *dev,
 				goto next;
 
 			num_local_pages += NR_PAGES(order);
+			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
 		} else {
 			num_peer_pages += NR_PAGES(order);
+			if (dpagemap->ops->peer_map)
+				addr = dpagemap->ops->peer_map(dpagemap, dev, page, order, dir);
+			else
+				addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
 		}
 
-		addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
 		if (dma_mapping_error(dev, addr.addr))
 			return -EFAULT;
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2669ff5ee747..e0aed463373b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -564,9 +564,17 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 					xe_walk->vma->gpuva.flags |=
 							XE_VMA_PTE_64K;
 					pte |= XE_PTE_PS64;
-				} else if (XE_WARN_ON(xe_walk->needs_64K &&
-					   is_vram)) {
-					return -EINVAL;
+				} else if (xe_walk->needs_64K &&
+					   is_vram) {
+					/*
+					 * needs_64K VM requires 64K PTEs for VRAM but
+					 * the 64K PTE cannot be formed: partial VRAM
+					 * eviction or partial migration created a mixed
+					 * SRAM+VRAM 64K window. Return -ENOSPC so the
+					 * page fault handler can evict remaining VRAM
+					 * and retry with SRAM-only mappings.
+					 */
+					return -ENOSPC;
 				}
 			}
 		}
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e1651e70c8f0..150391c9878b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -602,8 +602,39 @@ static int xe_svm_copy(struct page **pages,
 			vr = xe_page_to_vr(spage);
 			gt = xe_migrate_exec_queue(vr->migrate)->gt;
 			xe = vr->xe;
+		} else if (spage && xe_page_to_vr(spage) != vr) {
+			/*
+			 * On multi-tile devices (e.g. PVC/Xe_HPC), migrate_vma
+			 * may return VRAM pages from different tiles within the
+			 * same batch because all tiles share the same
+			 * pgmap_owner. Flush the current copy chunk using the
+			 * old tile before switching to the new tile's VRAM region.
+			 */
+			if (vram_addr != XE_VRAM_ADDR_INVALID) {
+				xe_svm_copy_kb_stats_incr(gt, dir,
+						(i - pos) * (PAGE_SIZE / SZ_1K));
+				if (sram)
+					__fence = xe_migrate_from_vram(vr->migrate,
+							i - pos, vram_addr,
+							&pagemap_addr[pos],
+							pre_migrate_fence);
+				else
+					__fence = xe_migrate_to_vram(vr->migrate,
+							i - pos, &pagemap_addr[pos],
+							vram_addr, pre_migrate_fence);
+				if (IS_ERR(__fence)) {
+					err = PTR_ERR(__fence);
+					goto err_out;
+				}
+				pre_migrate_fence = NULL;
+				dma_fence_put(fence);
+				fence = __fence;
+			}
+			vr = xe_page_to_vr(spage);
+			gt = xe_migrate_exec_queue(vr->migrate)->gt;
+			xe = vr->xe;
+			vram_addr = XE_VRAM_ADDR_INVALID;
 		}
-		XE_WARN_ON(spage && xe_page_to_vr(spage) != vr);
 
 		/*
 		 * CPU page and device page valid, capture physical address on
@@ -1148,6 +1179,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 
 	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
 		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		if (!supports_4K_migration(vm->xe) &&
+		   (!IS_ALIGNED(xe_svm_range_start(range), SZ_64K) ||
+		   !IS_ALIGNED(range_size, SZ_64K))) {
+			drm_dbg(&vm->xe->drm,
+				"Range not 64K-aligned for VRAM migration, start=0x%lx size=0x%lx\n",
+				xe_svm_range_start(range), (unsigned long)range_size);
+			return false;
+		}
 		return false;
 	}
 
@@ -1227,6 +1266,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	ktime_t start = xe_gt_stats_ktime_get(), bind_start, get_pages_start;
 	int err;
 
+	ctx.local_dpagemap = xe_tile_local_pagemap(tile);
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
@@ -1360,6 +1400,45 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		goto retry;
 	}
 
+	if (err == -ENOSPC) {
+		/*
+		 * 64K PTE not possible for needs_64K VM: mixed SRAM+VRAM in
+		 * the DMA address array prevented xe_pt_scan_64K from forming
+		 * a 64K PTE.  Three invariants must hold for recovery:
+		 *
+		 * 1. Evict unconditionally via drm_gpusvm_range_evict: the
+		 *    advisory has_devmem_pages flag may be stale (false) while
+		 *    VRAM DMA entries still exist in the dma_addr array.
+		 *
+		 * 2. Explicitly unmap pages after eviction.
+		 *    drm_gpusvm_range_evict clears has_dma_mapping via the MMU
+		 *    notifier ONLY when a migration actually occurs.  On a
+		 *    second recovery attempt the pages may already be in SRAM
+		 *    (no migration, no notifier), leaving has_dma_mapping true
+		 *    with stale VRAM entries in dma_addr.
+		 *    drm_gpusvm_range_unmap_pages clears this unconditionally,
+		 *    guaranteeing that drm_gpusvm_get_pages takes the full HMM
+		 *    path and returns fresh SRAM DMA entries.
+		 *
+		 * 3. Use goto retry (not goto get_pages) to re-lookup the
+		 *    range with fresh dpagemap and device_private_page_owner.
+		 *    After eviction the notifier sets tile_invalidated so
+		 *    xe_svm_range_is_valid returns false and we proceed to
+		 *    get_pages.  --migrate_try_count becomes -1 (< 0) at
+		 *    retry, skipping VRAM re-migration.
+		 */
+		range_debug(range, "PAGE FAULT - EVICT PARTIAL VRAM RETRY");
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, &range->base,
+				&ctx);
+		ctx.timeslice_ms <<= 1; /* Double timeslice if we have to retry */
+		ctx.devmem_only = false;
+		ctx.devmem_possible = false;
+		ctx.check_pages_threshold = 0;
+		migrate_try_count = 0;
+		goto retry;
+	}
+
 	return err;
 }
 
@@ -1695,6 +1774,21 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 	return drm_pagemap_addr_encode(addr, prot, order, dir);
 }
 
+static struct drm_pagemap_addr
+xe_drm_pagemap_peer_map(struct drm_pagemap *dpagemap,
+			struct device *dev,
+			struct page *page,
+			unsigned int order,
+			enum dma_data_direction dir)
+{
+        dma_addr_t addr = dma_map_resource(dev,
+					   xe_page_to_pcie(page),
+					   PAGE_SIZE << order, dir,
+					   DMA_ATTR_SKIP_CPU_SYNC);
+
+	return drm_pagemap_addr_encode(addr, XE_INTERCONNECT_P2P, order, dir);
+}
+
 static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
 					struct device *dev,
 					const struct drm_pagemap_addr *addr)
@@ -1742,6 +1836,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_map = xe_drm_pagemap_device_map,
+	.peer_map = xe_drm_pagemap_peer_map,
 	.device_unmap = xe_drm_pagemap_device_unmap,
 	.populate_mm = xe_drm_pagemap_populate_mm,
 	.destroy = xe_pagemap_destroy,
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 37866768d64c..d2aa888f2d03 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -346,6 +346,7 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 
 	if (q->flags & EXEC_QUEUE_FLAG_VM) {
 		struct xe_exec_queue *__q;
+#if 0
 		struct xe_tile *tile;
 		u8 id;
 
@@ -354,6 +355,18 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 			for_each_tlb_inval(i)
 				num_fence++;
 		}
+#endif
+		/* Count fences for main queue */
+		num_fence++;
+		for_each_tlb_inval(i)
+			num_fence++;
+
+		/* Count fences for main queue */
+		list_for_each_entry(__q, &q->multi_gt_list, multi_gt_link) {
+			num_fence++;
+			for_each_tlb_inval(i)
+				num_fence++;
+		}
 
 		fences = kmalloc_objs(*fences, num_fence);
 		if (!fences)
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 8a4d7134a9a7..6f03111fc8ef 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -250,6 +250,7 @@ struct drm_gpusvm_ctx {
 	unsigned int devmem_possible :1;
 	unsigned int devmem_only :1;
 	unsigned int allow_mixed :1;
+	struct drm_pagemap *local_dpagemap;
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 95eb4b66b057..414a8a19bfe7 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -87,6 +87,12 @@ struct drm_pagemap_ops {
 					      unsigned int order,
 					      enum dma_data_direction dir);
 
+	struct drm_pagemap_addr (*peer_map)(struct drm_pagemap *dpagemap,
+					    struct device *dev,
+					    struct page *page,
+					    unsigned int order,
+					    enum dma_data_direction dir);
+
 	/**
 	 * @device_unmap: Unmap a device address previously obtained using @device_map.
 	 *
-- 
2.43.0

