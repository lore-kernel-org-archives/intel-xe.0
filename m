Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F33CE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 13:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F6310E1C3;
	Mon, 25 Sep 2023 13:21:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E9410E250
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695648095; x=1727184095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v+qiQtlCqYSRA+1eUlKboovlG0mvGQOLDoJtp4fTf0o=;
 b=OtqESOX/29dZ72rWFiGgMKISPnSO4k2L8yNXhpB3BnH8ZwsWiN06JQPo
 C9Q4TH932GWmM0TfreJm6RMsfLgAzPe+o3u0t3qNQ6KVVaym/zLLnEC12
 rz/YXwD9BMkcxK/IYeEofShT5bfsQwSxdetzBdcbUnDCNwCBHH/YuVYXw
 WsDKfzHsQYKb7k+39rQQVgiiLFiz+cXUgg92ak1LWAQL2kZpn+HIuCwz1
 8ecdHqCdXRR3wDVY8Om1DOHClvJHNTPAZJ9bq62akhFjCR9fC6S00pSYF
 jRArNR8QDIcSJyz1s3ahmjHGB8Fqn+qyuc3HU+oaIUVzX2zf9PQZ+GYbL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378521524"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="378521524"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751679148"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="751679148"
Received: from ngorb-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.27.97])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 14:21:19 +0100
Message-ID: <20230925132113.59900-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925132113.59900-9-matthew.auld@intel.com>
References: <20230925132113.59900-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/7] drm/xe: directly use pat_index for
 pte_encode
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the next patch userspace will be able to directly set the pat_index
as part of vm_bind. To support this we need to get away from using
xe_cache_level in the low level routines and rather just use the
pat_index directly.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c          |  7 +++----
 drivers/gpu/drm/xe/xe_ggtt_types.h    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 13 ++++++++-----
 drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++++------
 drivers/gpu/drm/xe/xe_pt.h            |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c            |  8 ++------
 drivers/gpu/drm/xe/xe_vm_types.h      |  3 +--
 8 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 6b4388bfbb31..d3bf4751a2d7 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* First part of the test, are we updating our pagetable bo with a new entry? */
 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
 		  0xdeaddeadbeefbeef);
-	expected = xe_pte_encode(m->q->vm, pt, 0, XE_CACHE_WB, 0);
+	expected = xe_pte_encode(m->q->vm, pt, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
 	if (m->q->vm->flags & XE_VM_FLAG_64K)
 		expected |= XE_PTE_PS64;
 	if (xe_bo_is_vram(pt))
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2002b6597dbf..1c447f1a4fbb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -41,7 +41,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
 		pte |= XE_GGTT_PTE_DM;
 
 	if ((ggtt->pat_encode).pte_encode)
-		pte = (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_WB_1_WAY);
+		pte = (ggtt->pat_encode).pte_encode(xe, pte,
+						    xe_pat_get_index(xe, XE_CACHE_WB_1_WAY));
 
 	return pte;
 }
@@ -102,10 +103,8 @@ static void primelockdep(struct xe_ggtt *ggtt)
 }
 
 static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
-						enum xe_cache_level cache)
+				     u16 pat_index)
 {
-	u32 pat_index = xe_pat_get_index(xe, cache);
-
 	pte_pat &= ~(XELPG_GGTT_PTE_PAT_MASK);
 
 	if (pat_index & BIT(0))
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 7e55fac1a8a9..7981075bb228 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -31,7 +31,7 @@ struct xe_ggtt {
 
 	struct {
 		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
-						enum xe_cache_level cache);
+				  u16 pat_index);
 	} pat_encode;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ebae0117f577..9d201bdb9f25 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -25,6 +25,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
@@ -162,6 +163,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 	u32 map_ofs, level, i;
 	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
+	u16 pat_index = xe_pat_get_index(xe, XE_CACHE_WB);
 	u64 entry;
 	int ret;
 
