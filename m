Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7334CA0FF1
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 17:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A9F10E528;
	Mon, 25 Aug 2025 17:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5aRm1fS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08E910E25A
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756144650; x=1787680650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oOoMk1HeAVFbWYxsfqCV840Y624Ak70I60yOV6t+kOY=;
 b=O5aRm1fScvWvViEENswTTt0h8R43mV0mxNAUTr8W32zJWwZpujOfykjG
 IZbNk4iDNf4AYEyqDse/duZP7EAXMD3AJ/rq5Cqmfh9BiK6JogxQXEnKD
 QlWBiW9VI30Q1Xx5ZSgbvy3txtySEIVRPAopJdXPdWF5BKAOFPA/RScB/
 8e1sladwAsAqAJxwrkXMmV8/qbyJj1S2DEk/y7/nVUrmTONLyUwTa/qty
 0N5HnPcNjhTqu5lVkIi9+3d1QdqhdgclDjlmhhn3zhERnAbVLv4+yIUT8
 17xhWibfia0dRAdu38d5QxE2gFVSHz79l8kLpfq6vCC0XWsIR6NTn9gXV A==;
X-CSE-ConnectionGUID: UPc/+5OWTxuVkBHL2J3NtA==
X-CSE-MsgGUID: X1bFVdDaQn24RXVVSbGmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="45942703"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="45942703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 10:57:28 -0700
X-CSE-ConnectionGUID: xFGJYYt/RDCkR2Xo6vwwhw==
X-CSE-MsgGUID: J5ZdombTToCHdI10wZZ7Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168606924"
Received: from dut137arlu.fm.intel.com ([10.105.23.75])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 10:57:25 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/9] drm/xe: s/tlb_invalidation/tlb_inval
Date: Mon, 25 Aug 2025 17:57:15 +0000
Message-Id: <20250825175721.89129-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825175721.89129-1-stuart.summers@intel.com>
References: <20250825175721.89129-1-stuart.summers@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

tlb_invalidation is a bit verbose leading to ugly wraps in the code,
shorten to tlb_inval.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |   4 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  10 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   1 -
 ...t_tlb_invalidation.c => xe_gt_tlb_inval.c} | 262 +++++++++---------
 drivers/gpu/drm/xe/xe_gt_tlb_inval.h          |  41 +++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c      |  18 +-
 ...dation_types.h => xe_gt_tlb_inval_types.h} |  14 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  41 ---
 drivers/gpu/drm/xe/xe_gt_types.h              |  18 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +-
 drivers/gpu/drm/xe/xe_lmtt.c                  |  12 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   4 +-
 drivers/gpu/drm/xe/xe_trace.h                 |  24 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  64 ++---
 drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
 20 files changed, 265 insertions(+), 276 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation.c => xe_gt_tlb_inval.c} (61%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval.h
 rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation_types.h => xe_gt_tlb_inval_types.h} (55%)
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..0a36b2463434 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -61,7 +61,7 @@ xe-y += xe_bb.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
 	xe_gt_throttle.o \
-	xe_gt_tlb_invalidation.o \
+	xe_gt_tlb_inval.o \
 	xe_gt_tlb_inval_job.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e67fbfe59afa..40b250cfb131 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -287,8 +287,8 @@ struct xe_device {
 		u8 has_mbx_power_limits:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
-		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
-		u8 has_range_tlb_invalidation:1;
+		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
+		u8 has_range_tlb_inval:1;
 		/** @info.has_sriov: Supports SR-IOV */
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2d10a53f701d..063c89d981e5 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -75,7 +75,7 @@ static int alloc_dep_schedulers(struct xe_device *xe, struct xe_exec_queue *q)
 		if (!gt)
 			continue;
 
-		wq = gt->tlb_invalidation.job_wq;
+		wq = gt->tlb_inval.job_wq;
 
 #define MAX_TLB_INVAL_JOBS	16	/* Picking a reasonable value */
 		dep_scheduler = xe_dep_scheduler_create(xe, wq, q->name,
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e03222f5ac5a..c3e46c270117 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -23,7 +23,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
@@ -438,7 +438,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	if (!gt)
 		return;
 
-	err = xe_gt_tlb_invalidation_ggtt(gt);
+	err = xe_gt_tlb_inval_ggtt(gt);
 	xe_gt_WARN(gt, err, "Failed to invalidate GGTT (%pe)", ERR_PTR(err));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 178c4783bbda..9a4639732bd7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -37,7 +37,7 @@
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_sysfs.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_gt_topology.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_pc.h"
@@ -413,7 +413,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	spin_lock_init(&gt->global_invl_lock);
 
-	err = xe_gt_tlb_invalidation_init_early(gt);
+	err = xe_gt_tlb_inval_init_early(gt);
 	if (err)
 		return err;
 
@@ -603,7 +603,7 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
-	xe_gt_tlb_invalidation_fini(gt);
+	xe_gt_tlb_inval_fini(gt);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -852,7 +852,7 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_uc_stop(&gt->uc);
 
-	xe_gt_tlb_invalidation_reset(gt);
+	xe_gt_tlb_inval_reset(gt);
 
 	err = do_gt_reset(gt);
 	if (err)
@@ -1066,5 +1066,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
 	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
 
 	xe_uc_declare_wedged(&gt->uc);
-	xe_gt_tlb_invalidation_reset(gt);
+	xe_gt_tlb_inval_reset(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab43dec52776..1da6a981ca4e 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -16,7 +16,6 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_stats.h"
-#include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
similarity index 61%
rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
rename to drivers/gpu/drm/xe/xe_gt_tlb_inval.c
index db00c5adead9..1571fd917830 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
@@ -5,8 +5,6 @@
 
 #include <drm/drm_managed.h>
 
-#include "xe_gt_tlb_invalidation.h"
-
 #include "abi/guc_actions_abi.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -15,6 +13,7 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_gt_stats.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -39,7 +38,7 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
 	return hw_tlb_timeout + 2 * delay;
 }
 
-static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
+static void xe_gt_tlb_inval_fence_fini(struct xe_gt_tlb_inval_fence *fence)
 {
 	if (WARN_ON_ONCE(!fence->gt))
 		return;
@@ -49,66 +48,66 @@ static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fenc
 }
 
 static void
-__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+__inval_fence_signal(struct xe_device *xe, struct xe_gt_tlb_inval_fence *fence)
 {
 	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
 
-	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
-	xe_gt_tlb_invalidation_fence_fini(fence);
+	trace_xe_gt_tlb_inval_fence_signal(xe, fence);
+	xe_gt_tlb_inval_fence_fini(fence);
 	dma_fence_signal(&fence->base);
 	if (!stack)
 		dma_fence_put(&fence->base);
 }
 
 static void
-invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+inval_fence_signal(struct xe_device *xe, struct xe_gt_tlb_inval_fence *fence)
 {
 	list_del(&fence->link);
-	__invalidation_fence_signal(xe, fence);
+	__inval_fence_signal(xe, fence);
 }
 
-void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+void xe_gt_tlb_inval_fence_signal(struct xe_gt_tlb_inval_fence *fence)
 {
 	if (WARN_ON_ONCE(!fence->gt))
 		return;
 
-	__invalidation_fence_signal(gt_to_xe(fence->gt), fence);
+	__inval_fence_signal(gt_to_xe(fence->gt), fence);
 }
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
 	struct xe_gt *gt = container_of(work, struct xe_gt,
-					tlb_invalidation.fence_tdr.work);
+					tlb_inval.fence_tdr.work);
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_gt_tlb_inval_fence *fence, *next;
 
 	LNL_FLUSH_WORK(&gt->uc.guc.ct.g2h_worker);
 
-	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
+	spin_lock_irq(&gt->tlb_inval.pending_lock);
 	list_for_each_entry_safe(fence, next,
-				 &gt->tlb_invalidation.pending_fences, link) {
+				 &gt->tlb_inval.pending_fences, link) {
 		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
-						    fence->invalidation_time);
+						    fence->inval_time);
 
 		if (msecs_to_jiffies(since_inval_ms) < tlb_timeout_jiffies(gt))
 			break;
 
