Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3E606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UuBaJu3G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E23A10F03F;
	Thu, 19 Nov 2026 17:51:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82915112689
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795110677; x=1826646677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3S5cNG1kT7Ewhjx1VHPE165qoXJeJHbNxW2ow5/8NIg=;
 b=UuBaJu3Gk6TKNoZwilItepWw9S8NMV+d1geiW+9TvJorm4xB0XwMdPzl
 VQFTUaGgJP42GZ8Fdbj0wIzpH7g/ldMAEoH1OPVyKRrdx/48MJvMAfeB2
 9LISSNRrjO9mnoOch6fCv2EioAeIkwtzVIxi/HWGXL+873mn7MGIraF4U
 3ipRHdPy0atLe/IxlRj3EFlE+4boWv3zOpotraqjzxvwgcCyTD781ENdJ
 SycHPMM6S6cdcDUW32KR/rx2UzXlvb1sSRXViNvbDOk3l8feKLubeMacc
 QEFJyYWrzf+s+fJlhF4YfhHqPocNoxD2btoV8gpiXfwdevyNZXk62o4M5 Q==;
X-CSE-ConnectionGUID: yeZAeER6S2ulTAj0uKJxWg==
X-CSE-MsgGUID: TD3hGVYhS2eSDFxR/EVnng==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3866158"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3866158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:51:13 -0800
X-CSE-ConnectionGUID: fO7OZzbZSXmgomh+omhHBA==
X-CSE-MsgGUID: IcA5/4yxQN2bfj8rqaFRCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10582822"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:51:12 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v6 2/4] drm/xe: Notify scheduling-state waiters per exec queue
Date: Thu, 19 Nov 2026 09:46:19 -0800
Message-ID: <20261119174621.1311154-3-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119174621.1311154-1-daniel.charles@intel.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wait for GuC scheduling state changes on the exec queue whose state is
being inspected. Wake its waiters after processing SCHED_DONE instead
of relying on a CT interrupt that can wake them before state changes.
Keep the existing CT notifications for their remaining users.

On submission stop, wedge and VF recovery, notify published queues.
Hold the lookup XArray lock with interrupts saved to prevent queue
removal during the walk, and skip parallel queue aliases.

v5: New prerequisite for early KILL and FD-close waits.
v6: resolved rebase conflict
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |  1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 40 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.h           |  1 +
 4 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2a5f2064ad3e..b5bb2227fc1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -911,6 +911,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 		smp_wmb();	/* Ensure above writes visible before wake */
 
 		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
