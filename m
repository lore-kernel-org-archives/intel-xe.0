Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0C8C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 02:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA8F10E80B;
	Tue, 30 Apr 2024 02:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XG2oehrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACB310E834
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 02:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714445990; x=1745981990;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AdkdOKu7YviakUnJTPuBRqgmfDaNW/NwZTHp9gvlUiQ=;
 b=XG2oehrgXYk68VdBRH4FcIEphdfkygjCtHeYQWWlOT+pL7KxMl11CNEI
 qaq1a/Ig9Ev8FUp39Pmj59Fufl+5MKPpzmIy+W851US2FIjhDOr0QZCzE
 snuv9/GYmm7/2sjtVjeZppDVIiqgowfOCWfNOOc61OzOLGAq3m7NJyn6Z
 zSUjXJUb76nEE8F6vYnjW2QAFvmhlgjMwxw0RsNg0OgCEv/KcQVzq+Z6B
 2UuuBXtLYfMdvohzb7wusvgLOinRu3L4Fk23dpNQWOKAddJ6SG2L/Xc9C
 1tg+Yni8DHs2IbSvQuGFeit+xTW2dYuaVERUclbwpKn/0U2KDBX0JrxHw Q==;
X-CSE-ConnectionGUID: qupgBpmbTbe/oBbRrPrbnQ==
X-CSE-MsgGUID: 88E5URtyQ6qHCZXtwHog7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="32634392"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="32634392"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 19:59:48 -0700
X-CSE-ConnectionGUID: /5x2oLcWTGOVkgdoVu5E/g==
X-CSE-MsgGUID: Ph7AS8ixSiyCtNU1a2y/NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26398497"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 19:59:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/xe: Unmap userptr in MMU invalidation notifier
Date: Mon, 29 Apr 2024 20:00:20 -0700
Message-Id: <20240430030020.2306682-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

To be secure, when a userptr is invalidated the pages should be dma
unmapped ensuring the device can no longer touch the invalidated pages.

v2:
 - Don't free sg table in MMU notifer, just dma unmap pages

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Fixes: 12f4b58a37f4 ("drm/xe: Use hmm_range_fault to populate user pages")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: stable@vger.kernel.org # 6.8
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hmm.c      | 42 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_hmm.h      |  1 +
 drivers/gpu/drm/xe/xe_pt.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       |  5 +++-
 drivers/gpu/drm/xe/xe_vm_types.h |  5 +++-
 5 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 2c32dc46f7d4..baf42514e1f9 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -112,16 +112,20 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
 	return ret;
 }
 
-/*
- * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
+#define need_unmap(__sg)	((u64)(__sg) & 0x1ull)
+#define clear_need_unmap(__sg)	(__sg) = (struct sg_table *)((u64)(__sg) & ~0x1ull)
+#define set_need_unmap(__sg)	(__sg) = (struct sg_table *)((u64)(__sg) | 0x1ull)
+
+/**
+ * xe_hmm_userptr_unmap_sg() - Unmap the scatter gather table of userptr
  *
  * @uvma: the userptr vma which hold the scatter gather table
  *
  * With function xe_userptr_populate_range, we allocate storage of
- * the userptr sg table. This is a helper function to free this
- * sg table, and dma unmap the address in the table.
+ * the userptr sg table. This is a helper function to dma unmap the address in
+ * the table.
  */
-void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
+void xe_hmm_userptr_unmap_sg(struct xe_userptr_vma *uvma)
 {
 	struct xe_userptr *userptr = &uvma->userptr;
 	struct xe_vma *vma = &uvma->vma;
@@ -129,11 +133,34 @@ void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
 	struct device *dev = xe->drm.dev;
+	bool do_unmap;
 
 	xe_assert(xe, userptr->sg);
-	dma_unmap_sgtable(dev, userptr->sg,
-			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
 
+	spin_lock(&vm->userptr.invalidated_lock);
+	do_unmap = need_unmap(userptr->sg);
+	clear_need_unmap(userptr->sg);
+	spin_unlock(&vm->userptr.invalidated_lock);
+
+	if (do_unmap)
+		dma_unmap_sgtable(dev, userptr->sg,
+				  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
+}
+
+/*
+ * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
+ *
+ * @uvma: the userptr vma which hold the scatter gather table
+ *
+ * With function xe_userptr_populate_range, we allocate storage of
+ * the userptr sg table. This is a helper function to free this
+ * sg table, and dma unmap the address in the table.
+ */
+void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+
+	xe_hmm_userptr_unmap_sg(uvma);
 	sg_free_table(userptr->sg);
 	userptr->sg = NULL;
 }
@@ -244,6 +271,7 @@ int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
 
 	xe_mark_range_accessed(&hmm_range, write);
 	userptr->sg = &userptr->sgt;
+	set_need_unmap(userptr->sg);
 	userptr->notifier_seq = hmm_range.notifier_seq;
 
 free_pfns:
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
index 909dc2bdcd97..56e653dc9fa2 100644
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -9,3 +9,4 @@ struct xe_userptr_vma;
 
 int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
 void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
+void xe_hmm_userptr_unmap_sg(struct xe_userptr_vma *uvma);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8d3765d3351e..b095257dc684 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -635,7 +635,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (!xe_vma_is_null(vma)) {
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
+			xe_res_first_sg(vma_to_userptr_sg(vma), 0,
 					xe_vma_size(vma), &curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dfd31b346021..c3d54dcf2a3e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -637,6 +637,9 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		XE_WARN_ON(err);
 	}
 
+	if (userptr->sg)
+		xe_hmm_userptr_unmap_sg(uvma);
+
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
@@ -3405,7 +3408,7 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		if (is_null) {
 			addr = 0;
 		} else if (is_userptr) {
-			struct sg_table *sg = to_userptr_vma(vma)->userptr.sg;
+			struct sg_table *sg = vma_to_userptr_sg(vma);
 			struct xe_res_cursor cur;
 
 			if (sg) {
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..0478a2235076 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -34,6 +34,9 @@ struct xe_vm;
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 10)
 
+#define vma_to_userptr_sg(__vma) \
+	(struct sg_table *)((u64)to_userptr_vma((__vma))->userptr.sg & ~0x1ull)
+
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
 	/** @invalidate_link: Link for the vm::userptr.invalidated list */
@@ -206,7 +209,7 @@ struct xe_vm {
 		struct rw_semaphore notifier_lock;
 		/**
 		 * @userptr.invalidated_lock: Protects the
-		 * @userptr.invalidated list.
+		 * @userptr.invalidated list and dma mapped pages of userptrs
 		 */
 		spinlock_t invalidated_lock;
 		/**
-- 
2.34.1

