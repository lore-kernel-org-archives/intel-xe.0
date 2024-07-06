Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0AEC3DA42
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDA110E14C;
	Sat,  6 Jul 2024 00:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2KAo5ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645A010E008
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224138; x=1751760138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jyryCS1GTm7BFRWlXIeEKUrhSmBr77cxF8qo01djOXk=;
 b=G2KAo5ieWW8WRXAPBQ/AXYvMS42CrjfftH/pAxtWIPrRJIijRDnE7LLy
 On0Nb3gCl+uZM2levmYC/XiU3Xj2RRY0ACzFT86UwbndyJCJ92++rnXJ1
 OF5YYIwqj5du/Q3EA3jqw/ffqDwwYH5IeS3R0I0X7NCtm1ou/N+mCzEW3
 /QBdHjwZxvsNHVk/j/tLw/W9jpCI3QA7+p4PXn58CNvoo134B8TYnsLf2
 gWxp13o7BKXNvkDVzBwnieEkwyUu6NtbE7OYkjfy+50M83dsinRjr50yb
 1bl2GTvlZRG613i+LdqJk+6HULvF1zZZT3JpD6e91glV8UPbYJtwOgAxk w==;
X-CSE-ConnectionGUID: v1xMxN4GRV6rUWUnlGfXdg==
X-CSE-MsgGUID: kNdKb1KKShOWJV5/GqZVqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464661"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464661"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:15 -0700
X-CSE-ConnectionGUID: N0usVdRWTT6PdlMYO8EW9w==
X-CSE-MsgGUID: ClKSNfxrS/qiyIddwe0M4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128257"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 07/11] drm/xe: Add xe_guc_tlb_invalidation layer
Date: Fri,  5 Jul 2024 17:02:48 -0700
Message-Id: <20240706000252.702044-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Move GuC specific TLB invalidation into dedicated layer.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 121 +-------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |   4 +-
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  13 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 149 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +++
 8 files changed, 192 insertions(+), 118 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 628c245c4822..21f4ddf1a946 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -83,6 +83,7 @@ xe-y += xe_bb.o \
 	xe_guc_log.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
+	xe_guc_tlb_invalidation.o \
 	xe_heci_gsc.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 172e55d8d45e..6764253f5f9a 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -7,13 +7,12 @@
 
 #include "xe_gt_tlb_invalidation.h"
 
-#include "abi/guc_actions_abi.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
-#include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_tlb_invalidation.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
@@ -85,6 +84,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	spin_lock_init(&gt->tlb_invalidation.fence_lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
+	gt->tlb_invalidation.ops = xe_guc_tlb_invalidation_get_ops(&gt->uc.guc);
 
 	return drmm_mutex_init(&gt_to_xe(gt)->drm,
 			       &gt->tlb_invalidation.seqno_lock);
@@ -157,97 +157,16 @@ static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
 	return seqno_recv >= seqno;
 }
 
-static int send_tlb_invalidation(struct xe_guc *guc, u32 *action, int len)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-
-	xe_gt_assert(gt, action[1]);	/* Seqno */
-	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
-
-	/*
-	 * XXX: The seqno algorithm relies on TLB invalidation being processed
-	 * in order which they currently are, if that changes the algorithm will
-	 * need to be updated.
-	 */
-
-	return xe_guc_ct_send(&guc->ct, action, len,
-			      G2H_LEN_DW_TLB_INVALIDATE, 1);
-}
-
-#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
-		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
-		XE_GUC_TLB_INVAL_FLUSH_CACHE)
-
 static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)
 {
-	u32 action[] = {
-		XE_GUC_ACTION_TLB_INVALIDATION,
-		seqno,
-		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
-	};
-
-	return send_tlb_invalidation(&gt->uc.guc, action, ARRAY_SIZE(action));
+	return gt->tlb_invalidation.ops->tlb_invalidation_ggtt(gt, seqno);
 }
 
 static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
 				       u32 asid, int seqno)
 {
-#define MAX_TLB_INVALIDATION_LEN	7
-	u32 action[MAX_TLB_INVALIDATION_LEN];
-	int len = 0;
-
-	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
-	action[len++] = seqno;
-	if (!gt_to_xe(gt)->info.has_range_tlb_invalidation) {
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
-	} else {
-		u64 orig_start = start;
-		u64 length = end - start;
-		u64 align;
-
-		if (length < SZ_4K)
-			length = SZ_4K;
-
-		/*
-		 * We need to invalidate a higher granularity if start address
-		 * is not aligned to length. When start is not aligned with
-		 * length we need to find the length large enough to create an
-		 * address mask covering the required range.
-		 */
-		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(start, align);
-		end = ALIGN(end, align);
-		length = align;
-		while (start + length < end) {
-			length <<= 1;
-			start = ALIGN_DOWN(orig_start, length);
-		}
-
-		/*
-		 * Minimum invalidation size for a 2MB page that the hardware
-		 * expects is 16MB
-		 */
-		if (length >= SZ_2M) {
-			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(orig_start, length);
-		}
-
-		xe_gt_assert(gt, length >= SZ_4K);
-		xe_gt_assert(gt, is_power_of_2(length));
-		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
-						    ilog2(SZ_2M) + 1)));
-		xe_gt_assert(gt, IS_ALIGNED(start, length));
-
-		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
-		action[len++] = asid;
-		action[len++] = lower_32_bits(start);
-		action[len++] = upper_32_bits(start);
-		action[len++] = ilog2(length) - ilog2(SZ_4K);
-	}
-
-	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
-
-	return send_tlb_invalidation(&gt->uc.guc, action, len);
+	return gt->tlb_invalidation.ops->tlb_invalidation_ppgtt(gt, start, end,
+								asid, seqno);
 }
 
 static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
