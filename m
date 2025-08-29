Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21487CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 15:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B5810EC16;
	Fri, 29 Aug 2025 15:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqMvgk7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8F810EC1F
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 15:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756481904; x=1788017904;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZFnmi54vOGrpbKSOYzrLfQqJzksIVxmSY2RoF+0E9bI=;
 b=nqMvgk7/kN8ecF2G5/ofE81EncsRRRCGnxWiHOSCEV71BMMQ0iRdSIgs
 7KrdwvHQtT9uGIiTKVFs3gY1UX9CDqKshSt1EG6nOl3xZOaMOHk90QrAY
 1Kkm/og0d15xZZSjazWuqC0N0OGb6s099Z2SgRhs0AHSoUMN1/Z4oypk5
 uNxbi44jRMhGq69Xmf4eFib9JKhdCzUyT5N0004x1lIWxFOe3sG5wy7ZF
 LBUn+WbjFZjLAWVfn0odXLM9hxneKGcbpW4WAgLc6to8mV0/UQEXleYdS
 o2usi/x18rWqGCL3Q346pq9YieoY6M+00uYd+3OgAyczlCK6UJjSCxZk4 A==;
X-CSE-ConnectionGUID: sD/61s/qRsK00vFDObQFzw==
X-CSE-MsgGUID: Nbxz2DztS4qTfjle9p25BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58477328"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58477328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:38:23 -0700
X-CSE-ConnectionGUID: 7REBDRJiQ1a5hUumKmLHZg==
X-CSE-MsgGUID: t0PlIcv6QMiNfVTnDPbfsw==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.240])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:38:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] for-CI: Replace xe_hmm with gpusvm
Date: Fri, 29 Aug 2025 16:37:17 +0100
Message-ID: <20250829153728.707899-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For CI only.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c       | 297 ++++++++++++++++++--------
 drivers/gpu/drm/xe/Kconfig         |   2 +-
 drivers/gpu/drm/xe/Kconfig.debug   |   1 +
 drivers/gpu/drm/xe/Makefile        |   2 +-
 drivers/gpu/drm/xe/xe_exec.c       |   5 +-
 drivers/gpu/drm/xe/xe_hmm.c        | 325 -----------------------------
 drivers/gpu/drm/xe/xe_hmm.h        |  18 --
 drivers/gpu/drm/xe/xe_pt.c         | 144 +++++--------
 drivers/gpu/drm/xe/xe_pt_types.h   |   2 -
 drivers/gpu/drm/xe/xe_svm.c        |  48 +++--
 drivers/gpu/drm/xe/xe_svm.h        |  63 ++++--
 drivers/gpu/drm/xe/xe_userptr.c    | 319 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_userptr.h    | 107 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c         | 324 +++-------------------------
 drivers/gpu/drm/xe/xe_vm.h         |  17 --
 drivers/gpu/drm/xe/xe_vm_madvise.c |  24 +--
 drivers/gpu/drm/xe/xe_vm_types.h   |  68 +-----
 include/drm/drm_gpusvm.h           |  64 ++++--
 18 files changed, 862 insertions(+), 968 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h
 create mode 100644 drivers/gpu/drm/xe/xe_userptr.c
 create mode 100644 drivers/gpu/drm/xe/xe_userptr.h

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index e2a9a6ae1d54..eeeeb99cfdf6 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -373,6 +373,12 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  *
  * This function initializes the GPU SVM.
  *
+ * Note: If only using the simple drm_gpusvm_pages API (get/unmap/free),
+ * then only @gpusvm, @name, and @drm are expected. However, the same base
+ * @gpusvm can also be used with both modes together in which case the full
+ * setup is needed, where the core drm_gpusvm_pages API will simply never use
+ * the other fields.
+ *
  * Return: 0 on success, a negative error code on failure.
  */
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
@@ -383,8 +389,16 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const struct drm_gpusvm_ops *ops,
 		    const unsigned long *chunk_sizes, int num_chunks)
 {
-	if (!ops->invalidate || !num_chunks)
-		return -EINVAL;
+	if (mm) {
+		if (!ops->invalidate || !num_chunks)
+			return -EINVAL;
+		mmgrab(mm);
+	} else {
+		/* No full SVM mode, only core drm_gpusvm_pages API. */
+		if (ops || num_chunks || mm_range || notifier_size ||
+		    device_private_page_owner)
+			return -EINVAL;
+	}
 
 	gpusvm->name = name;
 	gpusvm->drm = drm;
@@ -397,7 +411,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 	gpusvm->chunk_sizes = chunk_sizes;
 	gpusvm->num_chunks = num_chunks;
 
-	mmgrab(mm);
 	gpusvm->root = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpusvm->notifier_list);
 
@@ -489,7 +502,8 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
 			drm_gpusvm_range_remove(gpusvm, range);
 	}
 
-	mmdrop(gpusvm->mm);
+	if (gpusvm->mm)
+		mmdrop(gpusvm->mm);
 	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
@@ -629,12 +643,41 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
 	range->itree.start = ALIGN_DOWN(fault_addr, chunk_size);
 	range->itree.last = ALIGN(fault_addr + 1, chunk_size) - 1;
 	INIT_LIST_HEAD(&range->entry);
-	range->notifier_seq = LONG_MAX;
-	range->flags.migrate_devmem = migrate_devmem ? 1 : 0;
+	range->pages.notifier_seq = LONG_MAX;
+	range->pages.flags.migrate_devmem = migrate_devmem ? 1 : 0;
 
 	return range;
 }
 
+/**
+ * drm_gpusvm_hmm_pfn_to_order() - Get the largest CPU mapping order.
+ * @hmm_pfn: The current hmm_pfn.
+ * @hmm_pfn_index: Index of the @hmm_pfn within the pfn array.
+ * @npages: Number of pages within the pfn array i.e the hmm range size.
+ *
+ * To allow skipping PFNs with the same flags (like when they belong to
+ * the same huge PTE) when looping over the pfn array, take a given a hmm_pfn,
+ * and return the largest order that will fit inside the CPU PTE, but also
+ * crucially accounting for the original hmm range boundaries.
+ *
+ * Return: The largest order that will safely fit within the size of the hmm_pfn
+ * CPU PTE.
+ */
+static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
+						unsigned long hmm_pfn_index,
+						unsigned long npages)
+{
+	unsigned long size;
+
+	size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
+	size -= (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
+	hmm_pfn_index += size;
+	if (hmm_pfn_index > npages)
+		size -= (hmm_pfn_index - npages);
+
+	return ilog2(size);
+}
+
 /**
  * drm_gpusvm_check_pages() - Check pages
  * @gpusvm: Pointer to the GPU SVM structure
@@ -693,7 +736,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
 			err = -EFAULT;
 			goto err_free;
 		}
-		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
+		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 	}
 
 err_free:
@@ -951,31 +994,31 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
 
 /**
- * __drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
+ * __drm_gpusvm_unmap_pages() - Unmap pages associated with GPU SVM pages (internal)
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
  * @npages: Number of pages to unmap
  *
- * This function unmap pages associated with a GPU SVM range. Assumes and
+ * This function unmap pages associated with a GPU SVM pages struct. Assumes and
  * asserts correct locking is in place when called.
  */
-static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
-					   struct drm_gpusvm_range *range,
-					   unsigned long npages)
+static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
+				     struct drm_gpusvm_pages *svm_pages,
+				     unsigned long npages)
 {
-	unsigned long i, j;
-	struct drm_pagemap *dpagemap = range->dpagemap;
+	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
 	struct device *dev = gpusvm->drm->dev;
+	unsigned long i, j;
 
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
-	if (range->flags.has_dma_mapping) {
-		struct drm_gpusvm_range_flags flags = {
-			.__flags = range->flags.__flags,
+	if (svm_pages->flags.has_dma_mapping) {
+		struct drm_gpusvm_pages_flags flags = {
+			.__flags = svm_pages->flags.__flags,
 		};
 
 		for (i = 0, j = 0; i < npages; j++) {
-			struct drm_pagemap_addr *addr = &range->dma_addr[j];
+			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
 
 			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
 				dma_unmap_page(dev,
@@ -991,30 +1034,51 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
 		flags.has_devmem_pages = false;
 		flags.has_dma_mapping = false;
-		WRITE_ONCE(range->flags.__flags, flags.__flags);
+		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
-		range->dpagemap = NULL;
+		svm_pages->dpagemap = NULL;
 	}
 }
 
 /**
- * drm_gpusvm_range_free_pages() - Free pages associated with a GPU SVM range
+ * __drm_gpusvm_free_pages() - Free dma array associated with GPU SVM pages
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
  *
  * This function frees the dma address array associated with a GPU SVM range.
  */
-static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
-					struct drm_gpusvm_range *range)
+static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
+				    struct drm_gpusvm_pages *svm_pages)
 {
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
-	if (range->dma_addr) {
-		kvfree(range->dma_addr);
-		range->dma_addr = NULL;
+	if (svm_pages->dma_addr) {
+		kvfree(svm_pages->dma_addr);
+		svm_pages->dma_addr = NULL;
 	}
 }
 
+/**
+ * drm_gpusvm_free_pages() - Free dma-mapping associated with GPU SVM pages
+ * struct
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
+ * @npages: Number of mapped pages
+ *
+ * This function unmaps and frees the dma address array associated with a GPU
+ * SVM pages struct.
+ */
+void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
+			   struct drm_gpusvm_pages *svm_pages,
+			   unsigned long npages)
+{
+	drm_gpusvm_notifier_lock(gpusvm);
+	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
+	__drm_gpusvm_free_pages(gpusvm, svm_pages);
+	drm_gpusvm_notifier_unlock(gpusvm);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_free_pages);
+
 /**
  * drm_gpusvm_range_remove() - Remove GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1040,8 +1104,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
 		return;
 
 	drm_gpusvm_notifier_lock(gpusvm);
-	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
-	drm_gpusvm_range_free_pages(gpusvm, range);
+	__drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages);
+	__drm_gpusvm_free_pages(gpusvm, &range->pages);
 	__drm_gpusvm_range_remove(notifier, range);
 	drm_gpusvm_notifier_unlock(gpusvm);
 
@@ -1106,6 +1170,28 @@ void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
 
+/**
+ * drm_gpusvm_pages_valid() - GPU SVM range pages valid
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
+ *
+ * This function determines if a GPU SVM range pages are valid. Expected be
+ * called holding gpusvm->notifier_lock and as the last step before committing a
+ * GPU binding. This is akin to a notifier seqno check in the HMM documentation
+ * but due to wider notifiers (i.e., notifiers which span multiple ranges) this
+ * function is required for finer grained checking (i.e., per range) if pages
+ * are valid.
+ *
+ * Return: True if GPU SVM range has valid pages, False otherwise
+ */
+static bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
+				   struct drm_gpusvm_pages *svm_pages)
+{
+	lockdep_assert_held(&gpusvm->notifier_lock);
+
+	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
+}
+
 /**
  * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1123,9 +1209,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
 bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 				  struct drm_gpusvm_range *range)
 {
-	lockdep_assert_held(&gpusvm->notifier_lock);
-
-	return range->flags.has_devmem_pages || range->flags.has_dma_mapping;
+	return drm_gpusvm_pages_valid(gpusvm, &range->pages);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
@@ -1139,66 +1223,71 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
  *
  * Return: True if GPU SVM range has valid pages, False otherwise
  */
-static bool
-drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
-				      struct drm_gpusvm_range *range)
+static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
+					    struct drm_gpusvm_pages *svm_pages)
 {
 	bool pages_valid;
 
-	if (!range->dma_addr)
+	if (!svm_pages->dma_addr)
 		return false;
 
 	drm_gpusvm_notifier_lock(gpusvm);
-	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
+	pages_valid = drm_gpusvm_pages_valid(gpusvm, svm_pages);
 	if (!pages_valid)
-		drm_gpusvm_range_free_pages(gpusvm, range);
+		__drm_gpusvm_free_pages(gpusvm, svm_pages);
 	drm_gpusvm_notifier_unlock(gpusvm);
 
 	return pages_valid;
 }
 
 /**
- * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
+ * drm_gpusvm_get_pages() - Get pages and populate GPU SVM pages struct
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: The SVM pages to populate. This will contain the dma-addresses
+ * @mm: The mm corresponding to the CPU range
+ * @notifier: The corresponding notifier for the given CPU range
+ * @pages_start: Start CPU address for the pages
+ * @pages_end: End CPU address for the pages (exclusive)
  * @ctx: GPU SVM context
  *
- * This function gets pages for a GPU SVM range and ensures they are mapped for
- * DMA access.
+ * This function gets and maps pages for CPU range and ensures they are
+ * mapped for DMA access.
  *
  * Return: 0 on success, negative error code on failure.
  */
