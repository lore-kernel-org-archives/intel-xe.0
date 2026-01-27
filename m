Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E29BD2F004
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 11:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D8710E55C;
	Tue, 27 Jan 2026 11:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu2cCM10";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D8D10E572
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769515063; x=1801051063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zdX5gjhZz/ZtBTfKJCOQBd7TG1203c+bWuGyzn5EZ2E=;
 b=iu2cCM10oQwsMq45PX7MxZcnXRj2/SOi3+9iGZ8BW5Cgv+9SAMl67J4W
 n6uz0Z/WG5nSoex0Ov9En6HTEg8nIskEa/hJfxytq1bTpsjz85DmFg9YS
 onflk6JvYGQD4NFytlN8UzeOAmbyZU/T6kRtetS17lTcEFgWYj4M6FSV3
 P02C9qNx/O8TGkwRurIaMqiXcc4HHhZTa7T9BXbzp7aIESCBysPmHn5hN
 Byn9TeVHOPu07s4HJlfS3N0J63YhJ8jmx1B0s65tFF0xpvnzL3JqAVuGG
 25PjE8HsnPZYyPebQSMN6fPnKpsboyhP+IF1UWc1T/PCpVFr4h8LEDPvw w==;
X-CSE-ConnectionGUID: 9mMU6YpBT9SjgJtD4KoqqA==
X-CSE-MsgGUID: n9enLvjoSeaQ+QQIyPL99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74330362"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74330362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:57:43 -0800
X-CSE-ConnectionGUID: m7DN5K7QR7y3vCVdugH1rg==
X-CSE-MsgGUID: tgvXEMVUQ+mYQwYj1Vdn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="245576220"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:57:41 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, matthew.d.roper@intel.com,
 priyanka.dandamudi@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 2/2] drm/xe: Add prefetch fault support for Xe3p
Date: Tue, 27 Jan 2026 17:27:13 +0530
Message-ID: <20260127115713.869000-3-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127115713.869000-1-varun.gupta@intel.com>
References: <20260127115713.869000-1-varun.gupta@intel.com>
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

Xe3p prefetches memory ranges and it notifies software via an additional
bit in the page fault descriptor that the fault was caused by prefetch.
The prefetch bit should only be in the reply if the page fault handling
was not successful, which allows the HW to avoid generating a CAT error
for prefetch faults.

Based on original patches by Brian Welty <brian.welty@intel.com> and
Priyanka Dandamudi <priyanka.dandamudi@intel.com>.

v2: Changed comment wording from "repairs" to "handling" for clarity
    (Matt Roper)

Bspec: 59311
Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
 drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
 6 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index fb2904bd0abd..340d0831b752 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -35,6 +35,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
 	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
 	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
+	DEF_STAT_STR(PREFETCH_PAGEFAULT_COUNT, "prefetch_pagefault_count"),
 	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
 	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
 	DEF_STAT_STR(SVM_2M_PAGEFAULT_COUNT, "svm_2M_pagefault_count"),
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index b92d013091d5..82e578726088 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -13,6 +13,7 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
+	XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index a33ea288b907..b1b7cea26212 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
 #define PFD_ACCESS_TYPE		GENMASK(1, 0)
 #define PFD_FAULT_TYPE		GENMASK(3, 2)
 #define PFD_VFID		GENMASK(9, 4)
-#define PFD_RSVD_1		GENMASK(11, 10)
+#define PFD_RSVD_1		BIT(10)
+#define XE3P_PFD_PREFETCH	BIT(11)
 #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
 #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
 
@@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
 
 	u32 dw1;
 #define PFR_VFID		GENMASK(5, 0)
-#define PFR_RSVD_1		BIT(6)
+#define XE3P_PFR_PREFETCH	BIT(6)
 #define PFR_ENG_INSTANCE	GENMASK(12, 7)
 #define PFR_ENG_CLASS		GENMASK(15, 13)
 #define PFR_PDATA		GENMASK(31, 16)
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 719a18187a31..b6c12e563067 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 		FIELD_PREP(PFR_ASID, pf->consumer.asid),
 
 		FIELD_PREP(PFR_VFID, vfid) |
+		FIELD_PREP(XE3P_PFR_PREFETCH, pf->consumer.prefetch) |
 		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
 		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
 		FIELD_PREP(PFR_PDATA, pdata),
@@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
 	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
 	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
+	pf.consumer.prefetch = FIELD_GET(XE3P_PFD_PREFETCH, msg[2]);
 	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
 		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
 	else
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 34dac4280b9d..97d93ed616f9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -223,6 +223,12 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 
 static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
 {
+	/* Don't spam log for prefetch accesses, just add to stats */
+	if (pf->consumer.prefetch) {
+		xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT, 1);
+		return;
+	}
+
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
 		   "\tFaulted Address: 0x%08x%08x\n"
 		   "\tFaultType: %d\n"
@@ -262,6 +268,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 			xe_pagefault_error_account(&pf, err);
 			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
 				   ERR_PTR(err));
+		} else {
+			/*
+			 * Clear prefetch bit - only needed to suppress CAT errors
+			 * on unsuccessful handling.
+			 */
+			pf.consumer.prefetch = 0;
 		}
 
 		pf.producer.ops->ack_fault(&pf, err);
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index d3b516407d60..4837f2b40079 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -84,8 +84,14 @@ struct xe_pagefault {
 		u8 engine_class;
 		/** @consumer.engine_instance: engine instance */
 		u8 engine_instance;
+		/**
+		 * @consumer.prefetch: fault is caused by HW prefetch.
+		 * Echo in response to suppress CAT errors on 
+		 * unsuccessful handling.
+		 */
+		u8 prefetch;
 		/** consumer.reserved: reserved bits for future expansion */
-		u8 reserved[7];
+		u8 reserved[6];
 	} consumer;
 	/**
 	 * @producer: State for the producer (i.e., HW/FW interface). Populated
-- 
2.43.0

