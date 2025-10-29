Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF120CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 19:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E15810E208;
	Wed, 29 Oct 2025 19:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnW945xE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3C410E836
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 19:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761765930; x=1793301930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mTLGxcOceuB1s5T6UoLIDPuPlfvzOV2YagjTKsX+bo0=;
 b=LnW945xEtC0DTtEYJpNz7EuqzFVaQTRY8Ke3aIfgDNDu0HpsdL6+s4gh
 l1O9yMdg/5EWv9a9avzQiBMPXKcU/sd4h3CxE1JTHRaXxErwUX0miGRlj
 /SMoe9Udgw8hatNjJM9PA+cWaVZFqvH2ppHvFOrOumYAf+EHjpuIxoaVV
 QiWKkyvOj483s9AagbItfZJtZuNp7XVCY5eo0VX6bCKi9qj3njHw7f3/x
 Ow9S8TPDooDkREP/szXh3ekBp4Ur/G9gOe5PB7GC1U64EBO8jh35uRWEP
 3hHohtr+5igFghuxkRpEmc5HOgqRxMdkTjWqi4zvomQ/2JurpZoRxpyjE w==;
X-CSE-ConnectionGUID: hIi2QyZoTOizuauC13lRwQ==
X-CSE-MsgGUID: wdbwT5kWSFa7UtYVarpTyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74574984"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="74574984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:25:30 -0700
X-CSE-ConnectionGUID: e6d5A5WLQpCh4QIk1cZXqw==
X-CSE-MsgGUID: 5HDJ00cHTySDAmY5Xvhb0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="222968992"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:25:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Inline gt_reset in the worker
Date: Wed, 29 Oct 2025 12:24:59 -0700
Message-ID: <20251029-pm-comment-v1-1-fcfa906dca25@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251029-pm-comment-2b888be80402
X-Mailer: b4 0.15-dev-50d74
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8b..51d6b4e4e1311 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -813,36 +813,29 @@ static int do_gt_restart(struct xe_gt *gt)
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
 
-	if (xe_fault_inject_gt_reset()) {
-		err = -ECANCELED;
+	if (xe_fault_inject_gt_reset())
 		goto err_fail;
-	}
 
 	xe_gt_sanitize(gt);
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		err = -ETIMEDOUT;
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
 		goto err_out;
-	}
 
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_stop_prepare(gt);
@@ -864,12 +857,12 @@ static int gt_reset(struct xe_gt *gt)
 		goto err_out;
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	xe_gt_info(gt, "reset done\n");
 
-	return 0;
-
 err_out:
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	XE_WARN_ON(xe_uc_start(&gt->uc));
@@ -879,15 +872,6 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_declare_wedged(gt_to_xe(gt));
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



