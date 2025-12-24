Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE81E78498
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 23:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5BE1134CD;
	Wed, 24 Dec 2025 23:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN94ypI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B2F1134CB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 23:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766619404; x=1798155404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j2qQ4dBVneGW9eVvSk3hKQCcEctXP5T3vnebaWz23M=;
 b=eN94ypI6GOcKhzs+DnVFgRMk0atKMUTICVhYchngq4cTwy0TLXrwsr+q
 bUAJPgSkxgMWacJ8e6JVddh5y7Ltgk8BuO6HWyfA0CHxg9yzEGKNag+kv
 vhdTSb/bT8s8OHQButKTmCUAEjmUVPtj/aD4RVt52k/QsbOCYRU+4lqKd
 L0EOEUbGOUVowYgQ7gHzq2jQfQ54rMGvWdQ+8t0PkZi36a2IX2k96G4ap
 SUbLzOmGacIGJhwww81ZoXqyokitN8/2fJbi7ePZONJtl4YHiZQwIbH01
 HuVKDjU47UGRDBuJ0fUS+SGHsmPgccRt5mdtXGgOXSjIYdHq2tf4iGLQY g==;
X-CSE-ConnectionGUID: 2tp6CxhfT0WR0tSEU5uaAw==
X-CSE-MsgGUID: Se340wXWRn+Y5Qj8Yn31UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="56007860"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="56007860"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 15:36:43 -0800
X-CSE-ConnectionGUID: +H7YwWvqReetuv46HojE7g==
X-CSE-MsgGUID: VLNGZw2VR/eeWetUVt/3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="237502916"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 15:36:42 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 2/2] drm/xe: Add page reclamation related stats
Date: Thu, 25 Dec 2025 07:36:41 +0800
Message-ID: <20251224233638.1535283-6-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224233638.1535283-4-brian3.nguyen@intel.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
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

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       | 4 ++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 4 ++++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c  | 3 +++
 drivers/gpu/drm/xe/xe_pt.c             | 5 +++++
 4 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index fb2904bd0abd..ab61d2579e87 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -76,6 +76,10 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 		     "hw_engine_group_suspend_lr_queue_us"),
 	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
 		     "hw_engine_group_wait_dma_queue_us"),
+	DEF_STAT_STR(PRL_4K_ENTRY_COUNT, "prl_4k_entry_count"),
+	DEF_STAT_STR(PRL_64K_ENTRY_COUNT, "prl_64k_entry_count"),
+	DEF_STAT_STR(PRL_2M_ENTRY_COUNT, "prl_2m_entry_count"),
+	DEF_STAT_STR(PRL_ISSUED_COUNT, "prl_issued_count"),
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b92d013091d5..424eb8ec9c09 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -49,6 +49,10 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
 	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
+	XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT,
+	XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT,
+	XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT,
+	XE_GT_STATS_ID_PRL_ISSUED_COUNT,
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
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a79734079ef3..e83bc4503e5b 100644
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

