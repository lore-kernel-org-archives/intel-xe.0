Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B14C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 18:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01CA10EA9D;
	Thu, 28 Aug 2025 18:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJKA7lqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8A210EA9D
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756406548; x=1787942548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eQ+TgoOInLx6pSnoA8jl2txAwOHFTtQQ9mYfCXzCvRk=;
 b=bJKA7lqTjxZ22JZ6djSLUjBq0XQ4WEhC28pb6FGKVWpCUMoX61yphyzf
 t/kdxrK7w0HEi7ZsburHKJk9aZT6xAzH/fK/T8VJxCUsz5baq/3xryKbW
 4w/+IAKBRkGzF9jHCIKKk5kS73Zo5UxFsN5pTiqD5Ws4XO0t/R+tIwYdC
 JYq/P2Yk16E5x5USn2OKN4UqS7UKpeoP2J8A9Q1HLaOwLN06slixZtHAr
 Hw0VMzcHyOo+QMzpSsJQU2ks+WNd+X0PfG2k0H3N0T/kuGHweB+9fOm0u
 9R+erY2TCZXSmCPvrGLKwF0yIPTnab2kdp19bpygKAXk8qwfl9xXcq3pn g==;
X-CSE-ConnectionGUID: GC6R+hNMQQWU6rA55GklsA==
X-CSE-MsgGUID: x3eyj6S9Qz+hi1eYI5jIQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69396497"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="69396497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:42:26 -0700
X-CSE-ConnectionGUID: +uTn4CljRnqeAeHnpL7IdA==
X-CSE-MsgGUID: Nbb616guS8yPNyRAdw9uhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="170985537"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:42:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com,
	stuart.summers@intel.com
Subject: [PATCH] drm/xe: Enable 2M pages in xe_migrate_vram
Date: Thu, 28 Aug 2025 11:42:21 -0700
Message-Id: <20250828184221.919221-1-matthew.brost@intel.com>
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
v3:
 - More fixes for PAGE_SIZE > 4K, align chunk, decrement chunk as needed
 - Use stack incr var in xe_migrate_vram_use_pde (Stuart)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 71 ++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 57e6d5a8ac39..6bfda6441836 100644
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
@@ -1741,16 +1754,19 @@ static u32 pte_update_cmd_size(u64 size)
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
 
+		chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
+
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = pt_offset;
 		bb->cs[bb->len++] = 0;
@@ -1759,22 +1775,46 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
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
+				if (sram_addr[i].addr + PAGE_SIZE != addr) {
+					chunk--;
+					goto again;
+				}
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
+	unsigned long i, incr = large_size / PAGE_SIZE;;
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
@@ -1804,6 +1844,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		PAGE_SIZE : 4;
 	int err;
 	unsigned long i, j;
+	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
@@ -1828,7 +1869,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	 * struct drm_pagemap_addr. Ensure this is the case even with higher
 	 * orders.
 	 */
-	for (i = 0; i < npages;) {
+	for (i = 0; !use_pde && i < npages;) {
 		unsigned int order = sram_addr[i].order;
 
 		for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
@@ -1838,16 +1879,26 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
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

