Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30835F5513F
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB4E10E0B0;
	Sun,  8 Mar 2026 13:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYwmSpOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071FA10E0B0
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772978295; x=1804514295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/n32fiZnD85HByndlWmseu3Eual3JzKdaiM/KBTj5Qk=;
 b=dYwmSpOQN9eVAYOEpCkXo2m7sVfU1kEZwMfjoKIYUVjf68suQc54+TUa
 J4WU0p3Ixe7b98fALJVErtwf19gwAmrqmOBOnfVDD7pIPAsl5Z4GSeU55
 /JDhAk0QQIaL2VQk4EMH6m+RIyx0kExfdOpnhd1syz7ECtbRtPilccnZm
 YLtK0ktLeCxIReDwr+Oce8aad6oTj09i+NTDxoa0gyuxQOGYIXhmJIKhK
 Y/ciOuURghM+kJCehUCpxr7PeOxoKOOhvtTT3v2no3IuKreYKqEfyjyJ1
 oGWfkm4mYHjEzDv7JLq1ekbRHikLC6ZHuSKEBL+LMJ9QBYAdnioJYAICB Q==;
X-CSE-ConnectionGUID: E1hDf5I4RQ6b4uvPGew2Qw==
X-CSE-MsgGUID: lsNPlbv+SBe1OJaBkMHt3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73934702"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73934702"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:58:15 -0700
X-CSE-ConnectionGUID: c6kOyP/ORxSAIggd2aL6WQ==
X-CSE-MsgGUID: oujfvv2gRRqDxdzc84cS5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="242523275"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 06:58:11 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 03/10] drm/xe/guc_submit: Support cancelling submission
Date: Sun,  8 Mar 2026 19:25:29 +0530
Message-ID: <20260308135536.3852304-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308135536.3852304-1-raag.jadav@intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
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

In preparation of usecases which require cancelling submission before
PCIe FLR, introduce xe_guc_submit_cancel() helper. This cancels and
frees any in-flight jobs on the scheduler.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v3: Cancel in-flight jobs before FLR
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c    | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |  1 +
 4 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 9c8004d5dd91..c012dbe84540 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -90,6 +90,17 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
 	drm_sched_fini(&sched->base);
 }
 
+void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched)
+{
+	struct drm_gpu_scheduler *base = &sched->base;
+	struct drm_sched_job *job, *tmp;
+
+	list_for_each_entry_safe_reverse(job, tmp, &base->pending_list, list) {
+		list_del(&job->list);
+		base->ops->free_job(job);
+	}
+}
+
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
 {
 	drm_sched_wqueue_start(&sched->base);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 664c2db56af3..ba7892db8428 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -19,6 +19,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  struct device *dev);
 void xe_sched_fini(struct xe_gpu_scheduler *sched);
 
+void xe_sched_submission_cancel(struct xe_gpu_scheduler *sched);
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
 void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index de716c1fb18e..cba544cc185c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2399,6 +2399,30 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 }
 
+/**
+ * xe_guc_submit_cancel - Cancel all runs of submission tasks on given GuC.
+ * @guc: the &xe_guc struct instance whose scheduler is to be cancelled
+ */
+void xe_guc_submit_cancel(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+		/* Prevent redundant attempts to cancel parallel queues */
+		if (q->guc->id != index)
+			continue;
+
+		xe_sched_submission_cancel(sched);
+	}
+
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 						       struct xe_exec_queue *q)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b3839a90c142..f361a6d32fd3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -16,6 +16,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 
+void xe_guc_submit_cancel(struct xe_guc *guc);
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
-- 
2.43.0

