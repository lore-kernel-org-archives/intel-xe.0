Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8931E9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 09:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEEF10E69E;
	Thu, 19 Feb 2026 09:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5CTKsgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC33410E69E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771492416; x=1803028416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TdpDNJgWYhZmKb6xc1YtfGOfWdeRQ7C9+48mjIzcR24=;
 b=G5CTKsgUp7s1BxLlsIssqCkkF8pY8dD3/8swTCYJMhuJp7S4wZRqdxXm
 ixogkwsrHJ+Tp8qhrvB5dJhHfcxjHmySO5KonZvVJUg+sjQASU+gg3VmH
 VNXdcRBBxoavXM9AE/G1UVYKlqxBxv7pjFDb518cKdFf6hd73/BSZ0pBd
 oibDMxYGK6WuH0An952vUAeVafjpmIdLsfyxBE53vkxsynKBDLrLe9fYH
 LDun05pt1v+Epb82xshAFnSiKWe5INo0c5naiW1MsyM3+GAeizLQ5Ddat
 E1JhjR6YCX1ODVmBhHxP1oxJExufN6ePhSif9XvYAKHjSt7tNEqsTL0ag g==;
X-CSE-ConnectionGUID: E983ireCQz+uGV10GNcOmw==
X-CSE-MsgGUID: fgxVbv+STyKyB1lr+SRQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72637315"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72637315"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:35 -0800
X-CSE-ConnectionGUID: vbbf1JmnQ3OosVAXBDUBjg==
X-CSE-MsgGUID: PXTyM2SMTUugG93gyL1nWQ==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:13:34 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC 6/7] drm/xe/vm: Wire MADVISE_AUTORESET notifiers into VM
 lifecycle
Date: Thu, 19 Feb 2026 14:43:11 +0530
Message-ID: <20260219091312.796749-7-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219091312.796749-1-arvind.yadav@intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Initialise the MADVISE_AUTORESET interval notifier infrastructure for
fault-mode VMs and tear it down during VM close.

The notifier callback cannot take vm->lock, so the interval notifier work
is processed from a workqueue. VM close drops vm->lock around teardown
since the worker takes vm->lock.

For the madvise ioctl, collect the cpu_addr_mirror VMA ranges under
vm->lock and register the interval notifiers after dropping vm->lock to
avoid lock ordering issues with mmap_lock.

Also skip SVM PTE zapping for cpu_addr_mirror VMAs that are still marked
CPU_AUTORESET_ACTIVE since they do not have GPU mappings yet.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        |   9 +++
 drivers/gpu/drm/xe/xe_vm.c         |  22 ++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 113 ++++++++++++++++++++++++++++-
 3 files changed, 140 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 3f09f5f6481f..8335fdc976b5 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -879,9 +879,18 @@ int xe_svm_init(struct xe_vm *vm)
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
 				      ARRAY_SIZE(fault_chunk_sizes));
+		if (err) {
+			xe_svm_put_pagemaps(vm);
+			drm_pagemap_release_owner(&vm->svm.peer);
+			return err;
+		}
+
 		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
 
