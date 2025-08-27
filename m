Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F6BCA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5088C10E0FA;
	Wed, 27 Aug 2025 18:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4UHM/D/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8F610E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756320238; x=1787856238;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IVtjunIe+jV7UTHuV3Wc1wVg15ghmYLnGmKvKsrd3c8=;
 b=A4UHM/D/QilVJHY9byrDWH0I1I3bMp6VvjevWud5Uwro9ln8k8wQTtih
 8IEKDMK4m9oprz7C5vaX7UpoHkUDUvrDFIiJQJeYOuPojqIELnBb+iMX4
 edNFsfkFmzK4MWvd4mcaWGzMOAcqDAspc9DHZkeXwKeNd2KCqjeVF9Zt9
 aEFjEl3AGOlAxAIQ7RIeL0Z8WYWMyORM7EtbUWxHGp7ID375SzYsCUOlM
 6Q3lbmktph8h6NWyBDXMGGds6DmFMLCKfVQXZIcXb68AcmfFnXuiiRPYk
 2Kk7i9UYum42nlDd0WvV6CLfpRMd+Vt8awvaCZhCeiPxD1uC4tfM9MGxn g==;
X-CSE-ConnectionGUID: z+tidxQiTt6GsSK7OjhjHA==
X-CSE-MsgGUID: /teYfDNyQh2ZcuKex3L0pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58730613"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58730613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:43:57 -0700
X-CSE-ConnectionGUID: kHFTu9XuTKap/WwCG/6jbg==
X-CSE-MsgGUID: mnWwSy6wQByh4yBG4N2IMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175177206"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:43:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 2/2] drm/xe: Add more SVM GT stats
Date: Wed, 27 Aug 2025 11:43:52 -0700
Message-Id: <20250827184352.175550-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827184352.175550-1-matthew.brost@intel.com>
References: <20250827184352.175550-1-matthew.brost@intel.com>
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

Add more SVM GT stats which give visibility to where time is spent in
the SVM page fault handler. Stats include number of faults at a given
size, total SVM page fault time, migration time in us, copy time in us,
copy kb, get pages time in us, and bind time in us. Will help in tuning
SVM for performance.

v2:
 - Include local changes
v3:
 - Add tlb invalidation + valid page fault + per size copy size stats
v4:
 - Ensure gt not NULL when incrementing SVM copy stats
 - Normalize stats names
 - Use magic macros to generate increment functions for ranges

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  33 +++++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++++
 drivers/gpu/drm/xe/xe_svm.c            | 196 +++++++++++++++++++++++--
 3 files changed, 253 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 7e12fc3759e2..2422577e4dee 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -29,8 +29,41 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	"svm_pagefault_count",
 	"tlb_inval_count",
+	"svm_tlb_inval_count",
+	"svm_tlb_inval_us",
 	"vma_pagefault_count",
 	"vma_pagefault_kb",
+	"svm_4K_pagefault_count",
+	"svm_64K_pagefault_count",
+	"svm_2M_pagefault_count",
+	"svm_4K_valid_pagefault_count",
+	"svm_64K_valid_pagefault_count",
+	"svm_2M_valid_pagefault_count",
+	"svm_4K_pagefault_us",
+	"svm_64K_pagefault_us",
+	"svm_2M_pagefault_us",
+	"svm_4K_migrate_count",
+	"svm_64K_migrate_count",
+	"svm_2M_migrate_count",
+	"svm_4K_migrate_us",
+	"svm_64K_migrate_us",
+	"svm_2M_migrate_us",
+	"svm_device_copy_us",
+	"svm_4K_device_copy_us",
+	"svm_64K_device_copy_us",
+	"svm_2M_device_copy_us",
+	"svm_cpu_copy_us",
+	"svm_4K_cpu_copy_us",
+	"svm_64K_cpu_copy_us",
+	"svm_2M_cpu_copy_us",
+	"svm_device_copy_kb",
+	"svm_cpu_copy_kb",
+	"svm_4K_get_pages_us",
+	"svm_64K_get_pages_us",
+	"svm_2M_get_pages_us",
+	"svm_4K_bind_us",
+	"svm_64K_bind_us",
+	"svm_2M_bind_us",
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index be3244d7133c..d8348a8de2e1 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -9,8 +9,41 @@
 enum xe_gt_stats_id {
 	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_TLB_INVAL,
+	XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT,
+	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
+	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
+	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
+	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
+	XE_GT_STATS_ID_SVM_4K_MIGRATE_COUNT,
+	XE_GT_STATS_ID_SVM_64K_MIGRATE_COUNT,
+	XE_GT_STATS_ID_SVM_2M_MIGRATE_COUNT,
+	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
+	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
+	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
+	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
+	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US,
+	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US,
+	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US,
+	XE_GT_STATS_ID_SVM_CPU_COPY_US,
+	XE_GT_STATS_ID_SVM_4K_CPU_COPY_US,
+	XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
+	XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
+	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
+	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
+	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
+	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
+	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
+	XE_GT_STATS_ID_SVM_4K_BIND_US,
+	XE_GT_STATS_ID_SVM_64K_BIND_US,
+	XE_GT_STATS_ID_SVM_2M_BIND_US,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 0596039ef0a1..7ab63e6b77b0 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -6,6 +6,7 @@
 #include <drm/drm_drv.h>
 
 #include "xe_bo.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
@@ -113,6 +114,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 		   &vm->svm.garbage_collector.work);
 }
 
