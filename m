Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0144CC74A5B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7EE10E490;
	Mon, 13 Mar 2023 08:04:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BAE10E48C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678694647; x=1710230647;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rBuw088mefPnp9hd9u65tqxumCaItH8q9kC03nXtNT4=;
 b=KQpCqORNqpX9Ch7pBrpCTX+h63LZNOPxeCQDtq8MT29B4LRiEyxNSaWU
 XETiy/68JHLxmRzmssvfne7uWb4v5JJ5vsB96VnUMWioNFm609dUB63I8
 QQA4xhzKRDRdcTPfT+GnYJ5998g7rkzQm867oRBUVgjkcV90rj9CxboxV
 kft/qT5gcsjC/nMQPurW+HO1VMC3euY15NhITrfHY9rla8StlR5Hpqa+k
 yNta73Fstzu8w0W3FSEXGw17Xw6DCJam9Ad03axipE+H6ZL5JriDDEUAh
 aQTMC55v0pcu1rTEfIx/uhdbC2mlR9QHq3YEk8GVzCxr4QY46DI/nh2wW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="334565094"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="334565094"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="680933507"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="680933507"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:04:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:03:57 +0100
Message-Id: <20230313080357.2364-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230313080357.2364-1-michal.wajdeczko@intel.com>
References: <20230313080357.2364-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Use GT oriented log messages in
 xe_gt.c
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

Replace generic log messages with ones dedicated for the GT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daa433d0f2f5..edf025a0cafe 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_clock.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
@@ -612,15 +613,14 @@ int xe_gt_init(struct xe_gt *gt)
 
 static int do_gt_reset(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_FULL);
 	err = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_FULL, 5000,
 			     NULL, false);
 	if (err)
-		drm_err(&xe->drm,
-			"GT reset failed to clear GEN11_GRDOM_FULL\n");
+		gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
+		       ERR_PTR(err));
 
 	return err;
 }
@@ -663,14 +663,13 @@ static int do_gt_restart(struct xe_gt *gt)
 
 static int gt_reset(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
 		return -ENODEV;
 
-	drm_info(&xe->drm, "GT reset started\n");
+	gt_info(gt, "reset started\n");
 
 	xe_gt_sanitize(gt);
 
@@ -699,7 +698,7 @@ static int gt_reset(struct xe_gt *gt)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 
-	drm_info(&xe->drm, "GT reset done\n");
+	gt_info(gt, "reset done\n");
 
 	return 0;
 
@@ -708,7 +707,7 @@ static int gt_reset(struct xe_gt *gt)
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_device_mem_access_put(gt_to_xe(gt));
-	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
+	gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	return err;
 }
@@ -722,15 +721,13 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	drm_info(&xe->drm, "Try GT reset\n");
+	gt_info(gt, "trying reset\n");
 
 	/* Don't do a reset while one is already in flight */
 	if (xe_uc_reset_prepare(&gt->uc))
 		return;
 
-	drm_info(&xe->drm, "Doing GT reset\n");
+	gt_info(gt, "reset queued\n");
 	queue_work(gt->ordered_wq, &gt->reset.worker);
 }
 
@@ -747,7 +744,6 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	/* For now suspend/resume is only allowed with GuC */
@@ -767,7 +763,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	drm_info(&xe->drm, "GT suspended\n");
+	gt_info(gt, "suspended\n");
 
 	return 0;
 
@@ -775,14 +771,13 @@ int xe_gt_suspend(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
-	drm_err(&xe->drm, "GT suspend failed: %d\n", err);
+	gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
 }
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
@@ -796,7 +791,7 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	drm_info(&xe->drm, "GT resumed\n");
+	gt_info(gt, "resumed\n");
 
 	return 0;
 
@@ -804,7 +799,7 @@ int xe_gt_resume(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
-	drm_err(&xe->drm, "GT resume failed: %d\n", err);
+	gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
 }
-- 
2.25.1

