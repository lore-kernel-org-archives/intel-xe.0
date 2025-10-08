Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7844ACCD184
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1E310E916;
	Wed,  8 Oct 2025 21:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+6pZFPN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF4310E8E7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959943; x=1791495943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZnqH/kvjny3xYhd0UkKq9nblomzhaJcONY8Q0lK2V+M=;
 b=L+6pZFPNiexyraTUZ1vbvNQulAkYoALybHg5VPpY1rExxwMKdlTae7kT
 lyPOLmHsfBEXllgeHoKAtOyqgRg1vFyLfq3j5RUYN+vF+GCbCwRY//MB8
 J2pjh/F8jBkEIpha/KJ9wYNwXjZMNXYAExrUkMkSp2zRt8ivcXWb2+V5A
 3nvKCNrtFgc0vFVZ4wYY9LVXJpNoZFBXbSFueGNaaAFjFVfVw12oz5Ezs
 AdJmusvGlcx5WWzAYb895CH6fUnhCS9A8THACYLj63NVM2ViO0POc6ewl
 sr2rWLju4KKvgDZBE4/P4PrsAGNMjLYXpTIW78wTqXgfzG2t66ztt9pKw w==;
X-CSE-ConnectionGUID: Ci/Hnzo2SNyTowYm9cOsQw==
X-CSE-MsgGUID: MQDZffK6QLSnUpPkDjQGuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726870"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726870"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:42 -0700
X-CSE-ConnectionGUID: r0UyV2XBQyu76EsD+gv0Ug==
X-CSE-MsgGUID: rNdE6IrNRsWR1+HPLFApXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635207"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 25/34] drm/xe/vf: Abort VF post migration recovery on
 failure
Date: Wed,  8 Oct 2025 14:45:23 -0700
Message-Id: <20251008214532.3442967-26-matthew.brost@intel.com>
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
index 321178b6022a..3b6f56062e21 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1144,6 +1144,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
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
@@ -1202,6 +1211,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
 fail:
+	vf_post_migration_abort(gt);
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7f0ea35f4f0a..be410a7126c7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2098,6 +2098,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
 	wake_up_all(&guc->ct.wq);
 }
 
+/**
+ * xe_guc_submit_pause_abort - Abort all paused submission task on given GuC.
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

