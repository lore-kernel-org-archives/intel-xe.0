Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10538CAC5AC
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1C410E720;
	Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSBBTwlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ACB10E643
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080782; x=1789616782;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q/MDChptNP3i6HqDm6DkMmVb6+BpOrhzT4hyNi6DAYI=;
 b=TSBBTwloSzK4uBZMmSOnBRk1r2FKb+RhG06GgImXy/XR12Z7SJ991+oG
 fZMrzoFxL8mHQCY0VA9Yyxri+TQ/Y5vAHoaitvlPp5TzrkZlm8n3aIDi5
 1irgH5MyvuwBhEnasTCVSJ2HwWSzSOkychW5JARiNQKmMxvK3e290jxyH
 7abnyNPNOiNd1Ebzt4fJeEp3Xw79jKh7qtYpXj1o+fT6D+OhAqwsOpV/P
 XtDxyJ7FOgKZr9b+REb4t4oT65cZeJyvKXWDdTDgA2bbR37XKUpYzJeqB
 53U0zSMoJcZYesowlXXf7bjoaLcPv2IthMVt4Eyji0Ofcvodgi/xdVBAa A==;
X-CSE-ConnectionGUID: 7jdG4lkiSWGwRjyza0O68w==
X-CSE-MsgGUID: ZWWtiS8bTAa3mKdj87yfag==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060798"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060798"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
X-CSE-ConnectionGUID: SbMX6cWEQTWQbYJmbheVvQ==
X-CSE-MsgGUID: V/0ZiKgcRjK+X0nL94GOUw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/28] drm/xe/vf: Don't allow GT reset to be queued during VF
 post migration recovery
Date: Tue, 16 Sep 2025 20:46:03 -0700
Message-Id: <20250917034615.3977603-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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

With well behaved software, this should never happen.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |  9 -------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
 drivers/gpu/drm/xe/xe_guc_submit.c  | 41 +++--------------------------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
 4 files changed, 4 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e0ad7e5b5df..1a4796cd885b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -803,11 +803,6 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
-static int gt_wait_reset_unblock(struct xe_gt *gt)
-{
-	return xe_guc_wait_reset_unblock(&gt->uc.guc);
-}
-
 static int gt_reset(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
@@ -822,10 +817,6 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_info(gt, "reset started\n");
 
-	err = gt_wait_reset_unblock(gt);
-	if (!err)
-		xe_gt_warn(gt, "reset block failed to get lifted");
-
 	xe_pm_runtime_get(gt_to_xe(gt));
 
 	if (xe_fault_inject_gt_reset()) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2d64cdd450d0..12a56a975358 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1184,17 +1184,11 @@ static bool vf_migration_supported(void)
 
 static void vf_post_migration_shutdown(struct xe_gt *gt)
 {
-	int ret = 0;
-
 	spin_lock(&gt->sriov.vf.migration.lock);
 	gt->sriov.vf.migration.recovery_queued = false;
 	spin_unlock(&gt->sriov.vf.migration.lock);
 
 	xe_guc_submit_pause(&gt->uc.guc);
-	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
-
-	if (ret)
-		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
@@ -1228,7 +1222,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
 	 */
 	xe_irq_resume(gt_to_xe(gt));
 
-	xe_guc_submit_reset_unblock(&gt->uc.guc);
 	xe_guc_submit_unpause(&gt->uc.guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5afe277d7818..0cd5987606f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -27,6 +27,7 @@
 #include "xe_gt.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
@@ -2172,47 +2173,13 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	}
 }
 
-/**
- * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
- * @guc: the &xe_guc struct instance
- */
-int xe_guc_submit_reset_block(struct xe_guc *guc)
-{
-	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
-}
-
-/**
- * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
- * @guc: the &xe_guc struct instance
- */
-void xe_guc_submit_reset_unblock(struct xe_guc *guc)
-{
-	atomic_set_release(&guc->submission_state.reset_blocked, 0);
-	wake_up_all(&guc->ct.wq);
-}
-
-static int guc_submit_reset_is_blocked(struct xe_guc *guc)
-{
-	return atomic_read_acquire(&guc->submission_state.reset_blocked);
-}
-
-/* Maximum time of blocking reset */
-#define RESET_BLOCK_PERIOD_MAX (HZ * 5)
-
-/**
- * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
- * @guc: the &xe_guc struct instance
- */
-int xe_guc_wait_reset_unblock(struct xe_guc *guc)
-{
-	return wait_event_timeout(guc->ct.wq,
-				  !guc_submit_reset_is_blocked(guc), RESET_BLOCK_PERIOD_MAX);
-}
-
 int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
+	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
+		return 0;
+
 	if (!guc->submission_state.initialized)
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 5b4a0a6fd818..f535fe3895e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -22,9 +22,6 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
-int xe_guc_submit_reset_block(struct xe_guc *guc);
-void xe_guc_submit_reset_unblock(struct xe_guc *guc);
-int xe_guc_wait_reset_unblock(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
-- 
2.34.1

