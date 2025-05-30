Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630FCC5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 16:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CE510E7F8;
	Fri, 30 May 2025 16:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECVXPzrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31F510E7F8
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748623752; x=1780159752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kQrFO3Bq0cR8vSRnNH0vAcTFkv4+ur+/JRWSH0Sm6Sg=;
 b=ECVXPzrQPn1lIlTZkH33Yn4fuitMO5LOhII8ST87oieLZQi30FFOMtYa
 U6BwEC1B7rssF98wKw3GhjdC3HccsPy0spZ3V8tJcDrfULm1a++9k1h++
 ZKdcc/+Z3PJftznbibsb3Kg0vYKtuzsR1pwsIf3OpVppIo9AWG3IMiird
 1M8Sh82DH+CDwowZ/LcB5FkKYGwkTiv6EpDqIlGwy6fY8t4QyZ3POa4VP
 9cxXz34jbSDKYm2kZAPncwf4ld4ciFwE39fbEQZ+NHkpgFp8MW2gFmlWc
 jZaP5tYfU89fzdIBvvUdiGG8EgTsFTQjPAkCmU7ppbUQqbvp2CH6jj7FF A==;
X-CSE-ConnectionGUID: K2b0PdI2TJSiGjJ89SLmLw==
X-CSE-MsgGUID: 7l5WpCD3Q+CPXbEFLnIPZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50824466"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50824466"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 09:49:06 -0700
X-CSE-ConnectionGUID: mKqk0WDsR/uJTQBImzV+wA==
X-CSE-MsgGUID: t/xdzgTES6ytN9jaNsssIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="143955657"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 09:49:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Convert page fault messages to be GT-oriented
Date: Fri, 30 May 2025 18:48:35 +0200
Message-Id: <20250530164835.461-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We are processing here G2H messages, so we should use GT oriented
messages to retain information about the origin GT.  While at it,
print error codes in a user-friendly way.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 74 ++++++++++++++--------------
 1 file changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 7a8f87709e39..e0e68eda82bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -14,6 +14,7 @@
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
@@ -244,22 +245,22 @@ static int send_pagefault_reply(struct xe_guc *guc,
 	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
-static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
+static void print_pagefault(struct xe_gt *gt, struct pagefault *pf)
 {
-	drm_dbg(&xe->drm, "\n\tASID: %d\n"
-		 "\tVFID: %d\n"
-		 "\tPDATA: 0x%04x\n"
-		 "\tFaulted Address: 0x%08x%08x\n"
-		 "\tFaultType: %d\n"
-		 "\tAccessType: %d\n"
-		 "\tFaultLevel: %d\n"
-		 "\tEngineClass: %d %s\n"
-		 "\tEngineInstance: %d\n",
-		 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
-		 lower_32_bits(pf->page_addr),
-		 pf->fault_type, pf->access_type, pf->fault_level,
-		 pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
-		 pf->engine_instance);
+	xe_gt_dbg(gt, "\n\tASID: %d\n"
+		  "\tVFID: %d\n"
+		  "\tPDATA: 0x%04x\n"
+		  "\tFaulted Address: 0x%08x%08x\n"
+		  "\tFaultType: %d\n"
+		  "\tAccessType: %d\n"
+		  "\tFaultLevel: %d\n"
+		  "\tEngineClass: %d %s\n"
+		  "\tEngineInstance: %d\n",
+		  pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
+		  lower_32_bits(pf->page_addr),
+		  pf->fault_type, pf->access_type, pf->fault_level,
+		  pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
+		  pf->engine_instance);
 }
 
 #define PF_MSG_LEN_DW	4
@@ -311,7 +312,6 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
 int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = gt_to_xe(gt);
 	struct pf_queue *pf_queue;
 	unsigned long flags;
 	u32 asid;
@@ -336,7 +336,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 			pf_queue->num_dw;
 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
 	} else {
-		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
+		xe_gt_warn(gt, "PageFault Queue full, shouldn't be possible\n");
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
@@ -349,7 +349,6 @@ static void pf_queue_work_func(struct work_struct *w)
 {
 	struct pf_queue *pf_queue = container_of(w, struct pf_queue, worker);
 	struct xe_gt *gt = pf_queue->gt;
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc_pagefault_reply reply = {};
 	struct pagefault pf = {};
 	unsigned long threshold;
@@ -360,9 +359,9 @@ static void pf_queue_work_func(struct work_struct *w)
 	while (get_pagefault(pf_queue, &pf)) {
 		ret = handle_pagefault(gt, &pf);
 		if (unlikely(ret)) {
-			print_pagefault(xe, &pf);
+			print_pagefault(gt, &pf);
 			pf.fault_unsuccessful = 1;
-			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
+			xe_gt_dbg(gt, "Fault response: Unsuccessful %pe\n", ERR_PTR(ret));
 		}
 
 		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
@@ -515,21 +514,21 @@ static int sub_granularity_in_byte(int val)
 	return (granularity_in_byte(val) / 32);
 }
 
-static void print_acc(struct xe_device *xe, struct acc *acc)
+static void print_acc(struct xe_gt *gt, struct acc *acc)
 {
-	drm_warn(&xe->drm, "Access counter request:\n"
-		 "\tType: %s\n"
-		 "\tASID: %d\n"
-		 "\tVFID: %d\n"
-		 "\tEngine: %d:%d\n"
-		 "\tGranularity: 0x%x KB Region/ %d KB sub-granularity\n"
-		 "\tSub_Granularity Vector: 0x%08x\n"
-		 "\tVA Range base: 0x%016llx\n",
-		 acc->access_type ? "AC_NTFY_VAL" : "AC_TRIG_VAL",
-		 acc->asid, acc->vfid, acc->engine_class, acc->engine_instance,
-		 granularity_in_byte(acc->granularity) / SZ_1K,
-		 sub_granularity_in_byte(acc->granularity) / SZ_1K,
-		 acc->sub_granularity, acc->va_range_base);
+	xe_gt_warn(gt, "Access counter request:\n"
+		   "\tType: %s\n"
+		   "\tASID: %d\n"
+		   "\tVFID: %d\n"
+		   "\tEngine: %d:%d\n"
+		   "\tGranularity: 0x%x KB Region/ %d KB sub-granularity\n"
+		   "\tSub_Granularity Vector: 0x%08x\n"
+		   "\tVA Range base: 0x%016llx\n",
+		   acc->access_type ? "AC_NTFY_VAL" : "AC_TRIG_VAL",
+		   acc->asid, acc->vfid, acc->engine_class, acc->engine_instance,
+		   granularity_in_byte(acc->granularity) / SZ_1K,
+		   sub_granularity_in_byte(acc->granularity) / SZ_1K,
+		   acc->sub_granularity, acc->va_range_base);
 }
 
 static struct xe_vma *get_acc_vma(struct xe_vm *vm, struct acc *acc)
@@ -627,7 +626,6 @@ static void acc_queue_work_func(struct work_struct *w)
 {
 	struct acc_queue *acc_queue = container_of(w, struct acc_queue, worker);
 	struct xe_gt *gt = acc_queue->gt;
-	struct xe_device *xe = gt_to_xe(gt);
 	struct acc acc = {};
 	unsigned long threshold;
 	int ret;
@@ -637,8 +635,8 @@ static void acc_queue_work_func(struct work_struct *w)
 	while (get_acc(acc_queue, &acc)) {
 		ret = handle_acc(gt, &acc);
 		if (unlikely(ret)) {
-			print_acc(xe, &acc);
-			drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
+			print_acc(gt, &acc);
+			xe_gt_warn(gt, "ACC: Unsuccessful %pe\n", ERR_PTR(ret));
 		}
 
 		if (time_after(jiffies, threshold) &&
@@ -683,7 +681,7 @@ int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		acc_queue->head = (acc_queue->head + len) % ACC_QUEUE_NUM_DW;
 		queue_work(gt->usm.acc_wq, &acc_queue->worker);
 	} else {
-		drm_warn(&gt_to_xe(gt)->drm, "ACC Queue full, dropping ACC");
+		xe_gt_warn(gt, "ACC Queue full, dropping ACC\n");
 	}
 	spin_unlock(&acc_queue->lock);
 
-- 
2.47.1

