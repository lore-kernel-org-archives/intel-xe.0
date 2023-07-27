Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF43C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 18:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AD110E5DD;
	Thu, 27 Jul 2023 18:34:27 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3D510E5DD
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690482865; x=1722018865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bTpE4gZ54ejI0cBxZXft1H7DhMebuplkRfqitXr/gzI=;
 b=Cn48741lE36Qub3QXZkXvxrz7D1ZsDf20/JMyF4XVZAoBndF2Zip2unK
 DPq3EshHth1SOuk+vr/OQCHl8cvUJNdXcVVk1w4ZCTKoE2yCHIUlu6yHO
 sovCFoCk8lroeFSzB/H1OzWwH0kXshSp009Z/g56Q321/VqnkPJ7o+gPS
 qzW7FOJ4ZnF27x9TM1oF7kmC7CJtF6z3BsPpRJ25L8PGtHacOtqGD7mVL
 A5DPj+OswbrV9csWVpHlXW++XEq/f9BdIoQ3iGXYzsVnNDtrYUISPOgdT
 AnoOQ47KMNAwbqLfajl7MFSIMRYtek8ePwXgshUtiyuSObTTFqH7FyOPU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353310056"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="353310056"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 11:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="850894034"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="850894034"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 11:34:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 11:34:23 -0700
Message-Id: <20230727183423.538211-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove unnecessary memory barriers
 related to wait queue
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

These not needed per the wait queue doc, remove them.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c     | 3 ---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +--------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index cb75db30800c..3f58902b6be3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -308,7 +308,6 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	spin_unlock_irq(&ct->fast_lock);
 	mutex_unlock(&ct->lock);
 
-	smp_mb();
 	wake_up_all(&ct->wq);
 	drm_dbg(&xe->drm, "GuC CT communication channel enabled\n");
 
@@ -820,8 +819,6 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
 	g2h_fence->done = true;
-	smp_mb();
-
 	wake_up_all(&ct->g2h_fence_wq);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6cb64a097297..d623cd9f6cc4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -705,7 +705,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	int ret;
 
 	set_min_preemption_timeout(guc, e);
-	smp_rmb();
 	ret = wait_event_timeout(guc->ct.wq, !engine_pending_enable(e) ||
 				 guc_read_stopped(guc), HZ * 5);
 	if (!ret) {
@@ -888,7 +887,6 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 		 * error) messages which can cause the schedule disable to get
 		 * lost. If this occurs, trigger a GT reset to recover.
 		 */
-		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
 					 !engine_pending_disable(e) ||
 					 guc_read_stopped(guc), HZ * 5);
@@ -1008,7 +1006,6 @@ static void suspend_fence_signal(struct xe_engine *e)
 	XE_BUG_ON(!e->guc->suspend_pending);
 
 	e->guc->suspend_pending = false;
-	smp_wmb();
 	wake_up(&e->guc->suspend_wait);
 }
 
@@ -1392,7 +1389,6 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 	 * and releasing any TDRs waiting on guc->submission_state.stopped.
 	 */
 	ret = atomic_fetch_or(1, &guc->submission_state.stopped);
-	smp_wmb();
 	wake_up_all(&guc->ct.wq);
 
 	return ret;
@@ -1521,17 +1517,14 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (engine_pending_enable(e)) {
 		e->guc->resume_time = ktime_get();
 		clear_engine_pending_enable(e);
-		smp_wmb();
 		wake_up_all(&guc->ct.wq);
 	} else {
 		clear_engine_pending_disable(e);
 		if (e->guc->suspend_pending) {
 			suspend_fence_signal(e);
 		} else {
-			if (engine_banned(e)) {
-				smp_wmb();
+			if (engine_banned(e))
 				wake_up_all(&guc->ct.wq);
-			}
 			deregister_engine(guc, e);
 		}
 	}
-- 
2.34.1

