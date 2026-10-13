Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3074BCC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85D10F459;
	Tue, 13 Oct 2026 02:39:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3C610F459
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791859187; x=1823395187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V3Qi2QFTX0bd2mIjpjnR9EFPiXHbSyP9HjjnkCGszrI=;
 b=I/vMFtcKMn+MN692BCzz3nL9/6P57beDS3Ae7xTnGEyo8tU1Gf0QgQZV
 RLMx8ZiE2Egq9iqTSbWQ4cLdoziZgDgD5nxG93EKImwJKt+DIMA/QLwQF
 0zU6C032gOlg7ifTXsWfxweRfL/OafvpWJY/QNeBcPAPVgqi/HqTo6qgH
 PpO7Uuom5k5+d3VNZUIL30cAJMFJO3zH07RjTcmLujv4sdtKslrEvrPQy
 nTmon0AQj0nZ4uAwDBCmuC9TYEWcVqwDYgdp6iDB+UBd3JB2fd60dp58S
 R2uFrACEyBg791yaYMgWGLMeXTCDVbTk8Ukj1KupvXEMaLD2iXvanqbcB g==;
X-CSE-ConnectionGUID: 3k+a+wkNSw+Tg9bqVQFtyA==
X-CSE-MsgGUID: 20E95FrcTrS2Ih3jrFgm7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="569719"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="569719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:39:36 -0700
X-CSE-ConnectionGUID: mqJ2s/3MQVeTY9+AdwcvuA==
X-CSE-MsgGUID: hNiP950fRCG/sW7MSc93YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1132042"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa003.fm.intel.com with ESMTP; 12 Oct 2026 19:39:36 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intnel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH 3/3] drm/xe: Synchronously wait for queue kill on FD close
Date: Mon, 12 Oct 2026 19:34:42 -0700
Message-ID: <20261013023442.206915-4-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013023442.206915-1-daniel.charles@intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
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

The early KILL message disables GuC scheduling outside the serialized
TDR path, but xe_file_close() does not wait for it to complete before
dropping queue references. GuC may still schedule contexts whose page
tables are being torn down, producing CAT errors and engine resets.

Split FD close teardown into two passes: first kill every queue so all
KILL messages are queued in parallel, then call the new
xe_exec_queue_kill_sync() for every queue before dropping references.

The GuC backend implementation flushes the message worker while the
static KILL message is pending, then waits for scheduling to be
disabled with no pending enable/disable. The wait also completes when
GuC submission is stopped, VF recovery is in progress, or the queue is
wedged.

Wake ct.wq waiters when a scheduling-disable SCHED_DONE is processed so
the waiter is woken as soon as scheduling is disabled.

Assisted-by: LLM
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  8 +++++-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 13 ++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++++++++++++++++++
 5 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c48..ffee8951a7b4e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -190,8 +190,14 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		if (q->vm && q->hwe->hw_engine_group)
 			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 		xe_exec_queue_kill(q);
-		xe_exec_queue_put(q);
 	}
+
+	xa_for_each(&xef->exec_queue.xa, idx, q)
+		xe_exec_queue_kill_sync(q);
+
+	xa_for_each(&xef->exec_queue.xa, idx, q)
+		xe_exec_queue_put(q);
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
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 609af66b343d5..36c8c3766f5fa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2267,6 +2267,34 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
+static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_guc *guc = exec_queue_to_guc(primary);
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
+	bool pending;
+
+	if (!exec_queue_killed(q))
+		return;
+
+	do {
+		flush_work(&sched->work_process_msg);
+
+		xe_sched_msg_lock(sched);
+		pending = !list_empty(&msg->link);
+		xe_sched_msg_unlock(sched);
+	} while (pending && !drm_sched_is_stopped(&sched->base));
+
+	wait_event(guc->ct.wq,
+		   (!exec_queue_enabled(primary) &&
+		    !exec_queue_pending_disable(primary) &&
+		    !exec_queue_pending_enable(primary)) ||
+		   xe_guc_read_stopped(guc) ||
+		   vf_recovery(guc) ||
+		   exec_queue_wedged(primary));
+}
+
 static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
 				   u32 opcode)
 {
@@ -2744,6 +2772,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
 	.kill = guc_exec_queue_kill,
+	.kill_sync = guc_exec_queue_kill_sync,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
 	.set_priority = guc_exec_queue_set_priority,
@@ -3423,6 +3452,9 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 				clear_exec_queue_pending_disable(q);
 			}
 		}
+		/* Publish the disabled state before waking kill_sync waiters. */
+		smp_wmb();
+		wake_up_all(&guc->ct.wq);
 	}
 }
 
-- 
2.43.0