@@ -280,10 +199,6 @@ static void xe_gt_tlb_invalidation_fence_prep(struct xe_gt *gt,
 		gt->tlb_invalidation.seqno = 1;
 }
 
-#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
-		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
-		XE_GUC_TLB_INVAL_FLUSH_CACHE)
-
 static int __xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt,
 					 struct xe_gt_tlb_invalidation_fence *fence)
 {
@@ -415,7 +330,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 					    xe_vma_vm(vma)->usm.asid);
 }
 
-static void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
+void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
@@ -464,30 +379,6 @@ static void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
 	spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
 }
 
-/**
- * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
- * @guc: guc
- * @msg: message indicating TLB invalidation done
- * @len: length of message
- *
- * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
- * invalidation fences for seqno. Algorithm for this depends on seqno being
- * received in-order and asserts this assumption.
- *
- * Return: 0 on success, -EPROTO for malformed messages.
- */
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-
-	if (unlikely(len != 1))
-		return -EPROTO;
-
-	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
-
-	return 0;
-}
-
 static const char *
 invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index cbf49b3d0265..ee532ad64aac 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -11,7 +11,6 @@
 #include "xe_gt_tlb_invalidation_types.h"
 
 struct xe_gt;
-struct xe_guc;
 struct xe_vma;
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
@@ -23,11 +22,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 				 struct xe_gt_tlb_invalidation_fence *fence,
 				 u64 start, u64 end, u32 asid);
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence);
 
+void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno);
+
 static inline void
 xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
index 934c828efe31..1abb8692d14b 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
@@ -8,6 +8,8 @@
 
 #include <linux/dma-fence.h>
 