-int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
-			       struct drm_gpusvm_range *range,
-			       const struct drm_gpusvm_ctx *ctx)
+int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
+			 struct drm_gpusvm_pages *svm_pages,
+			 struct mm_struct *mm,
+			 struct mmu_interval_notifier *notifier,
+			 unsigned long pages_start, unsigned long pages_end,
+			 const struct drm_gpusvm_ctx *ctx)
 {
-	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
 	struct hmm_range hmm_range = {
 		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
 			HMM_PFN_REQ_WRITE),
 		.notifier = notifier,
-		.start = drm_gpusvm_range_start(range),
-		.end = drm_gpusvm_range_end(range),
+		.start = pages_start,
+		.end = pages_end,
 		.dev_private_owner = gpusvm->device_private_page_owner,
 	};
-	struct mm_struct *mm = gpusvm->mm;
 	void *zdd;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
-	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
-					       drm_gpusvm_range_end(range));
+	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
 	unsigned int order = 0;
 	unsigned long *pfns;
 	int err = 0;
 	struct dev_pagemap *pagemap;
 	struct drm_pagemap *dpagemap;
-	struct drm_gpusvm_range_flags flags;
+	struct drm_gpusvm_pages_flags flags;
+	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
+							   DMA_BIDIRECTIONAL;
 
 retry:
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
+	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
 
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
@@ -1238,7 +1327,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	 */
 	drm_gpusvm_notifier_lock(gpusvm);
 
-	flags.__flags = range->flags.__flags;
+	flags.__flags = svm_pages->flags.__flags;
 	if (flags.unmapped) {
 		drm_gpusvm_notifier_unlock(gpusvm);
 		err = -EFAULT;
@@ -1251,13 +1340,12 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		goto retry;
 	}
 
-	if (!range->dma_addr) {
+	if (!svm_pages->dma_addr) {
 		/* Unlock and restart mapping to allocate memory. */
 		drm_gpusvm_notifier_unlock(gpusvm);
-		range->dma_addr = kvmalloc_array(npages,
-						 sizeof(*range->dma_addr),
-						 GFP_KERNEL);
-		if (!range->dma_addr) {
+		svm_pages->dma_addr =
+			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
+		if (!svm_pages->dma_addr) {
 			err = -ENOMEM;
 			goto err_free;
 		}
@@ -1270,7 +1358,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	for (i = 0, j = 0; i < npages; ++j) {
 		struct page *page = hmm_pfn_to_page(pfns[i]);
 
-		order = hmm_pfn_to_map_order(pfns[i]);
+		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
 			if (zdd != page->zone_device_data && i > 0) {
@@ -1296,13 +1384,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 					goto err_unmap;
 				}
 			}
-			range->dma_addr[j] =
+			svm_pages->dma_addr[j] =
 				dpagemap->ops->device_map(dpagemap,
 							  gpusvm->drm->dev,
 							  page, order,
-							  DMA_BIDIRECTIONAL);
+							  dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev,
-					      range->dma_addr[j].addr)) {
+					      svm_pages->dma_addr[j].addr)) {
 				err = -EFAULT;
 				goto err_unmap;
 			}
@@ -1322,15 +1410,15 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
-					    DMA_BIDIRECTIONAL);
+					    dma_dir);
 			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
 				err = -EFAULT;
 				goto err_unmap;
 			}
 
-			range->dma_addr[j] = drm_pagemap_addr_encode
+			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
-				 DMA_BIDIRECTIONAL);
+				 dma_dir);
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
@@ -1339,21 +1427,21 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
 	if (pagemap) {
 		flags.has_devmem_pages = true;
-		range->dpagemap = dpagemap;
+		svm_pages->dpagemap = dpagemap;
 	}
 
 	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
-	WRITE_ONCE(range->flags.__flags, flags.__flags);
+	WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
 
 	drm_gpusvm_notifier_unlock(gpusvm);
 	kvfree(pfns);
 set_seqno:
-	range->notifier_seq = hmm_range.notifier_seq;
+	svm_pages->notifier_seq = hmm_range.notifier_seq;
 
 	return 0;
 
 err_unmap:
-	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
+	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
 	drm_gpusvm_notifier_unlock(gpusvm);
 err_free:
 	kvfree(pfns);
@@ -1361,11 +1449,62 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		goto retry;
 	return err;
 }
+EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
+
+/**
+ * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ * @ctx: GPU SVM context
+ *
+ * This function gets pages for a GPU SVM range and ensures they are mapped for
+ * DMA access.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
+			       struct drm_gpusvm_range *range,
+			       const struct drm_gpusvm_ctx *ctx)
+{
+	return drm_gpusvm_get_pages(gpusvm, &range->pages, gpusvm->mm,
+				    &range->notifier->notifier,
+				    drm_gpusvm_range_start(range),
+				    drm_gpusvm_range_end(range), ctx);
+}
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
 
+/**
+ * drm_gpusvm_unmap_pages() - Unmap GPU svm pages
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
+ * @npages: Number of pages in @svm_pages.
+ * @ctx: GPU SVM context
+ *
+ * This function unmaps pages associated with a GPU SVM pages struct. If
+ * @in_notifier is set, it is assumed that gpusvm->notifier_lock is held in
+ * write mode; if it is clear, it acquires gpusvm->notifier_lock in read mode.
+ * Must be called in the invalidate() callback of the corresponding notifier for
+ * IOMMU security model.
+ */
+void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
+			    struct drm_gpusvm_pages *svm_pages,
+			    unsigned long npages,
+			    const struct drm_gpusvm_ctx *ctx)
+{
+	if (ctx->in_notifier)
+		lockdep_assert_held_write(&gpusvm->notifier_lock);
+	else
+		drm_gpusvm_notifier_lock(gpusvm);
+
+	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
+
+	if (!ctx->in_notifier)
+		drm_gpusvm_notifier_unlock(gpusvm);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_unmap_pages);
+
 /**
  * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
- * drm_gpusvm_range_evict() - Evict GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
  * @range: Pointer to the GPU SVM range structure
  * @ctx: GPU SVM context
@@ -1383,15 +1522,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
 
-	if (ctx->in_notifier)
-		lockdep_assert_held_write(&gpusvm->notifier_lock);
-	else
-		drm_gpusvm_notifier_lock(gpusvm);
-
-	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
-
-	if (!ctx->in_notifier)
-		drm_gpusvm_notifier_unlock(gpusvm);
+	return drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages, ctx);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
 
@@ -1489,10 +1620,10 @@ void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 {
 	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
 
-	range->flags.unmapped = true;
+	range->pages.flags.unmapped = true;
 	if (drm_gpusvm_range_start(range) < mmu_range->start ||
 	    drm_gpusvm_range_end(range) > mmu_range->end)
-		range->flags.partial_unmap = true;
+		range->pages.flags.partial_unmap = true;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
 
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 714d5702dfd7..7219f6b884b6 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -40,12 +40,12 @@ config DRM_XE
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
+	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
 	select DRM_GPUVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
-	select HMM_MIRROR
 	select REGMAP if I2C
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01735c6ece8b..87902b4bd6d3 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -104,6 +104,7 @@ config DRM_XE_DEBUG_GUC
 
 config DRM_XE_USERPTR_INVAL_INJECT
        bool "Inject userptr invalidation -EINVAL errors"
+       depends on DRM_GPUSVM
        default n
        help
          Choose this option when debugging error paths that
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 987e4fe10538..f57e3d4dc6fe 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -140,8 +140,8 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_I2C)	+= xe_i2c.o
-xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
 xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
+xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 44364c042ad7..25a59b6934f6 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -19,6 +19,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
+#include "xe_svm.h"
 #include "xe_vm.h"
 
 /**
@@ -294,7 +295,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (err)
 			goto err_put_job;
 
-		err = down_read_interruptible(&vm->userptr.notifier_lock);
+		err = xe_svm_notifier_lock_interruptible(vm);
 		if (err)
 			goto err_put_job;
 
@@ -336,7 +337,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 err_repin:
 	if (!xe_vm_in_lr_mode(vm))
-		up_read(&vm->userptr.notifier_lock);
+		xe_svm_notifier_unlock(vm);
 err_put_job:
 	if (err)
 		xe_sched_job_put(job);
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
deleted file mode 100644
index 57b71956ddf4..000000000000
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ /dev/null
@@ -1,325 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2024 Intel Corporation
- */
-
-#include <linux/scatterlist.h>
-#include <linux/mmu_notifier.h>
-#include <linux/dma-mapping.h>
-#include <linux/memremap.h>
-#include <linux/swap.h>
-#include <linux/hmm.h>
-#include <linux/mm.h>
-#include "xe_hmm.h"
-#include "xe_vm.h"
-#include "xe_bo.h"
-
-static u64 xe_npages_in_range(unsigned long start, unsigned long end)
-{
-	return (end - start) >> PAGE_SHIFT;
-}
-
-static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
-		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
-{
-	unsigned long i, npages, hmm_pfn;
-	unsigned long num_chunks = 0;
-	int ret;
-
-	/* HMM docs says this is needed. */
-	ret = down_read_interruptible(notifier_sem);
-	if (ret)
-		return ret;
-
-	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
-		up_read(notifier_sem);
-		return -EAGAIN;
-	}
-
-	npages = xe_npages_in_range(range->start, range->end);
-	for (i = 0; i < npages;) {
-		unsigned long len;
-
-		hmm_pfn = range->hmm_pfns[i];
-		xe_assert(xe, hmm_pfn & HMM_PFN_VALID);
-
-		len = 1UL << hmm_pfn_to_map_order(hmm_pfn);
-
-		/* If order > 0 the page may extend beyond range->start */
-		len -= (hmm_pfn & ~HMM_PFN_FLAGS) & (len - 1);
-		i += len;
-		num_chunks++;
-	}
-	up_read(notifier_sem);
-
-	return sg_alloc_table(st, num_chunks, GFP_KERNEL);
-}
-
-/**
- * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
- * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
- * and will be used to program GPU page table later.
- * @xe: the xe device who will access the dma-address in sg table
- * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
- * has the pfn numbers of pages that back up this hmm address range.
- * @st: pointer to the sg table.
- * @notifier_sem: The xe notifier lock.
- * @write: whether we write to this range. This decides dma map direction
- * for system pages. If write we map it bi-diretional; otherwise
- * DMA_TO_DEVICE
- *
- * All the contiguous pfns will be collapsed into one entry in
- * the scatter gather table. This is for the purpose of efficiently
- * programming GPU page table.
- *
- * The dma_address in the sg table will later be used by GPU to
- * access memory. So if the memory is system memory, we need to
- * do a dma-mapping so it can be accessed by GPU/DMA.
- *
- * FIXME: This function currently only support pages in system
- * memory. If the memory is GPU local memory (of the GPU who
- * is going to access memory), we need gpu dpa (device physical
- * address), and there is no need of dma-mapping. This is TBD.
- *
- * FIXME: dma-mapping for peer gpu device to access remote gpu's
- * memory. Add this when you support p2p
- *
- * This function allocates the storage of the sg table. It is
- * caller's responsibility to free it calling sg_free_table.
- *
- * Returns 0 if successful; -ENOMEM if fails to allocate memory
- */
-static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
-		       struct sg_table *st,
-		       struct rw_semaphore *notifier_sem,
-		       bool write)
-{
-	unsigned long npages = xe_npages_in_range(range->start, range->end);
-	struct device *dev = xe->drm.dev;
-	struct scatterlist *sgl;
-	struct page *page;
-	unsigned long i, j;
-
-	lockdep_assert_held(notifier_sem);
-
-	i = 0;
-	for_each_sg(st->sgl, sgl, st->nents, j) {
-		unsigned long hmm_pfn, size;
-
-		hmm_pfn = range->hmm_pfns[i];
-		page = hmm_pfn_to_page(hmm_pfn);
-		xe_assert(xe, !is_device_private_page(page));
-
-		size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
-		size -= page_to_pfn(page) & (size - 1);
-		i += size;
-
-		if (unlikely(j == st->nents - 1)) {
-			xe_assert(xe, i >= npages);
-			if (i > npages)
-				size -= (i - npages);
-
-			sg_mark_end(sgl);
-		} else {
-			xe_assert(xe, i < npages);
-		}
-
-		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
-	}
-
-	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
-			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
-}
-
-static void xe_hmm_userptr_set_mapped(struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
-
-	lockdep_assert_held_write(&vm->lock);
-	lockdep_assert_held(&vm->userptr.notifier_lock);
-
-	mutex_lock(&userptr->unmap_mutex);
-	xe_assert(vm->xe, !userptr->mapped);
-	userptr->mapped = true;
-	mutex_unlock(&userptr->unmap_mutex);
-}
-
-void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-	struct xe_vma *vma = &uvma->vma;
-	bool write = !xe_vma_read_only(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-
-	if (!lockdep_is_held_type(&vm->userptr.notifier_lock, 0) &&
-	    !lockdep_is_held_type(&vm->lock, 0) &&
-	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
-		/* Don't unmap in exec critical section. */
-		xe_vm_assert_held(vm);
-		/* Don't unmap while mapping the sg. */
-		lockdep_assert_held(&vm->lock);
-	}
-
-	mutex_lock(&userptr->unmap_mutex);
-	if (userptr->sg && userptr->mapped)
-		dma_unmap_sgtable(xe->drm.dev, userptr->sg,
-				  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
-	userptr->mapped = false;
-	mutex_unlock(&userptr->unmap_mutex);
-}
-
-/**
- * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
- * @uvma: the userptr vma which hold the scatter gather table
- *
- * With function xe_userptr_populate_range, we allocate storage of
- * the userptr sg table. This is a helper function to free this
- * sg table, and dma unmap the address in the table.
- */
-void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-
-	xe_assert(xe_vma_vm(&uvma->vma)->xe, userptr->sg);
-	xe_hmm_userptr_unmap(uvma);
-	sg_free_table(userptr->sg);
-	userptr->sg = NULL;
-}
-
-/**
- * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
- * address range
- *
- * @uvma: userptr vma which has information of the range to populate.
- * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
- *
- * This function populate the physical pages of a virtual
- * address range. The populated physical pages is saved in
- * userptr's sg table. It is similar to get_user_pages but call
- * hmm_range_fault.
- *
- * This function also read mmu notifier sequence # (
- * mmu_interval_read_begin), for the purpose of later
- * comparison (through mmu_interval_read_retry).
- *
- * This must be called with mmap read or write lock held.
- *
- * This function allocates the storage of the userptr sg table.
- * It is caller's responsibility to free it calling sg_free_table.
- *
- * returns: 0 for success; negative error no on failure
- */
-int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
-				  bool is_mm_mmap_locked)
-{
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-	unsigned long *pfns;
-	struct xe_userptr *userptr;
-	struct xe_vma *vma = &uvma->vma;
-	u64 userptr_start = xe_vma_userptr(vma);
-	u64 userptr_end = userptr_start + xe_vma_size(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct hmm_range hmm_range = {
-		.pfn_flags_mask = 0, /* ignore pfns */
-		.default_flags = HMM_PFN_REQ_FAULT,
-		.start = userptr_start,
-		.end = userptr_end,
-		.notifier = &uvma->userptr.notifier,
-		.dev_private_owner = vm->xe,
-	};
-	bool write = !xe_vma_read_only(vma);
-	unsigned long notifier_seq;
-	u64 npages;
-	int ret;
-
-	userptr = &uvma->userptr;
-
-	if (is_mm_mmap_locked)
-		mmap_assert_locked(userptr->notifier.mm);
-
-	if (vma->gpuva.flags & XE_VMA_DESTROYED)
-		return 0;
-
-	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-	if (notifier_seq == userptr->notifier_seq)
-		return 0;
-
-	if (userptr->sg)
-		xe_hmm_userptr_free_sg(uvma);
-
-	npages = xe_npages_in_range(userptr_start, userptr_end);
-	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
-	if (unlikely(!pfns))
-		return -ENOMEM;
-
-	if (write)
-		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
-
-	if (!mmget_not_zero(userptr->notifier.mm)) {
-		ret = -EFAULT;
-		goto free_pfns;
-	}
-
-	hmm_range.hmm_pfns = pfns;
-
-	while (true) {
-		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-
-		if (!is_mm_mmap_locked)
-			mmap_read_lock(userptr->notifier.mm);
-
-		ret = hmm_range_fault(&hmm_range);
-
-		if (!is_mm_mmap_locked)
-			mmap_read_unlock(userptr->notifier.mm);
-
-		if (ret == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			continue;
-		}
-		break;
-	}
-
-	mmput(userptr->notifier.mm);
-
-	if (ret)
-		goto free_pfns;
-
-	ret = xe_alloc_sg(vm->xe, &userptr->sgt, &hmm_range, &vm->userptr.notifier_lock);
-	if (ret)
-		goto free_pfns;
-
-	ret = down_read_interruptible(&vm->userptr.notifier_lock);
-	if (ret)
-		goto free_st;
-
-	if (mmu_interval_read_retry(hmm_range.notifier, hmm_range.notifier_seq)) {
-		ret = -EAGAIN;
-		goto out_unlock;
-	}
-
-	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt,
-			  &vm->userptr.notifier_lock, write);
-	if (ret)
-		goto out_unlock;
-
-	userptr->sg = &userptr->sgt;
-	xe_hmm_userptr_set_mapped(uvma);
-	userptr->notifier_seq = hmm_range.notifier_seq;
-	up_read(&vm->userptr.notifier_lock);
-	kvfree(pfns);
-	return 0;
-
-out_unlock:
-	up_read(&vm->userptr.notifier_lock);
-free_st:
-	sg_free_table(&userptr->sgt);
-free_pfns:
-	kvfree(pfns);
-	return ret;
-}
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
deleted file mode 100644
index 0ea98d8e7bbc..000000000000
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: MIT
- *
- * Copyright © 2024 Intel Corporation
- */
-
-#ifndef _XE_HMM_H_
-#define _XE_HMM_H_
-
-#include <linux/types.h>
-
-struct xe_userptr_vma;
-
-int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
-
-void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
-
-void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma);
-#endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c129048a9a09..07ecf4132d41 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -24,6 +24,7 @@
 #include "xe_tlb_inval_job.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
