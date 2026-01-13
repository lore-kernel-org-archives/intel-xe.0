Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF39D29DC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF91810E455;
	Tue, 13 Jan 2026 02:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P64kf0LN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DC010E2FC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272759; x=1799808759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YCDV+uw3dmBSM2JwmPTSQUN8Tl9YjirnSysgLse3fUg=;
 b=P64kf0LNNs1EvlZNAaXKjY7GdYUIQvl6D060XdFF3x1VWTVbi0qCZesP
 TnyZKmoqOzpXCw65UW1SKOtOer7loKvuD3wZoIvTFGLeOEHCrFJYjYV1M
 GVocxSWqcgWF5Xow+D0yAKT9vYWdKHjGeBTBBD2hEg0z5CsuLuycKXSBJ
 0t5Iha4bugpnCXw4GmKmwDyiXXxMtz3FwFjWI3QKlAPZ5gBDDiZkWaX1N
 rbU9jj2N7H1azUj+J8eTbVEMTwNhBGO5c8WB5wCk1DPDBTg1L9nJ0D4Gd
 bjmpLoxUOBQ+48XCNd+UDAL0tjShUcuuriLWlwEpbUdqgHol4d2hhiPxd Q==;
X-CSE-ConnectionGUID: 4UBgdvFpRFq6GxlvoZNHZA==
X-CSE-MsgGUID: SjZ//lAITlGO14RpngcB3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714529"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714529"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:37 -0800
X-CSE-ConnectionGUID: XGSJyBVbStmScsLbul6dSA==
X-CSE-MsgGUID: GywLxj1vTQSoiYB3Qqw2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070324"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 06/12] drm/xe: Taint TLB invalidation seqno lock with
 GFP_KERNEL
Date: Mon, 12 Jan 2026 18:52:26 -0800
Message-Id: <20260113025232.3504648-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

Taint TLB invalidation seqno lock with GFP_KERNEL as TLB invalidations
can be in the path of reclaim (e.g., MMU notifiers).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index dec042248164..014a78502fe5 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -114,6 +114,16 @@ static void tlb_inval_fini(struct drm_device *drm, void *arg)
 	xe_tlb_inval_reset(tlb_inval);
 }
 
+static void primelockdep(struct xe_tlb_inval *tlb_inval)
+{
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&tlb_inval->seqno_lock);
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 /**
  * xe_gt_tlb_inval_init - Initialize TLB invalidation state
  * @gt: GT structure
@@ -140,6 +150,8 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	primelockdep(tlb_inval);
+
 	tlb_inval->job_wq = drmm_alloc_ordered_workqueue(&xe->drm,
 							 "gt-tbl-inval-job-wq",
 							 WQ_MEM_RECLAIM);
-- 
2.34.1

