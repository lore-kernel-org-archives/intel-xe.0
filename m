Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E1FC5B555
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 00:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E886610E2F7;
	Fri,  6 Jun 2025 00:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDdqY28a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662A210E2F7
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 00:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749169119; x=1780705119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/Iwbb9sy58TcM0NlUcBh1/Z/xpIEXVTBny+rq3iuQs=;
 b=eDdqY28aHgSaI0KWFSNThynpzwHyRl8RlJEXBeuSxAS9jBlTlqfkxcN3
 gSvlJNDN9oZHmX1VpJ6mc79px3XG2bc8tIzbmBDEHC28hqKdNrz7VZEXH
 XHYlCZU7ERtpe6wwA75BakUQi511kALY6w7MVlqaR5GpO+h9RidrjG2Vs
 qIKSMch9A86If9ic45qBPASSCrxH4r2tpTNPb+tdfFHuokGFTj/KjgdV/
 Z70Kp+SD0QrH/I5nB3TtNV9wpTKyhvyO14wkIHOM2MTo11d1v5DNZpFoH
 lYgRPtktVBiwcckyCJNpgPUEYgtKcYgeTy8zkD8FVoOHTdKX8dWNZueyA A==;
X-CSE-ConnectionGUID: 0N5AcmFzSEqrI6Uw+2kGfQ==
X-CSE-MsgGUID: qmgaByiDRruB5Gn9LjPFfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61973485"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61973485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 17:18:39 -0700
X-CSE-ConnectionGUID: ksLkHT3PQ6SChk/LJoWu9g==
X-CSE-MsgGUID: UjrHcvD8QTCznK33vXqAhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="149507895"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2025 17:18:38 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 7/8] drm/xe/vf: Post migration,
 repopulate ring area for pending request
Date: Fri,  6 Jun 2025 02:18:22 +0200
Message-Id: <20250606001823.1010994-8-tomasz.lis@intel.com>
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

The commands within ring area allocated for a request may contain
references to GGTT. These references require update after VF
migration, in order to continue any preempted LRCs, or jobs which
were emitted to the ring but not sent to GuC yet.

This change calls the emit function again for all such jobs,
as part of post-migration recovery.

v2: Moved few functions to better files
v3: Take job_list_lock

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++++-
 5 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 86b2f9034902..d5ffb550bde7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1043,3 +1043,27 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
 		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
 	}
 }
+
+/**
+ * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
+ * @q: the &xe_exec_queue struct instance
+ */
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_job *job;
+
+	/*
+	 * This routine is used within VF migration recovery. This means
+	 * using the lock here, introduces a restriction: in no place we
+	 * can wait for any GFX HW response when that lock is taken.
+	 */
+	spin_lock(&sched->base.job_list_lock);
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		if (xe_sched_job_is_error(job))
+			continue;
+
+		q->ring_ops->emit_job(job);
+	}
+	spin_unlock(&sched->base.job_list_lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 1d399a33c5c0..67c2baa42c0f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
 
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 89b4c09e733a..57ad4d850540 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -777,6 +777,30 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	return fence;
 }
 
+/**
+ * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
+ * on all queues under a guc.
+ * @guc: the &xe_guc struct instance
+ */
+void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	/*
+	 * This routine is used within VF migration recovery. This means
+	 * using the lock here, introduces a restriction: in no place we
+	 * can wait for any GFX HW response when that lock is taken.
+	 */
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		if (exec_queue_killed_or_banned_or_wedged(q))
+			continue;
+		xe_exec_queue_jobs_ring_restore(q);
+	}
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 5b43e6639f52..4bc16dd5c333 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -34,6 +34,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
+
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
 void
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cf07d037a83a..8fa11a592933 100644
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
@@ -253,6 +255,15 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
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
@@ -340,7 +351,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	if (need_fixups) {
 		vf_post_migration_fixup_contexts(xe);
-		/* FIXME: add the recovery steps */
+		vf_post_migration_fixup_jobs(xe);
 		vf_post_migration_fixup_ctb(xe);
 	}
 
-- 
2.25.1

