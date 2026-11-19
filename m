Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AD6606A339
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T+MfwYaq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B5A10FC7D;
	Thu, 19 Nov 2026 00:09:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2924B10E2DD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795046987; x=1826582987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7017dtgRCu+1qM4pzQXeJlxpg1E3qEHaMnqJtDWse4=;
 b=T+MfwYaqLAaYoqvlvOtj0YZM3/wugttKhIL4JjXh9HiEq3imWSL/3Y1Q
 gw5WpjCi/BFX9kXsnc9BkY8BTzAI06OSC+gGEkpWMJfkeSd+CM8AiVefr
 cDUlOU90qhtmwVJCicWNtrJZCLG/y3Rbu7zNGi5x3kHuzNmQ6ys1sOUYj
 wm90YQd6pGy+vozFxgezUl5hHnkfHtLRdJpbxflL7YefWUQtC/1XbSTx9
 U3cMPPmacUX54gZ5VZ7de7qVr43MrN0T7we10HDL7pifjaaSkAGrIGIs0
 NFAYUig9k70BA40cnAMAtQ4oApngzoxB8s+tsww2CUwKYEUoc4qDyfuMg Q==;
X-CSE-ConnectionGUID: MWHKtk7DRfiwGLQLuw1Njg==
X-CSE-MsgGUID: YSwgYUqDQRCHwVGjQInN0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3768596"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3768596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:09:42 -0800
X-CSE-ConnectionGUID: DI8rAfTsSLqSyihxAGikkQ==
X-CSE-MsgGUID: gulXk1rOSBe7pjK5nKgQnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10641166"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2026 16:09:41 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v5 2/4] drm/xe: Notify scheduling-state waiters per exec queue
Date: Wed, 18 Nov 2026 16:04:44 -0800
Message-ID: <20261119000446.696147-3-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119000446.696147-1-daniel.charles@intel.com>
References: <20261119000446.696147-1-daniel.charles@intel.com>
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
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |  1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 39 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.h           |  1 +
 4 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37899fcf5b227..fc853c195fdb8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -910,6 +910,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 		smp_wmb();	/* Ensure above writes visible before wake */
 
 		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
+		xe_guc_submit_wake_state_waiters(&gt->uc.guc);
 
 		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
 		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 74b711abe2572..2b1a40e288f17 100644
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
index c4ef3e9bf7a18..a3c2abb9254ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -551,6 +551,30 @@ static bool vf_recovery(struct xe_guc *guc)
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
@@ -1372,7 +1396,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		set_min_preemption_timeout(guc, q);
 
 	smp_rmb();
-	ret = wait_event_timeout(guc->ct.wq,
+	ret = wait_event_timeout(q->guc->state_wq,
 				 (!exec_queue_pending_enable(q) &&
 				  !exec_queue_pending_disable(q)) ||
 					 xe_guc_read_stopped(guc) ||
@@ -1433,6 +1457,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 			if (xe_exec_queue_get_unless_zero(q))
 				set_exec_queue_wedged(q);
 		mutex_unlock(&guc->submission_state.lock);
+		xe_guc_submit_wake_state_waiters(guc);
 	} else {
 		/* Forcefully kill any remaining exec queues, signal fences */
 		guc_submit_reset_prepare(guc);
@@ -1537,7 +1562,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
 		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
 			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 
-	ret = wait_event_timeout(guc->ct.wq,
+	ret = wait_event_timeout(q->guc->state_wq,
 				 !exec_queue_pending_enable(q) ||
 				 xe_guc_read_stopped(guc) ||
 				 vf_recovery(guc), HZ * 5);
@@ -1683,7 +1708,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
 			 */
-			ret = wait_event_timeout(guc->ct.wq,
+			ret = wait_event_timeout(primary->guc->state_wq,
 						 (!exec_queue_pending_enable(primary) &&
 						  !exec_queue_pending_disable(primary)) ||
 						 xe_guc_read_stopped(guc) ||
@@ -1705,7 +1730,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		 * lost. If this occurs, trigger a GT reset to recover.
 		 */
 		smp_rmb();
-		ret = wait_event_timeout(guc->ct.wq,
+		ret = wait_event_timeout(primary->guc->state_wq,
 					 !xe_uc_fw_is_running(&guc->fw) ||
 					 !exec_queue_pending_disable(primary) ||
 					 xe_guc_read_stopped(guc) ||
@@ -1980,7 +2005,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg,
 
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
 	    exec_queue_enabled(q) && bound) {
-		wait_event(guc->ct.wq, vf_recovery(guc) ||
+		wait_event(q->guc->state_wq, vf_recovery(guc) ||
 			   ((q->guc->resume_time != RESUME_PENDING ||
 			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
 
@@ -2129,6 +2154,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	ge->q = q;
 	init_rcu_head(&ge->rcu);
 	init_waitqueue_head(&ge->suspend_wait);
+	init_waitqueue_head(&ge->state_wq);
 
 	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
 		INIT_LIST_HEAD(&ge->static_msgs[i].link);
@@ -2787,6 +2813,7 @@ static int guc_submit_reset_prepare(struct xe_guc *guc)
 	ret = atomic_fetch_or(1, &guc->submission_state.stopped);
 	smp_wmb();
 	wake_up_all(&guc->ct.wq);
+	xe_guc_submit_wake_state_waiters(guc);
 
 	return ret;
 }
@@ -3350,6 +3377,7 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		clear_exec_queue_pending_enable(q);
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
+		wake_up_all(&q->guc->state_wq);
 	} else {
 		bool was_pending;
 
@@ -3385,6 +3413,7 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 				clear_exec_queue_pending_disable(q);
 			}
 		}
+		wake_up_all(&q->guc->state_wq);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 29abf07d8f041..0749f7c400b63 100644
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

