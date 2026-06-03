Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFBDCD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20AA10FB75;
	Wed,  3 Jun 2026 10:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRLKgz25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B376310FB75
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780482122; x=1812018122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4W0apoH5w9cejN9x0bmLTrVFUNbN65H2sK5+9B9K/w=;
 b=jRLKgz25UCx/M73Br7XNPppoMz4/LHIzdyfGraHU1RuLu8kPIPqz1Cx3
 fHk/Gc+U0PImymt5ZfYIImpVEkAN2lFnSYipryA29FeeG6YCLn42m39oX
 Lz4YUxMrIYJ9jN5vjJKkZJ3lq6OLNdh0cpjCxNVQQnhIERygoUYnMg1PR
 i9MMwE7sChuSIs2AzewLyAOs6SIE1Vh++qXhMPHredzQW9hTbuatrqRbB
 aBj1Z5RE+FM0kcQWHwV/1Ifp0vlU6HouJByuozeR7Y3XWPoJGI+ijSiw3
 hawyKYEg/M3hA4cw2lBh/BdMgDMZbKfiPEkHW7Tg1cX5Rzzax7BqNvD7e Q==;
X-CSE-ConnectionGUID: vuerB9FVTBm9WpMJLZIsPQ==
X-CSE-MsgGUID: Gu+cxd/cTbWn8ri/ngnPkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81143233"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81143233"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:22:02 -0700
X-CSE-ConnectionGUID: P2SoPWKaT1iIvMnHpJBu0Q==
X-CSE-MsgGUID: SPFhYsDwToG33OfWp6Ih5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="248495614"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 03 Jun 2026 03:21:57 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 02/10] drm/xe/guc_submit: Introduce
 guc_exec_queue_reinit_kernel()
Date: Wed,  3 Jun 2026 15:47:02 +0530
Message-ID: <20260603101814.916948-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603101814.916948-1-raag.jadav@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
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

In preparation of usecases which require re-initializing GuC submission
after PCIe FLR, introduce guc_exec_queue_reinit_kernel() helper. This will
restore kernel queues which might have been killed before PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
v5: Re-initialize kernel queues through submission backend (Matthew Brost)
v8: Introduce xe_sched_reinit() (Daniele)
    Maintain timeout per scheduler instance (Daniele)
    s/reinit/reinit_kernel (Daniele)
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c            |  6 ++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c          | 12 ++++++++++++
 6 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..cca1ded68db7 100644
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
index 9fb99c038ea8..f67b55782993 100644
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
@@ -466,6 +471,7 @@ static bool execlist_exec_queue_active(struct xe_exec_queue *q)
 
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
+	.reinit_kernel = execlist_exec_queue_reinit_kernel,
 	.kill = execlist_exec_queue_kill,
 	.fini = execlist_exec_queue_fini,
 	.destroy = execlist_exec_queue_destroy,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 67d8ce368486..1e38cfa19a58 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -76,6 +76,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	sched->timeout = timeout;
 	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
@@ -83,6 +84,11 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	return drm_sched_init(&sched->base, &args);
 }
 
+void xe_sched_reinit(struct xe_gpu_scheduler *sched)
+{
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
index ab501513d806..2c514f2bdda7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2040,6 +2040,17 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
+static void guc_exec_queue_reinit_kernel(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), drm_sched_is_stopped(&sched->base));
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), q->flags & EXEC_QUEUE_FLAG_KERNEL);
+
+	atomic_set(&q->guc->state, 0);
+	xe_sched_reinit(sched);
+}
+
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
@@ -2282,6 +2293,7 @@ static bool guc_exec_queue_active(struct xe_exec_queue *q)
  */
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
+	.reinit_kernel = guc_exec_queue_reinit_kernel,
 	.kill = guc_exec_queue_kill,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
-- 
2.43.0

