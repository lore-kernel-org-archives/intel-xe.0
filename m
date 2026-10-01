Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AAECA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 03:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247A510F55B;
	Thu,  1 Oct 2026 03:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmM7PRUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B290210E121
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 03:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790825548; x=1822361548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oj61vu+tfarLJL6uSmkW5D/Rasu9NsEEjxdLC7EGLFg=;
 b=dmM7PRUlzIBeIXuqcl21YUDDBAZOMsorT3nDq42nbe/hc8ZeC7Uo1PFF
 Yovn4lrOd1xn6+k21gXskgDljYWS0CiAvGvahXP2K0ss6au1fBOLEUkto
 wRKnN53PIAkAlqfIBKcmascXG78Caxu4Y09eU+mLfHJ4F3ET4lPIysia5
 htvTA+VaONEqR6ux/avP3LCxU5wbKEI6ZGStRMYUi+y04baNWlQ5qrWAn
 NIxyUtD59oXg6WIMUtUGfZFVb4MwNv53T15pv5xs0GIQ7eBK92SKHv6Kq
 kg0XDwWEac3mqLf3u9sNfDeKbxHzwqCON/PmE2BXNVHWURsg0fgndBNTn w==;
X-CSE-ConnectionGUID: 4g2C+x8HSU6UDofduTJYlg==
X-CSE-MsgGUID: XdUF5c0ORrmA+l9uE5KPXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113362884"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="113362884"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 20:32:28 -0700
X-CSE-ConnectionGUID: q72uUp/ITvy7yUHCYD3u3Q==
X-CSE-MsgGUID: qYu1i5n7S4WQCcPS3iLH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="275909705"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 30 Sep 2026 20:32:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 2/4] drm/gpusvm: Add devmem callback to get_pages
Date: Thu,  1 Oct 2026 09:06:05 +0530
Message-ID: <20261001033602.3166274-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
References: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
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

v2
Reset last to NULL for non-devmem pages(Sashiko/Matt)

v3
Run drm_gpusvm_pages_valid_unlocked() on the map_dma path even when
devmem_fn is set, so an invalidated range's stale inline mapping is
reset.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 105 ++++++++++++++++++++++++++---------
 include/drm/drm_gpusvm.h     |   6 ++
 2 files changed, 86 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index b6c9d3a07dc8..a37b26881b73 100644
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
@@ -1774,9 +1816,20 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 
-	if (map_dma &&
-	    drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages, num_pages))
-		goto set_seqno;
+	/*
+	 * drm_gpusvm_pages_valid_unlocked() also resets any instance whose
+	 * mapping was invalidated, so it must run on the map_dma path even when
+	 * devmem_fn suppresses the fast path; otherwise a stale inline mapping
+	 * is later mistaken for a dma_addr array by drm_gpusvm_dma_map_pages().
+	 */
+	if (map_dma) {
+		bool pages_valid = drm_gpusvm_pages_valid_unlocked(gpusvm,
+								   svm_pages,
+								   num_pages);
+
+		if (!ctx->devmem_fn && pages_valid)
+			goto set_seqno;
+	}
 
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
 	if (!pfns)
@@ -1829,28 +1882,30 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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

