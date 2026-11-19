Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76BB606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ER7goi3J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91D10F04D;
	Thu, 19 Nov 2026 17:51:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A342112690
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795110677; x=1826646677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPv6m36FGe2bpVNb185gZml0OtC+vrDpqutBfNkR1HY=;
 b=ER7goi3JxFk/KBTrPBZM+yJq5FN5SL4bwhBSrZF59OczisQ5dr/OilMp
 UZ0nkGDDJBtMYBaJxGw/+82eGig95lCdmj43q8MMpzHGGWz2IT5ePjGNU
 PPd2uIaeMMtUaAGI/nkl2Crxs4iOLtuixpkY5msuRxDvC+ruuIHrzmPkd
 s7jh5msDe7kTzFl4EoJJp7OIAjt/L76MjB5Ffj3Dgm95ze5wHOIC9ODA9
 xE63qEPuASpYitTkrIAKKMtKPf/Y0I5853fxh8EW9/tdqNYOPvuFpPhdy
 ywb0/mjLFRXRWwiBYgp6rHDAqSUeLR0TIpdRNIEOf4m8pMI0GEkdfkvyM g==;
X-CSE-ConnectionGUID: lXdp2NycRWmbw8ZXzcdHqw==
X-CSE-MsgGUID: AYmwY7LGSka2krUGAT0ejw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3866157"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3866157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:51:13 -0800
X-CSE-ConnectionGUID: nyc8CVr3RuybuRYD2T6jtw==
X-CSE-MsgGUID: SaKBEQdYQpSlhEuv1noVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10582829"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:51:13 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v6 4/4] drm/xe: Synchronously wait for queue kill on FD close
Date: Thu, 19 Nov 2026 09:46:21 -0800
Message-ID: <20261119174621.1311154-5-daniel.charles@intel.com>
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

GuC may still schedule contexts while FD close tears down their page
tables, producing CAT errors and engine resets. Split FD close into
two passes: kill every queue, then wait for each queue before dropping
its reference.

Require the KILL handler to acknowledge processing before accepting a
single scheduling-state snapshot. For multi-queue groups, all members
wait for the primary KILL acknowledgement and scheduling state on the
primary state waitqueue.

The wait also exits on GuC submission stop, VF recovery, or wedge. On
timeout, request a GT reset asynchronously; the wait does not establish
hardware quiescence on those paths.

v2:
 - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
 - Drop the flush_work() loop (Matt B)
 - Use xe_assert() for the killed-queue check (Matt B)
 - Merge the put loop into the kill_sync loop (Matt B)
v3:
 - Wait on a dedicated kill_wq instead of waking ct.wq on every
   scheduling-disable SCHED_DONE (CI)
v5: Rewrote the description for the primary KILL acknowledgement and
per-queue state waitqueue.

Assisted-by: LLM
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c               |  5 +++
 drivers/gpu/drm/xe/xe_exec_queue.c           | 13 ++++++
 drivers/gpu/drm/xe/xe_exec_queue.h           |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  6 +++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 47 ++++++++++++++++++++
 6 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f5a581d39c96..cc27a1604d59 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -194,8 +194,13 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		if (q->vm && q->hwe->hw_engine_group)
 			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 		xe_exec_queue_kill(q);
+	}
+
+	xa_for_each(&xef->exec_queue.xa, idx, q) {
+		xe_exec_queue_kill_sync(q);
 		xe_exec_queue_put(q);
 	}
+
 	xa_for_each(&xef->vm.xa, idx, vm)
 		xe_vm_close_and_put(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ddd9e38aa80b..00941a9853b5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1662,6 +1662,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 	xe_vm_remove_compute_exec_queue(q->vm, q);
 }
 
