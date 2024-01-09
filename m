Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E9EC4707C
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5898810E48F;
	Tue,  9 Jan 2024 17:28:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B19310E48F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704821292; x=1736357292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXYyNcsD0KFQ8ahjsOVTpHrczWy6iJAieehtllmYhRU=;
 b=GYvRRfdoapXERfDijytrgDXKCPfz9RwZq42Xr677DCc0A/JmklGUCP+K
 x0Ll4YloGYltOkTTiKN+Fl9Tg04JJxr1o624lS+jxrR7ozSr8LyszDquU
 i4oVI87WgeZUEBckaPQ85M9LDWFDI8u0rOvtBM+SgNcsYRMpdgI9aIhfP
 oHC8qO/Bdw0Y4onhC8BkecttLdUDjKvjZiFK5/QLxdaR8EZxQDRkn/5rj
 9H0V1uX02bOfNvWTcOsVohPmxkFRIq9IT9XEW9Xir+F+vBXlSIc0VPq53
 5x9g0VfGqkIxqC5LVto+UOlss/e/7Gn5SLPbVbEY/HfMorB4pA57MZXWI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5624827"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5624827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="16355305"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/xe: Invert page fault queue head / tail
Date: Tue,  9 Jan 2024 09:28:36 -0800
Message-Id: <20240109172838.1376015-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109172838.1376015-1-matthew.brost@intel.com>
References: <20240109172838.1376015-1-matthew.brost@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Convention for queues in Linux is the producer moves the head and
consumer moves the tail. Fix the page fault queue to conform to this
convention.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++-------
 drivers/gpu/drm/xe/xe_gt_types.h     | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 16cea47d9e15..fdd5c47dbe37 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -282,9 +282,9 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 	bool ret = false;
 
 	spin_lock_irq(&pf_queue->lock);
-	if (pf_queue->head != pf_queue->tail) {
+	if (pf_queue->tail != pf_queue->head) {
 		desc = (const struct xe_guc_pagefault_desc *)
-			(pf_queue->data + pf_queue->head);
+			(pf_queue->data + pf_queue->tail);
 
 		pf->fault_level = FIELD_GET(PFD_FAULT_LEVEL, desc->dw0);
 		pf->trva_fault = FIELD_GET(XE2_PFD_TRVA_FAULT, desc->dw0);
@@ -302,7 +302,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 		pf->page_addr |= FIELD_GET(PFD_VIRTUAL_ADDR_LO, desc->dw2) <<
 			PFD_VIRTUAL_ADDR_LO_SHIFT;
 
-		pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
+		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
 			PF_QUEUE_NUM_DW;
 		ret = true;
 	}
@@ -315,7 +315,7 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
 {
 	lockdep_assert_held(&pf_queue->lock);
 
-	return CIRC_SPACE(pf_queue->tail, pf_queue->head, PF_QUEUE_NUM_DW) <=
+	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
 		PF_MSG_LEN_DW;
 }
 
@@ -342,8 +342,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	spin_lock_irqsave(&pf_queue->lock, flags);
 	full = pf_queue_full(pf_queue);
 	if (!full) {
-		memcpy(pf_queue->data + pf_queue->tail, msg, len * sizeof(u32));
-		pf_queue->tail = (pf_queue->tail + len) % PF_QUEUE_NUM_DW;
+		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
+		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
 	} else {
 		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
@@ -389,7 +389,7 @@ static void pf_queue_work_func(struct work_struct *w)
 		send_pagefault_reply(&gt->uc.guc, &reply);
 
 		if (time_after(jiffies, threshold) &&
-		    pf_queue->head != pf_queue->tail) {
+		    pf_queue->tail != pf_queue->head) {
 			queue_work(gt->usm.pf_wq, w);
 			break;
 		}
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..b15503dabba4 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -225,16 +225,16 @@ struct xe_gt {
 #define PF_QUEUE_NUM_DW	128
 			/** @data: data in the page fault queue */
 			u32 data[PF_QUEUE_NUM_DW];
-			/**
-			 * @head: head pointer in DWs for page fault queue,
-			 * moved by worker which processes faults.
-			 */
-			u16 head;
 			/**
 			 * @tail: tail pointer in DWs for page fault queue,
-			 * moved by G2H handler.
+			 * moved by worker which processes faults (consumer).
 			 */
 			u16 tail;
+			/**
+			 * @head: head pointer in DWs for page fault queue,
+			 * moved by G2H handler (producer).
+			 */
+			u16 head;
 			/** @lock: protects page fault queue */
 			spinlock_t lock;
 			/** @worker: to process page faults */
-- 
2.34.1