-		trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
+		trace_xe_gt_tlb_inval_fence_timeout(xe, fence);
 		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
-			  fence->seqno, gt->tlb_invalidation.seqno_recv);
+			  fence->seqno, gt->tlb_inval.seqno_recv);
 
 		fence->base.error = -ETIME;
-		invalidation_fence_signal(xe, fence);
+		inval_fence_signal(xe, fence);
 	}
-	if (!list_empty(&gt->tlb_invalidation.pending_fences))
+	if (!list_empty(&gt->tlb_inval.pending_fences))
 		queue_delayed_work(system_wq,
-				   &gt->tlb_invalidation.fence_tdr,
+				   &gt->tlb_inval.fence_tdr,
 				   tlb_timeout_jiffies(gt));
-	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+	spin_unlock_irq(&gt->tlb_inval.pending_lock);
 }
 
 /**
- * xe_gt_tlb_invalidation_init_early - Initialize GT TLB invalidation state
+ * xe_gt_tlb_inval_init_early - Initialize GT TLB invalidation state
  * @gt: GT structure
  *
  * Initialize GT TLB invalidation state, purely software initialization, should
@@ -116,40 +115,40 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
+int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	gt->tlb_invalidation.seqno = 1;
-	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
-	spin_lock_init(&gt->tlb_invalidation.pending_lock);
-	spin_lock_init(&gt->tlb_invalidation.lock);
-	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
+	gt->tlb_inval.seqno = 1;
+	INIT_LIST_HEAD(&gt->tlb_inval.pending_fences);
+	spin_lock_init(&gt->tlb_inval.pending_lock);
+	spin_lock_init(&gt->tlb_inval.lock);
+	INIT_DELAYED_WORK(&gt->tlb_inval.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
-	err = drmm_mutex_init(&xe->drm, &gt->tlb_invalidation.seqno_lock);
+	err = drmm_mutex_init(&xe->drm, &gt->tlb_inval.seqno_lock);
 	if (err)
 		return err;
 
-	gt->tlb_invalidation.job_wq =
+	gt->tlb_inval.job_wq =
 		drmm_alloc_ordered_workqueue(&gt_to_xe(gt)->drm, "gt-tbl-inval-job-wq",
 					     WQ_MEM_RECLAIM);
-	if (IS_ERR(gt->tlb_invalidation.job_wq))
-		return PTR_ERR(gt->tlb_invalidation.job_wq);
+	if (IS_ERR(gt->tlb_inval.job_wq))
+		return PTR_ERR(gt->tlb_inval.job_wq);
 
 	return 0;
 }
 
 /**
- * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
+ * xe_gt_tlb_inval_reset - Initialize GT TLB invalidation reset
  * @gt: GT structure
  *
  * Signal any pending invalidation fences, should be called during a GT reset
  */
