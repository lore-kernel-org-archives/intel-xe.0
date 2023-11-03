Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA9BC4167D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 01:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABE510E365;
	Fri,  3 Nov 2023 01:43:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854D310E365
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 01:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698975790; x=1730511790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uTsXZwC/FyCtw1urHSnrfnxZ9p9GtViC03cEN8s9W9E=;
 b=np//1M33G10WQmkF15pQkQTboEsgW86n8PrkouzvNNao3dtPGoQfYYvQ
 sLJcvZgYELZ4+SMIritKrZ/5HdM6pAXG9A1ejEvzHL2n5De1rBMf22lXz
 poYtsbWnEyS/49k2IzJ8WuRUMYmwOMlAPqOVS0O/nhqWXENW7u65DBL+C
 5025kgYWgTjMGHwkpaRMtVxcT2VnsIe10dCj2uppb4prf/oDKjRW+nJBP
 KNyPT1Rd95t9+iVdc6GYAxWNLHL5yAwo0LTZ19eFYpl3dbM91vfPkPTs9
 uqhseLOgB8Rk8JRq1rKtzTNNAckUsIbRz5mHgFm0Oo2w5+Hb9FRFwKw3G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379255538"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="379255538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 18:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="2742432"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 18:43:10 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Nov 2023 18:43:09 -0700
Message-Id: <20231103014309.13927-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
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

When processing G2H messages for pagefault or access counters, we queue a
work item and call queue_work(). This fails if the worker thread is already
queued to run.
The expectation is that the worker function will do more than process a
single item and return. It needs to either process all pending items or
requeue itself if items are pending. But requeuing will add latency and
potential context switch can occur.

We don't want to add unnecessary latency and so the worker should process
as many faults as it can within a reasonable duration of time.
We also do not want to hog the cpu core, so here we execute in a loop
and requeue if still running after more than 20 ms.
This seems reasonable framework and easy to tune this further if needed.

This resolves issues seen with several igt@xe_exec_fault_mode subtests
where the GPU will hang when KMD ignores a pending pagefault.

v2: requeue the worker instead of having an internal processing loop.
v3: implement hybrid model of v1 and v2
    now, run for 20 msec before we will requeue if still running

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 ++++++++++++++++------------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab6daebbd77c..c99af751d1fb 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -276,10 +276,10 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 
 #define PF_MSG_LEN_DW	4
 
-static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
+static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 {
 	const struct xe_guc_pagefault_desc *desc;
-	int ret = 0;
+	bool ret = false;
 
 	spin_lock_irq(&pf_queue->lock);
 	if (pf_queue->head != pf_queue->tail) {
@@ -303,8 +303,7 @@ static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 
 		pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
 			PF_QUEUE_NUM_DW;
-	} else {
-		ret = -1;
+		ret = true;
 	}
 	spin_unlock_irq(&pf_queue->lock);
 
@@ -348,6 +347,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return full ? -ENOSPC : 0;
 }
 
+#define USM_QUEUE_MAX_RUNTIME_MS	20
+
 static void pf_queue_work_func(struct work_struct *w)
 {
 	struct pf_queue *pf_queue = container_of(w, struct pf_queue, worker);
@@ -355,31 +356,37 @@ static void pf_queue_work_func(struct work_struct *w)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc_pagefault_reply reply = {};
 	struct pagefault pf = {};
+	unsigned long threshold;
 	int ret;
 
-	ret = get_pagefault(pf_queue, &pf);
-	if (ret)
-		return;
+	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
-	ret = handle_pagefault(gt, &pf);
-	if (unlikely(ret)) {
-		print_pagefault(xe, &pf);
-		pf.fault_unsuccessful = 1;
-		drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
-	}
+	while (get_pagefault(pf_queue, &pf)) {
+		ret = handle_pagefault(gt, &pf);
+		if (unlikely(ret)) {
+			print_pagefault(xe, &pf);
+			pf.fault_unsuccessful = 1;
+			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
+		}
+
+		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
+			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
+			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
+			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
+			FIELD_PREP(PFR_ASID, pf.asid);
 
-	reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
-		FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
-		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
-		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
-		FIELD_PREP(PFR_ASID, pf.asid);
+		reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
+			FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
+			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
+			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-	reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
-		FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
-		FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
-		FIELD_PREP(PFR_PDATA, pf.pdata);
+		send_pagefault_reply(&gt->uc.guc, &reply);
 
-	send_pagefault_reply(&gt->uc.guc, &reply);
+		if (time_after(jiffies, threshold)) {
+			queue_work(gt->usm.pf_wq, w);
+			break;
+		}
+	}
 }
 
 static void acc_queue_work_func(struct work_struct *w);
@@ -544,10 +551,10 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 #define ACC_MSG_LEN_DW        4
 
-static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
+static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
 {
 	const struct xe_guc_acc_desc *desc;
-	int ret = 0;
+	bool ret = false;
 
 	spin_lock(&acc_queue->lock);
 	if (acc_queue->head != acc_queue->tail) {
@@ -567,8 +574,7 @@ static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
 
 		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
 				  ACC_QUEUE_NUM_DW;
-	} else {
-		ret = -1;
+		ret = true;
 	}
 	spin_unlock(&acc_queue->lock);
 
@@ -581,16 +587,22 @@ static void acc_queue_work_func(struct work_struct *w)
 	struct xe_gt *gt = acc_queue->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct acc acc = {};
+	unsigned long threshold;
 	int ret;
 
-	ret = get_acc(acc_queue, &acc);
-	if (ret)
-		return;
+	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
-	ret = handle_acc(gt, &acc);
-	if (unlikely(ret)) {
-		print_acc(xe, &acc);
-		drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
+	while (get_acc(acc_queue, &acc)) {
+		ret = handle_acc(gt, &acc);
+		if (unlikely(ret)) {
+			print_acc(xe, &acc);
+			drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
+		}
+
+		if (time_after(jiffies, threshold)) {
+			queue_work(gt->usm.acc_wq, w);
+			break;
+		}
 	}
 }
 
-- 
2.38.0

