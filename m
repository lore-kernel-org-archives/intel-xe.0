Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B76BEB64DD
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 12:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F65D10E51B;
	Wed, 12 Jul 2023 12:56:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE7D10E51B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jul 2023 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689166588; x=1720702588;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cyQWdCSt9nunvoxMzBDigAL+Mw17gziPDW720yo2C0Y=;
 b=VyNYWSC0YMFj2afnmcnuor/PJO1FDTDxYtOQeQ03rfXQ/EmtzOXn7coO
 uB70UzCtSSvOvj0oUa0DRFoNAPBMKAHUzzYHYuqlOl+5iQy3yVAJ9ViHI
 nTSujpX8BIoL81oIykDE3jfg/afIPPttP8uJpaHtdsOIwjE1vDlaI+3Tl
 SI/RnGWOkR9daJcGM5JWmUh3JqscK2TmMfnN4Tbh0iYb2VV76tm2gqdjq
 pPxieywATR+8bDcBimtkJR2Q0BIdUBrJgebnOwP8aeoepaW1zv+02Nvqe
 qmfRWxev4CVXC6OC1+Re4BR6ghb1L3A9alQGfjfnWBzOkigzlv2WMHWv9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431014037"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="431014037"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 05:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="724876531"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="724876531"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 05:56:26 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jul 2023 18:26:40 +0530
Message-Id: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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

Different platforms has different PAT encoding in PTE format, add
correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).

Bspec: 45101, 71582
Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 110 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |   1 +
 3 files changed, 129 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pte.h

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 00855681c0d5..e7f8bd4dd518 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -16,6 +16,7 @@
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
+#include "xe_pte.h"
 
 struct xe_pt_dir {
 	struct xe_pt pt;
@@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
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
+	pte = xe_vma_vm(vma)->pte_encode(pte, cache);
 
 	if (pt_level == 1)
 		pte |= XE_PDE_PS_2M;
@@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 	}
 }
 
+static u64 xelp_pte_encode_pat(u8 pat_index)
+{
+	u64 pte_pat = 0;
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
+static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
+{
+	pte &= ~XELP_PAT_MASK;
+
+	switch (cache) {
+	case XE_CACHE_NONE:
+		pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
+		break;
+	case XE_CACHE_WT:
+		pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
+		break;
+	case XE_CACHE_WB:
+		pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
+		break;
+	default:
+		/* pte |= PPAT_CACHED; */
+		break;
+	}
+
+	return pte;
+}
+
+static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
+{
+	pte &= ~XELP_PAT_MASK;
+
+	/* Initially assumed as CLOS0.
+	 * To Do: CLOS1/CLOS2 has to be set depending on requirement
+	 */
+	switch (cache) {
+	case XE_CACHE_NONE:
+		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
+		break;
+	case XE_CACHE_WT:
+		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
+		break;
+	case XE_CACHE_WB:
+		pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
+		break;
+	default:
+		/* pte |= PPAT_CACHED; */
+		break;
+	}
+
+	return pte;
+}
+
+static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
+{
+	pte &= ~XELP_PAT_MASK;
+
+	/* Initially assumed as Non cohorent mode, correct values
+	 * has to be set depending on requirement.
+	 */
+	switch (cache) {
+	case XE_CACHE_NONE:
+		pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
+		break;
+	case XE_CACHE_WT:
+		pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
+		break;
+	case XE_CACHE_WB:
+		pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
+		break;
+	default:
+		/* pte |= PPAT_CACHED; */
+		break;
+	}
+
+	return pte;
+}
+
 /**
  * xe_pt_create() - Create a page-table.
  * @vm: The vm to create for.
@@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
 
+	if (GRAPHICS_VERx100(vm->xe) >= 1270)
+		vm->pte_encode = __xelpg_pte_encode;
+	else if (GRAPHICS_VERx100(vm->xe) >= 1260)
+		vm->pte_encode = __xehpc_pte_encode;
+	else
+		vm->pte_encode = __xelp_pte_encode;
+
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
diff --git a/drivers/gpu/drm/xe/xe_pte.h b/drivers/gpu/drm/xe/xe_pte.h
new file mode 100644
index 000000000000..8b3b5b471a99
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pte.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _XE_PTE_H_
+#define _XE_PTE_H_
+
+#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3)
+#define XELP_PAT_WB_CACHE              0
+#define XELP_PAT_WC_CACHE              1
+#define XELP_PAT_WT_CACHE              2
+#define XELP_PAT_UNCACHE               3
+
+#define XEHPC_PAT_CLOS0_UNCACHE        0
+#define XEHPC_PAT_CLOS0_WC_CACHE       1
+#define XEHPC_PAT_CLOS0_WT_CACHE       2
+#define XEHPC_PAT_CLOS0_WB_CACHE       3
+#define XEHPC_PAT_CLOS1_WT_CACHE       4
+#define XEHPC_PAT_CLOS1_WB_CACHE       5
+#define XEHPC_PAT_CLOS2_WT_CACHE       6
+#define XEHPC_PAT_CLOS2_WB_CACHE       7
+
+#define XELPG_PAT_WB_CACHE             0
+#define XELPG_PAT_WT_CACHE             1
+#define XELPG_PAT_UNCACHE              2
+#define XELPG_PAT_1_WAY_WB_CACHE       3
+#define XELPG_PAT_2_WAY_WB_CACHE       4
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index edb3c99a9c81..9e1b33c17d05 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -312,6 +312,7 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+	u64 (*pte_encode)(u64 pte, enum xe_cache_level cache);
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.25.1

