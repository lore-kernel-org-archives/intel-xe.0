Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39FCCA476
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 03:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954BF10E047;
	Mon, 13 Oct 2025 03:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMomF9sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93A810E00A
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 03:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760327178; x=1791863178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3uML2X0aDghnEAqkUgRkRkukC9pjV7j2zvczsToN17I=;
 b=DMomF9sy9/L9SNcAngztmBroYM8bYKC8p2Rlh4y7n6Cqb96mA30wbumP
 KijFa4Stm7sSqMVxlZ7glP0DaHhlIha4Pk4w4//9w2cBmkAW8uAYHlOGr
 U3wI+/MKQ2iFqUqB9j5QIZ1ydsuuuAMxu77nm4/MssUnF3k1oHEGnBGFC
 keZ+ga/N98a/n5u9zkVBNMGdQNz5TotzY6cOYIvSDz7rNfCcO2dIVZUv0
 qlSiagDF6u92Wt2UzfbaBXngK5PM3j0Or3oFP8q8lbLcSDs6wT+DHD5vd
 ASKsK66MakrYy9QB5QLocAcTvYHiEXSBJ0GKoo6uAXZnpxb0OelC2LcMo A==;
X-CSE-ConnectionGUID: Ah/hDj+WRQmpa9BQFz/8vA==
X-CSE-MsgGUID: 4HXgrgrcSuijUWWxJgTBKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62558988"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="62558988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 20:46:01 -0700
X-CSE-ConnectionGUID: jK7kRZ/nR/ql3bTYy7vraQ==
X-CSE-MsgGUID: wCIIvAJNScCEgj0lifBUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181060422"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 20:46:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.auld@intel.com, simon.richter@hogyros.de
Subject: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Date: Sun, 12 Oct 2025 20:45:55 -0700
Message-Id: <20251013034555.4121168-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013034555.4121168-1-matthew.brost@intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
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

Using 2M pages in xe_migrate_vram has two benefits: we issue fewer
instructions per 2M copy (1 vs. 512), and the cache hit rate should be
higher. This results in increased copy engine bandwidth, as shown by
benchmark IGTs.

Enable 2M pages by reserving PDEs in the migrate VM and using 2M pages
in xe_migrate_vram if the DMA address order matches 2M.

v2:
 - Reuse build_pt_update_batch_sram (Stuart)
 - Fix build_pt_update_batch_sram for PAGE_SIZE > 4K
v3:
 - More fixes for PAGE_SIZE > 4K, align chunk, decrement chunk as needed
 - Use stack incr var in xe_migrate_vram_use_pde (Stuart)
v4:
 - Split PAGE_SIZE > 4K fix out in different patch (Stuart)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 53 ++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 216fc0ec2bb7..4ca48dd1cfd8 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -57,6 +57,13 @@ struct xe_migrate {
 	u64 usm_batch_base_ofs;
 	/** @cleared_mem_ofs: VM offset of @cleared_bo. */
 	u64 cleared_mem_ofs;
+	/** @large_page_copy_ofs: VM offset of 2M pages used for large copies */
+	u64 large_page_copy_ofs;
+	/**
+	 * @large_page_copy_pdes: BO offset to writeout 2M pages (PDEs) used for
+	 * large copies
+	 */
+	u64 large_page_copy_pdes;
 	/**
 	 * @fence: dma-fence representing the last migration job batch.
 	 * Protected by @job_mutex.
@@ -288,6 +295,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			  (i + 1) * 8, u64, entry);
 	}
 
+	/* Reserve 2M PDEs */
+	level = 1;
+	m->large_page_copy_ofs = NUM_PT_SLOTS << xe_pt_shift(level);
+	m->large_page_copy_pdes = map_ofs + XE_PAGE_SIZE * level +
+		NUM_PT_SLOTS * 8;
+
 	/* Set up a 1GiB NULL mapping at 255GiB offset. */
 	level = 2;
 	xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255 * 8, u64,
@@ -1778,10 +1791,10 @@ static u32 pte_update_cmd_size(u64 size)
 static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct xe_bb *bb, u32 pt_offset,
 				       struct drm_pagemap_addr *sram_addr,
-				       u32 size)
+				       u32 size, int level)
 {
 	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
-	u64 gpu_page_size = 0x1ull << xe_pt_shift(0);
+	u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
 	u32 ptes;
 	int i = 0;
 
@@ -1808,7 +1821,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 again:
 			pte = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
 								addr, pat_index,
-								0, false, 0);
+								level, false, 0);
 			bb->cs[bb->len++] = lower_32_bits(pte);
 			bb->cs[bb->len++] = upper_32_bits(pte);
 
@@ -1826,6 +1839,19 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 	}
 }
 
+static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
+				    unsigned long size)
+{
+	u32 large_size = (0x1 << xe_pt_shift(1));
+	unsigned long i, incr = large_size / PAGE_SIZE;
+
+	for (i = 0; i < DIV_ROUND_UP(size, PAGE_SIZE); i += incr)
+		if (PAGE_SIZE << sram_addr[i].order != large_size)
+			return false;
+
+	return true;
+}
+
 enum xe_migrate_copy_dir {
 	XE_MIGRATE_COPY_TO_VRAM,
 	XE_MIGRATE_COPY_TO_SRAM,
@@ -1855,6 +1881,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		PAGE_SIZE : 4;
 	int err;
 	unsigned long i, j;
+	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
@@ -1879,7 +1906,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	 * struct drm_pagemap_addr. Ensure this is the case even with higher
 	 * orders.
 	 */
-	for (i = 0; i < npages;) {
+	for (i = 0; !use_pde && i < npages;) {
 		unsigned int order = sram_addr[i].order;
 
 		for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
@@ -1889,16 +1916,26 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		i += NR_PAGES(order);
 	}
 
-	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
-				   sram_addr, len + sram_offset);
+	if (use_pde)
+		build_pt_update_batch_sram(m, bb, m->large_page_copy_pdes,
+					   sram_addr, len + sram_offset, 1);
+	else
+		build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+					   sram_addr, len + sram_offset, 0);
 
 	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
-		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
+		if (use_pde)
+			src_L0_ofs = m->large_page_copy_ofs + sram_offset;
+		else
+			src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
 		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
 
 	} else {
 		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
-		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
+		if (use_pde)
+			dst_L0_ofs = m->large_page_copy_ofs + sram_offset;
+		else
+			dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
 	}
 
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-- 
2.34.1

