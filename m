Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B1CEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C1910E0CD;
	Tue,  1 Aug 2023 03:28:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EAE10E307
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690860478; x=1722396478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ldXxShx6IG3APFQUtMzqYJCN38NqhuXSnad+t7v9NEg=;
 b=ek9teTfxkomYhgX0xC/RX1edY02H3GneqqyyaT+o35vQbn8EFuyi6uR1
 7nxPPjNJBFQIP5lLHGNQ1Z7Optpkai+9kzu841tF/Rg7ZCbKF2OjC1uHX
 K8nUwWP02d8Ai+st+6toIXfmW9F8StIxQ4bxw8BZx7iQo8bN8gE23kR/n
 P9LxtS5Oy5fGS8eVP57xEG8eKNIuREzhEjsTudNp2Xh2z4nRwrCD/ERh7
 0EegR/iVXjbUy59F89E6xdPmjP48Tf1nD1PMoGtDJErVUdj1GGI2Oi61x
 mxQcXkj2vkSPkGvLuZaCcJzFcMdQaeMsoozELvVLu98hNkmicHZYQX9cs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="369182889"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="369182889"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763596187"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="763596187"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:27:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 31 Jul 2023 20:27:47 -0700
Message-Id: <20230801032748.434509-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801032748.434509-1-matthew.brost@intel.com>
References: <20230801032748.434509-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/sched: Submit job before starting
 TDR
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
 drivers/gpu/drm/scheduler/sched_main.c | 27 ++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0626aa6f7b70..fd265efc75d4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -369,11 +369,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
  */
 static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 {
+	lockdep_assert_held(&sched->job_list_lock);
+
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
 		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
+static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+
 /**
  * drm_sched_set_timeout - set timeout for reset worker
  *
@@ -464,7 +473,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
-	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -504,11 +512,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (status != DRM_GPU_SCHED_STAT_ENODEV)
+		drm_sched_start_timeout_unlocked(sched);
 }
 
 /**
@@ -636,11 +641,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 
 	drm_sched_run_wq_start(sched);
 
-	if (full_recovery) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (full_recovery)
+		drm_sched_start_timeout_unlocked(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -1178,10 +1180,11 @@ static void drm_sched_main(struct work_struct *w)
 		s_fence = sched_job->s_fence;
 
 		atomic_inc(&sched->hw_rq_count);
+		drm_sched_job_begin(sched_job);
 
 		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
-		drm_sched_job_begin(sched_job);
+		drm_sched_start_timeout_unlocked(sched);
 		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence, fence);
 
-- 
2.34.1

