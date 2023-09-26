Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99FCE7F141
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7018010E44A;
	Tue, 26 Sep 2023 22:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D906510E457
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695767785; x=1727303785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4dliT8qeoz9F/RDhyUeUgthuBBbBApN+t384utKtAw=;
 b=gEuaP1C+QwNcozt71WL0WI8YJFPRWytEmEpaeH67ynlsfsJxtXLSE7Li
 F6ZY6GqfCR+u1IFYmCCaTRsMsY5ex5Lxfn6LodDt8L8jvj1qvzyuK0bVi
 jP6Z5Agl8P3fVtxwLAKIwN+Xp6cZHfeorIFIEOBRkU76sibFcc8qw9vMw
 mJkX+MDrXAgDCdKZy6TYvjxpBZX2H7ElUeiZO9QFQuI9rHqTPY6+hB1cn
 US2RCjhgo3OCSbtrveHujX7QcqQ31tYGX7m/VfUZRH8MiAQPIZVGaHP/B
 G03iBBqjS4O7S20h/ho3LuB9x5XeU8LAX6OlURmWT4N3fe+6zSOxCrtX+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412597203"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412597203"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752343361"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752343361"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 15:36:21 -0700
Message-Id: <20230926223631.2807873-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926223631.2807873-1-lucas.demarchi@intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/11] drm/xe: Normalize pte/pde encoding
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
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Split functions that do only part of the pde/pte encoding and that can
be called by the different places. This normalizes how pde/pte are
encoded so they can be moved elsewhere in a subsequent change.

xe_pte_encode() was calling __pte_encode() with a NULL vma, which is the
opposite of what xe_pt_stage_bind_entry() does. Stop passing a NULL vma
and just split another function that deals with a vma rather than a bo.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 119 +++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index aec469842471..afadd399684c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -47,91 +47,106 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
 }
 
-/**
- * xe_pde_encode() - Encode a page-table directory entry pointing to
- * another page-table.
- * @bo: The page-table bo of the page-table to point to.
- * @bo_offset: Offset in the page-table bo to point to.
- * @level: The cache level indicating the caching of @bo.
- *
- * TODO: Rename.
- *
- * Return: An encoded page directory entry. No errors.
- */
-u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
-		  const enum xe_cache_level level)
+static u64 pde_encode_cache(enum xe_cache_level cache)
 {
-	u64 pde;
-
-	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
-	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
-
 	/* FIXME: I don't think the PPAT handling is correct for MTL */
 
-	if (level != XE_CACHE_NONE)
-		pde |= PPAT_CACHED_PDE;
-	else
-		pde |= PPAT_UNCACHED;
+	if (cache != XE_CACHE_NONE)
+		return PPAT_CACHED_PDE;
 
-	return pde;
+	return PPAT_UNCACHED;
 }
 
-static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
-			struct xe_vma *vma, u32 pt_level)
+static u64 pte_encode_cache(enum xe_cache_level cache)
 {
-	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-
-	if (unlikely(vma && xe_vma_read_only(vma)))
-		pte &= ~XE_PAGE_RW;
-
-	if (unlikely(vma && xe_vma_is_null(vma)))
-		pte |= XE_PTE_NULL;
-
 	/* FIXME: I don't think the PPAT handling is correct for MTL */
-
 	switch (cache) {
 	case XE_CACHE_NONE:
-		pte |= PPAT_UNCACHED;
-		break;
+		return PPAT_UNCACHED;
 	case XE_CACHE_WT:
-		pte |= PPAT_DISPLAY_ELLC;
-		break;
+		return PPAT_DISPLAY_ELLC;
 	default:
-		pte |= PPAT_CACHED;
-		break;
+		return PPAT_CACHED;
 	}
+}
+
+static u64 pte_encode_ps(u32 pt_level)
+{
+	/* XXX: Does hw support 1 GiB pages? */
+	XE_WARN_ON(pt_level > 2);
 
 	if (pt_level == 1)
-		pte |= XE_PDE_PS_2M;
+		return XE_PDE_PS_2M;
 	else if (pt_level == 2)
-		pte |= XE_PDPE_PS_1G;
+		return XE_PDPE_PS_1G;
 
-	/* XXX: Does hw support 1 GiB pages? */
-	XE_WARN_ON(pt_level > 2);
+	return 0;
+}
 
-	return pte;
+/**
+ * xe_pde_encode() - Encode a page-table directory entry pointing to
+ * another page-table.
+ * @bo: The page-table bo of the page-table to point to.
+ * @bo_offset: Offset in the page-table bo to point to.
+ * @cache: The cache level indicating the caching of @bo.
+ *
+ * TODO: Rename.
+ *
+ * Return: An encoded page directory entry. No errors.
+ */
+u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
+		  const enum xe_cache_level cache)
+{
+	u64 pde;
+
+	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
+	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
+	pde |= pde_encode_cache(cache);
+
+	return pde;
 }
 
 /**
  * xe_pte_encode() - Encode a page-table entry pointing to memory.
  * @bo: The BO representing the memory to point to.
- * @offset: The offset into @bo.
+ * @bo_offset: The offset into @bo.
  * @cache: The cache level indicating
  * @pt_level: The page-table level of the page-table into which the entry
  * is to be inserted.
  *
  * Return: An encoded page-table entry. No errors.
  */
-u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
+u64 xe_pte_encode(struct xe_bo *bo, u64 bo_offset, enum xe_cache_level cache,
 		  u32 pt_level)
 {
 	u64 pte;
 
-	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
+	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
+	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
+	pte |= pte_encode_cache(cache);
+	pte |= pte_encode_ps(pt_level);
+
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_PPGTT_PTE_DM;
 
-	return __pte_encode(pte, cache, NULL, pt_level);
+	return pte;
+}
+
+/* Like xe_pte_encode(), but with a vma and a partially-encoded pte */
+static u64 __vma_pte_encode(u64 pte, struct xe_vma *vma,
+			    enum xe_cache_level cache, u32 pt_level)
+{
+	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
+	pte |= pte_encode_cache(cache);
+	pte |= pte_encode_ps(pt_level);
+
+	if (unlikely(vma && xe_vma_read_only(vma)))
+		pte &= ~XE_PAGE_RW;
+
+	if (unlikely(vma && xe_vma_is_null(vma)))
+		pte |= XE_PTE_NULL;
+
+	return pte;
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -614,9 +629,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
-		pte = __pte_encode(is_null ? 0 :
-				   xe_res_dma(curs) + xe_walk->dma_offset,
-				   xe_walk->cache, xe_walk->vma, level);
+		pte = __vma_pte_encode(is_null ? 0 :
+				       xe_res_dma(curs) + xe_walk->dma_offset,
+				       xe_walk->vma, xe_walk->cache, level);
 		pte |= xe_walk->default_pte;
 
 		/*
-- 
2.40.1

