Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CEEC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8358B10F554;
	Fri, 12 Apr 2024 09:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XK0KmaPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E80610F546
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914737; x=1744450737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z0HcLYaqhaIHyIQ2sXVAHPAPChBid+VL/CKCDx4KYME=;
 b=XK0KmaPT34b70AbLzXnZ20Aztcsed6wbOGOYId/j51vjO9WbSW14sOmN
 WG6J4dU0Z4F56GOC5vhP5mNJUn7haT+Qk1VTzBNtk5JFUmttszMQxMiFA
 RM0I718vwFuBEDLbstjfOWKwsv8ZJhRyEPYTmN78ye52LRfsLHwAU3M1X
 S0JUE1NeE+K0upO7dGcVEraThPS85Qe9MN4CfOZCs0XkPX2nU+bDVRpQV
 gr9Zl247ep2qGMU2U5ihZW8BDjN+HrsdONO81vzLawWVuhbMdcnI4xIT6
 7pba5Bnu+fwMK4y4jc4paXOq7+WLXYxGRYZEPd3DDrAGXuabjlebXtXyt A==;
X-CSE-ConnectionGUID: aSUmiqsLTli2eoOp9hUBJw==
X-CSE-MsgGUID: 1R5dAgOwQzWljMLUDE3wMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12156173"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12156173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:38:56 -0700
X-CSE-ConnectionGUID: ywuU3kUdRD2tnJDkPkKBqw==
X-CSE-MsgGUID: 8bCZXN0yT72kohUzirKLUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25840601"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2024 02:38:54 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 2/2] drm/xe: Use hmm_range_fault to populate user pages
Date: Fri, 12 Apr 2024 15:22:37 +0530
Message-Id: <20240412095237.1048599-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412095237.1048599-1-himal.prasad.ghimiray@intel.com>
References: <20240412095237.1048599-1-himal.prasad.ghimiray@intel.com>
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

From: Oak Zeng <oak.zeng@intel.com>

This is an effort to unify hmmptr (aka system allocator)
and userptr code. hmm_range_fault is used to populate
a virtual address range for both hmmptr and userptr,
instead of hmmptr using hmm_range_fault and userptr
using get_user_pages_fast.

This also aligns with AMD gpu driver's behavior. In
long term, we plan to put some common helpers in this
area to drm layer so it can be re-used by different
vendors.

-v1
use the function with parameter to confirm whether lock is
acquired by the caller or needs to be acquired in hmm_range_fault.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 117 ++-----------------------------------
 1 file changed, 6 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 66b70fd3d105..9c6f653992dd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -39,6 +39,7 @@
 #include "xe_sync.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
+#include "xe_hmm.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -66,113 +67,14 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
 
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 {
-	struct xe_userptr *userptr = &uvma->userptr;
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
-	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
-	struct page **pages;
-	bool in_kthread = !current->mm;
-	unsigned long notifier_seq;
-	int pinned, ret, i;
-	bool read_only = xe_vma_read_only(vma);
 
 	lockdep_assert_held(&vm->lock);
 	xe_assert(xe, xe_vma_is_userptr(vma));
-retry:
-	if (vma->gpuva.flags & XE_VMA_DESTROYED)
-		return 0;
-
-	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-	if (notifier_seq == userptr->notifier_seq)
-		return 0;
-
-	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		return -ENOMEM;
-
-	if (userptr->sg) {
-		dma_unmap_sgtable(xe->drm.dev,
-				  userptr->sg,
-				  read_only ? DMA_TO_DEVICE :
-				  DMA_BIDIRECTIONAL, 0);
-		sg_free_table(userptr->sg);
-		userptr->sg = NULL;
-	}
-
-	pinned = ret = 0;
-	if (in_kthread) {
-		if (!mmget_not_zero(userptr->notifier.mm)) {
-			ret = -EFAULT;
-			goto mm_closed;
-		}
-		kthread_use_mm(userptr->notifier.mm);
-	}
-
-	while (pinned < num_pages) {
-		ret = get_user_pages_fast(xe_vma_userptr(vma) +
-					  pinned * PAGE_SIZE,
-					  num_pages - pinned,
-					  read_only ? 0 : FOLL_WRITE,
-					  &pages[pinned]);
-		if (ret < 0)
-			break;
-
-		pinned += ret;
-		ret = 0;
-	}
-
-	if (in_kthread) {
-		kthread_unuse_mm(userptr->notifier.mm);
-		mmput(userptr->notifier.mm);
-	}
-mm_closed:
-	if (ret)
-		goto out;
-
-	ret = sg_alloc_table_from_pages_segment(&userptr->sgt, pages,
-						pinned, 0,
-						(u64)pinned << PAGE_SHIFT,
-						xe_sg_segment_size(xe->drm.dev),
-						GFP_KERNEL);
-	if (ret) {
-		userptr->sg = NULL;
-		goto out;
-	}
-	userptr->sg = &userptr->sgt;
-
-	ret = dma_map_sgtable(xe->drm.dev, userptr->sg,
-			      read_only ? DMA_TO_DEVICE :
-			      DMA_BIDIRECTIONAL,
-			      DMA_ATTR_SKIP_CPU_SYNC |
-			      DMA_ATTR_NO_KERNEL_MAPPING);
-	if (ret) {
-		sg_free_table(userptr->sg);
-		userptr->sg = NULL;
-		goto out;
-	}
-
-	for (i = 0; i < pinned; ++i) {
-		if (!read_only) {
-			lock_page(pages[i]);
-			set_page_dirty(pages[i]);
-			unlock_page(pages[i]);
-		}
 
-		mark_page_accessed(pages[i]);
-	}
-
-out:
-	release_pages(pages, pinned);
-	kvfree(pages);
-
-	if (!(ret < 0)) {
-		userptr->notifier_seq = notifier_seq;
-		if (xe_vma_userptr_check_repin(uvma) == -EAGAIN)
-			goto retry;
-	}
-
-	return ret < 0 ? ret : 0;
+	return xe_hmm_userptr_populate_range(uvma, false);
 }
 
 static bool preempt_fences_waiting(struct xe_vm *vm)
@@ -956,8 +858,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-	bool read_only = xe_vma_read_only(vma);
 
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
@@ -965,16 +865,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	}
 
 	if (xe_vma_is_userptr(vma)) {
-		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+		struct xe_userptr *userptr = &uvma->userptr;
 
-		if (userptr->sg) {
-			dma_unmap_sgtable(xe->drm.dev,
-					  userptr->sg,
-					  read_only ? DMA_TO_DEVICE :
-					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(userptr->sg);
-			userptr->sg = NULL;
-		}
+		if (userptr->sg)
+			xe_hmm_userptr_free_sg(uvma);
 
 		/*
 		 * Since userptr pages are not pinned, we can't remove
-- 
2.25.1

