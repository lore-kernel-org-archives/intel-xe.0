Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D6410F286F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 20:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE9210ED1B;
	Fri, 27 Mar 2026 20:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BK2Qtb0Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7BC10ED1B
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774643988; x=1806179988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJ+kZ9LEMAUR4oeR5xYe6UX37XixQRWagyGJ3zrT8dM=;
 b=BK2Qtb0YRlYsjN09iE/BgYz+si66NoRzHhmErRx4OcQ/3fVINym0s7Lk
 xHPFXRxq4VnzgiuHsZAxhDYfB9t0tunrwO+1dRenu1GCH+oI5CGunopKR
 oQWMKuakv/jBy7Zx/Gp6JTqDxkdmEqhprbi+37CpKVvzBiSjhdiw44FBr
 opNh1e76wGo1jQlY+OKoi6ArRshevKoRorHSfse5NGxXxFW5hAgkxeM+F
 kkrbCfKuIKW5Ktt5Hd0Lc9klpLQR+YPOwF8Rqzw1hBmR1XiyQXHHU7a3C
 9QfK3CzcCf2tCmepKvJPvBOUERDb1VfGuA0czM5cEEdUmsMX8IantCcTg g==;
X-CSE-ConnectionGUID: qFd0VtynSj6b1aRfESx91g==
X-CSE-MsgGUID: Bn4kmmULQpyxGmMSAfHESw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93110324"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="93110324"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 13:39:48 -0700
X-CSE-ConnectionGUID: mqOGGHFnS0+e457cHLSNVA==
X-CSE-MsgGUID: 840J6kCKQemrVcmBr53xXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="218794327"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2026 13:39:44 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 2/9] drm/xe/guc_submit: Introduce xe_guc_submit_reinit()
Date: Sat, 28 Mar 2026 02:06:13 +0530
Message-ID: <20260327203620.809353-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327203620.809353-1-raag.jadav@intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
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
after PCIe FLR, introduce xe_guc_submit_reinit() helper. This will restore
exec queues which might have been killed before PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c    | 35 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |  1 +
 3 files changed, 41 insertions(+)

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
index a145234f662b..c92bf42b8d3d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -193,6 +193,11 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_KILLED, &q->guc->state);
 }
 
+static void clear_exec_queue_killed(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_KILLED, &q->guc->state);
+}
+
 static bool exec_queue_wedged(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
@@ -347,6 +352,36 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
 }
 
+/**
+ * xe_guc_submit_reinit() - Re-initialize GuC submission.
+ * @guc: the &xe_guc to re-initialize
+ */
+void xe_guc_submit_reinit(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
+
+	mutex_lock(&guc->submission_state.lock);
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
+		long timeout;
+
+		/* Prevent redundant attempts to reinit parallel queues */
+		if (q->guc->id != index)
+			continue;
+
+		timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
+			   msecs_to_jiffies(q->sched_props.job_timeout_ms);
+		xe_sched_update_timeout(sched, timeout);
+		clear_exec_queue_killed(q);
+	}
+
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 /*
  * Given that we want to guarantee enough RCS throughput to avoid missing
  * frames, we set the yield policy to 20% of each 80ms interval.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b3839a90c142..a40aef196cbf 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -13,6 +13,7 @@ struct xe_exec_queue;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
+void xe_guc_submit_reinit(struct xe_guc *guc);
 int xe_guc_submit_enable(struct xe_guc *guc);
 void xe_guc_submit_disable(struct xe_guc *guc);
 
-- 
2.43.0

