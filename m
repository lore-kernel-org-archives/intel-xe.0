Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7AFC982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 12:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DC610EA73;
	Wed, 16 Sep 2026 12:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lviKBTof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3644610EA73
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789563302; x=1821099302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mjxnwoganpxw0G4KK0t4L/IvXeXWjeEGKQEpLuJdtnI=;
 b=lviKBTof0wbbJe9Ht+Y3hor4vA6Sbm5Jt8lep8OaMhWf54MBrgo9jUgy
 hm88ujZ7oToqJKDtB63MuyrQZ4LnA/2yMnuSMKJCRGOc+m7YjcIs/TtOX
 O8Mf4mEsF4Tej8NcRFKYtGHN68WR1daPchI4fHF2kqJngzxukodeY6umG
 Kmhar7wn84j9DT1ysxcJzF3QrCu/SIRxzR0an0tVQ4zdcRJXqcqjYGqQR
 xColaMTD3mdmWGBH67UF6+HE4DI3Bl3dyjcMJKvAbqyt4YlyHqRmdtj2T
 ui9BKbZ9u9LKMkPyABSZDY9w3AaZYds9+PrbkF/0iXEcZ6FJv/6ZwZK1k Q==;
X-CSE-ConnectionGUID: BfRNUmkFRBm+rWFiqIsnZA==
X-CSE-MsgGUID: JJ6Jn+V4QwuG3t35auFpgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93640715"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93640715"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 05:55:02 -0700
X-CSE-ConnectionGUID: H2S3W8qTSR6bdw4heIEUgg==
X-CSE-MsgGUID: BPjYXaUeSoe4iuRK1U2m0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269076889"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2026 05:55:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] [CI-ONLY][DONOT-REVIEW] Squash of Refresh TTM LRU on SVM
 prefetch
Date: Wed, 16 Sep 2026 18:28:23 +0530
Message-ID: <20260916125822.2605659-2-himal.prasad.ghimiray@intel.com>
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

---
 drivers/gpu/drm/drm_gpusvm.c  | 90 ++++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_pagemap.c | 15 ++++++
 drivers/gpu/drm/xe/xe_svm.c   | 53 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h   | 19 ++++++++
 drivers/gpu/drm/xe/xe_vm.c    | 10 ++++
 include/drm/drm_gpusvm.h      |  6 +++
 include/drm/drm_pagemap.h     |  7 +++
 7 files changed, 177 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b6c9d3a07dc8..a40125e720f1 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1528,7 +1528,49 @@ static bool drm_gpusvm_pages_inlinable(struct drm_gpusvm_pages *svm_pages,
 }
 
 /**
- * drm_gpusvm_dma_map_pages() - DMA map one drm_gpusvm_pages instance
+ * drm_gpusvm_walk_devmem() - Invoke the devmem callback across faulted pages
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @pfns: The already-faulted pfn array (size @npages)
+ * @npages: Number of pages in the CPU range
+ * @ctx: GPU SVM context, with a non-NULL &drm_gpusvm_ctx.devmem_fn
+ *
+ * Invoke &drm_gpusvm_ctx.devmem_fn once per contiguous run of @pfns backed by
+ * the same device-memory allocation. Must be called under the notifier lock.
+ */
+static void drm_gpusvm_walk_devmem(struct drm_gpusvm *gpusvm,
+				   unsigned long *pfns,
+				   unsigned long npages,
+				   const struct drm_gpusvm_ctx *ctx)
+{
+	struct drm_pagemap_devmem *last = NULL;
+	unsigned int order = 0;
+	unsigned long i;
+
+	lockdep_assert_held(&gpusvm->notifier_lock);
+
+	for (i = 0; i < npages; i += 1 << order) {
+		struct page *page = hmm_pfn_to_page(pfns[i]);
+		struct drm_pagemap_devmem *devmem;
+
+		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
+
+		if (!is_device_private_page(page) &&
+		    !is_device_coherent_page(page)) {
+			last = NULL;
+			continue;
+		}
+
+		devmem = drm_pagemap_page_to_devmem(page);
+		if (devmem == last)
+			continue;
+
+		last = devmem;
+		ctx->devmem_fn(devmem);
+	}
+}
+
+/**
+ * drm_gpusvm_dma_map_pages() - Walk and DMA map one drm_gpusvm_pages instance
  * @gpusvm: Pointer to the GPU SVM structure
  * @svm_pages: The SVM pages instance to populate with dma-addresses
  * @pfns: The already-faulted pfn array (size @npages)
@@ -1536,10 +1578,10 @@ static bool drm_gpusvm_pages_inlinable(struct drm_gpusvm_pages *svm_pages,
  * @ctx: GPU SVM context
  * @dma_dir: DMA data direction for the mappings
  *
- * Map the faulted @pfns into @svm_pages for DMA access through its owning
- * drm_device. Must be called under the notifier lock and only for an instance
- * without a live mapping. On failure this unwinds the partial mapping of this
- * instance before returning.
+ * Walk the faulted @pfns and map them into @svm_pages for DMA access through
+ * its owning drm_device. Must be called under the notifier lock and only for
+ * an instance without a live mapping. On failure this unwinds the partial
+ * mapping of this instance before returning.
  *
  * Return: 0 on success, negative error code on failure.
  */
