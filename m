Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72DECA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936F410E7C3;
	Wed, 27 Aug 2025 19:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBByDII/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85B10E7C3
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756324631; x=1787860631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pMHJ1KoeIhfl6HdcLEkydBXNaNsrUaFoqrdrbnMtxa0=;
 b=NBByDII/VKS8CZsBZHmePc1b1eB+4dY4JL3Sx5J6/LdKewB4sKAgqFx2
 GWcongdkKTuik+KCVaeOn/BC/2wSfzzXWsBMiaLFVEzYTbr4nWNOf+QME
 Uq6ejAPMix6cjXf4Ietub87HbbnPw2kIHY2QcCO0JK21Yff5WYDFf/zVP
 vZRmVsapBL6cznuoclqtJLPIt+zyUvfYIbQHp2dr4OtMtCy14ymdPhzuq
 MRm5c/ZYe/m9v8iD0Gx6OBERTy/0mGxJSVfQVjJ7eVmkCV6odwSnW+47E
 oR0wJjXp41CDb4fS9Ysw+iDTJHlUhZwuX3wrBrxuDRtD5XI8oMKod4D2Y w==;
X-CSE-ConnectionGUID: cR5rRvBHTgmagxu8l4i+HA==
X-CSE-MsgGUID: 2zdMszh/S4an69y4at6IWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62229461"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="62229461"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:57:10 -0700
X-CSE-ConnectionGUID: X2ttZlA2SW+5EUG/H3Ea5w==
X-CSE-MsgGUID: qShzjkZ4RtiYU4XWq4nepw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="207085944"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2] drm/xe: Enable 2M pages in xe_migrate_vram
Date: Wed, 27 Aug 2025 12:57:01 -0700
Message-Id: <20250827195701.268467-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

While here, correct build_pt_update_batch_sram to handle PAGE_SIZE > 4K.

v2:
 - Reuse build_pt_update_batch_sram (Stuart)
 - Fix build_pt_update_batch_sram for PAGE_SIZE > 4K

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 70 ++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 57e6d5a8ac39..8e0e27ce6de9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -56,6 +56,13 @@ struct xe_migrate {
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
@@ -287,6 +294,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
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
@@ -1741,13 +1754,14 @@ static u32 pte_update_cmd_size(u64 size)
 static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct xe_bb *bb, u32 pt_offset,
 				       struct drm_pagemap_addr *sram_addr,
-				       u32 size)
+				       u32 size, int level)
 {
 	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
 	u32 ptes;
 	int i = 0;
 
-	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+	ptes = DIV_ROUND_UP(size, gpu_page_size);
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
@@ -1759,22 +1773,47 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr = sram_addr[i].addr & PAGE_MASK;
+			u64 addr = sram_addr[i].addr & ~(gpu_page_size - 1);
 
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
 				       DRM_INTERCONNECT_SYSTEM);
 			xe_tile_assert(m->tile, addr);
+
+again:
 			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
 								 addr, pat_index,
-								 0, false, 0);
+								 level, false, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
-			i++;
+			if (gpu_page_size < PAGE_SIZE) {
+				addr += XE_PAGE_SIZE;
+				if (sram_addr[i].addr + PAGE_SIZE != addr)
+					goto again;
+				i++;
+			} else {
+				i += gpu_page_size / PAGE_SIZE;
+			}
 		}
 	}
 }
 
+static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr *sram_addr,
+				    unsigned long size)
+{
+	u32 large_size = (0x1 << xe_pt_shift(1));
+	unsigned long i;
+
+	for (i = 0; i < DIV_ROUND_UP(size, PAGE_SIZE); ++i) {
+		if (PAGE_SIZE << sram_addr[i].order != large_size)
+			return false;
+
+		i += large_size / PAGE_SIZE;
+	}
+
+	return true;
+}
+
 enum xe_migrate_copy_dir {
 	XE_MIGRATE_COPY_TO_VRAM,
 	XE_MIGRATE_COPY_TO_SRAM,
@@ -1804,6 +1843,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		PAGE_SIZE : 4;
 	int err;
 	unsigned long i, j;
+	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
@@ -1828,7 +1868,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	 * struct drm_pagemap_addr. Ensure this is the case even with higher
 	 * orders.
 	 */
-	for (i = 0; i < npages;) {
+	for (i = 0; !use_pde && i < npages;) {
 		unsigned int order = sram_addr[i].order;
 
 		for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
@@ -1838,16 +1878,26 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
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

