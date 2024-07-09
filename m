Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E932C3271E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 00:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D009510E43F;
	Tue,  9 Jul 2024 00:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fR0Xvx6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5428510E211
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 00:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720484920; x=1752020920;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1nSuKfoNaa8KfKxUiZZc7z4KY3TXx4j57gF7eHclkj8=;
 b=fR0Xvx6IeCD1z+y6qH+GybzCk91IF6fUCbjD0dCpuKT8us89r0kQ0PGZ
 2O0Gbxo/2CwYorbbklAf/teDEeR14dkugYBOq+oHYQjwtTPWl4SQYauFf
 aK5pCeO55r7v7RGf4JOKphYRXSvZzF7XE7DV8MlUIN8I7wJLKgkDufBJA
 NY9lgKLweA9I0aYQX+6zW8KY0BVw1Y33oWa9WAlnzqzHRnrIJECefPw7r
 sIKyFJ7r06drG5jnxMY6z+X/7YNQtOWfOWtoLS5TnCJD91yDsDquwSP8p
 2TI0M923X7L1mRsj6qQjQ4r/yfuNfr1zqtItfBl2/VpjP5yqaefe8GT9h w==;
X-CSE-ConnectionGUID: fqEJWK2ESYigtqA+6gm9BQ==
X-CSE-MsgGUID: IYi4VFnJTBO+JBfMPntT9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29105705"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="29105705"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:40 -0700
X-CSE-ConnectionGUID: NnNHtuWgQ/aIbYcSn3UVwQ==
X-CSE-MsgGUID: 9TOWFFqwS8C/T5Q/Lcqbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47630954"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH v2 4/4] drm/xe: Fix use after free when client stats are
 captured
Date: Mon,  8 Jul 2024 17:28:35 -0700
Message-Id: <20240709002835.3372618-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
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

xe_file_close triggers an asynchronous queue cleanup and then frees up
the xef object. Since queue cleanup flushes all pending jobs and the KMD
stores client usage stats into the xef object after jobs are flushed, we
see a use-after-free for the xef object. Resolve this by taking a
reference to xef from xe_exec_queue.

While at it, revert an earlier change that contained a partial work
around for this issue.

v2:
- Take a ref to xef even for the VM bind queue (Matt)
- Squash patches relevant to that fix and work around (Lucas)

Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c       |  5 +----
 drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 6a26923fa10e..7ddd59908334 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
-	xa_for_each(&xef->exec_queue.xa, i, q) {
+	xa_for_each(&xef->exec_queue.xa, i, q)
 		xe_exec_queue_update_run_ticks(q);
-		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
-		q->old_run_ticks = q->run_ticks;
-	}
 	mutex_unlock(&xef->exec_queue.lock);
 
 	/* Get the total GPU cycles */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 3336a01a1006..69867a7b7c77 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
 	if (q->vm)
 		xe_vm_put(q->vm);
+
+	if (q->xef)
+		xe_file_put(q->xef);
+
 	kfree(q);
 }
 
@@ -649,6 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		goto kill_exec_queue;
 
 	args->exec_queue_id = id;
+	q->xef = xe_file_get(xef);
 
 	return 0;
 
@@ -762,6 +767,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
  */
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
+	struct xe_file *xef;
 	struct xe_lrc *lrc;
 	u32 old_ts, new_ts;
 
@@ -773,6 +779,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	if (!q->vm || !q->vm->xef)
 		return;
 
+	xef = q->vm->xef;
+
 	/*
 	 * Only sample the first LRC. For parallel submission, all of them are
 	 * scheduled together and we compensate that below by multiplying by
@@ -783,7 +791,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	 */
 	lrc = q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	q->run_ticks += (new_ts - old_ts) * q->width;
+	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 }
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ded9f9396429..b5343cdd0632 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
  * a kernel object.
  */
 struct xe_exec_queue {
+	/** @xef: Back pointer to xe file is this is user created exec queue */
+	struct xe_file *xef;
+
 	/** @gt: graphics tile this exec queue can submit to */
 	struct xe_gt *gt;
 	/**
@@ -139,10 +142,6 @@ struct xe_exec_queue {
 	 * Protected by @vm's resv. Unused if @vm == NULL.
 	 */
 	u64 tlb_flush_seqno;
-	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
-	u64 old_run_ticks;
-	/** @run_ticks: hw engine class run time in ticks for this exec queue */
-	u64 run_ticks;
 	/** @lrc: logical ring context for this exec queue */
 	struct xe_lrc *lrc[];
 };
-- 
2.38.1

