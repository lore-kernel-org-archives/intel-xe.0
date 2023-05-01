Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ABBC7EE43
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42D210E3BF;
	Mon,  1 May 2023 07:51:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABE310E3B0
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927473; x=1714463473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXljsJIIGvCzQsI5REcMYLjr6/zuxv/ZzJiZVxfP4GM=;
 b=DY0LQajxEYws5m18i0p/fAnjQsCFBHO7a9/tNHVAd4xxhqYvtv7EuKli
 iNtyGeIdV3Jk2w7XUzAGmeDertiIvmXhqv1eYHB4FxQs6QaHN8bMPm7GI
 84QpO3EPiLkb8HQiySy8kZKYWo3vZVeaRqWW9URHwKeJaYw6EgfaRWsIG
 lz1y9O0pjmU+O/kECkHlQNhjjOuGJkFchESvNZzJ0Fax5wb1i/2W3SoTI
 7H9XnN+rxjM+zem/o4LcSEoOtaORZgk0aG+ktunmGVS/H1++2TvQONQGU
 U60UJliGbMmhLldARUBKbvk6IIcCxetUgP2lUK628MbHYxyZh96e4lUAe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910730"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910730"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095252"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095252"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:51:08 -0700
Message-Id: <20230501075114.3108352-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 24/30] drm/xe: Userptr refactor
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

Add GPUVA userptr flag, add GPUVA userptr sub-struct, and drop sg
pointer. A larger follow on cleanup may push more of userptr
implementation to GPUVA.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  6 +--
 drivers/gpu/drm/xe/xe_vm.c       | 41 +++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h       | 23 +++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h | 20 +++++-----
 include/drm/drm_gpuva_mgr.h      | 63 +++++++++++++++++++++-----------
 5 files changed, 89 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0f40f1950686..964baa24eba3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -92,8 +92,8 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 		page = offset >> PAGE_SHIFT;
 		offset &= (PAGE_SIZE - 1);
 
