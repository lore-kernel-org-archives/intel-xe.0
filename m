Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BFAC3DA40
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51A610E24A;
	Sat,  6 Jul 2024 00:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCsvGdq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7174910E047
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224138; x=1751760138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2y34DMupeN0OvLM6J1bpZnVkzQx2bEHjbq253p0o5Z0=;
 b=lCsvGdq4askBDT9w+6A0YUfbvewQ/oXtrLHW3H/CTLU0nlxkRTkcRgyE
 V1nlCa5HVF88GBLPTziVJw83IP4VKqyAyvEMrMh8KXifNcMGGOmDpTkRa
 alhNIncYkKvH9G2GzoA/ICQtuZB6Tsn+hWn/S9avYcVj2BYGjYNgzzzen
 a+QOjM6iCfFnKiUhNUiOoIwOKApMhKWJFmESgwOGvbRQeMpPuuu+MPb3N
 H7XNLSjvUso39SBKLJTyIvPihtN0TTF5FW2y7by5FbRmauNST++Oitkhj
 nY89VNVrOnDxXqRiP3Qm6fxe51UJkK0x7tRr4ufRrid+E1mn/FXOLkDNt Q==;
X-CSE-ConnectionGUID: S6qErR55Sreoc22DlEpKtQ==
X-CSE-MsgGUID: CUigtM2mT0Kk1M9TeThjKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464663"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464663"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:15 -0700
X-CSE-ConnectionGUID: 5JgfOYRvREyS+tKPOb+QIA==
X-CSE-MsgGUID: FvX7CIaUQHSIxnK1GhoMsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128263"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 09/11] drm/xe: Add GT TLB invalidation coalescing
Date: Fri,  5 Jul 2024 17:02:50 -0700
Message-Id: <20240706000252.702044-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
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

It is shown that too many pending GT TLB invalidations can overwhelm the
hardware (GuC firmware). Add a watermark if too many GT TLB
invalidations are pending which holds GT TLB invalidations in the KMD
until pressure is relieved. While holding GT TLB invalidations coalesce
invalidations in the VM (PPGTT) or GGTT structures.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 256 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  10 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  23 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  21 +-
 drivers/gpu/drm/xe/xe_pt.c                    |   7 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  19 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
 9 files changed, 339 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0cdbc1296e88..3d4d45aa5e09 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -130,6 +130,12 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
+
+	xe_gt_tlb_invalidation_coalesce_fini(ggtt->tile->primary_gt,
+					     &ggtt->coalesce[PRIMARY_COALESCE_ID]);
+	if (ggtt->tile->media_gt)
+		xe_gt_tlb_invalidation_coalesce_fini(ggtt->tile->media_gt,
+						     &ggtt->coalesce[MEDIA_COALESCE_ID]);
 }
 
 static void ggtt_fini(struct drm_device *drm, void *arg)
@@ -231,6 +237,10 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
+	xe_gt_tlb_invalidation_coalesce_init(&ggtt->coalesce[PRIMARY_COALESCE_ID],
+					     XE_GT_TLB_INVALIDATION_COALESCE_GGTT);
+	xe_gt_tlb_invalidation_coalesce_init(&ggtt->coalesce[MEDIA_COALESCE_ID],
+					     XE_GT_TLB_INVALIDATION_COALESCE_GGTT);
 	primelockdep(ggtt);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
@@ -295,14 +305,15 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	return err;
 }
 
-static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
+static void ggtt_invalidate_gt_tlb(struct xe_gt *gt,
+				   struct xe_gt_tlb_invalidation_coalesce *coalesce)
 {
 	int err;
 
 	if (!gt)
 		return;
 
-	err = xe_gt_tlb_invalidation_ggtt(gt);
+	err = xe_gt_tlb_invalidation_ggtt(gt, coalesce);
 	if (err)
 		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
 }
@@ -310,8 +321,10 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 {
 	/* Each GT in a tile has its own TLB to cache GGTT lookups */
-	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt);
-	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
+	ggtt_invalidate_gt_tlb(ggtt->tile->primary_gt,
+			       &ggtt->coalesce[PRIMARY_COALESCE_ID]);
+	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt,
+			       &ggtt->coalesce[MEDIA_COALESCE_ID]);
 }
 
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 2245d88d8f39..56ad0b312d22 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_mm.h>
 
+#include "xe_gt_tlb_invalidation_types.h"
 #include "xe_pt_types.h"
 
 struct xe_bo;
