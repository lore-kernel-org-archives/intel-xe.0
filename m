Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB5ACCD19B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B0910E89F;
	Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Izqt4oqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C5610E88E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=24NtN6YhX0gT9wfha7vubjJG/Xwe3PAn4UDwqVxO0Ok=;
 b=Izqt4oqqy8UcbHRTBP16b/cUjf2NcCqc991ZVsVv6RhWK0k2KzVLSmn2
 YJ8P0b40YGhYHF0BRo/zlnkzRDktP1nVAG882reYZauEkoq0MWNsBAxzS
 4PvXdESYqWmVsWmLQvjmceI/Vs+YNUGZ3x12MgfSe27VREBK3mZ/gPLRv
 XnWXmdwEUsOd0QsxcrXZG/Yw7QazHvv7IIwPDjbIYEiKqlo2dqN8+STUz
 I0pf3ggrjXx/ah9wEVQMxgPXws+FyAS3cGr2qBJTo00XJScsH8T7U+9Ti
 9homUyB+xTxTXDXNjUui/o2CPz514cUp5sUGBerCCNcXWsHUosm6IeMdW g==;
X-CSE-ConnectionGUID: cDr6stwFS5CHsGDFX/ldig==
X-CSE-MsgGUID: zv12aISKTxeC+rCoiTwOjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067535"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: 6Ru715X1SUG5uuRdpj4z7w==
X-CSE-MsgGUID: qMgPzzzOS6iHqTSh+3PUXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593742"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 25/34] drm/xe/vf: Abort VF post migration recovery on
 failure
Date: Wed,  8 Oct 2025 11:04:51 -0700
Message-Id: <20251008180500.3261209-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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
index 68906ffe931f..fe66c2236ef4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1136,6 +1136,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
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
@@ -1194,6 +1203,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
 fail:
+	vf_post_migration_abort(gt);
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7f0ea35f4f0a..4a45c4934dce 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2098,6 +2098,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
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

