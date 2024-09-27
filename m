Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AD5CDD1AE
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 13:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EFA10E0CC;
	Fri, 27 Sep 2024 13:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moromSz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C26210E0CC
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727444146; x=1758980146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TiKEzKYrztF1aOmiaAoVER5Ky1nxwA5eogBupPwqCK8=;
 b=moromSz8nNz+KrQb1cPYWT1+3UHumt+T9bI6iy8N21bfs21DINWII2DW
 g5+UJlGGXQ2e61uqG4zKujBbF8gPeu/OBcCuxOyT5ZSD46pSqnymONHzV
 WB511GJ6/leWA200tarVlvz8ePi9ZH0pA4Hb8Nv68OheCZW8L0InhUVOC
 7yeFj6rQdhvcU0uRWB752P9G4a+x6YXXeC2C3kDJacFlnjz7okZG4ZbjF
 D0xRnoMtZAMDTktWA0hQf8oiSVtpbp749aNpbes7dw27LsoJIDW56chLK
 fcAF3z1BFLu4NE3Zm7oBXS/k6Tz1sndcIDUNUtPdWcPZtNjv+p3bA/JmY A==;
X-CSE-ConnectionGUID: e1y3vKSjSn2/9ssyNelBOg==
X-CSE-MsgGUID: sc5uj5XWQIizg/IQdmdNjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26720265"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="26720265"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:35:46 -0700
X-CSE-ConnectionGUID: qJv9gILHSNS/8btYjbJ1og==
X-CSE-MsgGUID: /Qd96DW5QEqX4foz5VZzgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="103325260"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.83])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:35:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe/guc_submit: improve schedule disable error logging
Date: Fri, 27 Sep 2024 14:35:36 +0100
Message-ID: <20240927133535.548793-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.1
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

A few things here. Make the two prints consistent (and distinct), print
the guc_id, and finally dump the CT queues. It should be possible to
spot the guc_id in the CT queue dump, and for example see that host side
has yet to process the response for the schedule disable, or see that
GuC is yet to send it, to help narrow things down if we trigger the
timeout.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 80062e1d3f66..52ed7c0043f9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -977,7 +977,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 !exec_queue_pending_disable(q) ||
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			drm_warn(&xe->drm, "Schedule disable failed to respond");
+			struct xe_gt *gt = guc_to_gt(guc);
+			struct drm_printer p = xe_gt_err_printer(gt);
+
+			xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
+				   __func__, ge->id);
+			xe_guc_ct_print(&guc->ct, &p, false);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
@@ -1177,8 +1182,14 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
 trigger_reset:
-			if (!ret)
-				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
+			if (!ret) {
+				struct xe_gt *gt = guc_to_gt(guc);
+				struct drm_printer p = xe_gt_err_printer(gt);
+
+				xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
+					   __func__, q->guc->id);
+				xe_guc_ct_print(&guc->ct, &p, true);
+			}
 			set_exec_queue_extra_ref(q);
 			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
-- 
2.46.1

