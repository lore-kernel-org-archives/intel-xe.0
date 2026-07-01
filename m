Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66FEC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 08:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F510E321;
	Wed,  1 Jul 2026 08:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jcev2weh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A212B10E340
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782894947; x=1814430947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xsfPm0mW4lGmJSMPxH9UFaJ5ToT4XW5SFpF9+73YSh8=;
 b=Jcev2wehfEoDQNsDQz7E+oJRtKPqQnqAVrdkYDlCZXaCGWrIpOU9MBNj
 poFyoeBYZ2/NezGlKkm3M174tRlQCR8obYVpGimslyug2tTg7GEjrcEU8
 93H1F+qvo8XyA2J4OznC+43pNRq2lZIS28+kdMeVWWZSgqLZp0H5xLsl+
 L/ST1tZWL1R6NkEZ7If6Wue3DulW6cVKjeB3TDb9Zl/KnZZXW8e68lNFb
 FOJZQndttSrHsRXOrdBvGMCLYMti/Bj14aqa/OtBzoxfqkwjKowljhWoT
 Tmykz++KGmrTXlmQ38WzGWWRqr1qDWXkUwxIzFcez2BdTYLmuvNO0n3ff w==;
X-CSE-ConnectionGUID: bsLR2qzgTweVyJGosKwZWQ==
X-CSE-MsgGUID: Kq0i+DC4Tp26jXC5ZUvdgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83492998"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83492998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 01:35:46 -0700
X-CSE-ConnectionGUID: 2b+2PiCxQwqqS6g+EKnfOA==
X-CSE-MsgGUID: t8ieDowtSIiZCj7Kgi2DJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="276806192"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 01:35:41 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 02/10] drm/xe/guc_submit: Introduce
 guc_exec_queue_reinit_kernel()
Date: Wed,  1 Jul 2026 13:59:26 +0530
Message-ID: <20260701083051.450259-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701083051.450259-1-raag.jadav@intel.com>
References: <20260701083051.450259-1-raag.jadav@intel.com>
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
index d27ce24daae5..ac0b3474132c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -274,6 +274,8 @@ struct xe_exec_queue {
 struct xe_exec_queue_ops {
 	/** @init: Initialize exec queue for submission backend */
 	int (*init)(struct xe_exec_queue *q);
+	/** @reinit_kernel: Re-initialize kernel queue for submission backend */
+	void (*reinit_kernel)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
 	/** @fini: Undoes the init() for submission backend */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 6b86b4f9cc1c..a0572b72e96e 100644
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
index 9458bf477fa6..8774c8baeacd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2018,6 +2018,14 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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
@@ -2252,6 +2260,7 @@ static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
  */
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
+	.reinit_kernel = guc_exec_queue_reinit_kernel,
 	.kill = guc_exec_queue_kill,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
-- 
2.43.0