@@ -31,6 +32,10 @@ struct xe_ggtt {
 
 	struct drm_mm mm;
 
+#define PRIMARY_COALESCE_ID	0
+#define MEDIA_COALESCE_ID	1
+	struct xe_gt_tlb_invalidation_coalesce coalesce[MEDIA_COALESCE_ID + 1];
+
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
 };
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index d63ce1da3a92..b85089d27a36 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -62,12 +62,38 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		dma_fence_put(&fence->base);
 	}
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
-		queue_delayed_work(system_wq,
+		queue_delayed_work(gt->tlb_invalidation.wq,
 				   &gt->tlb_invalidation.fence_tdr,
 				   tlb_timeout_jiffies(gt));
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 }
 
+static void
+xe_gt_tlb_invalidation_coalesce_issue(struct xe_gt *gt,
+				      struct xe_gt_tlb_invalidation_coalesce *coalesce);
+
+static void xe_gt_tlb_coalesce_work(struct work_struct *work)
+{
+	struct xe_gt *gt = container_of(work, struct xe_gt,
+					tlb_invalidation.coalesce_work);
+	struct xe_gt_tlb_invalidation_coalesce *coalesce, *next;
+
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
+	list_for_each_entry_safe(coalesce, next,
+				 &gt->tlb_invalidation.pending_coalesce,
+				 link)
+		xe_gt_tlb_invalidation_coalesce_issue(gt, coalesce);
+	xe_gt_assert(gt, list_empty(&gt->tlb_invalidation.pending_coalesce));
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
+}
+
+static void gt_tlb_invalidation_init(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	destroy_workqueue(gt->tlb_invalidation.wq);
+}
+
 /**
  * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
  * @gt: graphics tile
@@ -79,18 +105,32 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
  */
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 {
+	int err;
+
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
+	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_coalesce);
 	spin_lock_init(&gt->tlb_invalidation.pending_lock);
 	spin_lock_init(&gt->tlb_invalidation.fence_lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
+	INIT_WORK(&gt->tlb_invalidation.coalesce_work,
+		  xe_gt_tlb_coalesce_work);
 
 	/* Execlists not supported */
 	if (!gt_to_xe(gt)->info.force_execlist)
 		gt->tlb_invalidation.ops[XE_GT_TLB_INVALIDATION_CLIENT_GUC] =
 			xe_guc_tlb_invalidation_get_ops(&gt->uc.guc);
 
+	gt->tlb_invalidation.wq = alloc_ordered_workqueue("gt-tlb-inval-ordered-wq", 0);
+	if (!gt->tlb_invalidation.wq)
+		return -ENOMEM;
+
+	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm,
+				       gt_tlb_invalidation_init, gt);
+	if (err)
+		return err;
+
 	return drmm_mutex_init(&gt_to_xe(gt)->drm,
 			       &gt->tlb_invalidation.seqno_lock);
 }
@@ -109,6 +149,22 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
 	list_del(&fence->link);
 	__invalidation_fence_signal(xe, fence);
 }
