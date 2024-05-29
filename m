Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE13FC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 19:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E0D11A2BD;
	Wed, 29 May 2024 19:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IL51RGDL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F116911A2BD
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717010993; x=1748546993;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=84mu8zu9DuCZxuiSgXTBMwYSI94IjoHcYJGgfhwVOf4=;
 b=IL51RGDLsq9spi/EBOlLnujWY9/cJG6Fv6O4aHcd+Iwg3C71N+sruqX3
 7C6+s6s4AtecBRiuU9zIa9TvQltO0kbaz7PSaf86u+5sYtkOTMNCwekuH
 i9QfR8Z1wXAbt5N/NG8Mr4ctDB8rWBi2t9XlR/BiZ93hkergXJQqogkgl
 EGfhMOpOiXWbenkKBVsReX344COjrY9Rp7btVzP9Rq2f8QWAzb3ePvvpV
 yBcsvjfOyeKZv0/YcbX7AQRW8ZIrQAeUBZ+D9UkOPh5ojwsxBPxemwn4g
 Rr0uZgjVC3LXyJrkZV5iAOTZ1Tav88AKaKdsMitfqUCJjwZaXpOC67mbW g==;
X-CSE-ConnectionGUID: WRsqOYvvTVOfyzzD+TnqMg==
X-CSE-MsgGUID: Rbn/k7a/TY+47W2hmDcOdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="35963247"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35963247"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 12:29:52 -0700
X-CSE-ConnectionGUID: Pkqr/gooQCuRyFydhqpKDg==
X-CSE-MsgGUID: sceiVu+uStGnd7FAlWyUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35498254"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 12:29:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Decouple xe_exec_queue and xe_lrc
Date: Wed, 29 May 2024 12:29:46 -0700
Message-ID: <20240529192946.20456-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Decouple xe_lrc from xe_exec_queue and reference count xe_lrc.
Removing hard coupling between xe_exec_queue and xe_lrc allows
flexible design where the user interface xe_exec_queue can be
destroyed independent of the hardware/firmware interface xe_lrc.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 26 +++++++-------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c         | 10 +++---
 drivers/gpu/drm/xe/xe_gt.c               |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 30 ++++++++--------
 drivers/gpu/drm/xe/xe_hw_engine.c        | 10 +++---
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 44 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h              | 19 ++++++++--
 drivers/gpu/drm/xe/xe_lrc_types.h        |  5 +++
 drivers/gpu/drm/xe/xe_ring_ops.c         | 10 +++---
 drivers/gpu/drm/xe/xe_sched_job.c        |  6 ++--
 12 files changed, 109 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index a2daae10ccc6..27215075c799 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -86,7 +86,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 	if (extensions) {
 		/*
-		 * may set q->usm, must come before xe_lrc_init(),
+		 * may set q->usm, must come before xe_lrc_create(),
 		 * may overwrite q->sched_props, must come before q->ops->init()
 		 */
 		err = exec_queue_user_extensions(xe, q, extensions, 0);
@@ -104,9 +104,11 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
-		err = xe_lrc_init(q->lrc + i, q->hwe, q, q->vm, SZ_16K);
-		if (err)
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		if (IS_ERR(q->lrc[i])) {
+			err = PTR_ERR(q->lrc[i]);
 			goto err_lrc;
+		}
 	}
 
 	err = q->ops->init(q);
@@ -117,7 +119,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 
 err_lrc:
 	for (i = i - 1; i >= 0; --i)
-		xe_lrc_finish(q->lrc + i);
+		xe_lrc_put(q->lrc[i]);
 	return err;
 }
 
@@ -198,7 +200,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	int i;
 
 	for (i = 0; i < q->width; ++i)
-		xe_lrc_finish(q->lrc + i);
+		xe_lrc_put(q->lrc[i]);
 	__xe_exec_queue_free(q);
 }
 
@@ -701,7 +703,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 
 static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
 {
-	return q->lrc->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc) - 1;
+	return q->lrc[0]->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc[0]) - 1;
 }
 
 /**
@@ -712,7 +714,7 @@ static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
 {
-	struct xe_lrc *lrc = q->lrc;
+	struct xe_lrc *lrc = q->lrc[0];
 	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
 
 	return xe_exec_queue_num_job_inflight(q) >= max_job;
@@ -738,16 +740,16 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 		int i;
 
 		for (i = 0; i < q->width; ++i) {
-			if (xe_lrc_seqno(&q->lrc[i]) !=
-			    q->lrc[i].fence_ctx.next_seqno - 1)
+			if (xe_lrc_seqno(q->lrc[i]) !=
+			    q->lrc[i]->fence_ctx.next_seqno - 1)
 				return false;
 		}
 
 		return true;
 	}
 
-	return xe_lrc_seqno(&q->lrc[0]) ==
-		q->lrc[0].fence_ctx.next_seqno - 1;
+	return xe_lrc_seqno(q->lrc[0]) ==
+		q->lrc[0]->fence_ctx.next_seqno - 1;
 }
 
 /**
@@ -779,7 +781,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	 * the LRCs and reading them in different time could also introduce
 	 * errors.
 	 */
