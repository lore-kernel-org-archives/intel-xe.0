Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60FDD111B6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8E010E726;
	Wed, 26 Nov 2025 23:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbODeo9c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6AD10E71A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 23:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764198143; x=1795734143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AF/Bezsp082uEQRMzB1cf66z2kJ/EjsA5qynUz87QV4=;
 b=fbODeo9cbCPi2FIFnsl/W1UJNFbCFAQf1ie3Nw07EEJOHanPNRWFBEiw
 sTjAQL6iVnPdf0NYtECRbN9Jtg5R2BVsecx+fS3X9E0uHy2YDMiv8fWtJ
 ZLN7FeeSdj4UAZsDqQykIC1jtHgoaPZAMRZvCi1JGJG7KFiB/Dtea8syH
 Ku82Da6o07J7Z6xbd6kvfHrSd6HtsmmXPpl9Qw3dux2AElemZ5opjM0zE
 H28xbE9cAkcA/khPM1xUjqgdxFbBoT0rKDIFGmCs3wD6VR+PG1LJKcs1B
 c7Y3VroTNeW94W5JN8xy94qioYxzYmPidgf4nzfIgEfr6JCFxAaSMQ5DS Q==;
X-CSE-ConnectionGUID: lCSQVpmwSRaxanVh7i2muQ==
X-CSE-MsgGUID: 4JiGlAbiQqC1QAS6AqRy8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66284551"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66284551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 15:02:23 -0800
X-CSE-ConnectionGUID: b+4yiFWlTYqLkkD8lDmyoQ==
X-CSE-MsgGUID: q5Y9yG/DQGG96sdMgDbNug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224028554"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:02:21 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, matthew.brost@intel.com, shuicheng.lin@intel.com,
 stuart.summers@intel.com, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 10/11] drm/xe: Optimize flushing of L2$ by skipping
 unnecessary page reclaim
Date: Thu, 27 Nov 2025 07:02:11 +0800
Message-ID: <20251126230201.3782788-23-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
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

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 11 +++++++
 drivers/gpu/drm/xe/xe_page_reclaim.c | 47 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h |  3 ++
 drivers/gpu/drm/xe/xe_pat.c          |  9 +-----
 drivers/gpu/drm/xe/xe_pt.c           |  3 +-
 5 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 917a088c28f2..a18a2d59153e 100644
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
@@ -429,6 +437,9 @@
 
 #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
 
+#define LTISEQCHK				XE_REG(0xb49c)
+#define   XE3P_MEDIA_IS_ON			REG_BIT(2)
+
 #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
 
 #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index 740563277872..a0c803cebf15 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -13,8 +13,55 @@
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
+ * Skip PPC flushing in both scenarios below.
+ * - pat_index is transient display (1)
+ * - pat_index is transient app (2) and Media is off
+ *
+ * Return: true when page reclamation is unnecessary, false otherwise.
+ */
+bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma)
+{
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
+	struct xe_mmio *mmio = &tile->primary_gt->mmio;
+	u16 pat_index = vma->attr.pat_index;
+	u32 pat_value;
+	u8 l3_policy;
+	bool is_media_awake;
+
+	/* Ensure called only with Xe3p due to associated PAT index */
+	xe_assert(tile->xe, GRAPHICS_VER(tile->xe) >= 35);
+	xe_assert(tile->xe, pat_index < xe->pat.n_entries);
+
+	pat_value = xe->pat.table[pat_index].value;
+	l3_policy = REG_FIELD_GET(XE2_L3_POLICY, pat_value);
+	is_media_awake = xe_mmio_read32(mmio, LTISEQCHK) & XE3P_MEDIA_IS_ON;
+
+	/**
+	 *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"),
+	 *                  2=XA ("WB - Transient App" for Xe3p), 3=UC
+	 * From Xe3p, transient display flush is taken care by HW, l3_policy = 1.
+	 *
+	 * Also with Xe3p, pat_index=18/19 corresponds to transient app flushing
+	 * which is handled by HW when media is off.
+	 *
+	 * HW will sequence these transient flushes at various sync points so
+	 * any event of page reclamation will hit these sync points before
+	 * page reclamation could execute.
+	 */
+	return (l3_policy == 1 || (!is_media_awake && (pat_index == 18 || pat_index == 19)));
+}
 
 /**
  * xe_page_reclaim_create_prl_bo() - Back a PRL with a suballocated GGTT BO
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index 4ecea05b1f2e..281d2b1fe0be 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -18,6 +18,8 @@
 
 struct xe_tlb_inval;
 struct xe_tlb_inval_fence;
+struct xe_tile;
+struct xe_vma;
 
 struct xe_guc_page_reclaim_entry {
 	u32 dw0;
@@ -45,6 +47,7 @@ struct xe_page_reclaim_list {
 #define XE_PAGE_RECLAIM_INVALID_LIST	-1
 };
 
+bool xe_page_reclaim_skip(struct xe_tile *tile, struct xe_vma *vma);
 struct drm_suballoc *xe_page_reclaim_create_prl_bo(struct xe_tlb_inval *tlb_inval,
 						   struct xe_page_reclaim_list *prl,
 						   struct xe_tlb_inval_fence *fence);
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 717425dd0475..9f8b012d2bf3 100644
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
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 833d6762dd8d..5ecf13c51de9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2009,7 +2009,8 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries)
 		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
 
-	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl : NULL;
+	pt_op->prl = (pt_update_ops->prl.entries &&
+		     !xe_page_reclaim_skip(tile, vma)) ? &pt_update_ops->prl : NULL;
 
 	err = vma_reserve_fences(tile_to_xe(tile), vma);
 	if (err)
-- 
2.52.0