+#include "xe_userptr.h"
 #include "xe_vm.h"
 
 struct xe_pt_dir {
@@ -729,7 +730,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			return -EAGAIN;
 		}
 		if (xe_svm_range_has_dma_mapping(range)) {
-			xe_res_first_dma(range->base.dma_addr, 0,
+			xe_res_first_dma(range->base.pages.dma_addr, 0,
 					 range->base.itree.last + 1 - range->base.itree.start,
 					 &curs);
 			xe_svm_range_debug(range, "BIND PREPARE - MIXED");
@@ -760,8 +761,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (!xe_vma_is_null(vma) && !range) {
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
-					xe_vma_size(vma), &curs);
+			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
+					 xe_vma_size(vma), &curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
@@ -914,7 +915,7 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	if (xe_vma_bo(vma))
 		xe_bo_assert_held(xe_vma_bo(vma));
 	else if (xe_vma_is_userptr(vma))
-		lockdep_assert_held(&xe_vma_vm(vma)->userptr.notifier_lock);
+		lockdep_assert_held(&xe_vma_vm(vma)->svm.gpusvm.notifier_lock);
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
@@ -1049,7 +1050,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	xe_pt_commit_prepare_locks_assert(vma);
 
 	if (xe_vma_is_userptr(vma))
-		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+		xe_svm_assert_held_read(vm);
 }
 
 static void xe_pt_commit(struct xe_vma *vma,
@@ -1376,6 +1377,7 @@ static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
 				     pt_update_ops, rftree);
 }
 
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
 #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
 
 static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
@@ -1406,7 +1408,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_userptr_vma *uvma;
 	unsigned long notifier_seq;
 
-	lockdep_assert_held_read(&vm->userptr.notifier_lock);
+	xe_svm_assert_held_read(vm);
 
 	if (!xe_vma_is_userptr(vma))
 		return 0;
@@ -1415,7 +1417,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_pt_userptr_inject_eagain(uvma))
 		xe_vma_userptr_force_invalidate(uvma);
 
-	notifier_seq = uvma->userptr.notifier_seq;
+	notifier_seq = uvma->userptr.pages.notifier_seq;
 
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
 				     notifier_seq))
@@ -1431,12 +1433,12 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
-			    struct xe_vm_pgtable_update_ops *pt_update)
+static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
+				struct xe_vm_pgtable_update_ops *pt_update)
 {
 	int err = 0;
 
-	lockdep_assert_held_read(&vm->userptr.notifier_lock);
+	xe_svm_assert_held_read(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -1454,9 +1456,40 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	case DRM_GPUVA_OP_UNMAP:
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va),
-					pt_update);
+		if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va))) {
+			struct xe_svm_range *range = op->map_range.range;
+			unsigned long i;
+
+			xe_assert(vm->xe,
+				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
+			xa_for_each(&op->prefetch_range.range, i, range) {
+				xe_svm_range_debug(range, "PRE-COMMIT");
+
+				if (!xe_svm_range_pages_valid(range)) {
+					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+					return -ENODATA;
+				}
+			}
+		} else {
+			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
+		}
 		break;
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
+	case DRM_GPUVA_OP_DRIVER:
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
+			struct xe_svm_range *range = op->map_range.range;
+
+			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+
+			xe_svm_range_debug(range, "PRE-COMMIT");
+
+			if (!xe_svm_range_pages_valid(range)) {
+				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+				return -EAGAIN;
+			}
+		}
+		break;
+#endif
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1464,7 +1497,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	return err;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
@@ -1477,69 +1510,18 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	if (err)
 		return err;
 
-	down_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_lock(vm);
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_check_userptr(vm, op, pt_update_ops);
+		err = op_check_svm_userptr(vm, op, pt_update_ops);
 		if (err) {
-			up_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 			break;
 		}
 	}
 
 	return err;
 }
-
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
-static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
-{
-	struct xe_vm *vm = pt_update->vops->vm;
-	struct xe_vma_ops *vops = pt_update->vops;
-	struct xe_vma_op *op;
-	unsigned long i;
-	int err;
-
-	err = xe_pt_pre_commit(pt_update);
-	if (err)
-		return err;
-
-	xe_svm_notifier_lock(vm);
-
-	list_for_each_entry(op, &vops->list, link) {
-		struct xe_svm_range *range = NULL;
-
-		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
-			continue;
-
-		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
-			xe_assert(vm->xe,
-				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
-			xa_for_each(&op->prefetch_range.range, i, range) {
-				xe_svm_range_debug(range, "PRE-COMMIT");
-
-				if (!xe_svm_range_pages_valid(range)) {
-					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-					xe_svm_notifier_unlock(vm);
-					return -ENODATA;
-				}
-			}
-		} else {
-			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
-			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
-			range = op->map_range.range;
-
-			xe_svm_range_debug(range, "PRE-COMMIT");
-
-			if (!xe_svm_range_pages_valid(range)) {
-				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-				xe_svm_notifier_unlock(vm);
-				return -EAGAIN;
-			}
-		}
-	}
-
-	return 0;
-}
 #endif
 
 struct xe_pt_stage_unbind_walk {
@@ -1843,7 +1825,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
 		++pt_update_ops->current_op;
-		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 
 		/*
 		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
@@ -1951,7 +1933,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
 	++pt_update_ops->current_op;
-	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
 	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
@@ -2199,7 +2181,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   vma->tile_invalidated & ~BIT(tile->id));
 	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
-		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+		xe_svm_assert_held_read(vm);
 		to_userptr_vma(vma)->userptr.initial_bind = true;
 	}
 
@@ -2235,7 +2217,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
 		if (xe_vma_is_userptr(vma)) {
-			lockdep_assert_held_read(&vm->userptr.notifier_lock);
+			xe_svm_assert_held_read(vm);
 
 			spin_lock(&vm->userptr.invalidated_lock);
 			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
@@ -2338,20 +2320,14 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
 	.pre_commit = xe_pt_pre_commit,
 };
 
-static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
 	.populate = xe_vm_populate_pgtable,
 	.clear = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_userptr_pre_commit,
-};
-
-#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
-static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.clear = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_svm_pre_commit,
+	.pre_commit = xe_pt_svm_userptr_pre_commit,
 };
 #else
-static const struct xe_migrate_pt_update_ops svm_migrate_ops;
+static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops;
 #endif
 
 static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q,
@@ -2389,9 +2365,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	int err = 0, i;
 	struct xe_migrate_pt_update update = {
 		.ops = pt_update_ops->needs_svm_lock ?
-			&svm_migrate_ops :
-			pt_update_ops->needs_userptr_lock ?
-			&userptr_migrate_ops :
+			&svm_userptr_migrate_ops :
 			&migrate_ops,
 		.vops = vops,
 		.tile_id = tile->id,
@@ -2533,8 +2507,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	if (pt_update_ops->needs_svm_lock)
 		xe_svm_notifier_unlock(vm);
-	if (pt_update_ops->needs_userptr_lock)
-		up_read(&vm->userptr.notifier_lock);
 
 	xe_tlb_inval_job_put(mjob);
 	xe_tlb_inval_job_put(ijob);
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 17cdd7c7e9f5..881f01e14db8 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -105,8 +105,6 @@ struct xe_vm_pgtable_update_ops {
 	u32 current_op;
 	/** @needs_svm_lock: Needs SVM lock */
 	bool needs_svm_lock;
-	/** @needs_userptr_lock: Needs userptr lock */
-	bool needs_userptr_lock;
 	/** @needs_invalidation: Needs invalidation */
 	bool needs_invalidation;
 	/**
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 76c6d74c1208..e8e7d6365dc4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -25,9 +25,9 @@ static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 	 * memory.
 	 */
 
-	struct drm_gpusvm_range_flags flags = {
+	struct drm_gpusvm_pages_flags flags = {
 		/* Pairs with WRITE_ONCE in drm_gpusvm.c */
-		.__flags = READ_ONCE(range->base.flags.__flags),
+		.__flags = READ_ONCE(range->base.pages.flags.__flags),
 	};
 
 	return flags.has_devmem_pages;
@@ -57,7 +57,7 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
-	       (r__)->base.notifier_seq,				\
+	       (r__)->base.pages.notifier_seq,				\
 	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
 	       xe_svm_range_size((r__)))
 
@@ -128,7 +128,7 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	range_debug(range, "NOTIFIER");
 
 	/* Skip if already unmapped or if no binding exist */
-	if (range->base.flags.unmapped || !range->tile_present)
+	if (range->base.pages.flags.unmapped || !range->tile_present)
 		return 0;
 
 	range_debug(range, "NOTIFIER - EXECUTE");
@@ -630,22 +630,26 @@ int xe_svm_init(struct xe_vm *vm)
 {
 	int err;
 
-	spin_lock_init(&vm->svm.garbage_collector.lock);
-	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
-	INIT_WORK(&vm->svm.garbage_collector.work,
-		  xe_svm_garbage_collector_work_func);
+	if (vm->flags & XE_VM_FLAG_FAULT_MODE) {
+		spin_lock_init(&vm->svm.garbage_collector.lock);
+		INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
+		INIT_WORK(&vm->svm.garbage_collector.work,
+			  xe_svm_garbage_collector_work_func);
 
-	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-			      current->mm, xe_svm_devm_owner(vm->xe), 0,
-			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
-			      &gpusvm_ops, fault_chunk_sizes,
-			      ARRAY_SIZE(fault_chunk_sizes));
-	if (err)
-		return err;
+		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
+				      current->mm, xe_svm_devm_owner(vm->xe), 0,
+				      vm->size,
+				      xe_modparam.svm_notifier_size * SZ_1M,
+				      &gpusvm_ops, fault_chunk_sizes,
+				      ARRAY_SIZE(fault_chunk_sizes));
+		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+	} else {
+		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
+				      &vm->xe->drm, NULL, NULL, 0, 0, 0, NULL,
+				      NULL, 0);
+	}
 