-	lrc = &q->lrc[0];
+	lrc = q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
 	q->run_ticks += (new_ts - old_ts) * q->width;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index e81704c7c030..18d8b2a60928 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -146,7 +146,7 @@ struct xe_exec_queue {
 	/** @run_ticks: hw engine class run time in ticks for this exec queue */
 	u64 run_ticks;
 	/** @lrc: logical ring context for this exec queue */
-	struct xe_lrc lrc[];
+	struct xe_lrc *lrc[];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 8e5c591fcecd..db906117db6d 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -109,7 +109,7 @@ static void __xe_execlist_port_start(struct xe_execlist_port *port,
 			port->last_ctx_id = 1;
 	}
 
-	__start_lrc(port->hwe, exl->q->lrc, port->last_ctx_id);
+	__start_lrc(port->hwe, exl->q->lrc[0], port->last_ctx_id);
 	port->running_exl = exl;
 	exl->has_run = true;
 }
@@ -123,14 +123,14 @@ static void __xe_execlist_port_idle(struct xe_execlist_port *port)
 	if (!port->running_exl)
 		return;
 
-	xe_lrc_write_ring(&port->hwe->kernel_lrc, noop, sizeof(noop));
-	__start_lrc(port->hwe, &port->hwe->kernel_lrc, 0);
+	xe_lrc_write_ring(port->hwe->kernel_lrc, noop, sizeof(noop));
+	__start_lrc(port->hwe, port->hwe->kernel_lrc, 0);
 	port->running_exl = NULL;
 }
 
 static bool xe_execlist_is_idle(struct xe_execlist_exec_queue *exl)
 {
-	struct xe_lrc *lrc = exl->q->lrc;
+	struct xe_lrc *lrc = exl->q->lrc[0];
 
 	return lrc->ring.tail == lrc->ring.old_tail;
 }
@@ -333,7 +333,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	exl->q = q;
 
 	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
-			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
+			     q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
 			     NULL, NULL, q->hwe->name,
 			     gt_to_xe(q->gt)->drm.dev);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 34c1896807e9..9e9da887f4ca 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -297,8 +297,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		}
 
 		xe_map_memcpy_from(xe, default_lrc,
-				   &q->lrc[0].bo->vmap,
-				   xe_lrc_pphwsp_offset(&q->lrc[0]),
+				   &q->lrc[0]->bo->vmap,
+				   xe_lrc_pphwsp_offset(q->lrc[0]),
 				   xe_gt_lrc_size(gt, hwe->class));
 
 		gt->default_lrc[hwe->class] = default_lrc;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e22bd6b09a74..30b3619c2f26 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -490,7 +490,7 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 	action[len++] = info->hwlrca_hi;
 
 	for (i = 1; i < q->width; ++i) {
-		struct xe_lrc *lrc = q->lrc + i;
+		struct xe_lrc *lrc = q->lrc[i];
 
 		action[len++] = lower_32_bits(xe_lrc_descriptor(lrc));
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
@@ -527,7 +527,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct xe_lrc *lrc = q->lrc;
+	struct xe_lrc *lrc = q->lrc[0];
 	struct guc_ctxt_registration_info info;
 
 	xe_assert(xe, !exec_queue_registered(q));
@@ -586,7 +586,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct iosys_map map = xe_lrc_parallel_map(q->lrc);
+	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
 	unsigned int sleep_period_ms = 1;
 
 #define AVAILABLE_SPACE \
@@ -614,7 +614,7 @@ static int wq_noop_append(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct iosys_map map = xe_lrc_parallel_map(q->lrc);
+	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
 	u32 len_dw = wq_space_until_wrap(q) / sizeof(u32) - 1;
 
 	if (wq_wait_for_space(q, wq_space_until_wrap(q)))
@@ -634,7 +634,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct iosys_map map = xe_lrc_parallel_map(q->lrc);
+	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
 #define WQ_HEADER_SIZE	4	/* Includes 1 LRC address too */
 	u32 wqi[XE_HW_ENGINE_MAX_INSTANCE + (WQ_HEADER_SIZE - 1)];
 	u32 wqi_size = (q->width + (WQ_HEADER_SIZE - 1)) * sizeof(u32);
@@ -650,12 +650,12 @@ static void wq_item_append(struct xe_exec_queue *q)
 
 	wqi[i++] = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_MULTI_LRC) |
 		FIELD_PREP(WQ_LEN_MASK, len_dw);
-	wqi[i++] = xe_lrc_descriptor(q->lrc);
+	wqi[i++] = xe_lrc_descriptor(q->lrc[0]);
 	wqi[i++] = FIELD_PREP(WQ_GUC_ID_MASK, q->guc->id) |
-		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc->ring.tail / sizeof(u64));
+		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc[0]->ring.tail / sizeof(u64));
 	wqi[i++] = 0;
 	for (j = 1; j < q->width; ++j) {
-		struct xe_lrc *lrc = q->lrc + j;
+		struct xe_lrc *lrc = q->lrc[0] + j;
 
 		wqi[i++] = lrc->ring.tail / sizeof(u64);
 	}
