Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1753BC4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238610E32C;
	Sun, 10 Dec 2023 18:07:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B230410E32C
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Dec 2023 18:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702231663; x=1733767663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qufJ8dSoHBynNrnV1gJvCpXhccMZMcR4vTcF4vQPRTA=;
 b=a7Sq8EiYcJWpNEeaPMYEp/W6OuAHDQF9nkWaAmillXeCNQFsRuuAK6O9
 aiROxZNlSrt9bS4+fxZodLG1X7fg17QQVmjOPAjNdBWBqYQT430mMzZR9
 g4Z3nds6/lJrQb8MmDtKNN45OFUgIzd1OaMJ9J155NBVtMinshHGrOC0B
 40yU67jVcOLT2bI5mCpu/Rbw7ZLm8iDsFZU3WfM/tflsFaUr8MsKSHbYc
 TW/+MBradEGaQw8XtTarqlXP1BTjI294IuCnCdNi7I87eYBWnaDH4HN05
 MDgUuB8bNj0pebculMzXLGcOwufD5YwqTZ9OfwzQmup01a+aMMhG16DNM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1437959"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1437959"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843229499"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; d="scan'208";a="843229499"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.192])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 10:07:40 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/8] drm/xe: Use GT oriented functions to report TLB timeout
Date: Sun, 10 Dec 2023 19:06:53 +0100
Message-Id: <20231210180659.1615-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231210180659.1615-1-michal.wajdeczko@intel.com>
References: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We track TLB invalidation seqno per GT and we have GT oriented
message helpers, so it's better to use GT oriented log functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 7eef23a00d77..e3a4131ebb58 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -8,6 +8,7 @@
 #include "abi/guc_actions_abi.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_trace.h"
@@ -30,8 +31,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
-		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
-			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
+		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
+			  fence->seqno, gt->tlb_invalidation.seqno_recv);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -312,9 +313,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
  */
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct drm_printer p = drm_err_printer(__func__);
 	int ret;
 
 	/*
@@ -325,8 +324,10 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 				 tlb_invalidation_seqno_past(gt, seqno),
 				 TLB_TIMEOUT);
 	if (!ret) {
-		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+		struct drm_printer p = xe_gt_err_printer(gt);
+
+		xe_gt_err(gt, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
+			  seqno, gt->tlb_invalidation.seqno_recv);
 		xe_guc_ct_print(&guc->ct, &p, true);
 		return -ETIME;
 	}
-- 
2.25.1

