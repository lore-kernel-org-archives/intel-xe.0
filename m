Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFA0D5D687
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 19:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCA010E8D2;
	Thu,  7 Nov 2024 19:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBEdk35D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB710E1F5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731008879; x=1762544879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2i3fFKKqJag5ecLcwVpu9XQt80Sjz8pKfVpFAME8XuA=;
 b=EBEdk35DCVyEzzDE55xhSUjJxpREwdoXkkxgFtrkkDmaMx/mjOK7nR3x
 HHoO+bhDV8v4Oyn+WYlhQ8RG810rdaxF19NMv2Nr3pq34tOHzSX6pKkX0
 /QOkIK0IVwzOR5xMAyIkINjEteW0jckj0xPefvQR+eBW2FH25P58sTWGe
 fK1Gixy/NRROg444/iRtvr+2okiKQ9DrjVe1tyWK8MdEJnJJZXi2pX1mk
 uRiABIgt/in3O0ugsQZsl1+8kbmxDkAjgmwbRjGbkIXJLSVW0QtSR4At5
 anNeY3qvfz8NHDSUDdH5FG+iodPFnyaVdw551ArJzo1R1y6/KxZO/ti3t w==;
X-CSE-ConnectionGUID: +0qnfXvtQ02pIBSdiOybjw==
X-CSE-MsgGUID: uTfXryIYQXG5lDexmk5aQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31045974"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31045974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 11:47:58 -0800
X-CSE-ConnectionGUID: mg4/ODUZShKrtqjTeIlljg==
X-CSE-MsgGUID: FOuCICgDSLOlbXXZwnlsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="90340361"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.2.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 11:47:56 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Prefer GT oriented asserts in submit code
Date: Thu,  7 Nov 2024 20:47:40 +0100
Message-Id: <20241107194741.2167-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241107194741.2167-1-michal.wajdeczko@intel.com>
References: <20241107194741.2167-1-michal.wajdeczko@intel.com>
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

For better diagnostics, use xe_gt_assert() instead of xe_assert().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 52 ++++++++++++------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e0f86f3778b..0311d9e50d06 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -412,12 +412,11 @@ static const int xe_exec_queue_prio_to_guc[] = {
 static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
-	struct xe_device *xe = guc_to_xe(guc);
 	enum xe_exec_queue_priority prio = q->sched_props.priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
-	xe_assert(xe, exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
 	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
@@ -451,12 +450,11 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 				       struct guc_ctxt_registration_info *info)
 {
 #define MAX_MLRC_REG_SIZE      (13 + XE_HW_ENGINE_MAX_INSTANCE * 2)
-	struct xe_device *xe = guc_to_xe(guc);
 	u32 action[MAX_MLRC_REG_SIZE];
 	int len = 0;
 	int i;
 
-	xe_assert(xe, xe_exec_queue_is_parallel(q));
+	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_parallel(q));
 
 	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
 	action[len++] = info->flags;
@@ -479,7 +477,7 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
 	}
 
-	xe_assert(xe, len <= MAX_MLRC_REG_SIZE);
+	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
 #undef MAX_MLRC_REG_SIZE
 
 	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
@@ -513,7 +511,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
 	struct xe_lrc *lrc = q->lrc[0];
 	struct guc_ctxt_registration_info info;
 
-	xe_assert(xe, !exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
 
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
@@ -603,7 +601,7 @@ static int wq_noop_append(struct xe_exec_queue *q)
 	if (wq_wait_for_space(q, wq_space_until_wrap(q)))
 		return -ENODEV;
 
-	xe_assert(xe, FIELD_FIT(WQ_LEN_MASK, len_dw));
+	xe_gt_assert(guc_to_gt(guc), FIELD_FIT(WQ_LEN_MASK, len_dw));
 
 	parallel_write(xe, map, wq[q->guc->wqi_tail / sizeof(u32)],
 		       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
@@ -643,13 +641,13 @@ static void wq_item_append(struct xe_exec_queue *q)
 		wqi[i++] = lrc->ring.tail / sizeof(u64);
 	}
 
-	xe_assert(xe, i == wqi_size / sizeof(u32));
+	xe_gt_assert(guc_to_gt(guc), i == wqi_size / sizeof(u32));
 
 	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
 				      wq[q->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	q->guc->wqi_tail += wqi_size;
-	xe_assert(xe, q->guc->wqi_tail <= WQ_SIZE);
+	xe_gt_assert(guc_to_gt(guc), q->guc->wqi_tail <= WQ_SIZE);
 
 	xe_device_wmb(xe);
 
@@ -661,7 +659,6 @@ static void wq_item_append(struct xe_exec_queue *q)
 static void submit_exec_queue(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_lrc *lrc = q->lrc[0];
 	u32 action[3];
 	u32 g2h_len = 0;
@@ -669,7 +666,7 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	int len = 0;
 	bool extra_submit = false;
 
-	xe_assert(xe, exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
 	if (xe_exec_queue_is_parallel(q))
 		wq_item_append(q);
@@ -716,12 +713,11 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct dma_fence *fence = NULL;
 	bool lr = xe_exec_queue_is_lr(q);
 
-	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
-		  exec_queue_banned(q) || exec_queue_suspended(q));
+	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
+		     exec_queue_banned(q) || exec_queue_suspended(q));
 
 	trace_xe_sched_job_run(job);
 
@@ -867,7 +863,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_gpu_scheduler *sched = &ge->sched;
 	bool wedged;
 
-	xe_assert(xe, xe_exec_queue_is_lr(q));
+	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
 	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
@@ -1274,9 +1270,8 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
+	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	trace_xe_exec_queue_cleanup_entity(q);
 
 	if (exec_queue_registered(q))
@@ -1312,11 +1307,10 @@ static void __suspend_fence_signal(struct xe_exec_queue *q)
 static void suspend_fence_signal(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, exec_queue_suspended(q) || exec_queue_killed(q) ||
-		  xe_guc_read_stopped(guc));
-	xe_assert(xe, q->guc->suspend_pending);
+	xe_gt_assert(guc_to_gt(guc), exec_queue_suspended(q) || exec_queue_killed(q) ||
+		     xe_guc_read_stopped(guc));
+	xe_gt_assert(guc_to_gt(guc), q->guc->suspend_pending);
 
 	__suspend_fence_signal(q);
 }
@@ -1412,12 +1406,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
 
-	xe_assert(xe, xe_device_uc_enabled(guc_to_xe(guc)));
+	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
 	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
 	if (!ge)
@@ -1630,9 +1623,8 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, !q->guc->suspend_pending);
+	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
 
 	xe_sched_msg_lock(sched);
 	guc_exec_queue_try_add_msg(q, msg, RESUME);
@@ -1744,9 +1736,8 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
+	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&guc->submission_state.lock);
 
@@ -1788,9 +1779,8 @@ int xe_guc_submit_start(struct xe_guc *guc)
 {
 	struct xe_exec_queue *q;
 	unsigned long index;
-	struct xe_device *xe = guc_to_xe(guc);
 
-	xe_assert(xe, xe_guc_read_stopped(guc) == 1);
+	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
@@ -1825,8 +1815,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 		return NULL;
 	}
 
-	xe_assert(xe, guc_id >= q->guc->id);
-	xe_assert(xe, guc_id < (q->guc->id + q->width));
+	xe_gt_assert(guc_to_gt(guc), guc_id >= q->guc->id);
+	xe_gt_assert(guc_to_gt(guc), guc_id < (q->guc->id + q->width));
 
 	return q;
 }
-- 
2.43.0

