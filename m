Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14087C87FCB
	for <intel-xe@archiver.kernel.org>; Sat,  2 Aug 2025 03:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21EA10E066;
	Sat,  2 Aug 2025 03:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hk621VsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4E310E8F5
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Aug 2025 03:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754104238; x=1785640238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01TNH7V06/ULOCV6G/cVYX3YrqVdmhDzwUP82M0vhRQ=;
 b=Hk621VsX7cEpD7g2OiZgOZoQHoc+n9NbqLWe/ppO4xyzVleZHeP+tw4j
 K2AOVgHwJoRlrjjfM2NC1N0OCE/9+2VnmTMkmYexz9rR6CEpwdtKrVN0F
 rvNC3cntTh6jUFL8JoCQkMOkqEBfDCsZGQvS4s59eDhZvbU4d9kkxDThU
 UGSBPPZxK38rN6IM/xcPaKFQvHBOT9c5HeJxClHJeTvN4LsAPlNdyIId6
 g2XgxOMx1Agh1uqisE11yhLyQH9UpYEKvtzUpPhA+vMlvOl6TkkjjzzFj
 D5lWlvyX+Es8RH4V09612J8HTp4hYCE7c2FW5l6KbP8QyGsT2Vkiuh6CF Q==;
X-CSE-ConnectionGUID: ajTpk6QISQmjMrUIvKKqvg==
X-CSE-MsgGUID: ZMKBqTDJTkqDWOgpFn9g2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73910612"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="73910612"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 20:10:38 -0700
X-CSE-ConnectionGUID: Sng/6+d7Q1yGqEE211aogQ==
X-CSE-MsgGUID: 6Wk8VswiRqO9We+7kfW7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169093891"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 01 Aug 2025 20:10:36 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v9 6/8] drm/xe/vf: Post migration,
 repopulate ring area for pending request
Date: Sat,  2 Aug 2025 05:10:43 +0200
Message-Id: <20250802031045.1127138-7-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250802031045.1127138-1-tomasz.lis@intel.com>
References: <20250802031045.1127138-1-tomasz.lis@intel.com>
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
v4: Rephrased comments

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
 5 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0beb6388acb0..05a1bd6b55bf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1092,3 +1092,27 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
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
+	 * using the lock here introduces a restriction: we cannot wait
+	 * for any GFX HW response while the lock is taken.
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
index 452fb6e63f31..f32ddd9bf48b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -781,6 +781,30 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
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
+	 * using the lock here introduces a restriction: we cannot wait
+	 * for any GFX HW response while the lock is taken.
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
index 9a2718c81d43..92a6f0ade615 100644
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