@@ -196,7 +198,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Map the entire BO in our level 0 pt */
 	for (i = 0, level = 0; i < num_entries; level++) {
-		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
+		entry = xe_pte_encode(vm, bo, i * XE_PAGE_SIZE, pat_index, 0);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
 
@@ -214,7 +216,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		for (i = 0; i < batch->size;
 		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
-			entry = xe_pte_encode(vm, batch, i, XE_CACHE_WB, 0);
+			entry = xe_pte_encode(vm, batch, i, pat_index, 0);
 
 			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
 				  entry);
@@ -259,7 +261,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
 
 		flags = XE_PPGTT_PTE_DM;
-		flags = __xe_pte_encode(flags, XE_CACHE_WB, vm, NULL, level);
+		flags = __xe_pte_encode(flags, pat_index, vm, NULL, level);
 
 		/*
 		 * Use 1GB pages, it shouldn't matter the physical amount of
@@ -454,6 +456,7 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_res_cursor *cur,
 		     u32 size, struct xe_bo *bo)
 {
+	u16 pat_index = xe_pat_get_index(m->tile->xe, XE_CACHE_WB);
 	u32 ptes;
 	u64 ofs = at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
@@ -494,7 +497,7 @@ static void emit_pte(struct xe_migrate *m,
 				addr += vram_region_gpu_offset(bo->ttm.resource);
 				addr |= XE_PPGTT_PTE_DM;
 			}
-			addr = __xe_pte_encode(addr, XE_CACHE_WB, m->q->vm, NULL, 0);
+			addr = __xe_pte_encode(addr, pat_index, m->q->vm, NULL, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
@@ -1254,7 +1257,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 			xe_tile_assert(tile, pt_bo->size == SZ_4K);
 
-			addr = xe_pte_encode(vm, pt_bo, 0, XE_CACHE_WB, 0);
+			addr = xe_pte_encode(vm, pt_bo, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ddb4d9c33181..5686ed9be175 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -11,6 +11,7 @@
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
+#include "xe_pat.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
@@ -68,7 +69,7 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset)
 	return pde;
 }
 
-u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
+u64 __xe_pte_encode(u64 pte, u16 pat_index,
 		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
 {
 	struct xe_device *xe = vm->xe;
@@ -86,7 +87,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
 	else if (pt_level == 2)
 		pte |= XE_PDPE_PS_1G;
 
-	pte = vm->pat_encode.pte_encode(xe, pte, cache);
+	pte = vm->pat_encode.pte_encode(xe, pte, pat_index);
 
 	/* XXX: Does hw support 1 GiB pages? */
 	XE_WARN_ON(pt_level > 2);
@@ -104,7 +105,7 @@ u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
  *
  * Return: An encoded page-table entry. No errors.
  */
-u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
+u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
 		  u32 pt_level)
 {
 	u64 pte;
@@ -113,7 +114,7 @@ u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_PPGTT_PTE_DM;
 
-	return __xe_pte_encode(pte, cache, vm, NULL, pt_level);
+	return __xe_pte_encode(pte, pat_index, vm, NULL, pt_level);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -126,7 +127,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 
 	if (level == 0) {
 		u64 empty = xe_pte_encode(vm, vm->scratch_bo[id], 0,
-					  XE_CACHE_WB, 0);
+					  xe_pat_get_index(vm->xe, XE_CACHE_WB), 0);
 
 		return empty;
 	} else {
@@ -597,7 +598,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		pte = __xe_pte_encode(is_null ? 0 :
 				      xe_res_dma(curs) + xe_walk->dma_offset,
-				      xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
+				      xe_pat_get_index(tile_to_xe(xe_walk->tile),
+						       xe_walk->cache),
+				      xe_walk->vm, xe_walk->vma, level);
 		pte |= xe_walk->default_pte;
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 0e66436d707d..6d10823fca9b 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -47,9 +47,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
 u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset);
 
-u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
+u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, u16 pat_index,
 		  u32 pt_level);
-u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
+u64 __xe_pte_encode(u64 pte, u16 pat_index,
 		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c53d5c1580df..28e6429488ee 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1196,10 +1196,8 @@ static void xe_vma_op_work_func(struct work_struct *w);
 static void vm_destroy_work_func(struct work_struct *w);
 
 static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
-						enum xe_cache_level cache)
+				    u16 pat_index)
 {
-	u32 pat_index = xe_pat_get_index(xe, cache);
-
 	if (pat_index & BIT(0))
 		pte_pat |= BIT(3);
 
@@ -1217,10 +1215,8 @@ static u64 xe2_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
 }
 
 static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
-						enum xe_cache_level cache)
+				     u16 pat_index)
 {
-	u32 pat_index = xe_pat_get_index(xe, cache);
-
 	if (pat_index & BIT(0))
 		pte_pat |= BIT(3);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c4d866840d6a..685c2179e533 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -340,8 +340,7 @@ struct xe_vm {
 	struct xe_file *xef;
 
 	struct {
-		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
-				  enum xe_cache_level cache);
+		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat, u16 pat_index);
 	} pat_encode;
 };
 
-- 
2.41.0

