Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DB7C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 20:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF6A10EB07;
	Thu, 18 Jul 2024 20:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KN59/kpT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDB10EAED
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721334718; x=1752870718;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fk10z3BXRWclmqFrA5pqZHWsIEUXVxmpnYb1eCS12FU=;
 b=KN59/kpTeUZkhU0+fc2R6Yqbnc6sYM1GgAlzLNIe9+zAoXCZcHQfFz0+
 QgEHC4N7HT2iEIg5emxOKf7CvEmQ07Ew3Me+uYO+g4zfLwBjoac8CcT2U
 zy6G5E+sGpprHkiZhTaekJXu+RUnYZal0yEHdliyqsLgOVho0yfATaVLc
 e+uzu4uLSWeg+9fqP/CSRGnbXBq4YNHdeFKDG2K9dEz/RzUxhQciv7CIj
 ztSJs+8TVOuAsmAWDTASk6xY0l/SqEDY0NvWEQXeMp5tZEOsQA+jKBzUH
 AS9AM0gWYscsQwHcHuWxkMPwokuQt85+Brtq34NcVkplL14lJ60IFHK8p Q==;
X-CSE-ConnectionGUID: 9FIck/ASRKq4Ta+WfsCK7g==
X-CSE-MsgGUID: 1IH27YwwTKWgl/jFSnelsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19059947"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19059947"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
X-CSE-ConnectionGUID: iSZsDWARS3uUM8koovWPDQ==
X-CSE-MsgGUID: 2jcSLuN0TqmmelTtjczblQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81520625"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/xe: Fix use after free when client stats are
 captured
Date: Thu, 18 Jul 2024 13:31:52 -0700
Message-Id: <20240718203152.3566929-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240718203152.3566929-1-umesh.nerlige.ramappa@intel.com>
References: <20240718203152.3566929-1-umesh.nerlige.ramappa@intel.com>
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

v3: Fix typo (Lucas)

Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
index ded9f9396429..1408b02eea53 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
  * a kernel object.
  */
 struct xe_exec_queue {
+	/** @xef: Back pointer to xe file if this is user created exec queue */
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

