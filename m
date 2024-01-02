Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC196C4707C
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A14510E237;
	Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BB310E21E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704230252; x=1735766252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=upfgbx/U5V2p1WIH0fXjx5TM++/h/CsDfQ7gi7/DIdM=;
 b=TsmNTDkXiKpi0b/mNEzCpN4LJit3PwyuDpKMYIowoqurCRfTFZTyC1v8
 3YdLlwiQJ0AwRGctZBJdP/x6ru3HABs+VUcdQOzL3fQbxjshCHwqFwG5R
 uNWgQpSrwIxAeAdpavQWvGtEZhUsfTPz0vnYOWYEJlD63tz/vyquk36Ve
 bilKFXna48owMylJQ23yWkN1ek3X5O7xoPG42kFORfs+YJ7MOELgp7Y8K
 dgu7LDuoesKnkwzHeQYhpQKO9GqcPQvxnSO4UcF80P3v5nRERJ/+wI20K
 asNHbnRA0okRloA6Ljo77jw4IqV1gV5t8xEcIK4TPQVw6qLzJ6phPyb2n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396654456"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="396654456"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="898648793"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="898648793"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Add exec_queue.sched_props.job_timeout_ms
Date: Tue,  2 Jan 2024 13:17:29 -0800
Message-ID: <20240102211731.6720-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102211731.6720-1-brian.welty@intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
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

The purpose here is to allow to optimize exec_queue_set_job_timeout()
in follow-on patch.  Currently it does q->ops->set_job_timeout(...).
But we'd like to apply exec_queue_user_extensions much earlier and
q->ops cannot be called before __xe_exec_queue_init().

It will be much more efficient to instead only have to set
q->sched_props.job_timeout_ms when applying user extensions. That value
will then be used during q->ops->init().

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 2 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 3 ++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 94ae87540854..e78b13845417 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -65,6 +65,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
 				hwe->eclass->sched_props.preempt_timeout_us;
+	q->sched_props.job_timeout_ms =
+				hwe->eclass->sched_props.job_timeout_ms;
 
 	if (xe_exec_queue_is_parallel(q)) {
 		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 3d7e704ec3d9..882eb5373980 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -142,6 +142,8 @@ struct xe_exec_queue {
 		u32 timeslice_us;
 		/** @preempt_timeout_us: preemption timeout in micro-seconds */
 		u32 preempt_timeout_us;
+		/** @job_timeout_ms: job timeout in milliseconds */
+		u32 job_timeout_ms;
 	} sched_props;
 
 	/** @compute: compute exec queue state */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21ac68e3246f..6cbf41ad9c8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1218,7 +1218,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	init_waitqueue_head(&ge->suspend_wait);
 
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
-		  q->hwe->eclass->sched_props.job_timeout_ms;
+		  q->sched_props.job_timeout_ms;
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
 			    get_submit_wq(guc),
 			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
@@ -1361,6 +1361,7 @@ static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeo
 	xe_assert(xe, !exec_queue_banned(q));
 	xe_assert(xe, !exec_queue_killed(q));
 
+	q->sched_props.job_timeout_ms = job_timeout_ms;
 	sched->base.timeout = job_timeout_ms;
 
 	return 0;
-- 
2.43.0