+struct xe_gt;
+
 /**
  * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
  *
@@ -25,4 +27,15 @@ struct xe_gt_tlb_invalidation_fence {
 	ktime_t invalidation_time;
 };
 
+/**
+ * struct xe_gt_tlb_invalidation_ops - Xe GT TLB invalidation operations
+ */
+struct xe_gt_tlb_invalidation_ops {
+	/** @tlb_invalidation_ggtt: TLB invalidation GGTT */
+	int (*tlb_invalidation_ggtt)(struct xe_gt *gt, int seqno);
+	/** @tlb_invalidation_ppgtt: TLB invalidation PPGTT */
+	int (*tlb_invalidation_ppgtt)(struct xe_gt *gt, u64 start, u64 end,
+				      u32 asid, int seqno);
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index fb280f058cdc..4b9740a68457 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -169,6 +169,8 @@ struct xe_gt {
 
 	/** @tlb_invalidation: TLB invalidation state */
 	struct {
+		/** @tlb_invalidation.ops: TLB invalidation ops */
+		const struct xe_gt_tlb_invalidation_ops *ops;
 		/** @tlb_invalidation.seqno_lock: TLB invalidation seqno lock */
 		struct mutex seqno_lock;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..b09423590f62 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -23,10 +23,10 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_monitor.h"
-#include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
+#include "xe_guc_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_pm.h"
 #include "xe_trace_guc.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
new file mode 100644
index 000000000000..0931e0b56561
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "abi/guc_actions_abi.h"
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_guc.h"
+#include "xe_guc_ct.h"
+#include "xe_guc_tlb_invalidation.h"
+
+static int send_tlb_invalidation(struct xe_guc *guc, u32 *action, int len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	xe_gt_assert(gt, action[1]);	/* Seqno */
+	lockdep_assert_held(&gt->tlb_invalidation.seqno_lock);
+
+	/*
+	 * XXX: The seqno algorithm relies on TLB invalidation being processed
+	 * in order which they currently are, if that changes the algorithm will
+	 * need to be updated.
+	 */
+
+	return xe_guc_ct_send(&guc->ct, action, len,
+			      G2H_LEN_DW_TLB_INVALIDATE, 1);
+}
+
+#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
+		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
+		XE_GUC_TLB_INVAL_FLUSH_CACHE)
+
+static int send_tlb_invalidation_ggtt(struct xe_gt *gt, int seqno)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_TLB_INVALIDATION,
+		seqno,
+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
+	};
+
+	return send_tlb_invalidation(&gt->uc.guc, action, ARRAY_SIZE(action));
+}
+
+static int send_tlb_invalidation_ppgtt(struct xe_gt *gt, u64 start, u64 end,
+				       u32 asid, int seqno)
+{
+#define MAX_TLB_INVALIDATION_LEN	7
+	u32 action[MAX_TLB_INVALIDATION_LEN];
+	int len = 0;
+
+	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
+	action[len++] = seqno;
+	if (!gt_to_xe(gt)->info.has_range_tlb_invalidation) {
+		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
+	} else {
+		u64 orig_start = start;
+		u64 length = end - start;
+		u64 align;
+
+		if (length < SZ_4K)
+			length = SZ_4K;
+
+		/*
+		 * We need to invalidate a higher granularity if start address
+		 * is not aligned to length. When start is not aligned with
+		 * length we need to find the length large enough to create an
+		 * address mask covering the required range.
+		 */
+		align = roundup_pow_of_two(length);
+		start = ALIGN_DOWN(start, align);
+		end = ALIGN(end, align);
+		length = align;
+		while (start + length < end) {
+			length <<= 1;
+			start = ALIGN_DOWN(orig_start, length);
+		}
+
+		/*
+		 * Minimum invalidation size for a 2MB page that the hardware
+		 * expects is 16MB
+		 */
+		if (length >= SZ_2M) {
+			length = max_t(u64, SZ_16M, length);
+			start = ALIGN_DOWN(orig_start, length);
+		}
+
+		xe_gt_assert(gt, length >= SZ_4K);
+		xe_gt_assert(gt, is_power_of_2(length));
+		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
+						    ilog2(SZ_2M) + 1)));
+		xe_gt_assert(gt, IS_ALIGNED(start, length));
+
+		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
+		action[len++] = asid;
+		action[len++] = lower_32_bits(start);
+		action[len++] = upper_32_bits(start);
+		action[len++] = ilog2(length) - ilog2(SZ_4K);
+	}
+
+	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
+
+	return send_tlb_invalidation(&gt->uc.guc, action, len);
+}
+
+static const struct xe_gt_tlb_invalidation_ops guc_tlb_invalidation_ops = {
+	.tlb_invalidation_ppgtt = send_tlb_invalidation_ppgtt,
+	.tlb_invalidation_ggtt = send_tlb_invalidation_ggtt,
+};
+
+/**
+ * xe_guc_tlb_invalidation_get_ops - Get Guc TLB invalidation ops
+ * @guc: guc
+ *
+ * Return: xe_gt_tlb_invalidation_ops for GuC TLB invalidation
+ */
+const struct xe_gt_tlb_invalidation_ops*
+xe_guc_tlb_invalidation_get_ops(struct xe_guc *guc)
+{
+	return &guc_tlb_invalidation_ops;
+}
+
+/**
+ * xe_guc_tlb_invalidation_done_handler - GuC TLB invalidation done handler
+ * @guc: guc
+ * @msg: message indicating TLB invalidation done
+ * @len: length of message
+ *
+ * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
+ * invalidation fences for seqno. Algorithm for this depends on seqno being
+ * received in-order and asserts this assumption.
+ *
+ * Return: 0 on success, -EPROTO for malformed messages.
+ */
+int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (unlikely(len != 1))
+		return -EPROTO;
+
+	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
new file mode 100644
index 000000000000..44408aae6955
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GUC_TLB_INVALIDATION_H_
+#define _XE_GUC_TLB_INVALIDATION_H_
+
+struct xe_guc;
+
+#include <linux/types.h>
+
+const struct xe_gt_tlb_invalidation_ops*
+xe_guc_tlb_invalidation_get_ops(struct xe_guc *guc);
+
+int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif	/* _XE_GUC_TLB_INVALIDATION_H_ */
-- 
2.34.1