+static void
+xe_gt_tlb_invalidation_coalesce_reset(struct xe_gt *gt,
+				      struct xe_gt_tlb_invalidation_coalesce *coalesce)
+{
+	struct xe_gt_tlb_invalidation_fence *fence, *next;
+
+	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
+	lockdep_assert_held(&gt->tlb_invalidation.pending_lock);
+	xe_gt_assert(gt, !list_empty(&coalesce->fence_list));
+
+	list_for_each_entry_safe(fence, next, &coalesce->fence_list,
+				 link)
+		invalidation_fence_signal(gt_to_xe(gt), fence);
+
+	list_del_init(&coalesce->link);
+}
 
 /**
  * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
@@ -119,6 +175,7 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_gt_tlb_invalidation_coalesce *coalesce, *__next;
 	enum xe_gt_tlb_invalidation_clients client;
 	int pending_seqno;
 
@@ -130,6 +187,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
+	cancel_work(&gt->tlb_invalidation.coalesce_work);
 	/*
 	 * We might have various kworkers waiting for TLB flushes to complete
 	 * which are not tracked with an explicit TLB fence, however at this
@@ -145,6 +203,11 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 		WRITE_ONCE(gt->tlb_invalidation.seqno_recv[client],
 			   pending_seqno);
 
+	list_for_each_entry_safe(coalesce, __next,
+				 &gt->tlb_invalidation.pending_coalesce,
+				 link)
+		xe_gt_tlb_invalidation_coalesce_reset(gt, coalesce);
+
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(gt_to_xe(gt), fence);
@@ -152,6 +215,35 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 }
 
+static int __tlb_invalidation_seqno_diff(struct xe_gt *gt,
+					 enum xe_gt_tlb_invalidation_clients client)
+{
+	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv[client]);
+	int seqno = gt->tlb_invalidation.seqno;
+
+	lockdep_assert_held(&gt->tlb_invalidation.pending_lock);
+
+	if (seqno >= seqno_recv)
+		return seqno - seqno_recv;
+	else
+		return TLB_INVALIDATION_SEQNO_MAX - seqno_recv + seqno - 1;
+}
+
+static int tlb_invalidation_seqno_diff(struct xe_gt *gt)
+{
+	enum xe_gt_tlb_invalidation_clients client;
+	int diff = 0, tmp;
+
+	lockdep_assert_held(&gt->tlb_invalidation.pending_lock);
+	for (client = 0; client < XE_GT_TLB_INVALIDATION_CLIENT_MAX; ++client) {
+		tmp = __tlb_invalidation_seqno_diff(gt, client);
+		if (tmp > diff)
+			diff = tmp;
+	}
+
+	return diff;
+}
+
 static bool __tlb_invalidation_seqno_past(struct xe_gt *gt,
 					  enum xe_gt_tlb_invalidation_clients client,
 					  int seqno)
@@ -222,6 +314,14 @@ static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
 	return 0;
 }
 
+static void xe_gt_tlb_invalidation_seqno_bump(struct xe_gt *gt)
+{
+	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
+		TLB_INVALIDATION_SEQNO_MAX;
+	if (!gt->tlb_invalidation.seqno)
+		gt->tlb_invalidation.seqno = 1;
+}
+
 static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
 					      struct xe_gt_tlb_invalidation_fence *fence)
 {
@@ -241,30 +341,114 @@ static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
 			      &gt->tlb_invalidation.pending_fences);
 
 		if (list_is_singular(&gt->tlb_invalidation.pending_fences))
-			queue_delayed_work(system_wq,
+			queue_delayed_work(gt->tlb_invalidation.wq,
 					   &gt->tlb_invalidation.fence_tdr,
 					   tlb_timeout_jiffies(gt));
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 
-	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
-		TLB_INVALIDATION_SEQNO_MAX;
-	if (!gt->tlb_invalidation.seqno)
-		gt->tlb_invalidation.seqno = 1;
+	xe_gt_tlb_invalidation_seqno_bump(gt);
+}
+
+static void
+xe_gt_tlb_invalidation_coalesce_issue(struct xe_gt *gt,
+				      struct xe_gt_tlb_invalidation_coalesce *coalesce)
+{
+	struct xe_gt_tlb_invalidation_fence *fence;
+	int seqno = gt->tlb_invalidation.seqno;
+
+	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
+	xe_gt_assert(gt, !list_empty(&coalesce->fence_list));
+
+	list_for_each_entry(fence, &coalesce->fence_list, link) {
+		fence->seqno = seqno;
+		fence->invalidation_time = ktime_get();
+		trace_xe_gt_tlb_invalidation_fence_send(gt_to_xe(gt), fence);
+	}
+
+	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
+	if (list_empty(&gt->tlb_invalidation.pending_fences))
+		queue_delayed_work(gt->tlb_invalidation.wq,
+				   &gt->tlb_invalidation.fence_tdr,
+				   tlb_timeout_jiffies(gt));
+	list_splice_tail_init(&coalesce->fence_list,
+			      &gt->tlb_invalidation.pending_fences);
+	list_del_init(&coalesce->link);
+	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+
+	xe_gt_tlb_invalidation_seqno_bump(gt);
+
+	if (coalesce->type == XE_GT_TLB_INVALIDATION_COALESCE_GGTT)
+		send_tlb_invalidation_ggtt(gt, seqno);
+	else
+		send_tlb_invalidation_ppgtt(gt, coalesce->start, coalesce->end,
+					    coalesce->asid, seqno);
+
+	coalesce->start = ULONG_MAX;
+	coalesce->end = 0;
+
+	xe_gt_assert(gt, list_empty(&coalesce->fence_list));
+	xe_gt_assert(gt, list_empty(&coalesce->link));
 }
 
-static int __xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
-					 struct xe_gt_tlb_invalidation_fence *fence)
+/* Any more pending TLB invalidations start to hold in KMD */
+#define SEQNO_WATERMARK		16
+
+static int
+xe_gt_tlb_invalidation_coalesce_prep(struct xe_gt *gt,
+				     struct xe_gt_tlb_invalidation_fence *fence,
+				     struct xe_gt_tlb_invalidation_coalesce *coalesce,
+				     u64 start, u64 end, u32 asid)
 {
-	int ret;
+	int ret = -EBUSY;
+
+	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
+
+	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
+
+	if (list_empty(&gt->tlb_invalidation.pending_coalesce) &&
+	    tlb_invalidation_seqno_diff(gt) < SEQNO_WATERMARK) {
+		ret = 0;
+		goto unlock;
+	}
+
+	if (list_empty(&coalesce->link))
+		list_add_tail(&coalesce->link,
+			      &gt->tlb_invalidation.pending_coalesce);
+
+	if (coalesce->start > start)
+		coalesce->start = start;
+	if (coalesce->end < end)
+		coalesce->end = end;
+	coalesce->asid = asid;
+
+	list_add_tail(&fence->link, &coalesce->fence_list);
+
+unlock:
+	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+
+	return ret;
+}
+
+static int
+__xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
+			      struct xe_gt_tlb_invalidation_fence *fence,
+			      struct xe_gt_tlb_invalidation_coalesce *coalesce)
+{
+	int ret = 0;
 
 	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 
+	if (xe_gt_tlb_invalidation_coalesce_prep(gt, fence, coalesce,
+						 0, 0, 0))
+		goto unlock;
+
 	xe_gt_tlb_invalidation_fence_prep(gt, fence);
 
 	ret = send_tlb_invalidation_ggtt(gt, fence->seqno);
 	if (ret < 0)
 		invalidation_fence_signal(gt_to_xe(gt), fence);
 
+unlock:
 	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 
 	return ret;
@@ -273,13 +457,15 @@ static int __xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
 /**
  * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
  * @gt: graphics tile
+ * @coalesce: coalesce structure
  *
  * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
  * synchronous.
  *
  * Return: 0 on success, negative error code on error
  */
-int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
+int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
+				struct xe_gt_tlb_invalidation_coalesce *coalesce)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -289,7 +475,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 		int ret;
 
 		xe_gt_tlb_invalidation_fence_init(gt, &fence);
