Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2BACA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E8110E423;
	Tue, 29 Sep 2026 18:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cP1Xachz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC1F10EFE9
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790705430; x=1822241430;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/3RFHFR++8DLiiMnTUps9Ximqx92G8baaNg/32k1tps=;
 b=cP1XachzyfMQ42W7jRx2GCyfV1QQY4IpavmNbxV7kCm2Kr1KTiYTdMhb
 n/CKDMlhKcKZDDGKBJ+Ds/BmQIB9ZMSfLRfyUCmtxV3HGEGGEX1cqOldh
 9i3lHl9bRTBNjwf1fnoHP0Cv0lA7xchlLYapE7wErxe8h0PQ+tCEwzFU0
 rBwON9rsgJqASsL2l8SwCreeXDTxUm+QcPAT45NJNM/AaYi+AG+uwor17
 WgX96jTfIojkcdgo5659ZK8whFfreZn96cHrT5g6uy+xQk++ucvKbTwAg
 yHSx0dVdq485Tpcl3Zp+c5ZXePgo6Qi+uXL7FXbVAfEhvQXlsgz7R8HAj g==;
X-CSE-ConnectionGUID: WyFDI3y9SPWAVfPW/8uzwQ==
X-CSE-MsgGUID: O5MZYhzLRqSZGRDPG/LVdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95247046"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="95247046"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
X-CSE-ConnectionGUID: rUyCVModRJiLyK2W3lKnLw==
X-CSE-MsgGUID: 3zZSE3BtSIKyq4hhbULtqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304949136"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: Do not clear SVM device memory allocations up
 front
Date: Tue, 29 Sep 2026 11:10:24 -0700
Message-Id: <20260929181024.2743854-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929181024.2743854-1-matthew.brost@intel.com>
References: <20260929181024.2743854-1-matthew.brost@intel.com>
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

xe_drm_pagemap_populate_mm() allocates a BO to back the range being
migrated into device memory, and TTM clears it. That clear is on the GPU
page fault and SVM prefetch critical paths, and in the common case it is
immediately overwritten in its entirety by the migration itself.

Allocate the BO with XE_BO_FLAG_SKIP_CLEAR and instead deal with the
contents in xe_svm_copy(). A migration to VRAM only sources pages which
are populated on the CPU side, so if every page has a source DMA address
the copy covers the whole allocation and nothing else is needed. Only
when the migration is sparse - holes in the CPU VMA from never faulted
anonymous memory, for instance - is a clear issued, ahead of the copies,
so the uncovered pages still read as zero.

The clear walks the destination device pages, taking the extent of each
entry from its folio order since only folio heads are populated, and
coalesces physically contiguous entries into chunks of at most 8M. It
runs on the same ordered migrate queue as the copies, so it takes over
the pre-migrate fence dependency and the copies are implicitly ordered
behind it.

Assisted-by: Github-Copilot:Claude-opus-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 150 ++++++++++++++++++++++++++++++++++--
 1 file changed, 143 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index f39e647512ad..1b4d1222fbb7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -586,6 +586,124 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
 	}
 }
 