-void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
+void xe_gt_tlb_inval_reset(struct xe_gt *gt)
 {
-	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_gt_tlb_inval_fence *fence, *next;
 	int pending_seqno;
 
 	/*
@@ -165,9 +164,9 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	 * appear.
 	 */
 
-	mutex_lock(&gt->tlb_invalidation.seqno_lock);
-	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
-	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
+	mutex_lock(&gt->tlb_inval.seqno_lock);
+	spin_lock_irq(&gt->tlb_inval.pending_lock);
+	cancel_delayed_work(&gt->tlb_inval.fence_tdr);
 	/*
 	 * We might have various kworkers waiting for TLB flushes to complete
 	 * which are not tracked with an explicit TLB fence, however at this
@@ -175,34 +174,34 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	 * make sure we signal them here under the assumption that we have
 	 * completed a full GT reset.
 	 */
-	if (gt->tlb_invalidation.seqno == 1)
+	if (gt->tlb_inval.seqno == 1)
 		pending_seqno = TLB_INVALIDATION_SEQNO_MAX - 1;
 	else
-		pending_seqno = gt->tlb_invalidation.seqno - 1;
-	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, pending_seqno);
+		pending_seqno = gt->tlb_inval.seqno - 1;
+	WRITE_ONCE(gt->tlb_inval.seqno_recv, pending_seqno);
 
 	list_for_each_entry_safe(fence, next,
-				 &gt->tlb_invalidation.pending_fences, link)
-		invalidation_fence_signal(gt_to_xe(gt), fence);
-	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
+				 &gt->tlb_inval.pending_fences, link)
+		inval_fence_signal(gt_to_xe(gt), fence);
+	spin_unlock_irq(&gt->tlb_inval.pending_lock);
+	mutex_unlock(&gt->tlb_inval.seqno_lock);
 }
 
 /**
  *
- * xe_gt_tlb_invalidation_fini - Clean up GT TLB invalidation state
+ * xe_gt_tlb_inval_fini - Clean up GT TLB invalidation state
  *
  * Cancel pending fence workers and clean up any additional
  * GT TLB invalidation state.
  */
-void xe_gt_tlb_invalidation_fini(struct xe_gt *gt)
+void xe_gt_tlb_inval_fini(struct xe_gt *gt)
 {
-	xe_gt_tlb_invalidation_reset(gt);
+	xe_gt_tlb_inval_reset(gt);
 }
 
-static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
+static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
 {
-	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
+	int seqno_recv = READ_ONCE(gt->tlb_inval.seqno_recv);
 
 	if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX / 2))
 		return false;
@@ -213,9 +212,9 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 	return seqno_recv >= seqno;
 }
 
-static int send_tlb_invalidation(struct xe_guc *guc,
-				 struct xe_gt_tlb_invalidation_fence *fence,
-				 u32 *action, int len)
+static int send_tlb_inval(struct xe_guc *guc,
+			  struct xe_gt_tlb_inval_fence *fence,
+			  u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -230,44 +229,44 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	 * need to be updated.
 	 */
 
-	mutex_lock(&gt->tlb_invalidation.seqno_lock);
-	seqno = gt->tlb_invalidation.seqno;
+	mutex_lock(&gt->tlb_inval.seqno_lock);
+	seqno = gt->tlb_inval.seqno;
 	fence->seqno = seqno;
-	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
+	trace_xe_gt_tlb_inval_fence_send(xe, fence);
 	action[1] = seqno;
 	ret = xe_guc_ct_send(&guc->ct, action, len,
 			     G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret) {
-		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
+		spin_lock_irq(&gt->tlb_inval.pending_lock);
 		/*
 		 * We haven't actually published the TLB fence as per
 		 * pending_fences, but in theory our seqno could have already
 		 * been written as we acquired the pending_lock. In such a case
 		 * we can just go ahead and signal the fence here.
 		 */
-		if (tlb_invalidation_seqno_past(gt, seqno)) {
-			__invalidation_fence_signal(xe, fence);
+		if (tlb_inval_seqno_past(gt, seqno)) {
+			__inval_fence_signal(xe, fence);
 		} else {
-			fence->invalidation_time = ktime_get();
+			fence->inval_time = ktime_get();
 			list_add_tail(&fence->link,
-				      &gt->tlb_invalidation.pending_fences);
+				      &gt->tlb_inval.pending_fences);
 
-			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
+			if (list_is_singular(&gt->tlb_inval.pending_fences))
 				queue_delayed_work(system_wq,
-						   &gt->tlb_invalidation.fence_tdr,
+						   &gt->tlb_inval.fence_tdr,
 						   tlb_timeout_jiffies(gt));
 		}
-		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+		spin_unlock_irq(&gt->tlb_inval.pending_lock);
 	} else {
-		__invalidation_fence_signal(xe, fence);
+		__inval_fence_signal(xe, fence);
 	}
 	if (!ret) {
-		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
+		gt->tlb_inval.seqno = (gt->tlb_inval.seqno + 1) %
 			TLB_INVALIDATION_SEQNO_MAX;
-		if (!gt->tlb_invalidation.seqno)
-			gt->tlb_invalidation.seqno = 1;
+		if (!gt->tlb_inval.seqno)
+			gt->tlb_inval.seqno = 1;
 	}
-	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
+	mutex_unlock(&gt->tlb_inval.seqno_lock);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
 
 	return ret;
@@ -278,7 +277,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		XE_GUC_TLB_INVAL_FLUSH_CACHE)
 
 /**
- * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
+ * xe_gt_tlb_inval_guc - Issue a TLB invalidation on this GT for the GuC
  * @gt: GT structure
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion
@@ -288,18 +287,17 @@ static int send_tlb_invalidation(struct xe_guc *guc,
  *
  * Return: 0 on success, negative error code on error
  */
-static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
-				      struct xe_gt_tlb_invalidation_fence *fence)
+static int xe_gt_tlb_inval_guc(struct xe_gt *gt,
+			       struct xe_gt_tlb_inval_fence *fence)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_TLB_INVALIDATION,
-		0,  /* seqno, replaced in send_tlb_invalidation */
+		0,  /* seqno, replaced in send_tlb_inval */
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
 	};
 	int ret;
 
