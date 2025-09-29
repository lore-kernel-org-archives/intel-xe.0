Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D85CCD180
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE5110E3A5;
	Mon, 29 Sep 2025 02:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAFbV/tf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B67410E20E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 02:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759114551; x=1790650551;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4e/V6x66vrc44K7BD3N07Fc8h9xqMorADh3vwqeibrw=;
 b=JAFbV/tf2I+ecFPixBCs0Osz3UWp6pGm6ecV0RsF9XrPJwY+DRjjptD2
 lJ2T+kP5c1l9SbuEE7NNmlSCHAdnFd/KY/3il1mOafWbiS0awrsOT8tNP
 I8jnnxFYJ6g7zwWmK1l8flNJQBD+ps2xSf9Pm4CiTkpE0A61Phpd+cS0p
 TmSv1vEJFKLNP9Xa0+Cyoj0NF6uiWyF8xsmT4CNGh7hXe8a9+qIBUtyxF
 +iHDk004nt3bfPZ2EeBAmh/XYRYgnIRfgQgv2NebwXYsAIzV6X6u7BSwb
 1ou+LIzd8aFvsl/eWXGhanu9wsJtGyiLYr4QJ+TpKGphSS5/7WtzqzVkh Q==;
X-CSE-ConnectionGUID: 9IZfH9+9RyuWwKld3UsMJQ==
X-CSE-MsgGUID: 546SFNI6TKWP3zuHek4h9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61398534"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61398534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
X-CSE-ConnectionGUID: RhjloF++SQGEB9Qv4rGeyg==
X-CSE-MsgGUID: iJ+v5LuzQwe4ONEilKMgrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="182529268"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 19:55:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 18/36] drm/xe/vf: Don't allow GT reset to be queued during
 VF post migration recovery
Date: Sun, 28 Sep 2025 19:55:24 -0700
Message-Id: <20250929025542.1486303-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929025542.1486303-1-matthew.brost@intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
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

With well-behaved software, a GT reset should never occur, nor should it
happen during VF post-migration recovery. If it does, trigger a warning
but suppress the GT reset, as VF post-migration recovery is expected to
bring the VF back to a working state.

v3:
 - Better commit message (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |  9 -------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
 drivers/gpu/drm/xe/xe_guc_submit.c  | 41 +++--------------------------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
 4 files changed, 4 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 82be38c99205..5f04d562604b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -815,11 +815,6 @@ static int do_gt_restart(struct xe_gt *gt)
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
@@ -834,10 +829,6 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_info(gt, "reset started\n");
 
-	err = gt_wait_reset_unblock(gt);
-	if (!err)
-		xe_gt_warn(gt, "reset block failed to get lifted");
-
 	xe_pm_runtime_get(gt_to_xe(gt));
 
 	if (xe_fault_inject_gt_reset()) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index cc5af19c1911..b16e8fd271f8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1175,17 +1175,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 
 static void vf_post_migration_shutdown(struct xe_gt *gt)
 {
-	int ret = 0;
-
 	spin_lock_irq(&gt->sriov.vf.migration.lock);
 	gt->sriov.vf.migration.recovery_queued = false;
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
 	xe_guc_submit_pause(&gt->uc.guc);
-	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
-
-	if (ret)
-		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
@@ -1219,7 +1213,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
 	 */
 	xe_irq_resume(gt_to_xe(gt));
 
-	xe_guc_submit_reset_unblock(&gt->uc.guc);
 	xe_guc_submit_unpause(&gt->uc.guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cd5e506527fe..b82976f031e5 100644
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
@@ -2182,47 +2183,13 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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

