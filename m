Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC42C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 21:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D0C10E1E5;
	Fri, 24 May 2024 21:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfCxZzPJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518E210E2EF
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716585305; x=1748121305;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LHkilb3fHAMG0nhOmlukbT+DgdtuE0j9CIJdgzPvLHQ=;
 b=GfCxZzPJ2gOFHfAkK5RlD4Swr1Wlid2A0+8MKRQkkXtkXcqqC21736ML
 Q+UlDx5MZP3mlwyHRK40KwbT3hrrjRVs757r60FqhK+1cOec+kPMQLTL0
 E52F2+CWRKka08wHD8a81oZWHSu5H0LEYvbcefLoGLwpZekj3TRGYyTth
 kdDTqIp46lN7Guw1YrSR3RboOhxTtKCj3Bc4HZjMPZ7FWitShp6JJtTAO
 FRAWJVGT8Z6LAjJYGmMclVyksMYXgXtL2IfeZNmL6NmGKTOBJX5NYPSmr
 MBfvNA+RAjUrrp8bMoF0Vqoex/k3uQWkAMTyPO4lEk7WYvPjTzm/g22KK Q==;
X-CSE-ConnectionGUID: yLGKpDZqT9uTw1QDVntqaQ==
X-CSE-MsgGUID: ulkleJxFRNuW8tAxADO/5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24106833"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="24106833"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 14:15:01 -0700
X-CSE-ConnectionGUID: j3R21M2MTYeE0dZHpOzPAg==
X-CSE-MsgGUID: lwrm4z28QrWyJNJqChTGeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38932141"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 14:15:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Use run_ticks instead of runtime for client stats
Date: Fri, 24 May 2024 14:14:59 -0700
Message-Id: <20240524211500.1345917-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240524211500.1345917-1-umesh.nerlige.ramappa@intel.com>
References: <20240524211500.1345917-1-umesh.nerlige.ramappa@intel.com>
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

Note that runtime is also used in the pm context, so it is confusing to
use the same name to denote run time of the drm client. Use a more
appropriate name for the client utilization.

While at it, drop the incorrect multi-lrc comment in the helper
description

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
 drivers/gpu/drm/xe/xe_drm_client.c   |  4 ++--
 drivers/gpu/drm/xe/xe_exec_queue.c   | 12 ++++++------
 drivers/gpu/drm/xe/xe_exec_queue.h   |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c     |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 03bedc33b21a..d0936d82cc1d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -556,8 +556,8 @@ struct xe_file {
 		struct mutex lock;
 	} exec_queue;
 
-	/** @runtime: hw engine class runtime in ticks for this drm client */
-	u64 runtime[XE_ENGINE_CLASS_MAX];
+	/** @run_ticks: hw engine class run time in ticks for this drm client */
+	u64 run_ticks[XE_ENGINE_CLASS_MAX];
 
 	/** @client: drm client */
 	struct xe_drm_client *client;
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index af404c9e5cc0..5679e9b15d06 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -252,7 +252,7 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
 	/* Accumulate all the exec queues from this client */
 	mutex_lock(&xef->exec_queue.lock);
 	xa_for_each(&xef->exec_queue.xa, i, q)
-		xe_exec_queue_update_runtime(q);
+		xe_exec_queue_update_run_ticks(q);
 	mutex_unlock(&xef->exec_queue.lock);
 
 	/* Get the total GPU cycles */
@@ -287,7 +287,7 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
 
 		class_name = xe_hw_engine_class_to_str(class);
 		drm_printf(p, "drm-cycles-%s:\t%llu\n",
-			   class_name, xef->runtime[class]);
+			   class_name, xef->run_ticks[class]);
 		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
 			   class_name, gpu_timestamp);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0fd61fb4d104..841d3ea71e0d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -756,14 +756,14 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 }
 
 /**
- * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
+ * xe_exec_queue_update_run_ticks() - Update run time in ticks for this exec queue
+ * from hw
  * @q: The exec queue
  *
- * Update the timestamp saved by HW for this exec queue and save runtime
- * calculated by using the delta from last update. On multi-lrc case, only the
- * first is considered.
+ * Update the timestamp saved by HW for this exec queue and save run ticks
+ * calculated by using the delta from last update.
  */
-void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
+void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 {
 	struct xe_file *xef;
 	struct xe_lrc *lrc;
@@ -789,7 +789,7 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
 	 */
 	lrc = &q->lrc[0];
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
+	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 }
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index e0f07d28ee1a..289a3a51d2a2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -75,6 +75,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
-void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
+void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index bd7f27efe0e0..8e5c591fcecd 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -306,7 +306,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
-	xe_exec_queue_update_runtime(job->q);
+	xe_exec_queue_update_run_ticks(job->q);
 	xe_sched_job_put(job);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 54778189cfd5..ee078a6d174a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -763,7 +763,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
-	xe_exec_queue_update_runtime(job->q);
+	xe_exec_queue_update_run_ticks(job->q);
 
 	trace_xe_sched_job_free(job);
 	xe_sched_job_put(job);
-- 
2.34.1

