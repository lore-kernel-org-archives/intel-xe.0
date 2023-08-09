Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B16DC001B0
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 12:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685E710E422;
	Wed,  9 Aug 2023 12:06:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF94410E421
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 12:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691582772; x=1723118772;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PxJnTm3xFWu1WyFHwxT7oAe42O+bhPbHhpmo3jBwsac=;
 b=LW59DGqVgn/ceyNQyYYyTWt2rPPJ2NZRmvC6XRWd+ZHrvg8Cr31BnR0T
 q1EtAGBpAuwSZJ21tjStXSn3QziV3H5IcYeHspFwGXlkE16s2wGXtvQ2n
 uMr8JWcQ/p+xgdBnHgwNB9Vb8TNTA//wL1xs9sb0ppdywfTBSh/zzRDDK
 F5pvr7O4jZy+kS1zxI/LpLi9C9DAHEJpbAvWFKvBVDe/BveQ6rDDhmLAH
 hJ110Orkq8DFEM3wpAhrqluQTn/UYATbpAUEb4Hz8MFslfEOAOabiO7O/
 SiL9tS5vm/vLI5J3ky3V1IA4adWbtF9+JzemCRHH+lbtwodZSQFykSKyp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350689061"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="350689061"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 05:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855501641"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="855501641"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 05:06:11 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 17:37:30 +0530
Message-Id: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] Different platforms has different PAT encoding
 in PTE and PDE format, add correct PAT encoding for pre-Xe2 platforms (XELP,
 XEHPC, XELPG).
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

Bspec: 45101, 71582
Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h |  5 ++
 drivers/gpu/drm/xe/xe_pat.c          | 76 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pat.h          | 25 +++++++++
 drivers/gpu/drm/xe/xe_pt.c           | 28 +++-------
 drivers/gpu/drm/xe/xe_pt_types.h     |  3 +-
 6 files changed, 119 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 766df07de979..0675a60f17f9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
+#include "xe_pat.h"
 
 #ifdef CONFIG_LOCKDEP
 struct lockdep_map xe_device_mem_access_lockdep_map = {
@@ -292,6 +293,8 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
+	xe_pte_pat_init(xe);
+
 	err = xe_mmio_probe_vram(xe);
 	if (err)
 		goto err_irq_shutdown;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bfedcc7571b0..3c64834c32fc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -23,6 +23,8 @@
 #include "intel_display_device.h"
 #endif
 
+#include "xe_pt_types.h"
+
 struct xe_ggtt;
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
@@ -470,6 +472,9 @@ struct xe_device {
 		u32 lvds_channel_mode;
 	} params;
 #endif
+	const u32 *pte_pat_table;
+	u64 (*ppgtt_pte_encode)(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache);
+	u64 (*ppgtt_pde_encode)(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache);
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index b56a65779d26..8f4c33d0f7dc 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -62,6 +62,24 @@ static const u32 mtl_pat_table[] = {
 	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
 };
 
+static const u32 xelp_pte_pat_table[] = {
+	[XE_CACHE_NONE] = XELP_PAT_UNCACHE,
+	[XE_CACHE_WT] = XELP_PAT_WT_CACHE,
+	[XE_CACHE_WB] = XELP_PAT_WB_CACHE,
+};
+
+static const u32 xehpc_pte_pat_table[] = {
+	[XE_CACHE_NONE] = XEHPC_PAT_CLOS0_UNCACHE,
+	[XE_CACHE_WT] = XEHPC_PAT_CLOS0_WT_CACHE,
+	[XE_CACHE_WB] = XEHPC_PAT_CLOS0_WB_CACHE,
+};
+
+static const u32 xelpg_pte_pat_table[] = {
+	[XE_CACHE_NONE] = XELPG_PAT_UNCACHE,
+	[XE_CACHE_WT] = XELPG_PAT_WT_CACHE,
+	[XE_CACHE_WB] = XELPG_PAT_WB_CACHE,
+};
+
 static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
 {
 	for (int i = 0; i < n_entries; i++) {
@@ -111,3 +129,61 @@ void xe_pat_init(struct xe_gt *gt)
 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 }
+
+u32 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
+{
+	return xe->pte_pat_table[cache];
+}
+
+static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat, enum xe_cache_level cache)
+{
+	u32 pat_index = xe_pat_get_index(xe, cache);
+
+	pde_pat &= ~(XELP_PDE_PAT_MASK);
+
+	if (pat_index & BIT(0))
+		pde_pat |= BIT(3);
+
+	if (pat_index & BIT(1))
+		pde_pat |= BIT(4);
+
+	if (pat_index & BIT(2))
+		pde_pat |= BIT(12);
+
+	return pde_pat;
+}
+
+static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat, enum xe_cache_level cache)
+{
+	u32 pat_index = xe_pat_get_index(xe, cache);
+
+	pte_pat &= ~(XELP_PTE_PAT_MASK);
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
+void xe_pte_pat_init(struct xe_device *xe)
+{
+	if (GRAPHICS_VERx100(xe) >= 1270) {
+		xe->pte_pat_table = xelpg_pte_pat_table;
+		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
+		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
+	} else if (GRAPHICS_VERx100(xe) >= 1260) {
+		xe->pte_pat_table = xehpc_pte_pat_table;
+		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
+		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
+	} else {
+		xe->pte_pat_table = xelp_pte_pat_table;
+		xe->ppgtt_pte_encode = xelp_ppgtt_pte_encode_pat;
+		xe->ppgtt_pde_encode = xelp_ppgtt_pde_encode_pat;
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 659de4008131..1138ac78943f 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -6,8 +6,33 @@
 #ifndef _XE_PAT_H_
 #define _XE_PAT_H_
 
+#include "xe_device_types.h"
+
+#define XELP_PTE_PAT_MASK                  (BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
+#define XELP_PDE_PAT_MASK                  (BIT_ULL(12) | BIT_ULL(4) | BIT_ULL(3))
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
 struct xe_gt;
 
 void xe_pat_init(struct xe_gt *gt);
+void xe_pte_pat_init(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5709518e314b..eccb0942ff46 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -58,19 +58,16 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
  * Return: An encoded page directory entry. No errors.
  */
 u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
-		  const enum xe_cache_level level)
+		  const enum xe_cache_level cache)
 {
 	u64 pde;
+	struct xe_vm *vm = bo->vm;
+	struct xe_device *xe = vm->xe;
 
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
-	/* FIXME: I don't think the PPAT handling is correct for MTL */
-
-	if (level != XE_CACHE_NONE)
-		pde |= PPAT_CACHED_PDE;
-	else
-		pde |= PPAT_UNCACHED;
+	pde = xe->ppgtt_pde_encode(xe, pde, cache);
 
 	return pde;
 }
@@ -78,6 +75,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
 			struct xe_vma *vma, u32 pt_level)
 {
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
 	if (unlikely(vma && xe_vma_read_only(vma)))
@@ -86,19 +86,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
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
+	pte = xe->ppgtt_pte_encode(xe, pte, cache);
 
 	if (pt_level == 1)
 		pte |= XE_PDE_PS_2M;
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 2ed64c0a4485..2a94ecbaa844 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -9,9 +9,10 @@
 #include "xe_pt_walk.h"
 
 enum xe_cache_level {
-	XE_CACHE_NONE,
+	XE_CACHE_NONE = 0,
 	XE_CACHE_WT,
 	XE_CACHE_WB,
+	XE_CACHE_LAST,
 };
 
 #define XE_VM_MAX_LEVEL 4
-- 
2.25.1