-	ret = send_tlb_invalidation(&gt->uc.guc, fence, action,
-				    ARRAY_SIZE(action));
+	ret = send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
 	/*
 	 * -ECANCELED indicates the CT is stopped for a GT reset. TLB caches
 	 *  should be nuked on a GT reset so this error can be ignored.
@@ -311,7 +309,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
 }
 
 /**
- * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
+ * xe_gt_tlb_inval_ggtt - Issue a TLB invalidation on this GT for the GGTT
  * @gt: GT structure
  *
  * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
@@ -319,22 +317,22 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
  *
  * Return: 0 on success, negative error code on error
  */
-int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
+int xe_gt_tlb_inval_ggtt(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	unsigned int fw_ref;
 
 	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
-		struct xe_gt_tlb_invalidation_fence fence;
+		struct xe_gt_tlb_inval_fence fence;
 		int ret;
 
-		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
-		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
+		xe_gt_tlb_inval_fence_init(gt, &fence, true);
+		ret = xe_gt_tlb_inval_guc(gt, &fence);
 		if (ret)
 			return ret;
 
-		xe_gt_tlb_invalidation_fence_wait(&fence);
+		xe_gt_tlb_inval_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		struct xe_mmio *mmio = &gt->mmio;
 
@@ -357,34 +355,34 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 	return 0;
 }
 
-static int send_tlb_invalidation_all(struct xe_gt *gt,
-				     struct xe_gt_tlb_invalidation_fence *fence)
+static int send_tlb_inval_all(struct xe_gt *gt,
+			      struct xe_gt_tlb_inval_fence *fence)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_TLB_INVALIDATION_ALL,
-		0,  /* seqno, replaced in send_tlb_invalidation */
+		0,  /* seqno, replaced in send_tlb_inval */
 		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
 	};
 
