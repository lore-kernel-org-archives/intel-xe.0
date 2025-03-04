Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FA2C282D0
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 11:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7433210E59D;
	Tue,  4 Mar 2025 11:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2TjIyCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D9610E59D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741088299; x=1772624299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xQtpqg12IJ27lUk58EdZdFiICzstzz3xavBYZhculXQ=;
 b=L2TjIyCpwue5+DclzuphhhzqLd+p5IZAxFhkhrShtp+wwTrTeKczk6wO
 UvF9jyJvfHS4dyXnIhb2TP91k4qhB/Vwmtn/1rO9QOnPQj36Ijh+PuLR2
 k97t7R9jC5KAWRx6lkVE/RMZKPpPBRdnUjbVwIUtMyV2wr5YAal4BzVY+
 3pjqa+BwLbU7RDIn3vHEIRX3IF2jmfv7Qd07KoWCiVhdui4ew2H+YZcwf
 Jp8DSb547PpAWz9Ox34xRuheVMrDqKnssR6exi7nc4KLWwXbUoKFTafN+
 3tfKwXfgT95MCWauzQVzr9cwqF/9gCOSCkfoSN2oONyrcB5Aehfuk9egr Q==;
X-CSE-ConnectionGUID: 6A3vZgyGS+uaMAhuzinjcg==
X-CSE-MsgGUID: du3XCAu+QXCGYA2r8svVHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59413173"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="59413173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:38:19 -0800
X-CSE-ConnectionGUID: 1stnUmItQoiaaLaSHezFGA==
X-CSE-MsgGUID: DK+aFWcYRtujm8+2IM+RHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="123471667"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.227])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 03:38:17 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2 2/3] drm/xe/hmm: Don't dereference struct page pointers
 without notifier lock
Date: Tue,  4 Mar 2025 12:37:57 +0100
Message-ID: <20250304113758.67889-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
References: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
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

The pnfs that we obtain from hmm_range_fault() point to pages that
we don't have a reference on, and the guarantee that they are still
in the cpu page-tables is that the notifier lock must be held and the
notifier seqno is still valid.

So while building the sg table and marking the pages accesses / dirty
we need to hold this lock with a validated seqno.

However, the lock is reclaim tainted which makes
sg_alloc_table_from_pages_segment() unusable, since it internally
allocates memory.

Instead build the sg-table manually. For the non-iommu case
this might lead to fewer coalesces, but if that's a problem it can
be fixed up later in the resource cursor code. For the iommu case,
the whole sg-table may still be coalesced to a single contigous
device va region.

This avoids marking pages that we don't own dirty and accessed, and
it also avoid dereferencing struct pages that we don't own.

v2:
- Use assert to check whether hmm pfns are valid (Matthew Auld)
- Take into account that large pages may cross range boundaries
  (Matthew Auld)

Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: <stable@vger.kernel.org> # v6.10+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c | 119 ++++++++++++++++++++++++++++--------
 1 file changed, 93 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index c56738fa713b..93cce9e819a1 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -42,6 +42,40 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
 	}
 }
 
+static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
+		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
+{
+	unsigned long i, npages, hmm_pfn;
+	unsigned long num_chunks = 0;
+	int ret;
+
+	/* HMM docs says this is needed. */
+	ret = down_read_interruptible(notifier_sem);
+	if (ret)
+		return ret;
+
+	if (mmu_interval_read_retry(range->notifier, range->notifier_seq))
+		return -EAGAIN;
+
+	npages = xe_npages_in_range(range->start, range->end);
+	for (i = 0; i < npages;) {
+		unsigned long len;
+
+		hmm_pfn = range->hmm_pfns[i];
+		xe_assert(xe, hmm_pfn & HMM_PFN_VALID);
+
+		len = 1UL << hmm_pfn_to_map_order(hmm_pfn);
+
+		/* If order > 0 the page may extend beyond range->start */
+		len -= (hmm_pfn & ~HMM_PFN_FLAGS) & (len - 1);
+		i += len;
+		num_chunks++;
+	}
+	up_read(notifier_sem);
+
+	return sg_alloc_table(st, num_chunks, GFP_KERNEL);
+}
+
 /**
  * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
  * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
@@ -50,6 +84,7 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
  * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
  * has the pfn numbers of pages that back up this hmm address range.
  * @st: pointer to the sg table.
+ * @notifier_sem: The xe notifier lock.
  * @write: whether we write to this range. This decides dma map direction
  * for system pages. If write we map it bi-diretional; otherwise
  * DMA_TO_DEVICE
@@ -76,38 +111,41 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
  * Returns 0 if successful; -ENOMEM if fails to allocate memory
  */
 static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
