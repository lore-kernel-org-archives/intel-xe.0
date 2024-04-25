Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C69DC25B5F
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E35112A1D;
	Sun, 28 Apr 2024 21:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Oc1nZ+Cs";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106C810FB27
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 09:35:52 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1714037745; bh=rbUmcLc92ZwF+MHY9URz4juAiugBpnW8GV9X0pgF2NU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oc1nZ+Csp+2w1p96/lURFZLQ5s04IeFUGRNfjJYD1t1EAF9VmGG1J1CLA7HmTKbeh
 8Yyl7zNVZOjR0bf7LAcmlLi37i6ALRCFLpOQTeH5hOM1HIiel0oNQTDpqAGYVzpkwj
 9x+6w6NEeI+yWgmY59YkTSzSaiedOy/kF2rq8MVPWG7eRzNADs6nD3BIVihfrpxz2P
 7Yysnp/74u78vjot4LMvuvfi0mWidhdLVq+m1gvBrp8tsWD0yTgqDAmilXa+PCtUO5
 XJF5umCafdo3OZAs/PmdT3Xp0Xt/Mow9yFnRkCTN3IFteP84jZz92fjLN+GvBv76kJ
 rzlBvn8RkSAuA==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 43P9ZehQ356497; Thu, 25 Apr 2024 12:35:40 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ofir1.bitton@intel.com
Subject: [PATCH 1/2] drm/xe: rename gt invalidation functions
Date: Thu, 25 Apr 2024 12:35:39 +0300
Message-Id: <20240425093540.356478-2-fkassabri@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425093540.356478-1-fkassabri@habana.ai>
References: <20240425093540.356478-1-fkassabri@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:33:52 +0000
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

