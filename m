Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B94EC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256481129A4;
	Tue, 16 Apr 2024 03:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWP31L29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31271129A2
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236708; x=1744772708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q1oHyNoPxZSvknRPnpFkfQULcr47hq3ybS4LyoIC6FM=;
 b=VWP31L295kiMs/E6biVrogsBPxhes6A8Gp/+2GbnWo90RFU9LtYeFeFr
 gMv8bSsN7Kpn8/BZpnmSIa9Xk3ih/+2RDuwlMRl/OiPcteRRHq23xLqzz
 5EhBbTW/MHjbPJXfGUMM1DE/tabcRaLvHZc1XZCFQYGseGtFlTZZ0AO7W
 AQjsS1JF7QxxPWd/akAo12gCK/koAScp1C5J/34c0nENx/758l+Ytx0ki
 GClt3T90LKBBIJPcinGpKeM46np9Dn/M9utBI0pdqN6iZ9tHXYyfCcxgu
 aWiQ9ga8bUXUAy5QFIbt1b2Rta+2KLdN2n2mVeDjjGkM1CpJsgDGr3AyE A==;
X-CSE-ConnectionGUID: IFxQYo2URBm8EZo9zjJ3UQ==
X-CSE-MsgGUID: YLk+taRLTWSaCBxOxqiDnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213840"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: /8VhFOVMQWOpCEVgtB5W2w==
X-CSE-MsgGUID: p8UfZteORmitnMuPf7y4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895700"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/7] drm/xe: Add helper to capture context runtime
Date: Mon, 15 Apr 2024 20:04:49 -0700
Message-ID: <20240416030454.3739862-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Add a helper to update the runtime of an exec_queue accumulate it at 2
places:

1. when the exec_queue is destroyed
2. when the sched job is completed

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
 drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
 4 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 60ced5f90c2b..f6632b4d8399 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -553,6 +553,15 @@ struct xe_file {
 		struct mutex lock;
 	} exec_queue;
 
+	/**
+	 * @runtime: hw engine class runtime in ticks for this drm client
+	 *
+	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
+	 * case, since all jobs run in parallel on the engines, only the stats
+	 * from lrc[0] are sufficient.
+	 */
+	u64 runtime[XE_ENGINE_CLASS_MAX];
+
 	/** @client: drm client */
 	struct xe_drm_client *client;
 };
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 71bd52dfebcf..c752d292fd33 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
 
+	xe_exec_queue_update_runtime(q);
+
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
@@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 		q->lrc[0].fence_ctx.next_seqno - 1;
 }
 
+/**
+ * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
+ * @q: The exec queue
+ *
+ * Update the timestamp saved by HW for this exec queue and save runtime
+ * calculated by using the delta from last update. On multi-lrc case, only the
+ * first is considered.
+ */
+void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
+{
+	struct xe_file *xef;
+	struct xe_lrc *lrc;
+	u32 old_ts, new_ts;
+
+	/*
+	 * Jobs that are run during driver load may use an exec_queue, but are
+	 * not associated with a user xe file, so avoid accumulating busyness
+	 * for kernel specific work.
+	 */
+	if (!q->vm || !q->vm->xef)
+		return;
+
+	xef = q->vm->xef;
+	lrc = &q->lrc[0];
+
+	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
+
+	/*
+	 * Special case the very first timestamp: we don't want the
+	 * initial delta to be a huge value
+	 */
+	if (old_ts)
+		xef->runtime[q->class] += new_ts - old_ts;
+}
+
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
 	struct xe_exec_queue *eq = q, *next;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 02ce8d204622..45b72daa2db3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -66,5 +66,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
+void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 80daee910ae9..48bcede63d35 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -241,6 +241,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 {
 	struct xe_lrc *lrc = job->q->lrc;
 
+	xe_exec_queue_update_runtime(job->q);
+
 	/*
 	 * Can safely check just LRC[0] seqno as that is last seqno written when
 	 * parallel handshake is done.
-- 
2.43.0

