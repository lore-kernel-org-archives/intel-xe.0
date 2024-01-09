Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0680DC4707B
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBF710E478;
	Tue,  9 Jan 2024 17:28:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DD710E0E4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704821292; x=1736357292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GAOO5scvdqSrGhNS7UPK61OS0EWl5PIJb5K/+HJSpb4=;
 b=bdSaHcp2Y3Z+ZPJ3L0bY/uTbljvTwZQVBkY/hn4nibm+gpx262N0SqoE
 2G0YpyRsdXFFL+SWVtiThDNL2WkUwD9zWk1CYmix78xSdWIig4EGljmMU
 p69Ugd7sodSRG1cZda0Rmdk1PLQ0ZDxYQ6GqsMS5jcxMrIX7ITL6u15Wv
 G9K1juVdNItTqos9af8u7Gl3sJC4OxMMSoxsb5DtaAZGACYKSPoyJ9kzF
 s44Cv22uzKJJBdbN+sxJOm4vMszidCuRDUk2bSPPILNsrHFRE0D4UdsEp
 ZyiRlOY5IF6mn/2vzHCyHkxCeT9bmySQ0mYKlX1N+vCQ3YR5ycy1DeXSt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5624829"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5624829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="16355311"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/xe: Invert access counter queue head / tail
Date: Tue,  9 Jan 2024 09:28:38 -0800
Message-Id: <20240109172838.1376015-5-matthew.brost@intel.com>
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
consumer moves the tail. Fix the access counter queue to conform to
this convention.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++-------
 drivers/gpu/drm/xe/xe_gt_types.h     | 13 +++++++------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 83a0e9a5f3a8..831254bb2e9d 100644
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