-	return send_tlb_invalidation(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
+	return send_tlb_inval(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
 }
 
 /**
  * xe_gt_tlb_invalidation_all - Invalidate all TLBs across PF and all VFs.
  * @gt: the &xe_gt structure
- * @fence: the &xe_gt_tlb_invalidation_fence to be signaled on completion
+ * @fence: the &xe_gt_tlb_inval_fence to be signaled on completion
  *
  * Send a request to invalidate all TLBs across PF and all VFs.
  *
  * Return: 0 on success, negative error code on error
  */
-int xe_gt_tlb_invalidation_all(struct xe_gt *gt, struct xe_gt_tlb_invalidation_fence *fence)
+int xe_gt_tlb_inval_all(struct xe_gt *gt, struct xe_gt_tlb_inval_fence *fence)
 {
 	int err;
 
 	xe_gt_assert(gt, gt == fence->gt);
 
-	err = send_tlb_invalidation_all(gt, fence);
+	err = send_tlb_inval_all(gt, fence);
 	if (err)
 		xe_gt_err(gt, "TLB invalidation request failed (%pe)", ERR_PTR(err));
 
@@ -399,8 +397,7 @@ int xe_gt_tlb_invalidation_all(struct xe_gt *gt, struct xe_gt_tlb_invalidation_f
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
 /**
- * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
- * address range
+ * xe_gt_tlb_inval_range - Issue a TLB invalidation on this GT for an address range
  *
  * @gt: GT structure
  * @fence: invalidation fence which will be signal on TLB invalidation
@@ -415,9 +412,8 @@ int xe_gt_tlb_invalidation_all(struct xe_gt *gt, struct xe_gt_tlb_invalidation_f
  *
  * Return: Negative error code on error, 0 on success
  */
-int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
-				 struct xe_gt_tlb_invalidation_fence *fence,
-				 u64 start, u64 end, u32 asid)
+int xe_gt_tlb_inval_range(struct xe_gt *gt, struct xe_gt_tlb_inval_fence *fence,
+			  u64 start, u64 end, u32 asid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 #define MAX_TLB_INVALIDATION_LEN	7
@@ -429,13 +425,13 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 	/* Execlists not supported */
 	if (gt_to_xe(gt)->info.force_execlist) {
-		__invalidation_fence_signal(xe, fence);
+		__inval_fence_signal(xe, fence);
 		return 0;
 	}
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
-	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
-	if (!xe->info.has_range_tlb_invalidation ||
+	action[len++] = 0; /* seqno, replaced in send_tlb_inval */
+	if (!xe->info.has_range_tlb_inval ||
 	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
@@ -484,33 +480,33 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
 
-	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
+	return send_tlb_inval(&gt->uc.guc, fence, action, len);
 }
 
 /**
- * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT for a VM
+ * xe_gt_tlb_inval_vm - Issue a TLB invalidation on this GT for a VM
  * @gt: graphics tile
  * @vm: VM to invalidate
  *
  * Invalidate entire VM's address space
  */
-void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
+void xe_gt_tlb_inval_vm(struct xe_gt *gt, struct xe_vm *vm)
 {
-	struct xe_gt_tlb_invalidation_fence fence;
+	struct xe_gt_tlb_inval_fence fence;
 	u64 range = 1ull << vm->xe->info.va_bits;
 	int ret;
 
-	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
+	xe_gt_tlb_inval_fence_init(gt, &fence, true);
 
-	ret = xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm->usm.asid);
+	ret = xe_gt_tlb_inval_range(gt, &fence, 0, range, vm->usm.asid);
 	if (ret < 0)
 		return;
 
-	xe_gt_tlb_invalidation_fence_wait(&fence);
+	xe_gt_tlb_inval_fence_wait(&fence);
 }
 
 /**
- * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
+ * xe_guc_tlb_inval_done_handler - TLB invalidation done handler
  * @guc: guc
  * @msg: message indicating TLB invalidation done
  * @len: length of message
@@ -521,11 +517,11 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
  *
  * Return: 0 on success, -EPROTO for malformed messages.
  */
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_gt_tlb_inval_fence *fence, *next;
 	unsigned long flags;
 
 	if (unlikely(len != 1))
@@ -546,74 +542,74 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * officially process the CT message like if racing against
 	 * process_g2h_msg().
 	 */
-	spin_lock_irqsave(&gt->tlb_invalidation.pending_lock, flags);
-	if (tlb_invalidation_seqno_past(gt, msg[0])) {
-		spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
+	spin_lock_irqsave(&gt->tlb_inval.pending_lock, flags);
+	if (tlb_inval_seqno_past(gt, msg[0])) {
+		spin_unlock_irqrestore(&gt->tlb_inval.pending_lock, flags);
 		return 0;
 	}
 
-	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, msg[0]);
+	WRITE_ONCE(gt->tlb_inval.seqno_recv, msg[0]);
 
 	list_for_each_entry_safe(fence, next,
-				 &gt->tlb_invalidation.pending_fences, link) {
-		trace_xe_gt_tlb_invalidation_fence_recv(xe, fence);
+				 &gt->tlb_inval.pending_fences, link) {
+		trace_xe_gt_tlb_inval_fence_recv(xe, fence);
 
-		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
+		if (!tlb_inval_seqno_past(gt, fence->seqno))
 			break;
 
-		invalidation_fence_signal(xe, fence);
+		inval_fence_signal(xe, fence);
 	}
 
-	if (!list_empty(&gt->tlb_invalidation.pending_fences))
+	if (!list_empty(&gt->tlb_inval.pending_fences))
 		mod_delayed_work(system_wq,
-				 &gt->tlb_invalidation.fence_tdr,
+				 &gt->tlb_inval.fence_tdr,
 				 tlb_timeout_jiffies(gt));
 	else
-		cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
+		cancel_delayed_work(&gt->tlb_inval.fence_tdr);
 
-	spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
+	spin_unlock_irqrestore(&gt->tlb_inval.pending_lock, flags);
 
 	return 0;
 }
 
 static const char *
-invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
+inval_fence_get_driver_name(struct dma_fence *dma_fence)
 {
 	return "xe";
 }
 
 static const char *
-invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
+inval_fence_get_timeline_name(struct dma_fence *dma_fence)
 {
-	return "invalidation_fence";
+	return "inval_fence";
 }
 
-static const struct dma_fence_ops invalidation_fence_ops = {
-	.get_driver_name = invalidation_fence_get_driver_name,
-	.get_timeline_name = invalidation_fence_get_timeline_name,
+static const struct dma_fence_ops inval_fence_ops = {
+	.get_driver_name = inval_fence_get_driver_name,
+	.get_timeline_name = inval_fence_get_timeline_name,
 };
 
 /**
- * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation fence
+ * xe_gt_tlb_inval_fence_init - Initialize TLB invalidation fence
  * @gt: GT
  * @fence: TLB invalidation fence to initialize
  * @stack: fence is stack variable
  *
- * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
+ * Initialize TLB invalidation fence for use. xe_gt_tlb_inval_fence_fini
  * will be automatically called when fence is signalled (all fences must signal),
  * even on error.
  */
-void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
-				       struct xe_gt_tlb_invalidation_fence *fence,
-				       bool stack)
+void xe_gt_tlb_inval_fence_init(struct xe_gt *gt,
+				struct xe_gt_tlb_inval_fence *fence,
+				bool stack)
 {
 	xe_pm_runtime_get_noresume(gt_to_xe(gt));
 
-	spin_lock_irq(&gt->tlb_invalidation.lock);
-	dma_fence_init(&fence->base, &invalidation_fence_ops,
-		       &gt->tlb_invalidation.lock,
+	spin_lock_irq(&gt->tlb_inval.lock);
+	dma_fence_init(&fence->base, &inval_fence_ops,
+		       &gt->tlb_inval.lock,
 		       dma_fence_context_alloc(1), 1);
-	spin_unlock_irq(&gt->tlb_invalidation.lock);
+	spin_unlock_irq(&gt->tlb_inval.lock);
 	INIT_LIST_HEAD(&fence->link);
 	if (stack)
 		set_bit(FENCE_STACK_BIT, &fence->base.flags);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval.h b/drivers/gpu/drm/xe/xe_gt_tlb_inval.h
new file mode 100644
index 000000000000..b1258ac4e8fb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_TLB_INVAL_H_
+#define _XE_GT_TLB_INVAL_H_
+
+#include <linux/types.h>
+
+#include "xe_gt_tlb_inval_types.h"
+
+struct xe_gt;
+struct xe_guc;
+struct xe_vm;
+struct xe_vma;
+
+int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
+void xe_gt_tlb_inval_fini(struct xe_gt *gt);
+
+void xe_gt_tlb_inval_reset(struct xe_gt *gt);
+int xe_gt_tlb_inval_ggtt(struct xe_gt *gt);
+void xe_gt_tlb_inval_vm(struct xe_gt *gt, struct xe_vm *vm);
+int xe_gt_tlb_inval_all(struct xe_gt *gt, struct xe_gt_tlb_inval_fence *fence);
+int xe_gt_tlb_inval_range(struct xe_gt *gt,
+			  struct xe_gt_tlb_inval_fence *fence,
+			  u64 start, u64 end, u32 asid);
+int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+void xe_gt_tlb_inval_fence_init(struct xe_gt *gt,
+				struct xe_gt_tlb_inval_fence *fence,
+				bool stack);
+void xe_gt_tlb_inval_fence_signal(struct xe_gt_tlb_inval_fence *fence);
+
+static inline void
+xe_gt_tlb_inval_fence_wait(struct xe_gt_tlb_inval_fence *fence)
+{
+	dma_fence_wait(&fence->base, false);
+}
+
+#endif	/* _XE_GT_TLB_INVAL_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
index e9255be26467..41e0ea92ea5a 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
@@ -7,7 +7,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_gt_tlb_inval_job.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
@@ -41,11 +41,11 @@ static struct dma_fence *xe_gt_tlb_inval_job_run(struct xe_dep_job *dep_job)
 {
 	struct xe_gt_tlb_inval_job *job =
 		container_of(dep_job, typeof(*job), dep);
-	struct xe_gt_tlb_invalidation_fence *ifence =
+	struct xe_gt_tlb_inval_fence *ifence =
 		container_of(job->fence, typeof(*ifence), base);
 
-	xe_gt_tlb_invalidation_range(job->gt, ifence, job->start,
-				     job->end, job->asid);
+	xe_gt_tlb_inval_range(job->gt, ifence, job->start,
+			      job->end, job->asid);
 
 	return job->fence;
 }
@@ -93,7 +93,7 @@ struct xe_gt_tlb_inval_job *xe_gt_tlb_inval_job_create(struct xe_exec_queue *q,
 		q->tlb_inval[xe_gt_tlb_inval_context(gt)].dep_scheduler;
 	struct drm_sched_entity *entity =
 		xe_dep_scheduler_entity(dep_scheduler);
-	struct xe_gt_tlb_invalidation_fence *ifence;
+	struct xe_gt_tlb_inval_fence *ifence;
 	int err;
 
 	job = kmalloc(sizeof(*job), GFP_KERNEL);
@@ -140,7 +140,7 @@ static void xe_gt_tlb_inval_job_destroy(struct kref *ref)
 {
 	struct xe_gt_tlb_inval_job *job = container_of(ref, typeof(*job),
 						       refcount);
-	struct xe_gt_tlb_invalidation_fence *ifence =
+	struct xe_gt_tlb_inval_fence *ifence =
 		container_of(job->fence, typeof(*ifence), base);
 	struct xe_device *xe = gt_to_xe(job->gt);
 	struct xe_exec_queue *q = job->q;
@@ -148,7 +148,7 @@ static void xe_gt_tlb_inval_job_destroy(struct kref *ref)
 	if (!job->fence_armed)
 		kfree(ifence);
 	else
-		/* Ref from xe_gt_tlb_invalidation_fence_init */
+		/* Ref from xe_gt_tlb_inval_fence_init */
 		dma_fence_put(job->fence);
 
 	drm_sched_job_cleanup(&job->dep.drm);
@@ -194,7 +194,7 @@ struct dma_fence *xe_gt_tlb_inval_job_push(struct xe_gt_tlb_inval_job *job,
 					   struct xe_migrate *m,
 					   struct dma_fence *fence)
 {
-	struct xe_gt_tlb_invalidation_fence *ifence =
+	struct xe_gt_tlb_inval_fence *ifence =
 		container_of(job->fence, typeof(*ifence), base);
 
 	if (!dma_fence_is_signaled(fence)) {
@@ -226,7 +226,7 @@ struct dma_fence *xe_gt_tlb_inval_job_push(struct xe_gt_tlb_inval_job *job,
 	xe_migrate_job_lock(m, job->q);
 
 	/* Creation ref pairs with put in xe_gt_tlb_inval_job_destroy */
-	xe_gt_tlb_invalidation_fence_init(job->gt, ifence, false);
+	xe_gt_tlb_inval_fence_init(job->gt, ifence, false);
 	dma_fence_get(job->fence);	/* Pairs with put in DRM scheduler */
 
 	drm_sched_job_arm(&job->dep.drm);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
similarity index 55%
rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
rename to drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
index de6e825e0851..919430359103 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_types.h
@@ -3,20 +3,20 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_GT_TLB_INVALIDATION_TYPES_H_
-#define _XE_GT_TLB_INVALIDATION_TYPES_H_
+#ifndef _XE_GT_TLB_INVAL_TYPES_H_
+#define _XE_GT_TLB_INVAL_TYPES_H_
 
 #include <linux/dma-fence.h>
 
 struct xe_gt;
 
 /**
- * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
+ * struct xe_gt_tlb_inval_fence - XE GT TLB invalidation fence
  *
- * Optionally passed to xe_gt_tlb_invalidation and will be signaled upon TLB
+ * Optionally passed to xe_gt_tlb_inval and will be signaled upon TLB
  * invalidation completion.
  */
-struct xe_gt_tlb_invalidation_fence {
+struct xe_gt_tlb_inval_fence {
 	/** @base: dma fence base */
 	struct dma_fence base;
 	/** @gt: GT which fence belong to */
@@ -25,8 +25,8 @@ struct xe_gt_tlb_invalidation_fence {
 	struct list_head link;
 	/** @seqno: seqno of TLB invalidation to signal fence one */
 	int seqno;
-	/** @invalidation_time: time of TLB invalidation */
-	ktime_t invalidation_time;
+	/** @inval_time: time of TLB invalidation */
+	ktime_t inval_time;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
deleted file mode 100644
index 3e4cff3922d6..000000000000
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _XE_GT_TLB_INVALIDATION_H_
-#define _XE_GT_TLB_INVALIDATION_H_
-
-#include <linux/types.h>
-
-#include "xe_gt_tlb_invalidation_types.h"
-
-struct xe_gt;
-struct xe_guc;
-struct xe_vm;
-struct xe_vma;
-
-int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
-void xe_gt_tlb_invalidation_fini(struct xe_gt *gt);
-
-void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
-int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
-void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
-int xe_gt_tlb_invalidation_all(struct xe_gt *gt, struct xe_gt_tlb_invalidation_fence *fence);
-int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
-				 struct xe_gt_tlb_invalidation_fence *fence,
-				 u64 start, u64 end, u32 asid);
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
-
-void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
-				       struct xe_gt_tlb_invalidation_fence *fence,
-				       bool stack);
-void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence);
-
-static inline void
-xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
-{
-	dma_fence_wait(&fence->base, false);
-}
-
-#endif	/* _XE_GT_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 4dbc40fa6639..85cfcc49472b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -185,38 +185,38 @@ struct xe_gt {
 		struct work_struct worker;
 	} reset;
 
-	/** @tlb_invalidation: TLB invalidation state */
+	/** @tlb_inval: TLB invalidation state */
 	struct {
-		/** @tlb_invalidation.seqno: TLB invalidation seqno, protected by CT lock */
+		/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
 		int seqno;
 		/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
 		struct mutex seqno_lock;
 		/**
-		 * @tlb_invalidation.seqno_recv: last received TLB invalidation seqno,
+		 * @tlb_inval.seqno_recv: last received TLB invalidation seqno,
 		 * protected by CT lock
 		 */
 		int seqno_recv;
 		/**
-		 * @tlb_invalidation.pending_fences: list of pending fences waiting TLB
+		 * @tlb_inval.pending_fences: list of pending fences waiting TLB
 		 * invaliations, protected by CT lock
 		 */
 		struct list_head pending_fences;
 		/**
-		 * @tlb_invalidation.pending_lock: protects @tlb_invalidation.pending_fences
-		 * and updating @tlb_invalidation.seqno_recv.
+		 * @tlb_inval.pending_lock: protects @tlb_inval.pending_fences
+		 * and updating @tlb_inval.seqno_recv.
 		 */
 		spinlock_t pending_lock;
 		/**
-		 * @tlb_invalidation.fence_tdr: schedules a delayed call to
+		 * @tlb_inval.fence_tdr: schedules a delayed call to
 		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
 		 */
 		struct delayed_work fence_tdr;
 		/** @wtlb_invalidation.wq: schedules GT TLB invalidation jobs */
 		struct workqueue_struct *job_wq;
-		/** @tlb_invalidation.lock: protects TLB invalidation fences */
+		/** @tlb_inval.lock: protects TLB invalidation fences */
 		spinlock_t lock;
-	} tlb_invalidation;
+	} tlb_inval;
 
 	/**
 	 * @ccs_mode: Number of compute engines enabled.
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f4e6a46ff16..9131d121d941 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -26,7 +26,7 @@
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_printk.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
 #include "xe_guc_relay.h"
@@ -1416,8 +1416,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
-		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
-							   adj_len);
+		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
 		ret = xe_guc_access_counter_notify_handler(guc, payload,
@@ -1618,8 +1617,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		__g2h_release_space(ct, len);
-		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
-							   adj_len);
+		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
 	default:
 		xe_gt_warn(gt, "NOT_POSSIBLE");
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a78c9d474a6e..e5aba03ff8ac 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -11,7 +11,7 @@
 
 #include "xe_assert.h"
 #include "xe_bo.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_lmtt.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -228,8 +228,8 @@ void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
 
 static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 {
-	struct xe_gt_tlb_invalidation_fence fences[XE_MAX_GT_PER_TILE];
-	struct xe_gt_tlb_invalidation_fence *fence = fences;
+	struct xe_gt_tlb_inval_fence fences[XE_MAX_GT_PER_TILE];
+	struct xe_gt_tlb_inval_fence *fence = fences;
 	struct xe_tile *tile = lmtt_to_tile(lmtt);
 	struct xe_gt *gt;
 	int result = 0;
@@ -237,8 +237,8 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 	u8 id;
 
 	for_each_gt_on_tile(gt, tile, id) {
-		xe_gt_tlb_invalidation_fence_init(gt, fence, true);
-		err = xe_gt_tlb_invalidation_all(gt, fence);
+		xe_gt_tlb_inval_fence_init(gt, fence, true);
+		err = xe_gt_tlb_inval_all(gt, fence);
 		result = result ?: err;
 		fence++;
 	}
@@ -252,7 +252,7 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 	 */
 	fence = fences;
 	for_each_gt_on_tile(gt, tile, id)
-		xe_gt_tlb_invalidation_fence_wait(fence++);
+		xe_gt_tlb_inval_fence_wait(fence++);
 
 	return result;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d1590d67e649..c28bbc5eb9b8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -56,7 +56,7 @@ static const struct xe_graphics_desc graphics_xelp = {
 };
 
 #define XE_HP_FEATURES \
-	.has_range_tlb_invalidation = true, \
+	.has_range_tlb_inval = true, \
 	.va_bits = 48, \
 	.vm_max_level = 3
 
@@ -104,7 +104,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
-	.has_range_tlb_invalidation = 1, \
+	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
 	.va_bits = 48, \
@@ -713,7 +713,7 @@ static int xe_info_init(struct xe_device *xe,
 	/* Runtime detection may change this later */
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 
-	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
+	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 4de6f69ed975..b63002fc0f67 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -60,7 +60,7 @@ struct xe_graphics_desc {
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_flat_ccs:1;
 	u8 has_indirect_ring_state:1;
-	u8 has_range_tlb_invalidation:1;
+	u8 has_range_tlb_inval:1;
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 };
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e35c6d4def20..d290e54134f3 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -7,7 +7,7 @@
 
 #include "xe_bo.h"
 #include "xe_gt_stats.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_migrate.h"
 #include "xe_module.h"
 #include "xe_pm.h"
@@ -225,7 +225,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_device_wmb(xe);
 
-	err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start, adj_end, tile_mask);
+	err = xe_vm_range_tilemask_tlb_inval(vm, adj_start, adj_end, tile_mask);
 	WARN_ON_ONCE(err);
 
 range_notifier_event_end:
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 21486a6f693a..36538f50d06f 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -14,7 +14,7 @@
 
 #include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler_types.h"
-#include "xe_gt_tlb_invalidation_types.h"
+#include "xe_gt_tlb_inval_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_sched_job.h"
@@ -25,13 +25,13 @@
 #define __dev_name_gt(gt)	__dev_name_xe(gt_to_xe((gt)))
 #define __dev_name_eq(q)	__dev_name_gt((q)->gt)
 
-DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
-		    TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+DECLARE_EVENT_CLASS(xe_gt_tlb_inval_fence,
+		    TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_inval_fence *fence),
 		    TP_ARGS(xe, fence),
 
 		    TP_STRUCT__entry(
 			     __string(dev, __dev_name_xe(xe))
-			     __field(struct xe_gt_tlb_invalidation_fence *, fence)
+			     __field(struct xe_gt_tlb_inval_fence *, fence)
 			     __field(int, seqno)
 			     ),
 
@@ -45,23 +45,23 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			      __get_str(dev), __entry->fence, __entry->seqno)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_tlb_inval_fence, xe_gt_tlb_inval_fence_send,
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_inval_fence *fence),
 	     TP_ARGS(xe, fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_recv,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_tlb_inval_fence, xe_gt_tlb_inval_fence_recv,
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_inval_fence *fence),
 	     TP_ARGS(xe, fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_signal,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_tlb_inval_fence, xe_gt_tlb_inval_fence_signal,
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_inval_fence *fence),
 	     TP_ARGS(xe, fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_timeout,
-	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_tlb_inval_fence, xe_gt_tlb_inval_fence_timeout,
+	     TP_PROTO(struct xe_device *xe, struct xe_gt_tlb_inval_fence *fence),
 	     TP_ARGS(xe, fence)
 );
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f35d69c0b4c6..fd42aa1b7fa0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -28,7 +28,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt_pagefault.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -1892,7 +1892,7 @@ static void xe_vm_close(struct xe_vm *vm)
 					xe_pt_clear(xe, vm->pt_root[id]);
 
 			for_each_gt(gt, xe, id)
-				xe_gt_tlb_invalidation_vm(gt, vm);
+				xe_gt_tlb_inval_vm(gt, vm);
 		}
 	}
 
@@ -3875,7 +3875,7 @@ void xe_vm_unlock(struct xe_vm *vm)
 }
 
 /**
- * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
+ * xe_vm_range_tilemask_tlb_inval - Issue a TLB invalidation on this tilemask for an
  * address range
  * @vm: The VM
  * @start: start address
@@ -3886,10 +3886,11 @@ void xe_vm_unlock(struct xe_vm *vm)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
-					  u64 end, u8 tile_mask)
+int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
+				   u64 end, u8 tile_mask)
 {
-	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	struct xe_gt_tlb_inval_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
 	struct xe_tile *tile;
 	u32 fence_id = 0;
 	u8 id;
@@ -3899,39 +3900,34 @@ int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
 		return 0;
 
 	for_each_tile(tile, vm->xe, id) {
-		if (tile_mask & BIT(id)) {
-			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[fence_id], true);
-
-			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
-							   &fence[fence_id],
-							   start,
-							   end,
-							   vm->usm.asid);
-			if (err)
-				goto wait;
-			++fence_id;
+		if (!(tile_mask & BIT(id)))
+			continue;
 
-			if (!tile->media_gt)
-				continue;
+		xe_gt_tlb_inval_fence_init(tile->primary_gt,
+					   &fence[fence_id], true);
 
-			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id], true);
+		err = xe_gt_tlb_inval_range(tile->primary_gt, &fence[fence_id],
+					    start, end, vm->usm.asid);
+		if (err)
+			goto wait;
+		++fence_id;
 
-			err = xe_gt_tlb_invalidation_range(tile->media_gt,
-							   &fence[fence_id],
-							   start,
-							   end,
-							   vm->usm.asid);
-			if (err)
-				goto wait;
-			++fence_id;
-		}
+		if (!tile->media_gt)
+			continue;
+
+		xe_gt_tlb_inval_fence_init(tile->media_gt,
+					   &fence[fence_id], true);
+
+		err = xe_gt_tlb_inval_range(tile->media_gt, &fence[fence_id],
+					    start, end, vm->usm.asid);
+		if (err)
+			goto wait;
+		++fence_id;
 	}
 
 wait:
 	for (id = 0; id < fence_id; ++id)
-		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+		xe_gt_tlb_inval_fence_wait(&fence[id]);
 
 	return err;
 }
@@ -3990,8 +3986,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	xe_device_wmb(xe);
 
-	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
-						    xe_vma_end(vma), tile_mask);
+	ret = xe_vm_range_tilemask_tlb_inval(xe_vma_vm(vma), xe_vma_start(vma),
+					     xe_vma_end(vma), tile_mask);
 
 	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 2f213737c7e5..93a4ac79b86e 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -228,8 +228,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 				     struct xe_svm_range *range);
 
-int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
-					  u64 end, u8 tile_mask);
+int xe_vm_range_tilemask_tlb_inval(struct xe_vm *vm, u64 start,
+				   u64 end, u8 tile_mask);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
-- 
2.34.1

