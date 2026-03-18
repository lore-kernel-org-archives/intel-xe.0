Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564CBFCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC9010E441;
	Wed, 18 Mar 2026 07:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OatJXH7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4827610E441
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817831; x=1805353831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fGGkMH3wncc8uyfgt8FwPOeVg1MajKs7ObqISzli4lE=;
 b=OatJXH7piLVg1goqTbOPzV2ZtXN1svMMkkOUFVbgjihmQWvPluhXVfnx
 HAqVKnOVGQPomSP8XEYz5l7Eku//3JFB6GBfBNPcC/Zv074SbQxJr8mby
 FQeeZsH0/1PmWIUjPci9MSoaK/vJUSJhlrjCZU1PxnLv6b1IeiwGkgAEX
 b4r0dWg+IpKW3GtblU8r+In1BrDQQSIrrtqOoPyY5EY53/XNf1Kc7T+6x
 TCKw4bUmJh11AePPoirDfPyuaihfOF8zE3/j6X05aSdZ16tm4v5z3qWp5
 qQTOPs36Umd1ucXcQ1QdDlKKhAQrULSPOLBsolnA90M8Q5W8vxTSTXb3s A==;
X-CSE-ConnectionGUID: cO4IjdMJRFG64kwUEvH45w==
X-CSE-MsgGUID: /WzjuwVtQ5GaMpFxDF+xDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764272"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:31 -0700
X-CSE-ConnectionGUID: g7XQVLjQTwi67OIWSvRGug==
X-CSE-MsgGUID: UYlwwosKSrqIXKLDnll6ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424065"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 10/15] drm/xe/svm: Handle svm ranges on access ctr trigger
Date: Wed, 18 Mar 2026 13:14:51 +0530
Message-Id: <20260318074456.2839499-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Migrate ranges to local vram and setup pte for gpu access.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 30 ++++++-------
 drivers/gpu/drm/xe/xe_svm.c            | 59 +++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h            |  4 ++
 3 files changed, 63 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index f93618faab02..ba15f21c6803 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_engine.h"
+#include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_usm_queue.h"
 #include "xe_vm.h"
@@ -42,20 +43,14 @@ static int xe_access_counter_sub_granularity_in_byte(int val)
 	return xe_access_counter_granularity_in_byte(val) / 32;
 }
 
-static struct xe_vma *xe_access_counter_get_vma(struct xe_vm *vm,
-						struct xe_access_counter *ac)
+static u64 xe_access_counter_get_va(struct xe_access_counter *ac)
 {
-	u64 page_va;
-
-	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K) {
-		page_va = ac->consumer.va_range_base;
-	} else {
-		page_va = ac->consumer.va_range_base +
-			  (ffs(ac->consumer.sub_granularity) - 1) *
-			  xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
-	}
+	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K)
+		return ac->consumer.va_range_base;
 
-	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
+	return ac->consumer.va_range_base +
+	       (ffs(ac->consumer.sub_granularity) - 1) *
+	       xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
 }
 
 static void xe_access_counter_print(struct xe_access_counter *ac)
@@ -88,6 +83,7 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 	struct dma_fence *fence;
 	struct xe_vm *vm;
 	struct xe_vma *vma;
+	u64 page_va;
 	int err = 0;
 
 	if (ac->consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
@@ -104,7 +100,8 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 		goto unlock_vm;
 	}
 	/* Lookup VMA */
