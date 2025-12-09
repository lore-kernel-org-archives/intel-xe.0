Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34CAD3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 07:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD12F10E2DE;
	Tue,  9 Dec 2025 07:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HE3vPFqW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA96710E2DE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765265699; x=1796801699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/bmm+gOZ77DSog/raLaJnCJ97dM7ia4EWkYuMi/PJi4=;
 b=HE3vPFqWdWxaWmybfoYuUAeVzJxlRw+WA0iNHYWLfexhGcMYSWn3gAwa
 tqXCJIH9jZsIS1p6qJihSizIxmP7TL9MJdZlWOkxyP+YGF1dAeslmaYLB
 tUHvElJD7n0QWKyw3iQNWWg9RTlGIJJSFFRcKr71erdNZKw3vcOHV1hTT
 jS4eqmyNr5nFURdDst7P6S4Ya6EU86PLqRdnFRQd1CDUx8WcZ//SVX77F
 DTWe+bclcrflGcHUPPVf9GtaSJcGmAMSD1fU2jqjz+slysefRMai8UquY
 WNks6VW2vZ+gHh2xw5spAPVHV0JlevnzN11ByfY8aKFAejr+ufPHKfHNF g==;
X-CSE-ConnectionGUID: 34StqQMAQQyKKvLXw1hK4g==
X-CSE-MsgGUID: tkchfiqwSdeOQAF7hW+/9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67295872"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67295872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 23:34:59 -0800
X-CSE-ConnectionGUID: /XlCdzVRS9yb03FEJrMaQw==
X-CSE-MsgGUID: 7LlogwqbRx2WFNZJcjSvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="227189466"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2025 23:34:57 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 09/10] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Date: Tue,  9 Dec 2025 15:34:48 +0800
Message-ID: <20251209073438.2432701-21-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209073438.2432701-12-brian3.nguyen@intel.com>
References: <20251209073438.2432701-12-brian3.nguyen@intel.com>
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

In Xe3p and beyond, there are additional hardware managed L2$ flushing
for the deemed transient display and transient app buffers. In those
scenarios, page reclamation is unnecessary resulting in redundant
cachline flushes, so skip over those corresponding ranges.

Add chicken bit to determine media engine status to help facilitate
decision making in L2$ flush skipping.

v2:
 - Elaborated on reasoning for page reclamation skip based on
   Tejas's discussion (Matthew A, Tejas)

v3:
 - Removed MEDIA_IS_ON due to racy condition resulting in removal of
   relevant registers and values. (Matthew A)
 - Moved l3 policy access to xe_pat. (Matthew A)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++++
 drivers/gpu/drm/xe/xe_page_reclaim.c | 36 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
 drivers/gpu/drm/xe/xe_pat.c          | 16 ++++++-------
 drivers/gpu/drm/xe/xe_pat.h          | 11 +++++++++
 drivers/gpu/drm/xe/xe_pt.c           |  4 +++-
 6 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 917a088c28f2..720bf0bde710 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -99,6 +99,14 @@
 #define VE1_AUX_INV				XE_REG(0x42b8)
 #define   AUX_INV				REG_BIT(0)
 
+#define _PAT_PTA				0x4820
+#define   XE2_NO_PROMOTE			REG_BIT(10)
+#define   XE2_COMP_EN				REG_BIT(9)
+#define   XE2_L3_CLOS				REG_GENMASK(7, 6)
+#define   XE2_L3_POLICY				REG_GENMASK(5, 4)
+#define   XE2_L4_POLICY				REG_GENMASK(3, 2)
+#define   XE2_COH_MODE				REG_GENMASK(1, 0)
+
 #define XE2_LMEM_CFG				XE_REG(0x48b0)
 
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index 50961307a557..19b55fa6e48e 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -13,8 +13,44 @@
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
+ * Xe3p and beyond can handle PPC flushing for specific PAT encodings.
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
+	/* Ensure called only with Xe3p due to associated PAT index */
+	xe_assert(tile->xe, GRAPHICS_VER(tile->xe) >= 35);
+
+	l3_policy = xe_pat_index_get_l3_policy(tile->xe, vma->attr.pat_index);
+
+	/**
+	 *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"),
+	 *                  2=XA ("WB - Transient App" for Xe3p), 3=UC
+	 * From Xe3p, transient display flush is taken care by HW, l3_policy = 1.
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
index 4c74d479fc33..2f83a06f59cc 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -18,6 +18,8 @@
 
 struct xe_tlb_inval;
 struct xe_tlb_inval_fence;
+struct xe_tile;
+struct xe_vma;
 
 struct xe_guc_page_reclaim_entry {
 	u64 qw;
@@ -44,6 +46,7 @@ struct xe_page_reclaim_list {
 #define XE_PAGE_RECLAIM_INVALID_LIST	-1
 };
 
+bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma);
 struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
 						   struct xe_page_reclaim_list *prl,
 						   struct xe_tlb_inval_fence *fence);
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 6f48d34711a6..eae6299d70ca 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -9,6 +9,7 @@
 
 #include <generated/xe_wa_oob.h>
 
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_reg_defs.h"
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -23,14 +24,6 @@
 #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
 								   0x4800, 0x4804, \
 								   0x4848, 0x484c)
-#define _PAT_PTA				0x4820
-
-#define XE2_NO_PROMOTE				REG_BIT(10)
-#define XE2_COMP_EN				REG_BIT(9)
-#define XE2_L3_CLOS				REG_GENMASK(7, 6)
-#define XE2_L3_POLICY				REG_GENMASK(5, 4)
-#define XE2_L4_POLICY				REG_GENMASK(3, 2)
-#define XE2_COH_MODE				REG_GENMASK(1, 0)
 
 #define XELPG_L4_POLICY_MASK			REG_GENMASK(3, 2)
 #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
@@ -231,6 +224,13 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
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
index 5749a488d9a9..98491b82005c 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -69,4 +69,15 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
  */
 bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
 
+#define XE_L3_POLICY_WB		0 /* Write-back */
+#define XE_L3_POLICY_XD		1 /* WB - Transient Display */
+#define XE3P_L3_POLICY_XA	2 /* WB - Transient App (Xe3p) */
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
index 4555661b400f..95aadbebaa1e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2020,7 +2020,9 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries)
 		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
 
-	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl : NULL;
+	/* Page reclaim may not be needed due to other features, so skip the corresponding VMA */
+	pt_op->prl = (pt_update_ops->prl.entries &&
+		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl : NULL;
 
 	err = vma_reserve_fences(tile_to_xe(tile), vma);
 	if (err)
-- 
2.52.0

