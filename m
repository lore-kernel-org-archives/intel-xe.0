Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E51CCD18B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A604F10E34A;
	Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MA0vOWI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171110E307
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747493; x=1791283493;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eYCjIWXKXQvIcqioUMc+FFcS6wi1nF9BYtIAH/nqjwU=;
 b=MA0vOWI+UNC+LLOtOJkrhJ5lkRHLlXutMsIzsYXUpX00Ug7ChAimaJS+
 koMCw6ueHTrL8nwX+aGFeEsaDDTQdxs7e17CfR/v2c4/D3SfWq3zHTlWy
 Yy7fblveqyHdLPrJlzKSS7DIjuOaBkLY6j7tB5mP7cf+22h2JhA+DWEbh
 O2dpiUNkpslCBJ9lA0D9i1ZkBz3Rh+RwUn4iAOlofbieVZv0zvoQobvF6
 ncpu8oZEi9320vh2QSlw2DAPIEiM8Em3Mkl0Vxqmf7tsEKo6XZrtNXLA5
 3rSlyU78ZKr1iOhqe2CVzlvNp35rLN7O+nOrJLQ5xXKDRZuwxzNyHDMxG Q==;
X-CSE-ConnectionGUID: fyEhasoSSp6qbZDjuCuASw==
X-CSE-MsgGUID: dem3VI/ZR0ijVLE9oY0ONg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546335"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:53 -0700
X-CSE-ConnectionGUID: qMAmSydBRSO6zD1uCMJEKA==
X-CSE-MsgGUID: b5gqSobvTxmYN8rkuEm/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589333"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 21/30] drm/xe/vf: Abort VF post migration recovery on
 failure
Date: Mon,  6 Oct 2025 03:44:36 -0700
Message-Id: <20251006104445.2210624-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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
index 6052c7302cc6..c7c929bd4212 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1149,6 +1149,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
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
@@ -1207,6 +1216,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_gt_sriov_notice(gt, "migration recovery ended\n");
 	return;
 fail:
+	vf_post_migration_abort(gt);
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
 	xe_device_declare_wedged(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b2ca4911efe9..e1e197ec45eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2087,6 +2087,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
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

