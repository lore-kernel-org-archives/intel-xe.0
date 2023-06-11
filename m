Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB5DC7EE23
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jun 2023 22:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1A210E14C;
	Sun, 11 Jun 2023 22:25:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E7310E13B
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jun 2023 22:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686522300; x=1718058300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qUsmJeLth0I+V14SJzcnObRKS53BlVT7b3+DhmCReZU=;
 b=ChqnqyOcJc8CqxToh/IYBR/Tfk795EvQ/57P2kpTCc7ZE8+dMvt7VjJG
 iRk96Dn7aKCyt8Ft61nGGbT9IAQzeBNQdmcfDfBiFdLYVMYtzvsJ/umc9
 flEIKBGA8s0vjNNYLrtzAFq/rah2Fb+4P/d6Eiat8YxhrkVsLTVhG5Wj3
 Y+AvayRjN2hBwwvi+91e7yxq84ja9DUN+mIPDT4uO11eG5us0H1UbM3pe
 IL6QjtLc/RdbZDe6eGFoS1URU7HlvBP7GlDcZltcoutCNZmK/3ZgTDLTS
 +2X1BKH8EV5ywBMCiFQTdaV2ZYlkm02dx6osmI7frTyJ1wqXIL+uEm8DJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347552646"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="347552646"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="957778744"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; d="scan'208";a="957778744"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 15:24:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 11 Jun 2023 15:24:43 -0700
Message-Id: <20230611222447.2837573-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/xe: Rename pte/pde encoding functions
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove the leftover TODO by renameing the functions to use xe prefix.
Since the static __gen8_pte_encode() already has a double score,
just remove the prefix.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 20 +++++++-------
 drivers/gpu/drm/xe/xe_pt.c            | 38 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_pt.h            | 10 +++----
 drivers/gpu/drm/xe/xe_vm.c            |  4 +--
 5 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 60266fea7faa..4c79c1dfa772 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -300,7 +300,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* First part of the test, are we updating our pagetable bo with a new entry? */
 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
 		  0xdeaddeadbeefbeef);
-	expected = gen8_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0, 0);
+	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0, 0);
 	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
 		expected |= XE_PTE_PS64;
 	if (xe_bo_is_vram(pt))
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 86df1be3af8f..55e113dd7e82 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -189,15 +189,15 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		return ret;
 	}
 
-	entry = gen8_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
+	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
 
 	/* Map the entire BO in our level 0 pt */
 	for (i = 0, level = 0; i < num_entries; level++) {
-		entry = gen8_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
-					XE_CACHE_WB, 0, 0);
+		entry = xe_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
+				      XE_CACHE_WB, 0, 0);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
 
@@ -215,8 +215,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		for (i = 0; i < batch->size;
 		     i += vm->flags & XE_VM_FLAGS_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
-			entry = gen8_pte_encode(NULL, batch, i,
-						XE_CACHE_WB, 0, 0);
+			entry = xe_pte_encode(NULL, batch, i,
+					      XE_CACHE_WB, 0, 0);
 
 			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
 				  entry);
@@ -242,7 +242,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (vm->flags & XE_VM_FLAGS_64K && level == 1)
 			flags = XE_PDE_64K;
 
-		entry = gen8_pde_encode(bo, map_ofs + (level - 1) *
+		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
 					XE_PAGE_SIZE, XE_CACHE_WB);
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
 			  entry | flags);
@@ -250,8 +250,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Write PDE's that point to our BO. */
 	for (i = 0; i < num_entries - num_level; i++) {
-		entry = gen8_pde_encode(bo, i * XE_PAGE_SIZE,
-					XE_CACHE_WB);
+		entry = xe_pde_encode(bo, i * XE_PAGE_SIZE,
+				      XE_CACHE_WB);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
 			  (i + 1) * 8, u64, entry);
@@ -1231,8 +1231,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 			BUG_ON(pt_bo->size != SZ_4K);
 
-			addr = gen8_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB,
-					       0, 0);
+			addr = xe_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB,
+					     0, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index bef265715000..700170543e9b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -47,7 +47,7 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 }
 
 /**
- * gen8_pde_encode() - Encode a page-table directory entry pointing to
+ * xe_pde_encode() - Encode a page-table directory entry pointing to
  * another page-table.
  * @bo: The page-table bo of the page-table to point to.
  * @bo_offset: Offset in the page-table bo to point to.
@@ -57,8 +57,8 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
  *
  * Return: An encoded page directory entry. No errors.
  */
-u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
-		    const enum xe_cache_level level)
+u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
+		  const enum xe_cache_level level)
 {
 	u64 pde;
 	bool is_vram;
@@ -97,8 +97,8 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 	}
 }
 
-static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
-			     u32 pt_level)
+static u64 __pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
+			u32 pt_level)
 {
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
@@ -131,7 +131,7 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
 }
 
 /**
- * gen8_pte_encode() - Encode a page-table entry pointing to memory.
+ * xe_pte_encode() - Encode a page-table entry pointing to memory.
  * @vma: The vma representing the memory to point to.
  * @bo: If @vma is NULL, representing the memory to point to.
  * @offset: The offset into @vma or @bo.
@@ -140,13 +140,11 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
  * @pt_level: The page-table level of the page-table into which the entry
  * is to be inserted.
  *
- * TODO: Rename.
- *
  * Return: An encoded page-table entry. No errors.
  */
-u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
-		    u64 offset, enum xe_cache_level cache,
-		    u32 flags, u32 pt_level)
+u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
+		  u64 offset, enum xe_cache_level cache,
+		  u32 flags, u32 pt_level)
 {
 	u64 pte;
 	bool is_vram;
@@ -162,7 +160,7 @@ u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
 			pte |= XE_USM_PPGTT_PTE_AE;
 	}
 
-	return __gen8_pte_encode(pte, cache, flags, pt_level);
+	return __pte_encode(pte, cache, flags, pt_level);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -174,13 +172,13 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 		return 0;
 
 	if (level == 0) {
-		u64 empty = gen8_pte_encode(NULL, vm->scratch_bo[id], 0,
-					    XE_CACHE_WB, 0, 0);
+		u64 empty = xe_pte_encode(NULL, vm->scratch_bo[id], 0,
+					  XE_CACHE_WB, 0, 0);
 
 		return empty;
 	} else {
-		return gen8_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
-				       XE_CACHE_WB);
+		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
+				     XE_CACHE_WB);
 	}
 }
 
@@ -634,9 +632,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
-		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
-					xe_walk->cache, xe_walk->pte_flags,
-					level);
+		pte = __pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
+				   xe_walk->cache, xe_walk->pte_flags,
+				   level);
 		pte |= xe_walk->default_pte;
 
 		/*
@@ -699,7 +697,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			xe_child->is_compact = true;
 		}
 
-		pte = gen8_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
+		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
 					 pte);
 	}
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 10f334b9c004..54e8a043d353 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -45,10 +45,10 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
-u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
-		    const enum xe_cache_level level);
+u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
+		  const enum xe_cache_level level);
 
-u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
-		    u64 offset, enum xe_cache_level cache,
-		    u32 flags, u32 pt_level);
+u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
+		  u64 offset, enum xe_cache_level cache,
+		  u32 flags, u32 pt_level);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1c380ad7f6b..8f8080e0b2aa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1528,8 +1528,8 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
-	return gen8_pde_encode(vm->pt_root[tile->id]->bo, 0,
-			       XE_CACHE_WB);
+	return xe_pde_encode(vm->pt_root[tile->id]->bo, 0,
+			     XE_CACHE_WB);
 }
 
 static struct dma_fence *
-- 
2.40.1

