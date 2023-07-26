Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B329C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E7110E4A3;
	Wed, 26 Jul 2023 16:10:15 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204EB10E49F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Su0PqvmvmbichVw33zamfEESpUvWH7S/vLzSqr2ZIO0=;
 b=TMaWcuyFBL8DRNWTOVUC5z9foSzBXp0HBUTdsiVC3z+i7WW+kyNsIq/u
 lffJK49Ib1IrqB4LSeE9YHNq3QdsZD19j5wR89y58H3bK1sNdMT53IAd3
 nry9AODIvJXBaWMjHa91Mm4tc39bShr7RihOGV3muQbtaNVPEHXGmJf8Y
 AvZJq48TnMNb2773zjUoSKWLlTpUFCtiuJGscZp2vNFp1eV4Ih7UYsMA9
 oopzw7HGrduOZOcU9fdmhzeyfIHi4bIxwfZX3BQzpGzfWpoC3pzWDU2/u
 QR0lF32JWrYR242uMS5YKu2CKc8+zcxn9mGDgFAzcM3lq5Dbp9BfiRDgs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994897"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994897"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279362"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279362"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:02 -0700
Message-Id: <20230726160708.3967790-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/10] drm/xe: Remove vma arg from
 xe_pte_encode()
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
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All the callers pass a NULL vma, so the buffer is always the BO. Remove
the argument and the side effects of dealing with it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       |  8 ++---
 drivers/gpu/drm/xe/xe_pt.c            | 47 ++++-----------------------
 drivers/gpu/drm/xe/xe_pt.h            |  4 +--
 4 files changed, 13 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index c332dc54cb70..9e9b228fe315 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* First part of the test, are we updating our pagetable bo with a new entry? */
 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
 		  0xdeaddeadbeefbeef);
-	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0);
+	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
 	if (m->eng->vm->flags & XE_VM_FLAG_64K)
 		expected |= XE_PTE_PS64;
 	if (xe_bo_is_vram(pt))
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index bc7dac4e2086..3c7d5cfd30bc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -196,8 +196,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Map the entire BO in our level 0 pt */
 	for (i = 0, level = 0; i < num_entries; level++) {
-		entry = xe_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
-				      XE_CACHE_WB, 0);
+		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
 
@@ -215,8 +214,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		for (i = 0; i < batch->size;
 		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
-			entry = xe_pte_encode(NULL, batch, i,
-					      XE_CACHE_WB, 0);
+			entry = xe_pte_encode(batch, i, XE_CACHE_WB, 0);
 
 			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
 				  entry);
@@ -1235,7 +1233,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 			BUG_ON(pt_bo->size != SZ_4K);
 
-			addr = xe_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB, 0);
+			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d5a237b7c883..ac01bc42e54f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -78,30 +78,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 	return pde;
 }
 
-static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
-			   size_t page_size, bool *is_vram)
-{
-	if (xe_vma_is_null(vma)) {
-		*is_vram = 0;
-		return 0;
-	}
-
-	if (xe_vma_is_userptr(vma)) {
-		struct xe_res_cursor cur;
-		u64 page;
-
-		*is_vram = false;
-		page = offset >> PAGE_SHIFT;
-		offset &= (PAGE_SIZE - 1);
-
-		xe_res_first_sg(vma->userptr.sg, page << PAGE_SHIFT, page_size,
-				&cur);
-		return xe_res_dma(&cur) + offset;
-	} else {
-		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
-	}
-}
-
 static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
 			struct xe_vma *vma, u32 pt_level)
 {
@@ -140,34 +116,25 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
 
 /**
  * xe_pte_encode() - Encode a page-table entry pointing to memory.
- * @vma: The vma representing the memory to point to.
- * @bo: If @vma is NULL, representing the memory to point to.
- * @offset: The offset into @vma or @bo.
+ * @bo: The BO representing the memory to point to.
+ * @offset: The offset into @bo.
  * @cache: The cache level indicating
  * @pt_level: The page-table level of the page-table into which the entry
  * is to be inserted.
  *
  * Return: An encoded page-table entry. No errors.
  */
-u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
-		  u64 offset, enum xe_cache_level cache,
+u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
 		  u32 pt_level)
 {
 	u64 pte;
 	bool is_vram;
 
-	if (vma)
-		pte = vma_addr(vma, offset, XE_PAGE_SIZE, &is_vram);
-	else
-		pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
-
-	if (is_vram) {
+	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
+	if (is_vram)
 		pte |= XE_PPGTT_PTE_LM;
-		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
-			pte |= XE_USM_PPGTT_PTE_AE;
-	}
 
-	return __pte_encode(pte, cache, vma, pt_level);
+	return __pte_encode(pte, cache, NULL, pt_level);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -179,7 +146,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 		return 0;
 
 	if (level == 0) {
-		u64 empty = xe_pte_encode(NULL, vm->scratch_bo[id], 0,
+		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
 					  XE_CACHE_WB, 0);
 
 		return empty;
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index aaf4b7b851e2..bbb00d6461ff 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -48,7 +48,7 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 		  const enum xe_cache_level level);
 
-u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
-		  u64 offset, enum xe_cache_level cache,
+u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
 		  u32 pt_level);
+
 #endif
-- 
2.40.1

