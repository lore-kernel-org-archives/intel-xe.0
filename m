Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D874CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A20112F25;
	Tue,  9 Apr 2024 20:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRHgdpv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31AE112F2A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693098; x=1744229098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sodwh7JkS1C+sOi5CEOGIWvdqTx7lxEcr3xJL04Ul6k=;
 b=kRHgdpv3HiW0U95GapPhEVv9PZ51GzOq2BH1t9LGqbXXAccNZigfsVKH
 G+j8eKxcH4kr8c9HeQMOuw/NVttQBf6QnezY+TOtSalzImPOgqDpz6NOg
 hCVlcJB7IscSHwki9DuQhHIp7cYgXqSMpOJ+FAsEnQf6xTw2Dl+oGWtDa
 SG+xyEoWqMDFoR2yBvdRC1+W/1Zn5krHBf/piOOZHcP55zuGyXTN77sZm
 6BvVouyALP9Xp/xsk/xnH8PdXqGwORGU+67kW5MXjdHMs/VK+F7bHfJgk
 nUjzqMyZjoTpxwZ4viqp5U/HVpivSFb1w1YLxX4D+FvWGZmfEvzpMukQX g==;
X-CSE-ConnectionGUID: XfpmkDLoScejgZPt32FM9g==
X-CSE-MsgGUID: 0jWiZhISQJmfACZh69mBeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803770"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803770"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:54 -0700
X-CSE-ConnectionGUID: PMuM8IOtQG2+xBCBCKZteQ==
X-CSE-MsgGUID: Ce1s2qVkRBmliQeEPsEbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773796"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Date: Tue,  9 Apr 2024 16:17:39 -0400
Message-Id: <20240409201742.3042626-29-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

Introduce a helper function xe_svm_migrate_vma_to_vram.

Since the source pages of the svm range can be physically not
contiguous, and the destination vram pages can also be not
contiguous, there is no easy way to migrate multiple pages per
blitter command. We do page by page migration for now.

Migration is best effort. Even if we fail to migrate some pages,
we will try to migrate the rest pages.

FIXME: Use one blitter command to copy when both src and dst are
physically contiguous

FIXME: when a vma is partially migrated, split vma as we assume
no mixture vma placement.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h         |   2 +
 drivers/gpu/drm/xe/xe_svm_migrate.c | 115 ++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index c9e4239c44b4..18ce2e3757c5 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -83,4 +83,6 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
 void xe_devm_free_blocks(struct list_head *blocks);
 void xe_devm_page_free(struct page *page);
 vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
+int xe_svm_migrate_vma_to_vram(struct xe_vm *vm, struct xe_vma *vma,
+							struct xe_tile *tile);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
index 0db831af098e..ab8dd1f58aa4 100644
--- a/drivers/gpu/drm/xe/xe_svm_migrate.c
+++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
@@ -220,3 +220,118 @@ vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
 	kvfree(buf);
 	return 0;
 }
