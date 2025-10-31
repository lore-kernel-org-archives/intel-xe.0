Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0655ECCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 22:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B247410E039;
	Fri, 31 Oct 2025 22:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAmfYcl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4A810E039
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 22:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761949398; x=1793485398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zB7LSefI3K++vvwBFJfzfNR+cDsycMxJoWB4HHvN3Y=;
 b=LAmfYcl39Oe7QL6I1JHyJ1N0clnc9o7BKQ0LL9unKR3GJYyJht/pQOC5
 dOyUHAxJXOJgPwslsAL8dXcDnVh/S4TxmGvOzCiEr6ZOspabC36WwVvv7
 3iShBsseSEkyHXMndg0SZ774jJ7L0anYiGHq7j4dqnllRMVenANG9aZcZ
 GrSpSVTs/P23b7z7eqtxV9GmuiTuQh57pyCRti5/QVaL6wjWHq+4Czp0o
 iNN9vwRjXw5aoxhVbPhodF2IFMqul0IzPlewR+tDy5xvidPP3DgrD35D2
 9DozeYPIjXRFs2/0htzyCQvE5SVtotfm10gDFS+R0LivlvqTjdwq7lMex Q==;
X-CSE-ConnectionGUID: HTIg+R1YR+ONiqEhaeA0Xg==
X-CSE-MsgGUID: SBsVRAgkTk6oSOJX3VNFbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75467023"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75467023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 15:23:17 -0700
X-CSE-ConnectionGUID: sDBhTDzvR+GghgTcZfbLbQ==
X-CSE-MsgGUID: h1dXgj7UTEqeAY8+uVnHew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="186465322"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 15:23:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI] drm/xe: Inline gt_reset in the worker
Date: Fri, 31 Oct 2025 15:22:45 -0700
Message-ID: <20251031222244.37735-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.0
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

gt_reset() doesn't make sense by itself: it can only be called as part
of the worker. Inline it there to avoid it being called from elsewhere
and clarify the gt_reset() vs do_gt_reset() paths. Note that the error
return from gt_reset() was just being ignored.

Also add a comment to the xe_pm_runtime_put() to make sure the
get()/put() pair is clear.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8b..60bac65c8b9d7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -813,21 +813,18 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
-static int gt_reset(struct xe_gt *gt)
+static void gt_reset_worker(struct work_struct *w)
 {
+	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
 	unsigned int fw_ref;
 	int err;
 
-	if (xe_device_wedged(gt_to_xe(gt))) {
-		err = -ECANCELED;
+	if (xe_device_wedged(gt_to_xe(gt)))
 		goto err_pm_put;
-	}
 
 	/* We only support GT resets with GuC submission */
-	if (!xe_device_uc_enabled(gt_to_xe(gt))) {
-		err = -ENODEV;
+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		goto err_pm_put;
-	}
 
 	xe_gt_info(gt, "reset started\n");
 
@@ -864,30 +861,24 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
 
-	return 0;
+	return;
 
 err_out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
+
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
-
 	xe_device_declare_wedged(gt_to_xe(gt));
+
 err_pm_put:
 	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return err;
-}
-
-static void gt_reset_worker(struct work_struct *w)
-{
-	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
-
-	gt_reset(gt);
 }
 
 void xe_gt_reset_async(struct xe_gt *gt)
@@ -899,6 +890,8 @@ void xe_gt_reset_async(struct xe_gt *gt)
 		return;
 
 	xe_gt_info(gt, "reset queued\n");
+
+	/* Pair with put in gt_reset_worker() if work is enqueued */
 	xe_pm_runtime_get_noresume(gt_to_xe(gt));
 	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
 		xe_pm_runtime_put(gt_to_xe(gt));
-- 
2.51.0