-		ret = __xe_gt_tlb_invalidation_ggtt(gt, &fence);
+		ret = __xe_gt_tlb_invalidation_ggtt(gt, &fence, coalesce);
 		if (ret < 0)
 			return ret;
 
@@ -321,6 +507,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
  * @gt: graphics tile
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion
+ * @coalesce: coalesce structure
  * @start: start address
  * @end: end address
  * @asid: address space id
@@ -333,21 +520,27 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
  */
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
+				 struct xe_gt_tlb_invalidation_coalesce *coalesce,
 				 u64 start, u64 end, u32 asid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int ret;
+	int ret = 0;
 
 	xe_gt_assert(gt, fence);
 
 	mutex_lock(&gt->tlb_invalidation.seqno_lock);
 
+	if (xe_gt_tlb_invalidation_coalesce_prep(gt, fence, coalesce,
+						 start, end, asid))
+		goto unlock;
+
 	xe_gt_tlb_invalidation_fence_prep(gt, fence);
 
 	ret = send_tlb_invalidation_ppgtt(gt, start, end, asid, fence->seqno);
 	if (ret < 0)
 		invalidation_fence_signal(xe, fence);
 
+unlock:
 	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
 
 	return ret;
@@ -358,6 +551,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
  * @gt: graphics tile
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion, can be NULL
+ * @coalesce: coalesce structure
  * @vma: VMA to invalidate
  *
  * Issue a range based TLB invalidation if supported, if not fallback to a full
@@ -368,11 +562,13 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
  */
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
+			       struct xe_gt_tlb_invalidation_coalesce *coalesce,
 			       struct xe_vma *vma)
 {
 	xe_gt_assert(gt, vma);
 
-	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
+	return xe_gt_tlb_invalidation_range(gt, fence, coalesce,
+					    xe_vma_start(vma),
 					    xe_vma_end(vma),
 					    xe_vma_vm(vma)->usm.asid);
 }
@@ -418,8 +614,14 @@ void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt,
 		invalidation_fence_signal(xe, fence);
 	}
 