@@ -670,7 +670,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 
 	xe_device_wmb(xe);
 
-	map = xe_lrc_parallel_map(q->lrc);
+	map = xe_lrc_parallel_map(q->lrc[0]);
 	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
 }
 
@@ -679,7 +679,7 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct xe_lrc *lrc = q->lrc;
+	struct xe_lrc *lrc = q->lrc[0];
 	u32 action[3];
 	u32 g2h_len = 0;
 	u32 num_g2h = 0;
@@ -1236,7 +1236,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
 			    get_submit_wq(guc),
-			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
@@ -1464,7 +1464,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 				ban = true;
 			}
 		} else if (xe_exec_queue_is_lr(q) &&
-			   (xe_lrc_ring_head(q->lrc) != xe_lrc_ring_tail(q->lrc))) {
+			   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
 			ban = true;
 		}
 
@@ -1529,7 +1529,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 
 		trace_xe_exec_queue_resubmit(q);
 		for (i = 0; i < q->width; ++i)
-			xe_lrc_set_ring_head(q->lrc + i, q->lrc[i].ring.tail);
+			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
 		xe_sched_resubmit_jobs(sched);
 	}
 
@@ -1775,7 +1775,7 @@ guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct iosys_map map = xe_lrc_parallel_map(q->lrc);
+	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
 	int i;
 
 	snapshot->guc.wqi_head = q->guc->wqi_head;
@@ -1855,7 +1855,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 
 	if (snapshot->lrc) {
 		for (i = 0; i < q->width; ++i) {
-			struct xe_lrc *lrc = q->lrc + i;
+			struct xe_lrc *lrc = q->lrc[i];
 
 			snapshot->lrc[i] = xe_lrc_snapshot_capture(lrc);
 		}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 9eef789be897..0a83506e1ad8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -268,7 +268,7 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 
 	if (hwe->exl_port)
 		xe_execlist_port_destroy(hwe->exl_port);
-	xe_lrc_finish(&hwe->kernel_lrc);
+	xe_lrc_put(hwe->kernel_lrc);
 
 	hwe->gt = NULL;
 }
@@ -527,9 +527,11 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		goto err_name;
 	}
 
-	err = xe_lrc_init(&hwe->kernel_lrc, hwe, NULL, NULL, SZ_16K);
-	if (err)
+	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	if (IS_ERR(hwe->kernel_lrc)) {
+		err = PTR_ERR(hwe->kernel_lrc);
 		goto err_hwsp;
+	}
 
 	if (!xe_device_uc_enabled(xe)) {
 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
@@ -554,7 +556,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	return drmm_add_action_or_reset(&xe->drm, hw_engine_fini, hwe);
 
 err_kernel_lrc:
-	xe_lrc_finish(&hwe->kernel_lrc);
+	xe_lrc_put(hwe->kernel_lrc);
 err_hwsp:
 	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index b2f64b92a636..580bbd7e83b2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -137,7 +137,7 @@ struct xe_hw_engine {
 	/** @hwsp: hardware status page buffer object */
 	struct xe_bo *hwsp;
 	/** @kernel_lrc: Kernel LRC (should be replaced /w an xe_engine) */
-	struct xe_lrc kernel_lrc;
+	struct xe_lrc *kernel_lrc;
 	/** @exl_port: execlists port */
 	struct xe_execlist_port *exl_port;
 	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e91967070478..26922e1bac82 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -808,11 +808,20 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 	xe_lrc_write_ctx_reg(lrc, CTX_PDP0_LDW, lower_32_bits(desc));
 }
 
+static void xe_lrc_finish(struct xe_lrc *lrc)
+{
+	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
+	xe_bo_lock(lrc->bo, false);
+	xe_bo_unpin(lrc->bo);
+	xe_bo_unlock(lrc->bo);
+	xe_bo_put(lrc->bo);
+}
+
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
-int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
+static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+		       struct xe_vm *vm, u32 ring_size)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -823,6 +832,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	u32 lrc_size;
 	int err;
 
+	kref_init(&lrc->refcount);
 	lrc->flags = 0;
 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
@@ -935,13 +945,31 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	return err;
 }
 
