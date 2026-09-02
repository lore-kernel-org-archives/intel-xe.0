Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F31C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635BB10F265;
	Wed,  2 Sep 2026 14:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gc/BQnpP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424BD10F265
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360916; x=1819896916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=za/S1cKuakJ4owIKpXhzbrfqguaR2okUaEYsfL2Q5x4=;
 b=gc/BQnpPGI0I0ZjXGHqqZ7W1CEQjcrpSGhSq4p5yi+OwnTl1XP9OH2dk
 8oV9K03EFJpTuZsldhpgdmT/HeC1WCQbJjDZV/NNaCWUCuiyiLBfePQya
 bJkLP4mIspiiQxEmiik96swH4Nc3aGV5yy5WjoAKaR9w/UkjzGz1aw4SM
 DSYqnaRXhgOvEp+5TVI9Jgc5LusJD/+FG3ANrZp+nVLKsiLe8vm33zdwZ
 33YJRB1TY8Q7qcxNo6zkbpGdOuefyv3D+QPC8pdgi45nLh4PxtXcIJ2qg
 mujbbbTUG8Vbxe1c4cynsP7vQu8BjYcgJ5zLkBk/6U+4BatidkQYBsi2S w==;
X-CSE-ConnectionGUID: cMYD7dEYSAK0+OXMBHIr7w==
X-CSE-MsgGUID: VNVb6MbcSEa3+bCmH9qOiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92526054"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92526054"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:15 -0700
X-CSE-ConnectionGUID: kwuuKd04SSi5B1Ju6vQu8Q==
X-CSE-MsgGUID: SI37QqnsTNq0GLYejhpZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263260162"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:55:13 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH V20 14/15] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Date: Wed,  2 Sep 2026 20:23:57 +0530
Message-ID: <20260902145343.465686-31-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask indicating
the reason for the ban, rather than a simple boolean. This allows
userspace to distinguish between different ban causes:

- DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec queue was banned
  due to a GPU hang or job timeout detected by the TDR.
- DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec queue was
  banned because a VRAM page backing its resources was taken offline.

The ban_reason field is added to struct xe_exec_queue and set at the
point where the ban is triggered:
- In guc_exec_queue_timedout_job() for GPU hang.
- In xe_ttm_vram_purge_page() for memory page offline, before calling
  xe_exec_queue_kill() or xe_vm_kill().

The reset_status op is updated to return u64 with the reason bitmask.
When a queue is banned but no explicit reason was recorded (e.g., from a
generic CAT error), it defaults to GPU_HANG for backward compatibility.
A value of 0 means the exec queue is not banned.

v5 (Sashiko/MattB):
- Take the write lock for the traversal to tag ban_reason
v4(Sashiko):
- Add ban reason for non-LR exec queues
- Add TODO for multiqueue
v3(Rodrigo):
- Add doc in xe_drm.h
v2(Sashiko):
- Use atomic_t for ban_reason to fix concurrent updates from TDR and
  page-offline
- Guard GPU_HANG bit with !exec_queue_killed to avoid masking
  page-offline reason
- Clear ban_reason on queue recovery (clear_exec_queue_banned path)
- Use atomic_read in guc_exec_queue_reset_status for lockless read

Assisted-by: Copilot:claude-opus-4.6
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++--
 drivers/gpu/drm/xe/xe_execlist.c         |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 36 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     | 27 ++++++++++++++++++
 include/uapi/drm/xe_drm.h                | 18 +++++++++++-
 5 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 95f75d61a647..836f88fc0faa 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -154,6 +154,9 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
+	/** @ban_reason: Bitmask of ban reasons (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
+	atomic_t ban_reason;
+
 	union {
 		/** @multi_gt_list: list head for VM bind engines if multi-GT */
 		struct list_head multi_gt_list;
@@ -348,8 +351,8 @@ struct xe_exec_queue_ops {
 	 * signalled when this function is called.
 	 */
 	void (*resume)(struct xe_exec_queue *q);
-	/** @reset_status: check exec queue reset status */
-	bool (*reset_status)(struct xe_exec_queue *q);
+	/** @reset_status: check exec queue ban status, returns ban reason bitmask */
+	u64 (*reset_status)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 0d0db66c6ea2..a36db39dcda8 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -453,10 +453,10 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
 	/* NIY */
 }
 
-static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
+static u64 execlist_exec_queue_reset_status(struct xe_exec_queue *q)
 {
 	/* NIY */
-	return false;
+	return 0;
 }
 
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..0a6e2b81b5a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -6,6 +6,7 @@
 #include "xe_guc_submit.h"
 
 #include <linux/bitfield.h>
