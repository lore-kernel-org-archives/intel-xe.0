Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDFCC79FBE
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1A10F112;
	Wed,  9 Sep 2026 12:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3+5OXIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6DB10F0FA
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957727; x=1820493727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBvd2Otkeecdu39qbz7Ull5eWCKabU5lU0yKPbSftq8=;
 b=J3+5OXIAkQAZttOMJhESlSoEnAac0uURCmwYW9MfxVaGyZMLTKe2wb53
 MENvfE+e4LcZqnyWVJ5SvHIGtyU8PVg/tVwIXaRPTgBOSkGJGHPaQfY5h
 BZv4bxUfN3cyHT7lzgQ5iYeaVjeLZ3hTyR/nGCLnHQYoKt6Gi2rWnvLK5
 kLbcvj7JwwXFxIrnuJW4JAmfph/XCXtXvHasdX/FHROMo+PqsT+8ObhcP
 NriGh0oA+sIAuPn0MQwBbIu6S7nMAMAJumn3Kl6d9Y8qx5VjA+ijPXjN2
 AQgyA+UJvCCPUnTtflM5xlU+05DIgH6nBQNRd7S+TzKuW37bKWF6nuQiB Q==;
X-CSE-ConnectionGUID: Iw9dTijISga0TKuwbZiFFg==
X-CSE-MsgGUID: KCFitwaxT764zR7nXleMfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715548"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715548"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:06 -0700
X-CSE-ConnectionGUID: CDP+azY6SpqkWWLJRnWSgA==
X-CSE-MsgGUID: GuYd4inHRduXfDasa8v7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246633"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:05 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 11/21] drm/xe/svm: Handle svm vma for acc_ctr trigger
Date: Wed,  9 Sep 2026 18:15:05 +0530
Message-ID: <20260909124457.1610890-34-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

The SVM range binding logic in __xe_svm_handle_pagefault() is currently
reachable only from the page-fault path. Access counter handling needs
the same "look up / create a range, optionally migrate to VRAM, and bind"
flow, but driven by a hardware access-counter trigger instead of a fault.

Generalize __xe_svm_handle_pagefault() into __xe_svm_range_setup() and
expose it through a new xe_svm_range_setup() wrapper that takes a
struct xe_svm_range_setup_flags {atomic, acc_ctr_trigger}. The existing
xe_svm_handle_pagefault() becomes a thin wrapper that passes
acc_ctr_trigger = false, so the page-fault path is functionally unchanged.

When invoked for an access-counter trigger (acc_ctr_trigger = true):

- Migration to device memory is forced (devmem_only), since the whole
  point of the trigger is to pull a hot range into VRAM.
- If the range cannot be migrated to devmem (!migrate_devmem), the setup
  bails out early -- there is nothing useful to do for a non-migratable
  range on an advisory trigger.
- Page-fault-specific bookkeeping is skipped: SVM pagefault stats are not
  incremented and the immediate-ack start/end address hints are not set,
  because there is no fault to ack.

Also add xe_svm_range_find_first(), which returns the first already
existing SVM range overlapping a [start, end) window without creating a
new one (unlike find_or_insert). Access counter servicing uses it to walk
only ranges the GPU has actually touched within a granularity window.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 120 +++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h |  14 +++++
 2 files changed, 111 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 627a741293d5..75da11c3bbb2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1264,9 +1264,10 @@ DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
 DECL_SVM_RANGE_US_STATS(bind, BIND)
 DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
 
