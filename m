Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCFEC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 22:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A4410E5D8;
	Tue, 31 Oct 2023 22:15:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E674210E5D7
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 22:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698790511; x=1730326511;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VXkl1PhZXTLxYh+r8zmNGZ+8S5kNRk/29MlqH4u8Iio=;
 b=FJGliCzbfYxZO0SHj1iQCBamdjruRn/+GNeNaO4u0TQjTD5RzjYOqDv8
 jPhyR0VIzeWJ8K6guWN5j57hl65pVcwFU/62jphswPlxkYCbwMU2hPg4h
 p7MNlx2C9pYzuK1gok4qqX6ZO+mAP7oGeKqheDEFpk253Ltk6/IbqqNqr
 9kBitoyvk9LlYMYd91aovM6fPLGNc7R7syQSwkKx6PCZn0hKdZb7XgAsA
 sLYpvaC1jWihF+kbJhsKrWDMQEep/ACBwCUJXKP+jqiVxsLqzc7ArbKNo
 TzutNctMdUJos3mqCHIQ3LfY738BcIQoLg5TO8osUe0ZQ0beLkwS8ZWkw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452674824"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="452674824"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="789926638"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="789926638"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 15:15:11 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 15:15:10 -0700
Message-Id: <20231031221510.29355-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231031221510.29355-1-brian.welty@intel.com>
References: <20231031221510.29355-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Fix pagefault and access counter
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
The expectation is that the worker function will process more than a single
item, and is updated here to continue executing until all queued work items
are handled.

This resolves issues seen with several igt@xe_exec_fault_mode subtests.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 66 +++++++++++++---------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab6daebbd77c..63fba83c0839 100644
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
 
@@ -357,29 +356,27 @@ static void pf_queue_work_func(struct work_struct *w)
 	struct pagefault pf = {};
 	int ret;
 
-	ret = get_pagefault(pf_queue, &pf);
-	if (ret)
-		return;
-
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
 
-	reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
-		FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
-		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
-		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
-		FIELD_PREP(PFR_ASID, pf.asid);
+		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
+			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
+			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
+			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
+			FIELD_PREP(PFR_ASID, pf.asid);
 
-	reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
-		FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
-		FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
-		FIELD_PREP(PFR_PDATA, pf.pdata);
+		reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
+			FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
+			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
+			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-	send_pagefault_reply(&gt->uc.guc, &reply);
+		send_pagefault_reply(&gt->uc.guc, &reply);
+	}
 }
 
 static void acc_queue_work_func(struct work_struct *w);
@@ -544,10 +541,10 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 #define ACC_MSG_LEN_DW        4
 
-static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
+static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
 {
 	const struct xe_guc_acc_desc *desc;
-	int ret = 0;
+	bool ret = false;
 
 	spin_lock(&acc_queue->lock);
 	if (acc_queue->head != acc_queue->tail) {
@@ -567,8 +564,7 @@ static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
 
 		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
 				  ACC_QUEUE_NUM_DW;
-	} else {
-		ret = -1;
+		ret = true;
 	}
 	spin_unlock(&acc_queue->lock);
 
@@ -583,14 +579,12 @@ static void acc_queue_work_func(struct work_struct *w)
 	struct acc acc = {};
 	int ret;
 
-	ret = get_acc(acc_queue, &acc);
-	if (ret)
-		return;
-
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
 	}
 }
 
-- 
2.38.0

