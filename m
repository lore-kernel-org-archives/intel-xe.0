Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF56D60A3804
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CFDMBpH7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8136310FB9E;
	Thu, 19 Nov 2026 00:10:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4586D10F71D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795046992; x=1826582992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ASeseWRRJuRsmrX8P+ctvkYOWTlP4T3lcfRTPH45mro=;
 b=CFDMBpH7rRxnsIEbSxqhBj+/i+W/NuR6vzNxRAK4cf4Gvlh8izb/jSYi
 r3Gs1J1BJrwAGSQlNZIRb4oTQwlFgXWQDstoMQmWq9pNyq3dtRuxXjM82
 N3byWWRSekXQUGqblXyVAsFVGNoiBOA7wTxSsAon5j2gL9YSSwQZW3tMP
 lW+dwJmQq4BwkA73ZxetbJo/fghsQWQ3sTTax1yy6LgsVbf+qaO5r9E1y
 DzBRE10m72kDVqad6ITcL4VdoxA2XhLaSjEsf6PcHvjFbyypiON155dtq
 5IIqF5XtggvUVMLOBE6i+ACrsA/smDWB5VRmXhfvtqLF4BjpRfvKGhuZ1 w==;
X-CSE-ConnectionGUID: qGbhpKJgQJyLv3F7CutDMA==
X-CSE-MsgGUID: isa9TppSTpqP+xF55CbG5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3768599"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3768599"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:09:42 -0800
X-CSE-ConnectionGUID: bsIVAyHlQDikMKUkIDiSBw==
X-CSE-MsgGUID: 7zyXiBXvSKCEbX6S5Q7GdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10641172"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2026 16:09:42 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v5 4/4] drm/xe: Synchronously wait for queue kill on FD close
Date: Wed, 18 Nov 2026 16:04:46 -0800
Message-ID: <20261119000446.696147-5-daniel.charles@intel.com>
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
index 8392c9fad3c48..cf75fa3b8fa4b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -190,8 +190,13 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
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
index 9a8efa2bf2bfb..8ba2cf45694dd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1622,6 +1622,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
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
index e8963f85cabd9..4be023b9a4c6c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -119,6 +119,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
 
 void xe_exec_queue_kill(struct xe_exec_queue *q);
+void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
 
 int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 48c05398b0168..4882eeccb9bd5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -294,6 +294,8 @@ struct xe_exec_queue_ops {
 	int (*init)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
+	/** @kill_sync: Wait for the backend to stop queue scheduling */
+	void (*kill_sync)(struct xe_exec_queue *q);
 	/** @fini: Undoes the init() for submission backend */
 	void (*fini)(struct xe_exec_queue *q);
 	/**
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 3f5b1950a248a..cb0e460f4762f 100644
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
index 3010e8ca36b4a..4e5cca77403ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2087,6 +2087,9 @@ static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
 	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
 		return;
 
+	if (READ_ONCE(q->guc->kill_processed))
+		return;
+
 	ret = wait_event_timeout(q->guc->state_wq,
 				 (!exec_queue_pending_enable(q) &&
 				  !exec_queue_pending_disable(q)) ||
@@ -2105,6 +2108,10 @@ static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
 
 	if (exec_queue_enabled(q))
 		disable_scheduling(q, true);
+
+	/* Publish only after disable_scheduling() has established pending state. */
+	smp_store_release(&q->guc->kill_processed, true);
+	wake_up_all(&q->guc->state_wq);
 }
 
 #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
@@ -2326,6 +2333,45 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
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
@@ -2803,6 +2849,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
 	.kill = guc_exec_queue_kill,
+	.kill_sync = guc_exec_queue_kill_sync,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
 	.set_priority = guc_exec_queue_set_priority,
-- 
2.43.0