-static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-				     struct xe_pagefault *pf, struct xe_gt *gt,
-				     u64 fault_addr, bool need_vram)
+static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+				struct xe_pagefault *pf, struct xe_gt *gt,
+				u64 fault_addr, bool need_vram,
+				bool acc_ctr_trigger)
 {
 	int devmem_possible = IS_DGFX(vm->xe) &&
 		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
@@ -1274,7 +1275,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.read_only = xe_vma_read_only(vma),
 		.devmem_possible = devmem_possible,
 		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
-		.devmem_only = need_vram && devmem_possible,
+		.devmem_only = (need_vram || acc_ctr_trigger) && devmem_possible,
 		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
@@ -1292,7 +1293,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
+	if (!acc_ctr_trigger)
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
 	/* Release old range */
@@ -1314,7 +1316,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	xe_svm_range_fault_count_stats_incr(gt, range);
+	if (!acc_ctr_trigger)
+		xe_svm_range_fault_count_stats_incr(gt, range);
 
 	mutex_lock(&range->lock);
 
@@ -1336,6 +1339,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
+	if (acc_ctr_trigger && !range_flags.migrate_devmem) {
+		goto out;
+	}
+
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
 		ktime_t migrate_start = xe_gt_stats_ktime_get();
@@ -1399,6 +1406,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
+
 	range_debug(range, "PAGE FAULT - BIND");
 
 	bind_start = xe_gt_stats_ktime_get();
@@ -1425,11 +1433,12 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	xe_svm_range_bind_us_stats_incr(gt, range, bind_start);
 
 out:
-	/* Give hint to immediately ack faults */
-	xe_pagefault_set_start_addr(pf,  xe_svm_range_start(range));
-	xe_pagefault_set_end_addr(pf, xe_svm_range_end(range));
-
-	xe_svm_range_fault_us_stats_incr(gt, range, start);
+	if (!acc_ctr_trigger) {
+		/* Give hint to immediately ack faults */
+		xe_pagefault_set_start_addr(pf,  xe_svm_range_start(range));
+		xe_pagefault_set_end_addr(pf, xe_svm_range_end(range));
+		xe_svm_range_fault_us_stats_incr(gt, range, start);
+	}
 	mutex_unlock(&range->lock);
 	drm_gpusvm_range_put(&range->base);
 	return 0;
@@ -1448,37 +1457,38 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 }
 
 /**
- * xe_svm_handle_pagefault() - SVM handle page fault
+ * xe_svm_range_setup - Setup range for GPU access
  * @vm: The VM.
  * @vma: The CPU address mirror VMA.
  * @pf: Pagefault structure
- * @gt: The gt upon the fault occurred.
- * @fault_addr: The GPU fault address.
- * @atomic: The fault atomic access bit.
+ * @gt: The gt for which binding.
+ * @addr: Addr for which need to bind svm range.
+ * @flags: struct xe_svm_range_setup_flags
  *
- * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * Create GPU bindings for a SVM vma. Optionally migrate to device
  * memory.
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-			    struct xe_pagefault *pf, struct xe_gt *gt,
-			    u64 fault_addr, bool atomic)
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_pagefault *pf, struct xe_gt *gt,
+		       u64 addr, struct xe_svm_range_setup_flags flags)
 {
 	int need_vram, ret;
 retry:
-	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, flags.atomic);
 	if (need_vram < 0)
 		return need_vram;
 
-	ret =  __xe_svm_handle_pagefault(vm, vma, pf, gt, fault_addr,
-					 need_vram ? true : false);
+	ret =  __xe_svm_range_setup(vm, vma, pf, gt, addr,
+				    need_vram ? true : false,
+				    flags.acc_ctr_trigger);
 	if (ret == -EAGAIN) {
 		/*
 		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
 		 * may have been split by xe_svm_range_set_default_attr.
 		 */
-		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
+		vma = xe_vm_find_vma_by_addr(vm, addr);
 		if (!vma)
 			return -EINVAL;
 
@@ -1487,6 +1497,70 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	return ret;
 }
 
+/**
+ * xe_svm_handle_pagefault() - SVM handle page fault
+ * @vm: The VM.
+ * @vma: The CPU address mirror VMA.
+ * @pf: Pagefault structure.
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
+			    struct xe_pagefault *pf, struct xe_gt *gt,
+			    u64 fault_addr, bool atomic)
+{
+	return xe_svm_range_setup(vm, vma, pf, gt, fault_addr,
+				  (struct xe_svm_range_setup_flags) {
+					.atomic = atomic,
+					.acc_ctr_trigger = false,
+				  });
+}
+
+/**
+ * xe_svm_range_find_first() - Find first existing SVM range in a VA window
+ * @vm: The VM.
+ * @start: Start of the VA window.
+ * @end: End (exclusive) of the VA window.
+ *
+ * Returns the first already-existing SVM range whose address overlaps
+ * [start, end), skipping holes natively via the interval tree.  Does NOT
+ * create a new range if none exists (unlike xe_svm_range_find_or_insert).
+ *
+ * May be called with vm->lock held in read mode; range_lock is taken to guard
+ * the interval-tree walk against concurrent insert/remove.
+ *
+ * Return: Referenced pointer to the range (drop with xe_svm_range_put()), or
+ * NULL if no range exists in the window.
+ */
+struct xe_svm_range *xe_svm_range_find_first(struct xe_vm *vm,
+					     u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier;
+
+	lockdep_assert_held(&vm->lock);
+
+	guard(mutex)(&vm->svm.range_lock);
+
+	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
+		u64 n_end = min_t(u64, end, drm_gpusvm_notifier_end(notifier));
+		struct drm_gpusvm_range *r;
+
+		r = drm_gpusvm_range_find(notifier, start, n_end);
+		if (r) {
+			drm_gpusvm_range_get(r);
+			return to_xe_range(r);
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * xe_svm_has_mapping() - SVM has mappings
  * @vm: The VM.
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 2a0dc0d125c9..99baeae041df 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -28,6 +28,14 @@ struct xe_vm;
 struct xe_vma;
 struct xe_vram_region;
 
+/** struct xe_svm_range_setup_flags -flags for range setup */
+struct xe_svm_range_setup_flags {
+	/** @atomic: is atomic access */
+	u32 atomic : 1;
+	/** @acc_ctr_trigger: is called by access ctr trigger */
+	u32 acc_ctr_trigger : 1;
+};
+
 /** struct xe_svm_range - SVM range */
 struct xe_svm_range {
 	/** @base: base drm_gpusvm_range */
@@ -109,6 +117,12 @@ void xe_svm_fini(struct xe_vm *vm);
 
 void xe_svm_close(struct xe_vm *vm);
 
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_pagefault *pf, struct xe_gt *gt,
+		       u64 addr, struct xe_svm_range_setup_flags flags);
+
+struct xe_svm_range *xe_svm_range_find_first(struct xe_vm *vm, u64 start, u64 end);
+
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_pagefault *pf, struct xe_gt *gt,
 			    u64 fault_addr, bool atomic);
-- 
2.43.0

