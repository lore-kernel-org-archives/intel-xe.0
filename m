Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43D8C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 00:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8085010E40E;
	Tue,  2 May 2023 00:17:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7CF10E34B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682986650; x=1714522650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qVOmksJPJe1NbylLFQWpQ1nQPSKa6ePPlvuiBH+I59M=;
 b=i4zmamW4X13C9sKJDlRfCI6x6iv1A6Vb6qYUDwC069x6MT3QkFeVlR9/
 oMj9i0fwmPk7x0K9D+uAyThfCncNYJUfXGXiDFta279zDUXM5xSZ/diOc
 ZwwO0OLBAMzjOAX+NZ9uosMt8/ch3Kq5O7KAVYBCEVqGYrne7Gc/emlpr
 LRwG80ssGj9SJdAvreMT49thKlJBRIoU1bYrtoY4GpcbZAJ5ZWItUXPeo
 NWezIrAl4Pscty2nTXmJGsUf3qZz5en/vBanu4XStNI1tvvpmgp9ZRwqp
 LXvI3jtKTQQAMGbXI6J0LkzHv1g1CwjBSj6ijTMof8+gahcPKse9i72pK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="332619589"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="332619589"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="765541723"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="765541723"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 17:17:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 17:17:16 -0700
Message-Id: <20230502001727.3211096-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 20/31] drm/xe: Optimize size of xe_vma
 allocation
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

Reduce gt_mask to a u8 from a u64, only allocate userptr state if VMA is
a userptr, and union of destroy callback and worker.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 14 +++--
 drivers/gpu/drm/xe/xe_vm_types.h | 88 +++++++++++++++++---------------
 2 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e5f2fffb2aec..e8d9939ee535 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -814,7 +814,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
 				    bool read_only, bool null,
-				    u64 gt_mask)
+				    u8 gt_mask)
 {
 	struct xe_vma *vma;
 	struct xe_gt *gt;
@@ -823,7 +823,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	XE_BUG_ON(start >= end);
 	XE_BUG_ON(end >= vm->size);
 
-	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	if (!bo && !null)	/* userptr */
+		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
+	else
+		vma = kzalloc(sizeof(*vma) - sizeof(struct xe_userptr),
+			      GFP_KERNEL);
 	if (!vma) {
 		vma = ERR_PTR(-ENOMEM);
 		return vma;
@@ -2149,7 +2153,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u64 gt_mask, u32 region)
+			 u32 operation, u8 gt_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct ww_acquire_ctx ww;
@@ -2234,7 +2238,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u64 gt_mask, bool read_only, bool null)
+			      u8 gt_mask, bool read_only, bool null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -3217,8 +3221,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u64 gt_mask = bind_ops[i].gt_mask;
 		u32 region = bind_ops[i].region;
+		u8 gt_mask = bind_ops[i].gt_mask;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, gt_mask,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 22def5483c12..df4797ec4d7f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -34,22 +34,34 @@ struct xe_vm;
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 8)
 
+/** struct xe_userptr - User pointer */
+struct xe_userptr {
+	/**
+	 * @notifier: MMU notifier for user pointer (invalidation call back)
+	 */
+	struct mmu_interval_notifier notifier;
+	/** @sgt: storage for a scatter gather table */
+	struct sg_table sgt;
+	/** @sg: allocated scatter gather table */
+	struct sg_table *sg;
+	/** @notifier_seq: notifier sequence number */
+	unsigned long notifier_seq;
+	/**
+	 * @initial_bind: user pointer has been bound at least once.
+	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
+	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
+	 */
+	bool initial_bind;
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+	u32 divisor;
+#endif
+};
+
+/** xe_vma - Virtual memory address */
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
 
-	/** @gt_mask: GT mask of where to create binding for this VMA */
-	u64 gt_mask;
-
-	/**
-	 * @gt_present: GT mask of binding are present for this VMA.
-	 * protected by vm->lock, vm->resv and for userptrs,
-	 * vm->userptr.notifier_lock for writing. Needs either for reading,
-	 * but if reading is done under the vm->lock only, it needs to be held
-	 * in write mode.
-	 */
-	u64 gt_present;
-
 	union {
 		/** @userptr_link: link into VM repin list if userptr */
 		struct list_head userptr_link;
@@ -77,16 +89,29 @@ struct xe_vma {
 		} notifier;
 	};
 
-	/** @destroy_cb: callback to destroy VMA when unbind job is done */
-	struct dma_fence_cb destroy_cb;
+	union {
+		/** @destroy_cb: callback to destroy VMA when unbind job is done */
+		struct dma_fence_cb destroy_cb;
+		/** @destroy_work: worker to destroy this BO */
+		struct work_struct destroy_work;
+	};
 
-	/** @destroy_work: worker to destroy this BO */
-	struct work_struct destroy_work;
+	/** @gt_mask: GT mask of where to create binding for this VMA */
+	u8 gt_mask;
+
+	/**
+	 * @gt_present: GT mask of binding are present for this VMA.
+	 * protected by vm->lock, vm->resv and for userptrs,
+	 * vm->userptr.notifier_lock for writing. Needs either for reading,
+	 * but if reading is done under the vm->lock only, it needs to be held
+	 * in write mode.
+	 */
+	u8 gt_present;
 
 	/** @usm: unified shared memory state */
 	struct {
 		/** @gt_invalidated: VMA has been invalidated */
-		u64 gt_invalidated;
+		u8 gt_invalidated;
 	} usm;
 
 	struct {
@@ -97,28 +122,11 @@ struct xe_vma {
 		struct list_head link;
 	} extobj;
 
-	/** @userptr: user pointer state */
-	struct {
-		/**
-		 * @notifier: MMU notifier for user pointer (invalidation call back)
-		 */
-		struct mmu_interval_notifier notifier;
-		/** @sgt: storage for a scatter gather table */
-		struct sg_table sgt;
-		/** @sg: allocated scatter gather table */
-		struct sg_table *sg;
-		/** @notifier_seq: notifier sequence number */
-		unsigned long notifier_seq;
-		/**
-		 * @initial_bind: user pointer has been bound at least once.
-		 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
-		 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
-		 */
-		bool initial_bind;
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-		u32 divisor;
-#endif
-	} userptr;
+	/**
+	 * @userptr: user pointer state, only allocated for VMAs that are
+	 * user pointers
+	 */
+	struct xe_userptr userptr;
 };
 
 struct xe_device;
@@ -387,7 +395,7 @@ struct xe_vma_op {
 	 */
 	struct async_op_fence *fence;
 	/** @gt_mask: gt mask for this operation */
-	u64 gt_mask;
+	u8 gt_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
-- 
2.34.1

