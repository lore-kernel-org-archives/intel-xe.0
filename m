Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C4CD3399B
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 16:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232DB10E0E1;
	Mon, 28 Oct 2024 16:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXhKFvwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC06410E0E1
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730132388; x=1761668388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Px/CMxzhGYQukAIXHmULEJh1gJ03r3M0uvVYZCnndJE=;
 b=iXhKFvwDTMwTah4H1QlRPgHm6ZwOStgSX6GoAq5+9uk1gDJMUCq9BbF2
 c4iR5WPP4v++1Nq/PgZuQ6e0EMYT8SZdi57x/eCB0HG/1yBSUZgSZN6MX
 ZiiDSrSf/rM3bbCHY/zHXWzveZOec/CDzbQ9orEe+wVlWLsg/cAHH2P3N
 te276qeBHfYdWMfOeI9v4a1C36kdoNbAM3kJDxwrKEkWGKZK3fmpJJxCB
 rfvLtNvgQ0VGA23NMQ6vG5NnTRCRdWbfErv+ZGWHp3m4F2W1cBHQ45dcv
 IrRWCH2DOCwg5dnxUqlNsjXdQ/yyZcHcF05KjZ0a42h9LyMh/wIWFQCyF g==;
X-CSE-ConnectionGUID: l+VBT/W4TqK76d3Xqkhc7w==
X-CSE-MsgGUID: nPQiNHK0QUmZ3ecChb9trg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29699277"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29699277"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:19:47 -0700
X-CSE-ConnectionGUID: 8SVUBZbtSL+kJeBKl2kxiQ==
X-CSE-MsgGUID: S8tz/OY+QTWvj6FyrMZH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="104983928"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 09:19:45 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/2] drm/xe: keep list of system pages in xe_userptr
Date: Mon, 28 Oct 2024 17:19:26 +0100
Message-Id: <20241028161927.1157426-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZxviLOv75ISykjK8@DUT025-TGLU.fm.intel.com>
References: <ZxviLOv75ISykjK8@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

In case of accessing data provided by userptr in the driver we need to
have list of corresponding pages. This list is created by
xe_hmm_userptr_populate_range and stored in xe_userptr.sgl sg list.
Since we are not allowed to get pages from sg list, let's store them in
separate field.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c      | 52 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 2c32dc46f7d4..6fc21e04ef2e 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -44,13 +44,13 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
 }
 
 /*
- * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
- * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
+ * xe_build_sg() - build a scatter gather table for given physical pages
+ * and perform dma-map. dma-address is saved in sg table
  * and will be used to program GPU page table later.
  *
  * @xe: the xe device who will access the dma-address in sg table
- * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
- * has the pfn numbers of pages that back up this hmm address range.
+ * @pages: array of page pointers
+ * @npages: number of entries in @pages
  * @st: pointer to the sg table.
  * @write: whether we write to this range. This decides dma map direction
  * for system pages. If write we map it bi-diretional; otherwise
@@ -77,38 +77,22 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
  *
  * Returns 0 if successful; -ENOMEM if fails to allocate memory
  */
-static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
+static int xe_build_sg(struct xe_device *xe, struct page **pages, u64 npages,
 		       struct sg_table *st, bool write)
 {
 	struct device *dev = xe->drm.dev;
-	struct page **pages;
-	u64 i, npages;
 	int ret;
 
-	npages = xe_npages_in_range(range->start, range->end);
-	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		return -ENOMEM;
-
-	for (i = 0; i < npages; i++) {
-		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
-		xe_assert(xe, !is_device_private_page(pages[i]));
-	}
-
 	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
 						xe_sg_segment_size(dev), GFP_KERNEL);
 	if (ret)
-		goto free_pages;
+		return ret;
 
 	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
 			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
-	if (ret) {
+	if (ret)
 		sg_free_table(st);
-		st = NULL;
-	}
 
-free_pages:
-	kvfree(pages);
 	return ret;
 }
 
@@ -136,6 +120,8 @@ void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
 
 	sg_free_table(userptr->sg);
 	userptr->sg = NULL;
+	kvfree(userptr->pages);
+	userptr->pages = NULL;
 }
 
 /**
@@ -175,7 +161,7 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 	struct hmm_range hmm_range;
 	bool write = !xe_vma_read_only(vma);
 	unsigned long notifier_seq;
-	u64 npages;
+	u64 i, npages;
 	int ret;
 
 	userptr = &uvma->userptr;
@@ -238,9 +224,23 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 	if (ret)
 		goto free_pfns;
 
-	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
-	if (ret)
+	userptr->pages = kvmalloc_array(npages, sizeof(*userptr->pages), GFP_KERNEL);
+	if (!userptr->pages) {
+		ret = -ENOMEM;
+		goto free_pfns;
+	}
+
+	for (i = 0; i < npages; i++) {
+		userptr->pages[i] = hmm_pfn_to_page(hmm_range.hmm_pfns[i]);
+		xe_assert(vm->xe, !is_device_private_page(userptr->pages[i]));
+	}
+
+	ret = xe_build_sg(vm->xe, userptr->pages, npages, &userptr->sgt, write);
+	if (ret) {
+		kvfree(userptr->pages);
+		userptr->pages = NULL;
 		goto free_pfns;
+	}
 
 	xe_mark_range_accessed(&hmm_range, write);
 	userptr->sg = &userptr->sgt;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 557b047ebdd7..f1ec3925dea0 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -53,6 +53,8 @@ struct xe_userptr {
 	 * @notifier: MMU notifier for user pointer (invalidation call back)
 	 */
 	struct mmu_interval_notifier notifier;
+	/** @pages: pointer to array of pointers to corresponding pages */
+	struct page **pages;
 	/** @sgt: storage for a scatter gather table */
 	struct sg_table sgt;
 	/** @sg: allocated scatter gather table */
-- 
2.34.1

