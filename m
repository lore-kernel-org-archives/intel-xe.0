Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A108C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B41210E8B8;
	Wed, 16 Sep 2026 11:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLdlp9xl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7A10E37D
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557911; x=1821093911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9oBBCd0CV1W07dgO+JTBpO2wySshGRMJlQc3ExDRnGM=;
 b=gLdlp9xlLgjdl02V7U7KXHpTNbt+7kZDvP4F+i0oMOHsfUycrL3pcl7z
 RI2SHcTH7sfd1t4VYBecCJuRjQDuPvZEvmXycRVuVyJBDxVAA4o3zKKYz
 UIIuLgPov04iShmSPVlglrENpg2F7pg7IaUvvuL22uXHSNT9tt2dHDkuz
 OtX/qD7tV5hc0wX3imkuWHno6wwFqjwRrqUCYQtlIRelN6mT3O4+gAuPJ
 f04kXd017ysfWb1f1TfcpxVElQSbdF4Ix0WHUnPfdmlfwBInzDiFrCWbq
 JxWCUjMmebRAujaDsn6RR29pBzZjrzD3vSa2XWGtdzRVQqg7toF4cztV9 Q==;
X-CSE-ConnectionGUID: SKtGFO0yRnqFHYv1ECq4Vw==
X-CSE-MsgGUID: bigawKkkRHCRqFLnM6Bdaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89067447"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89067447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:25:11 -0700
X-CSE-ConnectionGUID: lF2y0rWLSJeo6tOl/5fnQg==
X-CSE-MsgGUID: kShuVAfGQvCANTj9QCxbRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275276314"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2026 04:25:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 2/4] drm/gpusvm: Add devmem callback to get_pages
Date: Wed, 16 Sep 2026 16:58:31 +0530
Message-ID: <20260916112828.2528881-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
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

Add an optional drm_gpusvm_ctx.devmem_fn, invoked for each device-memory
allocation backing the range's faulted pages. It runs under the notifier
lock and independently of the DMA map, so it also fires with no_dma_map.
Adjacent pages of one allocation are coalesced, so the callback must be
idempotent.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 88 ++++++++++++++++++++++++++----------
 include/drm/drm_gpusvm.h     |  6 +++
 2 files changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b6c9d3a07dc8..6cec70d6f185 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1528,7 +1528,47 @@ static bool drm_gpusvm_pages_inlinable(struct drm_gpusvm_pages *svm_pages,
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
+		    !is_device_coherent_page(page))
+			continue;
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
@@ -1536,10 +1576,10 @@ static bool drm_gpusvm_pages_inlinable(struct drm_gpusvm_pages *svm_pages,
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
@@ -1774,7 +1814,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 
-	if (map_dma &&
+	if (map_dma && !ctx->devmem_fn &&
 	    drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages, num_pages))
 		goto set_seqno;
 
@@ -1829,28 +1869,30 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
-- 
2.43.0

