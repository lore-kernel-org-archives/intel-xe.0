Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD00C5B555
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 00:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA4710E806;
	Fri,  6 Jun 2025 00:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dv3w73kX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CDB10E806
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 00:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749169112; x=1780705112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUSW5zz4RQonp78wFQEIGP9uDZREiMm41HYpEB0gjXA=;
 b=Dv3w73kXpea+vQrJgryK+Vp0hSy1jxA60M0kmLr1CvTmB5BvW9z7EwPZ
 HewOkwRLMUCn5BSGcMAIf8uuk1oFyI1J9er/n0jCF5exf8sbpTQNgjRQI
 R2OgWWTptKXgMmKNc/KFU3XUkz8Q6puZM9HcKttYTaDLti+kCX4/vJZvG
 MwRP4rAPIdZfFv75qG/W6fjeyptVb5SrfRX/69RkqYiGAwiyN7wWxn6Hv
 WBf7el3+A0BTVeFGBb44e9xH8LQMTaLKzmGwRUNRJIcfkugyIeOVgaxfR
 eQezhfvU2VmZ3zv1X2igVqW5p+K5ebE+E9NUzxQdyt4lzI+9UHrvhJ/eh Q==;
X-CSE-ConnectionGUID: zZwpulTzT4auOKtwgiOw1w==
X-CSE-MsgGUID: 8ckr7TzYREukM+Y3E5BlCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61973475"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61973475"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 17:18:31 -0700
X-CSE-ConnectionGUID: NsNdw2MNSuyLO6y98XrC8g==
X-CSE-MsgGUID: pymbRKByQsioBvy7s28LNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="149507875"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 17:18:30 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 3/8] drm/xe/vf: Pause submissions during RESFIX fixups
Date: Fri,  6 Jun 2025 02:18:18 +0200
Message-Id: <20250606001823.1010994-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606001823.1010994-1-tomasz.lis@intel.com>
References: <20250606001823.1010994-1-tomasz.lis@intel.com>
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

While applying post-migration fixups to VF, GuC will not respond
to any commands. This means submissions have no way of finishing.

To avoid acquiring additional resources and then stalling
on hardware access, pause the submission work. This will
decrease the chance of depleting resources, and speed up
the recovery.

v2: Commented xe_irq_resume() call
v3: Typo fix

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 ++++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c    | 35 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c      | 46 +++++++++++++++++++++++++++
 5 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 869b43a4151d..455ccaf17314 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -101,6 +101,19 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
 	cancel_work_sync(&sched->work_process_msg);
 }
 
+/**
+ * xe_sched_submission_stop_async - Stop further runs of submission tasks on a scheduler.
+ * @sched: the &xe_gpu_scheduler struct instance
+ *
+ * This call disables further runs of scheduling work queue. It does not wait
+ * for any in-progress runs to finish, only makes sure no further runs happen
+ * afterwards.
+ */
+void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_wqueue_stop(&sched->base);
+}
+
 void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
 {
 	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 308061f0cf37..e548b2aed95a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
 
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
 void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
+void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
 
 void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 2b61d017eeca..61a1aac7a976 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1822,6 +1822,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 }
 
+/**
+ * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
+ * @guc: the &xe_guc struct instance whose scheduler is to be disabled
+ */
+void xe_guc_submit_pause(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		xe_sched_submission_stop_async(&q->guc->sched);
+}
+
 static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
@@ -1862,6 +1875,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	return 0;
 }
 
+static void guc_exec_queue_unpause(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+	xe_sched_submission_start(sched);
+}
+
+/**
+ * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
+ * @guc: the &xe_guc struct instance whose scheduler is to be enabled
+ */
+void xe_guc_submit_unpause(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		guc_exec_queue_unpause(q);
+
+	wake_up_all(&guc->ct.wq);
+}
+
 static struct xe_exec_queue *
 g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 9b71a986c6ca..f1cf271492ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -18,6 +18,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
+void xe_guc_submit_pause(struct xe_guc *guc);
+void xe_guc_submit_unpause(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index eff6c7b96f25..b72542953004 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -11,6 +11,8 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_submit.h"
+#include "xe_irq.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
@@ -147,6 +149,48 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 		xe_sriov_info(xe, "migration not supported by this module version\n");
 }
 
+/**
+ * vf_post_migration_shutdown - Stop the driver activities after VF migration.
+ * @xe: the &xe_device struct instance
+ *
+ * After this VM is migrated and assigned to a new VF, it is running on a new
+ * hardware, and therefore many hardware-dependent states and related structures
+ * require fixups. Without fixups, the hardware cannot do any work, and therefore
+ * all GPU pipelines are stalled.
+ * Stop some of kernel activities to make the fixup process faster.
+ */
+static void vf_post_migration_shutdown(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		xe_guc_submit_pause(&gt->uc.guc);
+}
+
+/**
+ * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
+ * @xe: the &xe_device struct instance
+ *
+ * After we have finished with all post-migration fixups, restart the driver
+ * activities to continue feeding the GPU with workloads.
+ */
+static void vf_post_migration_kickstart(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	/*
+	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
+	 * must be working at this point, since the recovery did started,
+	 * but the rest was not enabled using the procedure from spec.
+	 */
+	xe_irq_resume(xe);
+
+	for_each_gt(gt, xe, id)
+		xe_guc_submit_unpause(&gt->uc.guc);
+}
+
 /**
  * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
  * @xe: the &xe_device struct instance
@@ -260,6 +304,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
+	vf_post_migration_shutdown(xe);
 	err = vf_post_migration_requery_guc(xe);
 	if (vf_post_migration_imminent(xe))
 		goto defer;
@@ -276,6 +321,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	if (need_fixups)
 		vf_post_migration_fixup_ctb(xe);
 
+	vf_post_migration_kickstart(xe);
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
-- 
2.25.1

