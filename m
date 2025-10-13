Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4200DCCD194
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CED10E4AD;
	Mon, 13 Oct 2025 16:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5RkFVR2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EACD10E4A6
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760372713; x=1791908713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M9vp4GI4wsY6+hVnUr6v1FJIqxE0WUsmp6WMDaxfhPk=;
 b=E5RkFVR2ubK3aleI+uU5aIX+tCFMRvYaE6EXsbAEDmtCklNUkTqsi31+
 yjQZP4hGJg15Jf2uG2y28tNjevIB3O+qBSH8P0BP5+bSbyOgMUnGxGXEc
 Ndp99xXYJHydIWnEPhjcLKIJGE6apK/UoIaE5OpRe4K0gjtxlK4Ca9CKx
 kg3RzZuugGXNorBOw1Ia9Z6Ic1yaKzbykq4vZFoSo/lc1lgbl+/FOl+4q
 +rSjxdvZFC7vLlzYMfVAfN4tevOix3YahO1Ujq1JpZzsZjCBaFUFzcKxD
 HsPXjAkYYX3fmPsyuoHS1ZM7IHIdRXPkWA1WcxIOgaEiFzm+st0ktPLFF w==;
X-CSE-ConnectionGUID: D4IvsUTyR1S8zPrgMvqn9A==
X-CSE-MsgGUID: yMfme7GvRUaqrf1ZSQNSFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73963500"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73963500"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:12 -0700
X-CSE-ConnectionGUID: U5gjShxXTQK/5Y2TcA6thQ==
X-CSE-MsgGUID: CUgdjkitSiaeek0VdfEe6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185651407"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:12 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/7] drm/xe: Add new exec queue trace points
Date: Mon, 13 Oct 2025 16:25:01 +0000
Message-Id: <20251013162504.7768-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013162504.7768-1-stuart.summers@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
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

