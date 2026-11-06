Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D7606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=myxngjsV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003B9113008;
	Fri,  6 Nov 2026 22:17:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB462113008
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 22:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794003444; x=1825539444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4v3fMfc3NUeHIPK1HHh4iSQ5p7t+syjtgL+c1a09Tg=;
 b=myxngjsVmbWOkbuV8/mwO65+3O9VeTrWKOgbuCXronKZQIPPL0Ensmbw
 Erqm28b866vyUUCO4a9eWnI9rSmXFZQ/84v+WdGuypas/hXrVq5/dHguX
 zwrzMhAQG3RI4N5K8ydXWJ7dJVnwGH0NYyTBsd4s+Z0c2phMCzW80ScyA
 nvzUrameQlKxTRrPVI1uzgcdDONM+YW1zouW6lg76UWEbsSZbtsjWnmAl
 EgG3tx7npAPTGOgmzQg9dyQE1o7UtZPRAf9OoqnVYvxDERV3vuM9IxCxx
 FLm7TDGCPc9oy+U6y7DNwRx/sg1gGWvxZHXR527yzqlF6UxkLkmdhPCFt w==;
X-CSE-ConnectionGUID: DBT2amf3SrmG3ON3jiNIQQ==
X-CSE-MsgGUID: iUrD2w6dQbK7ytzeHabhUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2724261"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2724261"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 14:17:13 -0800
X-CSE-ConnectionGUID: CIJYzberRDC1iH4l9K+1rw==
X-CSE-MsgGUID: LDPIaSESTtmF73cAVzbn/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7407619"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by orviesa002.jf.intel.com with ESMTP; 06 Nov 2026 14:17:14 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2 3/3] drm/xe/wedge: request inspection for additional fault
 paths
Date: Fri,  6 Nov 2026 14:13:23 -0800
Message-ID: <20261106221323.1207676-4-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106221323.1207676-1-daniel.charles@intel.com>
References: <20261106221323.1207676-1-daniel.charles@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Request mode-3 inspection for unsuccessful pagefault service, GuC memory
CAT errors, and TLB invalidation fence timeouts. Keep the resume-failure
fallback with the TLB timeout trigger so a failed inspection resume
restores normal timeout handling and completes expired fences with -ETIME.
Preserve the existing TLB timeout diagnostics outside inspection.

Defer timeout processing for a pending pause only while the inspection
request remains pending and resume has not failed. If inspection exits
before taking over the pause, clear stale pause flags and resume normal
timeout handling rather than rearming indefinitely. Preserve indefinite
deferral once inspection has taken over.

For MMIO-enabled RAS reset requests, request or join inspection and wait
before preparing PCI reset or disabling the device. Reuse the framework's
one-shot GT-stop state to decline this device's reset request after SKIP
or CONTINUE. Fall back to normal recovery if inspection aborts before
stopping GTs, except during teardown. Release mode_mutex before waiting
so teardown can abort inspection.

Keep the existing separation between synchronous inspection-only GT
stopping and asynchronous ordinary GT wedging, including the PCI reset
path's worker flushes. Leave frozen-channel recovery and other wedge
modes unchanged.

Inspection can stall shared PCI recovery indefinitely and cannot prevent
resets forced by the PCI core or requested by other devices. The timeout
cleanup does not make CONTINUE safe after an intervening reset or prevent
reset/resume during inspection. Reference the SKIP and CONTINUE reply
constants in the debugfs documentation.

Assisted-by: LLM
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c         |  5 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c      |  6 +++-
 drivers/gpu/drm/xe/xe_pagefault.c       |  3 ++
 drivers/gpu/drm/xe/xe_pci_error.c       | 11 +++++++
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 38 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
 drivers/gpu/drm/xe/xe_wedge.c           | 35 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wedge.h           |  1 +
 8 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index f5b761e89b3a2..fa341aa001e68 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -747,8 +747,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	 * autosuspend by writing "on" to the PCI device's power/control sysfs
 	 * attribute. Keep it disabled after SKIP and avoid system suspend and
 	 * hibernation: releasing inspection does not restore normal operation.
-	 * Skip is not recovery: GTs remain stopped. Inspection has no automatic
-	 * timeout. Continue completes permanent wedging, not normal execution.
+	 * XE_WEDGE_REPLY_SKIP (SKIP) is not recovery: GTs remain stopped.
+	 * Inspection has no automatic timeout. XE_WEDGE_REPLY_CONTINUE
+	 * (CONTINUE) completes permanent wedging, not normal execution.
 	 * TLB preservation does not freeze mapping changes or gate new
 	 * invalidations. New requests may be canceled and signaled while older
 	 * fences remain preserved. GGTT invalidations may still program MMIO
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 30adaf9900cb7..b4799709c34fb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3580,12 +3580,15 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 		 * context. In such case only PF will be notified about that fault.
 		 */
 		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