+		xe_guc_submit_wake_state_waiters(&gt->uc.guc);
 
 		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
 		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 74b711abe257..2b1a40e288f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -52,6 +52,8 @@ struct xe_guc_exec_queue {
 	u16 id;
 	/** @suspend_wait: wait queue used to wait on pending suspends */
 	wait_queue_head_t suspend_wait;
+	/** @state_wq: wait queue for scheduling enable/disable state changes */
+	wait_queue_head_t state_wq;
 	/**
 	 * @suspend_pending: a suspend of the exec_queue is pending.
 	 * Protected by @sched.msg_lock.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1f24e248acb9..4087a38ad3d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -559,6 +559,30 @@ static bool vf_recovery(struct xe_guc *guc)
 	return xe_gt_recovery_pending(guc_to_gt(guc));
 }
 
+/**
+ * xe_guc_submit_wake_state_waiters() - Wake all scheduling-state waiters
+ * @guc: the &xe_guc
+ *
+ * Notify per-queue waiters when a GuC-wide stop or recovery changes their
+ * wait conditions. May be called from interrupt context.
+ */
+void xe_guc_submit_wake_state_waiters(struct xe_guc *guc)
+{
+	struct xarray *lookup = &guc->submission_state.exec_queue_lookup;
+	struct xe_exec_queue *q;
+	unsigned long index, flags;
+
+	if (!guc->submission_state.initialized)
+		return;
+
+	/* Prevent removal and freeing of queues while waking their waiters. */
+	xa_lock_irqsave(lookup, flags);
+	xa_for_each(lookup, index, q)
+		if (q->guc->id == index)
+			wake_up_all(&q->guc->state_wq);
+	xa_unlock_irqrestore(lookup, flags);
+}
+
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1380,7 +1404,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		set_min_preemption_timeout(guc, q);
 
 	smp_rmb();
-	ret = wait_event_timeout(guc->ct.wq,
+	ret = wait_event_timeout(q->guc->state_wq,
 				 (!exec_queue_pending_enable(q) &&
 				  !exec_queue_pending_disable(q)) ||
 					 xe_guc_read_stopped(guc) ||
@@ -1441,6 +1465,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 			if (xe_exec_queue_get_unless_zero(q))
 				set_exec_queue_wedged(q);
 		mutex_unlock(&guc->submission_state.lock);
+		xe_guc_submit_wake_state_waiters(guc);
 	} else {
 		/* Forcefully kill any remaining exec queues, signal fences */
 		guc_submit_reset_prepare(guc);
@@ -1545,7 +1570,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
 		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
 			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 
-	ret = wait_event_timeout(guc->ct.wq,
+	ret = wait_event_timeout(q->guc->state_wq,
 				 !exec_queue_pending_enable(q) ||
 				 xe_guc_read_stopped(guc) ||
 				 vf_recovery(guc), HZ * 5);
@@ -1697,7 +1722,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
 			 */
-			ret = wait_event_timeout(guc->ct.wq,
+			ret = wait_event_timeout(primary->guc->state_wq,
 						 (!exec_queue_pending_enable(primary) &&
 						  !exec_queue_pending_disable(primary)) ||
 						 xe_guc_read_stopped(guc) ||
@@ -1719,7 +1744,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		 * lost. If this occurs, trigger a GT reset to recover.
 		 */
 		smp_rmb();
-		ret = wait_event_timeout(guc->ct.wq,
+		ret = wait_event_timeout(primary->guc->state_wq,
 					 !xe_uc_fw_is_running(&guc->fw) ||
 					 !exec_queue_pending_disable(primary) ||
 					 xe_guc_read_stopped(guc) ||
@@ -1997,7 +2022,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg,
 
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
 	    exec_queue_enabled(q) && bound) {
-		wait_event(guc->ct.wq, vf_recovery(guc) ||
+		wait_event(q->guc->state_wq, vf_recovery(guc) ||
 			   ((q->guc->resume_time != RESUME_PENDING ||
 			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
 
@@ -2146,6 +2171,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	ge->q = q;
 	init_rcu_head(&ge->rcu);
 	init_waitqueue_head(&ge->suspend_wait);
+	init_waitqueue_head(&ge->state_wq);
 
 	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
 		INIT_LIST_HEAD(&ge->static_msgs[i].link);
@@ -2813,6 +2839,7 @@ static int guc_submit_reset_prepare(struct xe_guc *guc)
 	ret = atomic_fetch_or(1, &guc->submission_state.stopped);
 	smp_wmb();
 	wake_up_all(&guc->ct.wq);
+	xe_guc_submit_wake_state_waiters(guc);
 
 	return ret;
 }
@@ -3376,6 +3403,7 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		clear_exec_queue_pending_enable(q);
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
+		wake_up_all(&q->guc->state_wq);
 	} else {
 		bool was_pending;
 
@@ -3420,7 +3448,7 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		 * such as the TDR see the updated state on the first re-check.
 		 */
 		smp_wmb();
-		wake_up_all(&guc->ct.wq);
+		wake_up_all(&q->guc->state_wq);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 7a81d0aa19bb..fe4fbc16010b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -28,6 +28,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc);
 void xe_guc_submit_unpause_vf(struct xe_guc *guc);
 void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
+void xe_guc_submit_wake_state_waiters(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
-- 
2.43.0

