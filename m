Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCC8CCD186
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFA310E79D;
	Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kn8+h7kE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897BC10E787
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384448; x=1790920448;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PCQg0FBEJhZGT6mSrihDPt+yr5Yb6TZ20nE1HoTxT44=;
 b=kn8+h7kEoAU2ONt1+kNMEeCHpdvkSegmxOHGnNkNdRzXGMxyeEWTGYxc
 cA+nHeR7gMUQTfijgx7tW9thZZ7EUk+LxvpFjAlL4Bh9gk1XBKxlirwJG
 T0+A4UVMm/Uk9pIr0z6BxFGLYbK5yfr4cN8QljeY0oQ83ZO1vcyON+/aT
 J4Av5uI3pK2E1acNhpXqt+yQos4j36/z6gpZop4Ig8JM5Q/2Mk/5FIbWN
 FVrNo9zk/2LyzqIde6LzTWwOaKsRk5mbDMj57skwRWqHBw08r8RKdUIcH
 YG2Ydv43CHZJsC86HXpcAsAVmfWa4FGMBMxamaf5B17LKD50AGl7464gB w==;
X-CSE-ConnectionGUID: gUUZUEhkRrq+vXTnKlY2zA==
X-CSE-MsgGUID: RQ5rwtSAQXWiJKrwAVYkcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304505"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: uZzExMo1T2O1I7CdEkN9ZA==
X-CSE-MsgGUID: NfEJHAQMRy+SMo41is2Vwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083536"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 12/34] drm/xe/vf: Make VF recovery run on per-GT worker
Date: Wed,  1 Oct 2025 22:53:40 -0700
Message-Id: <20251002055402.1865880-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

VF recovery is a per-GT operation, so it makes sense to isolate it to a
per-GT queue. Scheduling this operation on the same worker as the GT
reset and TDR not only aligns with this design but also helps avoid race
conditions, as those operations can also modify the queue state.

v2:
 - Fix lockdep splat (Adam)
 - Use xe_sriov_vf_migration_supported helper
v3:
 - Drop xe_gt_sriov_ prefix for private functions (Michal)
 - Drop message in xe_gt_sriov_vf_migration_init_early (Michal)
 - Logic rework in vf_post_migration_notify_resfix_done (Michal)
 - Rework init sequence layering (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 179 +++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          | 240 ----------------------
 drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
 7 files changed, 182 insertions(+), 258 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e0ad7e5b5df..5f9ba4caf837 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -398,6 +398,12 @@ int xe_gt_init_early(struct xe_gt *gt)
 			return err;
 	}
 
+	if (IS_SRIOV_VF(gt_to_xe(gt))) {
+		err = xe_gt_sriov_vf_init_early(gt);
+		if (err)
+			return err;
+	}
+
 	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
 
 	err = xe_wa_gt_init(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index c2be8fc14c88..dd223fb2bb97 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -25,11 +25,15 @@
 #include "xe_guc.h"
 #include "xe_guc_hxg_helpers.h"
 #include "xe_guc_relay.h"
+#include "xe_guc_submit.h"
+#include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
+#include "xe_tile_sriov_vf.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -308,13 +312,13 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
 }
 
 /**
- * xe_gt_sriov_vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
+ * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
  * @gt: the &xe_gt struct instance linked to target GuC
  *
  * Returns: 0 if the operation completed successfully, or a negative error
  * code otherwise.
  */
-int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
+static int vf_notify_resfix_done(struct xe_gt *gt)
 {
 	struct xe_guc *guc = &gt->uc.guc;
 	int err;
@@ -756,7 +760,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
  * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
  * @gt: the &xe_gt struct instance
  */
-void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
+static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
 {
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
@@ -765,6 +769,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
 		xe_default_lrc_update_memirq_regs_with_address(hwe);
 }
 
+static void vf_start_migration_recovery(struct xe_gt *gt)
+{
+	bool started;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	spin_lock(&gt->sriov.vf.migration.lock);
+
+	if (!gt->sriov.vf.migration.recovery_queued) {
+		gt->sriov.vf.migration.recovery_queued = true;
+		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
+
+		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
+		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
+				 "scheduled" : "already in progress");
+	}
+
+	spin_unlock(&gt->sriov.vf.migration.lock);
+}
+
 /**
  * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
  *   or just mark that a GuC is ready for it.
@@ -779,15 +803,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
 
-	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
-	/*
-	 * We need to be certain that if all flags were set, at least one
-	 * thread will notice that and schedule the recovery.
-	 */
-	smp_mb__after_atomic();
-
 	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
