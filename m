Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06619606A32C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GKIKFMWK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE40910E68B;
	Mon,  2 Nov 2026 21:06:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F0C10E68B
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793653602; x=1825189602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QbonTmNCK3ac/XE2JJvfPXsR82RTgvgAUXpHunWjGkU=;
 b=GKIKFMWK7MrunWPCcI/I8fPirZcLIfZ0s6QekwNzjpMCKwet/D5g7zr7
 GG+bFHUdIv9gCShmkhhMJUdNzaJuTW9O6khdYlX6tdTRnJaZLfFOajj9X
 GI0WYSF+7dLN+D/F+YIe4ep1IvDRqs9tFjGFK0kop2/DZ+NxeCRshPaCy
 9X8GutUH7/+aUBLUNW2Bc3V/ekTZGMugTd+6EThyUi3KL8mOE7Z/h7iHI
 0uQ2g7/RwNPayESjXRLoaZliDjsIR5ixemZf+K1+giIe/NazRxwlrxKG3
 a8/650/sfAIVMSf/S5OEkOt9jisZ3RcmO0p43QFEna5uYZChppJ8ZXLrS w==;
X-CSE-ConnectionGUID: mZf5n0ZiQbuWLpqSpy9FBQ==
X-CSE-MsgGUID: YzCoc/doRDSu34se2j1/IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2390414"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2390414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:06:36 -0800
X-CSE-ConnectionGUID: ahPvRiv9SeSdnKT+HTkSnQ==
X-CSE-MsgGUID: 8gT23PDjTPO6k9rnZ7QtHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6249854"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa004.fm.intel.com with ESMTP; 02 Nov 2026 13:06:36 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alan.previn.teres.alexis@intel.com,
 Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH 2/3] drm/xe/wedge: preserve pending TLB invalidations during
 inspection
Date: Mon,  2 Nov 2026 13:02:41 -0800
Message-ID: <20261102210242.635207-3-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102210242.635207-1-daniel.charles@intel.com>
References: <20261102210242.635207-1-daniel.charles@intel.com>
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

Pause TLB invalidation timeout and completion processing when the mode-3
inspection worker stops a GT. Keep pending invalidation fences unsignaled
during inspection rather than resetting them as part of the GT stop.

CONTINUE resets the preserved invalidations before permanent wedging;
SKIP leaves them paused with the GTs stopped. Ordinary GT wedging retains
its existing TLB reset behavior.

Document that preserved fences can block process exit, unbind or unload,
and that a power cycle may be necessary. Inspection has no automatic
timeout, and SKIP does not restore normal operation.

Assisted-by: LLM
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c         |  2 ++
 drivers/gpu/drm/xe/xe_gt.c              |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 33 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
 drivers/gpu/drm/xe/xe_wedge.c           |  5 ++++
 drivers/gpu/drm/xe/xe_wedge_types.h     |  7 +++++-
 7 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 162423c50e63..911df712f7b0 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -745,6 +745,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	/*
 	 * Skip is not recovery: GTs remain stopped. Inspection has no automatic
 	 * timeout. Continue completes permanent wedging, not normal execution.
+	 * Preserved TLB fences may block process exit, unbind or unload; a power
+	 * cycle may be necessary. Automatic recovery is not guaranteed.
 	 */
 	debugfs_create_file("wedged_pause_resume", 0200, root, xe,
 			    &wedged_pause_resume_fops);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a84fa80e9fa9..8be2053e6cb0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1212,7 +1212,7 @@ void xe_gt_wedge_pause(struct xe_gt *gt)
 {
 	xe_gt_assert(gt, READ_ONCE(gt_to_xe(gt)->wedged.mode) ==
 		     XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE);
+	xe_tlb_inval_debug_pause(&gt->tlb_inval);
 	xe_uc_reset_prepare(&gt->uc);
 	xe_uc_wedge_declare(&gt->uc);
-	xe_tlb_inval_reset(&gt->tlb_inval);
 }
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index c9cc5842d65b..293929f92eb0 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -83,9 +83,17 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 	long timeout_delay = tlb_inval->ops->timeout_delay(tlb_inval);
 	int timedout_seqno = 0, seqno_recv = 0;
 
+	spin_lock_irq(&tlb_inval->pending_lock);
+	if (tlb_inval->debug_paused)
+		goto out_unlock;
+	spin_unlock_irq(&tlb_inval->pending_lock);
+
 	tlb_inval->ops->flush(tlb_inval);
 
 	spin_lock_irq(&tlb_inval->pending_lock);
+	if (tlb_inval->debug_paused)
+		goto out_unlock;
+
 	list_for_each_entry_safe(fence, next,
 				 &tlb_inval->pending_fences, link) {
 		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
@@ -124,6 +132,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
 				   timeout_delay);
 	seqno_recv = tlb_inval->seqno_recv;
