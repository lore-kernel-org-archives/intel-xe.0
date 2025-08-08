Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA17C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 18:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B47210E971;
	Fri,  8 Aug 2025 18:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksbqEroY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1576310E971
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 18:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754679548; x=1786215548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XXZzMsYPEJWjXOaLVmJCgv9W5F92MhgeyufvYVdyG+w=;
 b=ksbqEroYQcuGsKmGurjFPDYVYzx2rYs+BGo+iDnlPXA6gea1V/WmLRmP
 5MpJT7ojX5jMVXjn3tMdUUorI8z5MHjzGwjRDvhibVBoVPH452RdIj58m
 6Z+FafjNAoE/E4YGeFXVcPZ4siqbgLHY95mXaVL0UoJCxbuoJ4jTdhNPg
 V+XasKi5YXXcHu4HwCOL6uL0vp1wyhuEzHrUStXuieGUM7kfzoccB1orA
 7Bu3ol6R3GTAuTc/exjJOy2HwT955E5Hn4O4RQcG+dlrgOCEqzpl3wPmi
 Y0T9CgM0DpH1vmb6Gbq3UTYiSC70UDSeuwioumNmTaQBWvj+ZdnY4JcaE A==;
X-CSE-ConnectionGUID: PrGcztIsTqWTj/qYU+e6DA==
X-CSE-MsgGUID: OwI1FOUIRMmEL3y4fhG2SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="44625511"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="44625511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 11:59:08 -0700
X-CSE-ConnectionGUID: 6Vq6148uSxeH4+mb0Uwfqw==
X-CSE-MsgGUID: cF6XBgNXRsuSF9tBw4TfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165291936"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 11:59:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH] drm/xe: Enable 2M pages in xe_migrate_vram
Date: Fri,  8 Aug 2025 11:59:02 -0700
Message-Id: <20250808185902.1948431-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 82 +++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ac9f4d4988d2..9021aa3ac1e0 100644
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
@@ -289,6 +296,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
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
@@ -1740,6 +1753,40 @@ static u32 pte_update_cmd_size(u64 size)
 	return num_dword;
 }
 
+static void build_large_pt_update_batch_sram(struct xe_migrate *m,
+					     struct xe_bb *bb,
+					     struct drm_pagemap_addr *sram_addr,
+					     u32 size)
+{
+	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u32 ptes, i = 0, large_size = (0x1 << xe_pt_shift(1));
+
+	ptes = DIV_ROUND_UP(size, large_size);
+
+	bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(ptes);
+	bb->cs[bb->len++] = m->large_page_copy_pdes;
+	bb->cs[bb->len++] = 0;
+
+	while (ptes--) {
+		u64 addr = sram_addr[i].addr & ~(((u64)large_size) - 1);
+
+		xe_tile_assert(m->tile, sram_addr[i].proto ==
+			       DRM_INTERCONNECT_SYSTEM);
+		xe_tile_assert(m->tile, PAGE_SIZE << sram_addr[i].order ==
+			       large_size);
+		xe_tile_assert(m->tile, addr);
+
+		addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
+							 addr, pat_index,
+							 1, false, 0);
+
+		bb->cs[bb->len++] = lower_32_bits(addr);
+		bb->cs[bb->len++] = upper_32_bits(addr);
+
+		i += large_size / PAGE_SIZE;
+	}
+}
+
 static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct xe_bb *bb, u32 pt_offset,
 				       struct drm_pagemap_addr *sram_addr,
@@ -1777,6 +1824,22 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
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
@@ -1806,6 +1869,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		PAGE_SIZE : 4;
 	int err;
 	unsigned long i, j;
+	bool use_pde = xe_migrate_vram_use_pde(sram_addr, len + sram_offset);
 
 	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
 			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
@@ -1840,16 +1904,26 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		i += NR_PAGES(order);
 	}
 
-	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
-				   sram_addr, len + sram_offset);
+	if (use_pde)
+		build_large_pt_update_batch_sram(m, bb, sram_addr,
+						 len + sram_offset);
+	else
+		build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+					   sram_addr, len + sram_offset);
 
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

