Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43A4C67861
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 14:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A781510F1A0;
	Sat,  6 Apr 2024 14:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbVnE9fk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3169C10F1A0
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712414405; x=1743950405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FtTbERxm/jxiQFy5KybFcIx09HN7gws4zVoit6DzXKI=;
 b=PbVnE9fk3lcjjdCvYGlyOmJd3vodBesdiLayGJ9UTErnIePJl6WnBX2G
 LGt0LwmX48+3nLYWjbobsj7gQGdm5ElJDc2lBfn5OH2EyMD5bFvGFN5jU
 0+3ozbJvo71TCQGpvL2Kd6KzIiSA5QNe6UD9/ydYYGrL6ZUALIrREF3qc
 FY8EWZAIsG63g28DlRSvOvAKEe58xTg3bzq1+Hh2rTn/moK7YC/Dp8pc2
 QZAcqCf9zUE/HKFlD2b12z0p9Y8toG/PSMG9en8rrINvYlebsHgJ/HHVn
 5I/a87OHxoLGzu680gPjXYQ0pTE9TzF5HprtSobhvuEv3ukOgEPD4N6zI A==;
X-CSE-ConnectionGUID: zdzd6QTnQaWhYP0483pSXg==
X-CSE-MsgGUID: o7lmCU9TRU+I6nX96ztonA==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7593631"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7593631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 07:40:04 -0700
X-CSE-ConnectionGUID: YVVlGonXSSCfRIg79DF7KQ==
X-CSE-MsgGUID: Qit+zn5zSLqn6icl2ouTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="19876618"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.192])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 07:40:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Use drm_device-managed version of mutex_init()
Date: Sat,  6 Apr 2024 16:39:45 +0200
Message-Id: <20240406143946.979-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

This is safer approach and will help resolve a cleanup ordering
conflict related to the GuC ID manager.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c30bd9ac8c0..4c444fddfba6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -238,7 +238,6 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 	free_submit_wq(guc);
-	mutex_destroy(&guc->submission_state.lock);
 }
 
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
@@ -263,13 +262,16 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int err;
 
+	err = drmm_mutex_init(&xe->drm, &guc->submission_state.lock);
+	if (err)
+		return err;
+
 	err = alloc_submit_wq(guc);
 	if (err)
 		return err;
 
 	gt->exec_queue_ops = &guc_exec_queue_ops;
 
-	mutex_init(&guc->submission_state.lock);
 	xa_init(&guc->submission_state.exec_queue_lookup);
 
 	spin_lock_init(&guc->submission_state.suspend.lock);
-- 
2.43.0