Future products will have multi instance TLBs,
Current Xe driver handles only the compute TLBs invalidaiton
through the Guc.
In preparation for Multi instance TLB support,
we need to rename current invalidation as Guc specific
invalidation functions, and not general gt functions.
This patch just renames the current functions, files and variables.
follow up patches will start adding the multi instance TLB
support for future XE products, where each will have
its own invalidation flow.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
---
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  |  6 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  6 +-
 ...idation.c => xe_gt_guc_tlb_invalidation.c} | 72 +++++++++----------
 .../gpu/drm/xe/xe_gt_guc_tlb_invalidation.h   | 26 +++++++
 ...s.h => xe_gt_guc_tlb_invalidation_types.h} | 15 ++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  4 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |  6 +-
 drivers/gpu/drm/xe/xe_pt.c                    | 12 ++--
 drivers/gpu/drm/xe/xe_trace.h                 | 38 +++++-----
 drivers/gpu/drm/xe/xe_vm.c                    |  6 +-
 14 files changed, 115 insertions(+), 86 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation.c => xe_gt_guc_tlb_invalidation.c} (83%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
 rename drivers/gpu/drm/xe/{xe_gt_tlb_invalidation_types.h => xe_gt_guc_tlb_invalidation_types.h} (54%)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8321ec4f9b46..63e757406595 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -90,7 +90,7 @@ xe-y += xe_bb.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
 	xe_gt_throttle_sysfs.o \
-	xe_gt_tlb_invalidation.o \
+	xe_gt_guc_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 79ba98a169f9..ad4cdd5af80e 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -187,7 +187,7 @@ enum xe_guc_sleep_state_status {
 /* Flush PPC or SMRO caches along with TLB invalidation request */
 #define XE_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
 
-enum xe_guc_tlb_invalidation_type {
+enum xe_gt_guc_tlb_invalidation_type {
 	XE_GUC_TLB_INVAL_FULL = 0x0,
 	XE_GUC_TLB_INVAL_PAGE_SELECTIVE = 0x1,
 	XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX = 0x2,
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0d541f55b4fc..e0c1bfa92730 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -19,7 +19,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
@@ -252,9 +252,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	if (!gt)
 		return;
 
-	err = xe_gt_tlb_invalidation_ggtt(gt);
+	err = xe_gt_guc_tlb_invalidation_ggtt(gt);
 	if (err)
-		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
+		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_guc_tlb_invalidation_ggtt error=%d", err);
 }
 
 static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 491d0413de15..b162f10902ea 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -31,7 +31,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sysfs.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
 #include "xe_gt_topology.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_pc.h"
@@ -536,7 +536,7 @@ int xe_gt_init(struct xe_gt *gt)
 		xe_hw_fence_irq_init(&gt->fence_irq[i]);
 	}
 
-	err = xe_gt_tlb_invalidation_init(gt);
+	err = xe_gt_guc_tlb_invalidation_init(gt);
 	if (err)
 		return err;
 
@@ -659,7 +659,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
-	xe_gt_tlb_invalidation_reset(gt);
+	xe_gt_guc_tlb_invalidation_reset(gt);
 
 	err = do_gt_reset(gt);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
similarity index 83%
rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
rename to drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
index 93df2d7969b3..f994c64c95f4 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.c
@@ -3,7 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
 
 #include "abi/guc_actions_abi.h"
 #include "xe_device.h"
@@ -17,11 +17,11 @@
 
 #define TLB_TIMEOUT	(HZ / 4)
 
-static void xe_gt_tlb_fence_timeout(struct work_struct *work)
+static void xe_gt_guc_tlb_fence_timeout(struct work_struct *work)
 {
 	struct xe_gt *gt = container_of(work, struct xe_gt,
 					tlb_invalidation.fence_tdr.work);
-	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_gt_guc_tlb_invalidation_fence *fence, *next;
 
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	list_for_each_entry_safe(fence, next,
@@ -32,7 +32,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
 			break;
 
-		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
+		trace_xe_gt_guc_tlb_invalidation_fence_timeout(fence);
 		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
 			  fence->seqno, gt->tlb_invalidation.seqno_recv);
 
@@ -49,7 +49,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 }
 
 /**
- * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
+ * xe_gt_guc_tlb_invalidation_init - Initialize GT TLB invalidation state
  * @gt: graphics tile
  *
  * Initialize GT TLB invalidation state, purely software initialization, should
@@ -57,42 +57,42 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
+int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt)
 {
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 	spin_lock_init(&gt->tlb_invalidation.pending_lock);
 	spin_lock_init(&gt->tlb_invalidation.lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
-			  xe_gt_tlb_fence_timeout);
+			  xe_gt_guc_tlb_fence_timeout);
 
 	return 0;
 }
 
 static void
-__invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+__invalidation_fence_signal(struct xe_gt_guc_tlb_invalidation_fence *fence)
 {
-	trace_xe_gt_tlb_invalidation_fence_signal(fence);
+	trace_xe_gt_guc_tlb_invalidation_fence_signal(fence);
 	dma_fence_signal(&fence->base);
 	dma_fence_put(&fence->base);
 }
 
 static void
-invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+invalidation_fence_signal(struct xe_gt_guc_tlb_invalidation_fence *fence)
 {
 	list_del(&fence->link);
 	__invalidation_fence_signal(fence);
 }
 
 /**
- * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
+ * xe_gt_guc_tlb_invalidation_reset - Initialize GT TLB invalidation reset
  * @gt: graphics tile
  *
  * Signal any pending invalidation fences, should be called during a GT reset
  */
-void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
+void xe_gt_guc_tlb_invalidation_reset(struct xe_gt *gt)
 {
-	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_gt_guc_tlb_invalidation_fence *fence, *next;
 	struct xe_guc *guc = &gt->uc.guc;
 	int pending_seqno;
 
@@ -139,7 +139,7 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 }
 
 static int send_tlb_invalidation(struct xe_guc *guc,
-				 struct xe_gt_tlb_invalidation_fence *fence,
+				 struct xe_gt_guc_tlb_invalidation_fence *fence,
 				 u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -156,7 +156,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	seqno = gt->tlb_invalidation.seqno;
 	if (fence) {
 		fence->seqno = seqno;
-		trace_xe_gt_tlb_invalidation_fence_send(fence);
+		trace_xe_gt_guc_tlb_invalidation_fence_send(fence);
 	}
 	action[1] = seqno;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
@@ -202,16 +202,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		XE_GUC_TLB_INVAL_FLUSH_CACHE)
 
 /**
- * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
+ * xe_gt_guc_tlb_invalidation - Issue a TLB invalidation on this GT for the GuC
  * @gt: graphics tile
  *
  * Issue a TLB invalidation for the GuC. Completion of TLB is asynchronous and
- * caller can use seqno + xe_gt_tlb_invalidation_wait to wait for completion.
+ * caller can use seqno + xe_gt_guc_tlb_invalidation_wait to wait for completion.
  *
  * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
  * negative error code on error.
  */
-static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
+static int xe_gt_guc_tlb_invalidation(struct xe_gt *gt)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_TLB_INVALIDATION,
@@ -224,7 +224,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
+ * xe_gt_guc_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
  * @gt: graphics tile
  *
  * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
@@ -232,7 +232,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
  *
  * Return: 0 on success, negative error code on error
  */
-int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
+int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -240,11 +240,11 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 	    gt->uc.guc.submission_state.enabled) {
 		int seqno;
 
-		seqno = xe_gt_tlb_invalidation_guc(gt);
+		seqno = xe_gt_guc_tlb_invalidation(gt);
 		if (seqno <= 0)
 			return seqno;
 
-		xe_gt_tlb_invalidation_wait(gt, seqno);
+		xe_gt_guc_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_uc_enabled(xe)) {
 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
@@ -263,23 +263,23 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
- * @gt: graphics tile
+ * xe_gt_guc_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
+ * @gt: graphics technology
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion, can be NULL
  * @vma: VMA to invalidate
  *
  * Issue a range based TLB invalidation if supported, if not fallback to a full
  * TLB invalidation. Completion of TLB is asynchronous and caller can either use
- * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
+ * the invalidation fence or seqno + xe_gt_guc_tlb_invalidation_wait to wait for
  * completion.
  *
- * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
+ * Return: Seqno which can be passed to xe_gt_guc_tlb_invalidation_wait on success,
  * negative error code on error.
  */
-int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-			       struct xe_gt_tlb_invalidation_fence *fence,
-			       struct xe_vma *vma)
+int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
+				struct xe_gt_guc_tlb_invalidation_fence *fence,
+				struct xe_vma *vma)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 #define MAX_TLB_INVALIDATION_LEN	7
@@ -350,16 +350,16 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 }
 
 /**
- * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
+ * xe_gt_guc_tlb_invalidation_wait - Wait for the gt guc TLB invalidation to complete
  * @gt: graphics tile
- * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
+ * @seqno: seqno to wait which was returned from xe_gt_guc_tlb_invalidation
  *
  * Wait for 200ms for a TLB invalidation to complete, in practice we always
  * should receive the TLB invalidation within 200ms.
  *
  * Return: 0 on success, -ETIME on TLB invalidation timeout
  */
