Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ECDC3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 22:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E7210E5FD;
	Tue, 13 May 2025 22:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4hhlDbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2250110E600
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176608; x=1778712608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wejwUTVNydy0CCUlI64Zo+NjnOHkj0natvieiFQ+lG8=;
 b=h4hhlDbfyw6NZamfC66THsWHaX9o7usILVFpawUcV93O+fMAeWZPh8xE
 vzXrQgV9cBtSTvS9zUMA63fTikTJdy3LFVYsRNnIfyeddN1GIFowYhxwu
 tWz6G4jz+wySIK2t/G1tdgY/UGK2efdPUd13ThJSl7flvZIEkbM5en6jm
 uJtqaXjrpYPKgIg0jkHOzWSRXp/k5yoGShJ4MeRw8pQ5rlYq/CsdxDSRE
 vaXGS89YAlCEtshlBmdLL/h5TCFs+vLnx9eRkuUb3KkTR0OXLTGn4r9B3
 3WlCbMwlVyTcK+YdOWkXs0CFoU918YpCxnfDR65vKSGN76fYcyS2YDobM A==;
X-CSE-ConnectionGUID: EbceMvjHTZObgLmMtaaI3A==
X-CSE-MsgGUID: y93P+Z+nT9+WSjNDffq4cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860529"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:50:08 -0700
X-CSE-ConnectionGUID: BDIzeqJTQ3+AhuSJbGTJMQ==
X-CSE-MsgGUID: T5rGYk9zTsymOWsPglFueg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142789451"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 15:50:07 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 7/7] drm/xe/vf: Post migration,
 repopulate ring area for pending request
Date: Wed, 14 May 2025 00:49:52 +0200
Message-Id: <20250513224952.701343-8-tomasz.lis@intel.com>
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

The commands within ring area allocated for a request may contain
references to GGTT. These references require update after VF
migration, in order to continue any preempted LRCs, or jobs which
were emitted to the ring but not sent to GuC yet.

This change calls the emit function again for all such jobs,
as part of post-migration recovery.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 23 +++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c485272829a6..238b6691d575 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -766,6 +766,26 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	return fence;
 }
 
+/**
+ * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
+ * @eq: the &xe_exec_queue struct instance
+ */
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq)
+{
+	struct xe_gpu_scheduler *sched = &eq->guc->sched;
+	struct xe_sched_job *job;
+
+	if (exec_queue_killed_or_banned_or_wedged(eq))
+		return;
+
+	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
+		if (xe_sched_job_is_error(job))
+			continue;
+
+		eq->ring_ops->emit_job(job);
+	}
+}
+
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 2c2d2936440d..55398e292b79 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -33,6 +33,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
+void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq);
+
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
 void
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index c08c44dbd383..2ff1383f0b1a 100644
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
@@ -266,6 +268,26 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
 	}
 }
 
+static void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
+{
+	struct xe_exec_queue *eq;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, eq)
+		xe_exec_queue_jobs_ring_restore(eq);
+	mutex_unlock(&guc->submission_state.lock);
+}
+
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
@@ -348,6 +370,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	if (need_fixups) {
 		vf_post_migration_fixup_contexts(xe);
+		vf_post_migration_fixup_jobs(xe);
 		vf_post_migration_fixup_ctb(xe);
 	}
 
-- 
2.25.1

