Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E307C001B0
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF1010E481;
	Thu,  6 Jul 2023 16:21:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D24A10E481
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660459; x=1720196459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XOYMv5c+2AjpTtW4/xjg/4ZNIqtUN3oVR9rQhJha0Uc=;
 b=nEGcSz6UFZKAJNNugvLgnyU/hROFwSJS06yFVo486S75qf1Ce8YIx2cb
 rRzsJirawlww/IEngFlAHpZAH1kqal8uqnWD+6pErikTdpq1oJLH5KoS3
 sacMrlFkrzDY5iYngbL7QG98VQD9Zji9XAacY62+FYmq6uvYtq39hal2E
 UnMsHEwODiWIWDZhbK3PidQ1VfLsrtH7V9Nu/pn6CW2sDLUogVoVvwtP1
 1FLlvbktfeLIgsW+OERuzVkwz/a4qin0G0VDRdkMM6S3c32TTYGJmWYHT
 /3BGt7z2wkoEPDKByHAbAF2EZY626np2MDK5+u74HYgSkWTXbfyeWhSMF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409342"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722850016"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722850016"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:13 +0100
Message-ID: <20230706162003.427026-21-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 09/10] drm/xe: handle TLB invalidations from
 CT fast-path
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

In various test cases that put the system under a heavy load, we can
sometimes see errors with missed TLB invalidations. In such cases we see
the interrupt arrive for the invalidation from the GuC, however the
actual processing of the completion is pushed onto a workqueue and
handled with all the other CT stuff, which might take longer than
expected. Since we expect TLB invalidations to complete within a
reasonable amount of time (at most ~250ms), and they do seem pretty
critical, allow handling directly from the CT fast-path.

v2 (José):
  - Actually use the correct spinlock/unlock_irq, since pending_lock is
    grabbed from IRQ.
v3:
  - Don't publish the TLB fence on the list until after we fully
    initialize it and successfully do the CT send. The list is now only
    protected by the spin_lock pending_lock and we can't hold that
    across the entire TLB send operation.
v4 (Matt Brost):
  - Be careful with racing against fast CT path writing the seqno,
    before we have actually published the fence.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 135 ++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_types.h            |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c              |  12 +-
 3 files changed, 92 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e1906ec7c8be..94fa24f360f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -25,7 +25,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 					tlb_invalidation.fence_tdr.work);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
-	mutex_lock(&gt->uc.guc.ct.lock);
+	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
 		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
@@ -47,7 +47,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		queue_delayed_work(system_wq,
 				   &gt->tlb_invalidation.fence_tdr,
 				   TLB_TIMEOUT);
-	mutex_unlock(&gt->uc.guc.ct.lock);
+	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 }
 
 /**
@@ -63,6 +63,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 {
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
+	spin_lock_init(&gt->tlb_invalidation.pending_lock);
 	spin_lock_init(&gt->tlb_invalidation.lock);
 	gt->tlb_invalidation.fence_context = dma_fence_context_alloc(1);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
@@ -72,14 +73,20 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 }
 
 static void
-invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+__invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
 {
 	trace_xe_gt_tlb_invalidation_fence_signal(fence);
-	list_del(&fence->link);
 	dma_fence_signal(&fence->base);
 	dma_fence_put(&fence->base);
 }
 
+static void
+invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	__invalidation_fence_signal(fence);
+	list_del(&fence->link);
+}
+
 /**
  * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
  * @gt: graphics tile
@@ -97,6 +104,7 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	 */
 
 	mutex_lock(&gt->uc.guc.ct.lock);
+	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 	/*
 	 * We might have various kworkers waiting for TLB flushes to complete
@@ -111,9 +119,23 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(fence);
+	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 	mutex_unlock(&gt->uc.guc.ct.lock);
 }
 
+static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
+{
+	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
+
+	if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX / 2))
+		return false;
+
+	if (seqno - seqno_recv > (TLB_INVALIDATION_SEQNO_MAX / 2))
+		return true;
+
+	return seqno_recv >= seqno;
+}
+
 static int send_tlb_invalidation(struct xe_guc *guc,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u32 *action, int len)
@@ -121,7 +143,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	struct xe_gt *gt = guc_to_gt(guc);
 	int seqno;
 	int ret;
-	bool queue_work;
 
 	/*
 	 * XXX: The seqno algorithm relies on TLB invalidation being processed
@@ -132,21 +153,36 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
 	if (fence) {
-		queue_work = list_empty(&gt->tlb_invalidation.pending_fences);
 		fence->seqno = seqno;
-		list_add_tail(&fence->link,
-			      &gt->tlb_invalidation.pending_fences);
 		trace_xe_gt_tlb_invalidation_fence_send(fence);
 	}
 	action[1] = seqno;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret && fence) {
-		fence->invalidation_time = ktime_get();
-		if (queue_work)
-			queue_delayed_work(system_wq,
-					   &gt->tlb_invalidation.fence_tdr,
-					   TLB_TIMEOUT);
+		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
+		/*
+		 * We haven't actually published the TLB fence as per
+		 * pending_fences, but in theory our seqno could have already
+		 * been written as we acquired the pending_lock. In such a case
+		 * we can just go ahead and signal the fence here.
+		 */
+		if (tlb_invalidation_seqno_past(gt, seqno)) {
+			__invalidation_fence_signal(fence);
+		} else {
+			fence->invalidation_time = ktime_get();
+			list_add_tail(&fence->link,
+				      &gt->tlb_invalidation.pending_fences);
+
+			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
+				queue_delayed_work(system_wq,
+						   &gt->tlb_invalidation.fence_tdr,
+						   TLB_TIMEOUT);
+
+		}
+		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
+	} else if (ret < 0 && fence) {
+		__invalidation_fence_signal(fence);
 	}
 	if (!ret) {
 		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
@@ -155,8 +191,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 			gt->tlb_invalidation.seqno = 1;
 		ret = seqno;
 	}
