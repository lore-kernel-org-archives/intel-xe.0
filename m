Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022F606A32C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HyRX8cPz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA370113014;
	Fri,  6 Nov 2026 22:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07B210E48A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794003439; x=1825539439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lbn390TriBLt87vsJmaUdpTvEgvZJ2DmCE9C7Sh06TI=;
 b=HyRX8cPzgugSx+fYVYapEF6IwKII46PoL/bGVklD66ENInvMhPsKhj8w
 UYDI98uEoxdOAURY6rea2Y1BWHf0dUNNBS7KjvcAPHcy5PBVXgFFnv2Oj
 NNssfcTDhbA0yeR1XiIJHoMPo59BS/3EQIjmKHKgRCLFpi2vFJRQMTOnV
 tB5fj4YmPtc3xhV7kr2IAMU1+pixe8qMUaXtzVF4aay3KGM2KrRDnZCEx
 YnLU1cRD6myyG2ELlAG4cryawUP9SQwtZ8XrSuFBXorTgABwL2E9ryEfx
 ZV5BjyULbebQ+PKovZGy9EY/ctXUlRZuhfo3kOcc+Fs9DqXK6Fc01uq5X w==;
X-CSE-ConnectionGUID: +03qmkfdS8KDDgRKXoNC/A==
X-CSE-MsgGUID: Q4wTvw4JQGa6CpplVTNIpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2724259"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2724259"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 14:17:13 -0800
X-CSE-ConnectionGUID: K471gaLrTNm4SI0VyoVgfA==
X-CSE-MsgGUID: alep+bgXTKmFAqwfTqXLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7407616"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by orviesa002.jf.intel.com with ESMTP; 06 Nov 2026 14:17:14 -0800
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v2 2/3] drm/xe/wedge: preserve pending TLB invalidations
 during inspection
Date: Fri,  6 Nov 2026 14:13:22 -0800
Message-ID: <20261106221323.1207676-3-daniel.charles@intel.com>
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

Pause TLB invalidation timeout and completion processing when the mode-3
inspection worker stops a GT. Keep pending invalidation fences unsignaled
during inspection rather than resetting them as part of the GT stop.

CONTINUE resets the preserved invalidations as part of completing permanent
wedging; SKIP leaves them paused with the GTs stopped. Ordinary GT wedging
retains its existing TLB reset behavior.

Preservation does not freeze subsequent mapping management or change the
existing cancellation and GGTT MMIO fallback behavior for new requests.
Inspection is best-effort, not an atomic snapshot.

Document that preserved fences can block process exit, unbind or unload,
and that a power cycle may be necessary. Inspection has no automatic
timeout, and SKIP does not restore normal operation.

Assisted-by: LLM
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c         |  7 ++++++
 drivers/gpu/drm/xe/xe_gt.c              |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 33 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
 drivers/gpu/drm/xe/xe_wedge.c           |  5 ++++
 drivers/gpu/drm/xe/xe_wedge_types.h     |  7 +++++-
 7 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 2b0b2135e0184..f5b761e89b3a2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -749,6 +749,13 @@ void xe_debugfs_register(struct xe_device *xe)
 	 * hibernation: releasing inspection does not restore normal operation.
 	 * Skip is not recovery: GTs remain stopped. Inspection has no automatic
 	 * timeout. Continue completes permanent wedging, not normal execution.
+	 * TLB preservation does not freeze mapping changes or gate new
+	 * invalidations. New requests may be canceled and signaled while older
+	 * fences remain preserved. GGTT invalidations may still program MMIO
+	 * with CT disabled; signaling on cancellation does not imply hardware
+	 * completion. Inspection is best-effort, not an atomic snapshot.
+	 * Preserved TLB fences may block process exit, unbind or unload; a power
+	 * cycle may be necessary. Automatic recovery is not guaranteed.
 	 */
 	debugfs_create_file("wedged_pause_resume", 0200, root, xe,
 			    &wedged_pause_resume_fops);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a84fa80e9fa9b..8be2053e6cb01 100644
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
index c9cc5842d65b6..293929f92eb0f 100644
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
index 665072b4b81dc..65bb2f6e530b5 100644
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
index 80d2019fa20b4..7ccd66c2eea7a 100644
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
index 8bfe0e2775d29..09ca1708fe5a5 100644
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
@@ -208,6 +212,7 @@ static void wedge_pause_work(struct work_struct *work)
 
 	xe_err(xe, "GT submission stopped for mode-3 hardware debugging.\n"
 	       "New DRM ioctls are blocked while waiting for 'wedged_pause_resume'.\n"
+	       "Pending TLB invalidations are preserved until continue or another reset.\n"
 	       "Skip: 0x%08x; continue into permanent wedge: 0x%08x.\n"
 	       "Skip does not restart GTs or recover the fault.\n",
 	       XE_WEDGE_REPLY_SKIP, XE_WEDGE_REPLY_CONTINUE);
diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
index 4fe03efffbdab..34d6d1b471271 100644
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