-		xe_res_first_sg(vma->userptr.sg, page << PAGE_SHIFT, page_size,
-				&cur);
+		xe_res_first_sg(&vma->userptr.sgt, page << PAGE_SHIFT,
+				page_size, &cur);
 		return xe_res_dma(&cur) + offset;
 	} else {
 		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
@@ -813,7 +813,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	xe_bo_assert_held(bo);
 	if (!xe_vma_is_null(vma)) {
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
+			xe_res_first_sg(&vma->userptr.sgt, 0, xe_vma_size(vma),
 					&curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 61b4278cbe47..d7352ef845fd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -73,13 +73,13 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	if (!pages)
 		return -ENOMEM;
 
-	if (vma->userptr.sg) {
+	if (xe_vma_userptr_sg_mapped(vma)) {
 		dma_unmap_sgtable(xe->drm.dev,
-				  vma->userptr.sg,
+				  &vma->userptr.sgt,
 				  read_only ? DMA_TO_DEVICE :
 				  DMA_BIDIRECTIONAL, 0);
-		sg_free_table(vma->userptr.sg);
-		vma->userptr.sg = NULL;
+		sg_free_table(&vma->userptr.sgt);
+		vma->gpuva.flags &= ~XE_VMA_USERPTR_SG_MAPPED;
 	}
 
 	pinned = ret = 0;
@@ -119,19 +119,19 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 					0, (u64)pinned << PAGE_SHIFT,
 					GFP_KERNEL);
 	if (ret) {
-		vma->userptr.sg = NULL;
+		vma->gpuva.flags &= ~XE_VMA_USERPTR_SG_MAPPED;
 		goto out;
 	}
-	vma->userptr.sg = &vma->userptr.sgt;
+	vma->gpuva.flags |= XE_VMA_USERPTR_SG_MAPPED;
 
-	ret = dma_map_sgtable(xe->drm.dev, vma->userptr.sg,
+	ret = dma_map_sgtable(xe->drm.dev, &vma->userptr.sgt,
 			      read_only ? DMA_TO_DEVICE :
 			      DMA_BIDIRECTIONAL,
 			      DMA_ATTR_SKIP_CPU_SYNC |
 			      DMA_ATTR_NO_KERNEL_MAPPING);
 	if (ret) {
-		sg_free_table(vma->userptr.sg);
-		vma->userptr.sg = NULL;
+		sg_free_table(&vma->userptr.sgt);
+		vma->gpuva.flags &= ~XE_VMA_USERPTR_SG_MAPPED;
 		goto out;
 	}
 
@@ -820,15 +820,13 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	 */
 	INIT_LIST_HEAD(&vma->rebind_link);
 
-	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
-	INIT_LIST_HEAD(&vma->gpuva.gem.extobj_link);
 	vma->gpuva.mgr = &vm->mgr;
 	vma->gpuva.va.addr = start;
 	vma->gpuva.va.range = end - start + 1;
 	if (read_only)
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
 	if (null)
-		vma->gpuva.flags |= XE_VMA_NULL;
+		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
 
 	if (gt_mask) {
 		vma->gt_mask = gt_mask;
@@ -845,6 +843,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		xe_bo_assert_held(bo);
 
 		drm_gem_object_get(&bo->ttm.base);
+		INIT_LIST_HEAD(&vma->gpuva.gem.entry);
+		INIT_LIST_HEAD(&vma->gpuva.gem.extobj_link);
 		vma->gpuva.gem.obj = &bo->ttm.base;
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
 		if (!bo->vm)
@@ -855,7 +855,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			u64 size = end - start + 1;
 			int err;
 
-			vma->gpuva.gem.offset = bo_offset_or_userptr;
+			vma->gpuva.flags |= DRM_GPUVA_USERPTR;
+			vma->gpuva.userptr.address= bo_offset_or_userptr;
 			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
 							   current->mm,
 							   xe_vma_userptr(vma),
@@ -883,13 +884,13 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	bool read_only = xe_vma_read_only(vma);
 
 	if (xe_vma_is_userptr(vma)) {
-		if (vma->userptr.sg) {
+		if (xe_vma_userptr_sg_mapped(vma)) {
 			dma_unmap_sgtable(xe->drm.dev,
-					  vma->userptr.sg,
+					  &vma->userptr.sgt,
 					  read_only ? DMA_TO_DEVICE :
 					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(vma->userptr.sg);
-			vma->userptr.sg = NULL;
+			sg_free_table(&vma->userptr.sgt);
+			vma->gpuva.flags &= ~XE_VMA_USERPTR_SG_MAPPED;
 		}
 
 		/*
@@ -2307,7 +2308,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 						XE_VMA_READ_ONLY;
 					bool null =
 						op->base.remap.unmap->va->flags &
-						XE_VMA_NULL;
+						DRM_GPUVA_SPARSE;
 
 					vma = new_vma(vm, op->base.remap.prev,
 						      op->gt_mask, read_only,
@@ -2342,7 +2343,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 
 					bool null =
 						op->base.remap.unmap->va->flags &
-						XE_VMA_NULL;
+						DRM_GPUVA_SPARSE;
 
 					vma = new_vma(vm, op->base.remap.next,
 						      op->gt_mask, read_only,
@@ -3316,7 +3317,7 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		} else if (is_userptr) {
 			struct xe_res_cursor cur;
 
-			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE, &cur);
+			xe_res_first_sg(&vma->userptr.sgt, 0, XE_PAGE_SIZE, &cur);
 			addr = xe_res_dma(&cur);
 		} else {
 			addr = xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE, &is_vram);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 12de652d8d1c..f279fa622260 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -101,12 +101,6 @@ static inline u64 xe_vma_bo_offset(struct xe_vma *vma)
 	return vma->gpuva.gem.offset;
 }
 
-static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
-{
-	return !vma->gpuva.gem.obj ? NULL :
-		container_of(vma->gpuva.gem.obj, struct xe_bo, ttm.base);
-}
-
 static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
 {
 	return container_of(vma->gpuva.mgr, struct xe_vm, mgr);
@@ -129,7 +123,7 @@ static inline bool xe_vma_read_only(struct xe_vma *vma)
 
 static inline u64 xe_vma_userptr(struct xe_vma *vma)
 {
-	return vma->gpuva.gem.offset;
+	return vma->gpuva.userptr.address;
 }
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->mgr.resv)
@@ -197,12 +191,18 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 
 static inline bool xe_vma_is_null(struct xe_vma *vma)
 {
-	return vma->gpuva.flags & XE_VMA_NULL;
+	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
 }
 
 static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 {
-	return !xe_vma_bo(vma) && !xe_vma_is_null(vma);
+	return vma->gpuva.flags & DRM_GPUVA_USERPTR;
+}
+
+static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
+{
+	return xe_vma_is_null(vma) || xe_vma_is_userptr(vma) ? NULL :
+		container_of(vma->gpuva.gem.obj, struct xe_bo, ttm.base);
 }
 
 static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
@@ -210,6 +210,11 @@ static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 	return !xe_vma_bo(vma);
 }
 
+static inline bool xe_vma_userptr_sg_mapped(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_USERPTR_SG_MAPPED;
+}
+
 int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0b59bde3bc4e..ce1260b8d3ef 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -23,15 +23,15 @@ struct xe_vm;
 #define TEST_VM_ASYNC_OPS_ERROR
 #define FORCE_ASYNC_OP_ERROR	BIT(31)
 
-#define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
-#define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
-#define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
-#define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
-#define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
-#define XE_VMA_NULL		(DRM_GPUVA_USERBITS << 5)
-#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 6)
-#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 7)
-#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 8)
+#define XE_VMA_READ_ONLY		DRM_GPUVA_USERBITS
+#define XE_VMA_DESTROYED		(DRM_GPUVA_USERBITS << 1)
+#define XE_VMA_ATOMIC_PTE_BIT		(DRM_GPUVA_USERBITS << 2)
+#define XE_VMA_FIRST_REBIND		(DRM_GPUVA_USERBITS << 3)
+#define XE_VMA_LAST_REBIND		(DRM_GPUVA_USERBITS << 4)
+#define XE_VMA_USERPTR_SG_MAPPED	(DRM_GPUVA_USERBITS << 5)
+#define XE_VMA_PTE_4K			(DRM_GPUVA_USERBITS << 6)
+#define XE_VMA_PTE_2M			(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_PTE_1G			(DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -41,8 +41,6 @@ struct xe_userptr {
 	struct mmu_interval_notifier notifier;
 	/** @sgt: storage for a scatter gather table */
 	struct sg_table sgt;
-	/** @sg: allocated scatter gather table */
-	struct sg_table *sg;
 	/** @notifier_seq: notifier sequence number */
 	unsigned long notifier_seq;
 	/**
diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index 57861a7ed504..943c8fcda533 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -62,10 +62,17 @@ enum drm_gpuva_flags {
 	 */
 	DRM_GPUVA_EXTOBJ = (1 << 2),
 
+	/**
+	 * @DRM_GPUVA_USERPTR:
+	 *
+	 * Flag indicating that the &drm_gpuva is a user pointer mapping.
+	 */
+	DRM_GPUVA_USERPTR = (1 << 3),
+
 	/**
 	 * @DRM_GPUVA_USERBITS: user defined bits
 	 */
-	DRM_GPUVA_USERBITS = (1 << 3),
+	DRM_GPUVA_USERBITS = (1 << 4),
 };
 
 /**
@@ -102,31 +109,45 @@ struct drm_gpuva {
 		u64 range;
 	} va;
 
-	/**
-	 * @gem: structure containing the &drm_gem_object and it's offset
-	 */
-	struct {
-		/**
-		 * @offset: the offset within the &drm_gem_object
-		 */
-		u64 offset;
-
-		/**
-		 * @obj: the mapped &drm_gem_object
-		 */
-		struct drm_gem_object *obj;
-
+	union {
 		/**
-		 * @entry: the &list_head to attach this object to a &drm_gem_object
+		 * @gem: structure containing the &drm_gem_object and it's
+		 * offset
 		 */
-		struct list_head entry;
+		struct {
+			/**
+			 * @offset: the offset within the &drm_gem_object
+			 */
+			u64 offset;
+
+			/**
+			 * @obj: the mapped &drm_gem_object
+			 */
+			struct drm_gem_object *obj;
+
+			/**
+			 * @entry: the &list_head to attach this object to a
+			 * &drm_gem_object
+			 */
+			struct list_head entry;
+
+			/**
+			 * @extobj_link: the &list_head to attach this object to
+			 * a @drm_gpuva_manager.extobj.list
+			 */
+			struct list_head extobj_link;
+		} gem;
 
 		/**
-		 * @extobj_link: the &list_head to attach this object to a
-		 * @drm_gpuva_manager.extobj.list
+		 * @userptr: structure containing user pointer state
 		 */
-		struct list_head extobj_link;
-	} gem;
+		struct {
+			/**
+			 * @address: user pointer address
+			 */
+			u64 address;
+		} userptr;
+	};
 };
 
 void drm_gpuva_link(struct drm_gpuva *va);
-- 
2.34.1

