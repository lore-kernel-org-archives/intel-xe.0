Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47D8C47073
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 17:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6878210E61A;
	Wed, 10 Jan 2024 17:32:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FBA10E61A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704907975; x=1736443975;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HgPtRIp3jKzinQgEiBpF7lQNOvR+7nM5tEstfNB/HAo=;
 b=YQlN1ljPc0p6bC8xLewylOLLfYbDaR88dpublNMbBtNInu3HriRgfQTe
 d6VoaWa4dN6LC0uni6iE1chLQ3P7Ee8YPXReytU3Qg3XiS3QfvOh4kVOa
 GlfytNEjcjKtLoLG/HTZ+L41hYqQblPmaniHMuynFtMBeFsqsDRweaF+8
 UFIh1f5WwpGO2538/oVGPJ8mqnJulCb9MtE4zelh14oOTWjFe790ER5Ah
 NF3JiqnXuLFAnHAua5v6hOyVGqua9cYKaiqWUVbhnVfN05Wo9cuccQVWt
 b45FyOAFBDX8y1f0LPITBl9zHJ1aAva7w/+wrJXc4hPuFT5V+z3mrH76D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389026824"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="389026824"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955435671"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955435671"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:32:53 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/xe: Add exec_queue.sched_props.job_timeout_ms
Date: Wed, 10 Jan 2024 09:32:50 -0800
Message-ID: <20240110173252.16707-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110173252.16707-1-brian.welty@intel.com>
References: <20240110173252.16707-1-brian.welty@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 2 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cd2b9a8e51f5..4ff7e50112ca 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -65,6 +65,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
 				hwe->eclass->sched_props.preempt_timeout_us;
+	q->sched_props.job_timeout_ms =
+				hwe->eclass->sched_props.job_timeout_ms;
 	if (q->flags & EXEC_QUEUE_FLAG_KERNEL &&
 	    q->flags & EXEC_QUEUE_FLAG_HIGH_PRIORITY)
 		q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 8d4b7feb8c30..6041892d894e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -142,6 +142,8 @@ struct xe_exec_queue {
 		u32 timeslice_us;
 		/** @preempt_timeout_us: preemption timeout in micro-seconds */
 		u32 preempt_timeout_us;
+		/** @job_timeout_ms: job timeout in milliseconds */
+		u32 job_timeout_ms;
 		/** @priority: priority of this exec queue */
 		enum xe_exec_queue_priority priority;
 	} sched_props;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 54ffcfcdd41f..392cbde62957 100644
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
-- 
2.43.0

