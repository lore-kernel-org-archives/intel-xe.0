Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35984C77B62
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 01:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1617210E2C8;
	Tue,  4 Apr 2023 01:42:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED8910E2A8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 01:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680572551; x=1712108551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ixUKA69Q6pl5WP0uooSUkJCZyg+Hp6zkr3wARUzPAaY=;
 b=ZhtcGLY1hvIlSSof1xRsSpeYnHII0YXwgTV6ctAPcSVyrYoFB8myb0CQ
 CnfTG7LEZ6sRIi5jJq0vruDo4E8QMPjlvLUP+b81glIg3ErBzGRjWz71R
 x4GaELWwhro94dYPMmJeDw2QTwswNFxmFdR60aF8T6/jcNQLLZrgnqeDQ
 zBwxwwSZQ3EgLYRzPfqMHfPKcetyxl67QSk7XItmDxIdjIRXtlKAz172O
 aYgppbQqGcOUUgVI98or3SCgSPS+Xc4p29Bgk2spsNQl9WJhZ6Exp+yic
 493ZNKh+yzOJ9Ekg8uZmgwnNGL9LwabVACCxd/TDmc1Rccy6FWOFABDV2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322456428"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="322456428"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755470842"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="755470842"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 18:42:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  3 Apr 2023 18:42:28 -0700
Message-Id: <20230404014228.3738347-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404014228.3738347-1-matthew.brost@intel.com>
References: <20230404014228.3738347-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 8/8] drm/xe: Optimize size of xe_vma allocation
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
index bacad720e7ba..a3ab257614ef 100644
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
@@ -2148,7 +2152,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u64 gt_mask, u32 region)
+			 u32 operation, u8 gt_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct ww_acquire_ctx ww;
@@ -2233,7 +2237,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u64 gt_mask, bool read_only, bool null)
+			      u8 gt_mask, bool read_only, bool null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -3177,8 +3181,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u64 gt_mask = bind_ops[i].gt_mask;
 		u32 region = bind_ops[i].region;
+		u8 gt_mask = bind_ops[i].gt_mask;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, gt_mask,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index a049dfa9450a..d52f02a457c2 100644
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
@@ -382,7 +390,7 @@ struct xe_vma_op {
 	 */
 	struct async_op_fence *fence;
 	/** @gt_mask: gt mask for this operation */
-	u64 gt_mask;
+	u8 gt_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
-- 
2.34.1

