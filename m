Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D63CC87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 10:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2068010E921;
	Fri,  8 Aug 2025 10:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W89BWFj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D6110E921
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754649311; x=1786185311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bdbTVHKIiduf9FlFdBr0DLtVq1GbPFZ9cPfulNoiOf4=;
 b=W89BWFj14+eRnY+aCtRODg5rOAV5kvwkPkWipPViZoUvvFFWoHkATaH5
 BYebXscQf6WgWLQZFbbJ/jsQgJEICmbF5wlE8Dzj952MNetkU53fKkKwZ
 4IkZ5un2Y+z+IBQCfPugPKOaqby02/NHEljU3j4E+5YtQ/1r8hPU98eRX
 hTcY2kCy6rJ1e4YgV/fXTUyhNj8ceT1A8sA8EHjmfmatIUdjQaQekrian
 UaeHBtmivvMEKYoUITo0ElyLek7EPJSlAJx35xhG7EyBPh4GlW2T0rL9J
 5F5yzqUjFsitcggKmIRJyEk0qytZ+oIDmJz26MTyM683kkukHLnx+sy1K Q==;
X-CSE-ConnectionGUID: LfEtFB48T5qaUFpyOjGoZQ==
X-CSE-MsgGUID: ySfCKycjRKuVarC9En8kZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="44587770"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="44587770"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:35:11 -0700
X-CSE-ConnectionGUID: KLE98BUHTKq1yias2HyoYg==
X-CSE-MsgGUID: 2vcUkhJlRMatrng5u7P7BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164955195"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.211])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:35:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: rework PDE PAT index selection
Date: Fri,  8 Aug 2025 11:34:56 +0100
Message-ID: <20250808103455.462424-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
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

For non-leaf paging structures we end up selecting a random index
between [0, 3], depending on the first user if the page-table is shared,
since non-leaf structures only have two bits in the HW for encoding the
PAT index, and here we are just passing along the full user provided
index, which can be an index as large as ~31 on xe2+. The user provided
index is meant for the leaf node, which maps the actual BO pages where
we have more PAT bits, and not the non-leaf nodes which are only mapping
other paging structures, and so only needs a minimal PAT index range.
Also the chosen index might need to consider how the driver mapped the
paging structures on the host side, like wc vs wb, which is separate
from the user provided index.

With that move the PDE PAT index selection under driver control. For now
just use a coherent index on platforms with page-tables that are cached
on host side, and incoherent otherwise. Using a coherent index could
potentially be expensive, and would be overkill if we know the page-table
is always uncached on host side.

v2 (Stuart):
  - Add some documentation and split into separate helper.

BSpec: 59510
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  | 10 ++++------
 drivers/gpu/drm/xe/xe_pt.c       |  4 ++--
 drivers/gpu/drm/xe/xe_pt_types.h |  3 +--
 drivers/gpu/drm/xe/xe_vm.c       | 34 +++++++++++++++++++++++++++-----
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4effe10d815b..9da56c2e0eaa 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -152,8 +152,7 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	for (pos = dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
-			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
-							  pat_index);
+			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs);
 			xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
 
 			flags = vm->pt_ops->pte_encode_addr(xe, 0,
@@ -207,7 +206,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* PT30 & PT31 reserved for 2M identity map */
 	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
-	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
+	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
@@ -275,15 +274,14 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			flags = XE_PDE_64K;
 
 		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (u64)(level - 1) *
-						  XE_PAGE_SIZE, pat_index);
+						  XE_PAGE_SIZE);
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
 			  entry | flags);
 	}
 
 	/* Write PDE's that point to our BO. */
 	for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
-		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
-						  pat_index);
+		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
 			  (i + 1) * 8, u64, entry);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 330cc0f54a3f..f3a39e734a90 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -69,7 +69,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 
 	if (level > MAX_HUGEPTE_LEVEL)
 		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
-						 0, pat_index);
+						 0);
 
 	return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, IS_DGFX(xe), 0) |
 		XE_PTE_NULL;
@@ -616,7 +616,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			xe_child->is_compact = true;
 		}
 
-		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
+		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0) | flags;
 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
 					 pte);
 	}
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 69eab6f37cfe..17cdd7c7e9f5 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -45,8 +45,7 @@ struct xe_pt_ops {
 	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
 			       u16 pat_index,
 			       u32 pt_level, bool devmem, u64 flags);
-	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
-			     u16 pat_index);
+	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset);
 };
 
 struct xe_pt_entry {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..dbe6ac889f4e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1512,14 +1512,39 @@ static u64 pte_encode_ps(u32 pt_level)
 	return 0;
 }
 
-static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
-			      const u16 pat_index)
+static u16 pde_pat_index(struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	u16 pat_index;
+
+	/*
+	 * We only have two bits to encode the PAT index in non-leaf nodes, but
+	 * these only point to other paging structures so we only need a minimal
+	 * selection of options. The user PAT index is only for encoding leaf
+	 * nodes, where we have use of more bits to do the encoding. The
+	 * non-leaf nodes are instead under driver control so the chosen index
+	 * here should be distict from the user PAT index. Also the
+	 * corresponding coherency of the PAT index should be tied to the
+	 * allocation type of the page table (or at least we should pick
+	 * something which is always safe).
+	 */
+	if (!xe_bo_is_vram(bo) && bo->ttm.ttm->caching == ttm_cached)
+		pat_index = xe->pat.idx[XE_CACHE_WB];
+	else
+		pat_index = xe->pat.idx[XE_CACHE_NONE];
+
+	xe_assert(xe, pat_index <= 3);
+
+	return pat_index;
+}
+
+static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset)
 {
 	u64 pde;
 
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pde |= pde_encode_pat_index(pat_index);
+	pde |= pde_encode_pat_index(pde_pat_index(bo));
 
 	return pde;
 }
@@ -2024,8 +2049,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
-	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0,
-					 tile_to_xe(tile)->pat.idx[XE_CACHE_WB]);
+	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0);
 }
 
 static struct xe_exec_queue *
-- 
2.50.1

