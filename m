Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2244FC4706C
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 01:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D912B10E558;
	Wed, 10 Jan 2024 01:24:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924510E563
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 01:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704849847; x=1736385847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UcM+6mm6Nv9lMYaadICkUHgOvASeUvMjr7bQUdAYJoQ=;
 b=Z208MKqumnqdU2uN+HkFjQ5W+txHhhiMEl+pTlQ87Da1CFurrveUNQmi
 KvRFfibkQagkBLastUMIl0rLB79QK61/2DVtDZfmV/Zu1/Z/t5FXxAF6E
 lwq/TcRm5pIn4tV8IsqMHCel/ANR7FE8tLzqItxufUw1mDL07y2z/6Bag
 EwwD0gOBTUDxLh0VincmtEFposXb6RtOBBNhFD3lRUkHspLU9wqyVu2I5
 XmZzl6BbNAdqEmLNik6hdmMsnKxRMHYWUg2R2oXmkvR8j0IgT9kovoX0N
 pCfIcYP+OKfNZECcnfVaDYJ/LulhLL5PcCCDfcPB95yXzd+V5VPo7s0rN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395531963"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="395531963"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955187884"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955187884"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 17:24:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 4/4] drm/xe: Invert access counter queue head / tail
Date: Tue,  9 Jan 2024 17:24:39 -0800
Message-Id: <20240110012439.1400618-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110012439.1400618-1-matthew.brost@intel.com>
References: <20240110012439.1400618-1-matthew.brost@intel.com>
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
consumer moves the tail. Fix the access counter queue to conform to
this convention.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++-------
 drivers/gpu/drm/xe/xe_gt_types.h     | 13 +++++++------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 13183088401f..5c2603075af9 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -564,9 +564,9 @@ static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
 	bool ret = false;
 
 	spin_lock(&acc_queue->lock);
-	if (acc_queue->head != acc_queue->tail) {
+	if (acc_queue->tail != acc_queue->head) {
 		desc = (const struct xe_guc_acc_desc *)
-			(acc_queue->data + acc_queue->head);
+			(acc_queue->data + acc_queue->tail);
 
 		acc->granularity = FIELD_GET(ACC_GRANULARITY, desc->dw2);
 		acc->sub_granularity = FIELD_GET(ACC_SUBG_HI, desc->dw1) << 31 |
@@ -579,7 +579,7 @@ static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
 		acc->va_range_base = make_u64(desc->dw3 & ACC_VIRTUAL_ADDR_RANGE_HI,
 					      desc->dw2 & ACC_VIRTUAL_ADDR_RANGE_LO);
 
-		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
+		acc_queue->tail = (acc_queue->tail + ACC_MSG_LEN_DW) %
 				  ACC_QUEUE_NUM_DW;
 		ret = true;
 	}
@@ -607,7 +607,7 @@ static void acc_queue_work_func(struct work_struct *w)
 		}
 
 		if (time_after(jiffies, threshold) &&
-		    acc_queue->head != acc_queue->tail) {
+		    acc_queue->tail != acc_queue->head) {
 			queue_work(gt->usm.acc_wq, w);
 			break;
 		}
@@ -618,7 +618,7 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
 {
 	lockdep_assert_held(&acc_queue->lock);
 
-	return CIRC_SPACE(acc_queue->tail, acc_queue->head, ACC_QUEUE_NUM_DW) <=
+	return CIRC_SPACE(acc_queue->head, acc_queue->tail, ACC_QUEUE_NUM_DW) <=
 		ACC_MSG_LEN_DW;
 }
 
@@ -643,9 +643,9 @@ int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	spin_lock(&acc_queue->lock);
 	full = acc_queue_full(acc_queue);
 	if (!full) {
-		memcpy(acc_queue->data + acc_queue->tail, msg,
+		memcpy(acc_queue->data + acc_queue->head, msg,
 		       len * sizeof(u32));
-		acc_queue->tail = (acc_queue->tail + len) % ACC_QUEUE_NUM_DW;
+		acc_queue->head = (acc_queue->head + len) % ACC_QUEUE_NUM_DW;
 		queue_work(gt->usm.acc_wq, &acc_queue->worker);
 	} else {
 		drm_warn(&gt_to_xe(gt)->drm, "ACC Queue full, dropping ACC");
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index b15503dabba4..047cde6cda10 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -252,15 +252,16 @@ struct xe_gt {
 			/** @data: data in the page fault queue */
 			u32 data[ACC_QUEUE_NUM_DW];
 			/**
-			 * @head: head pointer in DWs for page fault queue,
-			 * moved by worker which processes faults.
+			 * @tail: tail pointer in DWs for access counter queue,
+			 * moved by worker which processes counters
+			 * (consumer).
 			 */
-			u16 head;
+			u16 tail;
 			/**
-			 * @tail: tail pointer in DWs for page fault queue,
-			 * moved by G2H handler.
+			 * @head: head pointer in DWs for access counter queue,
+			 * moved by G2H handler (producer).
 			 */
-			u16 tail;
+			u16 head;
 			/** @lock: protects page fault queue */
 			spinlock_t lock;
 			/** @worker: to process access counters */
-- 
2.34.1

