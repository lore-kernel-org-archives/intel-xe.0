Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0344FCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F97310E2E9;
	Wed, 18 Mar 2026 07:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pqyrmn5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D9810E2E9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817812; x=1805353812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QmuKh9nQSSrjpWguNuxuo1A+o9BVLzHjJ65Tq7p6SMk=;
 b=Pqyrmn5vEQAhKXBgnFrpjDhp8XyWeyRVC2PHiO3PCqoZXk40W1DcfXjd
 vCju7vUr5Y4NGPUu8GVGlt71AjfNuKhnfCUFLZCswxUFBSCil0Xv6AIOd
 Q5+iSYSM5pdxGcXaUsDuPquyXZNx7YYgX7TBw1gmmg7Ju/pj8u8oLmZUm
 QxpkSzTf66sCa98QK2dsnWV/Fs0rsR0HHjFG1nZKvmT1BflgzeFgODSi/
 FpqolOTMvpK3IymdT8+awS6xaeW2hnUkZHCTqdmPsMgidgPLCLyLjFteV
 M4NAUXJvfHhKnscRwzpCHqYWVK0RaKYGfmJeVh1rv48wqwdpY4VpQRHs0 g==;
X-CSE-ConnectionGUID: HqBHHupVSAmObUgLv6/Waw==
X-CSE-MsgGUID: afFU5sFKTk613298bHgM3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764246"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764246"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:11 -0700
X-CSE-ConnectionGUID: k/ueecZnThCpn+YoQTu1PQ==
X-CSE-MsgGUID: eHmWkZlfQ4eq8Ubx3hfH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260423975"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 02/15] drm/xe/pagefault: Use xe_usm_queue helpers
Date: Wed, 18 Mar 2026 13:14:43 +0530
Message-Id: <20260318074456.2839499-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Wire struct xe_pagefault into the generic xe_usm_queue infrastructure
introduced in the previous commit.

- Use struct xe_usm_queue directly in all pagefault function signatures
  instead of keeping a xe_pagefault_queue alias; xe_device_types.h
  already declares pf_queue[] as struct xe_usm_queue.
- Replace xe_pagefault_entry_size() function with XE_PF_ENTRY_SIZE macro
  so the value is available at compile time.
- Remove xe_pagefault_queue_pop() and xe_pagefault_queue_full() wrappers;
  call xe_usm_queue_pop(), xe_usm_queue_full(), and xe_usm_queue_push()
  directly at every call site.

No behaviour change.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h    |  2 +-
 drivers/gpu/drm/xe/xe_pagefault.c       | 41 +++++--------------------
 drivers/gpu/drm/xe/xe_pagefault_types.h | 27 ++--------------
 3 files changed, 10 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 615218d775b1..b9231544e500 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -310,7 +310,7 @@ struct xe_device {
 		 */
 #define XE_PAGEFAULT_QUEUE_COUNT	4
 		/** @usm.pf_queue: Page fault queues */
-		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
+		struct xe_usm_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
 		struct drm_pagemap_shrinker *dpagemap_shrinker;
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index ea4857acf28d..67dd07927684 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -204,23 +204,6 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	return err;
 }
 
-static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
-				   struct xe_pagefault *pf)
-{
-	bool found_fault = false;
-
-	spin_lock_irq(&pf_queue->lock);
-	if (pf_queue->tail != pf_queue->head) {
-		memcpy(pf, pf_queue->data + pf_queue->tail, sizeof(*pf));
-		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
-			pf_queue->size;
-		found_fault = true;
-	}
-	spin_unlock_irq(&pf_queue->lock);
-
-	return found_fault;
-}
-
 static void xe_pagefault_print(struct xe_pagefault *pf)
 {
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
@@ -246,7 +229,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 
 static void xe_pagefault_queue_work(struct work_struct *w)
 {
-	struct xe_pagefault_queue *pf_queue =
+	struct xe_usm_queue *pf_queue =
 		container_of(w, typeof(*pf_queue), worker);
 	struct xe_pagefault pf;
 	unsigned long threshold;
@@ -254,7 +237,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 #define USM_QUEUE_MAX_RUNTIME_MS      20
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
-	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
+	while (xe_usm_queue_pop(pf_queue, &pf, sizeof(struct xe_pagefault))) {
 		int err;
 
 		if (!pf.gt)	/* Fault squashed during reset */
@@ -284,7 +267,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 }
 
 static int xe_pagefault_queue_init(struct xe_device *xe,
-				   struct xe_pagefault_queue *pf_queue)
+				   struct xe_usm_queue *pf_queue)
 {
 	struct xe_gt *gt;
 	int total_num_eus = 0;
@@ -373,7 +356,7 @@ int xe_pagefault_init(struct xe_device *xe)
 }
 
 static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
-				     struct xe_pagefault_queue *pf_queue)
+				     struct xe_usm_queue *pf_queue)
 {
 	u32 i;
 
@@ -410,14 +393,6 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
 		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
 }
 
-static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
-{
-	lockdep_assert_held(&pf_queue->lock);
-
-	return CIRC_SPACE(pf_queue->head, pf_queue->tail, pf_queue->size) <=
-		xe_pagefault_entry_size();
-}
-
 /**
  * xe_pagefault_handler() - Page fault handler
  * @xe: xe device instance
@@ -430,17 +405,15 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
  */
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
-	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
+	struct xe_usm_queue *pf_queue = xe->usm.pf_queue +
 		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
 	unsigned long flags;
 	bool full;
 
 	spin_lock_irqsave(&pf_queue->lock, flags);
-	full = xe_pagefault_queue_full(pf_queue);
+	full = xe_usm_queue_full(pf_queue, sizeof(struct xe_pagefault));
 	if (!full) {
-		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
-		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
-			pf_queue->size;
+		xe_usm_queue_push(pf_queue, pf, sizeof(struct xe_pagefault));
 		queue_work(xe->usm.pf_wq, &pf_queue->worker);
 	} else {
 		drm_warn(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index b3289219b1be..49359f643358 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -8,6 +8,8 @@
 
 #include <linux/workqueue.h>
 
+#include "xe_usm_queue.h"
+
 struct xe_gt;
 struct xe_pagefault;
 
@@ -110,29 +112,4 @@ struct xe_pagefault {
 		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
 	} producer;
 };
-
-/**
- * struct xe_pagefault_queue: Xe pagefault queue (consumer)
- *
- * Used to capture all device page faults for deferred processing. Size this
- * queue to absorb the device’s worst-case number of outstanding faults.
- */
-struct xe_pagefault_queue {
-	/**
-	 * @data: Data in queue containing struct xe_pagefault, protected by
-	 * @lock
-	 */
-	void *data;
-	/** @size: Size of queue in bytes */
-	u32 size;
-	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
-	u32 head;
-	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
-	u32 tail;
-	/** @lock: protects page fault queue */
-	spinlock_t lock;
-	/** @worker: to process page faults */
-	struct work_struct worker;
-};
-
 #endif
-- 
2.34.1

