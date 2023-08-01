Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB910C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F1910E307;
	Tue,  1 Aug 2023 03:28:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C89E10E306
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690860478; x=1722396478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riTEm9UJOumKg3djcAMA25GDpL28utDVLuBXmW3oyyA=;
 b=E9ZSEwtmSUci3I1HtGposIhnEane/pSiSoH0R1NXzGykRlaK/cVkUzi+
 vrGcx8pbiuH30NSRDUFXEeLtqvRaCj3KiEGwdpHhFWSCY7EVL/MtmN1h+
 woqgIMKTF9DCLA0+cpFQaQhG7kID0gPkaaZ25of7ISEC/dGZzkRAkbW06
 kAO0ZkwRwKDcdIa3waglicLQHC27oLWuhecePamG0AY5ptWv/1wSII1JI
 Nehw1YbDRcok6FHcdzRe7dY5VRPClVcTQyieC9n312+PMch6uNq/2VSsW
 eDBcENDbOpOZQQ3JNQ+WR9cEDrJ2GtQ1oBRaMahbDI2pbsxtIoBPgT4dG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="369182890"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="369182890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763596189"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="763596189"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:27:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 31 Jul 2023 20:27:48 -0700
Message-Id: <20230801032748.434509-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801032748.434509-1-matthew.brost@intel.com>
References: <20230801032748.434509-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] fixup! drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
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

---
 drivers/gpu/drm/scheduler/sched_main.c | 60 ++++++++++++--------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index fd265efc75d4..55094bc54c96 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -286,9 +286,7 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
  */
 void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched)
 {
-	sched->pause_run_wq = true;
-	smp_wmb();
-
+	WRITE_ONCE(sched->pause_run_wq, true);
 	cancel_work_sync(&sched->work_run);
 }
 EXPORT_SYMBOL(drm_sched_run_wq_stop);
@@ -300,9 +298,7 @@ EXPORT_SYMBOL(drm_sched_run_wq_stop);
  */
 void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched)
 {
-	sched->pause_run_wq = false;
-	smp_wmb();
-
+	WRITE_ONCE(sched->pause_run_wq, false);
 	queue_work(sched->run_wq, &sched->work_run);
 }
 EXPORT_SYMBOL(drm_sched_run_wq_start);
@@ -314,15 +310,13 @@ EXPORT_SYMBOL(drm_sched_run_wq_start);
  */
 static void drm_sched_run_wq_queue(struct drm_gpu_scheduler *sched)
 {
-	smp_rmb();
-
 	/*
 	 * Try not to schedule work if pause_run_wq set but not the end of world
 	 * if we do as either it will be cancelled by the above
 	 * cancel_work_sync, or drm_sched_main turns into a NOP while
 	 * pause_run_wq is set.
 	 */
-	if (!sched->pause_run_wq)
+	if (!READ_ONCE(sched->pause_run_wq))
 		queue_work(sched->run_wq, &sched->work_run);
 }
 
@@ -1106,7 +1100,7 @@ void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
 	 * Same as above in drm_sched_run_wq_queue, try to kick worker if
 	 * paused, harmless if this races
 	 */
-	if (!sched->pause_run_wq)
+	if (!READ_ONCE(sched->pause_run_wq))
 		queue_work(sched->run_wq, &sched->work_run);
 }
 EXPORT_SYMBOL(drm_sched_add_msg);
@@ -1142,39 +1136,38 @@ static void drm_sched_main(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_run);
+	struct drm_sched_entity *entity;
+	struct drm_sched_msg *msg;
+	struct drm_sched_job *cleanup_job;
 	int r;
 
-	while (!READ_ONCE(sched->pause_run_wq)) {
-		struct drm_sched_entity *entity;
-		struct drm_sched_msg *msg;
-		struct drm_sched_fence *s_fence;
-		struct drm_sched_job *sched_job;
-		struct dma_fence *fence;
-		struct drm_sched_job *cleanup_job;
+	if (READ_ONCE(sched->pause_run_wq))
+		return;
 
-		cleanup_job = drm_sched_get_cleanup_job(sched);
-		entity = drm_sched_select_entity(sched);
-		msg = drm_sched_get_msg(sched);
+	cleanup_job = drm_sched_get_cleanup_job(sched);
+	msg = drm_sched_get_msg(sched);
+	entity = drm_sched_select_entity(sched);
 
-		if (cleanup_job)
-			sched->ops->free_job(cleanup_job);
+	if (!entity && !cleanup_job && !msg)
+		return;	/* No more work */
 
-		if (msg)
-			sched->ops->process_msg(msg);
+	if (cleanup_job)
+		sched->ops->free_job(cleanup_job);
 
-		if (!entity) {
-			if (!cleanup_job && !msg)
-				break;
-			continue;
-		}
+	if (msg)
+		sched->ops->process_msg(msg);
 
-		sched_job = drm_sched_entity_pop_job(entity);
+	if (entity) {
+		struct dma_fence *fence;
+		struct drm_sched_fence *s_fence;
+		struct drm_sched_job *sched_job;
 
+		sched_job = drm_sched_entity_pop_job(entity);
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
 			if (!cleanup_job && !msg)
-				break;
-			continue;
+				return;	/* No more work */
+			goto again;
 		}
 
 		s_fence = sched_job->s_fence;
@@ -1206,6 +1199,9 @@ static void drm_sched_main(struct work_struct *w)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+again:
+	drm_sched_run_wq_queue(sched);
 }
 
 /**
-- 
2.34.1