+	if ((list_empty(&gt->tlb_invalidation.pending_fences) ||
+	    list_is_singular(&gt->tlb_invalidation.pending_fences)) &&
+	    !list_empty(&gt->tlb_invalidation.pending_coalesce))
+		queue_work(gt->tlb_invalidation.wq,
+			   &gt->tlb_invalidation.coalesce_work);
+
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
-		mod_delayed_work(system_wq,
+		mod_delayed_work(gt->tlb_invalidation.wq,
 				 &gt->tlb_invalidation.fence_tdr,
 				 tlb_timeout_jiffies(gt));
 	else
@@ -463,3 +665,29 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 	INIT_LIST_HEAD(&fence->link);
 	dma_fence_get(&fence->base);
 }
+
+/**
+ * xe_gt_tlb_invalidation_coalesce_init - Initialize TLB invalidation coalescing
+ * @coalesce: coalescing structure to init
+ * @types: type of coalescing
+ */
+void xe_gt_tlb_invalidation_coalesce_init(struct xe_gt_tlb_invalidation_coalesce *coalesce,
+					  enum xe_gt_tlb_invalidation_coalesce_type type)
+{
+	INIT_LIST_HEAD(&coalesce->link);
+	INIT_LIST_HEAD(&coalesce->fence_list);
+	coalesce->start = ULONG_MAX;
+	coalesce->end = 0;
+	coalesce->type = type;
+}
+
+void xe_gt_tlb_invalidation_coalesce_fini(struct xe_gt *gt,
+					  struct xe_gt_tlb_invalidation_coalesce *coalesce)
+{
+	mutex_lock(&gt->tlb_invalidation.seqno_lock);
+	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
+	if (!list_empty(&coalesce->link))
+		xe_gt_tlb_invalidation_coalesce_reset(gt, coalesce);
+	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+	mutex_unlock(&gt->tlb_invalidation.seqno_lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index df22d9b4d85c..2401aa432714 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -15,12 +15,15 @@ struct xe_vma;
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
-int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
+int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
+				struct xe_gt_tlb_invalidation_coalesce *coalesce);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
+			       struct xe_gt_tlb_invalidation_coalesce *coalesce,
 			       struct xe_vma *vma);
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
+				 struct xe_gt_tlb_invalidation_coalesce *coalesce,
 				 u64 start, u64 end, u32 asid);
 
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
@@ -30,6 +33,11 @@ void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt,
 					 enum xe_gt_tlb_invalidation_clients client,
 					 int seqno);
 
+void xe_gt_tlb_invalidation_coalesce_init(struct xe_gt_tlb_invalidation_coalesce *coalesce,
+					  enum xe_gt_tlb_invalidation_coalesce_type type);
+void xe_gt_tlb_invalidation_coalesce_fini(struct xe_gt *gt,
+					  struct xe_gt_tlb_invalidation_coalesce *coalesce);
+
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
index 1208edf7a5a4..46db9f70eaac 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
@@ -38,6 +38,29 @@ struct xe_gt_tlb_invalidation_ops {
 				      u32 asid, int seqno);
 };
 
