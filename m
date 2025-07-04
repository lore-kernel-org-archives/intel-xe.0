Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73584C8303D
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 21:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1A410E0E5;
	Fri,  4 Jul 2025 21:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqFLmDO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8C010E37C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751662967; x=1783198967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S2ZHv1AomkUvJUQNbNMl7kWdWa/21Ecu3nF7/eSkLIc=;
 b=BqFLmDO63TI9r1775mhmh2Y1y9uh6Fnx2mrbt7IAWQd+vEj3z9wpeASE
 s3UL6PgOJ3daxyCCE+ibwaTz7OfOK5uHBPU3I2ae81zDhStO0QloPVjDP
 PuyGdJCSuqU2LuJJqOD25TttIxPi8t3tG6wcs/xhu1Digm7AUXkGvM0nU
 GVZsoIEv2YufIqULx9fEWWVGIKuDHFUkSnmuJxKjjWcnL6z7L3NnDsbf6
 J+Iw4NnzvXTuZltSG6bSsyntb8Dyvt+r7AuGT8gCerMCD55/Ed+CDkUgI
 HRGBL8YySdTUNu7UjF+y2kzADQ35LRiiG3fd5koEx0cVpWFKAN/tUr9Pv w==;
X-CSE-ConnectionGUID: RbQVHzKhQkSPp7aF0dJPyg==
X-CSE-MsgGUID: +VNKSIVeQSKr9YsJe7CS1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54111450"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="54111450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 14:02:47 -0700
X-CSE-ConnectionGUID: 9ZyG8UpyRa2rbywxvLB0Fg==
X-CSE-MsgGUID: ibg7F+lZQ5mFiw/FWQU89w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="154840058"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 14:02:45 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 7/9] drm/xe/vf: Post migration,
 repopulate ring area for pending request
Date: Fri,  4 Jul 2025 23:02:26 +0200
Message-Id: <20250704210228.825843-8-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250704210228.825843-1-tomasz.lis@intel.com>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
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
 drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
 5 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ceafbd6e2032..bd8de62cb228 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1044,3 +1044,27 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
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
index da720197929b..0ffc0cb03aa6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 72369b78cbf5..37584a064574 100644
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
index 811cd9c0bf79..c0a1b2467d75 100644
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
index 43ac73e432d4..a219395c15de 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -284,7 +284,7 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
 		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
 		xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
-		/* FIXME: add the recovery steps */
+		xe_guc_jobs_ring_rebase(&gt->uc.guc);
 		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
 	}
 
-- 
2.25.1

