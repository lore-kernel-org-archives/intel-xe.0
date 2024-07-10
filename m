Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C389CC3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 21:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9022410E1A1;
	Wed, 10 Jul 2024 21:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGvJuiKk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D751110E1A1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 21:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720647121; x=1752183121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BQmmA9L6pHwZ7o3jLl3QV46FBVQ+9LeqqPusU2DFMQc=;
 b=CGvJuiKkIYrtTnXORA2F9JJAmQ6r3mBsHNugmTGpa+7o1SN6KXlTpdAJ
 9uUUFgKspNUhcNEV3J5aBSotfU6L2F6CkgUG0rjMEhNqG0Vco8Uf4MosA
 3VUJwegCcxg8HCxju7Unj31GMp1SCoOqnOeuLIaF+Bxk9+wJ0hN1Eco21
 q2RfsPtMKQtP4qK5ed95WrK2a17OLI7EQWQ6kiIJEEMbOiRrvh/5st97O
 aVWtITJadk4DjepC4JPISDRqhyHHyRN9WOxZ2H2ZCw3wlIdZK0UFKOEzo
 1vVHWveGN0lakgSLOSxEnXPZPr34b1TZMXlVKpNtD0fMpeGNNUh1F977u w==;
X-CSE-ConnectionGUID: Gyt/WR3FTAG8gpJRZGgJaA==
X-CSE-MsgGUID: QZfzPel3QbWcFXqj5sAvQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18204209"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="18204209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 14:32:00 -0700
X-CSE-ConnectionGUID: +cAYNLYORpyv4dQzTosP+Q==
X-CSE-MsgGUID: Q6I/Z2wRT2WBrYcTtHcSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48237280"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO
 josouza-mobl2.intel.com) ([10.124.221.78])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 14:31:59 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Add process name and PID to job timedout message
Date: Wed, 10 Jul 2024 14:31:49 -0700
Message-ID: <20240710213149.57662-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This will be very helpful for Mesa CI, where it uses PID to match
the exacly test that cause timedout/GPU hang and mark that test as
failing.

Also printing the process name as it might be relavant for human
readers.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6392381e8e697..8604055271156 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1060,7 +1060,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	const char *process_name = "no process";
+	struct task_struct *task = NULL;
 	int err = -ETIME;
+	pid_t pid = -1;
 	int i = 0;
 	bool wedged, skip_timeout_check;
 
@@ -1157,9 +1160,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		goto sched_enable;
 	}
 
-	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
+	if (q->vm && q->vm->xef) {
+		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
+		if (task) {
+			process_name = task->comm;
+			pid = task->pid;
+		}
+	}
+	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
 		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-		     q->guc->id, q->flags);
+		     q->guc->id, q->flags, process_name, pid);
+	if (task)
+		put_task_struct(task);
+
 	trace_xe_sched_job_timedout(job);
 
 	if (!exec_queue_killed(q))
-- 
2.45.2

