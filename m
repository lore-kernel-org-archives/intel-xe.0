Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE86CE79A4
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8060D10E33D;
	Mon, 25 Sep 2023 22:11:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7735410E339
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695679890; x=1727215890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zcj8diBkwEGJY3rStLuWl2fzyWiPTs99ixEoqK/nEjE=;
 b=MbMgWY4L+e1JaMkTFPWM77jNNgig3meMHmmllnqUGgRCuh61UIsin0TI
 1inwd4CYqB2GllDkZbTR4Djkpzy6A9ysSBum0AZMi0jmxlsk+bJlxz8li
 aJ8ssnmOto0wQ7ZYUYz3Uawv8Pk1VOBPGbrm+DJ/v1canJau5VSj7DkKZ
 OUBghcaEKJ5NMpvQu47A/BdhlHaT0GrOeJcyiOYegcCqSCmYazwDQzFcM
 bmDlP4iLr54MWAHvXDiQ+JXLEbGNQkrL5apc8rIMee1FwRr9qYrELm2aW
 gBb1ujnYULphF2GmReHA0li9PZtaPVUyBg8tdX7hTIdoog4Gyv66lzuom g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412333010"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412333010"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742087764"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="742087764"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 15:10:47 -0700
Message-Id: <20230925221049.2681491-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925221049.2681491-1-lucas.demarchi@intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] drm/xe: Use pat_index to encode pte
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Change the xelp_pte_encode() function to use the platform-dependent
pat_index.  The same function can be used for all platforms as they only
need to encode the pat_index bits in the same pte layout. For platforms
that don't have the most significant bit, as long as they don't return a
bogus index they should be fine.

To maintain consistency, also add xe argument to pde_encode_cache().
This will be needed for Xe2 later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h       | 11 ++++---
 drivers/gpu/drm/xe/xe_migrate.c  |  6 ++--
 drivers/gpu/drm/xe/xe_pt_types.h |  4 ++-
 drivers/gpu/drm/xe/xe_vm.c       | 50 +++++++++++++++++++-------------
 4 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e3c90d45e723..885412581158 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -39,10 +39,13 @@
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
 
-#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
-#define PPAT_CACHED_PDE                 0
-#define PPAT_CACHED                     BIT_ULL(7)
-#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
+#define XE_PPGTT_PDE_UNCACHED		GENMASK_ULL(4, 3)
+#define XE_PPGTT_PDE_CACHED		0
+
+#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
+#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
+#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
+#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
 
 #define XE_PTE_SHIFT			12
 #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f22356d69ae3..11dc3b0e0350 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -261,7 +261,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = vm->pt_ops->pte_encode_addr(0, XE_CACHE_WB, level, true, 0);
+		flags = vm->pt_ops->pte_encode_addr(xe, 0, XE_CACHE_WB, level,
+						    true, 0);
 
 		/*
 		 * Use 1GB pages, it shouldn't matter the physical amount of
@@ -498,7 +499,8 @@ static void emit_pte(struct xe_migrate *m,
 				devmem = true;
 			}
 
-			addr |= m->q->vm->pt_ops->pte_encode_addr(addr, XE_CACHE_WB,
+			addr |= m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
+								  addr, XE_CACHE_WB,
 								  0, devmem, flags);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index bf5000499251..bd6645295fe6 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -11,6 +11,7 @@
 #include "xe_pt_walk.h"
 
 struct xe_bo;
+struct xe_device;
 struct xe_vma;
 
 enum xe_cache_level {
@@ -40,7 +41,8 @@ struct xe_pt_ops {
 			     enum xe_cache_level cache, u32 pt_level);
 	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
 			      enum xe_cache_level cache, u32 pt_level);
-	u64 (*pte_encode_addr)(u64 addr, enum xe_cache_level cache,
+	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
+			       enum xe_cache_level cache,
 			       u32 pt_level, bool devmem, u64 flags);
 	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
 			     const enum xe_cache_level cache);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 23452b98d853..ab9cf1de566a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1191,27 +1191,32 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
 	.op_alloc = xe_vm_op_alloc,
 };
 
-static u64 pde_encode_cache(enum xe_cache_level cache)
+static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
 {
-	/* FIXME: I don't think the PPAT handling is correct for MTL */
-
 	if (cache != XE_CACHE_NONE)
-		return PPAT_CACHED_PDE;
+		return XE_PPGTT_PDE_CACHED;
 
-	return PPAT_UNCACHED;
+	return XE_PPGTT_PDE_UNCACHED;
 }
 
-static u64 pte_encode_cache(enum xe_cache_level cache)
+static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
 {
-	/* FIXME: I don't think the PPAT handling is correct for MTL */
-	switch (cache) {
-	case XE_CACHE_NONE:
-		return PPAT_UNCACHED;
-	case XE_CACHE_WT:
-		return PPAT_DISPLAY_ELLC;
-	default:
-		return PPAT_CACHED;
-	}
+	u32 pat_index = xe->pat.idx[cache];
+	u64 pte = 0;
+
+	if (pat_index & BIT(0))
+		pte |= XE_PPGTT_PTE_PAT0;
+
+	if (pat_index & BIT(1))
+		pte |= XE_PPGTT_PTE_PAT1;
+
+	if (pat_index & BIT(2))
+		pte |= XE_PPGTT_PTE_PAT2;
+
+	if (pat_index & BIT(3))
+		pte |= XELPG_PPGTT_PTE_PAT3;
+
+	return pte;
 }
 
 static u64 pte_encode_ps(u32 pt_level)
@@ -1229,11 +1234,12 @@ static u64 pte_encode_ps(u32 pt_level)
 static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
 			      const enum xe_cache_level cache)
 {
+	struct xe_device *xe = xe_bo_device(bo);
 	u64 pde;
 
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pde |= pde_encode_cache(cache);
+	pde |= pde_encode_cache(xe, cache);
 
 	return pde;
 }
@@ -1241,11 +1247,12 @@ static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
 static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 			      enum xe_cache_level cache, u32 pt_level)
 {
+	struct xe_device *xe = xe_bo_device(bo);
 	u64 pte;
 
 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_cache(cache);
+	pte |= pte_encode_cache(xe, cache);
 	pte |= pte_encode_ps(pt_level);
 
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
@@ -1257,12 +1264,14 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 			       enum xe_cache_level cache, u32 pt_level)
 {
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
+
 	pte |= XE_PAGE_PRESENT;
 
 	if (likely(!xe_vma_read_only(vma)))
 		pte |= XE_PAGE_RW;
 
-	pte |= pte_encode_cache(cache);
+	pte |= pte_encode_cache(xe, cache);
 	pte |= pte_encode_ps(pt_level);
 
 	if (unlikely(xe_vma_is_null(vma)))
@@ -1271,7 +1280,8 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 	return pte;
 }
 
-static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
+static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
+				enum xe_cache_level cache,
 				u32 pt_level, bool devmem, u64 flags)
 {
 	u64 pte;
@@ -1281,7 +1291,7 @@ static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
 
 	pte = addr;
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_cache(cache);
+	pte |= pte_encode_cache(xe, cache);
 	pte |= pte_encode_ps(pt_level);
 
 	if (devmem)
-- 
2.40.1

