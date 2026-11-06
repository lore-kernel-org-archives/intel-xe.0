Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6D606A31B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 03:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXqzKprH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C78310E308;
	Fri,  6 Nov 2026 03:08:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BC110E308
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 03:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793934524; x=1825470524;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PAYq8nqhatR3y2nKL+bMwWRk1Wb7nED1Y8esi0p/O9A=;
 b=NXqzKprHs0OIyzrhmT+Q00ddjbSZTC1Fpu2vg6FnIdaQA1w0ojRNEeLT
 8pQTAekyNfzHcX1Tc/9jULMkyVwRMNmmKqYuebMdLgKWl68/65a1b/v00
 jIRvmadtm25sW4tKE5FDIqwBJs7NpEdPVHLOL+feAmZQ+wt+SCfgjhblO
 l5IUpdgyHJ8lo6pQJM4gbEv0yG6h+t0vAVDDYd5xfg0Ws0yAinHYedjFC
 58xOKbqqPcNM4EmuYmKUD6VaCDt6w3XY2tGS80uz0xW3A3YZ02rOVd4Mt
 YvYXuzXRTbWrcTRMcrHxXraxyn1UtmrsrN5mogiK2xD4nxJsGcS81EtHV g==;
X-CSE-ConnectionGUID: cMXPGjz0R4e0w6yuVhDdBw==
X-CSE-MsgGUID: sWo5S2+FR/yaRD+VRYggig==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2622343"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2622343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 19:08:43 -0800
X-CSE-ConnectionGUID: UJ7Q5p9aRcmpC2etXb3SuQ==
X-CSE-MsgGUID: JVyIIA9vQwuyHbkKv9sGxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7733773"
Received: from huajun-ubuntu.sh.intel.com ([10.239.147.73])
 by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2026 19:08:43 -0800
From: Huajun Li <huajun.li@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Subject: [PATCH 1/1] drm/xe: Preserve healthy preempted LR queues across
 system suspend
Date: Fri,  6 Nov 2026 12:23:32 +0800
Message-ID: <20261106042332.412621-1-huajun.li@intel.com>
X-Mailer: git-send-email 2.53.0
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

System suspend uses the same submission-stop path as GT reset recovery.
That path can ban user exec queues with started but unfinished jobs.
Long-running (LR) compute jobs remain unfinished after preemption, so
successfully suspended LR queues can be banned during system sleep.

Introduce a suspend-specific submission-stop path that exempts healthy
LR queues with completed suspension from the reset recovery ban policy.
Require the suspended state, cleared suspend_pending, and cleared
pending-disable state: the suspended bit is set before GuC acknowledges
scheduling disable and does not prove completion by itself.

Keep the existing ban policy for queues that fail these checks and for
normal reset recovery. Log incomplete LR suspension to aid diagnosis.

Stop CT and synchronize with the G2H worker before sampling queue state
and issuing the GuC soft reset. CT stop does not drain outstanding
acknowledgments.

Fix an issue where system suspend/resume fails with GPU hang errors when
running heavy AI workloads. The failure signature is logged as follows:
=================================================================
[ 6699.403689] PM: suspend entry (s2idle)
[ 6699.405880] Filesystems sync: 0.002 seconds
[ 6700.245000] Freezing user space processes
[ 6700.247957] Freezing user space processes completed (elapsed 0.002 seconds)
[ 6700.247964] OOM killer disabled.
[ 6700.247966] Freezing remaining freezable tasks
[ 6700.249672] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[ 6700.249677] printk: Suspending console(s) (use no_console_suspend to debug)
[ 6700.412418] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job: seqno=6972, lrc_seqno=6972, guc_id=13, flags=0x20 in python3 [3208]
[ 6700.412987] xe 0000:00:02.0: [drm] Xe device coredump has been created
[ 6700.412991] xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
[ 6700.413071] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Force wake domain 0: wake. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!
[ 6700.413086] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Force wake domain 1: wake. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!
...

