Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109B2C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C5710E27D;
	Fri, 21 Aug 2026 11:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRt3Ruy5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A778210E27D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787311521; x=1818847521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vy9IgueuNCzhG3Bp10ArNueSDqrNTZ5EhkCH0zSSh1c=;
 b=LRt3Ruy5Xn0poGAQ+Nye/xJBJ5epkNG1788m5zgQbEN57sqqzu2KjEW6
 LCidB7ix5WBNXxG2JFUBmyyfn5Wo+chA0v1Ra3FZxvsEvBu/b6EVxI4od
 yGypaF6Qqc8dihWGznjbRM6hQqo8YWSb5GaPr+K21X/NYYPDn1DG1q4mW
 CyY5g4Ep6l8h/q2HLoYSBZ8cjTLrDvDi1DKCLziHNZeVblKTe6aTw39V7
 0AX+aVAbzM7dQCA3O6mmbCMAx5cobMlFpNG18aUE8DR5GS1rExgdV5g/8
 QxHTIsJcC+/ae0EkuzD/IPUNXwxEpNVCveOxMg/CN70FPUPx1B8LrttfY A==;
X-CSE-ConnectionGUID: +mGtjfIxQae+U3nlBbPq2Q==
X-CSE-MsgGUID: SJGBmC5tTo2k2JeHwW0czA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90377526"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90377526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:25:21 -0700
X-CSE-ConnectionGUID: 0zZcLQTQRnCVrjo3VBHvig==
X-CSE-MsgGUID: L3vSLRK2T9WsVAJc9ZWV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304523395"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 04:25:16 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 02/10] drm/xe/guc_submit: Introduce
 guc_exec_queue_reinit_kernel()
Date: Fri, 21 Aug 2026 16:53:24 +0530
Message-ID: <20260821112436.545405-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112436.545405-1-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
index 95f75d61a647..3b5bcd08f624 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -297,6 +297,8 @@ struct xe_exec_queue {
 struct xe_exec_queue_ops {
 	/** @init: Initialize exec queue for submission backend */
 	int (*init)(struct xe_exec_queue *q);
+	/** @reinit_kernel: Re-initialize kernel queue for submission backend */
+	void (*reinit_kernel)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
 	/** @fini: Undoes the init() for submission backend */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index cc33ae80e8cf..fba0d2850905 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -403,6 +403,11 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
 	xe_exec_queue_fini(q);
 }
 
+static void execlist_exec_queue_reinit_kernel(struct xe_exec_queue *q)
+{
+	/* NIY */
+}
+
 static void execlist_exec_queue_kill(struct xe_exec_queue *q)
 {
 	/* NIY */
@@ -460,6 +465,7 @@ static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
+	.reinit_kernel = execlist_exec_queue_reinit_kernel,
 	.kill = execlist_exec_queue_kill,
 	.fini = execlist_exec_queue_fini,
 	.destroy = execlist_exec_queue_destroy,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 67d8ce368486..e85bc4077809 100644
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
@@ -76,6 +79,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	sched->timeout = timeout;
 	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
@@ -83,6 +87,19 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
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
index 63d9bf92583c..e73fdacca164 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -51,6 +51,11 @@ struct xe_gpu_scheduler {
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
index 99d8c807ff05..f7519e55b610 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2130,6 +2130,14 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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
@@ -2597,6 +2605,7 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
  */
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
+	.reinit_kernel = guc_exec_queue_reinit_kernel,
 	.kill = guc_exec_queue_kill,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
-- 
2.43.0

