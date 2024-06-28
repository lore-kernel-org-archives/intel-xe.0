Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E899BC41513
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 09:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D2010E0FE;
	Fri, 28 Jun 2024 09:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPJg6EFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723AC10E0FA
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719566027; x=1751102027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w38NMxeolMTdoqaZ9dcPRYmQx/MvnbnOzNGQdX9e52c=;
 b=GPJg6EFNSKv9NXHKSdRY5T6eJZcgDwzwAsMqMu6/7Yc0tYmKaYJHE3NI
 eTRr56nXq9mQnCGlb9SWWxOpL3dj0RGX/+bNhEc5aA2LY2ftc3xRCKIKF
 e3Ln3du3NxcNwFTvFrIOs/1dCeALrueHDBAX804YUavJ0hRSJSUM4EkRa
 7rjdQL5KWyyG06Gp6ECTgt7LCArWRIsSROuX5ROjoxOZ9SwhiSt+mZAow
 /urz1+qqq6+R2WOzNudEue4v+afb4ANeYG58XKYq1RUDpaUyNeofcfQC5
 QR/kxw2wLN9UCUuGxJFQaaPm9x4gPNqzmCxSNu9ekk/Bp32sVI88eghci A==;
X-CSE-ConnectionGUID: AhxoZtv1QCC0bAssJwVMRg==
X-CSE-MsgGUID: 0EDPIujdSniQzmEu8gEwkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="12297488"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="12297488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:13:47 -0700
X-CSE-ConnectionGUID: c1p5v1uUS96yu8zMfx9cEA==
X-CSE-MsgGUID: 00Xl2uiOQk+RAVZolaExcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="45092728"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:13:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4] drm/xe/guc: Configure TLB timeout based on CT buffer size
Date: Fri, 28 Jun 2024 10:58:45 +0200
Message-ID: <20240628085845.2369-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

GuC TLB invalidation depends on GuC to process the request from the CT
queue and then the real time to invalidate TLB. Add a function to return
overestimated possible time a TLB inval H2G might take which can be used
as timeout value for TLB invalidation wait time.

v4: Make sure CTB is in 4K blocks(Michal) and other doc fixes
v3: Pass CT to xe_guc_ct_queue_proc_time_jiffies() (Michal)
    Add tlb_timeout_jiffies() that replaces TLB_TIMEOUT(Michal)
v2: Address reviews from Michal.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 30 +++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_ct.c              | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e1f1ccb01143..d9359976ab8b 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -17,7 +17,22 @@
 #include "xe_trace.h"
 #include "regs/xe_guc_regs.h"
 
-#define TLB_TIMEOUT	(HZ / 4)
+/*
+ * TLB inval depends on pending commands in the CT queue and then the real
+ * invalidation time. Double up the time to process full CT queue
+ * just to be on the safe side.
+ */
+static long tlb_timeout_jiffies(struct xe_gt *gt)
+{
+	/* this reflects what HW/GuC needs to process TLB inv request */
+	const long hw_tlb_timeout = HZ / 4;
+
+	/* this estimates actual delay caused by the CTB transport */
+	long delay = xe_guc_ct_queue_proc_time_jiffies(&gt->uc.guc.ct);
+
+	return hw_tlb_timeout + 2 * delay;
+}
+
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
@@ -32,7 +47,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
 						    fence->invalidation_time);
 
-		if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
+		if (msecs_to_jiffies(since_inval_ms) < tlb_timeout_jiffies(gt))
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
@@ -47,7 +62,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
 		queue_delayed_work(system_wq,
 				   &gt->tlb_invalidation.fence_tdr,
-				   TLB_TIMEOUT);
+				   tlb_timeout_jiffies(gt));
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 }
 
@@ -183,7 +198,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
 				queue_delayed_work(system_wq,
 						   &gt->tlb_invalidation.fence_tdr,
-						   TLB_TIMEOUT);
+						   tlb_timeout_jiffies(gt));
 		}
 		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 	} else if (ret < 0 && fence) {
@@ -390,8 +405,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
  * @gt: graphics tile
  * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
  *
- * Wait for 200ms for a TLB invalidation to complete, in practice we always
- * should receive the TLB invalidation within 200ms.
+ * Wait for tlb_timeout_jiffies() for a TLB invalidation to complete.
  *
  * Return: 0 on success, -ETIME on TLB invalidation timeout
  */
@@ -410,7 +424,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	 */
 	ret = wait_event_timeout(guc->ct.wq,
 				 tlb_invalidation_seqno_past(gt, seqno),
-				 TLB_TIMEOUT);
+				 tlb_timeout_jiffies(gt));
 	if (!ret) {
 		struct drm_printer p = xe_gt_err_printer(gt);
 
@@ -486,7 +500,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
 		mod_delayed_work(system_wq,
 				 &gt->tlb_invalidation.fence_tdr,
-				 TLB_TIMEOUT);
+				 tlb_timeout_jiffies(gt));
 	else
 		cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 873d1bcbedd7..7d2e937da1d8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -112,6 +112,23 @@ ct_to_xe(struct xe_guc_ct *ct)
 #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
 
+/**
+ * xe_guc_ct_queue_proc_time_jiffies - Return maximum time to process a full
+ * CT command queue
+ * @ct: the &xe_guc_ct. Unused at this moment but will be used in the future.
+ *
+ * Observation is that a 4KiB buffer full of commands takes a little over a
+ * second to process. Use that to calculate maximum time to process a full CT
+ * command queue.
+ *
+ * Return: Maximum time to process a full CT queue in jiffies.
+ */
+long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
+{
+	BUILD_BUG_ON(!IS_ALIGNED(CTB_H2G_BUFFER_SIZE, SZ_4));
+	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
+}
+
 static size_t guc_ct_size(void)
 {
 	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 105bb8e99a8d..190202fce2d0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
 }
 
+long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
+
 #endif
-- 
2.42.0

