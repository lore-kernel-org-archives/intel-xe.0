Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D23ACC6B1A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4044410F9A1;
	Tue, 13 Oct 2026 20:19:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1906B10F9A1
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791922773; x=1823458773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jWZXCFh7sCJicoMxvdZ0PyMYxdmmQDBJMds+HKE2TIE=;
 b=HUVrTPOVdn4U2qLtQc+HFsdOuQl0pWhrhJhTrDlSwViGth1Lb/4k6T42
 iuhSdnhAcZVdqZTYeyChpVQEO0N+xMmrsjhB5AQGcy17Z1yh9OPYrMxSi
 kgybYJ284WerCCwAsvfKDR84ocHlpP2mWdKANisLktlpdpaS6Ls7GcJ9N
 LvhriCw2FXE5yOzngUswS0XJWzic7gee1Awf2H/g+dISGrRpBXA3O+RlP
 iXE2+gkJ1N0lsaLJWqfEwlqJp/Hzg1HFqrDhdCfoCAxv9p8QS7RkGFBrg
 HzVT45U8w1SCTJyXt8RDUNsAHPg4mYgDfLTD7Wf+zjTeZLXK0VicHs8O3 g==;
X-CSE-ConnectionGUID: ueOviVxQRwa2/gk3re+VOg==
X-CSE-MsgGUID: hVyIhAkrSfGlQ8x9Cb8sAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="678546"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="678546"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:19:23 -0700
X-CSE-ConnectionGUID: TVRzAdaTSjSmCKHwq1r0lw==
X-CSE-MsgGUID: HEu48COzTRCkzEpJQ1EqXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1348485"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2026 13:19:23 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Synchronously wait for queue kill on FD close
Date: Tue, 13 Oct 2026 13:15:08 -0700
Message-ID: <20261013201508.514480-4-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201508.514480-1-daniel.charles@intel.com>
References: <20261013201508.514480-1-daniel.charles@intel.com>
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
xe_exec_queue_kill_sync() and drop the reference for each queue.

The GuC backend implementation waits, with a timeout, for scheduling to
be disabled with no pending enable/disable. The wait also completes when
GuC submission is stopped, VF recovery is in progress, or the queue is
wedged. If GuC does not respond within the timeout, a GT reset is
triggered to stop GuC scheduling.

Wake ct.wq waiters when a scheduling-disable SCHED_DONE is processed so
the waiter is woken as soon as scheduling is disabled.

v2:
 - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
 - Drop the flush_work() loop (Matt B)
 - Use xe_assert() for the killed-queue check (Matt B)
 - Merge the put loop into the kill_sync loop (Matt B)

Assisted-by: LLM
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c           |  5 +++++
 drivers/gpu/drm/xe/xe_exec_queue.c       | 13 ++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 26 ++++++++++++++++++++++++
 5 files changed, 47 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 609af66b343d5..353078e0c9e0b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2267,6 +2267,28 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
+static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_guc *guc = exec_queue_to_guc(primary);
+	long ret;
+
+	xe_assert(guc_to_xe(guc), exec_queue_killed(q));
+
+	ret = wait_event_timeout(guc->ct.wq,
+				 (!exec_queue_enabled(primary) &&
+				  !exec_queue_pending_disable(primary) &&
+				  !exec_queue_pending_enable(primary)) ||
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
@@ -2744,6 +2766,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
 	.kill = guc_exec_queue_kill,
+	.kill_sync = guc_exec_queue_kill_sync,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
 	.set_priority = guc_exec_queue_set_priority,
@@ -3423,6 +3446,9 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
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

