Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B926C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73EA10E979;
	Thu, 15 May 2025 22:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="errCnmAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C723610E97C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747347524; x=1778883524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=slQrJ11m1jzatSyE1E8SHk7gxaa9RsNy7+N1zsgipRU=;
 b=errCnmAovdACbdnhAQ+kTbWZQqelcpbOA0AE1YvtO4wlnu5YoiUz4gzb
 PdpW/MkyvcYfb6NDA1thC5z/veb8RqlyUO7pELv8+Uv5LIFKi7usN5f8R
 D7SUP3hxhCZbzZ7ckejQlEVR9SA+tN70rO3qpaLTpr39yao5QaIoC91WO
 mP/53Vs7TLoL41S1sYbFrz+hAK13iGX8O/zVAQtPhZeyWduBf+wxQDaxs
 zXKJ+glfSsaVKxVpH/HUPdYi6e4NvyDc2BmhPwnPJXbYEhX0zRgh06qG7
 4R7Lx4DsSyv34ShVSJi6hIewo4qkeKc993gVrp1Yfaa9sYvyLrrj586Vn A==;
X-CSE-ConnectionGUID: lx3miwwBT4G8lP63jlEMjQ==
X-CSE-MsgGUID: Qzc10ZupTySVtRFpN2cSMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49237279"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49237279"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:18:43 -0700
X-CSE-ConnectionGUID: SQYsahAARj6w2K645tyWxA==
X-CSE-MsgGUID: TLtalKTaTAaHd5LYdLFtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138242912"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 15 May 2025 15:18:41 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 7/7] drm/xe/vf: Post migration,
 repopulate ring area for pending request
Date: Fri, 16 May 2025 00:18:27 +0200
Message-Id: <20250515221827.1493032-8-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515221827.1493032-1-tomasz.lis@intel.com>
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
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

The commands within ring area allocated for a request may contain
references to GGTT. These references require update after VF
migration, in order to continue any preempted LRCs, or jobs which
were emitted to the ring but not sent to GuC yet.

This change calls the emit function again for all such jobs,
as part of post-migration recovery.

v2: Moved few functions to better files

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++++-
 5 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 9814e29a09e1..ab1c66c20b1f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1051,3 +1051,20 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
 		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
 	}
 }
+
+/**
+ * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
+ * @eq: the &xe_exec_queue struct instance
+ */
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq)
+{
+	struct xe_gpu_scheduler *sched = &eq->guc->sched;
+	struct xe_sched_job *job;
+
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		if (xe_sched_job_is_error(job))
+			continue;
+
+		eq->ring_ops->emit_job(job);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index aeeecd38ba00..e512633273d9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq);
 
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4e1d8a86ed7e..542ded79212e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -766,6 +766,25 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	return fence;
 }
 
+/**
+ * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
+ *   on all queues under a guc.
+ * @guc: the &xe_guc struct instance
+ */
+void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
+{
+	struct xe_exec_queue *eq;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, eq) {
+		if (exec_queue_killed_or_banned_or_wedged(eq))
+			continue;
+		xe_exec_queue_jobs_ring_restore(eq);
+	}
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 2cc44298465f..e31680a08dba 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -33,6 +33,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
+
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
 void
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 3ac042da4b87..96e191ab33d2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -8,6 +8,7 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_exec_queue_types.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
@@ -16,6 +17,7 @@
 #include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_pm.h"
+#include "xe_sched_job_types.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
 #include "xe_sriov_vf.h"
@@ -245,6 +247,15 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
 	}
 }
 
+static void vf_post_migration_fixup_jobs(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		xe_guc_jobs_ring_rebase(&gt->uc.guc);
+}
+
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -327,7 +338,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	if (need_fixups) {
 		vf_post_migration_fixup_contexts(xe);
-		/* FIXME: add the recovery steps */
+		vf_post_migration_fixup_jobs(xe);
 		vf_post_migration_fixup_ctb(xe);
 	}
 
-- 
2.25.1