@@ -1774,7 +1816,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 
-	if (map_dma &&
+	if (map_dma && !ctx->devmem_fn &&
 	    drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages, num_pages))
 		goto set_seqno;
 
@@ -1829,28 +1871,30 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		goto retry;
 	}
 
-	if (!map_dma)
-		goto done_mapping;
+	if (ctx->devmem_fn)
+		drm_gpusvm_walk_devmem(gpusvm, pfns, npages, ctx);
 
-	for (p = 0; p < num_pages; ++p) {
-		if (drm_gpusvm_pages_valid(gpusvm, &svm_pages[p]))
-			continue;
+	if (map_dma) {
+		for (p = 0; p < num_pages; ++p) {
+			if (drm_gpusvm_pages_valid(gpusvm, &svm_pages[p]))
+				continue;
 
-		err = drm_gpusvm_dma_map_pages(gpusvm, &svm_pages[p], pfns,
-					       npages, ctx, dma_dir);
-		if (err) {
-			/*
-			 * The failing instance was unwound by the helper. Keep
-			 * the ones mapped earlier: the -EAGAIN retry reuses
-			 * them, and the driver unmaps every instance with the
-			 * range on the other error paths.
-			 */
-			drm_gpusvm_notifier_unlock(gpusvm);
-			goto err_free;
+			err = drm_gpusvm_dma_map_pages(gpusvm, &svm_pages[p], pfns,
+						       npages, ctx, dma_dir);
+			if (err) {
+				/*
+				 * The failing instance was unwound by the
+				 * helper. Keep the ones mapped earlier: the
+				 * -EAGAIN retry reuses them, and the driver
+				 * unmaps every instance with the range on the
+				 * other error paths.
+				 */
+				drm_gpusvm_notifier_unlock(gpusvm);
+				goto err_free;
+			}
 		}
 	}
 
-done_mapping:
 	drm_gpusvm_notifier_unlock(gpusvm);
 	kvfree(pfns);
 set_seqno:
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 892b325fa99b..fc1a2825c807 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -1432,6 +1432,21 @@ struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
 }
 EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
 
+/**
+ * drm_pagemap_page_to_devmem() - Return the devmem allocation backing a page
+ * @page: The struct page.
+ *
+ * Return: The &drm_pagemap_devmem backing @page. Undefined if @page was not
+ * populated from a &drm_pagemap.
+ */
+struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page)
+{
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
+
+	return zdd->devmem_allocation;
+}
+EXPORT_SYMBOL_GPL(drm_pagemap_page_to_devmem);
+
 /**
  * drm_pagemap_populate_mm() - Populate a virtual range with device memory pages
  * @dpagemap: Pointer to the drm_pagemap managing the device memory
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6c3033fc4db7..8997e619874b 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
@@ -1612,6 +1613,58 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
+/**
+ * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
+ * @devmem_allocation: The device-memory allocation backing the range's pages
+ *
+ * Intended as a &drm_gpusvm_ctx.devmem_fn. Runs under the GPUSVM notifier lock;
+ * the dma-resv trylock avoids inverting against eviction/shrinker, which take
+ * dma-resv before the notifier lock. A contended BO is simply skipped.
+ */
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
+{
+	struct xe_bo *bo = to_xe_bo(devmem_allocation);
+
+	if (!dma_resv_trylock(bo->ttm.base.resv))
+		return;
+
+	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	dma_resv_unlock(bo->ttm.base.resv);
+}
+
+/**
+ * xe_svm_range_prefetch_lru_bump() - Bump the TTM LRU for an already-valid range
+ * @vm: Pointer to the struct xe_vm
+ * @vma: Pointer to the VMA covering the range
+ * @range: Pointer to the xe SVM range structure
+ * @dpagemap: Target pagemap of the prefetch, or %NULL for system memory
+ *
+ * A valid range skips migration and binding, so nothing else refreshes its
+ * backing BOs on the LRU. Re-fault the CPU pages without touching the DMA
+ * mappings (@no_dma_map) and move each backing BO to the LRU tail.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				   struct xe_svm_range *range,
+				   struct drm_pagemap *dpagemap)
+{
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+		.device_private_page_owner =
+			xe_svm_private_page_owner(vm, !dpagemap),
+		.no_dma_map = 1,
+		.devmem_fn = xe_svm_devmem_lru_bump,
+	};
+
+	guard(mutex)(&range->lock);
+
+	if (xe_svm_range_is_removed(range))
+		return 0;
+
+	return xe_svm_range_get_pages(vm, range, &ctx);
+}
+
 /**
  * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 2ef4ef026ccd..a5c2460d055a 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -128,6 +128,12 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 			   struct drm_gpusvm_ctx *ctx);
 
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
+
+int xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				   struct xe_svm_range *range,
+				   struct drm_pagemap *dpagemap);
+
 bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
 					const struct drm_pagemap *dpagemap);
 
@@ -356,6 +362,19 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return -EINVAL;
 }
 
+static inline
+void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
+{
+}
+
+static inline
+int xe_svm_range_prefetch_lru_bump(struct xe_vm *vm, struct xe_vma *vma,
+				   struct xe_svm_range *range,
+				   struct drm_pagemap *dpagemap)
+{
+	return 0;
+}
+
 static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
 {
 	return NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cc96e2b7f3a7..41eebdabe1c2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2583,6 +2583,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 						  dpagemap, &valid_pages)) {
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				xe_assert(vm->xe, valid_pages);
+
+				if (dpagemap) {
+					err = xe_svm_range_prefetch_lru_bump(vm, vma,
+									     svm_range,
+									     dpagemap);
+					if (err)
+						goto unwind_prefetch_ops;
+				}
+
 				need_put = true;
 				goto check_next_range;
 			}
@@ -3259,6 +3268,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
+	ctx.devmem_fn = xe_svm_devmem_lru_bump;
 
 	skip_threads =  op->prefetch_range.ranges_count == 1 ||
 		(!dpagemap && !(vops->flags &
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 9e35584812fd..4d31c6bba745 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -274,6 +274,11 @@ struct drm_gpusvm {
  *              pages as valid; the caller revalidates the snapshot itself, see
  *              drm_gpusvm_get_pages(). @devmem_only is rejected and no page
  *              type check is performed, so @allow_mixed has no effect.
+ * @devmem_fn: Optional callback invoked under the notifier lock, once per
+ *             contiguous run of pages backed by the same &drm_pagemap_devmem.
+ *             Must not sleep and must be idempotent, as a non-contiguous
+ *             allocation is reported more than once. Fires even with
+ *             @no_dma_map. May be NULL.
  *
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
@@ -281,6 +286,7 @@ struct drm_gpusvm_ctx {
 	void *device_private_page_owner;
 	unsigned long check_pages_threshold;
 	unsigned long timeslice_ms;
+	void (*devmem_fn)(struct drm_pagemap_devmem *devmem);
 	unsigned int in_notifier :1;
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 95eb4b66b057..376d7d400c8e 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -257,6 +257,8 @@ struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
 
 struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
 
+struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page);
+
 void drm_pagemap_put(struct drm_pagemap *dpagemap);
 
 #else
@@ -266,6 +268,11 @@ static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page
 	return NULL;
 }
 
+static inline struct drm_pagemap_devmem *drm_pagemap_page_to_devmem(struct page *page)
+{
+	return NULL;
+}
+
 static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
 {
 }
-- 
2.43.0