+
+/**
+ * xe_svm_migrate_vma_to_vram() - migrate backing store of a vma to vram
+ * Must be called with mmap_read_lock held.
+ * @vm: the vm that the vma belongs to
+ * @vma: the vma to migrate.
+ * @tile: the destination tile which holds the new backing store of the range
+ *
+ * Returns: negative errno on faiure, 0 on success
+ */
+int xe_svm_migrate_vma_to_vram(struct xe_vm *vm,
+							struct xe_vma *vma,
+							struct xe_tile *tile)
+{
+	struct mm_struct *mm = vm->mm;
+	unsigned long start = xe_vma_start(vma);
+	unsigned long end = xe_vma_end(vma);
+	unsigned long npages = (end - start) >> PAGE_SHIFT;
+	struct xe_mem_region *mr = &tile->mem.vram;
+	struct vm_area_struct *vas;
+
+	struct migrate_vma migrate = {
+		.start		= start,
+		.end		= end,
+		.pgmap_owner	= tile->xe,
+		.flags          = MIGRATE_VMA_SELECT_SYSTEM,
+	};
+	struct device *dev = tile->xe->drm.dev;
+	dma_addr_t *src_dma_addr;
+	struct dma_fence *fence;
+	struct page *src_page;
+	LIST_HEAD(blocks);
+	int ret = 0, i;
+	u64 dst_dpa;
+	void *buf;
+
+	mmap_assert_locked(mm);
+
+	vas = find_vma_intersection(mm, start, start + 4);
+	if (!vas)
+		return -ENOENT;
+
+	migrate.vma = vas;
+	buf = kvcalloc(npages, 2* sizeof(*migrate.src) + sizeof(*src_dma_addr),
+					GFP_KERNEL);
+	if(!buf)
+		return -ENOMEM;
+	migrate.src = buf;
+	migrate.dst = migrate.src + npages;
+	src_dma_addr = (dma_addr_t *) (migrate.dst + npages);
+	ret = xe_devm_alloc_pages(tile, npages, &blocks, migrate.dst);
+	if (ret)
+		goto kfree_buf;
+
+	ret = migrate_vma_setup(&migrate);
+	if (ret) {
+		drm_err(&tile->xe->drm, "vma setup returned %d for range [%lx - %lx]\n",
+				ret, start, end);
+		goto free_dst_pages;
+	}
+
+	/**FIXME: partial migration of a range print a warning for now.
+	 * If this message is printed, we need to split xe_vma as we
+	 * don't support a mixture placement of one vma
+	 */
+	if (migrate.cpages != npages)
+		drm_warn(&tile->xe->drm, "Partial migration for range [%lx - %lx], range is %ld pages, migrate only %ld pages\n",
+				start, end, npages, migrate.cpages);
+
+	/**Migrate page by page for now.
+	 * Both source pages and destination pages can physically not contiguous,
+	 * there is no good way to migrate multiple pages per blitter command.
+	 */
+	for (i = 0; i < npages; i++) {
+		src_page = migrate_pfn_to_page(migrate.src[i]);
+		if (unlikely(!src_page || !(migrate.src[i] & MIGRATE_PFN_MIGRATE)))
+			goto free_dst_page;
+
+		xe_assert(tile->xe, !is_zone_device_page(src_page));
+		src_dma_addr[i] = dma_map_page(dev, src_page, 0, PAGE_SIZE, DMA_TO_DEVICE);
+		if (unlikely(dma_mapping_error(dev, src_dma_addr[i]))) {
+			drm_warn(&tile->xe->drm, "dma map error for host pfn %lx\n", migrate.src[i]);
+			goto free_dst_page;
+		}
+		dst_dpa = xe_mem_region_pfn_to_dpa(mr, migrate.dst[i]);
+		fence = xe_migrate_pa(tile->migrate, src_dma_addr[i], false,
+				dst_dpa, true, PAGE_SIZE);
+		if (IS_ERR(fence)) {
+			drm_warn(&tile->xe->drm, "migrate host page (pfn: %lx) to vram failed\n",
+					migrate.src[i]);
+			/**Migration is best effort. Even we failed here, we continue*/
+			goto free_dst_page;
+		}
+		/**FIXME: Use the first migration's out fence as the second migration's input fence,
+		 * and so on. Only wait the out fence of last migration?
+		 */
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+free_dst_page:
+		xe_devm_page_free(pfn_to_page(migrate.dst[i]));
+	}
+
+	for (i = 0; i < npages; i++)
+		if (!(dma_mapping_error(dev, src_dma_addr[i])))
+			dma_unmap_page(dev, src_dma_addr[i], PAGE_SIZE, DMA_TO_DEVICE);
+
+	migrate_vma_pages(&migrate);
+	migrate_vma_finalize(&migrate);
+free_dst_pages:
+	if (ret)
+		xe_devm_free_blocks(&blocks);
+kfree_buf:
+	kfree(buf);
+	return ret;
+}
-- 
2.26.3