Signed-off-by: Baichen Zhang <baichenx.zhang@intel.com>
Signed-off-by: Huajun Li <huajun.li@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |  8 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 59 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c         |  2 -
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 300126e6624f..75dbe2fd399e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1470,6 +1470,14 @@ int xe_guc_suspend(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
+	/*
+	 * Stop CT and synchronize with the G2H worker before sampling queue
+	 * suspension states. Outstanding acknowledgments are not drained;
+	 * submission suspend must reject queues with incomplete preemption.
+	 */
+	xe_guc_ct_stop(&guc->ct);
+	xe_guc_submit_suspend(guc);
+
 	ret = xe_guc_softreset(guc);
 	if (ret) {
 		xe_log_err(gt, GUC, ret, "Suspend aborted\n");
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e7c2778029c..bccd7cba03ee 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2733,14 +2733,51 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.reset_status = guc_exec_queue_reset_status,
 };
 
-static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
+static bool guc_exec_queue_should_preserve_lr(struct xe_guc *guc,
+				struct xe_exec_queue *q, bool suspend)
+{
+	if (!suspend || !xe_exec_queue_is_lr(q))
+		return false;
+
+	/*
+	 * Do not preserve unhealthy LR queues that have already encountered
+	 * a reset, ban, or fatal error prior to system suspend.
+	 */
+	if (exec_queue_killed_or_banned_or_wedged(q) || exec_queue_reset(q))
+		return false;
+
+	/*
+	 * SUSPENDED is set before requesting scheduling disable. The suspend
+	 * fence and pending-disable state must also show completion before we
+	 * can rely on the saved context surviving system sleep.
+	 */
+	if (!exec_queue_suspended(q) || READ_ONCE(q->guc->suspend_pending) ||
+	    exec_queue_pending_disable(q)) {
+		xe_gt_dbg(guc_to_gt(guc),
+			  "LR exec queue %d failed to suspend prior to stop; will be banned\n",
+			  q->guc->id);
+		return false;
+	}
+
+	return true;
+}
+
+static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q,
+				bool suspend)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	bool do_destroy = false;
+	bool preserve_lr;
 
 	/* Stop scheduling + flush any DRM scheduler operations */
 	xe_sched_submission_stop(sched);
 
+	/*
+	 * Sample acknowledged preemption before synthesizing lost G2H state.
+	 * Only healthy, cleanly preempted LR queues are preserved across sleep.
+	 */
+	preserve_lr = guc_exec_queue_should_preserve_lr(guc, q, suspend);
+
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
 		if (exec_queue_destroyed(q))
@@ -2764,7 +2801,11 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	 * started but not complete job or if a job has gone through a GT reset
 	 * more than twice.
 	 */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	/*
+	 * Preempted LR jobs normally remain unfinished. System sleep must keep
+	 * their saved contexts, while reset recovery retains its ban policy.
+	 */
+	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM)) && !preserve_lr) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		bool ban = false;
 
@@ -2822,7 +2863,7 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc)
 		   !xe_guc_read_stopped(guc));
 }
 
-void xe_guc_submit_stop(struct xe_guc *guc)
+static void guc_submit_stop(struct xe_guc *guc, bool suspend)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
@@ -2836,7 +2877,7 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 		if (q->guc->id != index)
 			continue;
 
-		guc_exec_queue_stop(guc, q);
+		guc_exec_queue_stop(guc, q, suspend);
 	}
 
 	mutex_unlock(&guc->submission_state.lock);
@@ -2848,6 +2889,16 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 }
 
+void xe_guc_submit_stop(struct xe_guc *guc)
+{
+	guc_submit_stop(guc, false);
+}
+
+void xe_guc_submit_suspend(struct xe_guc *guc)
+{
+	guc_submit_stop(guc, true);
+}
+
 static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 						       struct xe_exec_queue *q)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 7a81d0aa19bb..26092a458f3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,6 +20,7 @@ void xe_guc_submit_disable(struct xe_guc *guc);
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
+void xe_guc_submit_suspend(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 89040d9fa05f..224e85866074 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -293,8 +293,6 @@ int xe_uc_suspend(struct xe_uc *uc)
 
 	uc_reset_wait(uc);
 
-	xe_uc_stop(uc);
-
 	return xe_guc_suspend(&uc->guc);
 }
 
-- 
2.53.0