+#include <uapi/drm/xe_drm.h>
 #include <linux/bitmap.h>
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
@@ -1599,6 +1600,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	else
 		wedged = xe_device_wedged(xe);
 
+	/*
+	 * Only tag as GPU hang if this is the original timeout, not a
+	 * consequence of a prior kill (e.g., page-offline).
+	 */
+	if (!exec_queue_killed(q))
+		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
@@ -1682,6 +1689,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
 			if (!xe_sched_invalidate_job(job, 2)) {
 				clear_exec_queue_banned(q);
+				/* protect concurrent page offline reasons */
+				atomic_andnot(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG,
+					      &q->ban_reason);
 				xe_gt_reset_async(q->gt);
 				goto rearm;
 			}
@@ -2580,13 +2590,29 @@ static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
 	}
 }
 
-static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
+static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	if (xe_exec_queue_is_multi_queue_secondary(q) &&
-	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
-		return true;
+	/* TODO: In case of multiqueue, if a secondary queue is banned due to
+	 * page offlining, checking only the primary queue's GuC reset status
+	 * may mask the true reason or race with it.
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		u64 status = guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q));
 
-	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
+		if (status)
+			return status;
+	}
+
+	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
+		u64 reason = atomic_read_acquire(&q->ban_reason);
+
+		/* If no specific reason was recorded, default to GPU hang */
+		if (!reason)
+			reason = DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
+		return reason;
+	}
+
+	return 0;
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index d9da2454d968..3c17f906a549 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_buddy.h>
+#include <uapi/drm/xe_drm.h>
 
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
@@ -623,6 +624,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
 
 static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 {
+	u32 q_flag = DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
 	struct ttm_operation_ctx ctx = {};
 	struct xe_exec_queue *q_to_put = NULL;
 	struct xe_exec_queue *q = NULL;
@@ -637,7 +639,30 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 	xe_bo_unlock(bo);
 	/*  Ban VM if BO is PPGTT */
 	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
+		struct xe_exec_queue *eq;
+		int id;
+
 		down_write(&vm->lock);
+		if (xe->info.has_ctx_tlb_inval) {
+			/*
+			 * Must be the write lock: send_tlb_inval_ctx_ppgtt()
+			 * mutates this list (list_move_tail() onto an on-stack
+			 * head) while holding only the read lock, relying on
+			 * tlb_inval->seqno_lock to keep itself the sole
+			 * mutator. Traversing it under down_read() would let
+			 * this walk follow entries onto that stack list.
+			 */
+			down_write(&vm->exec_queues.lock);
+			for (id = 0; id < ARRAY_SIZE(vm->exec_queues.list); id++)
+				list_for_each_entry(eq, &vm->exec_queues.list[id],
+						    vm_exec_queue_link)
+					atomic_or(q_flag, &eq->ban_reason);
+			up_write(&vm->exec_queues.lock);
+		} else {
+			list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
+				atomic_or(q_flag, &eq->ban_reason);
+		}
+		smp_wmb(); /* Force all queue bits to be visible before killing the VM */
 		xe_vm_kill(vm, true);
 		up_write(&vm->lock);
 	}
@@ -649,6 +674,8 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 	/*  Ban exec queue if BO is lrc */
 	if (q && xe_exec_queue_get_unless_zero(q)) {
 		/* ban queue */
+		atomic_or(q_flag, &q->ban_reason);
+		smp_wmb(); /* Force bit change to finish before state change triggers */
 		q_to_put = q;
 	}
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 509202a7b13e..ee4a921b2e6e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1491,6 +1491,12 @@ struct drm_xe_exec_queue_destroy {
  *
  * The @property can be:
  *  - %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN
+ *
+ * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, @value is a bitmask of ban reasons:
+ *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned due to GPU hang/timeout
+ *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned due to memory page offline
+ *
+ * A @value of 0 means the exec queue is not banned.
  */
 struct drm_xe_exec_queue_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1503,7 +1509,17 @@ struct drm_xe_exec_queue_get_property {
 	/** @property: property to get */
 	__u32 property;
 
-	/** @value: property value */
+	/**
+	 * @value: property value
+	 *
+	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a bitmask of:
+	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned due to GPU hang/timeout
+	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned due to memory page offline
+	 *
+	 * Value of 0 means the exec queue is not banned.
+	 */
+#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG		(1 << 0)
+#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 << 1)
 	__u64 value;
 
 	/** @reserved: Reserved */
-- 
2.52.0

