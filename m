Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACAC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 22:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F021A10E7DC;
	Wed,  1 Nov 2023 22:52:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCD510E7DC
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 22:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698879166; x=1730415166;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Xj7R46+Z5iJS1JX7BsGkwQNdksomqisZnZ0hpM7P5Ss=;
 b=geg04HT7JwsuAYN4LgfH72zJlodVRFhxdifswyScoq/Px00T4m6UsWeg
 JWze46lZYXigrImz6Y+6EhziMrxXaAwjT6w1yrATRoYDF/wblbHOuibn7
 7zZCO8INsLI/SDAhP8XQfPUzlcoo2aKQcEWX3ZC4+QqqZCbLHuChsgjpR
 fKfOMypQ/z3l810XqIyfLuJ8huqZ6z9hd50jXtpYCFVP7cLhU/3O7HJyo
 QzksuJlRFylDtjUgCnWy+pbN1s6t2EfLoUcUL23qiWmMonmVMycbQ+Thn
 /PhP7mKMaF2BEwELenk0DXyJ4SeolMNhEBceQIU3AQ5p7yrRBdUQxA0Z3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378985206"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="378985206"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 15:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="2238426"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 15:52:45 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 15:52:44 -0700
Message-Id: <20231101225244.3605-2-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231101225244.3605-1-brian.welty@intel.com>
References: <20231101225244.3605-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe: Fix pagefault and access counter
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
requeue itself (when items are pending) before returning.

Here, we choose to requeue the worker if faults are pending. This will
introduce some unnecessary latency, but if this is the preference, we can
start here and tune this later.

This resolves issues seen with several igt@xe_exec_fault_mode subtests
where the GPU will hang when KMD ignores a pending pagefault.

v2: requeue the worker instead of having an internal processing loop.
    Likely, we want a hybrid model which processes more than a single
    fault before requeuing.  (Matt B)

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 33 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab6daebbd77c..9b082817c877 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -276,10 +276,11 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
 
 #define PF_MSG_LEN_DW	4
 
-static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
+static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf,
+			  bool *pending)
 {
 	const struct xe_guc_pagefault_desc *desc;
-	int ret = 0;
+	bool ret = false;
 
 	spin_lock_irq(&pf_queue->lock);
 	if (pf_queue->head != pf_queue->tail) {
@@ -303,8 +304,8 @@ static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
 
 		pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
 			PF_QUEUE_NUM_DW;
-	} else {
-		ret = -1;
+		*pending = pf_queue->head != pf_queue->tail;
+		ret = true;
 	}
 	spin_unlock_irq(&pf_queue->lock);
 
@@ -355,10 +356,10 @@ static void pf_queue_work_func(struct work_struct *w)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc_pagefault_reply reply = {};
 	struct pagefault pf = {};
+	bool requeue;
 	int ret;
 
-	ret = get_pagefault(pf_queue, &pf);
-	if (ret)
+	if (!get_pagefault(pf_queue, &pf, &requeue))
 		return;
 
 	ret = handle_pagefault(gt, &pf);
@@ -380,6 +381,10 @@ static void pf_queue_work_func(struct work_struct *w)
 		FIELD_PREP(PFR_PDATA, pf.pdata);
 
 	send_pagefault_reply(&gt->uc.guc, &reply);
+
+	/* TODO: evaluate to service 'x' number of faults before requeue */
+	if (requeue)
+		queue_work(gt->usm.pf_wq, w);
 }
 
 static void acc_queue_work_func(struct work_struct *w);
@@ -544,10 +549,10 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 #define ACC_MSG_LEN_DW        4
 
-static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
+static bool get_acc(struct acc_queue *acc_queue, struct acc *acc, bool *pending)
 {
 	const struct xe_guc_acc_desc *desc;
-	int ret = 0;
+	bool ret = false;
 
 	spin_lock(&acc_queue->lock);
 	if (acc_queue->head != acc_queue->tail) {
@@ -567,8 +572,8 @@ static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
 
 		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
 				  ACC_QUEUE_NUM_DW;
-	} else {
-		ret = -1;
+		*pending = acc_queue->head != acc_queue->tail;
+		ret = true;
 	}
 	spin_unlock(&acc_queue->lock);
 
@@ -581,10 +586,10 @@ static void acc_queue_work_func(struct work_struct *w)
 	struct xe_gt *gt = acc_queue->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct acc acc = {};
+	bool requeue;
 	int ret;
 
-	ret = get_acc(acc_queue, &acc);
-	if (ret)
+	if (!get_acc(acc_queue, &acc, &requeue))
 		return;
 
 	ret = handle_acc(gt, &acc);
@@ -592,6 +597,10 @@ static void acc_queue_work_func(struct work_struct *w)
 		print_acc(xe, &acc);
 		drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
 	}
+
+	/* TODO: evaluate to service 'x' number of acc before requeue */
+	if (requeue)
+		queue_work(gt->usm.acc_wq, w);
 }
 
 static bool acc_queue_full(struct acc_queue *acc_queue)
-- 
2.38.0