+/**
+ * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
+ * @q: The exec queue
+ *
+ * This function waits for the backend to finish stopping the queue after
+ * xe_exec_queue_kill(). It is safe to call multiple times.
+ */
+void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
+{
+	if (q->ops->kill_sync)
+		q->ops->kill_sync(q);
+}
+
 /**
  * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
  * @dev: DRM device
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index d48775ef6baf..b7079c35e822 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -120,6 +120,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
 
 void xe_exec_queue_kill(struct xe_exec_queue *q);
+void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
 
 int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 44a41ddc7a05..611d348145a6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -296,6 +296,8 @@ struct xe_exec_queue_ops {
 	void (*reinit_kernel)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
+	/** @kill_sync: Wait for the backend to stop queue scheduling */
+	void (*kill_sync)(struct xe_exec_queue *q);
 	/** @fini: Undoes the init() for submission backend */
 	void (*fini)(struct xe_exec_queue *q);
 	/**
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 3f5b1950a248..cb0e460f4762 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -54,6 +54,12 @@ struct xe_guc_exec_queue {
 	wait_queue_head_t suspend_wait;
 	/** @state_wq: wait queue for scheduling enable/disable state changes */
 	wait_queue_head_t state_wq;
+	/**
+	 * @kill_processed: KILL handler has drained earlier submission work and
+	 * issued any required disable. Published with release semantics and
+	 * never cleared by repeated kill requests.
+	 */
+	bool kill_processed;
 	/**
 	 * @suspend_pending: a suspend of the exec_queue is pending.
 	 * Protected by @sched.msg_lock.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 671852b56210..ec308b06c1be 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2104,6 +2104,9 @@ static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
 	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
 		return;
 
+	if (READ_ONCE(q->guc->kill_processed))
+		return;
+
 	ret = wait_event_timeout(q->guc->state_wq,
 				 (!exec_queue_pending_enable(q) &&
 				  !exec_queue_pending_disable(q)) ||
@@ -2122,6 +2125,10 @@ static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
 
 	if (exec_queue_enabled(q))
 		disable_scheduling(q, true);
+
+	/* Publish only after disable_scheduling() has established pending state. */
+	smp_store_release(&q->guc->kill_processed, true);
+	wake_up_all(&q->guc->state_wq);
 }
 
 #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
@@ -2351,6 +2358,45 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
+static bool guc_exec_queue_kill_complete(struct xe_exec_queue *primary)
+{
+	unsigned int state;
+
+	/*
+	 * Pair with the primary KILL handler's release so earlier submission
+	 * work has finished and any required DISABLE has been issued.
+	 */
+	if (!smp_load_acquire(&primary->guc->kill_processed))
+		return false;
+
+	state = atomic_read(&primary->guc->state);
+
+	return !(state & (EXEC_QUEUE_STATE_ENABLED |
+			  EXEC_QUEUE_STATE_PENDING_DISABLE |
+			  EXEC_QUEUE_STATE_PENDING_ENABLE));
+}
+
+static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_guc *guc = exec_queue_to_guc(primary);
+	long ret;
+
+	xe_assert(guc_to_xe(guc), exec_queue_killed(q));
+
+	/* FD close has already killed every primary before waiting on any member. */
+	ret = wait_event_timeout(primary->guc->state_wq,
+				 guc_exec_queue_kill_complete(primary) ||
+				 xe_guc_read_stopped(guc) ||
+				 vf_recovery(guc) ||
+				 exec_queue_wedged(primary), HZ * 5);
+	if (!ret) {
+		xe_gt_warn(q->gt, "Queue kill failed to respond, guc_id=%d\n",
+			   primary->guc->id);
+		xe_gt_reset_async(q->gt);
+	}
+}
+
 static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
 				   u32 opcode)
 {
@@ -2829,6 +2875,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
 	.reinit_kernel = guc_exec_queue_reinit_kernel,
 	.kill = guc_exec_queue_kill,
+	.kill_sync = guc_exec_queue_kill_sync,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
 	.set_priority = guc_exec_queue_set_priority,
-- 
2.43.0

