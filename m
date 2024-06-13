Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3313C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387FE10EABA;
	Thu, 13 Jun 2024 15:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHa8xNaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FC210EAB4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718292045; x=1749828045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TajEtUxwMzchJzkv8Dh0EbEq8/NTMV44ZOLjIAhj0rU=;
 b=lHa8xNaEcaj//ugCLDDbIhTyyMBc9RhQJtTEXZGSFvbJqsOPRs6vQS2H
 syG/sFwv9uhqqrOmjlSc8wkwUdJ5Y5TOBfeq4ZHgcIjaVHIRtINIF3slP
 dj/Dx2YTlVGMXTuegPcX4pIGHy+n+Mi/XMIomZt4lwLOrNtdHYRaMX2ep
 /F4yPxdv2FbJ48lgOiW/8pADaGVqUJ4pM7b2BUKAU8sjPOs/3L6MdRpoP
 hWaTdBcTKSmD7ZWIdJFdFVu760Y/5gdZkE2ak4vR5ruNMtcqebbJt9lmw
 gvBlT9p012+DG8+GgDCWnu2pUJ/NTyHVQRAYHMYg7f9O+akb4ZZKbrUkS Q==;
X-CSE-ConnectionGUID: V4OQPI6kSY2UHJuXM+Mckw==
X-CSE-MsgGUID: KlxhTIQdRfyWY6dlGmSVug==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348657"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15348657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:42 -0700
X-CSE-ConnectionGUID: itB9DjNGQ1+6oZGytDQD+Q==
X-CSE-MsgGUID: iqf6TGLGRvGpCPWO501Peg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40135113"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 08:20:42 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 25/42] drm/xe: use drm_hmmptr in xe
Date: Thu, 13 Jun 2024 11:31:11 -0400
Message-Id: <20240613153128.681864-25-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613153128.681864-1-oak.zeng@intel.com>
References: <20240613153128.681864-1-oak.zeng@intel.com>
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

drm_hmmptr was created to move some userptr and svm logic
such as mmu notifier registration, range population etc
to drm layer, so those logic can be shared b/t vendor
drivers.

This patch apply the drm_hmmptr to xekmd driver. drm_hmmptr
is the parent class of xe_userptr.

Most of the changes are straight forward, such as some
xe_userptr members are now moved to drm_hmmptr. Since
drm_hmmptr doesn't use scatter-gather table for dma
address anymore, we changed to the dma-address cursor
from the sg cursor during page table building.

xe_hmm.c and xe_hmm.h are removed, as the logic is
now moved to drm_svm.c

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Krishna Bommu <krishnaiah.bommu@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |   2 -
 drivers/gpu/drm/xe/xe_hmm.c      | 253 -------------------------------
 drivers/gpu/drm/xe/xe_hmm.h      |  11 --
 drivers/gpu/drm/xe/xe_pt.c       |  10 +-
 drivers/gpu/drm/xe/xe_vm.c       |  89 ++++++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  11 +-
 6 files changed, 71 insertions(+), 305 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 2e7c94510ace..6457f1b74cd8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -128,8 +128,6 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
-xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
-
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
deleted file mode 100644
index 2c32dc46f7d4..000000000000
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ /dev/null
@@ -1,253 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2024 Intel Corporation
- */
-
-#include <linux/scatterlist.h>
-#include <linux/mmu_notifier.h>
-#include <linux/dma-mapping.h>
-#include <linux/memremap.h>
-#include <linux/swap.h>
-#include <linux/hmm.h>
-#include <linux/mm.h>
-#include "xe_hmm.h"
-#include "xe_vm.h"
-#include "xe_bo.h"
-
-static u64 xe_npages_in_range(unsigned long start, unsigned long end)
-{
-	return (end - start) >> PAGE_SHIFT;
-}
-
-/*
- * xe_mark_range_accessed() - mark a range is accessed, so core mm
- * have such information for memory eviction or write back to
- * hard disk
- *
- * @range: the range to mark
- * @write: if write to this range, we mark pages in this range
- * as dirty
- */
-static void xe_mark_range_accessed(struct hmm_range *range, bool write)
-{
-	struct page *page;
-	u64 i, npages;
-
-	npages = xe_npages_in_range(range->start, range->end);
-	for (i = 0; i < npages; i++) {
-		page = hmm_pfn_to_page(range->hmm_pfns[i]);
-		if (write)
-			set_page_dirty_lock(page);
-
-		mark_page_accessed(page);
-	}
-}
-
-/*
- * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
- * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
- * and will be used to program GPU page table later.
- *
- * @xe: the xe device who will access the dma-address in sg table
- * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
- * has the pfn numbers of pages that back up this hmm address range.
- * @st: pointer to the sg table.
- * @write: whether we write to this range. This decides dma map direction
- * for system pages. If write we map it bi-diretional; otherwise
- * DMA_TO_DEVICE
- *
- * All the contiguous pfns will be collapsed into one entry in
- * the scatter gather table. This is for the purpose of efficiently
- * programming GPU page table.
- *
- * The dma_address in the sg table will later be used by GPU to
- * access memory. So if the memory is system memory, we need to
- * do a dma-mapping so it can be accessed by GPU/DMA.
- *
- * FIXME: This function currently only support pages in system
- * memory. If the memory is GPU local memory (of the GPU who
- * is going to access memory), we need gpu dpa (device physical
- * address), and there is no need of dma-mapping. This is TBD.
- *
- * FIXME: dma-mapping for peer gpu device to access remote gpu's
- * memory. Add this when you support p2p
- *
- * This function allocates the storage of the sg table. It is
- * caller's responsibility to free it calling sg_free_table.
- *
- * Returns 0 if successful; -ENOMEM if fails to allocate memory
- */
-static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
-		       struct sg_table *st, bool write)
-{
-	struct device *dev = xe->drm.dev;
-	struct page **pages;
-	u64 i, npages;
-	int ret;
-
-	npages = xe_npages_in_range(range->start, range->end);
-	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		return -ENOMEM;
-
-	for (i = 0; i < npages; i++) {
-		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
-		xe_assert(xe, !is_device_private_page(pages[i]));
-	}
-
-	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
-						xe_sg_segment_size(dev), GFP_KERNEL);
-	if (ret)
-		goto free_pages;
-
-	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
-			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
-	if (ret) {
-		sg_free_table(st);
-		st = NULL;
-	}
-
-free_pages:
-	kvfree(pages);
-	return ret;
-}
-
-/*
- * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
- *
- * @uvma: the userptr vma which hold the scatter gather table
- *
- * With function xe_userptr_populate_range, we allocate storage of
- * the userptr sg table. This is a helper function to free this
- * sg table, and dma unmap the address in the table.
- */
-void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-	struct xe_vma *vma = &uvma->vma;
-	bool write = !xe_vma_read_only(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-	struct device *dev = xe->drm.dev;
-
-	xe_assert(xe, userptr->sg);
-	dma_unmap_sgtable(dev, userptr->sg,
-			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
-
-	sg_free_table(userptr->sg);
-	userptr->sg = NULL;
-}
-
-/**
- * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
- * address range
- *
- * @uvma: userptr vma which has information of the range to populate.
- * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
- *
- * This function populate the physical pages of a virtual
- * address range. The populated physical pages is saved in
- * userptr's sg table. It is similar to get_user_pages but call
- * hmm_range_fault.
- *
- * This function also read mmu notifier sequence # (
- * mmu_interval_read_begin), for the purpose of later
- * comparison (through mmu_interval_read_retry).
- *
- * This must be called with mmap read or write lock held.
- *
- * This function allocates the storage of the userptr sg table.
- * It is caller's responsibility to free it calling sg_free_table.
- *
- * returns: 0 for succuss; negative error no on failure
- */
-int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
-				  bool is_mm_mmap_locked)
-{
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
-	struct xe_userptr *userptr;
-	struct xe_vma *vma = &uvma->vma;
-	u64 userptr_start = xe_vma_userptr(vma);
-	u64 userptr_end = userptr_start + xe_vma_size(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct hmm_range hmm_range;
-	bool write = !xe_vma_read_only(vma);
-	unsigned long notifier_seq;
-	u64 npages;
-	int ret;
-
-	userptr = &uvma->userptr;
-
-	if (is_mm_mmap_locked)
-		mmap_assert_locked(userptr->notifier.mm);
-
-	if (vma->gpuva.flags & XE_VMA_DESTROYED)
-		return 0;
-
-	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-	if (notifier_seq == userptr->notifier_seq)
-		return 0;
-
-	if (userptr->sg)
-		xe_hmm_userptr_free_sg(uvma);
-
-	npages = xe_npages_in_range(userptr_start, userptr_end);
-	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
-	if (unlikely(!pfns))
-		return -ENOMEM;
-
-	if (write)
-		flags |= HMM_PFN_REQ_WRITE;
-
-	if (!mmget_not_zero(userptr->notifier.mm)) {
-		ret = -EFAULT;
-		goto free_pfns;
-	}
-
-	hmm_range.default_flags = flags;
-	hmm_range.hmm_pfns = pfns;
-	hmm_range.notifier = &userptr->notifier;
-	hmm_range.start = userptr_start;
-	hmm_range.end = userptr_end;
-	hmm_range.dev_private_owner = vm->xe;
-
-	while (true) {
-		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-
-		if (!is_mm_mmap_locked)
-			mmap_read_lock(userptr->notifier.mm);
-
-		ret = hmm_range_fault(&hmm_range);
-
-		if (!is_mm_mmap_locked)
-			mmap_read_unlock(userptr->notifier.mm);
-
-		if (ret == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			continue;
-		}
-		break;
-	}
-
-	mmput(userptr->notifier.mm);
-
-	if (ret)
-		goto free_pfns;
-
-	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
-	if (ret)
-		goto free_pfns;
-
-	xe_mark_range_accessed(&hmm_range, write);
-	userptr->sg = &userptr->sgt;
-	userptr->notifier_seq = hmm_range.notifier_seq;
-
-free_pfns:
-	kvfree(pfns);
-	return ret;
-}
-
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
deleted file mode 100644
index 909dc2bdcd97..000000000000
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: MIT
- *
- * Copyright © 2024 Intel Corporation
- */
-
-#include <linux/types.h>
-
-struct xe_userptr_vma;
-
-int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
-void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5c2043c90556..9c1a66e373d2 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -669,8 +669,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (!xe_vma_is_null(vma)) {
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
-					xe_vma_size(vma), &curs);
+			xe_res_first_dma(to_userptr_vma(vma)->userptr.hmmptr.dma_addr,
+					0, xe_vma_size(vma), 0, &curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
@@ -1221,12 +1221,12 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 		return 0;
 
 	uvma = to_userptr_vma(vma);
-	notifier_seq = uvma->userptr.notifier_seq;
+	notifier_seq = uvma->userptr.hmmptr.notifier_seq;
 
 	if (uvma->userptr.initial_bind && !xe_vm_in_fault_mode(vm))
                return 0;
 
-	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
+	if (!mmu_interval_read_retry(&uvma->userptr.hmmptr.notifier,
 				     notifier_seq) &&
 	    !xe_pt_userptr_inject_eagain(uvma))
 		return 0;
@@ -1757,7 +1757,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	 * state if an invalidation is running while preparing an unbind.
 	 */
 	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
-		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
+		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.hmmptr.notifier);
 
 	pt_op->vma = vma;
 	pt_op->bind = false;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f40ea5f11c33..31d1ab1b376d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -38,7 +38,6 @@
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
-#include "xe_hmm.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -59,21 +58,63 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
  */
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
 {
-	return mmu_interval_check_retry(&uvma->userptr.notifier,
-					uvma->userptr.notifier_seq) ?
+	return mmu_interval_check_retry(&uvma->userptr.hmmptr.notifier,
+					uvma->userptr.hmmptr.notifier_seq) ?
 		-EAGAIN : 0;
 }
 
+static void xe_vma_userptr_dma_map_pages(struct xe_userptr_vma *uvma,
+		u64 start, u64 end)
+{
+	struct drm_hmmptr *hmmptr = &uvma->userptr.hmmptr;
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+	u64 npages = (end - start) >> PAGE_SHIFT;
+	u64 page_idx = (start - xe_vma_userptr(vma)) >> PAGE_SHIFT;
+
+	xe_assert(xe, xe_vma_is_userptr(vma));
+	xe_assert(xe, start >= xe_vma_userptr(vma));
+	xe_assert(xe, end <= xe_vma_userptr_end(vma));
+	drm_svm_hmmptr_map_dma_pages(hmmptr, page_idx, npages);
+}
+
+static void xe_vma_userptr_dma_unmap_pages(struct xe_userptr_vma *uvma,
+		u64 start, u64 end)
+{
+	struct drm_hmmptr *hmmptr = &uvma->userptr.hmmptr;
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+	u64 npages = (end - start) >> PAGE_SHIFT;
+	u64 page_idx = (start - xe_vma_userptr(vma)) >> PAGE_SHIFT;
+
+	xe_assert(xe, xe_vma_is_userptr(vma));
+	xe_assert(xe, start >= xe_vma_userptr(vma));
+	xe_assert(xe, end <= xe_vma_userptr_end(vma));
+
+	drm_svm_hmmptr_unmap_dma_pages(hmmptr, page_idx, npages);
+}
+
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 {
+	struct drm_hmmptr *hmmptr = &uvma->userptr.hmmptr;
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
+	int ret;
 
 	lockdep_assert_held(&vm->lock);
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
-	return xe_hmm_userptr_populate_range(uvma, false);
+	ret = drm_svm_hmmptr_populate(hmmptr, NULL, xe_vma_userptr(vma),
+			 xe_vma_userptr(vma) + xe_vma_size(vma),
+			 !xe_vma_read_only(vma), false);
+	if (ret)
+		return ret;
+
+	xe_vma_userptr_dma_map_pages(uvma, xe_vma_userptr(vma), xe_vma_userptr_end(vma));
+	return 0;
 }
 
 static bool preempt_fences_waiting(struct xe_vm *vm)
@@ -574,7 +615,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 				   const struct mmu_notifier_range *range,
 				   unsigned long cur_seq)
 {
-	struct xe_userptr *userptr = container_of(mni, typeof(*userptr), notifier);
+	struct xe_userptr *userptr = container_of(mni, typeof(*userptr), hmmptr.notifier);
 	struct xe_userptr_vma *uvma = container_of(userptr, typeof(*uvma), userptr);
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -637,6 +678,8 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		XE_WARN_ON(err);
 	}
 
