Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C63C47079
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAC610E2CB;
	Wed,  3 Jan 2024 18:44:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6290A10E2D1
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704307449; x=1735843449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0XI/hs3oNc40TfI22mk3/sTqhRCJH+w79vR4TR+a1N8=;
 b=MWY8noxjjHZ74tSQVWbI1qufWVxAZFn6QcJWx2j2KzXC9MJ+TDzxK817
 VKQ9SI0/+e8SwWI8oR5nVWjUuSThxQ63BsXagvQFFDnruPEcLACt+ddPZ
 9ijLOxY4x89ONcJ14+ZvOHgX2Zo8Ui2PVXXD7X/Agexys1J/f+XEDhhPT
 MAWdwxyAcOf2RpdcejctaHwy2LWpaHzBGLW3hYz95qNqoIOwQWI9sUhuQ
 4Uhv5d953KY8lDU9oCUYNWeP42TpPaQu5NTVc4wKzCczgat3/+b6qMeVg
 rPsfwUoNytrRxVvA7MRl3T2jq3w7XWzsMkquWBtnEclvI/Xn6/6xR2M/K A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3815683"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="3815683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814330127"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="814330127"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:08 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/xe: Add exec_queue.sched_props.job_timeout_ms
Date: Wed,  3 Jan 2024 10:44:05 -0800
Message-ID: <20240103184408.17844-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103184408.17844-1-brian.welty@intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_submit.c       | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

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
index 21ac68e3246f..56c0a7bf554f 100644
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