-int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
+int xe_gt_guc_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 {
 	struct xe_guc *guc = &gt->uc.guc;
 	int ret;
@@ -388,7 +388,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 }
 
 /**
- * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
+ * xe_gt_guc_tlb_invalidation_done_handler - Guc TLB invalidation done handler
  * @guc: guc
  * @msg: message indicating TLB invalidation done
  * @len: length of message
@@ -399,10 +399,10 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
  *
  * Return: 0 on success, -EPROTO for malformed messages.
  */
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+int xe_gt_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_gt_tlb_invalidation_fence *fence, *next;
+	struct xe_gt_guc_tlb_invalidation_fence *fence, *next;
 	unsigned long flags;
 
 	if (unlikely(len != 1))
@@ -438,7 +438,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
-		trace_xe_gt_tlb_invalidation_fence_recv(fence);
+		trace_xe_gt_guc_tlb_invalidation_fence_recv(fence);
 
 		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
 			break;
diff --git a/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
new file mode 100644
index 000000000000..f7402dd0bec3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_GUC_TLB_INVALIDATION_H_
+#define _XE_GT_GUC_TLB_INVALIDATION_H_
+
+#include <linux/types.h>
+
+#include "xe_gt_guc_tlb_invalidation_types.h"
+
+struct xe_gt;
+struct xe_guc;
+struct xe_vma;
+
+int xe_gt_guc_tlb_invalidation_init(struct xe_gt *gt);
+void xe_gt_guc_tlb_invalidation_reset(struct xe_gt *gt);
+int xe_gt_guc_tlb_invalidation_ggtt(struct xe_gt *gt);
+int xe_gt_guc_tlb_invalidation_vma(struct xe_gt *gt,
+				   struct xe_gt_guc_tlb_invalidation_fence *fence,
+				   struct xe_vma *vma);
+int xe_gt_guc_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
+int xe_gt_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif	/* _XE_GT_GUC_TLB_INVALIDATION_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation_types.h
similarity index 54%
rename from drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
rename to drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation_types.h
index 934c828efe31..9e3d1daa51ba 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_guc_tlb_invalidation_types.h
@@ -3,18 +3,21 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_GT_TLB_INVALIDATION_TYPES_H_
-#define _XE_GT_TLB_INVALIDATION_TYPES_H_
+#ifndef _XE_GT_GUC_TLB_INVALIDATION_TYPES_H_
+#define _XE_GT_GUC_TLB_INVALIDATION_TYPES_H_
 
 #include <linux/dma-fence.h>
 
+struct xe_vma;
+struct xe_gt;
+
 /**
- * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
+ * struct xe_gt_guc_tlb_invalidation_fence - XE GUC TLB invalidation fence
  *
- * Optionally passed to xe_gt_tlb_invalidation and will be signaled upon TLB
+ * Optionally passed to xe_gt_guc_tlb_invalidation and will be signaled upon TLB
  * invalidation completion.
  */
