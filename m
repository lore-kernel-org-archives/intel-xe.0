Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA95FD4616
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 04:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA7810E86B;
	Thu, 26 Feb 2026 04:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f69SmpAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEFB10E0FF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772080119; x=1803616119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iVmB2zkKS2koRYYG7caKrvZtUIfO4BDEzJ1YKhxhDh0=;
 b=f69SmpAWGHl9K842IgfMfY/kI29B7uEbOsvpB/7ZXGwcJ71IFmolRNSt
 Q1EmgwKyNJzkAlS4PAW8u8HcbVQzoc5aHuD+UulxqbZnhX+31qzxglcsI
 sXEDynbTTUV0nPJ32Eu5hMs5I5l0IEddScP5qShNlPNWuApEEYuD5jX6h
 jlZEvBoCAMxUAwEVZbCAQO4+VbQYtU/3iJYfIAEpU1Osp1q4vFi1KI5tS
 z7T00HK0gsou3ZJFD7FzIfWwq5ibPVI70invOoGL4CCkDfDn4lpsYon3c
 xWMeqo6ejZ7536F5/dGWz7/yawblbvnE5p7c+4PIiGYXyaRtNYkJ3I75V A==;
X-CSE-ConnectionGUID: XvnyV4tXQ0WonYXl9Cv96Q==
X-CSE-MsgGUID: bJTXe/gyRq+dH0qvIdCiAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98603130"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="98603130"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:39 -0800
X-CSE-ConnectionGUID: FmQG9RYbTY2yqpsA9PkjGQ==
X-CSE-MsgGUID: dX1nx4ISSjWwxPZDlbO+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="216334152"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v4 04/12] drm/xe: Use a single page-fault queue with multiple
 workers
Date: Wed, 25 Feb 2026 20:28:26 -0800
Message-Id: <20260226042834.2963245-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226042834.2963245-1-matthew.brost@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
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

