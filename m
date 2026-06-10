Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD28FCD98D4
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC29E10EC0B;
	Wed, 10 Jun 2026 21:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exywZJEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C0910EBFF
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126920; x=1812662920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sihxJi6tiW397JLqbKlbPmB5OTcAlsP8ZBNgoPzhChA=;
 b=exywZJEz59mN0PkOi9yaWnaA/c/wi9C9P/kVenCABVPE8TQMoEfuU3qU
 5ZwQj4x1ZTWsWdsIhU2P1Yu0F2xTY6J1Wy1/M4VYlFi/KrLNwcBxktbkR
 n2UhI1UJ0Tq2yLOXkGxCvSnTJ+AqZZsXy4dXSEEkJR+1qMjqajLo9rrQY
 DJAurNwe6vbbPR5dRFR17ueTiTjEI2JpXBnDkSGCmZy00povhrz/AyPKn
 B7xU788+R4BCJexsZZeeRNLFQcbDCg8AqfZOW/sy/9gcHLbgf58Y+uLhU
 lVRyXxrtmyrGHHAPl9xOzwHUYGSz50SY3U0Q4i5MNO/4bkf00fkqtCR83 A==;
X-CSE-ConnectionGUID: IMxYXR2lQqakwKHi/NiPkA==
X-CSE-MsgGUID: jnkhe5GjTpGwmLOTPIiMGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934686"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934686"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:39 -0700
X-CSE-ConnectionGUID: sGsmBS1fQPyVMqQmkSFpuA==
X-CSE-MsgGUID: 4N0tCuu7RmmO6wTVyhrB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292068"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 07/11] drm/xe: Add per-exec-queue user fence wait queue
Date: Wed, 10 Jun 2026 21:28:39 +0000
Message-ID: <20260610212833.153366-20-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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

Add a new ufence_wq wait queue to struct xe_exec_queue and initialize it
at queue allocation time. Also introduce xe_wait_user_fence_wake() to
centralize the ufence wake call sites.

This patch just adds the infrastructure in place to do this and doesn't
actually start using it. The reason being that we need to be careful
when handling a case where a user does a VM bind without a bind queue
and mistakenly passes a non-bind queue to the wait user fence. There
are a couple of IGT cases at least that are doing this today and to
avoid regressing any user code around this, we'll add some additional
handling in a subsequent patch before connecting this to the actual
wait user fence code.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  6 ++----
 drivers/gpu/drm/xe/xe_hw_engine.c        |  6 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.h        |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c              |  2 +-
 drivers/gpu/drm/xe/xe_memirq.c           |  2 +-
 drivers/gpu/drm/xe/xe_sync.c             |  3 ++-
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 16 +++++++++++++++-
 drivers/gpu/drm/xe/xe_wait_user_fence.h  |  4 ++++
 10 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6c101b4f6488..aa49400b67ba 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -260,6 +260,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
+	init_waitqueue_head(&q->ufence_wq);
 	spin_lock_init(&q->multi_queue.lock);
 	spin_lock_init(&q->lrc_lookup_lock);
 	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index d27ce24daae5..fdc7baaa952e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -231,6 +231,9 @@ struct xe_exec_queue {
 		struct list_head link;
 	} pxp;
 
+	/** @ufence_wq: per-queue user fence wait queue */
+	wait_queue_head_t ufence_wq;
+
 	/** @ufence_syncobj: User fence syncobj */
 	struct drm_syncobj *ufence_syncobj;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b29cc08e6291..16d609e7b40f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -21,6 +21,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
+#include "xe_wait_user_fence.h"
 #include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
 #include "xe_gt_clock.h"
@@ -555,11 +556,8 @@ static bool vf_recovery(struct xe_guc *guc)
 
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 {
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
-
 	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
-	wake_up_all(&xe->ufence_wq);
+	xe_wait_user_fence_wake(gt_to_xe(q->gt), q);
 
 	xe_sched_tdr_queue_imm(&q->guc->sched);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 98265293f2dc..05780bd5beba 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -42,6 +42,7 @@
 #include "xe_tuning.h"
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
+#include "xe_wait_user_fence.h"
 
 #define MAX_MMIO_BASES 3
 struct engine_info {
@@ -894,9 +895,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
 	return 0;
 }
 
-void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
+void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec,
+			     struct xe_exec_queue *q)
 {
-	wake_up_all(&gt_to_xe(hwe->gt)->ufence_wq);
+	xe_wait_user_fence_wake(gt_to_xe(hwe->gt), q);
 
 	if (hwe->irq_handler)
 		hwe->irq_handler(hwe, intr_vec);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index c3ee37f8cfc0..7501c9051a71 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -51,7 +51,8 @@ struct xe_exec_queue;
 
 int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
-void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
+void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec,
+			     struct xe_exec_queue *q);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 40d3d43e492f..fc99d021405f 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -385,7 +385,7 @@ static void gt_irq_handler(struct xe_tile *tile,
 
 			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
 			if (hwe) {
-				xe_hw_engine_handle_irq(hwe, intr_vec);
+				xe_hw_engine_handle_irq(hwe, intr_vec, NULL);
 				continue;
 			}
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 96ab2c59c5d7..318ef7c72eba 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -493,7 +493,7 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 	 * is opportunistic, unconditionally pass MI_USER_INTERRUPT to issue
 	 * that check.
 	 */
-	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
+	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT, NULL);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 37866768d64c..652341f22460 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -18,6 +18,7 @@
 #include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
+#include "xe_wait_user_fence.h"
 
 struct xe_user_fence {
 	struct xe_device *xe;
@@ -92,7 +93,7 @@ static void user_fence_worker(struct work_struct *w)
 	 * Wake up waiters only after updating the ufence state, allowing the UMD
 	 * to safely reuse the same ufence without encountering -EBUSY errors.
 	 */
-	wake_up_all(&ufence->xe->ufence_wq);
+	xe_wait_user_fence_wake(ufence->xe, NULL);
 	user_fence_put(ufence);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 12ceb3efa8ea..7c9d52b50580 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -54,6 +54,20 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 #define VALID_FLAGS	DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
 #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
 
+/**
+ * xe_wait_user_fence_wake() - Wake user fence waiters
+ * @xe: the xe device
+ * @q: exec queue (reserved; per-queue wake-up is enabled in a later patch)
+ *
+ * Wakes all user fence waiters on the device-level wait queue.
+ * Per-exec-queue and ufence_list broadcast support are introduced in
+ * subsequent patches once the full infrastructure is in place.
+ */
+void xe_wait_user_fence_wake(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	wake_up_all(&xe->ufence_wq);
+}
+
 static long to_jiffies_timeout(struct xe_device *xe,
 			       struct drm_xe_wait_user_fence *args)
 {
@@ -110,7 +124,7 @@ static long to_jiffies_timeout(struct xe_device *xe,
  *
  * If an exec queue ID is provided, the wait is aborted early if the
  * queue enters a reset state. The device-level wait queue is used for
- * wakeups.
+ * wakeups in all cases.
  *
  * On return, @timeout is updated to reflect the remaining time (or zero
  * on expiry), unless %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME is set.
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.h b/drivers/gpu/drm/xe/xe_wait_user_fence.h
index 0e268978f9e6..64e5000eabb4 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.h
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.h
@@ -8,6 +8,10 @@
 
 struct drm_device;
 struct drm_file;
+struct xe_device;
+struct xe_exec_queue;
+
+void xe_wait_user_fence_wake(struct xe_device *xe, struct xe_exec_queue *q);
 
 int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
-- 
2.43.0

