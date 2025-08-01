Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECB5C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 01:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48FA10E2D7;
	Fri,  1 Aug 2025 01:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTD/EPhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D581E10E2D7
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 01:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754013031; x=1785549031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VnVPn4os82HeWt0S+3WbsQuFFKXs9hSSIfdJ3+7L2Fg=;
 b=ZTD/EPhNuGWvOx90KZzC5PZTT0rIRKsDe33R0ehV2VEL7qqnkfNvOdw5
 wOxdPBPde20Mu9DxnvQiiIAgt7nYc8kMaHot35eT2wOYr0NGvB46XLizG
 zqMpOPe8n7y/YXTUPQO7tmVNhB2yiDTUOAE67xfxYr3jlRNsPjjBIpHrH
 xWz57fL9fyNwqJ1Fwi4djcUdsiLXHtGS7MZ7gYiVvj2g+9pRbnE/xNvKa
 s1uf4kjKiNZkDArbTWwoIuGDp6YmZZps3U7r2V5MOY280HGEJHFuyiQsp
 xvJrHyCTbRxMp8rWGdrOI70UtMSKmePnHmcPfDooRjKMQx+N7IO36u1Sx g==;
X-CSE-ConnectionGUID: hieq8pXiQY+up0kE5Xh8cg==
X-CSE-MsgGUID: Lkug+4nzQKOCdyZdfrkF/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="43953676"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="43953676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 18:50:30 -0700
X-CSE-ConnectionGUID: XCHe4EuARsySysWn/8rYIQ==
X-CSE-MsgGUID: 1gtMvaAdSwq/F6xFwwECEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194401367"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 18:50:29 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 2/8] drm/xe/vf: Pause submissions during RESFIX fixups
Date: Fri,  1 Aug 2025 03:50:39 +0200
Message-Id: <20250801015045.957609-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801015045.957609-1-tomasz.lis@intel.com>
References: <20250801015045.957609-1-tomasz.lis@intel.com>
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
Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
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
index 751da5cd1d44..fe132d9d3156 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1830,6 +1830,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
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
@@ -1870,6 +1883,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
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
index 8f64e799283b..ff44500f3da2 100644
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
index 26e243c28994..c66b17da1ce7 100644
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
 static bool gt_vf_post_migration_needed(struct xe_gt *gt)
 {
 	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
@@ -230,6 +274,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
+	vf_post_migration_shutdown(xe);
 
 	if (!vf_migration_supported(xe)) {
 		xe_sriov_err(xe, "migration not supported by this module version\n");
@@ -247,6 +292,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 		set_bit(id, &fixed_gts);
 	}
 
+	vf_post_migration_kickstart(xe);
 	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
 	if (err)
 		goto fail;
-- 
2.25.1

