Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A345EC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 12:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7844D10E478;
	Wed, 26 Jul 2023 12:49:08 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186AA10E478
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690375747; x=1721911747;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAdGnhxQWLOZw4oSEaU48XLgqUk9fuaYC+K2DekqcgY=;
 b=kdQOTnODaa9G98FtGNR7odqjIFCAf4+gdUOwkEqBGUapj+A9lpa7CAiY
 x57QdSNdis+Eor9K8U9r/q5lagu0bQT9dGXsLGb2IxAjbmurFvYH1yd7o
 G03QUfto9JtE7EwNBR0gmZT7Dq5sCFB79DA6P1uwm3wHobSep9C90rMg+
 9p4CJ4bXJwB7mkp0gBeLOuD8oIZ6ZJ0HU+1FXoTcsVCUxaJpSb4y24US8
 ZMaMJEJvokdMPmtvQMyulKnbxpuwtoLajUSKjQy8wiT6Hn7+5ibGKbclP
 y4X4ehQRTSQMcK4/iJ3o+67KZxGhZsT8lo7q72ATaUIpMiBMOFMhjxjIx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368024479"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="368024479"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 05:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="729824904"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="729824904"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 05:49:05 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:19:16 +0530
Message-Id: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in PTE and PDE
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

Different platforms has different PAT encoding in PTE and PDE format, add
correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).

Bspec: 45101, 71582
Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 119 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pt.h       |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h |   2 +
 3 files changed, 106 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d4660520ac2c..09dafb0e47ea 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -16,6 +16,7 @@
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_pt.h"
 
 struct xe_pt_dir {
 	struct xe_pt pt;
@@ -62,6 +63,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 {
 	u64 pde;
 	bool is_vram;
+	u8 pat_index = 0;
+	struct xe_vm *vm = bo->vm;
 
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
@@ -70,10 +73,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 
 	/* FIXME: I don't think the PPAT handling is correct for MTL */
 
-	if (level != XE_CACHE_NONE)
-		pde |= PPAT_CACHED_PDE;
-	else
-		pde |= PPAT_UNCACHED;
+
+	pat_index = xe_pat_get_index(xe_bo_device(bo), level);
+	pde = vm->ppgtt_pde_encode(pde, pat_index);
 
 	return pde;
 }
@@ -103,6 +105,9 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
 			struct xe_vma *vma, u32 pt_level)
 {
+	struct xe_vm *vm = xe_vma_vm(vma);
+	u8 pat_index = 0;
+
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
 	if (unlikely(vma && xe_vma_read_only(vma)))
@@ -111,19 +116,8 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
 	if (unlikely(vma && xe_vma_is_null(vma)))
 		pte |= XE_PTE_NULL;
 
-	/* FIXME: I don't think the PPAT handling is correct for MTL */
-
-	switch (cache) {
-	case XE_CACHE_NONE:
-		pte |= PPAT_UNCACHED;
-		break;
-	case XE_CACHE_WT:
-		pte |= PPAT_DISPLAY_ELLC;
-		break;
-	default:
-		pte |= PPAT_CACHED;
-		break;
-	}
+	pat_index = xe_pat_get_index(vm->xe, cache);
+	pte = vm->ppgtt_pte_encode(pte, pat_index);
 
 	if (pt_level == 1)
 		pte |= XE_PDE_PS_2M;
@@ -187,6 +181,91 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 	}
 }
 
+static u64 __xelp_ppgtt_pde_encode_pat(u64 pte_pat, u8 pat_index)
+{
+
+	pte_pat &= ~(BIT(12) | BIT(4) | BIT(3));
+
+	if (pat_index & BIT(0))
+		pte_pat |= BIT(3);
+
+	if (pat_index & BIT(1))
+		pte_pat |= BIT(4);
+
+	if (pat_index & BIT(2))
+		pte_pat |= BIT(12);
+
+	return pte_pat;
+}
+
+static u64 __xelp_ppgtt_pte_encode_pat(u64 pte_pat, u8 pat_index)
+{
+
+	pte_pat &= ~(BIT(7) | BIT(4) | BIT(3));
+
+	if (pat_index & BIT(0))
+		pte_pat |= BIT(3);
+
+	if (pat_index & BIT(1))
+		pte_pat |= BIT(4);
+
+	if (pat_index & BIT(2))
+		pte_pat |= BIT(7);
+
+	return pte_pat;
+}
+
+u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
+{
+	u8 pat_index;
+
+	if (GRAPHICS_VERx100(xe) >= 1270) {
+		switch (cache) {
+		case XE_CACHE_NONE:
+			pat_index = 2;
+		break;
+		case XE_CACHE_WT:
+			pat_index = 1;
+		break;
+		case XE_CACHE_WB:
+		default:
+			pat_index = 0;
+		break;
+		}
+	}
+	else if (GRAPHICS_VERx100(xe) >= 1260) {
+		switch (cache) {
+		case XE_CACHE_NONE:
+			pat_index = 0;
+		break;
+		case XE_CACHE_WT:
+			pat_index = 2;
+		break;
+		case XE_CACHE_WB:
+		default:
+			pat_index = 3;
+		break;
+		}
+	}
+	else
+	{
+		switch (cache) {
+		case XE_CACHE_NONE:
+			pat_index = 3;
+		break;
+		case XE_CACHE_WT:
+			pat_index = 2;
+		break;
+		case XE_CACHE_WB:
+		default:
+			pat_index = 0;
+		break;
+		}
+	}
+
+	return pat_index;
+}
+
 /**
  * xe_pt_create() - Create a page-table.
  * @vm: The vm to create for.
@@ -216,6 +295,12 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
 
+	/* __xelp_pte_encode applies to xelp, xehpc and xelpg platform*/
+	vm->ppgtt_pte_encode = __xelp_ppgtt_pte_encode_pat;
+
+	/* __xelp_pde_encode applies to xelp, xehpc and xelpg platform*/
+	vm->ppgtt_pde_encode = __xelp_ppgtt_pde_encode_pat;
+
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index aaf4b7b851e2..0ed69abf8202 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -51,4 +51,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
 		  u64 offset, enum xe_cache_level cache,
 		  u32 pt_level);
+
+u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 261a4b0e8570..fc976e207462 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -336,6 +336,8 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+	u64 (*ppgtt_pte_encode)(u64 pte_pat, u8 pat_index);
+	u64 (*ppgtt_pde_encode)(u64 pte_pat, u8 pat_index);
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.25.1

