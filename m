Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0A4C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 04:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7043210E260;
	Tue, 23 Jul 2024 04:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7lJy0Na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B21710E343
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 04:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721708623; x=1753244623;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PedVl9pus8qREAyg/cYi/8BUP+YW0l7CJoH/oPTFtX0=;
 b=E7lJy0NavIz19uOu7A9qFNHKwIttW7jMnVQxxNF+7qyz4ABXYVxJ2VFg
 81Rg0Q5CseK2wVPkj8smRFknAx+u6aPO03PXK8xKEcvtqkPNsJnbJE22H
 8n3maX+n0DpcQq+OZnTTuFoj6rEKd1m8Ea5irzNIxUsluTaVdaSofMDCI
 cGLs6FAZGqsCL4tK9UnSAZ/D0/ToQIrCeY0yM8lWbpkdZdmx+FX28DmFJ
 oO0sIgWj5at4Z6ZoeQ6rN5uMdz1DAtZSXijsMcweU5JBVBjKWdSpFE1Z6
 xUGXooIgiyNaCo8x/yK/2TY87NtNfSzurGZ1anyNNe1IjIFXhoD9aqclD A==;
X-CSE-ConnectionGUID: bvifLMuCTZi3TAX9H1vTcg==
X-CSE-MsgGUID: sxYs+oLdSUmJxubSjTR1Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19493683"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="19493683"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:23:43 -0700
X-CSE-ConnectionGUID: CVtwxH2rSRqF3hSnyLBgeg==
X-CSE-MsgGUID: jAVTqgvvQImIk8yOFtLEbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="52159374"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:23:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe: Store process name and pid in xe file
Date: Mon, 22 Jul 2024 21:24:28 -0700
Message-Id: <20240723042428.1701998-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723042428.1701998-1-matthew.brost@intel.com>
References: <20240723042428.1701998-1-matthew.brost@intel.com>
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

An xe file can outlive the associated process as the GPU cleanup is just
triggered upon file close (process kill) and completes sometime later.
If the file close triggers error conditions (GPU hangs) the process
cannot be safely referenced to retrieve the name and pid for debug
information. Store the process name and pid directly in the xe file to
be safe.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c  | 10 ++--------
 drivers/gpu/drm/xe/xe_device.c       |  9 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 10 ++--------
 4 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 62c2b10fbf1d..d8d8ca2c19d3 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -171,7 +171,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	u32 adj_logical_mask = q->logical_mask;
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
-	struct task_struct *task = NULL;
 
 	int i;
 	bool cookie;
@@ -179,14 +178,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
-	if (q->vm && q->vm->xef) {
-		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
-		if (task)
-			process_name = task->comm;
-	}
+	if (q->vm && q->vm->xef)
+		process_name = q->vm->xef->process_name;
 	strscpy(ss->process_name, process_name);
-	if (task)
-		put_task_struct(task);
 
 	ss->gt = q->gt;
 	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b677608eb592..5a7b66703aa1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -64,6 +64,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	struct xe_drm_client *client;
 	struct xe_file *xef;
 	int ret = -ENOMEM;
+	struct task_struct *task = NULL;
 
 	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
 	if (!xef)
@@ -92,6 +93,13 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
+	task = get_pid_task(file->pid, PIDTYPE_PID);
+	if (task) {
+		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
+		xef->pid = task->pid;
+		put_task_struct(task);
+	}
+
 	return 0;
 }
 
@@ -110,6 +118,7 @@ static void xe_file_destroy(struct kref *ref)
 	spin_unlock(&xe->clients.lock);
 
 	xe_drm_client_put(xef->client);
+	kfree(xef->process_name);
 	kfree(xef);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 36252d5b1663..5b7292a9a66d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -582,6 +582,18 @@ struct xe_file {
 	/** @client: drm client */
 	struct xe_drm_client *client;
 
+	/**
+	 * @process_name: process name for file handle, used to safely output
+	 * during error situations where xe file can outlive process
+	 */
+	char *process_name;
+
+	/**
+	 * @pid: pid for file handle, used to safely output uring error
+	 * situations where xe file can outlive process
+	 */
+	pid_t pid;
+
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index da2ead86b9ae..a4570631926f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1072,7 +1072,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
-	struct task_struct *task = NULL;
 	int err = -ETIME;
 	pid_t pid = -1;
 	int i = 0;
@@ -1172,17 +1171,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	if (q->vm && q->vm->xef) {
-		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
-		if (task) {
-			process_name = task->comm;
-			pid = task->pid;
-		}
+		process_name = q->vm->xef->process_name;
+		pid = q->vm->xef->pid;
 	}
 	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
 		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 		     q->guc->id, q->flags, process_name, pid);
-	if (task)
-		put_task_struct(task);
 
 	trace_xe_sched_job_timedout(job);
 
-- 
2.34.1