+		xe_wedge_declare_mode3(gt_to_xe(gt));
 		return 0;
 	}
 
 	q = g2h_exec_queue_lookup(guc, guc_id);
-	if (unlikely(!q))
+	if (unlikely(!q)) {
+		xe_wedge_declare_mode3(gt_to_xe(gt));
 		return -EPROTO;
+	}
 
 	/*
 	 * The type is HW-defined and changes based on platform, so we don't
@@ -3602,6 +3605,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
 	trace_xe_exec_queue_memory_cat_error(q);
+	xe_wedge_declare_mode3(gt_to_xe(gt));
 
 	/* Treat the same as engine reset */
 	xe_guc_exec_queue_reset_trigger_cleanup(q);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 5247321c805ec..8f96252cd0188 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -21,6 +21,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_wedge.h"
 
 /**
  * DOC: Xe page faults
@@ -705,10 +706,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 				xe_pagefault_cache_start_invalidate(cache_start);
 				xe_pagefault_print(pf);
 				xe_log_err_info(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
+				xe_wedge_declare_mode3(xe);
 			} else {
 				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
 				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
 					  ERR_PTR(err));
+				xe_wedge_declare_mode3(xe);
 			}
 		} else {
 			/* Cache valid fault locally */
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 9bf0da3a3d152..b04c20a7ba28e 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -93,6 +93,17 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
+	/*
+	 * Wait before reset preparation changes device state or disables PCI.
+	 * Neither inspection reply recovers the GTs, so decline our reset request.
+	 * Frozen-channel recovery bypasses this callback and may force a reset.
+	 */
+	if (action == XE_RAS_RECOVERY_ACTION_RESET &&
+	    xe_wedge_mode3_wait(xe)) {
+		xe_info(xe, "PCI recovery stopped after mode-3 inspection or teardown; not requesting reset\n");
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
 	return ras_action_to_pci_result(pdev, action);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 293929f92eb0f..0d7fdce82956e 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -17,6 +17,7 @@
 #include "xe_printk.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace.h"
+#include "xe_wedge.h"
 
 /**
  * DOC: Xe TLB invalidation
@@ -84,15 +85,29 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 	int timedout_seqno = 0, seqno_recv = 0;
 
 	spin_lock_irq(&tlb_inval->pending_lock);
-	if (tlb_inval->debug_paused)
-		goto out_unlock;
+	if (tlb_inval->debug_paused) {
+		if (!tlb_inval->debug_pause_pending)
+			goto out_unlock;
+		if (!READ_ONCE(xe->wedged.pause_failed) &&
+		    atomic_read(&xe->wedged.declare_pending))
+			goto out_rearm;
+		tlb_inval->debug_paused = false;
+		tlb_inval->debug_pause_pending = false;
+	}
 	spin_unlock_irq(&tlb_inval->pending_lock);
 
 	tlb_inval->ops->flush(tlb_inval);
 
 	spin_lock_irq(&tlb_inval->pending_lock);
-	if (tlb_inval->debug_paused)
-		goto out_unlock;
+	if (tlb_inval->debug_paused) {
+		if (!tlb_inval->debug_pause_pending)
+			goto out_unlock;
+		if (!READ_ONCE(xe->wedged.pause_failed) &&
+		    atomic_read(&xe->wedged.declare_pending))
+			goto out_rearm;
+		tlb_inval->debug_paused = false;
+		tlb_inval->debug_pause_pending = false;
+	}
 
 	list_for_each_entry_safe(fence, next,
 				 &tlb_inval->pending_fences, link) {
@@ -106,6 +121,17 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 		drm_err(&xe->drm,
 			"TLB invalidation fence timeout, seqno=%d recv=%d",
 			fence->seqno, tlb_inval->seqno_recv);
+		if (!READ_ONCE(xe->wedged.pause_failed))
+			xe_wedge_declare_mode3(xe);
+		if (!READ_ONCE(xe->wedged.pause_failed) &&
+		    READ_ONCE(xe->wedged.mode) ==
+		    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE &&
+		    atomic_read(&xe->wedged.declare_pending)) {
+			tlb_inval->debug_paused = true;
+			tlb_inval->debug_pause_pending = true;
+			/* Keep timeout processing until inspection owns the pause. */
+			goto out_rearm;
+		}
 
 		if (!timedout_seqno) {
 			/*
@@ -128,6 +154,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 		fence->base.error = -ETIME;
 		xe_tlb_inval_fence_signal(fence);
 	}
+out_rearm:
 	if (!list_empty(&tlb_inval->pending_fences))
 		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
 				   timeout_delay);
@@ -194,6 +221,7 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	INIT_LIST_HEAD(&tlb_inval->pending_fences);
 	spin_lock_init(&tlb_inval->pending_lock);
 	tlb_inval->debug_paused = false;
+	tlb_inval->debug_pause_pending = false;
 	spin_lock_init(&tlb_inval->lock);
 	INIT_DELAYED_WORK(&tlb_inval->fence_tdr, xe_tlb_inval_fence_timeout);
 
@@ -233,6 +261,7 @@ void xe_tlb_inval_debug_pause(struct xe_tlb_inval *tlb_inval)
 
 	spin_lock_irq(&tlb_inval->pending_lock);
 	tlb_inval->debug_paused = true;
+	tlb_inval->debug_pause_pending = false;
 	cancel_delayed_work(&tlb_inval->fence_tdr);
 	spin_unlock_irq(&tlb_inval->pending_lock);
 }
@@ -264,6 +293,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 	mutex_lock(&tlb_inval->seqno_lock);
 	spin_lock_irq(&tlb_inval->pending_lock);
 	tlb_inval->debug_paused = false;
+	tlb_inval->debug_pause_pending = false;
 	cancel_delayed_work(&tlb_inval->fence_tdr);
 	/*
 	 * We might have various kworkers waiting for TLB flushes to complete
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 7ccd66c2eea7a..8e8cb115c9af8 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -114,6 +114,8 @@ struct xe_tlb_inval {
 	spinlock_t pending_lock;
 	/** @debug_paused: Preserve mode-3 pending state under pending_lock. */
 	bool debug_paused;
+	/** @debug_pause_pending: Worker has not taken over; under pending_lock. */
+	bool debug_pause_pending;
 	/**
 	 * @timedout_seqno: seqno of the most recent timed out TLB
 	 * invalidation, 0 if none. Used to measure how late the ack for a
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index 09ca1708fe5a5..1112944af3df3 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -189,7 +189,7 @@ static void wedge_pause_work(struct work_struct *work)
 	if (!pm_ref) {
 		xe_warn(xe, "Mode-3 wedge could not retain active runtime PM; resuming for inspection, hardware state may have changed\n");
 		if (!xe_pm_runtime_resume_and_get(xe)) {
-			xe_err(xe, "Failed to resume device for mode-3 inspection; aborting pause\n");
+			xe_err(xe, "Failed to resume device for mode-3 inspection; restoring TLB timeout handling\n");
 			spin_lock_irqsave(&xe->wedged.mode_lock, flags);
 			WRITE_ONCE(xe->wedged.pause_failed, true);
 			atomic_set(&xe->wedged.declare_pending, 0);
@@ -301,6 +301,39 @@ void xe_wedge_declare_mode3(struct xe_device *xe)
 	wedge_request(xe, DRM_WEDGE_RECOVERY_NONE, true);
 }
 
+/**
+ * xe_wedge_mode3_wait() - Inspect a recoverable PCI error before reset
+ * @xe: Device with accessible MMIO, kept alive by the caller
+ *
+ * Request or join mode-3 inspection and wait for its worker to finish.
+ * Do not hold mode_mutex while waiting; teardown needs it to abort inspection.
+ * Waiting has no timeout and can stall recovery and removal of devices in the
+ * same PCI hierarchy. Other devices can request reset after this callback
+ * returns; frozen-channel recovery can force reset regardless of our vote.
+ *
+ * Return: true if reset must be declined because inspection stopped the GTs,
+ * the device is wedged, or teardown started. Otherwise, normal recovery may
+ * proceed.
+ */
+bool xe_wedge_mode3_wait(struct xe_device *xe)
+{
+	mutex_lock(&xe->wedged.mode_mutex);
+	if (READ_ONCE(xe->wedged.mode) !=
+	    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE) {
+		mutex_unlock(&xe->wedged.mode_mutex);
+		return false;
+	}
+
+	if (!READ_ONCE(xe->wedged.pause_stopped) && !xe_wedged(xe))
+		xe_wedge_declare_mode3(xe);
+	mutex_unlock(&xe->wedged.mode_mutex);
+
+	flush_work(&xe->wedged.pause_work);
+
+	return READ_ONCE(xe->wedged.pause_stopped) ||
+		READ_ONCE(xe->wedged.shutting_down) || xe_wedged(xe);
+}
+
 /**
  * xe_wedge_prepare_fini() - Release and join mode-3 inspection before teardown
  * @xe: Xe device
diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
index 3fef49d448f54..c74cb0ec42c89 100644
--- a/drivers/gpu/drm/xe/xe_wedge.h
+++ b/drivers/gpu/drm/xe/xe_wedge.h
@@ -19,6 +19,7 @@ static inline bool xe_wedged(struct xe_device *xe)
 
 void xe_wedge_declare(struct xe_device *xe, unsigned long method);
 void xe_wedge_declare_mode3(struct xe_device *xe);
+bool xe_wedge_mode3_wait(struct xe_device *xe);
 void xe_wedge_prepare_fini(struct xe_device *xe);
 int xe_wedge_set_reply(struct xe_device *xe, u32 reply);
 int xe_wedge_init(struct xe_device *xe);
-- 
2.43.0