-	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
-
-	return 0;
+	return err;
 }
 
 /**
@@ -716,7 +720,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 	xe_svm_notifier_lock(vm);
 
 	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
-	       (devmem_preferred == range->base.flags.has_devmem_pages);
+	       (devmem_preferred == range->base.pages.flags.has_devmem_pages);
 
 	xe_svm_notifier_unlock(vm);
 
@@ -827,7 +831,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
-	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
+	if (!range->base.pages.flags.migrate_devmem || !preferred_region_is_vram)
 		return false;
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
@@ -884,7 +888,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
+	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem)
 		return -EACCES;
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
@@ -1221,7 +1225,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
 {
 	struct drm_pagemap *dpagemap;
 
-	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
+	xe_assert(tile_to_xe(tile), range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
 	dpagemap = tile_local_pagemap(tile);
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 9d6a8840a8b7..cef6ee7d6fe3 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -105,7 +105,7 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 {
 	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
-	return range->base.flags.has_dma_mapping;
+	return range->base.pages.flags.has_dma_mapping;
 }
 
 /**
@@ -155,19 +155,11 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 	return drm_gpusvm_range_size(&range->base);
 }
 
-#define xe_svm_assert_in_notifier(vm__) \
-	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
-
-#define xe_svm_notifier_lock(vm__)	\
-	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
-
-#define xe_svm_notifier_unlock(vm__)	\
-	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
-
 void xe_svm_flush(struct xe_vm *vm);
 
 #else
 #include <linux/interval_tree.h>
+#include "xe_vm.h"
 
 struct drm_pagemap_addr;
 struct drm_gpusvm_ctx;
@@ -184,7 +176,9 @@ struct xe_vram_region;
 struct xe_svm_range {
 	struct {
 		struct interval_tree_node itree;
-		const struct drm_pagemap_addr *dma_addr;
+		struct {
+			const struct drm_pagemap_addr *dma_addr;
+		} pages;
 	} base;
 	u32 tile_present;
 	u32 tile_invalidated;
@@ -204,12 +198,21 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 static inline
 int xe_svm_init(struct xe_vm *vm)
 {
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
+			       NULL, NULL, 0, 0, 0, NULL, NULL, 0);
+#else
 	return 0;
+#endif
 }
 
 static inline
 void xe_svm_fini(struct xe_vm *vm)
 {
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+	drm_gpusvm_fini(&vm->svm.gpusvm);
+#endif
 }
 
 static inline
@@ -326,19 +329,47 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 	return NULL;
 }
 
-#define xe_svm_assert_in_notifier(...) do {} while (0)
+static inline void xe_svm_flush(struct xe_vm *vm)
+{
+}
 #define xe_svm_range_has_dma_mapping(...) false
+#endif /* CONFIG_DRM_XE_GPUSVM */
+
+#if IS_ENABLED(CONFIG_DRM_GPUSVM) /* Need to support userptr without XE_GPUSVM */
+#define xe_svm_assert_in_notifier(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_assert_held_read(vm__) \
+	lockdep_assert_held_read(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_lock(vm__)	\
+	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
+
+#define xe_svm_notifier_lock_interruptible(vm__)	\
+	down_read_interruptible(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_unlock(vm__)	\
+	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
+
+#else
+#define xe_svm_assert_in_notifier(...) do {} while (0)
+
+static inline void xe_svm_assert_held_read(struct xe_vm *vm)
+{
+}
 
 static inline void xe_svm_notifier_lock(struct xe_vm *vm)
 {
 }
 
+static inline int xe_svm_notifier_lock_interruptible(struct xe_vm *vm)
+{
+	return 0;
+}
+
 static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
 {
 }
+#endif /* CONFIG_DRM_GPUSVM */
 
-static inline void xe_svm_flush(struct xe_vm *vm)
-{
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
new file mode 100644
index 000000000000..91d09af71ced
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_userptr.h"
+
+#include <linux/mm.h>
+
+#include "xe_trace_bo.h"
+
+/**
+ * xe_vma_userptr_check_repin() - Advisory check for repin needed
+ * @uvma: The userptr vma
+ *
+ * Check if the userptr vma has been invalidated since last successful
+ * repin. The check is advisory only and can the function can be called
+ * without the vm->svm.gpusvm.notifier_lock held. There is no guarantee that the
+ * vma userptr will remain valid after a lockless check, so typically
+ * the call needs to be followed by a proper check under the notifier_lock.
+ *
+ * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
+ */
+int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
+{
+	return mmu_interval_check_retry(&uvma->userptr.notifier,
+					uvma->userptr.pages.notifier_seq) ?
+		-EAGAIN : 0;
+}
+
+/**
+ * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
+ * that need repinning.
+ * @vm: The VM.
+ *
+ * This function checks for whether the VM has userptrs that need repinning,
+ * and provides a release-type barrier on the svm.gpusvm.notifier_lock after
+ * checking.
+ *
+ * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
+ */
+int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
+{
+	lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
+
+	return (list_empty(&vm->userptr.repin_list) &&
+		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
+}
+
+int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
+{
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+	};
+
+	lockdep_assert_held(&vm->lock);
+	xe_assert(xe, xe_vma_is_userptr(vma));
+
+	if (vma->gpuva.flags & XE_VMA_DESTROYED)
+		return 0;
+
+	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+				    uvma->userptr.notifier.mm,
+				    &uvma->userptr.notifier,
+				    xe_vma_userptr(vma),
+				    xe_vma_userptr(vma) + xe_vma_size(vma),
+				    &ctx);
+}
+
+static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vma *vma = &uvma->vma;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	struct drm_gpusvm_ctx ctx = {
+		.in_notifier = true,
+		.read_only = xe_vma_read_only(vma),
+	};
+	long err;
+
+	/*
+	 * Tell exec and rebind worker they need to repin and rebind this
+	 * userptr.
+	 */
+	if (!xe_vm_in_fault_mode(vm) &&
+	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_move_tail(&userptr->invalidate_link,
+			       &vm->userptr.invalidated);
+		spin_unlock(&vm->userptr.invalidated_lock);
+	}
+
+	/*
+	 * Preempt fences turn into schedule disables, pipeline these.
+	 * Note that even in fault mode, we need to wait for binds and
+	 * unbinds to complete, and those are attached as BOOKMARK fences
+	 * to the vm.
+	 */
+	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
+			    DMA_RESV_USAGE_BOOKKEEP);
+	dma_resv_for_each_fence_unlocked(&cursor, fence)
+		dma_fence_enable_sw_signaling(fence);
+	dma_resv_iter_end(&cursor);
+
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
+				    DMA_RESV_USAGE_BOOKKEEP,
+				    false, MAX_SCHEDULE_TIMEOUT);
+	XE_WARN_ON(err <= 0);
+
+	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+		err = xe_vm_invalidate_vma(vma);
+		XE_WARN_ON(err);
+	}
+
+	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
+}
+
+static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
+				   const struct mmu_notifier_range *range,
+				   unsigned long cur_seq)
+{
+	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	xe_assert(vm->xe, xe_vma_is_userptr(vma));
+	trace_xe_vma_userptr_invalidate(vma);
+
+	if (!mmu_notifier_range_blockable(range))
+		return false;
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
+		xe_vma_start(vma), xe_vma_size(vma));
+
+	down_write(&vm->svm.gpusvm.notifier_lock);
+	mmu_interval_set_seq(mni, cur_seq);
+
+	__vma_userptr_invalidate(vm, uvma);
+	up_write(&vm->svm.gpusvm.notifier_lock);
+	trace_xe_vma_userptr_invalidate_complete(vma);
+
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
+	.invalidate = vma_userptr_invalidate,
+};
+
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+/**
+ * xe_vma_userptr_force_invalidate() - force invalidate a userptr
+ * @uvma: The userptr vma to invalidate
+ *
+ * Perform a forced userptr invalidation for testing purposes.
+ */
+void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+
+	/* Protect against concurrent userptr pinning */
+	lockdep_assert_held(&vm->lock);
+	/* Protect against concurrent notifiers */
+	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
+	/*
+	 * Protect against concurrent instances of this function and
+	 * the critical exec sections
+	 */
+	xe_vm_assert_held(vm);
+
+	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
+				     uvma->userptr.pages.notifier_seq))
+		uvma->userptr.pages.notifier_seq -= 2;
+	__vma_userptr_invalidate(vm, uvma);
+}
+#endif
+
+int xe_vm_userptr_pin(struct xe_vm *vm)
+{
+	struct xe_userptr_vma *uvma, *next;
+	int err = 0;
+
+	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
+	lockdep_assert_held_write(&vm->lock);
+
+	/* Collect invalidated userptrs */
+	spin_lock(&vm->userptr.invalidated_lock);
+	xe_assert(vm->xe, list_empty(&vm->userptr.repin_list));
+	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
+				 userptr.invalidate_link) {
+		list_del_init(&uvma->userptr.invalidate_link);
+		list_add_tail(&uvma->userptr.repin_link,
+			      &vm->userptr.repin_list);
+	}
+	spin_unlock(&vm->userptr.invalidated_lock);
+
+	/* Pin and move to bind list */
+	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
+				 userptr.repin_link) {
+		err = xe_vma_userptr_pin_pages(uvma);
+		if (err == -EFAULT) {
+			list_del_init(&uvma->userptr.repin_link);
+			/*
+			 * We might have already done the pin once already, but
+			 * then had to retry before the re-bind happened, due
+			 * some other condition in the caller, but in the
+			 * meantime the userptr got dinged by the notifier such
+			 * that we need to revalidate here, but this time we hit
+			 * the EFAULT. In such a case make sure we remove
+			 * ourselves from the rebind list to avoid going down in
+			 * flames.
+			 */
+			if (!list_empty(&uvma->vma.combined_links.rebind))
+				list_del_init(&uvma->vma.combined_links.rebind);
+
+			/* Wait for pending binds */
+			xe_vm_lock(vm, false);
+			dma_resv_wait_timeout(xe_vm_resv(vm),
+					      DMA_RESV_USAGE_BOOKKEEP,
+					      false, MAX_SCHEDULE_TIMEOUT);
+
+			down_read(&vm->svm.gpusvm.notifier_lock);
+			err = xe_vm_invalidate_vma(&uvma->vma);
+			up_read(&vm->svm.gpusvm.notifier_lock);
+			xe_vm_unlock(vm);
+			if (err)
+				break;
+		} else {
+			if (err)
+				break;
+
+			list_del_init(&uvma->userptr.repin_link);
+			list_move_tail(&uvma->vma.combined_links.rebind,
+				       &vm->rebind_list);
+		}
+	}
+
+	if (err) {
+		down_write(&vm->svm.gpusvm.notifier_lock);
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
+					 userptr.repin_link) {
+			list_del_init(&uvma->userptr.repin_link);
+			list_move_tail(&uvma->userptr.invalidate_link,
+				       &vm->userptr.invalidated);
+		}
+		spin_unlock(&vm->userptr.invalidated_lock);
+		up_write(&vm->svm.gpusvm.notifier_lock);
+	}
+	return err;
+}
+
+/**
+ * xe_vm_userptr_check_repin() - Check whether the VM might have userptrs
+ * that need repinning.
+ * @vm: The VM.
+ *
+ * This function does an advisory check for whether the VM has userptrs that
+ * need repinning.
+ *
+ * Return: 0 if there are no indications of userptrs needing repinning,
+ * -EAGAIN if there are.
+ */
+int xe_vm_userptr_check_repin(struct xe_vm *vm)
+{
+	return (list_empty_careful(&vm->userptr.repin_list) &&
+		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
+}
+
+int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
+		     unsigned long range)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	int err;
+
+	INIT_LIST_HEAD(&userptr->invalidate_link);
+	INIT_LIST_HEAD(&userptr->repin_link);
+
+	err = mmu_interval_notifier_insert(&userptr->notifier, current->mm,
+					   start, range,
+					   &vma_userptr_notifier_ops);
+	if (err)
+		return err;
+
+	userptr->pages.notifier_seq = LONG_MAX;
+
+	return 0;
+}
+
+void xe_userptr_remove(struct xe_userptr_vma *uvma)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+	struct xe_userptr *userptr = &uvma->userptr;
+
+	drm_gpusvm_free_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+			      xe_vma_size(&uvma->vma) >> PAGE_SHIFT);
+
+	/*
+	 * Since userptr pages are not pinned, we can't remove
+	 * the notifier until we're sure the GPU is not accessing
+	 * them anymore
+	 */
+	mmu_interval_notifier_remove(&userptr->notifier);
+}
+
+void xe_userptr_destroy(struct xe_userptr_vma *uvma)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+
+	spin_lock(&vm->userptr.invalidated_lock);
+	xe_assert(vm->xe, list_empty(&uvma->userptr.repin_link));
+	list_del(&uvma->userptr.invalidate_link);
+	spin_unlock(&vm->userptr.invalidated_lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
new file mode 100644
index 000000000000..ef801234991e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_USERPTR_H_
+#define _XE_USERPTR_H_
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/scatterlist.h>
+#include <linux/spinlock.h>
+
+#include <drm/drm_gpusvm.h>
+
+struct xe_vm;
+struct xe_vma;
+struct xe_userptr_vma;
+
+/** struct xe_userptr_vm - User pointer VM level state */
+struct xe_userptr_vm {
+	/**
+	 * @userptr.repin_list: list of VMAs which are user pointers,
+	 * and needs repinning. Protected by @lock.
+	 */
+	struct list_head repin_list;
+	/**
+	 * @userptr.invalidated_lock: Protects the
+	 * @userptr.invalidated list.
+	 */
+	spinlock_t invalidated_lock;
+	/**
+	 * @userptr.invalidated: List of invalidated userptrs, not yet
+	 * picked
+	 * up for revalidation. Protected from access with the
+	 * @invalidated_lock. Removing items from the list
+	 * additionally requires @lock in write mode, and adding
+	 * items to the list requires either the @svm.gpusvm.notifier_lock in
+	 * write mode, OR @lock in write mode.
+	 */
+	struct list_head invalidated;
+};
+
+/** struct xe_userptr - User pointer */
+struct xe_userptr {
+	/** @invalidate_link: Link for the vm::userptr.invalidated list */
+	struct list_head invalidate_link;
+	/** @userptr: link into VM repin list if userptr. */
+	struct list_head repin_link;
+	/**
+	 * @pages: gpusvm pages for this user pointer.
+	 */
+	struct drm_gpusvm_pages pages;
+	/**
+	 * @notifier: MMU notifier for user pointer (invalidation call back)
+	 */
+	struct mmu_interval_notifier notifier;
+
+	/**
+	 * @initial_bind: user pointer has been bound at least once.
+	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
+	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
+	 */
+	bool initial_bind;
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+	u32 divisor;
+#endif
+};
+
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+void xe_userptr_remove(struct xe_userptr_vma *uvma);
+int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
+		     unsigned long range);
+void xe_userptr_destroy(struct xe_userptr_vma *uvma);
+
+int xe_vm_userptr_pin(struct xe_vm *vm);
+int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
+int xe_vm_userptr_check_repin(struct xe_vm *vm);
+int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
+int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
+#else
+static inline void xe_userptr_remove(struct xe_userptr_vma *uvma) {}
+
+static inline int xe_userptr_setup(struct xe_userptr_vma *uvma,
+				   unsigned long start, unsigned long range)
+{
+	return -ENODEV;
+}
+
+static inline void xe_userptr_destroy(struct xe_userptr_vma *uvma) {}
+
+static inline int xe_vm_userptr_pin(struct xe_vm *vm) { return 0; }
+static inline int __xe_vm_userptr_needs_repin(struct xe_vm *vm) { return 0; }
+static inline int xe_vm_userptr_check_repin(struct xe_vm *vm) { return 0; }
+static inline int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma) { return -ENODEV; }
+static inline int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma) { return -ENODEV; };
+#endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
+#else
+static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
+{
+}
+#endif
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3ff3c67aa79d..49a0cc0ab6c7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -41,44 +41,12 @@
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
-#include "xe_hmm.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
 	return vm->gpuvm.r_obj;
 }
 
