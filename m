Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DDACCD18B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3136510E683;
	Tue,  7 Oct 2025 11:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMgUt0DO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4820910E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836408; x=1791372408;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ce10l33vQhc1m3M/uHVFutZ5P2A+Xd43wEqM4c+8pek=;
 b=aMgUt0DOQrTTWekVfzseRW5YSunyGwS7zhRTGmd+EKtKlpNdHpY4uQaw
 Z3IthFZTYmBQ2L26R8WIpfCk6sZpo+xCP1N8O0iTl/0vSf1TT9832YZsR
 ghyY8KTl6O2TYjpukBpfH/MqIDedP3chwIpttzG39h3TXDnDD9YLwfT8f
 DNcY8qFnPEFA2m9YghKHHMRBXSvdSitMSGS9MyCUAN3lv+oaVokuz0JRr
 xMqE3kXtkSbfRcmUSAiNVF7UeLy3bnHt+IunaRAuzQZ0U9w6PywOsJAyc
 kh2oh6pj3GMNf09s7Nu6ef8sgH9RIG40E69gcpoM4HmSJhAbGk2Hg8UIR A==;
X-CSE-ConnectionGUID: j0imvlFkTAC1YdRzFc7uPA==
X-CSE-MsgGUID: EI8hPLSsTQaZcImm8HS+Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660674"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:47 -0700
X-CSE-ConnectionGUID: lZ8PJkOGQkavQIvXB8Ccvg==
X-CSE-MsgGUID: JcSHkSe2Q2GqcSoJpsGXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180923989"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 05/32] drm/xe: Don't change LRC ring head on job
 resubmission
Date: Tue,  7 Oct 2025 04:26:14 -0700
Message-Id: <20251007112641.2669655-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

Now that we save the job's head during submission, it's no longer
necessary to adjust the LRC ring head during resubmission. Instead, a
software-based adjustment of the tail will overwrite the old jobs in
place. For some odd reason, adjusting the LRC ring head didn't work on
parallel queues, which was causing issues in our CI.

v5:
 - Add comment in guc_exec_queue_start explaning why the function works
   (Auld)
v7:
 - Only adjust first state on first unsignaled job (Auld)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 21 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_submit.c    | 18 ++++++++++++++++--
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index e548b2aed95a..3a9ff78d9346 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -77,17 +77,30 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
 	spin_unlock(&sched->base.job_list_lock);
 }
 
+/**
+ * xe_sched_first_pending_job() - Find first pending job which is unsignaled
+ * @sched: Xe GPU scheduler
+ *
+ * Return first unsignaled job in pending list or NULL
+ */
 static inline
 struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
 {
-	struct xe_sched_job *job;
+	struct xe_sched_job *job, *r_job = NULL;
 
 	spin_lock(&sched->base.job_list_lock);
-	job = list_first_entry_or_null(&sched->base.pending_list,
-				       struct xe_sched_job, drm.list);
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		struct drm_sched_fence *s_fence = job->drm.s_fence;
+		struct dma_fence *hw_fence = s_fence->parent;
+
+		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
+			r_job = job;
+			break;
+		}
+	}
 	spin_unlock(&sched->base.job_list_lock);
 
-	return job;
+	return r_job;
 }
 
 static inline int
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3a534d93505f..d123bdb63369 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2008,11 +2008,25 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i < q->width; ++i)
-			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
+		if (job) {
+			for (i = 0; i < q->width; ++i) {
+				/*
+				 * The GuC context is unregistered at this point
+				 * time, adjusting software ring tail ensures
+				 * jobs are rewritten in original placement,
+				 * adjusting LRC tail ensures the newly loaded
+				 * GuC / contexts only view the LRC tail
+				 * increasing as jobs are written out.
+				 */
+				q->lrc[i]->ring.tail = job->ptrs[i].head;
+				xe_lrc_set_ring_tail(q->lrc[i],
+						     xe_lrc_ring_head(q->lrc[i]));
+			}
+		}
 		xe_sched_resubmit_jobs(sched);
 	}
 
-- 
2.34.1

