Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF27ECAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9830210E6AF;
	Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ppvw7n/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70B210E69D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676571; x=1790212571;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4uSUfaNZQ5gL/aSBBo+6+xN/bCyDZQg2oIHNqW6tk1A=;
 b=Ppvw7n/k/dbOz/V1PyQNv5M+sX6j8apuScwewhhC3AfW5Jlbd5aXcv9T
 7+YBVBqbNphSJlu9Yt3yNQbkWTRMgrjKHOWT6vSN9orwwA0xookYcJmJl
 4cCFekeC9sMP4i9OEJQLtuGv0cMRFs11BLFfmFjfnyURz4do+l/Pq+siz
 tFDxdZDrqEx4GeyAAql0d3Jjrb1hmchFONtVSsN3FdpDegLuLxHKo6OnG
 qJOaics21WCQaWLlW8R7iG/IH/gaacKaqGY3WtnVaMBF31rVHTfauDVcM
 CChdFcUHNYORM4N7yFSdI+QHm/U7fiN4bo657WVw3sFTNM21qPRrLcfwV A==;
X-CSE-ConnectionGUID: TQMkygETTfW+thmg3wqcwQ==
X-CSE-MsgGUID: UolHmIZFQaeYzuw9Mvm7+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908273"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
X-CSE-ConnectionGUID: GNVzAhsjSliP0EDJQg4uvQ==
X-CSE-MsgGUID: 0wUJHaW0QZeje7rf+vG3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841803"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 23/34] drm/xe/vf: Kickstart after resfix in VF post
 migration recovery
Date: Tue, 23 Sep 2025 18:15:50 -0700
Message-Id: <20250924011601.888293-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 01399a871f12..2a077a98e92e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1216,13 +1216,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 
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
 
@@ -1239,6 +1232,14 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 	}
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
+	/*
+	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
+	 * must be working at this point, since the recovery did started,
+	 * but the rest was not enabled using the procedure from spec.
+	 */
+	if (!skip_resfix)
+		xe_irq_resume(gt_to_xe(gt));
+
 	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
 }
 
@@ -1262,11 +1263,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
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

