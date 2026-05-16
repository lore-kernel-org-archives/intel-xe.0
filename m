Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE1CD4F21
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 09:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD0B10E244;
	Sat, 16 May 2026 09:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HENU1HRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C396E10E244
 for <intel-xe@lists.freedesktop.org>; Sat, 16 May 2026 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778924129; x=1810460129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riInk6Kov7jSh7h4zZVez7IhHmJYq5WIRC5bRgryiv0=;
 b=HENU1HRMokkUbDmHkPGqGI0T2FAGwD8N0unrHcdanHVWli40n3K6TJKe
 Y6oFPQq61Gk2ddOe5xRospfNoA/62GhX84zOjWCZ1TYHpbE7EuExHsI81
 uCl7FeaggMRC5PoY8oOIzfq9jl2icp3qDupWjvDUR3BaetnZjxX1McPiZ
 1gINSp89s6GyjYb6bA9CMTX9F34DN8ONRuKiC2GieC6bNwSAzScA9RoMG
 W42G9F71BP2Ysqi3PzfFQQRnWWvi8+Akc5p6c/XbftwRWgDMI4leQkVFJ
 BDJ7Zj849hWNITy0Dc+AIRgQRj1tBkXy/xrBzm+JXDKqL78JO0zi4snpt w==;
X-CSE-ConnectionGUID: 5cI9buuBTuayJPsrN13qVQ==
X-CSE-MsgGUID: 9Mak+aswSVeKmwZNrd2flQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90441905"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="90441905"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 02:35:28 -0700
X-CSE-ConnectionGUID: mgCWw0CRSpmjVxruFjMChA==
X-CSE-MsgGUID: dbrmRnXuS/e7kgdo0+ROqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="243911637"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 16 May 2026 02:35:23 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 2/8] drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
Date: Sat, 16 May 2026 15:01:25 +0530
Message-ID: <20260516093131.27442-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516093131.27442-1-raag.jadav@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
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
after PCIe FLR, introduce guc_exec_queue_reinit() helper. This will restore
exec queues which might have been killed before PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
v5: Re-initialize kernel queues through submission backend (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  6 ++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    |  5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..f1e45e8f30e7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -274,6 +274,8 @@ struct xe_exec_queue {
 struct xe_exec_queue_ops {
 	/** @init: Initialize exec queue for submission backend */
 	int (*init)(struct xe_exec_queue *q);
+	/** @reinit: Re-initialize exec queue for submission backend */
+	void (*reinit)(struct xe_exec_queue *q);
 	/** @kill: Kill inflight submissions for backend */
 	void (*kill)(struct xe_exec_queue *q);
 	/** @fini: Undoes the init() for submission backend */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 9fb99c038ea8..1c9235a68f95 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -403,6 +403,11 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
 	xe_exec_queue_fini(q);
 }
 
+static void execlist_exec_queue_reinit(struct xe_exec_queue *q)
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
+	.reinit = execlist_exec_queue_reinit,
 	.kill = execlist_exec_queue_kill,
 	.fini = execlist_exec_queue_fini,
 	.destroy = execlist_exec_queue_destroy,
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 664c2db56af3..1e079ca3891c 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -51,6 +51,11 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
 	drm_sched_tdr_queue_imm(&sched->base);
 }
 
+static inline void xe_sched_update_timeout(struct xe_gpu_scheduler *sched, long timeout)
+{
+	sched->base.timeout = timeout;
+}
+
 static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4171eff4e8ad..43eb414bcb26 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2032,6 +2032,18 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
+static void guc_exec_queue_reinit(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	long timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
+			msecs_to_jiffies(q->sched_props.job_timeout_ms);
+
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), drm_sched_is_stopped(&sched->base));
+
+	xe_sched_update_timeout(sched, timeout);
+	atomic_set(&q->guc->state, 0);
+}
+
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
@@ -2274,6 +2286,7 @@ static bool guc_exec_queue_active(struct xe_exec_queue *q)
  */
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
+	.reinit = guc_exec_queue_reinit,
 	.kill = guc_exec_queue_kill,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
-- 
2.43.0