-/**
- * xe_vma_userptr_check_repin() - Advisory check for repin needed
- * @uvma: The userptr vma
- *
- * Check if the userptr vma has been invalidated since last successful
- * repin. The check is advisory only and can the function can be called
- * without the vm->userptr.notifier_lock held. There is no guarantee that the
- * vma userptr will remain valid after a lockless check, so typically
- * the call needs to be followed by a proper check under the notifier_lock.
- *
- * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
- */
-int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
-{
-	return mmu_interval_check_retry(&uvma->userptr.notifier,
-					uvma->userptr.notifier_seq) ?
-		-EAGAIN : 0;
-}
-
-int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
-{
-	struct xe_vma *vma = &uvma->vma;
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-
-	lockdep_assert_held(&vm->lock);
-	xe_assert(xe, xe_vma_is_userptr(vma));
-
-	return xe_hmm_userptr_populate_range(uvma, false);
-}
-
 static bool preempt_fences_waiting(struct xe_vm *vm)
 {
 	struct xe_exec_queue *q;
@@ -250,7 +218,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	++vm->preempt.num_exec_queues;
 	q->lr.pfence = pfence;
 
-	down_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_lock(vm);
 
 	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
 				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
@@ -264,7 +232,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	if (wait)
 		dma_fence_enable_sw_signaling(pfence);
 
-	up_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_unlock(vm);
 
 out_fini:
 	drm_exec_fini(exec);
@@ -300,25 +268,6 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_write(&vm->lock);
 }
 
