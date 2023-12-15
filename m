Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713A4C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 16:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3351310EA54;
	Fri, 15 Dec 2023 16:25:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BBF10EA50
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 16:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702657517; x=1734193517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=euXbB2oWImtXYZYJ8mkMav4E1ahAUFg7+Rv0vn+jTGA=;
 b=nAUuVx/k7cnXfBSGFjH/uzf0qhiDcpUZRLnZMs1jyiP+RBBevT2V5YuQ
 uV9/pvnm+l+LI+wyAcQEwAlwyU8ARmIKuP/q/x+NBLNWa+sQjzigJowHF
 GeNXclhD9e0BFc2meP41dUWEKNa36g31Op2DgsBH28DFrDiaj8eP6lrNP
 NDMdUpixUxLVKcMb3m6CsY7G0Xe4QYWQif4i+YhkwgtVOyQhdQQYEbaxs
 4Gl/7h5uFRlFMaLoGEec9mcxHEOGXjMYwiqKbynzPohGp5gu9wW7fGy7e
 OlNrFo/bNlayYNpqoDREwpwG0XOhx/261KcoUCK1AsJA5164WjZK9mB4h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459617415"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459617415"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1021984092"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="1021984092"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.144.211])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 08:25:15 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 02/10] drm/xe: Report TLB timeout using GT oriented
 functions
Date: Fri, 15 Dec 2023 17:24:54 +0100
Message-Id: <20231215162502.1879-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231215162502.1879-1-michal.wajdeczko@intel.com>
References: <20231215162502.1879-1-michal.wajdeczko@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
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