-	vma = xe_access_counter_get_vma(vm, ac);
+	page_va  = xe_access_counter_get_va(ac);
+	vma = xe_vm_find_vma_by_addr(vm, page_va);
 	if (!vma) {
 		err = -EINVAL;
 		goto unlock_vm;
@@ -112,9 +109,12 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
 
 	trace_xe_vma_acc(vma, ac->consumer.counter_type);
 
-	/* TODO: Handle svm vma's  */
-	if (xe_vma_has_no_bo(vma))
+	if (xe_vma_has_no_bo(vma)) {
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			err = xe_svm_range_setup(vm, vma, gt, page_va,
+						 false, true);
 		goto unlock_vm;
+	}
 
 	/* Lock VM and BOs dma-resv */
 	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a91c84487a67..fe0f86a2d0bf 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1186,9 +1186,9 @@ DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
 DECL_SVM_RANGE_US_STATS(bind, BIND)
 DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
 
-static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-				     struct xe_gt *gt, u64 fault_addr,
-				     bool need_vram)
+static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+				struct xe_gt *gt, u64 fault_addr,
+				bool need_vram, bool acc_ctr_trigger)
 {
 	int devmem_possible = IS_DGFX(vm->xe) &&
 		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
@@ -1196,7 +1196,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.read_only = xe_vma_read_only(vma),
 		.devmem_possible = devmem_possible,
 		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
-		.devmem_only = need_vram && devmem_possible,
+		.devmem_only = (need_vram || acc_ctr_trigger) && devmem_possible,
 		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
@@ -1213,7 +1213,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
+	if (!acc_ctr_trigger)
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
 	/* Always process UNMAPs first so view SVM ranges is current */
@@ -1229,7 +1230,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	xe_svm_range_fault_count_stats_incr(gt, range);
+	if (!acc_ctr_trigger)
+		xe_svm_range_fault_count_stats_incr(gt, range);
 
 	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
 		err = -EACCES;
@@ -1244,6 +1246,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
+	if (acc_ctr_trigger && !range->base.pages.flags.migrate_devmem) {
+		goto out;
+	}
+
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
 		ktime_t migrate_start = xe_gt_stats_ktime_get();
@@ -1307,6 +1313,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
+
 	range_debug(range, "PAGE FAULT - BIND");
 
 	bind_start = xe_gt_stats_ktime_get();
@@ -1347,21 +1354,22 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 }
 
 /**
- * xe_svm_handle_pagefault() - SVM handle page fault
+ * xe_svm_range_setup - Setup range for GPU access
  * @vm: The VM.
  * @vma: The CPU address mirror VMA.
- * @gt: The gt upon the fault occurred.
- * @fault_addr: The GPU fault address.
+ * @gt: The gt for which binding.
+ * @addr: Addr for which need to bind svm range.
  * @atomic: The fault atomic access bit.
+ * @acc_ctr_trigger: If true, always migrate to local device memory.
  *
  * Create GPU bindings for a SVM page fault. Optionally migrate to device
  * memory.
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-			    struct xe_gt *gt, u64 fault_addr,
-			    bool atomic)
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_gt *gt, u64 addr,
+		       bool atomic, bool acc_ctr_trigger)
 {
 	int need_vram, ret;
 retry:
@@ -1369,14 +1377,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (need_vram < 0)
 		return need_vram;
 
-	ret =  __xe_svm_handle_pagefault(vm, vma, gt, fault_addr,
-					 need_vram ? true : false);
+	ret =  __xe_svm_range_setup(vm, vma, gt, addr,
+				    need_vram ? true : false,
+				    acc_ctr_trigger);
 	if (ret == -EAGAIN) {
 		/*
 		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
 		 * may have been split by xe_svm_range_set_default_attr.
 		 */
-		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
+		vma = xe_vm_find_vma_by_addr(vm, addr);
 		if (!vma)
 			return -EINVAL;
 
@@ -1385,6 +1394,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	return ret;
 }
 
+/**
+ * xe_svm_handle_pagefault() - SVM handle page fault
+ * @vm: The VM.
+ * @vma: The CPU address mirror VMA.
+ * @gt: The gt upon the fault occurred.
+ * @fault_addr: The GPU fault address.
+ * @atomic: The fault atomic access bit.
+ *
+ * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * memory.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_gt *gt, u64 fault_addr,
+			    bool atomic)
+{
+	return xe_svm_range_setup(vm, vma, gt, fault_addr, atomic, false);
+}
+
 /**
  * xe_svm_has_mapping() - SVM has mappings
  * @vm: The VM.
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b7b8eeacf196..50861d93b12f 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -85,6 +85,10 @@ void xe_svm_fini(struct xe_vm *vm);
 
 void xe_svm_close(struct xe_vm *vm);
 
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_gt *gt, u64 addr,
+		       bool atomic, bool acc_ctr_trigger);
+
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic);
-- 
2.34.1

