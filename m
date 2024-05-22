Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B18EC25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAD210F495;
	Wed, 22 May 2024 10:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzNtCyvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254CF10F492
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373336; x=1747909336;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OpPcSPB2IO9KhEfGBs9WXweucTaHxLTITA5IWx/leQ4=;
 b=PzNtCyvuI/kZMbVmN9PEdghYmQCzRwvlv7ir9hEOC+m4LVqAvuBw9Yck
 8gkrQwekzp/2x+8zGSpFO5IQbmWAPobEnj0ttvoxfIp4mPecN+Df3LQDf
 /x7utaWeDdIRz8YKaPSXmEN6pymsvAoPO2sBlGUghJ9s64EF3OiHgPSh4
 FW1g1fKoQ8duH8Nz+TDv9/q1wf8CCKqGBhTRKhZ/p4DX8G32JM5+V5VaK
 Zy11NWUsFlVxT5kgirUY/+8SX3YceHYaKPxjpiliyTSVHy2s1ercGY1aO
 qir4LA7eTAvAT8qokrNCzyR8u9OB6gQ9kipU+I7xli+rUgA7iOcHFevIZ Q==;
X-CSE-ConnectionGUID: MvKqOryJTe+NmIjxqY7KvA==
X-CSE-MsgGUID: erNhd/29TwmZVztDn0W4VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562705"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562705"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:16 -0700
X-CSE-ConnectionGUID: ETMTNCFmQwyMisVQedXr/Q==
X-CSE-MsgGUID: C3+XZ7p6S6+zzHTXvdKblA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195320"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 13/18] drm/xe: make gt_remove use devm
Date: Wed, 22 May 2024 11:21:56 +0100
Message-ID: <20240522102143.128069-31-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

No need to hand roll the onion unwind here, just move gt_remove over to
devm which will already have the correct ordering.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 22 ++--------------------
 drivers/gpu/drm/xe/xe_gt.c     | 16 +++++++---------
 drivers/gpu/drm/xe/xe_gt.h     |  1 -
 3 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index fd203a446709..49ea1ba340e6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -537,7 +537,6 @@ int xe_device_probe(struct xe_device *xe)
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	int err;
-	u8 last_gt;
 	u8 id;
 
 	xe_pat_init_early(xe);
@@ -625,18 +624,16 @@ int xe_device_probe(struct xe_device *xe)
 		goto err_irq_shutdown;
 
 	for_each_gt(gt, xe, id) {
-		last_gt = id;
-
 		err = xe_gt_init(gt);
 		if (err)
-			goto err_fini_gt;
+			goto err_irq_shutdown;
 	}
 
 	xe_heci_gsc_init(xe);
 
 	err = xe_display_init(xe);
 	if (err)
-		goto err_fini_gt;
+		goto err_irq_shutdown;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
@@ -652,15 +649,6 @@ int xe_device_probe(struct xe_device *xe)
 
 err_fini_display:
 	xe_display_driver_remove(xe);
-
-err_fini_gt:
-	for_each_gt(gt, xe, id) {
-		if (id < last_gt)
-			xe_gt_remove(gt);
-		else
-			break;
-	}
-
 err_irq_shutdown:
 	xe_irq_shutdown(xe);
 err:
@@ -678,18 +666,12 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
-	struct xe_gt *gt;
-	u8 id;
-
 	xe_device_remove_display(xe);
 
 	xe_display_fini(xe);
 
 	xe_heci_gsc_fini(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_remove(gt);
-
 	xe_irq_shutdown(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 98c2228b51d0..6f4b59a6e710 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -93,16 +93,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
 	gt->uc.guc.submission_state.enabled = false;
 }
 
-/**
- * xe_gt_remove() - Clean up the GT structures before driver removal
- * @gt: the GT object
- *
- * This function should only act on objects/structures that must be cleaned
- * before the driver removal callback is complete and therefore can't be
- * deferred to a drmm action.
+/*
+ * Clean up the GT structures before driver removal. This function should only
+ * act on objects/structures that must be cleaned before the driver removal
+ * callback is complete and therefore can't be deferred to a drmm action.
  */
-void xe_gt_remove(struct xe_gt *gt)
+static void gt_remove(void *arg)
 {
+	struct xe_gt *gt = arg;
 	int i;
 
 	xe_uc_remove(&gt->uc);
@@ -568,7 +566,7 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_gt_record_user_engines(gt);
 
-	return 0;
+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_remove, gt);
 }
 
 void xe_gt_record_user_engines(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 9073ac68a777..d0747edfe020 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -56,7 +56,6 @@ int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
-void xe_gt_remove(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
-- 
2.45.1

