Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC44DCD11DB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 03:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B51C10EDC1;
	Fri, 22 Mar 2024 03:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NeAmSBYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997D810ED8B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 03:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711078979; x=1742614979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9qUYg+tmLq7Y6sL/bZ5BAsn1EmZzwfufSNkiFZOnWCE=;
 b=NeAmSBYkDQtIBwaDD7cL7NM16m3Xk8zEM794+D2F3EJOKvnaJY36ILG5
 zZnHPGVv8Y+HG5mcKwBJ5vSFZeJQRysvOY3nKvfROLHVA+XHoPboeVj29
 vF6h+X1ZQ7R5YmxnShgbRzG/B9xTe+VDV9w2+zl/NqjDrVTVuP7M3BWxh
 jY0/NRyGSFhPIQ8n7ryeAhs63+Tgp5aU9SCIs5KMua9RNImAICTmYMNpN
 O20ttXzONG1XHxe7+8oPTqLviUCMrgN0aRCnr8+hJdPmyEJyt25ehqdA7
 f4UNCWSi4ySZXJrVBtwE/HEEsgOoM1/u+x5xsbiKFbdj3isMI48Mvbxh7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5966232"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="5966232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="19317559"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 20:42:59 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 3/3] drm/xe: Use hmm_range_fault to populate user pages
Date: Thu, 21 Mar 2024 23:55:20 -0400
Message-Id: <20240322035520.2382600-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240322035520.2382600-1-oak.zeng@intel.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
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

This is an effort to unify hmmptr (aka system allocator)
and userptr code. hmm_range_fault is used to populate
a virtual address range for both hmmptr and userptr,
instead of hmmptr using hmm_range_fault and userptr
using get_user_pages_fast.

This also aligns with AMD gpu driver's behavior. In
long term, we plan to put some common helpers in this
area to drm layer so it can be re-used by different
vendors.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 122 ++++---------------------------------
 1 file changed, 12 insertions(+), 110 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e3692b7e1711..c0a3bff1bb0e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -38,6 +38,7 @@
 #include "xe_sync.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
+#include "xe_hmm.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -65,113 +66,21 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
 
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
+	struct xe_userptr *userptr;
+	int ret;
 
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
+	userptr = &uvma->userptr;
+	mmap_read_lock(userptr->notifier.mm);
+	ret = xe_userptr_populate_range(uvma);
+	mmap_read_unlock(userptr->notifier.mm);
 
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
-
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
+	return ret;
 }
 
 static bool preempt_fences_waiting(struct xe_vm *vm)
@@ -921,8 +830,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-	bool read_only = xe_vma_read_only(vma);
 
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
@@ -930,16 +837,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
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
+			xe_userptr_free_sg(uvma);
 
 		/*
 		 * Since userptr pages are not pinned, we can't remove
-- 
2.26.3

