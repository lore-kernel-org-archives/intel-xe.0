Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACFDCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E541710E90F;
	Wed,  8 Oct 2025 21:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ug7cFZM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3EF10E8ED
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959943; x=1791495943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HtD9ctN7GCcYFZRda/qnYIw2FRKIZSU00L/Yuar2YOw=;
 b=Ug7cFZM/1dOClc/xdAG3cMQtw9IzsHMYqNz23qigtd7sQkh41oZxQnSs
 FzmXXw695DITUHoVkUuB2+1h2TS07mSyLpcXHUgK3VEFak+7CWWkwDz2K
 6MzGeaCd3T5V3jdJ5Lvzw6jk3MA64E4SKeegmrh1Cjp6c1ixgHs9CjPiz
 JmCznj+kWn+K2zqIQ+e9F6tPju9izJWnlN6n4yq8tiw6atefa8LXYh3gK
 A2xVqUsBBwmmmHH7AG9Hl1hbgUDinzsMN1fWKz0VAdCAeA7YX18XmL9BD
 Vhmhckc6NmTSaMrwNv+RBxNT9aqFRzsJ80kewCpF1zg26lbfysyYm3cWi A==;
X-CSE-ConnectionGUID: OmViqb78Tfe/i15rLputUQ==
X-CSE-MsgGUID: yBtv43ILSaW/k38zGwCJZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726867"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726867"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:42 -0700
X-CSE-ConnectionGUID: Os1i9NxsSMirTdTDYI7ZvA==
X-CSE-MsgGUID: cuQo+2TOQOGsUuh3FnZK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635203"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 22/34] drm/xe/vf: Kickstart after resfix in VF post
 migration recovery
Date: Wed,  8 Oct 2025 14:45:20 -0700
Message-Id: <20251008214532.3442967-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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

GuC needs to be live for the GuC submission state machine to resubmit
anything lost during VF post-migration recovery.  Therefore, move the
kickstart step after `resfix` to ensure proper resubmission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 75a20de71d8b..34fb8699b7a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1136,13 +1136,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
 {
-	/*
-	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
-	 * must be working at this point, since the recovery did started,
-	 * but the rest was not enabled using the procedure from spec.
-	 */
-	xe_irq_resume(gt_to_xe(gt));
-
 	xe_guc_submit_unpause(&gt->uc.guc);
 }
 
@@ -1162,6 +1155,13 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 	if (skip_resfix)
 		return -EAGAIN;
 
+	/*
+	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
+	 * must be working at this point, since the recovery did started,
+	 * but the rest was not enabled using the procedure from spec.
+	 */
+	xe_irq_resume(gt_to_xe(gt));
+
 	return vf_notify_resfix_done(gt);
 }
 
@@ -1185,11 +1185,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
-	vf_post_migration_kickstart(gt);
 	err = vf_post_migration_notify_resfix_done(gt);
 	if (err && err != -EAGAIN)
 		goto fail;
 
+	vf_post_migration_kickstart(gt);
+
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
-- 
2.34.1

