Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2485CF6BE2
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 01:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E98310E302;
	Wed,  7 Jan 2026 01:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxNVDHCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D652610E302
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 01:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767747893; x=1799283893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b/iZBPCu4WWiCmfFqfYxmm3ulgKCJlL8flVL93WzEDI=;
 b=ZxNVDHCwst3L3c800lzaPIz2sEXx6Q2dHtpIhOS5t+JMaosLiYMdVnUR
 /ZBhdSICeu03/n6W3+191otnVbSgLFJH4JDdHxRN5TzOuFbjPTljcKnMP
 3nDg9OZpGdaGOfXEhyLXjOsjWZTUlfAAPf1oxe+ptk35n85to3yeE+JmQ
 8w/nq1ev002oHaCfvqhUgK1uZue6NTUelkmTi1+EyH1p6/2Pcd2X+9xID
 6pBNx5eOvuqNrbR/WX/gP0c6Ue85rJ3kQ4/ouWP0DSj2t4V1heC6xFIP0
 uzijJkQD1ITNykz+YMZtMSiA9f4hiKxE6mf+aM1+Pla2buk2Yvn37yXxh w==;
X-CSE-ConnectionGUID: BjAR3HzMQayzoinXP1r02A==
X-CSE-MsgGUID: Ub+K3tKfS5Wrx8+1DF74Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72964802"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72964802"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 17:04:53 -0800
X-CSE-ConnectionGUID: 3lJQvvbPSKibPPdCTzLwFQ==
X-CSE-MsgGUID: vDmMFmZ7RhWpiX0gLTsIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="206937255"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa003.jf.intel.com with ESMTP; 06 Jan 2026 17:04:54 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 4/4] drm/xe: Add page reclamation related stats
Date: Wed,  7 Jan 2026 09:04:52 +0800
Message-ID: <20260107010447.4125005-10-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107010447.4125005-6-brian3.nguyen@intel.com>
References: <20260107010447.4125005-6-brian3.nguyen@intel.com>
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

Add page reclaim list (PRL) related stats to GT stats to assist in
debugging and tuning of page reclaim related actions. Include counters
of page sizes added to PRL and if PRL action is issued.

v2:
 - Add PRL_ABORTED_COUNT stats and corresponding changes. (Matthew B)

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       | 5 +++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c  | 3 +++
 drivers/gpu/drm/xe/xe_page_reclaim.c   | 1 +
 drivers/gpu/drm/xe/xe_page_reclaim.h   | 1 +
 drivers/gpu/drm/xe/xe_pt.c             | 5 +++++
 6 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index fb2904bd0abd..8294bcd40310 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -76,6 +76,11 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 		     "hw_engine_group_suspend_lr_queue_us"),
 	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
 		     "hw_engine_group_wait_dma_queue_us"),
+	DEF_STAT_STR(PRL_4K_ENTRY_COUNT, "prl_4k_entry_count"),
+	DEF_STAT_STR(PRL_64K_ENTRY_COUNT, "prl_64k_entry_count"),
+	DEF_STAT_STR(PRL_2M_ENTRY_COUNT, "prl_2m_entry_count"),
+	DEF_STAT_STR(PRL_ISSUED_COUNT, "prl_issued_count"),
+	DEF_STAT_STR(PRL_ABORTED_COUNT, "prl_aborted_count"),
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b92d013091d5..b8accdbc54eb 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -49,6 +49,11 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
+	XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT,
+	XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT,
+	XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT,
+	XE_GT_STATS_ID_PRL_ISSUED_COUNT,
+	XE_GT_STATS_ID_PRL_ABORTED_COUNT,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 6532a88d51e2..774467befbb9 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -97,6 +97,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 			     u64 gpu_addr)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
 	u32 action[] = {
 		XE_GUC_ACTION_PAGE_RECLAMATION,
 		seqno,
@@ -104,6 +105,8 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
 		upper_32_bits(gpu_addr),
 	};
 
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_ISSUED_COUNT, 1);
+
 	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
 			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
 }
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
index 94d4608ebd74..a8f35919a9da 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.c
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
@@ -12,6 +12,7 @@
 
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
+#include "xe_gt_stats.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
index 12f861f357d8..3dd103e37beb 100644
--- a/drivers/gpu/drm/xe/xe_page_reclaim.h
+++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
@@ -91,6 +91,7 @@ void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
 		struct xe_page_reclaim_list *__prl = (prl);				\
 											\
 		xe_page_reclaim_list_invalidate(__prl);					\
+		xe_gt_stats_incr(__gt, XE_GT_STATS_ID_PRL_ABORTED_COUNT, 1);		\
 		vm_dbg(&gt_to_xe(__gt)->drm, "PRL aborted: " fmt, ##__VA_ARGS__);	\
 	} while (0)
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a53944957be4..6703a7049227 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -11,6 +11,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
+#include "xe_gt_stats.h"
 #include "xe_migrate.h"
 #include "xe_page_reclaim.h"
 #include "xe_pt_types.h"
@@ -1587,6 +1588,7 @@ static int generate_reclaim_entry(struct xe_tile *tile,
 				  struct xe_page_reclaim_list *prl,
 				  u64 pte, struct xe_pt *xe_child)
 {
+	struct xe_gt *gt = tile->primary_gt;
 	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
 	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
 	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
@@ -1607,12 +1609,15 @@ static int generate_reclaim_entry(struct xe_tile *tile,
 	 * Only 4K, 64K (level 0), and 2M pages are supported by hardware for page reclaim
 	 */
 	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT, 1);
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
 		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
 	} else if (xe_child->level == 0) {
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT, 1);
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
 		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
 	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT, 1);
 		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
 		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
 	} else {
-- 
2.52.0

