Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37A7CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A6810E400;
	Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8EbIzyF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71C710E314
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747492; x=1791283492;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gfa0dxmQKla2GG3VHKQqW93glTeBeL/1TU1GW2djFXc=;
 b=f8EbIzyFcrbQO4/YmQX98g7onGqc/4VzsQL+wNHn9nU0pm28fBge1Sm2
 bLmUNPSG/MY9kpQLN8ZZhKTHaJa9EZJpEr92g0ORjj1kjxwxQFUfO391D
 0QKE9HhG+DL7QARsfVC9Wy855LQWYFW5dvjH6kuKrXz6Inbdz3RkthI0A
 4jKa/lKGB4Ks3/AK/H43C7Dt8c4I9Lbk+rBUTWZlwu2UCOfpzSjR/vtYI
 dUCXY2Z7PaAv/RHOqPzMvBVIgKN9OaSvEFi7jg1S7dczSuXqzmFy3+z3X
 B3SyNtac6nSTHlTqyyE/SaJmk23lis0zCX44DUJ+1AJuqgHK5FuaPI9MC A==;
X-CSE-ConnectionGUID: /9+I6SnzRzqdUbOrgMk2kQ==
X-CSE-MsgGUID: l+aVmGTQSparNHauQxQS0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546325"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546325"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:52 -0700
X-CSE-ConnectionGUID: hQUSa05pQdql98nqdXa4xw==
X-CSE-MsgGUID: LTggJ1qqSF6fdCrU34lWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589322"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 13/30] drm/xe/vf: Don't allow GT reset to be queued during
 VF post migration recovery
Date: Mon,  6 Oct 2025 03:44:28 -0700
Message-Id: <20251006104445.2210624-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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
v5:
 - Use xe_gt_WARN_ON (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c          |  9 -------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 -----
 drivers/gpu/drm/xe/xe_guc_submit.c  | 42 ++++-------------------------
 drivers/gpu/drm/xe/xe_guc_submit.h  |  3 ---
 4 files changed, 5 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 2d032eb3bd6d..cf484a2da35e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -805,11 +805,6 @@ static int do_gt_restart(struct xe_gt *gt)
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
@@ -824,10 +819,6 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_info(gt, "reset started\n");
 
-	err = gt_wait_reset_unblock(gt);
-	if (!err)
-		xe_gt_warn(gt, "reset block failed to get lifted");
-
 	xe_pm_runtime_get(gt_to_xe(gt));
 
 	if (xe_fault_inject_gt_reset()) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8a36f479df1b..7057260175f3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1103,17 +1103,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 
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
@@ -1147,7 +1141,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
 	 */
 	xe_irq_resume(gt_to_xe(gt));
 
-	xe_guc_submit_reset_unblock(&gt->uc.guc);
 	xe_guc_submit_unpause(&gt->uc.guc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d123bdb63369..59371b7cc8a4 100644
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
@@ -1900,47 +1901,14 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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
 
+	if (xe_gt_WARN_ON(guc_to_gt(guc),
+			  xe_gt_sriov_vf_recovery_pending(guc_to_gt(guc))))
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