+static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
+{
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT, 1);
+}
+
 static u8
 xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 				  const struct mmu_notifier_range *mmu_range,
@@ -145,13 +151,19 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	 */
 	for_each_tile(tile, xe, id)
 		if (xe_pt_zap_ptes_range(tile, vm, range)) {
-			tile_mask |= BIT(id);
 			/*
 			 * WRITE_ONCE pairs with READ_ONCE in
 			 * xe_vm_has_valid_gpu_mapping()
 			 */
 			WRITE_ONCE(range->tile_invalidated,
 				   range->tile_invalidated | BIT(id));
+
+			if (!(tile_mask & BIT(id))) {
+				xe_svm_tlb_inval_count_stats_incr(tile->primary_gt);
+				if (tile->media_gt)
+					xe_svm_tlb_inval_count_stats_incr(tile->media_gt);
+				tile_mask |= BIT(id);
+			}
 		}
 
 	return tile_mask;
@@ -171,6 +183,24 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm, struct drm_gpusvm_range *r,
 						   mmu_range);
 }
 
+static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ?
+		ktime_us_delta(ktime_get(), start) : 0;
+}
+
+static void xe_svm_tlb_inval_us_stats_incr(struct xe_gt *gt, ktime_t start)
+{
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_TLB_INVAL_US, us_delta);
+}
+
+static ktime_t xe_svm_stats_ktime_get(void)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
+}
+
 static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 			      struct drm_gpusvm_notifier *notifier,
 			      const struct mmu_notifier_range *mmu_range)
@@ -178,8 +208,10 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_range *r, *first;
+	struct xe_tile *tile;
+	ktime_t start = xe_svm_stats_ktime_get();
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
-	u8 tile_mask = 0;
+	u8 tile_mask = 0, id;
 	long err;
 
 	xe_svm_assert_in_notifier(vm);
@@ -232,6 +264,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 	r = first;
 	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
 		xe_svm_range_notifier_event_end(vm, r, mmu_range);