+enum xe_gt_tlb_invalidation_coalesce_type {
+	XE_GT_TLB_INVALIDATION_COALESCE_GGTT = 0,
+	XE_GT_TLB_INVALIDATION_COALESCE_PPGTT,
+};
+
+/**
+ * struct xe_gt_tlb_invalidation_coalesce - Xe GT TLB invalidation coalesce
+ */
+struct xe_gt_tlb_invalidation_coalesce {
+	/** @link: link into pending coalesce */
+	struct list_head link;
+	/** @fence_list: list of fences to coalesce */
+	struct list_head fence_list;
+	/** @start: start address to coalesce (PPGTT only) */
+	u64 start;
+	/** @end: start address to coalesce (PPGTT only) */
+	u64 end;
+	/** @asid: address space ID (PPGTT only) */
+	u32 asid;
+	/** @type: type of coalesce */
+	enum xe_gt_tlb_invalidation_coalesce_type type;
+};
+
 enum xe_gt_tlb_invalidation_clients {
 	XE_GT_TLB_INVALIDATION_CLIENT_GUC = 0,
 	XE_GT_TLB_INVALIDATION_CLIENT_MAX,
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 9a2f1e8b74e1..9a411aa6c388 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -193,8 +193,25 @@ struct xe_gt {
 		 */
 		struct list_head pending_fences;
 		/**
-		 * @tlb_invalidation.pending_lock: protects @tlb_invalidation.pending_fences
-		 * and updating @tlb_invalidation.seqno_recv.
+		 * @tlb_invalidation.pending_coalesce: list of pending coalesce
+		 * TLB invalidations, protected by @tlb_invalidation.seqno_lock
+		 * (send) and @tlb_invalidation.pending_lock (send, recv)
+		 */
+		struct list_head pending_coalesce;
+		/**
+		 * @tlb_invalidation.wq: ordered work queue for TLB invalidations
+		 */
+		struct workqueue_struct *wq;
+		/**
+		 * @tlb_invalidation.coalesce_work: worker to issue coalesce TLB
+		 * invalidations.
+		 */
+		struct work_struct coalesce_work;
+		/**
+		 * @tlb_invalidation.pending_lock: protects
+		 * @tlb_invalidation.pending_fences, updating
+		 * @tlb_invalidation.seqno_recv, and
+		 * @tlb_invalidation.pending_coalesce
 		 */
 		spinlock_t pending_lock;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1caa99b22c73..5054c9d8d149 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1308,6 +1308,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
+	struct xe_gt_tlb_invalidation_coalesce *coalesce;
 	struct xe_gt *gt;
 	struct dma_fence *fence;
 	struct dma_fence_cb cb;
@@ -1342,13 +1343,15 @@ static void invalidation_fence_work_func(struct work_struct *w)
 	struct xe_device *xe = gt_to_xe(ifence->gt);
 
 	trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence->base);
-	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
+	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base,
+				     ifence->coalesce, ifence->start,
 				     ifence->end, ifence->asid);
 }
 
 static void invalidation_fence_init(struct xe_gt *gt,
 				    struct invalidation_fence *ifence,
 				    struct dma_fence *fence,
+				    struct xe_gt_tlb_invalidation_coalesce *coalesce,
 				    u64 start, u64 end, u32 asid)
 {
 	int ret;
@@ -1358,6 +1361,7 @@ static void invalidation_fence_init(struct xe_gt *gt,
 	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base);
 
 	ifence->fence = fence;
+	ifence->coalesce = coalesce;
 	ifence->gt = gt;
 	ifence->start = start;
 	ifence->end = end;
@@ -2026,6 +2030,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	/* tlb invalidation must be done before signaling rebind */
 	if (ifence) {
 		invalidation_fence_init(tile->primary_gt, ifence, fence,
+					&vm->coalesce[tile->id],
 					pt_update_ops->start,
 					pt_update_ops->last, vm->usm.asid);
 		fence = &ifence->base.base;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 478932fb7718..c5b5c629b154 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1407,8 +1407,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		xe_range_fence_tree_init(&vm->rftree[id]);
+		xe_gt_tlb_invalidation_coalesce_init(&vm->coalesce[id],
+						     XE_GT_TLB_INVALIDATION_COALESCE_PPGTT);
+	}
 
 	vm->pt_ops = &xelp_pt_ops;
 
@@ -1525,8 +1528,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 err_no_resv:
 	mutex_destroy(&vm->snap_mutex);
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		xe_range_fence_tree_fini(&vm->rftree[id]);
+		xe_gt_tlb_invalidation_coalesce_fini(tile->primary_gt,
+						     &vm->coalesce[id]);
+	}
 	kfree(vm);
 	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
@@ -1641,8 +1647,11 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	mutex_unlock(&xe->usm.lock);
 
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		xe_range_fence_tree_fini(&vm->rftree[id]);
+		xe_gt_tlb_invalidation_coalesce_fini(tile->primary_gt,
+						     &vm->coalesce[id]);
+	}
 
 	xe_vm_put(vm);
 }
@@ -3213,7 +3222,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			 * GTs within the tile
 			 */
 			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
-							 &fence[id], vma);
+							 &fence[id],
+							 &xe_vma_vm(vma)->coalesce[id],
+							 vma);
 			if (ret < 0)
 				goto wait;
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7f9a303e51d8..e70839af93d0 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -14,6 +14,7 @@
 #include <linux/scatterlist.h>
 
 #include "xe_device_types.h"
+#include "xe_gt_tlb_invalidation_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
 
@@ -152,6 +153,8 @@ struct xe_vm {
 	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
 	struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
 
+	struct xe_gt_tlb_invalidation_coalesce coalesce[XE_MAX_TILES_PER_DEVICE];
+
 	/**
 	 * @flags: flags for this VM, statically setup a creation time aside
 	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
-- 
2.34.1