-struct xe_gt_tlb_invalidation_fence {
+struct xe_gt_guc_tlb_invalidation_fence {
 	/** @base: dma fence base */
 	struct dma_fence base;
 	/** @link: link into list of pending tlb fences */
@@ -25,4 +28,4 @@ struct xe_gt_tlb_invalidation_fence {
 	ktime_t invalidation_time;
 };
 
-#endif
+#endif /* _XE_GT_GUC_TLB_INVALIDATION_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index fa9e9853c53b..8c47c60f3cd3 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -15,7 +15,7 @@
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
@@ -240,7 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto retry_userptr;
 
 	if (!ret) {
-		ret = xe_gt_tlb_invalidation_vma(gt, NULL, vma);
+		ret = xe_gt_guc_tlb_invalidation_vma(gt, NULL, vma);
 		if (ret >= 0)
 			ret = 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index fbb743d80d2c..fab65b53cb24 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -8,7 +8,7 @@
 
 #include <linux/types.h>
 
-#include "xe_gt_tlb_invalidation_types.h"
+#include "xe_gt_guc_tlb_invalidation_types.h"
 
 struct xe_gt;
 struct xe_guc;
@@ -18,7 +18,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-			       struct xe_gt_tlb_invalidation_fence *fence,
+			       struct xe_gt_guc_tlb_invalidation_fence *fence,
 			       struct xe_vma *vma);
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index cfdc761ff7f4..c38e48c039e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -185,7 +185,7 @@ struct xe_gt {
 		spinlock_t pending_lock;
 		/**
 		 * @tlb_invalidation.fence_tdr: schedules a delayed call to
-		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
+		 * xe_gt_guc_tlb_fence_timeout after the timeut interval is over.
 		 */
 		struct delayed_work fence_tdr;
 		/** @tlb_invalidation.lock: protects TLB invalidation fences */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8ac819a7061e..73cbb7a8d12f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -22,7 +22,7 @@
 #include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_control.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
@@ -1050,7 +1050,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
-		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
+		ret = xe_gt_guc_tlb_invalidation_done_handler(guc, payload,
 							   adj_len);
 		break;
 	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
@@ -1184,7 +1184,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		__g2h_release_space(ct, len);
-		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
+		ret = xe_gt_guc_tlb_invalidation_done_handler(guc, payload,
 							   adj_len);
 		break;
 	default:
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5b7930f46cf3..a0f63f457342 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -10,7 +10,7 @@
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_gt.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
@@ -1073,7 +1073,7 @@ static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
 };
 
 struct invalidation_fence {
-	struct xe_gt_tlb_invalidation_fence base;
+	struct xe_gt_guc_tlb_invalidation_fence base;
 	struct xe_gt *gt;
 	struct xe_vma *vma;
 	struct dma_fence *fence;
@@ -1104,7 +1104,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 	struct invalidation_fence *ifence =
 		container_of(cb, struct invalidation_fence, cb);
 
-	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
+	trace_xe_gt_guc_tlb_invalidation_fence_cb(&ifence->base);
 	if (!ifence->fence->error) {
 		queue_work(system_wq, &ifence->work);
 	} else {
@@ -1120,8 +1120,8 @@ static void invalidation_fence_work_func(struct work_struct *w)
 	struct invalidation_fence *ifence =
 		container_of(w, struct invalidation_fence, work);
 
-	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
-	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
+	trace_xe_gt_guc_tlb_invalidation_fence_work_func(&ifence->base);
+	xe_gt_guc_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
 }
 
 static int invalidation_fence_init(struct xe_gt *gt,
@@ -1131,7 +1131,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 {
 	int ret;
 
-	trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
+	trace_xe_gt_guc_tlb_invalidation_fence_create(&ifence->base);
 
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 2d56cfc09e42..f3adde117811 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -16,18 +16,18 @@
 #include "xe_bo_types.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gpu_scheduler_types.h"
-#include "xe_gt_tlb_invalidation_types.h"
+#include "xe_gt_guc_tlb_invalidation_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
-DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
-		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DECLARE_EVENT_CLASS(xe_gt_guc_tlb_invalidation_fence,
+		    TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 		    TP_ARGS(fence),
 
 		    TP_STRUCT__entry(
-			     __field(struct xe_gt_tlb_invalidation_fence *, fence)
+			     __field(struct xe_gt_guc_tlb_invalidation_fence *, fence)
 			     __field(int, seqno)
 			     ),
 
@@ -40,39 +40,39 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 			      __entry->fence, __entry->seqno)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_create,
+	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 	     TP_ARGS(fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
-	     xe_gt_tlb_invalidation_fence_work_func,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence,
+	     xe_gt_guc_tlb_invalidation_fence_work_func,
+	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 	     TP_ARGS(fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_cb,
+	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 	     TP_ARGS(fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_send,
+	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 	     TP_ARGS(fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_recv,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_recv,
+	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 	     TP_ARGS(fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_signal,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_signal,
+	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 	     TP_ARGS(fence)
 );
 
-DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_timeout,
-	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+DEFINE_EVENT(xe_gt_guc_tlb_invalidation_fence, xe_gt_guc_tlb_invalidation_fence_timeout,
+	     TP_PROTO(struct xe_gt_guc_tlb_invalidation_fence *fence),
 	     TP_ARGS(fence)
 );
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7ae2b0300db6..965e17c640c9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -28,7 +28,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt_pagefault.h"
-#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_guc_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -3179,7 +3179,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			 * FIXME: We potentially need to invalidate multiple
 			 * GTs within the tile
 			 */
-			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
+			seqno[id] = xe_gt_guc_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
@@ -3187,7 +3187,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	for_each_tile(tile, xe, id) {
 		if (tile_needs_invalidate & BIT(id)) {
-			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
+			ret = xe_gt_guc_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.34.1