+#define XE_MIGRATE_CHUNK_SIZE	SZ_8M
+#define XE_VRAM_ADDR_INVALID	~0x0ull
+
+/**
+ * xe_svm_copy_covers_all() - Does a migration write every page?
+ * @pagemap_addr: Array of DMA information for the system side of the migration
+ * @npages: Number of pages covered by @pagemap_addr
+ *
+ * A migration to device memory only sources pages which are actually populated
+ * on the CPU side. Holes in the CPU VMA (never faulted anonymous memory, for
+ * instance) have no DMA address and leave the corresponding device pages
+ * untouched by the copy.
+ *
+ * Return: true if every page has a source address, false otherwise.
+ */
+static bool xe_svm_copy_covers_all(struct drm_pagemap_addr *pagemap_addr,
+				   unsigned long npages)
+{
+	unsigned long i;
+
+	for (i = 0; i < npages;) {
+		if (!pagemap_addr[i].addr)
+			return false;
+
+		i += NR_PAGES(pagemap_addr[i].order);
+	}
+
+	return true;
+}
+
+static int xe_svm_clear_vram_chunk(struct xe_vram_region *vr, u64 vram_addr,
+				   unsigned long npages,
+				   struct dma_fence **fence,
+				   struct dma_fence **deps)
+{
+	struct dma_fence *__fence;
+
+	vm_dbg(&vr->xe->drm, "CLEAR VRAM - 0x%016llx, NPAGES=%ld",
+	       vram_addr, npages);
+
+	__fence = xe_migrate_clear_vram(vr->migrate, npages, vram_addr, *deps);
+	if (IS_ERR(__fence))
+		return PTR_ERR(__fence);
+
+	/* Ordered queue - only the first job needs to take the dependency */
+	*deps = NULL;
+	dma_fence_put(*fence);
+	*fence = __fence;
+
+	return 0;
+}
+
+/**
+ * xe_svm_clear_vram() - Clear the device memory backing a migration
+ * @pages: Array of device pages which back the migration destination
+ * @npages: Number of pages in @pages
+ * @fence: In/out pointer to the last fence issued on the migrate queue
+ * @deps: In/out pointer to a dependency to attach to the first job issued
+ *
+ * Zero the device memory described by @pages. Entries in @pages are only
+ * populated at the head of each folio, so the extent of each entry is taken
+ * from the folio order, and physically contiguous entries are coalesced into a
+ * single clear of at most XE_MIGRATE_CHUNK_SIZE.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int xe_svm_clear_vram(struct page **pages, unsigned long npages,
+			     struct dma_fence **fence,
+			     struct dma_fence **deps)
+{
+	struct xe_vram_region *vr = NULL;
+	unsigned long i, count = 0;
+	u64 vram_addr = XE_VRAM_ADDR_INVALID;
+	int err;
+
+	for (i = 0; i < npages;) {
+		struct page *page = pages[i];
+		unsigned long nr;
+		u64 addr;
+
+		if (!page) {
+			++i;
+			continue;
+		}
+
+		if (!vr)
+			vr = xe_page_to_vr(page);
+		XE_WARN_ON(xe_page_to_vr(page) != vr);
+
+		nr = NR_PAGES(folio_order(page_folio(page)));
+		addr = xe_page_to_dpa(page);
+
+		/* Not contiguous with the pending clear, or chunk is full */
+		if (count && (addr != vram_addr + count * PAGE_SIZE ||
+			      count + nr > XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE)) {
+			err = xe_svm_clear_vram_chunk(vr, vram_addr, count,
+						      fence, deps);
+			if (err)
+				return err;
+			count = 0;
+		}
+
+		if (!count)
+			vram_addr = addr;
+		count += nr;
+		i += nr;
+	}
+
+	if (count) {
+		err = xe_svm_clear_vram_chunk(vr, vram_addr, count, fence,
+					      deps);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int xe_svm_copy(struct page **pages,
 		       struct drm_pagemap_addr *pagemap_addr,
 		       unsigned long npages, const enum xe_svm_copy_dir dir,
@@ -596,12 +714,23 @@ static int xe_svm_copy(struct page **pages,
 	struct xe_device *xe;
 	struct dma_fence *fence = NULL;
 	unsigned long i;
-#define XE_VRAM_ADDR_INVALID	~0x0ull
 	u64 vram_addr = XE_VRAM_ADDR_INVALID;
 	int err = 0, pos = 0;
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
 	ktime_t start = xe_gt_stats_ktime_get();
 
+	/*
+	 * Device memory is allocated with XE_BO_FLAG_SKIP_CLEAR, so it still
+	 * holds whatever the previous owner left behind. A copy covering every
+	 * page scrubs it, anything less has to be cleared first.
+	 */
+	if (!sram && !xe_svm_copy_covers_all(pagemap_addr, npages)) {
+		err = xe_svm_clear_vram(pages, npages, &fence,
+					&pre_migrate_fence);
+		if (err)
+			goto err_out;
+	}
+
 	/*
 	 * This flow is complex: it locates physically contiguous device pages,
 	 * derives the starting physical address, and performs a single GPU copy
@@ -617,7 +746,6 @@ static int xe_svm_copy(struct page **pages,
 		u64 __vram_addr;
 		bool match = false, chunk, last;
 
-#define XE_MIGRATE_CHUNK_SIZE	SZ_8M
 		chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
 		last = (i + 1) == npages;
 
@@ -758,8 +886,6 @@ static int xe_svm_copy(struct page **pages,
 		xe_svm_copy_us_stats_incr(gt, dir, npages, start);
 
 	return err;
-#undef XE_MIGRATE_CHUNK_SIZE
-#undef XE_VRAM_ADDR_INVALID
 }
 
 static int xe_svm_copy_to_devmem(struct page **pages,
@@ -1121,18 +1247,28 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct xe_validation_ctx vctx;
 	struct drm_exec exec;
 	struct xe_bo *bo;
+	u32 bo_flags;
 	int err = 0, idx;
 
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
+	/*
+	 * Skip the clear on device memory - xe_svm_copy() either fully
+	 * overwrites the allocation or clears it explicitly, so clearing here
+	 * is pure overhead on the page fault and prefetch paths.
+	 */
+	if (IS_DGFX(xe))
+		bo_flags = XE_BO_FLAG_VRAM(vr) | XE_BO_FLAG_SKIP_CLEAR;
+	else
+		bo_flags = XE_BO_FLAG_SYSTEM;
+	bo_flags |= XE_BO_FLAG_CPU_ADDR_MIRROR;
+
 	xe_pm_runtime_get(xe);
 
 	xe_validation_guard(&vctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
 		bo = xe_bo_create_locked(xe, NULL, NULL, end - start,
-					 ttm_bo_type_device,
-					 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
-					 XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
+					 ttm_bo_type_device, bo_flags, &exec);
 		drm_exec_retry_on_contention(&exec);
 		if (IS_ERR(bo)) {
 			err = PTR_ERR(bo);
-- 
2.34.1

