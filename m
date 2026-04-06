Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA85F46C40
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2447110E1E3;
	Mon,  6 Apr 2026 14:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT3WpjdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99210E1E3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775484709; x=1807020709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v7xvpIdAK+OGPlCdl+2wjfgTNO76UBmQ3fximL0NKt0=;
 b=cT3WpjdE0MWDNvuBXE53JS5NYgF57B1uLwJ0SNvUUfna6wFyxYYNiySz
 KYxKKZmrIevgmNo1TnfJ9ErWX6klB+e7TUYsgAurz7M72sCqes3IlZBHp
 Lq7udBrbkWKivH+c18o2hLjIRcwOPYi+CHCypN8iUoLHZ0vQWPdbcmK67
 r4GENDbPrhjiy30pxs+DmMbRsox9BUBTzOFxnOSGsazGztHsCCYKKaDuv
 rOAgyycQmrW8oerLjOfg43ci4zmdvyVtR4NN6YUqw0mmafCzGzLh+W4Eb
 5NeokUEB/nL58cjMCcwBFL9GnltBxAp/PIEGFgGYgUS9x37QUlMDDtu5z g==;
X-CSE-ConnectionGUID: f6wFAU69SMWZ3Gj0gpyHjA==
X-CSE-MsgGUID: G3YGmH1XQvSQzHb8TBfvJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76443874"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76443874"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:11:49 -0700
X-CSE-ConnectionGUID: mKBS5Op2S46heVl8JX2wDQ==
X-CSE-MsgGUID: u3TYsAQjTCSGK3hDC+HzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227788234"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 07:11:44 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 2/9] drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
Date: Mon,  6 Apr 2026 19:37:15 +0530
Message-ID: <20260406140722.154445-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406140722.154445-1-raag.jadav@intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
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
---
v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
v5: Re-initialize kernel queues through submission backend (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    |  5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 11 +++++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 8ce78e0b1d50..926d419310b6 100644
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
index 10556156eaad..f15192b83738 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2053,6 +2053,16 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
+static void guc_exec_queue_reinit(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	long timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
+			msecs_to_jiffies(q->sched_props.job_timeout_ms);
+
+	xe_sched_update_timeout(sched, timeout);
+	atomic_set(&q->guc->state, 0);
+}
+
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
@@ -2295,6 +2305,7 @@ static bool guc_exec_queue_active(struct xe_exec_queue *q)
  */
 static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.init = guc_exec_queue_init,
+	.reinit = guc_exec_queue_reinit,
 	.kill = guc_exec_queue_kill,
 	.fini = guc_exec_queue_fini,
 	.destroy = guc_exec_queue_destroy,
-- 
2.43.0