-/**
- * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
- * that need repinning.
- * @vm: The VM.
- *
- * This function checks for whether the VM has userptrs that need repinning,
- * and provides a release-type barrier on the userptr.notifier_lock after
- * checking.
- *
- * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
- */
-int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
-{
-	lockdep_assert_held_read(&vm->userptr.notifier_lock);
-
-	return (list_empty(&vm->userptr.repin_list) &&
-		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
-}
-
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
 /**
@@ -547,9 +496,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
 	__xe_vm_userptr_needs_repin(__vm))
 
-	down_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_lock(vm);
 	if (retry_required(tries, vm)) {
-		up_read(&vm->userptr.notifier_lock);
+		xe_svm_notifier_unlock(vm);
 		err = -EAGAIN;
 		goto out_unlock;
 	}
@@ -563,7 +512,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	/* Point of no return. */
 	arm_preempt_fences(vm, &preempt_fences);
 	resume_and_reinstall_preempt_fences(vm, &exec);
-	up_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_unlock(vm);
 
 out_unlock:
 	drm_exec_fini(&exec);
@@ -584,203 +533,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
-static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-	struct xe_vma *vma = &uvma->vma;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
-	long err;
-
-	/*
-	 * Tell exec and rebind worker they need to repin and rebind this
-	 * userptr.
-	 */
-	if (!xe_vm_in_fault_mode(vm) &&
-	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&userptr->invalidate_link,
-			       &vm->userptr.invalidated);
-		spin_unlock(&vm->userptr.invalidated_lock);
-	}
-
-	/*
-	 * Preempt fences turn into schedule disables, pipeline these.
-	 * Note that even in fault mode, we need to wait for binds and
-	 * unbinds to complete, and those are attached as BOOKMARK fences
-	 * to the vm.
-	 */
-	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
-			    DMA_RESV_USAGE_BOOKKEEP);
-	dma_resv_for_each_fence_unlocked(&cursor, fence)
-		dma_fence_enable_sw_signaling(fence);
-	dma_resv_iter_end(&cursor);
-
-	err = dma_resv_wait_timeout(xe_vm_resv(vm),
-				    DMA_RESV_USAGE_BOOKKEEP,
-				    false, MAX_SCHEDULE_TIMEOUT);
-	XE_WARN_ON(err <= 0);
-
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
-		err = xe_vm_invalidate_vma(vma);
-		XE_WARN_ON(err);
-	}
-
-	xe_hmm_userptr_unmap(uvma);
-}
-
-static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
-				   const struct mmu_notifier_range *range,
-				   unsigned long cur_seq)
-{
-	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
-	struct xe_vma *vma = &uvma->vma;
-	struct xe_vm *vm = xe_vma_vm(vma);
-
-	xe_assert(vm->xe, xe_vma_is_userptr(vma));
-	trace_xe_vma_userptr_invalidate(vma);
-
-	if (!mmu_notifier_range_blockable(range))
-		return false;
-
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
-		xe_vma_start(vma), xe_vma_size(vma));
-
-	down_write(&vm->userptr.notifier_lock);
-	mmu_interval_set_seq(mni, cur_seq);
-
-	__vma_userptr_invalidate(vm, uvma);
-	up_write(&vm->userptr.notifier_lock);
-	trace_xe_vma_userptr_invalidate_complete(vma);
-
-	return true;
-}
-
-static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
-	.invalidate = vma_userptr_invalidate,
-};
-
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-/**
- * xe_vma_userptr_force_invalidate() - force invalidate a userptr
- * @uvma: The userptr vma to invalidate
- *
- * Perform a forced userptr invalidation for testing purposes.
- */
-void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
-{
-	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
-
-	/* Protect against concurrent userptr pinning */
-	lockdep_assert_held(&vm->lock);
-	/* Protect against concurrent notifiers */
-	lockdep_assert_held(&vm->userptr.notifier_lock);
-	/*
-	 * Protect against concurrent instances of this function and
-	 * the critical exec sections
-	 */
-	xe_vm_assert_held(vm);
-
-	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
-				     uvma->userptr.notifier_seq))
-		uvma->userptr.notifier_seq -= 2;
-	__vma_userptr_invalidate(vm, uvma);
-}
-#endif
-
-int xe_vm_userptr_pin(struct xe_vm *vm)
-{
-	struct xe_userptr_vma *uvma, *next;
-	int err = 0;
-
-	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
-	lockdep_assert_held_write(&vm->lock);
-
-	/* Collect invalidated userptrs */
-	spin_lock(&vm->userptr.invalidated_lock);
-	xe_assert(vm->xe, list_empty(&vm->userptr.repin_list));
-	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
-				 userptr.invalidate_link) {
-		list_del_init(&uvma->userptr.invalidate_link);
-		list_add_tail(&uvma->userptr.repin_link,
-			      &vm->userptr.repin_list);
-	}
-	spin_unlock(&vm->userptr.invalidated_lock);
-
-	/* Pin and move to bind list */
-	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
-				 userptr.repin_link) {
-		err = xe_vma_userptr_pin_pages(uvma);
-		if (err == -EFAULT) {
-			list_del_init(&uvma->userptr.repin_link);
-			/*
-			 * We might have already done the pin once already, but
-			 * then had to retry before the re-bind happened, due
-			 * some other condition in the caller, but in the
-			 * meantime the userptr got dinged by the notifier such
-			 * that we need to revalidate here, but this time we hit
-			 * the EFAULT. In such a case make sure we remove
-			 * ourselves from the rebind list to avoid going down in
-			 * flames.
-			 */
-			if (!list_empty(&uvma->vma.combined_links.rebind))
-				list_del_init(&uvma->vma.combined_links.rebind);
-
-			/* Wait for pending binds */
-			xe_vm_lock(vm, false);
-			dma_resv_wait_timeout(xe_vm_resv(vm),
-					      DMA_RESV_USAGE_BOOKKEEP,
-					      false, MAX_SCHEDULE_TIMEOUT);
-
-			down_read(&vm->userptr.notifier_lock);
-			err = xe_vm_invalidate_vma(&uvma->vma);
-			up_read(&vm->userptr.notifier_lock);
-			xe_vm_unlock(vm);
-			if (err)
-				break;
-		} else {
-			if (err)
-				break;
-
-			list_del_init(&uvma->userptr.repin_link);
-			list_move_tail(&uvma->vma.combined_links.rebind,
-				       &vm->rebind_list);
-		}
-	}
-
-	if (err) {
-		down_write(&vm->userptr.notifier_lock);
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
-					 userptr.repin_link) {
-			list_del_init(&uvma->userptr.repin_link);
-			list_move_tail(&uvma->userptr.invalidate_link,
-				       &vm->userptr.invalidated);
-		}
-		spin_unlock(&vm->userptr.invalidated_lock);
-		up_write(&vm->userptr.notifier_lock);
-	}
-	return err;
-}
-
-/**
- * xe_vm_userptr_check_repin() - Check whether the VM might have userptrs
- * that need repinning.
- * @vm: The VM.
- *
- * This function does an advisory check for whether the VM has userptrs that
- * need repinning.
- *
- * Return: 0 if there are no indications of userptrs needing repinning,
- * -EAGAIN if there are.
- */
-int xe_vm_userptr_check_repin(struct xe_vm *vm)
-{
-	return (list_empty_careful(&vm->userptr.repin_list) &&
-		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
-}
-
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1245,25 +997,17 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
 		if (!is_null && !is_cpu_addr_mirror) {
-			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 			u64 size = end - start + 1;
 			int err;
 
-			INIT_LIST_HEAD(&userptr->invalidate_link);
-			INIT_LIST_HEAD(&userptr->repin_link);
 			vma->gpuva.gem.offset = bo_offset_or_userptr;
-			mutex_init(&userptr->unmap_mutex);
 
-			err = mmu_interval_notifier_insert(&userptr->notifier,
-							   current->mm,
-							   xe_vma_userptr(vma), size,
-							   &vma_userptr_notifier_ops);
+			err = xe_userptr_setup(uvma, xe_vma_userptr(vma), size);
 			if (err) {
 				xe_vma_free(vma);
 				return ERR_PTR(err);
 			}
-
-			userptr->notifier_seq = LONG_MAX;
 		}
 
 		xe_vm_get(vm);
@@ -1283,18 +1027,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
-		struct xe_userptr *userptr = &uvma->userptr;
 
-		if (userptr->sg)
-			xe_hmm_userptr_free_sg(uvma);
-
-		/*
-		 * Since userptr pages are not pinned, we can't remove
-		 * the notifier until we're sure the GPU is not accessing
-		 * them anymore
-		 */
-		mmu_interval_notifier_remove(&userptr->notifier);
-		mutex_destroy(&userptr->unmap_mutex);
+		xe_userptr_remove(uvma);
 		xe_vm_put(vm);
 	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_vm_put(vm);
@@ -1331,11 +1065,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 
 	if (xe_vma_is_userptr(vma)) {
 		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
-
-		spin_lock(&vm->userptr.invalidated_lock);
-		xe_assert(vm->xe, list_empty(&to_userptr_vma(vma)->userptr.repin_link));
-		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
-		spin_unlock(&vm->userptr.invalidated_lock);
+		xe_userptr_destroy(to_userptr_vma(vma));
 	} else if (!xe_vma_is_null(vma) && !xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 
@@ -1717,7 +1447,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
-	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
@@ -1743,11 +1472,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		xe_pm_runtime_get_noresume(xe);
 	}
 
-	if (flags & XE_VM_FLAG_FAULT_MODE) {
-		err = xe_svm_init(vm);
-		if (err)
-			goto err_no_resv;
-	}
+	err = xe_svm_init(vm);
+	if (err)
+		goto err_no_resv;
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
@@ -1948,9 +1675,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		vma = gpuva_to_vma(gpuva);
 
 		if (xe_vma_has_no_bo(vma)) {
-			down_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags |= XE_VMA_DESTROYED;
-			up_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 		}
 
 		xe_vm_remove_vma(vm, vma);
@@ -1994,8 +1721,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
-	if (xe_vm_in_fault_mode(vm))
-		xe_svm_fini(vm);
+	xe_svm_fini(vm);
 
 	up_write(&vm->lock);
 
@@ -2336,9 +2062,9 @@ static const u32 region_to_mem_type[] = {
 static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 			     bool post_commit)
 {
-	down_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_lock(vm);
 	vma->gpuva.flags |= XE_VMA_DESTROYED;
-	up_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_unlock(vm);
 	if (post_commit)
 		xe_vm_remove_vma(vm, vma);
 }
@@ -2981,9 +2707,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
 		if (vma) {
-			down_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-			up_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 			if (post_commit)
 				xe_vm_insert_vma(vm, vma);
 		}
@@ -3002,9 +2728,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			xe_vma_destroy_unlocked(op->remap.next);
 		}
 		if (vma) {
-			down_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-			up_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 			if (post_commit)
 				xe_vm_insert_vma(vm, vma);
 		}
@@ -3579,6 +3305,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
+				 !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
@@ -4124,13 +3852,13 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	 */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (xe_vma_is_userptr(vma)) {
-			lockdep_assert(lockdep_is_held_type(&vm->userptr.notifier_lock, 0) ||
-				       (lockdep_is_held_type(&vm->userptr.notifier_lock, 1) &&
+			lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
+				       (lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
 					lockdep_is_held(&xe_vm_resv(vm)->lock.base)));
 
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&to_userptr_vma(vma)->userptr.notifier,
-				      to_userptr_vma(vma)->userptr.notifier_seq));
+				      to_userptr_vma(vma)->userptr.pages.notifier_seq));
 			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(vm),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b3e5bec0fa58..bec9bf89d937 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -220,12 +220,6 @@ static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 
