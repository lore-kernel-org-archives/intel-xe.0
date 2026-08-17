Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D7DC5CFC1
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 06:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B6910E65F;
	Mon, 17 Aug 2026 06:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m512TZbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1510E660
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786949489; x=1818485489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KzsFpD9FfxOBJqelBMbq60djEYOfZQihnQi6Kn2B4qQ=;
 b=m512TZbljpqb8rulOlMUybd8hi27W/ub+b5Qxjq8juCbVmCidqfhK5Vy
 xeFu1XS/5g9mKc2rvOhoYCcCRqRkbpAhetDyv/rT2mE9gnOfhqNi5jUyi
 avqX0iW5GTluOryUkox5GgBN9UEokFgPFMxDpf4aXKH5YfkTguGmBDHGX
 VMXnXvFrbMKoo7AmiZTj2RKD2FT6Rv4PWlO1ECUU+zjNC6uUWNhfRIVnX
 hnFrOvYowTk0PnGiwDWJ9I4b3eqpri8TXCTGq8w/v/tHuUwMtbBV3Dy6I
 mvlGeEa81QGDiILmxjl41rIxppb81q7TfnIUnQ1+3NlBFkGOLoWQllceY Q==;
X-CSE-ConnectionGUID: 4nNSq4ZbSTOpGk7ykD9xMg==
X-CSE-MsgGUID: ztZUnsalSSm5RT2fCL+dvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91289572"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="91289572"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:29 -0700
X-CSE-ConnectionGUID: dL6TYDxeSKuBnfPyhj62ew==
X-CSE-MsgGUID: I/2dGMBTSCOrxs1QHSkZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="264383854"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 23:51:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH V16 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Date: Mon, 17 Aug 2026 12:21:06 +0530
Message-ID: <20260817065055.3734576-25-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
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
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++--
 drivers/gpu/drm/xe/xe_execlist.c         |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     |  8 ++++++
 include/uapi/drm/xe_drm.h                | 18 ++++++++++++-
 5 files changed, 59 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index b2276559c2f6..a21916359e2f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -156,6 +156,9 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
+	/** @ban_reason: Bitmask of ban reasons (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
+	atomic_t ban_reason;
+
 	union {
 		/** @multi_gt_list: list head for VM bind engines if multi-GT */
 		struct list_head multi_gt_list;
@@ -350,8 +353,8 @@ struct xe_exec_queue_ops {
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
index cc33ae80e8cf..534e7c4e0099 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -452,10 +452,10 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
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
index 9036f89dff7d..f52577de1ac2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -6,6 +6,7 @@
 #include "xe_guc_submit.h"
 
 #include <linux/bitfield.h>
+#include <uapi/drm/xe_drm.h>
 #include <linux/bitmap.h>
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
@@ -1593,6 +1594,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
+	/*
+	 * Only tag as GPU hang if this is the original timeout, not a
+	 * consequence of a prior kill (e.g., page-offline).
+	 */
+	if (!exec_queue_killed(q))
+		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
@@ -1676,6 +1683,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
 			if (!xe_sched_invalidate_job(job, 2)) {
 				clear_exec_queue_banned(q);
+				/* protect concurrent page offline reasons */
+				atomic_andnot(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG,
+					      &q->ban_reason);
 				xe_gt_reset_async(q->gt);
 				goto rearm;
 			}
@@ -2570,13 +2580,25 @@ static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
 	}
 }
 
-static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
+static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	if (xe_exec_queue_is_multi_queue_secondary(q) &&
-	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
-		return true;
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
index 73cd06c22d37..2731bbc50864 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -7,6 +7,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_buddy.h>
+#include <uapi/drm/xe_drm.h>
 
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
@@ -542,7 +543,12 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 	xe_bo_unlock(bo);
 	/*  Ban VM if BO is PPGTT */
 	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
+		struct xe_exec_queue *eq;
+
 		down_write(&vm->lock);
+		list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
+			atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &eq->ban_reason);
+		smp_wmb(); /* Force all queue bits to be visible before killing the VM */
 		xe_vm_kill(vm, true);
 		up_write(&vm->lock);
 	}
@@ -554,6 +560,8 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 	/*  Ban exec queue if BO is lrc */
 	if (q && xe_exec_queue_get_unless_zero(q)) {
 		/* ban queue */
+		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &q->ban_reason);
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