-	if (ret < 0 && fence)
-		invalidation_fence_signal(fence);
 	mutex_unlock(&guc->ct.lock);
 
 	return ret;
@@ -271,19 +305,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	return ret;
 }
 
-static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
-{
-	int seqno_recv = READ_ONCE(gt->tlb_invalidation.seqno_recv);
-
-	if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX / 2))
-		return false;
-
-	if (seqno - seqno_recv > (TLB_INVALIDATION_SEQNO_MAX / 2))
-		return true;
-
-	return seqno_recv >= seqno;
-}
-
 /**
  * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
  * @gt: graphics tile
@@ -331,22 +352,31 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_gt_tlb_invalidation_fence *fence;
-	int expected_seqno;
-
-	lockdep_assert_held(&guc->ct.lock);
+	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	unsigned long flags;
 
 	if (unlikely(len != 1))
 		return -EPROTO;
 
-	/* Sanity check on seqno */
-	expected_seqno = (gt->tlb_invalidation.seqno_recv + 1) %
-		TLB_INVALIDATION_SEQNO_MAX;
-	if (!expected_seqno)
-		expected_seqno = 1;
-	if (drm_WARN_ON(&gt_to_xe(gt)->drm, expected_seqno != msg[0])) {
-		drm_err(&gt_to_xe(gt)->drm, "TLB expected_seqno(%d) != msg(%u)\n",
-			expected_seqno, msg[0]);
+	/*
+	 * This can also be run both directly from the IRQ handler and also in
+	 * process_g2h_msg(). Only one may process any individual CT message,
+	 * however the order they are processed here could result in skipping a
+	 * seqno. To handle that we just process all the seqnos from the last
+	 * seqno_recv up to and including the one in msg[0]. The delta should be
+	 * very small so there shouldn't be much of pending_fences we actually
+	 * need to iterate over here.
+	 *
+	 * From GuC POV we expect the seqnos to always appear in-order, so if we
+	 * see something later in the timeline we can be sure that anything
+	 * appearing earlier has already signalled, just that we have yet to
+	 * officially process the CT message like if racing against
+	 * process_g2h_msg().
+	 */
+	spin_lock_irqsave(&gt->tlb_invalidation.pending_lock, flags);
+	if (tlb_invalidation_seqno_past(gt, msg[0])) {
+		spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
+		return 0;
 	}
 
 	/*
@@ -356,19 +386,24 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, msg[0]);
 	wake_up_all(&guc->ct.wq);
 
-	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
-					 typeof(*fence), link);
-	if (fence)
+	list_for_each_entry_safe(fence, next,
+				 &gt->tlb_invalidation.pending_fences, link) {
 		trace_xe_gt_tlb_invalidation_fence_recv(fence);
-	if (fence && tlb_invalidation_seqno_past(gt, fence->seqno)) {
+
+		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
+			break;
+
 		invalidation_fence_signal(fence);
-		if (!list_empty(&gt->tlb_invalidation.pending_fences))
-			mod_delayed_work(system_wq,
-					 &gt->tlb_invalidation.fence_tdr,
-					 TLB_TIMEOUT);
-		else
-			cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 	}
 
+	if (!list_empty(&gt->tlb_invalidation.pending_fences))
+		mod_delayed_work(system_wq,
+				 &gt->tlb_invalidation.fence_tdr,
+				 TLB_TIMEOUT);
+	else
+		cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
+
+	spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7d4de019f9a5..28b8e8a86fc9 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -163,6 +163,11 @@ struct xe_gt {
 		 * invaliations, protected by CT lock
 		 */
 		struct list_head pending_fences;
+		/**
+		 * @pending_lock: protects @pending_fences and updating
+		 * @seqno_recv.
+		 */
+		spinlock_t pending_lock;
 		/**
 		 * @fence_tdr: schedules a delayed call to
 		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index acf488b00b66..e35971d84e06 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -994,15 +994,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			return 0;
 
 		switch (FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1])) {
-		/*
-		 * FIXME: We really should process
-		 * XE_GUC_ACTION_TLB_INVALIDATION_DONE here in the fast-path as
-		 * these critical for page fault performance. We currently can't
-		 * due to TLB invalidation done algorithm expecting the seqno
-		 * returned in-order. With some small changes to the algorithm
-		 * and locking we should be able to support out-of-order seqno.
-		 */
 		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
+		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 			break;	/* Process these in fast-path */
 		default:
 			return 0;
@@ -1056,8 +1049,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int len;
 
-	if (!xe_device_in_fault_mode(xe) ||
-	    !xe_device_mem_access_get_if_ongoing(xe))
+	if (!xe_device_mem_access_get_if_ongoing(xe))
 		return;
 
 	spin_lock(&ct->fast_lock);
-- 
2.41.0