+out_unlock:
 	spin_unlock_irq(&tlb_inval->pending_lock);
 
 	/*
@@ -184,6 +193,7 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	tlb_inval->seqno = 1;
 	INIT_LIST_HEAD(&tlb_inval->pending_fences);
 	spin_lock_init(&tlb_inval->pending_lock);
+	tlb_inval->debug_paused = false;
 	spin_lock_init(&tlb_inval->lock);
 	INIT_DELAYED_WORK(&tlb_inval->fence_tdr, xe_tlb_inval_fence_timeout);
 
@@ -209,6 +219,24 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	return drmm_add_action_or_reset(&xe->drm, tlb_inval_fini, tlb_inval);
 }
 
+/**
+ * xe_tlb_inval_debug_pause() - Preserve pending invalidations for inspection
+ * @tlb_inval: TLB invalidation client
+ *
+ * A reset ends this pause even while inspection waits for a reply.
+ * Holding a runtime PM reference does not prevent system suspend.
+ */
+void xe_tlb_inval_debug_pause(struct xe_tlb_inval *tlb_inval)
+{
+	if (!tlb_inval->ops->initialized(tlb_inval))
+		return;
+
+	spin_lock_irq(&tlb_inval->pending_lock);
+	tlb_inval->debug_paused = true;
+	cancel_delayed_work(&tlb_inval->fence_tdr);
+	spin_unlock_irq(&tlb_inval->pending_lock);
+}
+
 /**
  * xe_tlb_inval_reset() - TLB invalidation reset
  * @tlb_inval: TLB invalidation client
@@ -235,6 +263,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 
 	mutex_lock(&tlb_inval->seqno_lock);
 	spin_lock_irq(&tlb_inval->pending_lock);
+	tlb_inval->debug_paused = false;
 	cancel_delayed_work(&tlb_inval->fence_tdr);
 	/*
 	 * We might have various kworkers waiting for TLB flushes to complete
@@ -464,6 +493,10 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 	 * process_g2h_msg().
 	 */
 	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
+	if (tlb_inval->debug_paused) {
+		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
+		return;
+	}
 	if (seqno == TLB_INVALIDATION_SEQNO_INVALID) {
 		xe_tlb_inval_reset_timeout(tlb_inval);
 		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
index 665072b4b81d..65bb2f6e530b 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
@@ -17,6 +17,7 @@ struct xe_vm;
 int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
 
 void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
+void xe_tlb_inval_debug_pause(struct xe_tlb_inval *tlb_inval);
 int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
 		     struct xe_tlb_inval_fence *fence);
 int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 80d2019fa20b..7ccd66c2eea7 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -112,6 +112,8 @@ struct xe_tlb_inval {
 	 * @pending_lock: protects @pending_fences and updating @seqno_recv.
 	 */
 	spinlock_t pending_lock;
+	/** @debug_paused: Preserve mode-3 pending state under pending_lock. */
+	bool debug_paused;
 	/**
 	 * @timedout_seqno: seqno of the most recent timed out TLB
 	 * invalidation, 0 if none. Used to measure how late the ack for a
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
index c22c3544adca..f7b2ec9d6886 100644
--- a/drivers/gpu/drm/xe/xe_wedge.c
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -17,6 +17,7 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_sriov.h"
+#include "xe_tlb_inval.h"
 #include "xe_wedge.h"
 
 /**
@@ -115,6 +116,9 @@ static void wedge_declare_now(struct xe_device *xe, unsigned long method,
 	if (!gts_already_wedged) {
 		for_each_initialized_gt(gt, xe, id)
 			xe_gt_wedge_declare(gt);
+	} else {
+		for_each_initialized_gt(gt, xe, id)
+			xe_tlb_inval_reset(&gt->tlb_inval);
 	}
 
 	/*
@@ -203,6 +207,7 @@ static void wedge_pause_work(struct work_struct *work)
 
 	xe_err(xe, "GT submission stopped for mode-3 hardware debugging.\n"
 	       "New DRM ioctls are blocked while waiting for 'wedged_pause_resume'.\n"
+	       "Pending TLB invalidations are preserved until continue or another reset.\n"
 	       "Skip: 0x%08x; continue into permanent wedge: 0x%08x.\n"
 	       "Skip does not restart GTs or recover the fault.\n",
 	       XE_WEDGE_REPLY_SKIP, XE_WEDGE_REPLY_CONTINUE);
diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
index 855036e3f197..d64a4db49e4c 100644
--- a/drivers/gpu/drm/xe/xe_wedge_types.h
+++ b/drivers/gpu/drm/xe/xe_wedge_types.h
@@ -31,7 +31,12 @@ enum xe_wedged_mode {
 	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET_WAIT_FOR_RELEASE = 3,
 };
 
-/* Skip releases inspection without recovering the fault or restarting GTs. */
+/*
+ * Skip releases inspection without recovering the fault or restarting GTs.
+ * Pending TLB invalidations remain paused; fence waiters may block indefinitely.
+ * Later resets are possible, but automatic recovery is not guaranteed.
+ * Continue resets deferred invalidations and completes permanent wedging.
+ */
 #define XE_WEDGE_REPLY_CONTINUE 0xdeadbbbb
 #define XE_WEDGE_REPLY_SKIP 0xdeadf001
 
-- 
2.43.0

