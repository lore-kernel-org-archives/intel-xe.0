Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F14AC25B79
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DA410E6E3;
	Mon, 20 May 2024 15:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBjrBuy5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CED10E379
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219951; x=1747755951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jVLyay6w4+IoOcSJz7Kg2BpQBNDdDGBLvslx2N2yWAw=;
 b=BBjrBuy5HQ0UZ9bIoFfbE9GYknRlLJr3/anRTyA8v/9/3fXEe3aHUnCs
 fHjBpooJqeIXawBuepCiPuFY8YVbaQiRYtsI/Dm9wJqEBaAQplX65XIYl
 L5W8Tf2tv0mjkZvRh4qA1vAP7/FbSMeQtvvxeoKYNIpduiDpByDtZZHio
 DEVy7KN6y3/6psBdkA2i+9vYczMK5FH9T2zI3Atz8VU86TeP5fM2/JG6D
 zGTOSgmyH83bjFB+dAXqhhZJhuU55t43wptL8SasAY0Ml/RVnAAqrjTG1
 fxN36TBjxB/0kc6/zWO4g1fTXTOsc5PX6UuGD5v9/jp48D/Mi3hlzW032 g==;
X-CSE-ConnectionGUID: RyvA7yTJQoiO5guguJRCKQ==
X-CSE-MsgGUID: 9Mz1CRZMTZq3D13B1w8fVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873220"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:50 -0700
X-CSE-ConnectionGUID: 5lKK0LkoSJ+qCr90zA9qAA==
X-CSE-MsgGUID: ShU2OREUSTW8z8lAXNQqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610511"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 13/18] drm/xe: make gt_remove use devm
Date: Mon, 20 May 2024 16:43:02 +0100
Message-ID: <20240520154249.52888-31-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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
 drivers/gpu/drm/xe/xe_gt.c     |  9 ++++-----
 drivers/gpu/drm/xe/xe_gt.h     |  1 -
 3 files changed, 6 insertions(+), 26 deletions(-)

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
index 1abcc94f4b33..2ef7db36ba13 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -93,16 +93,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
 	gt->uc.guc.submission_state.enabled = false;
 }
 
-/**
- * xe_gt_remove() - Clean up the GT structures before driver removal
- * @gt: the GT object
- *
+/*
  * This function should only act on objects/structures that must be cleaned
  * before the driver removal callback is complete and therefore can't be
  * deferred to a drmm action.
  */
-void xe_gt_remove(struct xe_gt *gt)
+static void gt_remove(void *arg)
 {
+	struct xe_gt *gt = arg;
 	int i;
 
 	xe_uc_remove(&gt->uc);
@@ -566,6 +564,7 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_remove, gt);
 }
 
 static int do_gt_reset(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 8474c50b1b30..866a49037d58 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,7 +43,6 @@ int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
-void xe_gt_remove(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
-- 
2.45.1

