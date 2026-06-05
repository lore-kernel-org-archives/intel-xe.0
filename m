Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5F2CD8C81
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16771112AF0;
	Fri,  5 Jun 2026 12:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8MwRiDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8337A112AF0
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780663161; x=1812199161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVGskQjQwQXRwskni5Bh9e/SpyrcRTtIhsyO41f6ORM=;
 b=i8MwRiDzd+u6LVF/kMnQtTtE/YHsGl5TReuIfomM7UL7emKDB3wQAqEx
 fSGe1SE2DAyZtSDpOlykxUPJFkxKdcR+pULn0zMy3JEYOi4fKT4fqRPDK
 AyxnXJZpOX9CJD2OoAebX9kpXvDQpjR4OrWFCwAOUkaN2yoAElcEYpDMN
 uc1bcGO+Jb1OnHsg0kxLvKfQSPI/2OXdyqCM8hsqOC0wwVQxAQyWPiSNk
 ct30FZs8wTDntWR0gqFvw/Ncg9O1jrV2rsGzN/DdR7Dn57eidOeewrQBz
 +1+erLk25OT++wnrRmKx1eIPsw6NB8dkdq72GIPRxOnSCY7a4j5oHP2mJ Q==;
X-CSE-ConnectionGUID: KR5kNmyVTSaU39mT8FtZUg==
X-CSE-MsgGUID: OSxWUzhWSPqrfl9bO2qtfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="106937364"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="106937364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:21 -0700
X-CSE-ConnectionGUID: ooRcPq0zTGapeuKD3GpKQQ==
X-CSE-MsgGUID: npBbDTtlSZKfx+GwU8uAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249938964"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PATCH V11 11/12] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
Date: Fri,  5 Jun 2026 18:08:49 +0530
Message-ID: <20260605123839.236021-25-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605123839.236021-14-tejas.upadhyay@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
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

Assisted-by: Copilot:claude-opus-4.6
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
cc: Mrozek, Michal <michal.mrozek@intel.com>
cc: José Roberto de Souza <jose.souza@intel.com>
cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++++--
 drivers/gpu/drm/xe/xe_execlist.c         |  4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 24 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     |  7 +++++++
 include/uapi/drm/xe_drm.h                | 12 +++++++++++-
 5 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..77a621da4487 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -143,6 +143,9 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
+	/** @ban_reason: Bitmask of ban reasons (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
+	u32 ban_reason;
+
 	union {
 		/** @multi_gt_list: list head for VM bind engines if multi-GT */
 		struct list_head multi_gt_list;
@@ -316,8 +319,8 @@ struct xe_exec_queue_ops {
 	 * signalled when this function is called.
 	 */
 	void (*resume)(struct xe_exec_queue *q);
-	/** @reset_status: check exec queue reset status */
-	bool (*reset_status)(struct xe_exec_queue *q);
+	/** @reset_status: check exec queue ban status, returns ban reason bitmask */
+	u64 (*reset_status)(struct xe_exec_queue *q);
 	/** @active: check exec queue is active */
 	bool (*active)(struct xe_exec_queue *q);
 };
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 9fb99c038ea8..35e6e05ba418 100644
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
 
 static bool execlist_exec_queue_active(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4b247a3019d2..ff28eab7cee2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -6,6 +6,7 @@
 #include "xe_guc_submit.h"
 
 #include <linux/bitfield.h>
+#include <uapi/drm/xe_drm.h>
 #include <linux/bitmap.h>
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
@@ -1530,6 +1531,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
+	q->ban_reason |= DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
@@ -2211,13 +2213,25 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 	xe_sched_msg_unlock(sched);
 }
 
-static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
+static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	if (xe_exec_queue_is_multi_queue_secondary(q) &&
-	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
-		return true;
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		u64 status = guc_exec_queue_reset_status(
+				xe_exec_queue_multi_queue_primary(q));
+		if (status)
+			return status;
+	}
+
+	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
+		u64 reason = q->ban_reason;
 
-	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
+		/* If no specific reason was recorded, default to GPU hang */
+		if (!reason)
+			reason = DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
+		return reason;
+	}
+
+	return 0;
 }
 
 static bool guc_exec_queue_active(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 35b5eaf590fa..3765e8fcdcec 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -7,6 +7,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_buddy.h>
+#include <uapi/drm/xe_drm.h>
 
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
@@ -537,10 +538,15 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 	xe_bo_unlock(bo);
 	/*  Ban VM if BO is PPGTT */
 	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
+		struct xe_exec_queue *eq;
+
 		down_write(&vm->lock);
+		list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
+			eq->ban_reason |= DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
 		xe_vm_kill(vm, true);
 		up_write(&vm->lock);
 	}
+
 	if (vm)
 		xe_vm_put(vm);
 
@@ -548,6 +554,7 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
 	/*  Ban exec queue if BO is lrc */
 	if (bo->q && xe_exec_queue_get_unless_zero(bo->q)) {
 		/* ban queue */
+		bo->q->ban_reason |= DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE;
 		xe_exec_queue_kill(bo->q);
 		xe_exec_queue_put(bo->q);
 	}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..904d58b039fe 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
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

