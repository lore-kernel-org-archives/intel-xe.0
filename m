Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A04D59D86
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03A310E932;
	Fri, 12 Dec 2025 18:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqBd1f66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A2B10E92C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564135; x=1797100135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RM94dBAp13efJ3tHobRgzveRKODlEFg+K6xBGhCy9ac=;
 b=DqBd1f66KLvnTag1UvFafNXy3ZoWdyJRFJhA1IjbBtsKKqESMbun1d1s
 o4SmxLx8jQKOGthGf2coqursnuy1JbqDNkK4Z1Tu4DJ3Mj/fGi1PnHf4y
 +qgZsswtP2ekMG6SR2zZQ6pPj0Ps7YLpIxBX+Trnib2RaUHOHEEHsSPH3
 Abxay3bwhbGVUf1A5QsiIA8iNQGLvIz+dlFwZUQb0yZNFKv+nYcvkT7N6
 8H8joAhMTuly4P8i7TAVNjPuA5iPakk2zwdu4SBb6JmRMKkRq0+S47mY5
 xnBVlWbRoweX8m/V2U6+ENyG8CWD/Irmjt1IsVR7alXh5EubGiv2FgEuL w==;
X-CSE-ConnectionGUID: K/E40azoTnads5LBisLWDw==
X-CSE-MsgGUID: f8IJKJdkSWaSmBoyrIgAig==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432801"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: Pt5EzU68Rp6HHENnRydIZQ==
X-CSE-MsgGUID: r04x7kndQsWcCNWPo8R2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633955"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 6/7] drm/xe: Add GT stats ktime helpers
Date: Fri, 12 Dec 2025 10:28:46 -0800
Message-Id: <20251212182847.1683222-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
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

Normalize GT stats that record execution periods in code paths by
adding helpers to perform the ktime calculation. Use these helpers in
the SVM code.

Suggested-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.h | 33 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.c      | 29 +++++++++-------------------
 2 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
index e8aea32bc971..456782f23f39 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_STATS_H_
 #define _XE_GT_STATS_H_
 
+#include <linux/ktime.h>
+
 #include "xe_gt_stats_types.h"
 
 struct xe_gt;
@@ -21,6 +23,35 @@ xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id,
 		 int incr)
 {
 }
-
 #endif
+
+/**
+ * xe_gt_stats_ktime_us_delta() - Get delta in microseconds between now and a
+ * start time
+ * @start: Start time
+ *
+ * Helper for GT stats to get delta in microseconds between now and a start
+ * time, compiles out if GT stats are disabled.
+ *
+ * Return: Delta in microseconds between now and a start time
+ */
+static inline s64 xe_gt_stats_ktime_us_delta(ktime_t start)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ?
+		ktime_us_delta(ktime_get(), start) : 0;
+}
+
+/**
+ * xe_gt_stats_ktime_get() - Get current ktime
+ *
+ * Helper for GT stats to get current ktime, compiles out if GT stats are
+ * disabled.
+ *
+ * Return: Get current ktime
+ */
+static inline ktime_t xe_gt_stats_ktime_get(void)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 46977ec1e0de..93550c7c84ac 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -176,24 +176,13 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 						   mmu_range);
 }
 
-static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
-{
-	return IS_ENABLED(CONFIG_DEBUG_FS) ?
-		ktime_us_delta(ktime_get(), start) : 0;
-}
-
 static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
 {
-	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+	s64 us_delta = xe_gt_stats_ktime_us_delta(start);
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
 }
 
-static ktime_t xe_svm_stats_ktime_get(void)
-{
-	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
-}
-
 static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 			      struct drm_gpusvm_notifier *notifier,
 			      const struct mmu_notifier_range *mmu_range)
@@ -202,7 +191,7 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_range *r, *first;
 	struct xe_tile *tile;
-	ktime_t start = xe_svm_stats_ktime_get();
+	ktime_t start = xe_gt_stats_ktime_get();
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
 	u8 tile_mask = 0, id;
 	long err;
@@ -442,7 +431,7 @@ static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
 				      unsigned long npages,
 				      ktime_t start)
 {
-	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+	s64 us_delta = xe_gt_stats_ktime_us_delta(start);
 
 	if (dir == XE_SVM_COPY_TO_VRAM) {
 		switch (npages) {
@@ -494,7 +483,7 @@ static int xe_svm_copy(struct page **pages,
 	u64 vram_addr = XE_VRAM_ADDR_INVALID;
 	int err = 0, pos = 0;
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
-	ktime_t start = xe_svm_stats_ktime_get();
+	ktime_t start = xe_gt_stats_ktime_get();
 
 	/*
 	 * This flow is complex: it locates physically contiguous device pages,
@@ -986,7 +975,7 @@ static void xe_svm_range_##elem##_us_stats_incr(struct xe_gt *gt, \
 						struct xe_svm_range *range, \
 						ktime_t start) \
 { \
-	s64 us_delta = xe_svm_stats_ktime_us_delta(start); \
+	s64 us_delta = xe_gt_stats_ktime_us_delta(start); \
 \
 	switch (xe_svm_range_size(range)) { \
 	case SZ_4K: \
@@ -1031,7 +1020,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
-	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
+	ktime_t start = xe_gt_stats_ktime_get(), bind_start, get_pages_start;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -1070,7 +1059,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
-		ktime_t migrate_start = xe_svm_stats_ktime_get();
+		ktime_t migrate_start = xe_gt_stats_ktime_get();
 
 		/* TODO : For multi-device dpagemap will be used to find the
 		 * remote tile and remote device. Will need to modify
@@ -1107,7 +1096,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 get_pages:
-	get_pages_start = xe_svm_stats_ktime_get();
+	get_pages_start = xe_gt_stats_ktime_get();
 
 	range_debug(range, "GET PAGES");
 	err = xe_svm_range_get_pages(vm, range, &ctx);
@@ -1134,7 +1123,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
 	range_debug(range, "PAGE FAULT - BIND");
 
-	bind_start = xe_svm_stats_ktime_get();
+	bind_start = xe_gt_stats_ktime_get();
 	xe_validation_guard(&vctx, &vm->xe->val, &exec, (struct xe_val_flags) {}, err) {
 		err = xe_vm_drm_exec_lock(vm, &exec);
 		drm_exec_retry_on_contention(&exec);
-- 
2.34.1