-void xe_lrc_finish(struct xe_lrc *lrc)
+struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
+			     u32 ring_size)
 {
-	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
-	xe_bo_lock(lrc->bo, false);
-	xe_bo_unpin(lrc->bo);
-	xe_bo_unlock(lrc->bo);
-	xe_bo_put(lrc->bo);
+	struct xe_lrc *lrc;
+	int err;
+
+	lrc = kzalloc(sizeof(*lrc), GFP_KERNEL);
+	if (!lrc)
+		return ERR_PTR(-ENOMEM);
+
+	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	if (err) {
+		kfree(lrc);
+		return ERR_PTR(err);
+	}
+
+	return lrc;
+}
+
+void xe_lrc_destroy(struct kref *ref)
+{
+	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
+
+	xe_lrc_finish(lrc);
+	kfree(lrc);
 }
 
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c2df6bfd1889..ebe0e362e434 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -7,6 +7,8 @@
 
 #include <linux/types.h>
 
+#include "xe_lrc_types.h"
+
 struct drm_printer;
 struct xe_bb;
 struct xe_device;
@@ -20,9 +22,20 @@ struct xe_vm;
 
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
-int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size);
-void xe_lrc_finish(struct xe_lrc *lrc);
+struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
+			     u32 ring_size);
+void xe_lrc_destroy(struct kref *ref);
+
+static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
+{
+	kref_get(&lrc->refcount);
+	return lrc;
+}
+
+static inline void xe_lrc_put(struct xe_lrc *lrc)
+{
+	kref_put(&lrc->refcount, xe_lrc_destroy);
+}
 
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 0fa055da6b27..71ecb453f811 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -6,6 +6,8 @@
 #ifndef _XE_LRC_TYPES_H_
 #define _XE_LRC_TYPES_H_
 
+#include <linux/kref.h>
+
 #include "xe_hw_fence_types.h"
 
 struct xe_bo;
@@ -30,6 +32,9 @@ struct xe_lrc {
 #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
 	u32 flags;
 
+	/** @refcount: ref count of this lrc */
+	struct kref refcount;
+
 	/** @ring: submission ring state */
 	struct {
 		/** @ring.size: size of submission ring */
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 550c3eafbc1d..2a607c141d65 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -396,7 +396,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 
 	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
 
-	__emit_job_gen12_simple(job, job->q->lrc,
+	__emit_job_gen12_simple(job, job->q->lrc[0],
 				job->ptrs[0].batch_addr,
 				xe_sched_job_lrc_seqno(job));
 }
@@ -406,13 +406,13 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 	int i;
 
 	if (xe_sched_job_is_migration(job->q)) {
-		emit_migration_job_gen12(job, job->q->lrc,
+		emit_migration_job_gen12(job, job->q->lrc[0],
 					 xe_sched_job_lrc_seqno(job));
 		return;
 	}
 
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_simple(job, job->q->lrc + i,
+		__emit_job_gen12_simple(job, job->q->lrc[i],
 					job->ptrs[i].batch_addr,
 					xe_sched_job_lrc_seqno(job));
 }
@@ -423,7 +423,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 
 	/* FIXME: Not doing parallel handshake for now */
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_video(job, job->q->lrc + i,
+		__emit_job_gen12_video(job, job->q->lrc[i],
 				       job->ptrs[i].batch_addr,
 				       xe_sched_job_lrc_seqno(job));
 }
@@ -433,7 +433,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
 	int i;
 
 	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_render_compute(job, job->q->lrc + i,
+		__emit_job_gen12_render_compute(job, job->q->lrc[i],
 						job->ptrs[i].batch_addr,
 						xe_sched_job_lrc_seqno(job));
 }
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 29f3201d7dfa..5c013904877a 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -216,7 +216,7 @@ void xe_sched_job_set_error(struct xe_sched_job *job, int error)
 
 bool xe_sched_job_started(struct xe_sched_job *job)
 {
-	struct xe_lrc *lrc = job->q->lrc;
+	struct xe_lrc *lrc = job->q->lrc[0];
 
 	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
 				     xe_lrc_start_seqno(lrc),
@@ -225,7 +225,7 @@ bool xe_sched_job_started(struct xe_sched_job *job)
 
 bool xe_sched_job_completed(struct xe_sched_job *job)
 {
-	struct xe_lrc *lrc = job->q->lrc;
+	struct xe_lrc *lrc = job->q->lrc[0];
 
 	/*
 	 * Can safely check just LRC[0] seqno as that is last seqno written when
@@ -265,7 +265,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		struct dma_fence_chain *chain;
 
 		fence = job->ptrs[i].lrc_fence;
-		xe_lrc_init_seqno_fence(&q->lrc[i], fence);
+		xe_lrc_init_seqno_fence(q->lrc[i], fence);
 		job->ptrs[i].lrc_fence = NULL;
 		if (!i) {
 			job->lrc_seqno = fence->seqno;
-- 
2.43.0

