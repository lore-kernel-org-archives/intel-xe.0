Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D22C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A01D10E16F;
	Tue,  3 Jun 2025 18:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZMFVzhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A714A10E032
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748976231; x=1780512231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IchU5i69oahzquEBR7pn+MmSx+Xog8FxcE3lTRTlV9s=;
 b=YZMFVzhdFzUwxjRIjMdH88TSeqXvjcE4aeDWA+PPHUx8vK5qEGBJJ6PB
 rTnlXp1Y0yBEVJTNJZSWNt3oXtjxSET1nI9k7B2gBdunJibe8s9SXkglb
 4MJ2hX0aoUQv+l4pRxef7pYo4oFn2zWGdDVzp7PxfEMEBwAjTTSm5ndVo
 Q7a8+aQH5AgkWPIvlp/my3NYQI+wvByWO/2ul9L83O3z15JbxZsIr5++6
 ehnI+U8Tp19AR88vYyxmzZCR24bsisFhHtmravhblVRti5C48xMZT+vmX
 Cn3NKWF98dhJmCf/hEOweTKDuBZD1/zUZbOkurzU5awmW1nSktgc3kjKB w==;
X-CSE-ConnectionGUID: PX3iLho1Qly9MPrv9Pznsw==
X-CSE-MsgGUID: VeTFxKKuQg2tYteKSgn1qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50902977"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50902977"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:51 -0700
X-CSE-ConnectionGUID: lKMP1vqIQAyFT1JAMfkk6Q==
X-CSE-MsgGUID: /ki5JeCZSeyKGOMVWwoRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145899642"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:43:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 2/2] drm/xe: Add more SVM GT stats
Date: Tue,  3 Jun 2025 11:45:22 -0700
Message-Id: <20250603184522.2218192-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603184522.2218192-1-matthew.brost@intel.com>
References: <20250603184522.2218192-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  22 +++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  22 +++
 drivers/gpu/drm/xe/xe_svm.c            | 202 ++++++++++++++++++++++++-
 3 files changed, 238 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 7e12fc3759e2..93464c9af42f 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -31,6 +31,28 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	"tlb_inval_count",
 	"vma_pagefault_count",
 	"vma_pagefault_kb",