-	xe_sriov_vf_start_migration_recovery(xe);
+	vf_start_migration_recovery(gt);
 }
 
 static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
@@ -1121,6 +1138,146 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 		   pf_version->major, pf_version->minor);
 }
 
+static void vf_post_migration_shutdown(struct xe_gt *gt)
+{
+	int ret = 0;
+
+	spin_lock_irq(&gt->sriov.vf.migration.lock);
+	gt->sriov.vf.migration.recovery_queued = false;
+	spin_unlock_irq(&gt->sriov.vf.migration.lock);
+
+	xe_guc_submit_pause(&gt->uc.guc);
+	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
+
+	if (ret)
+		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
+}
+
+static size_t post_migration_scratch_size(struct xe_device *xe)
+{
+	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
+}
+
+static int vf_post_migration_fixups(struct xe_gt *gt)
+{
+	s64 shift;
+	void *buf;
+	int err;
+
+	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
+	if (!buf)
+		return -ENOMEM;
+
+	err = xe_gt_sriov_vf_query_config(gt);
+	if (err)
+		goto out;
+
+	shift = xe_gt_sriov_vf_ggtt_shift(gt);
+	if (shift) {
+		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
+		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
+		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
+		if (err)
+			goto out;
+	}
+
+out:
+	kfree(buf);
+	return err;
+}
+
+static void vf_post_migration_kickstart(struct xe_gt *gt)
+{
+	/*
+	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
+	 * must be working at this point, since the recovery did started,
+	 * but the rest was not enabled using the procedure from spec.
+	 */
+	xe_irq_resume(gt_to_xe(gt));
+
+	xe_guc_submit_reset_unblock(&gt->uc.guc);
+	xe_guc_submit_unpause(&gt->uc.guc);
+}
+
+static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
+{
+	bool skip_resfix = false;
+
+	spin_lock_irq(&gt->sriov.vf.migration.lock);
+	if (gt->sriov.vf.migration.recovery_queued) {
+		skip_resfix = true;
+		xe_gt_sriov_dbg(gt, "another recovery imminent, resfix skipped\n");
+	} else {
+		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
+	}
+	spin_unlock_irq(&gt->sriov.vf.migration.lock);
+
+	if (skip_resfix)
+		return -EAGAIN;
+
+	return vf_notify_resfix_done(gt);
+}
+
+static void vf_post_migration_recovery(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
+
+	xe_pm_runtime_get(xe);
+	vf_post_migration_shutdown(gt);
+
+	if (!xe_sriov_vf_migration_supported(xe)) {
+		xe_gt_sriov_err(gt, "migration is not supported\n");
+		err = -ENOTRECOVERABLE;
+		goto fail;
+	}
+
+	err = vf_post_migration_fixups(gt);
+	if (err)
+		goto fail;
+
+	vf_post_migration_kickstart(gt);
+	err = vf_post_migration_notify_resfix_done(gt);
+	if (err && err != -EAGAIN)
+		goto fail;
+
+	xe_pm_runtime_put(xe);
+	xe_gt_sriov_notice(gt, "migration recovery ended\n");
+	return;
+fail:
+	xe_pm_runtime_put(xe);
+	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
+	xe_device_declare_wedged(xe);
+}
+
+static void migration_worker_func(struct work_struct *w)
+{
+	struct xe_gt *gt = container_of(w, struct xe_gt,
+					sriov.vf.migration.worker);
+
+	vf_post_migration_recovery(gt);
+}
+
+/**
+ * xe_gt_sriov_vf_init_early() - GT VF init early
+ * @gt: the &xe_gt
+ *
+ * Return 0 on success, errno on failure
+ */
+int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
+{
+	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
+		return 0;
+
+	init_rwsem(&gt->sriov.vf.self_config.lock);
+	spin_lock_init(&gt->sriov.vf.migration.lock);
+	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index bb5f8eace19b..0b0f2a30e67c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
 int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
-void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
-int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
+int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 1dfef60ec044..b2c8e8c89c30 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_SRIOV_VF_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/workqueue.h>
 #include "xe_uc_fw_types.h"
 
 /**
@@ -50,6 +51,12 @@ struct xe_gt_sriov_vf_runtime {
  * xe_gt_sriov_vf_migration - VF migration data.
  */
 struct xe_gt_sriov_vf_migration {
+	/** @migration: VF migration recovery worker */
+	struct work_struct worker;
+	/** @lock: Protects recovery_queued */
+	spinlock_t lock;
+	/** @recovery_queued: VF post migration recovery in queued */
+	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
 	bool recovery_inprogress;
 };
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index c1830ec8f0fd..911d5720917b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -6,21 +6,12 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
-#include "xe_assert.h"
-#include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
-#include "xe_guc_submit.h"
-#include "xe_irq.h"
-#include "xe_lrc.h"
-#include "xe_pm.h"
-#include "xe_sriov.h"
 #include "xe_sriov_printk.h"
 #include "xe_sriov_vf.h"
 #include "xe_sriov_vf_ccs.h"
-#include "xe_tile_sriov_vf.h"
 
 /**
  * DOC: VF restore procedure in PF KMD and VF KMD
@@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
 	xe->sriov.vf.migration.enabled = false;
 }
 
-static void migration_worker_func(struct work_struct *w);
-
 static void vf_migration_init_early(struct xe_device *xe)
 {
 	/*
@@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
 						    guc_version.major, guc_version.minor);
 	}
 
-	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
-
 	xe->sriov.vf.migration.enabled = true;
 	xe_sriov_dbg(xe, "migration support enabled\n");
 }
@@ -199,233 +186,6 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	vf_migration_init_early(xe);
 }
 
-/**
- * vf_post_migration_shutdown - Stop the driver activities after VF migration.
- * @xe: the &xe_device struct instance
- *
- * After this VM is migrated and assigned to a new VF, it is running on a new
- * hardware, and therefore many hardware-dependent states and related structures
- * require fixups. Without fixups, the hardware cannot do any work, and therefore
- * all GPU pipelines are stalled.
- * Stop some of kernel activities to make the fixup process faster.
- */
-static void vf_post_migration_shutdown(struct xe_device *xe)
-{
-	struct xe_gt *gt;
-	unsigned int id;
-	int ret = 0;
-
-	for_each_gt(gt, xe, id) {
-		xe_guc_submit_pause(&gt->uc.guc);
-		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
-	}
-
-	if (ret)
-		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
-}
-
-/**
- * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
- * @xe: the &xe_device struct instance
- *
- * After we have finished with all post-migration fixups, restart the driver
- * activities to continue feeding the GPU with workloads.
- */
-static void vf_post_migration_kickstart(struct xe_device *xe)
-{
-	struct xe_gt *gt;
-	unsigned int id;
-
-	/*
-	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
-	 * must be working at this point, since the recovery did started,
-	 * but the rest was not enabled using the procedure from spec.
-	 */
-	xe_irq_resume(xe);
-
-	for_each_gt(gt, xe, id) {
-		xe_guc_submit_reset_unblock(&gt->uc.guc);
-		xe_guc_submit_unpause(&gt->uc.guc);
-	}
-}
-
-static bool gt_vf_post_migration_needed(struct xe_gt *gt)
-{
-	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
-}
-
-/*
- * Notify GuCs marked in flags about resource fixups apply finished.
- * @xe: the &xe_device struct instance
- * @gt_flags: flags marking to which GTs the notification shall be sent
- */
-static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
-{
-	struct xe_gt *gt;
-	unsigned int id;
-	int err = 0;
-
-	for_each_gt(gt, xe, id) {
-		if (!test_bit(id, &gt_flags))
-			continue;
-		/* skip asking GuC for RESFIX exit if new recovery request arrived */
-		if (gt_vf_post_migration_needed(gt))
-			continue;
-		err = xe_gt_sriov_vf_notify_resfix_done(gt);
-		if (err)
-			break;
-		clear_bit(id, &gt_flags);
-	}
-
-	if (gt_flags && !err)
-		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
-	return err;
-}
-
-static int vf_get_next_migrated_gt_id(struct xe_device *xe)
-{
-	struct xe_gt *gt;
-	unsigned int id;
-
-	for_each_gt(gt, xe, id) {
-		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
-			return id;
-	}
-	return -1;
-}
-
-static size_t post_migration_scratch_size(struct xe_device *xe)
-{
-	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
-}
-
-/**
- * Perform post-migration fixups on a single GT.
- *
- * After migration, GuC needs to be re-queried for VF configuration to check
- * if it matches previous provisioning. Most of VF provisioning shall be the
- * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
- * range has changed, we have to perform fixups - shift all GGTT references
- * used anywhere within the driver. After the fixups in this function succeed,
- * it is allowed to ask the GuC bound to this GT to continue normal operation.
- *
- * Returns: 0 if the operation completed successfully, or a negative error
- * code otherwise.
- */
-static int gt_vf_post_migration_fixups(struct xe_gt *gt)
-{
-	s64 shift;
-	void *buf;
-	int err;
-
-	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	err = xe_gt_sriov_vf_query_config(gt);
-	if (err)
-		goto out;
-
-	shift = xe_gt_sriov_vf_ggtt_shift(gt);
-	if (shift) {
-		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
-		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
-		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
-		if (err)
-			goto out;
-	}
-
-out:
-	kfree(buf);
-	return err;
-}
-
-static void vf_post_migration_recovery(struct xe_device *xe)
-{
-	unsigned long fixed_gts = 0;
-	int id, err;
-
-	drm_dbg(&xe->drm, "migration recovery in progress\n");
-	xe_pm_runtime_get(xe);
-	vf_post_migration_shutdown(xe);
-
-	if (!xe_sriov_vf_migration_supported(xe)) {
-		xe_sriov_err(xe, "migration is not supported\n");
-		err = -ENOTRECOVERABLE;
-		goto fail;
-	}
-
-	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
-		struct xe_gt *gt = xe_device_get_gt(xe, id);
-
-		err = gt_vf_post_migration_fixups(gt);
-		if (err)
-			goto fail;
-
-		set_bit(id, &fixed_gts);
-	}
-
-	vf_post_migration_kickstart(xe);
-	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
-	if (err)
-		goto fail;
-
-	xe_pm_runtime_put(xe);
-	drm_notice(&xe->drm, "migration recovery ended\n");
-	return;
-fail:
-	xe_pm_runtime_put(xe);
-	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
-	xe_device_declare_wedged(xe);
-}
-
-static void migration_worker_func(struct work_struct *w)
-{
-	struct xe_device *xe = container_of(w, struct xe_device,
-					    sriov.vf.migration.worker);
-
-	vf_post_migration_recovery(xe);
-}
-
-/*
- * Check if post-restore recovery is coming on any of GTs.
- * @xe: the &xe_device struct instance
- *
- * Return: True if migration recovery worker will soon be running. Any worker currently
- * executing does not affect the result.
- */
-static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
-{
-	struct xe_gt *gt;
-	unsigned int id;
-
-	for_each_gt(gt, xe, id) {
-		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
-			return true;
-	}
-	return false;
-}
-
-/**
- * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
- * @xe: the &xe_device to start recovery on
- *
- * This function shall be called only by VF.
- */
-void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
-{
-	bool started;
-
-	xe_assert(xe, IS_SRIOV_VF(xe));
-
-	if (!vf_ready_to_recovery_on_any_gts(xe))
-		return;
-
-	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
-	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
-		 "scheduled" : "already in progress");
-}
-
 /**
  * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
  * @xe: the &xe_device to initialize
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 9e752105ec2a..4df95266b261 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -13,7 +13,6 @@ struct xe_device;
 
 void xe_sriov_vf_init_early(struct xe_device *xe);
 int xe_sriov_vf_init_late(struct xe_device *xe);
-void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
 bool xe_sriov_vf_migration_supported(struct xe_device *xe);
 void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 426cc5841958..6a0fd0f5463e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -33,10 +33,6 @@ struct xe_device_vf {
 
 	/** @migration: VF Migration state data */
 	struct {
-		/** @migration.worker: VF migration recovery worker */
-		struct work_struct worker;
-		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
-		unsigned long gt_flags;
 		/**
 		 * @migration.enabled: flag indicating if migration support
 		 * was enabled or not due to missing prerequisites
-- 
2.34.1