With fine-grained page-fault locking, it no longer makes sense to
maintain multiple page-fault queues, as we no longer hash queues based
on the VM’s ASID. Multiple workers can pull page faults from a single
queue, eliminating any head-of-queue blocking. Refactor the structures
and code to use a single shared queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h    | 12 +++---
 drivers/gpu/drm/xe/xe_pagefault.c       | 52 +++++++++++++------------
 drivers/gpu/drm/xe/xe_pagefault_types.h | 17 +++++++-
 3 files changed, 50 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1eb0fe118940..0558dfd52541 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -304,8 +304,8 @@ struct xe_device {
 		struct xarray asid_to_vm;
 		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
 		u32 next_asid;
-		/** @usm.current_pf_queue: current page fault queue */
-		u32 current_pf_queue;
+		/** @usm.current_pf_work: current page fault work item */
+		u32 current_pf_work;
 		/** @usm.lock: protects UM state */
 		struct rw_semaphore lock;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
@@ -315,9 +315,11 @@ struct xe_device {
 		 * yields the best bandwidth utilization of the kernel paging
 		 * engine.
 		 */
-#define XE_PAGEFAULT_QUEUE_COUNT	4
-		/** @usm.pf_queue: Page fault queues */
-		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
+#define XE_PAGEFAULT_WORK_COUNT	4
+		/** @usm.pf_workers: Page fault workers */
+		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_COUNT];
+		/** @usm.pf_queue: Page fault queue */
+		struct xe_pagefault_queue pf_queue;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
 		struct drm_pagemap_shrinker *dpagemap_shrinker;
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index a372db7cd839..7880fc7e7eb4 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -222,6 +222,7 @@ static void xe_pagefault_queue_retry(struct xe_pagefault_queue *pf_queue,
 		pf_queue->tail = pf_queue->size - xe_pagefault_entry_size();
 	else
 		pf_queue->tail -= xe_pagefault_entry_size();
+	memcpy(pf_queue->data + pf_queue->tail, pf, sizeof(*pf));
 	spin_unlock_irq(&pf_queue->lock);
 }
 
@@ -267,8 +268,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 
 static void xe_pagefault_queue_work(struct work_struct *w)
 {
-	struct xe_pagefault_queue *pf_queue =
-		container_of(w, typeof(*pf_queue), worker);
+	struct xe_pagefault_work *pf_work =
+		container_of(w, typeof(*pf_work), work);
+	struct xe_device *xe = pf_work->xe;
+	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
 	struct xe_pagefault pf;
 	unsigned long threshold;
 
@@ -285,7 +288,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		if (err == -EAGAIN) {
 			xe_pagefault_queue_retry(pf_queue, &pf);
-			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
+			queue_work(xe->usm.pf_wq, w);
 			break;
 		} else if (err) {
 			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
@@ -302,7 +305,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 		pf.producer.ops->ack_fault(&pf, err);
 
 		if (time_after(jiffies, threshold)) {
-			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
+			queue_work(xe->usm.pf_wq, w);
 			break;
 		}
 	}
@@ -348,7 +351,6 @@ static int xe_pagefault_queue_init(struct xe_device *xe,
 		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
 
 	spin_lock_init(&pf_queue->lock);
-	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
 
 	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
 	if (!pf_queue->data)
@@ -381,14 +383,20 @@ int xe_pagefault_init(struct xe_device *xe)
 
 	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
 					WQ_UNBOUND | WQ_HIGHPRI,
-					XE_PAGEFAULT_QUEUE_COUNT);
+					XE_PAGEFAULT_WORK_COUNT);
 	if (!xe->usm.pf_wq)
 		return -ENOMEM;
 
-	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
-		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
-		if (err)
-			goto err_out;
+	err = xe_pagefault_queue_init(xe, &xe->usm.pf_queue);
+	if (err)
+		goto err_out;
+
+	for (i = 0; i < XE_PAGEFAULT_WORK_COUNT; ++i) {
+		struct xe_pagefault_work *pf_work = xe->usm.pf_workers + i;
+
+		pf_work->xe = xe;
+		pf_work->id = i;
+		INIT_WORK(&pf_work->work, xe_pagefault_queue_work);
 	}
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
@@ -430,10 +438,7 @@ static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
  */
 void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
 {
-	int i;
-
-	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
-		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
+	xe_pagefault_queue_reset(xe, gt, &xe->usm.pf_queue);
 }
 
 static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
@@ -448,13 +453,11 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
  * This function can race with multiple page fault producers, but worst case we
  * stick a page fault on the same queue for consumption.
  */
-static int xe_pagefault_queue_index(struct xe_device *xe)
+static int xe_pagefault_work_index(struct xe_device *xe)
 {
-	u32 old_pf_queue = READ_ONCE(xe->usm.current_pf_queue);
-
-	WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
+	lockdep_assert_held(&xe->usm.pf_queue.lock);
 
-	return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
+	return xe->usm.current_pf_work++ % XE_PAGEFAULT_WORK_COUNT;
 }
 
 /**
@@ -469,22 +472,23 @@ static int xe_pagefault_queue_index(struct xe_device *xe)
  */
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
-	int queue_index = xe_pagefault_queue_index(xe);
-	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
+	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
 	unsigned long flags;
+	int work_index;
 	bool full;
 
 	spin_lock_irqsave(&pf_queue->lock, flags);
+	work_index = xe_pagefault_work_index(xe);
 	full = xe_pagefault_queue_full(pf_queue);
 	if (!full) {
 		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
 		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
 			pf_queue->size;
-		queue_work(xe->usm.pf_wq, &pf_queue->worker);
+		queue_work(xe->usm.pf_wq,
+			   &xe->usm.pf_workers[work_index].work);
 	} else {
 		drm_warn(&xe->drm,
-			 "PageFault Queue (%d) full, shouldn't be possible\n",
-			 queue_index);
+			 "PageFault Queue full, shouldn't be possible\n");
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index b3289219b1be..45065c25c25f 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -131,8 +131,21 @@ struct xe_pagefault_queue {
 	u32 tail;
 	/** @lock: protects page fault queue */
 	spinlock_t lock;
-	/** @worker: to process page faults */
-	struct work_struct worker;
+};
+
+/**
+ * struct xe_pagefault_work - Xe page fault work item (consumer)
+ *
+ * Represents a worker that pops a &struct xe_pagefault from the page fault
+ * queue and processes it.
+ */
+struct xe_pagefault_work {
+	/** @xe: Back-pointer to the Xe device */
+	struct xe_device *xe;
+	/** @id: Identifier for this work item */
+	int id;
+	/** @work: Work item used to process the page fault */
+	struct work_struct work;
 };
 
 #endif
-- 
2.34.1

