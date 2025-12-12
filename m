Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE14D59D96
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E4610E075;
	Fri, 12 Dec 2025 21:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iE8FYY3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF7E10E971
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765575162; x=1797111162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CiJLnGrb0I5CLjwmFTKF4nhbZQHiocqMjn4YiBk6IpA=;
 b=iE8FYY3DH1qnRfJurAjklKJEbUYzi2vTzCiJTbc2c0HHMIjwo9N1Opd8
 azjauX2tFJ4rwLMOfjJfUl8eWUFo2oaQdLzfvCcgz4sJ89EeLNGQWRMof
 NyPmHt9QoBPUVXpH9xqlkRtUYvUAdeL5hHlPrdlH1cwSfP88/BFm72e0U
 7mEWk4dUg7+N+uG8Flpi92WmIABVMcdJeRXhmWZX0DXmdc1RKLitVkzdZ
 IMtKRlq1c4Z3KrJbIDA0yqaSLtlb/fHifrWC1j+AvP1Tb7u6e5igLdM8K
 X0sOttEneS/OEI79oH7uZVbKWlwrkP5R3D8YkHHyQCbVxHrhDti2Lapdz Q==;
X-CSE-ConnectionGUID: Ys+XsLq7TpyIrCoGmP3Xjw==
X-CSE-MsgGUID: iBgyI5gySziWTkI6t6wfmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67541912"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67541912"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:32:42 -0800
X-CSE-ConnectionGUID: IzCoiBY+SdSm/EzPVVupaA==
X-CSE-MsgGUID: Nowe2vWRT2W0U/M/uZRTBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228244706"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:32:39 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v6 09/10] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Date: Sat, 13 Dec 2025 05:32:35 +0800
Message-ID: <20251212213225.3564537-21-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212213225.3564537-12-brian3.nguyen@intel.com>
References: <20251212213225.3564537-12-brian3.nguyen@intel.com>
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

There are additional hardware managed L2$ flushing such as the
transient display. In those scenarios, page reclamation is
unnecessary resulting in redundant cacheline flushes, so skip
over those corresponding ranges.

v2:
 - Elaborated on reasoning for page reclamation skip based on
   Tejas's discussion. (Matthew A, Tejas)

v3:
 - Removed MEDIA_IS_ON due to racy condition resulting in removal of
   relevant registers and values. (Matthew A)
 - Moved l3 policy access to xe_pat. (Matthew A)

v4:
 - Updated comments based on previous change. (Tejas)
 - Move back PAT index macros to xe_pat.c.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_page_reclaim.c | 32 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
 drivers/gpu/drm/xe/xe_pat.c          |  8 +++++++
 drivers/gpu/drm/xe/xe_pat.h          | 10 +++++++++
 drivers/gpu/drm/xe/xe_pt.c           |  3 ++-
 5 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index 0cce5ad2e33b..fd8c33761127 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -13,8 +13,40 @@
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_macros.h"
+#include "xe_mmio.h"
+#include "xe_pat.h"
 #include "xe_sa.h"
 #include "xe_tlb_inval_types.h"
+#include "xe_vm.h"
+
+/**
+ * xe_page_reclaim_skip() - Decide whether PRL should be skipped for a VMA
+ * @tile: Tile owning the VMA
+ * @vma: VMA under consideration
+ *
+ * PPC flushing may be handled by HW for specific PAT encodings.
+ * Skip PPC flushing/Page Reclaim for scenarios below due to redundant
+ * flushes.
+ * - pat_index is transient display (1)
+ *
+ * Return: true when page reclamation is unnecessary, false otherwise.
+ */
+bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma)
+{
+	u8 l3_policy;
+
+	l3_policy = xe_pat_index_get_l3_policy(tile->xe, vma->attr.pat_index);
+
+	/*
+	 *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
+	 * Transient display flushes is taken care by HW, l3_policy = 1.
+	 *
+	 * HW will sequence these transient flushes at various sync points so
+	 * any event of page reclamation will hit these sync points before
+	 * page reclamation could execute.
+	 */
+	return (l3_policy == XE_L3_POLICY_XD);
+}
 
 /**
  * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index ded098298d72..a4f58e0ce9b4 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -18,6 +18,8 @@
 
 struct xe_tlb_inval;
 struct xe_tlb_inval_fence;
+struct xe_tile;
+struct xe_vma;
 
 struct xe_guc_page_reclaim_entry {
 	u64 qw;
@@ -68,6 +70,7 @@ static inline bool xe_page_reclaim_list_valid(struct xe_page_reclaim_list *prl)
 	       prl->num_entries != XE_PAGE_RECLAIM_INVALID_LIST;
 }
 
+bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma);
 struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
 						   struct xe_page_reclaim_list *prl,
 						   struct xe_tlb_inval_fence *fence);
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6f48d34711a6..2c3375e0250b 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -9,6 +9,7 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -231,6 +232,13 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
 	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
 }
 
+u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
+{
+	WARN_ON(pat_index >= xe->pat.n_entries);
+
+	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
+}
+
 static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			int n_entries)
 {
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 5749a488d9a9..d5dadfb7f924 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -69,4 +69,14 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
  */
 bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
 
+#define XE_L3_POLICY_WB		0 /* Write-back */
+#define XE_L3_POLICY_XD		1 /* WB - Transient Display */
+#define XE_L3_POLICY_UC		3 /* Uncached */
+/**
+ * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_index.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ */
+u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6e01675213c7..6cd78bb2b652 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2030,7 +2030,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
 
 	/* Page reclaim may not be needed due to other features, so skip the corresponding VMA */
-	pt_op->prl = (xe_page_reclaim_list_valid(&pt_update_ops->prl)) ? &pt_update_ops->prl : NULL;
+	pt_op->prl = (xe_page_reclaim_list_valid(&pt_update_ops->prl) &&
+		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl : NULL;
 
 	err = vma_reserve_fences(tile_to_xe(tile), vma);
 	if (err)
-- 
2.52.0

