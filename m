Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0E1606A328
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Os2V4N1A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8266210F435;
	Fri,  6 Nov 2026 07:40:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34910F435
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793950811; x=1825486811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2M33C9qAbrgcIhsNZXpJm+sxW/mfRiEuMOQNE/ey0G8=;
 b=Os2V4N1AWYcgbCcGwpgxcj17uAUIDjQTqjfl5oyydvihndm+Z2FFFlZl
 vUF/AnM/MrnSACKP/xJx9bJMkR6tg3l6dIfi4rogMMfJRmpJm6YP4vBai
 yY8sURVuRUdfe6MSz80KswvxnLITNNCtAK8ROH9heOEcwPFCVTye4sLyC
 gBXjmcnzgaFf5YEfogeEcAuFjnD4IDa6ZwQopxV56ehAzDQGtaQAodT7v
 R7DWTVRksZEsfHrN7dwoIjgHsNGk2OpWI5H+FU1NjEzbJwtbbEN3EoO59
 O1UxsgUZmtSrTPb26bz0gMZC3i1KCiEGWKMuKuVGCDDld1Egb8YcYGO9z A==;
X-CSE-ConnectionGUID: 29e2zvvdTqCQNL0CjqSxqA==
X-CSE-MsgGUID: RF1m4OLYSaiQEfk+BjsxgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2848234"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2848234"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 23:40:11 -0800
X-CSE-ConnectionGUID: y2eIgdooQ3qnJkGjFcbyow==
X-CSE-MsgGUID: 4lMAYvHlSKi2GT/bThdjbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8970428"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 23:40:06 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, lukas@wunner.de, daniele.ceraolospurio@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v14 02/10] drm/xe/guc_submit: Introduce
 guc_exec_queue_reinit_kernel()
Date: Fri,  6 Nov 2026 13:08:43 +0530
Message-ID: <20261106073921.1512530-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106073921.1512530-1-raag.jadav@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

In preparation of usecases which require re-initializing GuC submission
after PCIe FLR, introduce guc_exec_queue_reinit_kernel() helper. This will
restore kernel queues which might have been killed before PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
v5: Re-initialize kernel queues through submission backend (Matthew Brost)
v8: Introduce xe_sched_reinit() (Daniele)
    Maintain timeout per scheduler instance (Daniele)
    s/reinit/reinit_kernel (Daniele)
v9: Move drm_sched_is_stopped() assert to xe_sched_reinit() (Daniele)
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c            |  6 ++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c          |  9 +++++++++
 6 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 48c05398b016..44a41ddc7a05 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -292,6 +292,8 @@ struct xe_exec_queue {
 struct xe_exec_queue_ops {
 	/** @init: Initialize exec queue for submission backend */
 	int (*init)(struct xe_exec_queue *q);
+	/** @reinit_kernel: Re-initialize kernel queue for submission backend */
+	void (*reinit_kernel)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
 	/** @fini: Undoes the init() for submission backend */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a6984999962d..47ed4c0e2bfe 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -407,6 +407,11 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
 	drm_dev_put(&xe->drm);
 }
 
+static void execlist_exec_queue_reinit_kernel(struct xe_exec_queue *q)
+{
+	/* NIY */
+}
+
 static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 {
 	/* NIY */
@@ -465,6 +470,7 @@ static u64 execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
+	.reinit_kernel = execlist_exec_queue_reinit_kernel,
 	.kill = execlist_exec_queue_kill,
 	.fini = execlist_exec_queue_fini,
 	.destroy = execlist_exec_queue_destroy,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 9c8004d5dd91..0ef77cdec51d 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -3,7 +3,10 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "xe_assert.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler.h"
+#include "xe_guc_exec_queue_types.h"
 
 static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
 {
@@ -77,6 +80,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	sched->timeout = timeout;
 	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
@@ -84,6 +88,19 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	return drm_sched_init(&sched->base, &args);
 }
 
+void xe_sched_reinit(struct xe_gpu_scheduler *sched)
+{
+	struct xe_guc_exec_queue *ge = container_of(sched, struct xe_guc_exec_queue, sched);
+
+	xe_gt_assert(ge->q->gt, drm_sched_is_stopped(&sched->base));
+
+	/*
+	 * TODO: Implement drm_sched_reinit() instead of requiring the
+	 * driver to restore individual fields.
+	 */
+	sched->base.timeout = sched->timeout;
+}
+
 void xe_sched_fini(struct xe_gpu_scheduler *sched)
 {
 	xe_sched_submission_stop(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 664c2db56af3..22e24b4b7171 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -17,6 +17,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  long timeout, struct workqueue_struct *timeout_wq,
 		  atomic_t *score, const char *name,
 		  struct device *dev);
+void xe_sched_reinit(struct xe_gpu_scheduler *sched);
 void xe_sched_fini(struct xe_gpu_scheduler *sched);
 
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 78ef2e8ded4f..f40764aa78e0 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -54,6 +54,11 @@ struct xe_gpu_scheduler {
 	spinlock_t				msg_lock;
 	/** @work_process_msg: processes messages */
 	struct work_struct		work_process_msg;
+	/**
+	 * @timeout: timeout for the scheduler instance, to be restored
+	 * during exec queue re-initialization
+	 */
+	long				timeout;
 };
 
 #define xe_sched_entity		drm_sched_entity
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b14b37b767f5..d76f125f9c3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2225,6 +2225,14 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
+static void guc_exec_queue_reinit_kernel(struct xe_exec_queue *q)
+{
+	xe_gt_assert(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL);
+
+	atomic_set(&q->guc->state, 0);
+	xe_sched_reinit(&q->guc->sched);
+}
+
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
@@ -2719,6 +2727,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
  */
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
+	.reinit_kernel = guc_exec_queue_reinit_kernel,
 	.kill = guc_exec_queue_kill,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
-- 
2.43.0