+	"svm_4K_pagefault_count",
+	"svm_64K_pagefault_count",
+	"svm_2M_pagefault_count",
+	"svm_4K_pagefault_us",
+	"svm_64K_pagefault_us",
+	"svm_2M_pagefault_us",
+	"svm_4K_device_copy_count",
+	"svm_64K_device_copy_count",
+	"svm_2M_device_copy_count",
+	"svm_4K_migrate_us",
+	"svm_64K_migrate_us",
+	"svm_2M_migrate_us",
+	"svm_device_copy_us",
+	"svm_cpu_copy_us",
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
index be3244d7133c..2c37606d9ce4 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -11,6 +11,28 @@ enum xe_gt_stats_id {
 	XE_GT_STATS_ID_TLB_INVAL,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
+	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
+	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
+	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
+	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT,
+	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT,
+	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT,
+	XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
+	XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
+	XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
+	XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
+	XE_GT_STATS_ID_SVM_CPU_COPY_US,
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
index f27fb9b588de..c96041ba4ef2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -363,6 +363,41 @@ enum xe_svm_copy_dir {
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
+static s64 xe_svm_stats_ktime_us_delta(ktime_t start)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ?
+		ktime_us_delta(ktime_get(), start) : 0;
+}
+
+static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
+				      const enum xe_svm_copy_dir dir,
+				      ktime_t start)
+{
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+
+	if (dir == XE_SVM_COPY_TO_VRAM)
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_US,
+				 us_delta);
+	else
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_US,
+				 us_delta);
+}
+
+static ktime_t xe_svm_stats_ktime_get(void)
+{
+	return IS_ENABLED(CONFIG_DEBUG_FS) ? ktime_get() : 0;
+}
+
 static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		       unsigned long npages, const enum xe_svm_copy_dir dir)
 {
@@ -374,6 +409,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 	u64 vram_addr = XE_VRAM_ADDR_INVALID;
 	int err = 0, pos = 0;
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
+	ktime_t start = xe_svm_stats_ktime_get();
 
 	/*
 	 * This flow is complex: it locates physically contiguous device pages,
@@ -431,6 +467,9 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			int incr = (match && last) ? 1 : 0;
 
 			if (vram_addr != XE_VRAM_ADDR_INVALID) {
+				xe_svm_copy_kb_stats_incr(tile->primary_gt,
+							  dir, (i - pos + incr) *
+							  (PAGE_SIZE / SZ_1K));
 				if (sram) {
 					vm_dbg(&tile->xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
@@ -467,6 +506,8 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 			/* Extra mismatched device page, copy it */
 			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
+				xe_svm_copy_kb_stats_incr(tile->primary_gt,
+							  dir, (PAGE_SIZE / SZ_1K));
 				if (sram) {
 					vm_dbg(&tile->xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
@@ -500,6 +541,13 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		dma_fence_put(fence);
 	}
 
+	/*
+	 * XXX: We can't derive the GT here (or anywhere in this functions, but
+	 * compute always uses the primary GT so accumlate stats on the likely
+	 * GT of the fault.
+	 */
+	xe_svm_copy_us_stats_incr(tile->primary_gt, dir, start);
+
 	return err;
 #undef XE_MIGRATE_CHUNK_SIZE
 #undef XE_VRAM_ADDR_INVALID
@@ -828,6 +876,126 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return true;
 }
 
+static void xe_svm_range_fault_count_stats_incr(struct xe_gt *gt,
+						struct xe_svm_range *range)
+{
+	switch (xe_svm_range_size(range)) {
+	case SZ_4K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT, 1);
+		break;
+	case SZ_64K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT, 1);
+		break;
+	case SZ_2M:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT, 1);
+		break;
+	}
+}
+
+static void xe_svm_range_fault_copy_count_stats_incr(struct xe_gt *gt,
+						     struct xe_svm_range *range)
+{
+	switch (xe_svm_range_size(range)) {
+	case SZ_4K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_COUNT, 1);
+		break;
+	case SZ_64K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_COUNT, 1);
+		break;
+	case SZ_2M:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_COUNT, 1);
+		break;
+	}
+}
+
+static void xe_svm_range_migrate_us_stats_incr(struct xe_gt *gt,
+					       struct xe_svm_range *range,
+					       ktime_t start)
+{
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+
+	switch (xe_svm_range_size(range)) {
+	case SZ_4K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_MIGRATE_US,
+				 us_delta);
+		break;
+	case SZ_64K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_MIGRATE_US,
+				 us_delta);
+		break;
+	case SZ_2M:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_MIGRATE_US,
+				 us_delta);
+		break;
+	}
+}
+
+static void xe_svm_range_get_pages_us_stats_incr(struct xe_gt *gt,
+						 struct xe_svm_range *range,
+						 ktime_t start)
+{
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+
+	switch (xe_svm_range_size(range)) {
+	case SZ_4K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
+				 us_delta);
+		break;
+	case SZ_64K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
+				 us_delta);
+		break;
+	case SZ_2M:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
+				 us_delta);
+		break;
+	}
+}
+
+static void xe_svm_range_bind_us_stats_incr(struct xe_gt *gt,
+					    struct xe_svm_range *range,
+					    ktime_t start)
+{
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+
+	switch (xe_svm_range_size(range)) {
+	case SZ_4K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_BIND_US,
+				 us_delta);
+		break;
+	case SZ_64K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_BIND_US,
+				 us_delta);
+		break;
+	case SZ_2M:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_BIND_US,
+				 us_delta);
+		break;
+	}
+}
+
+static void xe_svm_range_fault_us_stats_incr(struct xe_gt *gt,
+					     struct xe_svm_range *range,
+					     ktime_t start)
+{
+	s64 us_delta = xe_svm_stats_ktime_us_delta(start);
+
+	switch (xe_svm_range_size(range)) {
+	case SZ_4K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US,
+				 us_delta);
+		break;
+	case SZ_64K:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US,
+				 us_delta);
+		break;
+	case SZ_2M:
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US,
+				 us_delta);
+		break;
+	}
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -863,6 +1031,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
+	ktime_t start = xe_svm_stats_ktime_get(), bind_start, get_pages_start;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -881,17 +1050,28 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
+		range_debug(range, "PAGE FAULT - VALID");
+		goto out;;
+	}
 
 	range_debug(range, "PAGE FAULT");
 
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
+		ktime_t migrate_start = xe_svm_stats_ktime_get();
+
+		xe_svm_range_fault_copy_count_stats_incr(gt, range);
+
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		xe_svm_range_migrate_us_stats_incr(gt, range, migrate_start);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
 			if (migrate_try_count || !ctx.devmem_only) {
@@ -908,6 +1088,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		}
 	}
 
+	get_pages_start = xe_svm_stats_ktime_get();
+
 	range_debug(range, "GET PAGES");
 	err = xe_svm_range_get_pages(vm, range, &ctx);
 	/* Corner where CPU mappings have changed */
@@ -927,11 +1109,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
@@ -939,7 +1123,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		drm_exec_retry_on_contention(&exec);
 		if (err) {
 			drm_exec_fini(&exec);
-			goto err_out;
+			goto out;
 		}
 
 		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
@@ -953,15 +1137,17 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			}
 			if (xe_vm_validate_should_retry(&exec, err, &end))
 				goto retry_bind;
-			goto err_out;
+			goto out;
 		}
 	}
 	drm_exec_fini(&exec);
 
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

