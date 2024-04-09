Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC747CD1299
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61275112EFA;
	Tue,  9 Apr 2024 20:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XziYY76g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FF510E96D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693094; x=1744229094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e8BiX6pZr7Oe6NPZRv8GhTINFj6auFsH18DMTNw9J/E=;
 b=XziYY76g9xkD8j1qODH7akZ5XgSozlrZBqGdKewpN3zatzoqZDbH+r7O
 OoVapiqza3JnqRnD6FcoNvUCQ7dpABYJOwl3l1vUfnvkpBMKo0F9gdW1f
 MhIr6YSJm/dv8jlk/C6zs70Qmxbx9tubNXESWqpxA2wZy3OsG9WmlgDsJ
 OXcHqmSlnEqDVm87ElrryeAdTMkZUyvHlHAYin5bX59vwQcKc8ZAsmzyq
 sCCawOTca2z0dAPuXtRldunHrM7mjmHrykpF8/49hiJ5SGYMYY4LeWX0f
 hHEh6S4mp3gf1MzoSBpOq1geTsIWji31iaOQHuL2P0vZKx8v0j3U1bgub A==;
X-CSE-ConnectionGUID: gbghZBR1SluyxVLqPMz0eg==
X-CSE-MsgGUID: oGkDICz/QCWRvjAmGJrFbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803747"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803747"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
X-CSE-ConnectionGUID: Du1SrL2sSOSbCq8J/ViE0A==
X-CSE-MsgGUID: LHQ0fp/UR8GHNbaa+OhD1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773745"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 11/31] drm/xe: Use hmm_range_fault to populate user pages
Date: Tue,  9 Apr 2024 16:17:22 -0400
Message-Id: <20240409201742.3042626-12-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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
index 95dda229a9fe..61d336f24a65 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -39,6 +39,7 @@
 #include "xe_sync.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
+#include "xe_hmm.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -66,113 +67,21 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
 
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
+	userptr = &uvma->userptr;
+	mmap_read_lock(userptr->notifier.mm);
+	ret = xe_userptr_populate_range(uvma);
+	mmap_read_unlock(userptr->notifier.mm);
 
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
@@ -1016,8 +925,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-	bool read_only = xe_vma_read_only(vma);
 
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
@@ -1025,16 +932,11 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
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