+	xe_vma_userptr_dma_unmap_pages(uvma, xe_vma_userptr(vma), xe_vma_userptr_end(vma));
+
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
@@ -891,6 +934,16 @@ static void xe_vma_free(struct xe_vma *vma)
 		kfree(vma);
 }
 
+static struct drm_gpuva *xe_hmmptr_get_gpuva(struct drm_hmmptr *hmmptr)
+{
+	struct xe_userptr_vma *uvma;
+	struct xe_vma *vma;
+
+	uvma = container_of(hmmptr, typeof(*uvma), userptr.hmmptr);
+	vma = &uvma->vma;
+	return &vma->gpuva;
+}
+
 #define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
 #define VMA_CREATE_FLAG_IS_NULL			BIT(1)
 #define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
@@ -976,23 +1029,19 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	} else /* userptr or null */ {
 		if (!is_null && !is_system_allocator) {
 			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
-			u64 size = end - start + 1;
 			int err;
 
 			INIT_LIST_HEAD(&userptr->invalidate_link);
 			INIT_LIST_HEAD(&userptr->repin_link);
 			vma->gpuva.gem.offset = bo_offset_or_userptr;
 
-			err = mmu_interval_notifier_insert(&userptr->notifier,
-							   current->mm,
-							   xe_vma_userptr(vma), size,
-							   &vma_userptr_notifier_ops);
+			userptr->hmmptr.get_gpuva = &xe_hmmptr_get_gpuva;
+			err = drm_svm_hmmptr_init(&userptr->hmmptr,
+				 &vma_userptr_notifier_ops);
 			if (err) {
 				xe_vma_free(vma);
 				return ERR_PTR(err);
 			}
-
-			userptr->notifier_seq = LONG_MAX;
 		}
 
 		xe_vm_get(vm);
@@ -1014,15 +1063,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 		struct xe_userptr *userptr = &uvma->userptr;
 
-		if (userptr->sg)
-			xe_hmm_userptr_free_sg(uvma);
-
-		/*
-		 * Since userptr pages are not pinned, we can't remove
-		 * the notifer until we're sure the GPU is not accessing
-		 * them anymore
-		 */
-		mmu_interval_notifier_remove(&userptr->notifier);
+		drm_svm_hmmptr_release(&userptr->hmmptr);
 		xe_vm_put(vm);
 	} else if (xe_vma_is_null(vma) || xe_vma_is_system_allocator(vma)) {
 		xe_vm_put(vm);
@@ -3196,8 +3237,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (xe_vma_is_userptr(vma)) {
 			WARN_ON_ONCE(!mmu_interval_check_retry
-				     (&to_userptr_vma(vma)->userptr.notifier,
-				      to_userptr_vma(vma)->userptr.notifier_seq));
+				     (&to_userptr_vma(vma)->userptr.hmmptr.notifier,
+				      to_userptr_vma(vma)->userptr.hmmptr.notifier_seq));
 			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
@@ -3283,7 +3324,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
 		} else if (xe_vma_is_userptr(vma)) {
 			struct mm_struct *mm =
-				to_userptr_vma(vma)->userptr.notifier.mm;
+				to_userptr_vma(vma)->userptr.hmmptr.notifier.mm;
 
 			if (mmget_not_zero(mm))
 				snap->snap[i].mm = mm;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index e1d3dd699380..976982972a06 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -36,20 +36,11 @@ struct xe_vm_pgtable_update_op;
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
+	struct drm_hmmptr hmmptr;
 	/** @invalidate_link: Link for the vm::userptr.invalidated list */
 	struct list_head invalidate_link;
 	/** @userptr: link into VM repin list if userptr. */
 	struct list_head repin_link;
-	/**
-	 * @notifier: MMU notifier for user pointer (invalidation call back)
-	 */
-	struct mmu_interval_notifier notifier;
-	/** @sgt: storage for a scatter gather table */
-	struct sg_table sgt;
-	/** @sg: allocated scatter gather table */
-	struct sg_table *sg;
-	/** @notifier_seq: notifier sequence number */
-	unsigned long notifier_seq;
 	/**
 	 * @initial_bind: user pointer has been bound at least once.
 	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
-- 
2.26.3

