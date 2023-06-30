Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD770EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 15:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8AF10E49C;
	Fri, 30 Jun 2023 15:45:41 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12BA10E49C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688139939; x=1719675939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0vrViZnT2zcXlzws514+M/uI/6AQIJaiR8pRd5Qnt40=;
 b=lE0Zz+rtz+Xawm3Ct3eo3IjIcn57NdHzwxc4GzBXqS/qDcWrEDtIG7oh
 laiGL8zmVMXVlx+Pmdi/RcUlogtBNnSlv1jxMk6QgtWtfd8slj+mX8ZUw
 ttks+4ObSN6JRmhEtdHLlYS16dsbzNudKrwWLu8TC9hAg1vhamKt9yDyS
 p47pZLfTZWvG14776pZyK9wEjElTDv7k6Hc0Jgep5OUbPwcWgadD/hWBH
 cpLBFFucJRpAqHB8O3liT7IudVEccp0QrcpaQ/Mp7Faf8gBomBaTaWHYe
 zNhRtJnmlOJfV37SNksb0BzYCfpi8re8gTkIKAJiBK29LU8W08kWn+d9J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342760364"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="342760364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 08:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="747469405"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="747469405"
Received: from jahoneyx-mobl2.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.24])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 08:45:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jun 2023 16:45:24 +0100
Message-ID: <20230630154523.355519-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: handle TLB invalidations from CT
 fast-path
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

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/297
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/320
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/449
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 74 +++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_types.h            |  5 ++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 11 +--
 3 files changed, 54 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 2fcb477604e2..105deda434b8 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -25,7 +25,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 					tlb_invalidation.fence_tdr.work);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
-	mutex_lock(&gt->uc.guc.ct.lock);
+	spin_lock(&gt->tlb_invalidation.pending_lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
 		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
@@ -47,7 +47,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		queue_delayed_work(system_wq,
 				   &gt->tlb_invalidation.fence_tdr,
 				   TLB_TIMEOUT);
-	mutex_unlock(&gt->uc.guc.ct.lock);
+	spin_unlock(&gt->tlb_invalidation.pending_lock);
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
@@ -92,11 +93,11 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
 
 	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 
-	mutex_lock(&gt->uc.guc.ct.lock);
+	spin_lock(&gt->tlb_invalidation.pending_lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
 		invalidation_fence_signal(fence);
-	mutex_unlock(&gt->uc.guc.ct.lock);
+	spin_unlock(&gt->tlb_invalidation.pending_lock);
 }
 
 static int send_tlb_invalidation(struct xe_guc *guc,
@@ -117,10 +118,12 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
 	if (fence) {
+		spin_lock(&gt->tlb_invalidation.pending_lock);
 		queue_work = list_empty(&gt->tlb_invalidation.pending_fences);
 		fence->seqno = seqno;
 		list_add_tail(&fence->link,
 			      &gt->tlb_invalidation.pending_fences);
+		spin_unlock(&gt->tlb_invalidation.pending_lock);
 		trace_xe_gt_tlb_invalidation_fence_send(fence);
 	}
 	action[1] = seqno;
@@ -139,8 +142,11 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	}
 	if (!ret)
 		ret = seqno;
-	if (ret < 0 && fence)
+	if (ret < 0 && fence) {
+		spin_lock(&gt->tlb_invalidation.pending_lock);
 		invalidation_fence_signal(fence);
+		spin_unlock(&gt->tlb_invalidation.pending_lock);
+	}
 	mutex_unlock(&guc->ct.lock);
 
 	return ret;
@@ -315,41 +321,55 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
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
 
 	gt->tlb_invalidation.seqno_recv = msg[0];
 	smp_wmb();
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
index 22bc9ce846db..fa2e2749279c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -976,15 +976,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
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
@@ -1038,7 +1031,7 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int len;
 
-	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
+	if (!xe_device_mem_access_ongoing(xe))
 		return;
 
 	spin_lock(&ct->fast_lock);
-- 
2.41.0