-		       struct sg_table *st, bool write)
+		       struct sg_table *st,
+		       struct rw_semaphore *notifier_sem,
+		       bool write)
 {
+	unsigned long npages = xe_npages_in_range(range->start, range->end);
 	struct device *dev = xe->drm.dev;
-	struct page **pages;
-	u64 i, npages;
-	int ret;
+	struct scatterlist *sgl;
+	struct page *page;
+	unsigned long i, j;
 
-	npages = xe_npages_in_range(range->start, range->end);
-	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		return -ENOMEM;
+	lockdep_assert_held(notifier_sem);
 
-	for (i = 0; i < npages; i++) {
-		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
-		xe_assert(xe, !is_device_private_page(pages[i]));
-	}
+	i = 0;
+	for_each_sg(st->sgl, sgl, st->nents, j) {
+		unsigned long hmm_pfn, size;
 
-	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
-						xe_sg_segment_size(dev), GFP_KERNEL);
-	if (ret)
-		goto free_pages;
+		hmm_pfn = range->hmm_pfns[i];
+		page = hmm_pfn_to_page(hmm_pfn);
+		xe_assert(xe, !is_device_private_page(page));
 
-	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
-			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
-	if (ret) {
-		sg_free_table(st);
-		st = NULL;
+		size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
+		size -= page_to_pfn(page) & (size - 1);
+		i += size;
+
+		if (unlikely(j == st->nents - 1)) {
+			if (i > npages)
+				size -= (i - npages);
+			sg_mark_end(sgl);
+		}
+		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
 	}
+	xe_assert(xe, i == npages);
 
-free_pages:
-	kvfree(pages);
-	return ret;
+	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
+			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
 }
 
 /**
@@ -235,16 +273,45 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 	if (ret)
 		goto free_pfns;
 
-	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
+	if (unlikely(userptr->sg)) {
+		ret = down_write_killable(&vm->userptr.notifier_lock);
+		if (ret)
+			goto free_pfns;
+
+		xe_hmm_userptr_free_sg(uvma);
+		up_write(&vm->userptr.notifier_lock);
+	}
+
+	ret = xe_alloc_sg(vm->xe, &userptr->sgt, &hmm_range, &vm->userptr.notifier_lock);
 	if (ret)
 		goto free_pfns;
 
+	ret = down_read_interruptible(&vm->userptr.notifier_lock);
+	if (ret)
+		goto free_st;
+
+	if (mmu_interval_read_retry(hmm_range.notifier, hmm_range.notifier_seq)) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt,
+			  &vm->userptr.notifier_lock, write);
+	if (ret)
+		goto out_unlock;
+
 	xe_mark_range_accessed(&hmm_range, write);
 	userptr->sg = &userptr->sgt;
 	userptr->notifier_seq = hmm_range.notifier_seq;
+	up_read(&vm->userptr.notifier_lock);
+	kvfree(pfns);
+	return 0;
 
+out_unlock:
+	up_read(&vm->userptr.notifier_lock);
+free_st:
+	sg_free_table(&userptr->sgt);
 free_pfns:
 	kvfree(pfns);
 	return ret;
 }
-
-- 
2.48.1

