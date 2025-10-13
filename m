Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E05CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDB410E13A;
	Mon, 13 Oct 2025 22:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PB2vG0FU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651F010E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760394698; x=1791930698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M9vp4GI4wsY6+hVnUr6v1FJIqxE0WUsmp6WMDaxfhPk=;
 b=PB2vG0FUK8bI0haXdV2kXN2FMOeeKdH6tzMT6crDd11CxJ3Ufv2FXVGJ
 fVlB3Xrc33TiiUj2srLztax+jmnBzVVAB45P8ZCinVLOrIM1dI1GPjBkw
 URxN2Wu3CodcOky72OHpENbFqlbEIA4GZRdlCi2UWWohNm3H8fEhdXajj
 BDR4HijZuaozm4nEFdcP4WwOQ0uiSDIHGA7tvnwQAxWuFGnvvbi9T7S6M
 koXhNe0hNEKHqao/AaqfAXtkoqmGgwU1opdrDFAAxo4iD1R1FLPnOwjbQ
 12oFrO13fqyuW1y6YE8EpffmlH4RIdvJAMqx/HUPmmWo15ybPP2xNfrlw A==;
X-CSE-ConnectionGUID: gkmMTX5JTxCkPwQ1Xgbm5Q==
X-CSE-MsgGUID: HqYTPOUeRny44rpUjMvgYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="79987309"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="79987309"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
X-CSE-ConnectionGUID: d+Nlr6PSQMaamMwDESjtUg==
X-CSE-MsgGUID: j+BNh7yrTjKbBXX3rBGQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="212677585"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/7] drm/xe: Add new exec queue trace points
Date: Mon, 13 Oct 2025 22:31:32 +0000
Message-Id: <20251013223135.189357-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013223135.189357-1-stuart.summers@intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
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

Add an exec queue and guc exec queue trace point
to separate out which part of the stack is executing.

This is helpful because several of the guc specific
paths rely on responses from guc which is interesting
to view separately in the event the guc stops responding
in the middle of an operation that would expect a
response from guc otherwise.

Also add in the exec queue pointer information to
the trace events for easier tracking. Contexts (guc_ids)
can get re-used, so this just makes grepping a little
easier in this type of debug.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  4 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 11 +++++++----
 drivers/gpu/drm/xe/xe_trace.h      | 22 ++++++++++++++++++++--
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 90cbc95f8e2e..a2ef381cf6d9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -377,6 +377,8 @@ void xe_exec_queue_destroy(struct kref *ref)
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
 
+	trace_xe_exec_queue_destroy(q);
+
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 
@@ -953,6 +955,8 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
 	struct xe_exec_queue *eq = q, *next;
 
+	trace_xe_exec_queue_kill(q);
+
 	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
 				 multi_gt_link) {
 		q->ops->kill(eq);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e9aa0625ce60..5ec1e4a83d68 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1003,9 +1003,12 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	}
 
 	mutex_lock(&guc->submission_state.lock);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		if (xe_exec_queue_get_unless_zero(q))
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		if (xe_exec_queue_get_unless_zero(q)) {
 			set_exec_queue_wedged(q);
+			trace_xe_exec_queue_wedge(q);
+		}
+	}
 	mutex_unlock(&guc->submission_state.lock);
 }
 
@@ -1455,7 +1458,7 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
 	xe_pm_runtime_get(guc_to_xe(guc));
-	trace_xe_exec_queue_destroy(q);
+	trace_xe_guc_exec_queue_destroy(q);
 
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
@@ -1716,7 +1719,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
-	trace_xe_exec_queue_kill(q);
+	trace_xe_guc_exec_queue_kill(q);
 	set_exec_queue_killed(q);
 	__suspend_fence_signal(q);
 	xe_guc_exec_queue_trigger_cleanup(q);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 314f42fcbcbd..a5dd0c48d894 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -71,6 +71,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 
 		    TP_STRUCT__entry(
 			     __string(dev, __dev_name_eq(q))
+			     __field(struct xe_exec_queue *, q)
 			     __field(enum xe_engine_class, class)
 			     __field(u32, logical_mask)
 			     __field(u8, gt_id)
@@ -82,6 +83,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 
 		    TP_fast_assign(
 			   __assign_str(dev);
+			   __entry->q = q;
 			   __entry->class = q->class;
 			   __entry->logical_mask = q->logical_mask;
 			   __entry->gt_id = q->gt->info.id;
@@ -91,8 +93,9 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			   __entry->flags = q->flags;
 			   ),
 
-		    TP_printk("dev=%s, %d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
-			      __get_str(dev), __entry->class, __entry->logical_mask,
+		    TP_printk("dev=%s, %p, %d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
+			      __get_str(dev), __entry->q,
+			      __entry->class, __entry->logical_mask,
 			      __entry->gt_id, __entry->width, __entry->guc_id,
 			      __entry->guc_state, __entry->flags)
 );
@@ -147,11 +150,21 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_close,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_wedge,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_kill,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_guc_exec_queue_kill,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cleanup_entity,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
@@ -162,6 +175,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_destroy,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_guc_exec_queue_destroy,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_reset,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
-- 
2.34.1

