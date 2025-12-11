Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2919BD3E786
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D265D10E6D0;
	Thu, 11 Dec 2025 01:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezFVSPYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8B010E6CC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414978; x=1796950978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pUUXBJ7lip8XeVzEMJMpfchUn+idKI9pF+N3+900AYo=;
 b=ezFVSPYWjLoGgN9nEPHGk+X5sm4VGc08j0cqDUG3J9PqqctljqaDZCSb
 HJWSbRx7uyK3v8FPEFS4V6XK6V9G2V9crkVQWZU8+aGrmudpzMHdOfHJO
 g3sBzSrpJGFNCjV9UMul4zc75ooBxDUnnlMYOugxhdopqkKmPOFiEcw4E
 GwCLqVf3QZxDcRe/vqed5jqpF2+HBftFDhbP0X7JQjulnXlKB5v+1JxYK
 DK/CxO4VHE0qoClVxxxUO2DFf2J9kcAv1xI+ugIXl3mJegLog2ceWUqux
 k9zBvQ3smBOkmvdGOOk0B2Z165bOIveU4w5GNgOvMgKQgvsgK9dAUWQI+ Q==;
X-CSE-ConnectionGUID: CCFqc6/WQM+1Lf850HXScw==
X-CSE-MsgGUID: tsw6DEnbRn2j6mxQNAopMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442869"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
X-CSE-ConnectionGUID: vnWM/qMfSU6tTSkbjBMmJA==
X-CSE-MsgGUID: 9XP2nmJVTVKrHDRMCk/Agw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664116"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 09/17] drm/xe/multi_queue: Handle tearing down of a multi
 queue
Date: Wed, 10 Dec 2025 17:02:57 -0800
Message-ID: <20251211010249.1647839-28-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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

As all queues of a multi queue group use the primary queue of the group
to interface with GuC. Hence there is a dependency between the queues of
the group. So, when primary queue of a multi queue group is cleaned up,
also trigger a cleanup of the secondary queues also. During cleanup, stop
and re-start submission for all queues of a multi queue group to avoid
any submission happening in parallel when a queue is being cleaned up.

v2: Initialize group->list_lock, add fs_reclaim dependency, remove
    unwanted secondary queues cleanup (Matt Brost)
v3: Properly handle cleanup of multi-queue group (Matt Brost)
v4: Fix IS_ENABLED(CONFIG_LOCKDEP) check (Matt Brost)
    Revert stopping/restarting of submissions on queues of the
    group in TDR as it is not needed.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 86 ++++++++++++++++++------
 3 files changed, 82 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 256e2ce1fe69..d337b7bc2b80 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -87,6 +87,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
 		xe_lrc_put(lrc);
 
 	xa_destroy(&group->xa);
+	mutex_destroy(&group->list_lock);
 	xe_bo_unpin_map_no_vm(group->cgp_bo);
 	kfree(group);
 }
@@ -648,9 +649,18 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 
 	group->primary = q;
 	group->cgp_bo = bo;
+	INIT_LIST_HEAD(&group->list);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
+	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
 
+	/* group->list_lock is used in submission backend */
+	if (IS_ENABLED(CONFIG_LOCKDEP)) {
+		fs_reclaim_acquire(GFP_KERNEL);
+		might_lock(&group->list_lock);
+		fs_reclaim_release(GFP_KERNEL);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1c285ac12868..8a954ee62505 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -58,6 +58,10 @@ struct xe_exec_queue_group {
 	struct xe_bo *cgp_bo;
 	/** @xa: xarray to store LRCs */
 	struct xarray xa;
+	/** @list: List of all secondary queues in the group */
+	struct list_head list;
+	/** @list_lock: Secondary queue list lock */
+	struct mutex list_lock;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
 };
@@ -145,6 +149,8 @@ struct xe_exec_queue {
 	struct {
 		/** @multi_queue.group: Queue group information */
 		struct xe_exec_queue_group *group;
+		/** @multi_queue.link: Link into group's secondary queues list */
+		struct list_head link;
 		/** @multi_queue.priority: Queue priority within the multi-queue group */
 		enum xe_multi_queue_priority priority;
 		/** @multi_queue.pos: Position of queue within the multi-queue group */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d52b7b9bcedf..d38f5aab0a99 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -577,6 +577,45 @@ static bool vf_recovery(struct xe_guc *guc)
 	return xe_gt_recovery_pending(guc_to_gt(guc));
 }
 
+static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
+	wake_up_all(&xe->ufence_wq);
+
+	if (xe_exec_queue_is_lr(q))
+		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
+	else
+		xe_sched_tdr_queue_imm(&q->guc->sched);
+}
+
+static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
+{
+	if (xe_exec_queue_is_multi_queue(q)) {
+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+		struct xe_exec_queue *eq;
+
+		set_exec_queue_reset(primary);
+		if (!exec_queue_banned(primary) && !exec_queue_check_timeout(primary))
+			xe_guc_exec_queue_trigger_cleanup(primary);
+
+		mutex_lock(&group->list_lock);
+		list_for_each_entry(eq, &group->list, multi_queue.link) {
+			set_exec_queue_reset(eq);
+			if (!exec_queue_banned(eq) && !exec_queue_check_timeout(eq))
+				xe_guc_exec_queue_trigger_cleanup(eq);
+		}
+		mutex_unlock(&group->list_lock);
+	} else {
+		set_exec_queue_reset(q);
+		if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
+			xe_guc_exec_queue_trigger_cleanup(q);
+	}
+}
+
 #define parallel_read(xe_, map_, field_) \
 	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_)
@@ -1121,20 +1160,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
 }
 
-static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
-{
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
-
-	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
-	wake_up_all(&xe->ufence_wq);
-
-	if (xe_exec_queue_is_lr(q))
-		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
-	else
-		xe_sched_tdr_queue_imm(&q->guc->sched);
-}
-
 /**
  * xe_guc_submit_wedge() - Wedge GuC submission
  * @guc: the GuC object
@@ -1627,6 +1652,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 	guard(xe_pm_runtime)(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		mutex_lock(&group->list_lock);
+		list_del(&q->multi_queue.link);
+		mutex_unlock(&group->list_lock);
+	}
+
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
 	/* Confirm no work left behind accessing device structures */
@@ -1917,6 +1950,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	xe_exec_queue_assign_name(q, q->guc->id);
 
+	/*
+	 * Maintain secondary queues of the multi queue group in a list
+	 * for handling dependencies across the queues in the group.
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		INIT_LIST_HEAD(&q->multi_queue.link);
+		mutex_lock(&group->list_lock);
+		list_add_tail(&q->multi_queue.link, &group->list);
+		mutex_unlock(&group->list_lock);
+	}
+
 	trace_xe_exec_queue_create(q);
 
 	return 0;
@@ -2144,6 +2190,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
+	if (xe_exec_queue_is_multi_queue_secondary(q) &&
+	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
+		return true;
+
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
@@ -2853,9 +2903,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * jobs by setting timeout of the job to the minimum value kicking
 	 * guc_exec_queue_timedout_job.
 	 */
-	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
-		xe_guc_exec_queue_trigger_cleanup(q);
+	xe_guc_exec_queue_reset_trigger_cleanup(q);
 
 	return 0;
 }
@@ -2934,9 +2982,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	trace_xe_exec_queue_memory_cat_error(q);
 
 	/* Treat the same as engine reset */
-	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
-		xe_guc_exec_queue_trigger_cleanup(q);
+	xe_guc_exec_queue_reset_trigger_cleanup(q);
 
 	return 0;
 }
-- 
2.43.0