+		/* Initialize madvise notifier infrastructure after gpusvm */
+		err = xe_vm_madvise_init(vm);
 		if (err) {
+			drm_gpusvm_fini(&vm->svm.gpusvm);
 			xe_svm_put_pagemaps(vm);
 			drm_pagemap_release_owner(&vm->svm.peer);
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 152ee355e5c3..00799e56d089 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -39,6 +39,7 @@
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
+#include "xe_vm_madvise.h"
 #include "xe_wa.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
@@ -1835,6 +1836,27 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	/*
+	 * xe_vm_madvise_fini() drains the madvise workqueue, and workers take vm->lock.
+	 * Drop vm->lock around madvise teardown to avoid deadlock.
+	 *
+	 * Safe since the VM is already closed, and madvise teardown prevents new work
+	 * from being queued.
+	 */
+	xe_assert(vm->xe, xe_vm_is_closed_or_banned(vm));
+	up_write(&vm->lock);
+
+	/* Teardown madvise MMU notifiers + drain workers */
+	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
+		xe_vm_madvise_fini(vm);
+
+	/*
+	 * Retake vm->lock for SVM cleanup. drm_gpusvm_fini() needs to remove
+	 * any remaining GPU SVM ranges, and drm_gpusvm_range_remove() requires
+	 * the driver lock (vm->lock) to be held.
+	 */
+	down_write(&vm->lock);
+
 	xe_svm_fini(vm);
 
 	up_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 98663707d039..32aecad31a9c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -23,6 +23,12 @@ struct xe_vmas_in_madvise_range {
 	int num_vmas;
 	bool has_bo_vmas;
 	bool has_svm_userptr_vmas;
+	bool has_cpu_addr_mirror_vmas;
+};
+
+struct xe_madvise_notifier_range {
+	u64 start;
+	u64 end;
 };
 
 /**
@@ -61,7 +67,10 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
 
 		if (xe_vma_bo(vma))
 			madvise_range->has_bo_vmas = true;
-		else if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_userptr(vma))
+		else if (xe_vma_is_cpu_addr_mirror(vma)) {
+			madvise_range->has_svm_userptr_vmas = true;
+			madvise_range->has_cpu_addr_mirror_vmas = true;
+		} else if (xe_vma_is_userptr(vma))
 			madvise_range->has_svm_userptr_vmas = true;
 
 		if (madvise_range->num_vmas == max_vmas) {
@@ -213,9 +222,19 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 			continue;
 
 		if (xe_vma_is_cpu_addr_mirror(vma)) {
-			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
-								      xe_vma_start(vma),
-								      xe_vma_end(vma));
+			/*
+			 * CPU-only VMAs (CPU_AUTORESET_ACTIVE set) have no GPU mappings yet.
+			 * Flag MUST be cleared via xe_vma_gpu_touch() before installing GPU PTEs.
+			 * Today, CPU_ADDR_MIRROR GPU PTEs are installed via the SVM fault path.
+			 * If additional paths are added (prefetch, migration, explicit bind),
+			 * they must clear CPU_AUTORESET_ACTIVE before PTE install.
+			 *
+			 * Once flag is cleared (GPU faulted), SVM handles munmap via its notifier.
+			 */
+			if (!xe_vma_has_cpu_autoreset_active(vma))
+				tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+									     xe_vma_start(vma),
+									     xe_vma_end(vma));
 		} else {
 			for_each_tile(tile, vm->xe, id) {
 				if (xe_pt_zap_ptes(tile, vma)) {
@@ -416,6 +435,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct xe_madvise_details details;
 	struct xe_vm *vm;
 	struct drm_exec exec;
+	struct xe_madvise_notifier_range *notifier_ranges = NULL;
+	int num_notifier_ranges = 0;
 	int err, attr_type;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -490,6 +511,89 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
 
+	if (err)
+		goto err_fini;
+
+	/*
+	 * Collect ranges (not VMA pointers) that need madvise notifiers.
+	 * Must be done while still holding vm->lock to safely inspect VMAs.
+	 * After releasing vm->lock, we'll register notifiers using only
+	 * the collected {start,end} ranges, avoiding UAF issues.
+	 */
+	if (madvise_range.has_cpu_addr_mirror_vmas) {
+		/* Allocate array for ranges - use kvcalloc for large counts */
+		notifier_ranges = kvcalloc(madvise_range.num_vmas,
+					   sizeof(*notifier_ranges),
+					   GFP_KERNEL);
+		if (!notifier_ranges) {
+			err = -ENOMEM;
+			goto err_fini;
+		}
+
+		/* Collect ranges for VMAs needing notifiers */
+		for (int i = 0; i < madvise_range.num_vmas; i++) {
+			struct xe_vma *vma = madvise_range.vmas[i];
+
+			if (!xe_vma_is_cpu_addr_mirror(vma))
+				continue;
+
+			/*
+			 * Only collect ranges for VMAs with MADV_AUTORESET
+			 * that are still CPU-only.
+			 */
+			if (!(vma->gpuva.flags & XE_VMA_MADV_AUTORESET))
+				continue;
+
+			if (!(vma->gpuva.flags & XE_VMA_CPU_AUTORESET_ACTIVE))
+				continue;
+
+			/* Skip duplicates (same range already collected) */
+			if (num_notifier_ranges > 0 &&
+			    notifier_ranges[num_notifier_ranges - 1].start == xe_vma_start(vma) &&
+			    notifier_ranges[num_notifier_ranges - 1].end == xe_vma_end(vma))
+				continue;
+
+			/* Save range - don't hold VMA pointer */
+			notifier_ranges[num_notifier_ranges].start = xe_vma_start(vma);
+			notifier_ranges[num_notifier_ranges].end = xe_vma_end(vma);
+			num_notifier_ranges++;
+		}
+	}
+
+	/* Normal cleanup path - all resources released properly */
+	if (madvise_range.has_bo_vmas)
+		drm_exec_fini(&exec);
+	kfree(madvise_range.vmas);
+	xe_madvise_details_fini(&details);
+	up_write(&vm->lock);
+
+	/*
+	 * Register madvise notifiers using collected ranges.
+	 * Must be done after dropping vm->lock to avoid lock ordering issues.
+	 *
+	 * Race window: munmap between lock drop and registration is acceptable.
+	 * Auto-reset is best-effort; core correctness comes from CPU_AUTORESET_ACTIVE
+	 * preventing GPU PTE zaps on CPU-only VMAs.
+	 */
+	for (int i = 0; i < num_notifier_ranges; i++) {
+		int reg_err;
+
+		reg_err = xe_vm_madvise_register_notifier_range(vm,
+								notifier_ranges[i].start,
+								notifier_ranges[i].end);
+		if (reg_err) {
+			/* Expected failures: -ENOMEM, -ENOENT (munmap race), -EINVAL */
+			if (reg_err != -ENOMEM && reg_err != -ENOENT && reg_err != -EINVAL)
+				drm_warn(&vm->xe->drm,
+					 "madvise notifier reg failed [%#llx-%#llx]: %d\n",
+					 notifier_ranges[i].start, notifier_ranges[i].end, reg_err);
+		}
+	}
+
+	kvfree(notifier_ranges);
+	xe_vm_put(vm);
+	return 0;
+
 err_fini:
 	if (madvise_range.has_bo_vmas)
 		drm_exec_fini(&exec);
@@ -499,6 +603,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	xe_madvise_details_fini(&details);
 unlock_vm:
 	up_write(&vm->lock);
+	kvfree(notifier_ranges);
 put_vm:
 	xe_vm_put(vm);
 	return err;
-- 
2.43.0

