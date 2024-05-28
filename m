Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8778FC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 18:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2A110E31D;
	Tue, 28 May 2024 18:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BX5OiW71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E6410E31D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716920644; x=1748456644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wu1DAoTrxyGXi7XYLDBWNr2mpfh3OfNhXZzBtffM4oI=;
 b=BX5OiW71Omq3EhovterC4YyjdX+m/7paf6TpUW6EsHkvTTkmSXxnrzd0
 R4gYVuiq91GeGrtmmiCM20wWVLYAf6QZE5bAtZvEq/qK7Yc9bxx25Cii8
 zV+G2WkXfOp2mvsV1lrLQ9d2CQEtselmVhzvF+dQ5VcuPXkh186TbUnNh
 vD7SZ33Tsilt6HZFfxxM4yjMqPyXrl4Pxo5M+oh34iR7pzMv1e7qJzFnJ
 clFPZ2LzO2sMYiR2dJykEjoazqbXATfA14GkYe2erDbUr8n/VLUuEp5rY
 t2MyXvTJiH3V7C0Cvl++HkTGGaKevukv1WDo7ZjXTRFpCMPb4jjZXgt5B A==;
X-CSE-ConnectionGUID: +HuDRjDTTpmSSXEgcXcJDg==
X-CSE-MsgGUID: St7Ei2FRSz2Gje6xso01Kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23842052"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="23842052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 11:24:04 -0700
X-CSE-ConnectionGUID: yrKjdSn1TRmjcr+G08NypA==
X-CSE-MsgGUID: hEST8ucCTR2FDGz/5Bm2Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39979505"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 11:24:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] Revert "drm/xe: make gt_remove use devm"
Date: Tue, 28 May 2024 11:23:54 -0700
Message-ID: <20240528182354.1200424-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

The gt_remove function was explictly added as part of the remove flow
instead of using drmm/devm automatic cleanup due to it being illegal
to remove a component after the driver has been detached from the pci
device; the GSC proxy component is removed as part of gt_remove, so we
need to do it in the pci cleanup flow. The function already has a
comment above it to explain this.

Note that the change to use the devm also caused an invalid pointer
deref in the gsc_proxy unbind function, but I didn't bother to debug
which pointer was bad since we shouldn't be calling the unbind that
late anyway and this revert fixes it.

Both issue were not seen in CI because the GSC loading is temporarily
disabled due to a critical bug, which means we're not binding the
component.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt.c     | 16 +++++++++-------
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 85c1b0c406a6..4c44f23e58ea 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -549,6 +549,7 @@ int xe_device_probe(struct xe_device *xe)
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	int err;
+	u8 last_gt;
 	u8 id;
 
 	xe_pat_init_early(xe);
@@ -647,16 +648,18 @@ int xe_device_probe(struct xe_device *xe)
 		goto err_irq_shutdown;
 
 	for_each_gt(gt, xe, id) {
+		last_gt = id;
+
 		err = xe_gt_init(gt);
 		if (err)
-			goto err_irq_shutdown;
+			goto err_fini_gt;
 	}
 
 	xe_heci_gsc_init(xe);
 
 	err = xe_display_init(xe);
 	if (err)
-		goto err_irq_shutdown;
+		goto err_fini_gt;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
@@ -672,6 +675,15 @@ int xe_device_probe(struct xe_device *xe)
 
 err_fini_display:
 	xe_display_driver_remove(xe);
+
+err_fini_gt:
+	for_each_gt(gt, xe, id) {
+		if (id < last_gt)
+			xe_gt_remove(gt);
+		else
+			break;
+	}
+
 err_irq_shutdown:
 	xe_irq_shutdown(xe);
 err:
@@ -689,12 +701,18 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	u8 id;
+
 	xe_device_remove_display(xe);
 
 	xe_display_fini(xe);
 
 	xe_heci_gsc_fini(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_gt_remove(gt);
+
 	xe_irq_shutdown(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6f4b59a6e710..98c2228b51d0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -93,14 +93,16 @@ void xe_gt_sanitize(struct xe_gt *gt)
 	gt->uc.guc.submission_state.enabled = false;
 }
 
-/*
- * Clean up the GT structures before driver removal. This function should only
- * act on objects/structures that must be cleaned before the driver removal
- * callback is complete and therefore can't be deferred to a drmm action.
+/**
+ * xe_gt_remove() - Clean up the GT structures before driver removal
+ * @gt: the GT object
+ *
+ * This function should only act on objects/structures that must be cleaned
+ * before the driver removal callback is complete and therefore can't be
+ * deferred to a drmm action.
  */
-static void gt_remove(void *arg)
+void xe_gt_remove(struct xe_gt *gt)
 {
-	struct xe_gt *gt = arg;
 	int i;
 
 	xe_uc_remove(&gt->uc);
@@ -566,7 +568,7 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_gt_record_user_engines(gt);
 
-	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_remove, gt);
+	return 0;
 }
 
 void xe_gt_record_user_engines(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index d0747edfe020..9073ac68a777 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
+void xe_gt_remove(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
-- 
2.43.0

