Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76958CCD185
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411FE10E7A8;
	Thu,  2 Oct 2025 05:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERBnftKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABDB10E795
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hRvflzIp876+Qn/lJTi975DD45qiCTMCxulFasqg83s=;
 b=ERBnftKDBfk6m0lwO+pt3WujsxixHSoT7lTFfippex3JVPseISkn4XT4
 ePGF6pLVM3erIHNyxlrAmVr6blXHRYuTrdWlhXm5egHDgTfT87gPuBYLj
 eZXA/nvqxb9XGORyeIly7jTGpWJX52kfxLZVgempttvZHumMQtqR7d4gB
 Ule6PC/qTNojAjQXBoC67VQB3SEy1/2YDbdhhWtRKqKau8Pcl8eSSJ50H
 SvmKL8utvYRgHqci0w8xXMrWIUkmxH8yh3J/1MEIYce5Ybpndsioat8+o
 +xWiaQ6H0tNwNDmFNZWJbYX/iK5az6eugfUWfJuo1rjeB0EFCn/bIPpL9 w==;
X-CSE-ConnectionGUID: aozvhCIzQpGeRlcU2epGRA==
X-CSE-MsgGUID: 8rkLKZcBSqyGGRdqBNr0qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304519"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: 1mixia/5SwqdgQY+6OZTlQ==
X-CSE-MsgGUID: aw71sc2zRP2rwasYgFR2Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083550"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 25/34] drm/xe/vf: Abort VF post migration recovery on
 failure
Date: Wed,  1 Oct 2025 22:53:53 -0700
Message-Id: <20251002055402.1865880-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

If VF post-migration recovery fails, the device is wedged. However,
submission queues still need to be enabled for proper cleanup. In such
cases, call into the GuC submission backend to restart all queues that
were previously paused.

v3:
 - s/Avort/Abort (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h  |  1 +
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 55662b9a4f5b..98f64fbb329f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1147,6 +1147,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
 	xe_guc_submit_unpause(&gt->uc.guc);
 }
 
+static void vf_post_migration_abort(struct xe_gt *gt)
+{
+	spin_lock_irq(&gt->sriov.vf.migration.lock);
+	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
+	spin_unlock_irq(&gt->sriov.vf.migration.lock);
+
+	xe_guc_submit_pause_abort(&gt->uc.guc);
+}
+
 static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 {
 	bool skip_resfix = false;
@@ -1205,6 +1214,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
 fail:
+	vf_post_migration_abort(gt);
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9320fe9fbb29..99ea9b3507cd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2359,6 +2359,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
 	wake_up_all(&guc->ct.wq);
 }
 
+/**
+ * xe_guc_submit_abort - Abort all paused submission task on given GuC.
+ * @guc: the &xe_guc struct instance whose scheduler is to be aborted
+ */
+void xe_guc_submit_pause_abort(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+		xe_sched_submission_start(sched);
+		if (exec_queue_killed_or_banned_or_wedged(q))
+			xe_guc_exec_queue_trigger_cleanup(q);
+	}
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 static struct xe_exec_queue *
 g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index f535fe3895e5..fe82c317048e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
+void xe_guc_submit_pause_abort(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
-- 
2.34.1

