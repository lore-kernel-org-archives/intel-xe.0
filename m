Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D3DC3DA66
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 13:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98F10E687;
	Fri, 25 Aug 2023 13:15:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B53110E687
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692969340; x=1724505340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=feUo8gPsskUKbh1jDVDaEwz3lRAGn9JVG+2uI8uySNA=;
 b=nKSK0qDZfwAg4qu5T54ymoxs7qP/mdoGBsog2ajPcIQgoiYlIN0GMzb9
 HIufz9zX1596rXitFFIS77Xa2S0OklW39ajJjWvu7QV7WvUNUPsXxyIOZ
 0sinftGYQ0aFQekRexRO4uADrLnz/MfR8cnWvgK/FpZXnCxjhheCPpDQz
 nGlnNPdbkBs9Nz439ytIu2x39XaUrZ9McOQkhAzmuti7/M7GtFdx2tkdE
 UemMWd4rQNNqkuLKgqWXbOFdqmpRMdwIJtBoW9ktFD9gcPAnS6i4L70Fn
 AgYr9kbGfA9+QJ6mT9SyiGiRQqWMkcZPzCJzcQpSPLDyL68K/Ej9DkRev Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377449564"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="377449564"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="984115436"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="984115436"
Received: from kmreisi-mobl.ger.corp.intel.com (HELO a41f4a12581f.intel.com)
 ([10.252.57.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 06:15:38 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:15:25 +0000
Message-Id: <20230825131525.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Rename engine to exec_queue
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 62 +++++++++++++++---------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c6a9e17d6889..b2414f183a2c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -53,18 +53,18 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 }
 
 /*
- * Helpers for engine state, using an atomic as some of the bits can transition
- * as the same time (e.g. a suspend can be happning at the same time as schedule
- * engine done being processed).
+ * Helpers for exec queue state, using an atomic as some of the bits can transition
+ * as the same time (e.g. a suspend can be happening at the same time as schedule
+ * exec queue done being processed).
  */
-#define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
-#define ENGINE_STATE_ENABLED		(1 << 1)
-#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
+#define EXEC_QUEUE_STATE_REGISTERED			(1 << 0)
+#define EXEC_QUEUE_STATE_ENABLED			(1 << 1)
+#define EXEC_QUEUE_STATE_PENDING_ENABLE		(1 << 2)
 #define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
-#define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
-#define ENGINE_STATE_SUSPENDED		(1 << 5)
-#define EXEC_QUEUE_STATE_RESET		(1 << 6)
-#define ENGINE_STATE_KILLED		(1 << 7)
+#define EXEC_QUEUE_STATE_DESTROYED			(1 << 4)
+#define EXEC_QUEUE_STATE_SUSPENDED			(1 << 5)
+#define EXEC_QUEUE_STATE_RESET				(1 << 6)
+#define EXEC_QUEUE_STATE_KILLED				(1 << 7)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -83,17 +83,17 @@ static void clear_exec_queue_registered(struct xe_exec_queue *q)
 
 static bool exec_queue_enabled(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_ENABLED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_ENABLED;
 }
 
 static void set_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static void clear_exec_queue_enabled(struct xe_exec_queue *q)
 {
-	atomic_and(~ENGINE_STATE_ENABLED, &q->guc->state);
+	atomic_and(~EXEC_QUEUE_STATE_ENABLED, &q->guc->state);
 }
 
 static bool exec_queue_pending_enable(struct xe_exec_queue *q)
@@ -148,17 +148,17 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
 
 static bool exec_queue_suspended(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_SUSPENDED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
 }
 
 static void set_exec_queue_suspended(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_SUSPENDED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_SUSPENDED, &q->guc->state);
 }
 
 static void clear_exec_queue_suspended(struct xe_exec_queue *q)
 {
-	atomic_and(~ENGINE_STATE_SUSPENDED, &q->guc->state);
+	atomic_and(~EXEC_QUEUE_STATE_SUSPENDED, &q->guc->state);
 }
 
 static bool exec_queue_reset(struct xe_exec_queue *q)
@@ -173,12 +173,12 @@ static void set_exec_queue_reset(struct xe_exec_queue *q)
 
 static bool exec_queue_killed(struct xe_exec_queue *q)
 {
-	return atomic_read(&q->guc->state) & ENGINE_STATE_KILLED;
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_KILLED;
 }
 
 static void set_exec_queue_killed(struct xe_exec_queue *q)
 {
-	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
+	atomic_or(EXEC_QUEUE_STATE_KILLED, &q->guc->state);
 }
 
 static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
@@ -252,7 +252,7 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/*
 	 * Must use GFP_NOWAIT as this lock is in the dma fence signalling path,
-	 * worse case user gets -ENOMEM on engine create and has to try again.
+	 * worse case user gets -ENOMEM on exec queue create and has to try again.
 	 *
 	 * FIXME: Have caller pre-alloc or post-alloc /w GFP_KERNEL to prevent
 	 * failure.
@@ -386,9 +386,9 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
 	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_, val_)
 
-static void __register_mlrc_engine(struct xe_guc *guc,
-				   struct xe_exec_queue *q,
-				   struct guc_ctxt_registration_info *info)
+static void __register_mlrc_exec_queue(struct xe_guc *guc,
+				       struct xe_exec_queue *q,
+				       struct guc_ctxt_registration_info *info)
 {
 #define MAX_MLRC_REG_SIZE      (13 + XE_HW_ENGINE_MAX_INSTANCE * 2)
 	u32 action[MAX_MLRC_REG_SIZE];
@@ -424,8 +424,8 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
 }
 
-static void __register_engine(struct xe_guc *guc,
-			      struct guc_ctxt_registration_info *info)
+static void __register_exec_queue(struct xe_guc *guc,
+				  struct guc_ctxt_registration_info *info)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_REGISTER_CONTEXT,
@@ -445,7 +445,7 @@ static void __register_engine(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void register_engine(struct xe_exec_queue *q)
+static void register_exec_queue(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
@@ -484,8 +484,8 @@ static void register_engine(struct xe_exec_queue *q)
 
 	/*
 	 * We must keep a reference for LR engines if engine is registered with
-	 * the GuC as jobs signal immediately and can't destroy an engine if the
-	 * GuC has a reference to it.
+	 * the GuC as jobs signal immediately and can't destroy an exec queue if
+	 * the GuC has a reference to it.
 	 */
 	if (xe_exec_queue_is_lr(q))
 		xe_exec_queue_get(q);
@@ -493,9 +493,9 @@ static void register_engine(struct xe_exec_queue *q)
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
 	if (xe_exec_queue_is_parallel(q))
-		__register_mlrc_engine(guc, q, &info);
+		__register_mlrc_exec_queue(guc, q, &info);
 	else
-		__register_engine(guc, &info);
+		__register_exec_queue(guc, &info);
 	init_policies(guc, q);
 }
 
@@ -662,7 +662,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
-			register_engine(q);
+			register_exec_queue(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
 			q->ring_ops->emit_job(job);
 		submit_exec_queue(q);
@@ -1347,7 +1347,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
-	atomic_and(EXEC_QUEUE_STATE_DESTROYED | ENGINE_STATE_SUSPENDED,
+	atomic_and(EXEC_QUEUE_STATE_DESTROYED | EXEC_QUEUE_STATE_SUSPENDED,
 		   &q->guc->state);
 	q->guc->resume_time = 0;
 	trace_xe_exec_queue_stop(q);
-- 
2.34.1

