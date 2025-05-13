Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFA9C3ABC9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 22:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821B610E5FB;
	Tue, 13 May 2025 22:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8jNVa6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B06210E5FB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176601; x=1778712601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5swOgXq9dLNYFwH36OuT326Ay4hwIzmOFSbuT7SiME=;
 b=m8jNVa6IzgWkcoMVZ2plSobpTm7Imn2imb3bovz90IUPXejACT0GRFlV
 ZfHtBpM6Fgr0aO3Y4MhrHWo+mnGYfGoavhAT3cNF2ZWRhIhdWacL/6tah
 f+3AV/Gxh0Jsfuej0HmKEKWyMuKtqxaiKutEPTStsLnB6QDqGg7DHyDWl
 /kfT0xGKseLpaot1qh/GJgAb618hrMo+1nUnc5OXlzt+/f9QFbtHZtNeA
 r+ShZJakngTkLo9ToFgOLeyhKI9ociyEMmDGN1Y9msQ+V4i/I9EjHkwQ7
 oX3KiSjZrw1Vtt6j+XnRq/VmLqqebXxvr+lkR/hIHC7OQECULiXaRD2p4 g==;
X-CSE-ConnectionGUID: oX/1aLm1SHqRWsgVDdApNQ==
X-CSE-MsgGUID: GYIwex00RYeglcfOsi9Dgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860512"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:50:01 -0700
X-CSE-ConnectionGUID: cRMUAl0nQT+Ook157GdHKQ==
X-CSE-MsgGUID: qWANFizAQ6yuYMO6eU8e0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142789361"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 15:49:59 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
Date: Wed, 14 May 2025 00:49:48 +0200
Message-Id: <20250513224952.701343-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513224952.701343-1-tomasz.lis@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 +++++++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c    | 35 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c      | 40 +++++++++++++++++++++++++++
 5 files changed, 91 insertions(+)

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
index c250ea773491..d78b4e8203f9 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
 
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
 void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
+void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
 
 void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fb125f940de8..8c119d4009b0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1814,6 +1814,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
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
@@ -1854,6 +1867,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
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
index 940b81036321..69c1f41908d1 100644
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
@@ -134,6 +136,42 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
 }
 
+/**
+ * vf_post_migration_shutdown - Stop the driver activities after VF migration.
+ * @xe: the &xe_device struct instance
+ *
+ * After this VM is migrated and assigned to a new VF, it is running on a new
+ * hardware, and therefore many hardware-dependent states and related structures
+ * require fixups. Without fixups, the hardware cannot do any work, and therefore
+ * all GPU pipelines are stalled.
+ * Stop some of kernel acivities to make the fixup process faster.
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
+	xe_irq_resume(xe);
+	for_each_gt(gt, xe, id)
+		xe_guc_submit_unpause(&gt->uc.guc);
+}
+
 /**
  * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all GuCs.
  * @xe: the &xe_device struct instance
@@ -249,6 +287,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
+	vf_post_migration_shutdown(xe);
 	err = vf_post_migration_requery_guc(xe);
 	if (vf_post_migration_imminent(xe))
 		goto defer;
@@ -260,6 +299,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	if (need_fixups)
 		vf_post_migration_fixup_ctb(xe);
 
+	vf_post_migration_kickstart(xe);
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
-- 
2.25.1