+	for_each_tile(tile, xe, id) {
+		if (tile_mask & BIT(id)) {
+			xe_svm_tlb_inval_us_stats_incr(tile->primary_gt, start);
+			if (tile->media_gt)
+				xe_svm_tlb_inval_us_stats_incr(tile->media_gt, start);
+		}
+	}
 }
 
 static int __xe_svm_garbage_collector(struct xe_vm *vm,
@@ -385,11 +424,66 @@ enum xe_svm_copy_dir {
 	XE_SVM_COPY_TO_SRAM,
 };
 
+static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
+				      const enum xe_svm_copy_dir dir,
+				      int kb)
+{
+	if (dir == XE_SVM_COPY_TO_VRAM)
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
+	else
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
+}
+
+static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
+				      const enum xe_svm_copy_dir dir,
+				      unsigned long npages,
+				      ktime_t start)
+{
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+
+	if (dir == XE_SVM_COPY_TO_VRAM) {
+		switch (npages) {
+		case 1:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US,
+					 us_delta);
+			break;
+		case 16:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US,
+					 us_delta);
+			break;
+		case 512:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US,
+					 us_delta);
+			break;
+		}
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
+				 us_delta);
+	} else {
+		switch (npages) {
+		case 1:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_CPU_COPY_US,
+					 us_delta);
+			break;
+		case 16:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
+					 us_delta);
+			break;
+		case 512:
+			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
+					 us_delta);
+			break;
+		}
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
+				 us_delta);
+	}
+}
+
 static int xe_svm_copy(struct page **pages,
 		       struct drm_pagemap_addr *pagemap_addr,
 		       unsigned long npages, const enum xe_svm_copy_dir dir)
 {
 	struct xe_vram_region *vr = NULL;
+	struct xe_gt *gt = NULL;
 	struct xe_device *xe;
 	struct dma_fence *fence = NULL;
 	unsigned long i;
@@ -397,6 +491,7 @@ static int xe_svm_copy(struct page **pages,
 	u64 vram_addr = XE_VRAM_ADDR_INVALID;
 	int err = 0, pos = 0;
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
+	ktime_t start = xe_svm_stats_ktime_get();
 
 	/*
 	 * This flow is complex: it locates physically contiguous device pages,
@@ -423,6 +518,7 @@ static int xe_svm_copy(struct page **pages,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
+			gt = xe_migrate_exec_queue(vr->migrate)->gt;
 			xe = vr->xe;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
@@ -462,6 +558,9 @@ static int xe_svm_copy(struct page **pages,
 			int incr = (match && last) ? 1 : 0;
 
 			if (vram_addr != XE_VRAM_ADDR_INVALID) {
+				xe_svm_copy_kb_stats_incr(gt, dir,
+							  (i - pos + incr) *
+							  (PAGE_SIZE / SZ_1K));
 				if (sram) {
 					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
@@ -500,6 +599,8 @@ static int xe_svm_copy(struct page **pages,
 
 			/* Extra mismatched device page, copy it */
 			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
+				xe_svm_copy_kb_stats_incr(gt, dir,
+							  (PAGE_SIZE / SZ_1K));
 				if (sram) {
 					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
@@ -533,6 +634,14 @@ static int xe_svm_copy(struct page **pages,
 		dma_fence_put(fence);
 	}
 
+	/*
+	 * XXX: We can't derive the GT here (or anywhere in this functions, but
+	 * compute always uses the primary GT so accumlate stats on the likely
+	 * GT of the fault.
+	 */
+	if (gt)
+		xe_svm_copy_us_stats_incr(gt, dir, npages, start);
+
 	return err;
 #undef XE_MIGRATE_CHUNK_SIZE
 #undef XE_VRAM_ADDR_INVALID
@@ -846,6 +955,57 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return true;
 }
 
+#define DECL_SVM_RANGE_COUNT_STATS(elem, stat) \
+static void xe_svm_range_##elem##_count_stats_incr(struct xe_gt *gt, \
+						   struct xe_svm_range *range) \
+{ \
+	switch (xe_svm_range_size(range)) { \
+	case SZ_4K: \
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_##stat##_COUNT, 1); \
+		break; \
+	case SZ_64K: \
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_##stat##_COUNT, 1); \
+		break; \
+	case SZ_2M: \
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_##stat##_COUNT, 1); \
+		break; \
+	} \
+} \
+
+DECL_SVM_RANGE_COUNT_STATS(fault, PAGEFAULT)
+DECL_SVM_RANGE_COUNT_STATS(valid_fault, VALID_PAGEFAULT)
+DECL_SVM_RANGE_COUNT_STATS(migrate, MIGRATE)
+
+#define DECL_SVM_RANGE_US_STATS(elem, stat) \
+static void xe_svm_range_##elem##_us_stats_incr(struct xe_gt *gt, \
+						struct xe_svm_range *range, \
+						ktime_t start) \
+{ \
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start); \
+\
+	switch (xe_svm_range_size(range)) { \
+	case SZ_4K: \
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_##stat##_US, \
+				 us_delta); \
+		break; \
+	case SZ_64K: \
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_##stat##_US, \
+				 us_delta); \
+		break; \
+	case SZ_2M: \
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_##stat##_US, \
+				 us_delta); \
+		break; \
+	} \
+} \
+
+DECL_SVM_RANGE_US_STATS(migrate, MIGRATE)
+DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
+DECL_SVM_RANGE_US_STATS(bind, BIND)
+DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
+
+
+
 static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				     struct xe_gt *gt, u64 fault_addr,
 				     bool need_vram)
@@ -867,6 +1027,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
+	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -885,23 +1046,34 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
-		return -EACCES;
+	xe_svm_range_fault_count_stats_incr(gt, range);
 
-	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
-		return 0;
+	if (ctx.devmem_only && !range->base.flags.migrate_devmem) {
+		err = -EACCES;
+		goto out;
+	}
+
+	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only)) {
+		xe_svm_range_valid_fault_count_stats_incr(gt, range);
+		range_debug(range, "PAGE FAULT - VALID");
+		goto out;
+	}
 
 	range_debug(range, "PAGE FAULT");
 
 	dpagemap = xe_vma_resolve_pagemap(vma, tile);
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
+		ktime_t migrate_start = xe_svm_stats_ktime_get();
+
 		/* TODO : For multi-device dpagemap will be used to find the
 		 * remote tile and remote device. Will need to modify
 		 * xe_svm_alloc_vram to use dpagemap for future multi-device
 		 * support.
 		 */
+		xe_svm_range_migrate_count_stats_incr(gt, range);
 		err = xe_svm_alloc_vram(tile, range, &ctx);
+		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
@@ -918,6 +1090,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		}
 	}
 
+	get_pages_start = xe_svm_stats_ktime_get();
+
 	range_debug(range, "GET PAGES");
 	err = xe_svm_range_get_pages(vm, range, &ctx);
 	/* Corner where CPU mappings have changed */
@@ -937,11 +1111,13 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
-		goto err_out;
+		goto out;
 	}
 
+	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
 	range_debug(range, "PAGE FAULT - BIND");
 
+	bind_start = xe_svm_stats_ktime_get();
 retry_bind:
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
@@ -955,14 +1131,16 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		}
 		if (xe_vm_validate_should_retry(NULL, err, &end))
 			goto retry_bind;
-		goto err_out;
+		goto out;
 	}
 	xe_vm_unlock(vm);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
+	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
 
-err_out:
+out:
+	xe_svm_range_fault_us_stats_incr(gt, range, start);
 
 	return err;
 }
-- 
2.34.1

