Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FE6CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F45610E883;
	Wed,  8 Oct 2025 21:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHWRKPw2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2145E10E89D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959942; x=1791495942;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ebmLwbRodXTW/Rd4QembnWY9pOERrhbhsxyTEgyoNoQ=;
 b=SHWRKPw2PK55V8na7tolXqkf5jRWp7wh2LypJWrkfYM/d2Kc+Dq21WC/
 RZbEMk3Gt2V2KgOxJ9O+3crcwC/XU/6ENd5czzlgtkEbHHhNk4Scc2YGO
 TUWzhc2kmVRyXTd4Tf9Czrlex9pcBxB+Y1lzE7zalkJUt1e6CFAQRFtbU
 0bf682htcGeYeD261wVCZduiYmSW/3A3TMzVgxJvzJmwRY61vpigSFDWu
 bxa0owuRw4HT4oRl+xebHtWesjB9pY8tv7cYmjQ9omLcS1jVnm+FIGwOu
 SOLTxjvjuQ7YxQqjpAd2Vx0So6LMtoNVF+/WnoChgm79sLxCZjxgKrM8C Q==;
X-CSE-ConnectionGUID: ATJgTqGDSvCRqxKQdB8eQA==
X-CSE-MsgGUID: 9Muqez/8SXW4FFhsBs6xEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726861"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726861"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:41 -0700
X-CSE-ConnectionGUID: +PE8ZzLARW+XifFtlp2RLw==
X-CSE-MsgGUID: Ogjwvz2jRF28p2sCtQWWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635196"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 16/34] drm/xe/vf: Don't allow GT reset to be queued during
 VF post migration recovery
Date: Wed,  8 Oct 2025 14:45:14 -0700
Message-Id: <20251008214532.3442967-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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
index d713b649447b..6951fedd4350 100644
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
index 1aae4e40a366..96c93a64d754 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1097,17 +1097,11 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 
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
@@ -1142,7 +1136,6 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
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