-int xe_vm_userptr_pin(struct xe_vm *vm);
-
-int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
-
-int xe_vm_userptr_check_repin(struct xe_vm *vm);
-
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
@@ -266,10 +260,6 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 	}
 }
 
-int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
-
-int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
-
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
@@ -391,11 +381,4 @@ static inline bool xe_vm_is_validating(struct xe_vm *vm)
 #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
-#else
-static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
-{
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 09c5783ee523..9862f2498f18 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -18,9 +18,8 @@ struct xe_vmas_in_madvise_range {
 	u64 range;
 	struct xe_vma **vmas;
 	int num_vmas;
-	bool has_svm_vmas;
 	bool has_bo_vmas;
-	bool has_userptr_vmas;
+	bool has_svm_userptr_vmas;
 };
 
 static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
@@ -46,10 +45,8 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
 
 		if (xe_vma_bo(vma))
 			madvise_range->has_bo_vmas = true;
-		else if (xe_vma_is_cpu_addr_mirror(vma))
-			madvise_range->has_svm_vmas = true;
-		else if (xe_vma_is_userptr(vma))
-			madvise_range->has_userptr_vmas = true;
+		else if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_userptr(vma))
+			madvise_range->has_svm_userptr_vmas = true;
 
 		if (madvise_range->num_vmas == max_vmas) {
 			max_vmas <<= 1;
@@ -409,16 +406,10 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		}
 	}
 
-	if (madvise_range.has_userptr_vmas) {
-		err = down_read_interruptible(&vm->userptr.notifier_lock);
-		if (err)
-			goto err_fini;
-	}
-
-	if (madvise_range.has_svm_vmas) {
+	if (madvise_range.has_svm_userptr_vmas) {
 		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
 		if (err)
-			goto unlock_userptr;
+			goto err_fini;
 	}
 
 	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
@@ -426,12 +417,9 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 
 	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
 
-	if (madvise_range.has_svm_vmas)
+	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
 
-unlock_userptr:
-	if (madvise_range.has_userptr_vmas)
-		up_read(&vm->userptr.notifier_lock);
 err_fini:
 	if (madvise_range.has_bo_vmas)
 		drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index b5108d010786..f6dd964be42f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -17,6 +17,7 @@
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
+#include "xe_userptr.h"
 
 struct xe_bo;
 struct xe_svm_range;
@@ -46,37 +47,6 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 
-/** struct xe_userptr - User pointer */
-struct xe_userptr {
-	/** @invalidate_link: Link for the vm::userptr.invalidated list */
-	struct list_head invalidate_link;
-	/** @userptr: link into VM repin list if userptr. */
-	struct list_head repin_link;
-	/**
-	 * @notifier: MMU notifier for user pointer (invalidation call back)
-	 */
-	struct mmu_interval_notifier notifier;
-	/** @sgt: storage for a scatter gather table */
-	struct sg_table sgt;
-	/** @sg: allocated scatter gather table */
-	struct sg_table *sg;
-	/** @notifier_seq: notifier sequence number */
-	unsigned long notifier_seq;
-	/** @unmap_mutex: Mutex protecting dma-unmapping */
-	struct mutex unmap_mutex;
-	/**
-	 * @initial_bind: user pointer has been bound at least once.
-	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
-	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
-	 */
-	bool initial_bind;
-	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
-	bool mapped;
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-	u32 divisor;
-#endif
-};
-
 /**
  * struct xe_vma_mem_attr - memory attributes associated with vma
  */
@@ -140,10 +110,10 @@ struct xe_vma {
 
 	/**
 	 * @tile_invalidated: Tile mask of binding are invalidated for this VMA.
-	 * protected by BO's resv and for userptrs, vm->userptr.notifier_lock in
-	 * write mode for writing or vm->userptr.notifier_lock in read mode and
+	 * protected by BO's resv and for userptrs, vm->svm.gpusvm.notifier_lock in
+	 * write mode for writing or vm->svm.gpusvm.notifier_lock in read mode and
 	 * the vm->resv. For stable reading, BO's resv or userptr
-	 * vm->userptr.notifier_lock in read mode is required. Can be
+	 * vm->svm.gpusvm.notifier_lock in read mode is required. Can be
 	 * opportunistically read with READ_ONCE outside of locks.
 	 */
 	u8 tile_invalidated;
@@ -154,7 +124,7 @@ struct xe_vma {
 	/**
 	 * @tile_present: Tile mask of binding are present for this VMA.
 	 * protected by vm->lock, vm->resv and for userptrs,
-	 * vm->userptr.notifier_lock for writing. Needs either for reading,
+	 * vm->svm.gpusvm.notifier_lock for writing. Needs either for reading,
 	 * but if reading is done under the vm->lock only, it needs to be held
 	 * in write mode.
 	 */
@@ -289,33 +259,7 @@ struct xe_vm {
 	const struct xe_pt_ops *pt_ops;
 
 	/** @userptr: user pointer state */
-	struct {
-		/**
-		 * @userptr.repin_list: list of VMAs which are user pointers,
-		 * and needs repinning. Protected by @lock.
-		 */
-		struct list_head repin_list;
-		/**
-		 * @notifier_lock: protects notifier in write mode and
-		 * submission in read mode.
-		 */
-		struct rw_semaphore notifier_lock;
-		/**
-		 * @userptr.invalidated_lock: Protects the
-		 * @userptr.invalidated list.
-		 */
-		spinlock_t invalidated_lock;
-		/**
-		 * @userptr.invalidated: List of invalidated userptrs, not yet
-		 * picked
-		 * up for revalidation. Protected from access with the
-		 * @invalidated_lock. Removing items from the list
-		 * additionally requires @lock in write mode, and adding
-		 * items to the list requires either the @userptr.notifier_lock in
-		 * write mode, OR @lock in write mode.
-		 */
-		struct list_head invalidated;
-	} userptr;
+	struct xe_userptr_vm userptr;
 
 	/** @preempt: preempt state */
 	struct {
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 0e336148309d..5434048a2ca4 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -106,16 +106,16 @@ struct drm_gpusvm_notifier {
 };
 
 /**
- * struct drm_gpusvm_range_flags - Structure representing a GPU SVM range flags
+ * struct drm_gpusvm_pages_flags - Structure representing a GPU SVM pages flags
  *
- * @migrate_devmem: Flag indicating whether the range can be migrated to device memory
- * @unmapped: Flag indicating if the range has been unmapped
- * @partial_unmap: Flag indicating if the range has been partially unmapped
- * @has_devmem_pages: Flag indicating if the range has devmem pages
- * @has_dma_mapping: Flag indicating if the range has a DMA mapping
- * @__flags: Flags for range in u16 form (used for READ_ONCE)
+ * @migrate_devmem: Flag indicating whether the pages can be migrated to device memory
+ * @unmapped: Flag indicating if the pages has been unmapped
+ * @partial_unmap: Flag indicating if the pages has been partially unmapped
+ * @has_devmem_pages: Flag indicating if the pages has devmem pages
+ * @has_dma_mapping: Flag indicating if the pages has a DMA mapping
+ * @__flags: Flags for pages in u16 form (used for READ_ONCE)
  */
-struct drm_gpusvm_range_flags {
+struct drm_gpusvm_pages_flags {
 	union {
 		struct {
 			/* All flags below must be set upon creation */
@@ -130,6 +130,27 @@ struct drm_gpusvm_range_flags {
 	};
 };
 
+/**
+ * struct drm_gpusvm_pages - Structure representing a GPU SVM mapped pages
+ *
+ * @dma_addr: Device address array
+ * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
+ *            Note this is assuming only one drm_pagemap per range is allowed.
+ * @notifier_seq: Notifier sequence number of the range's pages
+ * @flags: Flags for range
+ * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
+ * @flags.unmapped: Flag indicating if the range has been unmapped
+ * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
+ * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
+ * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
+ */
+struct drm_gpusvm_pages {
+	struct drm_pagemap_addr *dma_addr;
+	struct drm_pagemap *dpagemap;
+	unsigned long notifier_seq;
+	struct drm_gpusvm_pages_flags flags;
+};
+
 /**
  * struct drm_gpusvm_range - Structure representing a GPU SVM range
  *
@@ -138,11 +159,7 @@ struct drm_gpusvm_range_flags {
  * @refcount: Reference count for the range
  * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
  * @entry: List entry to fast interval tree traversal
- * @notifier_seq: Notifier sequence number of the range's pages
- * @dma_addr: Device address array
- * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
- *            Note this is assuming only one drm_pagemap per range is allowed.
- * @flags: Flags for range
+ * @pages: The pages for this range.
  *
  * This structure represents a GPU SVM range used for tracking memory ranges
  * mapped in a DRM device.
@@ -153,10 +170,7 @@ struct drm_gpusvm_range {
 	struct kref refcount;
 	struct interval_tree_node itree;
 	struct list_head entry;
-	unsigned long notifier_seq;
-	struct drm_pagemap_addr *dma_addr;
-	struct drm_pagemap *dpagemap;
-	struct drm_gpusvm_range_flags flags;
+	struct drm_gpusvm_pages pages;
 };
 
 /**
@@ -293,6 +307,22 @@ drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 				   const struct mmu_notifier_range *mmu_range);
 
+int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
+			 struct drm_gpusvm_pages *svm_pages,
+			 struct mm_struct *mm,
+			 struct mmu_interval_notifier *notifier,
+			 unsigned long pages_start, unsigned long pages_end,
+			 const struct drm_gpusvm_ctx *ctx);
+
+void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
+			    struct drm_gpusvm_pages *svm_pages,
+			    unsigned long npages,
+			    const struct drm_gpusvm_ctx *ctx);
+
+void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
+			   struct drm_gpusvm_pages *svm_pages,
+			   unsigned long npages);
+
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
-- 
2.51.0

