Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98756CAC5A8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEDB10E64E;
	Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+yAlJiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DB710E40E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080783; x=1789616783;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WeVdVzetBcSluNirFMD3fUlFSsniAvwJm4rDekIe4yc=;
 b=M+yAlJiFvavKNgfcnZK1GhWH1rdj62yPxJeXnl21hsa/hIhEhuU/P9LK
 LfA1Ab+TBvQGUeMNmRIMx8+qNiOiX0SrQJcaMHoucPH2F74Lr3hXJuZCo
 xI+1hdnfH3RgkBoN0CjG/se0oCW3wrVopXF+Jf/hS5NS3DiIUYUhN/XPu
 lQHB2A+RDx73yNe8BO+2ux23C36MJytMKevOM6e9KMk1C7xsujAjuB6kl
 fhlpLOLH8aVXguyPNSYhjoYVbTw1UDW65G61xbDTcUJ5nn/LOXzVM0nZP
 lB8GYGwCrO/WaorAWSwTtTAr99D/AI9fbT6llYO0lTOuno4SFcGRpEzr8 A==;
X-CSE-ConnectionGUID: qEeB44UeS3GniEn/RiZyNw==
X-CSE-MsgGUID: A1l44O3HQrS54Gyp5WAhBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060808"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:23 -0700
X-CSE-ConnectionGUID: Xx3R3MYvT82WuSCgTaLtoA==
X-CSE-MsgGUID: 4M0kONCkTHuHfjnfWpis3A==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 26/28] drm/xe: Move queue init before LRC creation
Date: Tue, 16 Sep 2025 20:46:13 -0700
Message-Id: <20250917034615.3977603-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

A queue must be in the submission backend's tracking state before the
LRC is created to avoid a race condition where the LRC's GGTT addresses
are not properly fixed up during VF post-migration recovery.

Move the queue initialization—which adds the queue to the submission
backend's tracking state—before LRC creation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 38 ++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_lrc.h        | 10 ++++++++
 4 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 5cacdc38330d..e3a010fc7b71 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -179,17 +179,28 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	err = q->ops->init(q);
+	if (err)
+		return err;
+
+	/*
+	 * This must occur after q->ops->init to avoid race conditions during VF
+	 * post-migration recovery, as the fixups for the LRC GGTT addresses
+	 * depend on the queue being present in the backend tracking structure.
+	 */
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
-		if (IS_ERR(q->lrc[i])) {
-			err = PTR_ERR(q->lrc[i]);
+		struct xe_lrc *lrc;
+
+		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
+				    q->msix_vec, flags);
+		if (IS_ERR(lrc)) {
+			err = PTR_ERR(lrc);
 			goto err_lrc;
 		}
-	}
 
-	err = q->ops->init(q);
-	if (err)
-		goto err_lrc;
+		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
+		WRITE_ONCE(q->lrc[i], lrc);
+	}
 
 	return 0;
 
@@ -1087,9 +1098,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 	int err = 0;
 
 	for (i = 0; i < q->width; ++i) {
-		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
-		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
-		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
+		struct xe_lrc *lrc;
+
+		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
+		lrc = READ_ONCE(q->lrc[i]);
+		if (!lrc)
+			continue;
+
+		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
+		xe_lrc_update_hwctx_regs_with_address(lrc);
+		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 788f56b066b6..c0d9b901e734 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	const struct drm_sched_init_args args = {
 		.ops = &drm_sched_ops,
 		.num_rqs = 1,
-		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
+		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
 		.hang_limit = XE_SCHED_HANG_LIMIT,
 		.timeout = XE_SCHED_JOB_TIMEOUT,
 		.name = q->hwe->name,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ace633bb3c3c..fad6ffcfb83f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1929,7 +1929,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..5fb6c74bdab5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 	kref_put(&lrc->refcount, xe_lrc_destroy);
 }
 
+/**
+ * xe_lrc_ring_size() - Xe LRC ring size
+ *
+ * Return: Size of LRC size
+ */
+static inline size_t xe_lrc_ring_size(void)
+{
+	return SZ_16K;
+}
+
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
-- 
2.34.1

