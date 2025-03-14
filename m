Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E075C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 16:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281110EA10;
	Fri, 14 Mar 2025 16:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzWtj/XT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF3410EA10
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741968155; x=1773504155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GErT11eHt1zMxjuZ4w72pqrzoJ1G1NmsxanSqgdIsXg=;
 b=NzWtj/XTBMkzdNzRAmQLdgWB0Cppwpxak5sINgOOX3oThXLSYtKrnqFz
 a9B5NCspANuJd7x07W+z14/iezzEq4yf8Pj/gJ/A4906eoPMDpgGEDHlH
 4C0u9uX81ofQkMW4LaMVpvqtKfkl3AH+sesPIYIeAj6uCMw7AKH+ViI+c
 0+d0wsHBtykwZ6rFJdB3gmHg59z5d2kCEQhuvenZg3gWmddhhuF7YKBSq
 9J8r9z/KqOQwSjLuGXsOoS8K6EC6ENLM9Jr69rBykTxk5AMNMKaH9Epy2
 F02ULSLQHZwGda1AYV1Gy/ihHs5AeuLz9kMCiKXhBQ+XG1jLmn4jK2YL3 w==;
X-CSE-ConnectionGUID: Nt3h8AMlTP+JCg75GyguGg==
X-CSE-MsgGUID: tNp9vPZyQhC7fmbmzh78dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54120969"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="54120969"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 09:02:35 -0700
X-CSE-ConnectionGUID: OOpAQqi8RvaVUHXG5wkszA==
X-CSE-MsgGUID: ZtoFVO65QQOeEmbq19ElpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121310108"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 14 Mar 2025 09:02:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/1] drm/xe: PREFETCH and MADVISE squash for CI
Date: Fri, 14 Mar 2025 21:56:50 +0530
Message-Id: <20250314162650.2098951-1-himal.prasad.ghimiray@intel.com>
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

[v1]: sending for CI. Do not review
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c         |  89 +----
 drivers/gpu/drm/drm_gpuvm.c          | 173 ++++++++++
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_bo.c           |  21 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   5 +
 drivers/gpu/drm/xe/xe_device.c       |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  24 +-
 drivers/gpu/drm/xe/xe_pt.c           |  86 +++--
 drivers/gpu/drm/xe/xe_svm.c          | 215 +++++++++---
 drivers/gpu/drm/xe/xe_svm.h          |  96 ++++++
 drivers/gpu/drm/xe/xe_vm.c           | 497 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h           |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 375 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h   |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  43 ++-
 include/drm/drm_gpusvm.h             |  96 +++++-
 include/drm/drm_gpuvm.h              |   6 +
 include/uapi/drm/xe_drm.h            | 213 ++++++++++++
 18 files changed, 1747 insertions(+), 222 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 2451c816edd5..d338f2ed62b3 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -391,97 +391,10 @@ struct drm_gpusvm_range *
 drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 		      unsigned long end)
 {
-	struct interval_tree_node *itree;
-
-	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
-
-	if (itree)
-		return container_of(itree, struct drm_gpusvm_range, itree);
-	else
-		return NULL;
+	return __drm_gpusvm_range_find(notifier, start, end);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
 
-/**
- * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
- * @range__: Iterator variable for the ranges
- * @next__: Iterator variable for the ranges temporay storage
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the range
- * @end__: End address of the range
- *
- * This macro is used to iterate over GPU SVM ranges in a notifier while
- * removing ranges from it.
- */
-#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
-	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
-	     (next__) = __drm_gpusvm_range_next(range__);				\
-	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
-	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
-
-/**
- * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
- * @notifier: a pointer to the current drm_gpusvm_notifier
- *
- * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
- *         the current notifier is the last one or if the input notifier is
- *         NULL.
- */
-static struct drm_gpusvm_notifier *
-__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
-{
-	if (notifier && !list_is_last(&notifier->entry,
-				      &notifier->gpusvm->notifier_list))
-		return list_next_entry(notifier, entry);
-
-	return NULL;
-}
-
-static struct drm_gpusvm_notifier *
-notifier_iter_first(struct rb_root_cached *root, unsigned long start,
-		    unsigned long last)
-{
-	struct interval_tree_node *itree;
-
-	itree = interval_tree_iter_first(root, start, last);
-
-	if (itree)
-		return container_of(itree, struct drm_gpusvm_notifier, itree);
-	else
-		return NULL;
-}
-
-/**
- * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
- * @notifier__: Iterator variable for the notifiers
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the notifier
- * @end__: End address of the notifier
- *
- * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
- */
-#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
-	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
-	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
-	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
-
-/**
- * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
- * @notifier__: Iterator variable for the notifiers
- * @next__: Iterator variable for the notifiers temporay storage
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the notifier
- * @end__: End address of the notifier
- *
- * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
- * removing notifiers from it.
- */
-#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
-	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
-	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
-	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
-	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
-
 /**
  * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
  * @mni: Pointer to the mmu_interval_notifier structure.
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..c05c23c0efa5 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2240,6 +2240,143 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			 req_obj, req_offset);
 }
 
+static int
+__drm_gpuvm_skip_split_map(struct drm_gpuvm *gpuvm,
+			   const struct drm_gpuvm_ops *ops, void *priv,
+			   u64 req_addr, u64 req_range,
+			   bool skip_gem_obj_va, u64 req_offset)
+{
+	struct drm_gpuva *va, *next;
+	u64 req_end = req_addr + req_range;
+	int ret;
+
+	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
+		return -EINVAL;
+
+	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
+		struct drm_gem_object *obj = va->gem.obj;
+		u64 offset = va->gem.offset;
+		u64 addr = va->va.addr;
+		u64 range = va->va.range;
+		u64 end = addr + range;
+
+		if (addr == req_addr) {
+			if (end == req_end)
+				return 0;
+
+			if (end < req_end)
+				continue;
+
+			if (end > req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = range - req_range,
+					.gem.obj = obj,
+					.gem.offset = offset + req_range,
+				};
+				struct drm_gpuva_op_unmap u = {
+					.va = va,
+					.keep = false,
+				};
+
+				ret = op_remap_cb(ops, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+
+				break;
+			}
+		} else if (addr < req_addr) {
+			u64 ls_range = req_addr - addr;
+			struct drm_gpuva_op_map p = {
+				.va.addr = addr,
+				.va.range = ls_range,
+				.gem.obj = obj,
+				.gem.offset = offset,
+			};
+			struct drm_gpuva_op_unmap u = { .va = va, .keep = false, };
+
+			if (end == req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				ret = op_remap_cb(ops, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+
+			if (end < req_end) {
+				if (skip_gem_obj_va && !!obj)
+					continue;
+
+				ret = op_remap_cb(ops, priv, &p, NULL, &u);
+				if (ret)
+					return ret;
+
+				ret = op_map_cb(ops, priv, req_addr,
+						min(end - req_addr, req_end - end),
+						NULL, req_offset);
+				if (ret)
+					return ret;
+				continue;
+			}
+
+			if (end > req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + ls_range +
+						      req_range,
+				};
+
+				ret = op_remap_cb(ops, priv, &p, &n, &u);
+				if (ret)
+					return ret;
+				break;
+			}
+		} else if (addr > req_addr) {
+			if (end == req_end)
+				return 0;
+
+			if (end < req_end)
+				continue;
+
+			if (end > req_end) {
+				if (skip_gem_obj_va && !!obj)
+					return 0;
+
+				struct drm_gpuva_op_map n = {
+					.va.addr = req_end,
+					.va.range = end - req_end,
+					.gem.obj = obj,
+					.gem.offset = offset + req_end - addr,
+				};
+				struct drm_gpuva_op_unmap u = {
+					.va = va,
+					.keep = false,
+				};
+
+				ret = op_remap_cb(ops, priv, NULL, &n, &u);
+				if (ret)
+					return ret;
+				return op_map_cb(ops, priv, addr,
+						 (req_end - addr), NULL, req_offset);
+			}
+		}
+	}
+
+	return op_map_cb(ops, priv,
+			 req_addr, req_range,
+			 NULL, req_offset);
+}
+
 static int
 __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 		     const struct drm_gpuvm_ops *ops, void *priv,
@@ -2548,6 +2685,42 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_ops_create);
 
+struct drm_gpuva_ops *
+drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
+			     u64 req_addr, u64 req_range,
+			     bool skip_gem_obj_va, u64 req_offset)
+{
+	struct drm_gpuva_ops *ops;
+	struct {
+		struct drm_gpuvm *vm;
+		struct drm_gpuva_ops *ops;
+	} args;
+	int ret;
+
+	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
+	if (unlikely(!ops))
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&ops->list);
+
+	args.vm = gpuvm;
+	args.ops = ops;
+
+	ret = __drm_gpuvm_skip_split_map(gpuvm, &gpuvm_list_ops, &args,
+					 req_addr, req_range,
+					 skip_gem_obj_va, req_offset);
+
+	if (ret || list_empty(&ops->list))
+		goto err_free_ops;
+
+	return ops;
+
+err_free_ops:
+	drm_gpuva_ops_free(gpuvm, ops);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_madvise_ops_create);
+
 /**
  * drm_gpuvm_sm_unmap_ops_create() - creates the &drm_gpuva_ops to split on
  * unmap
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 75a79390a0e3..ec7a3edf467a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -116,6 +116,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vm_madvise.o \
 	xe_vram.o \
 	xe_vram_freq.o \
 	xe_vsec.o \
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0c7a7f5e5596..0596348f7ff6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1329,6 +1329,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
+static bool should_migrate_to_smem(struct xe_bo *bo)
+{
+	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
+	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
+}
+
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -1337,7 +1343,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1349,8 +1355,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+		if (should_migrate_to_smem(bo)) {
+			r = xe_bo_migrate(bo, XE_PL_TT);
+			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
+				ret = VM_FAULT_NOPAGE;
+			else if (r)
+				ret = VM_FAULT_SIGBUS;
+		}
+		if (!ret)
+			ret = ttm_bo_vm_fault_reserved(vmf,
+						       vmf->vma->vm_page_prot,
+						       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 15a92e3d4898..bac21a4f6805 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -58,6 +58,11 @@ struct xe_bo {
 	 */
 	struct list_head client_link;
 #endif
+	/** @attr: User controlled attributes for bo */
+	struct {
+		/** @atomic_access: type of atomic access bo needs */
+		u32 atomic_access;
+	} attr;
 	/**
 	 * @pxp_key_instance: PXP key instance this BO was created against. A
 	 * 0 in this variable indicates that the BO does not use PXP encryption.
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2f7d727c9392..8ad5e5523e38 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -57,6 +57,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vram.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
@@ -193,6 +194,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS, xe_vm_query_vmas_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9fa11e837dd1..19f5df40a4ed 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -72,28 +72,6 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 		!(BIT(tile->id) & vma->tile_invalidated);
 }
 
-static bool vma_matches(struct xe_vma *vma, u64 page_addr)
-{
-	if (page_addr > xe_vma_end(vma) - 1 ||
-	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
-		return false;
-
-	return true;
-}
-
-static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
-{
-	struct xe_vma *vma = NULL;
-
-	if (vm->usm.last_fault_vma) {   /* Fast lookup */
-		if (vma_matches(vm->usm.last_fault_vma, page_addr))
-			vma = vm->usm.last_fault_vma;
-	}
-	if (!vma)
-		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
-
-	return vma;
-}
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		       bool atomic, unsigned int id)
@@ -231,7 +209,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	vma = lookup_vma(vm, pf->page_addr);
+	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
 	if (!vma) {
 		err = -EINVAL;
 		goto unlock_vm;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ffaf0d02dc7d..88ceff3250e3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -503,7 +503,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
-	u16 pat_index = xe_walk->vma->pat_index;
+	u16 pat_index = xe_walk->vma->attr.pat_index;
 	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_vm *vm = xe_walk->vm;
 	struct xe_pt *xe_child;
@@ -700,7 +700,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			 * gets migrated to LMEM, bind such allocations with
 			 * device atomics enabled.
 			 */
-			else if (is_devmem)
+			else if (is_devmem || (xe->info.has_device_atomics_on_smem &&
+					       vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
 				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 		} else {
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
@@ -1425,7 +1426,8 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
 	struct xe_vma_op *op;
-	int err;
+	int ranges_count;
+	int err, i;
 
 	err = xe_pt_pre_commit(pt_update);
 	if (err)
@@ -1434,20 +1436,33 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 	xe_svm_notifier_lock(vm);
 
 	list_for_each_entry(op, &vops->list, link) {
-		struct xe_svm_range *range = op->map_range.range;
+		struct xe_svm_range *range = NULL;
 
 		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			continue;
 
-		xe_svm_range_debug(range, "PRE-COMMIT");
+		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
+			xe_assert(vm->xe,
+				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
+			ranges_count = op->prefetch_range.ranges_count;
+		} else {
+			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
+			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+			ranges_count  = 1;
+		}
 
-		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
-		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
+		for (i = 0; i < ranges_count; i++) {
+			if (op->base.op == DRM_GPUVA_OP_PREFETCH)
+				range = xa_load(&op->prefetch_range.range, i);
+			else
+				range = op->map_range.range;
+			xe_svm_range_debug(range, "PRE-COMMIT");
 
-		if (!xe_svm_range_pages_valid(range)) {
-			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
-			xe_svm_notifier_unlock(vm);
-			return -EAGAIN;
+			if (!xe_svm_range_pages_valid(range)) {
+				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
+				xe_svm_notifier_unlock(vm);
+				return -EAGAIN;
+			}
 		}
 	}
 
@@ -2028,12 +2043,21 @@ static int op_prepare(struct xe_vm *vm,
 	case DRM_GPUVA_OP_PREFETCH:
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
-
-		if (xe_vma_is_cpu_addr_mirror(vma))
-			break;
-
-		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
-		pt_update_ops->wait_vm_kernel = true;
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			struct xe_svm_range *range;
+			int i;
+
+			for (i = 0; i < op->prefetch_range.ranges_count; i++) {
+				range = xa_load(&op->prefetch_range.range, i);
+				err = bind_range_prepare(vm, tile, pt_update_ops,
+							 vma, range);
+				if (err)
+					return err;
+			}
+		} else {
+			err = bind_op_prepare(vm, tile, pt_update_ops, vma);
+			pt_update_ops->wait_vm_kernel = true;
+		}
 		break;
 	}
 	case DRM_GPUVA_OP_DRIVER:
@@ -2178,6 +2202,16 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	}
 }
 
+static void range_present_and_invalidated_tile(struct xe_vm *vm,
+					       struct xe_svm_range *range,
+					       u8 tile_id)
+{
+	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
+
+	range->tile_present |= BIT(tile_id);
+	range->tile_invalidated &= ~BIT(tile_id);
+}
+
 static void op_commit(struct xe_vm *vm,
 		      struct xe_tile *tile,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
@@ -2225,19 +2259,25 @@ static void op_commit(struct xe_vm *vm,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 
-		if (!xe_vma_is_cpu_addr_mirror(vma))
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			for (int i = 0 ; i < op->prefetch_range.ranges_count; i++) {
+				struct xe_svm_range *range = xa_load(&op->prefetch_range.range, i);
+
+				range_present_and_invalidated_tile(vm, range, tile->id);
+			}
+		} else {
 			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
 				       fence2);
+		}
 		break;
 	}
 	case DRM_GPUVA_OP_DRIVER:
 	{
-		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
-			op->map_range.range->tile_present |= BIT(tile->id);
-			op->map_range.range->tile_invalidated &= ~BIT(tile->id);
-		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
+		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
+			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
+		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			op->unmap_range.range->tile_present &= ~BIT(tile->id);
-		}
+
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 08617a62ab07..8c8ecd779819 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -36,21 +36,6 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
-static unsigned long xe_svm_range_start(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_start(&range->base);
-}
-
-static unsigned long xe_svm_range_end(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_end(&range->base);
-}
-
-static unsigned long xe_svm_range_size(struct xe_svm_range *range)
-{
-	return drm_gpusvm_range_size(&range->base);
-}
-
 #define range_debug(r__, operaton__)					\
 	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
 	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
@@ -94,11 +79,6 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
 	kfree(range);
 }
 
-static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
-{
-	return container_of(r, struct xe_svm_range, base);
-}
-
 static void
 xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 				   const struct mmu_notifier_range *mmu_range)
@@ -656,9 +636,9 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 	return &tile->mem.vram;
 }
 
-static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_svm_range *range,
-			     const struct drm_gpusvm_ctx *ctx)
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
 {
 	struct mm_struct *mm = vm->svm.gpusvm.mm;
 	struct xe_vram_region *vr = tile_to_vr(tile);
@@ -710,6 +690,68 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	return err;
 }
 
+static bool migrate_to_support_atomic(struct xe_device *xe, struct xe_vma *vma)
+{
+	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
+	    (xe->info.has_device_atomics_on_smem &&
+	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
+		return false;
+
+	return true;
+}
+
+static bool supports_4K_migration(struct xe_device *xe)
+{
+	if (xe->info.platform == XE_BATTLEMAGE)
+		return true;
+
+	return false;
+}
+
+/**
+ * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
+ * @range: SVM range for which migration needs to be decided
+ * @vma: vma which has range
+ * @region: default placement for range
+ *
+ * Return: True for range needing migration and migration is supported else false
+ */
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 region)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	u64 range_size = xe_svm_range_size(range);
+	bool needs_migrate = false;
+
+	if (!range->base.flags.migrate_devmem)
+		return false;
+
+	needs_migrate = migrate_to_support_atomic(vm->xe, vma) || region;
+
+	if (needs_migrate && !IS_DGFX(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
+		return false;
+	}
+
+	if (needs_migrate && xe_svm_range_in_vram(range)) {
+		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
+		return false;
+	}
+
+	if (needs_migrate && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
+		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		return false;
+	}
+
+	return needs_migrate;
+}
+
+static const u32 region_to_mem_type[] = {
+	XE_PL_TT,
+	XE_PL_VRAM0,
+	XE_PL_VRAM1,
+};
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -735,12 +777,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 	};
 	struct xe_svm_range *range;
-	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
 	ktime_t end = 0;
 	int err;
+	int migrate_try_count = 3;
+	u32 region;
 
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
@@ -753,41 +796,44 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
-					    xe_vma_start(vma), xe_vma_end(vma),
-					    &ctx);
-	if (IS_ERR(r))
-		return PTR_ERR(r);
+	range = xe_svm_range_find_or_insert(vm, fault_addr, vma);
+
+	if (IS_ERR(range))
+		return PTR_ERR(range);
 
-	range = to_xe_range(r);
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
 	range_debug(range, "PAGE FAULT");
 
-	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
-	    xe_svm_range_size(range) >= SZ_64K) {
-		range->skip_migrate = true;
+	region = vma->attr.preferred_loc.devmem_fd;
+
+	if (xe_svm_range_needs_migrate_to_vram(range, vma, region)) {
+		migrate_try_count--;
+		region = region ? region : 1;
+		/* Need rework for multigpu */
+		tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (err) {
-			drm_dbg(&vm->xe->drm,
-				"VRAM allocation failed, falling back to "
-				"retrying fault, asid=%u, errno=%pe\n",
-				vm->usm.asid, ERR_PTR(err));
-			goto retry;
+			if (migrate_try_count) {
+				drm_dbg(&vm->xe->drm,
+					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				goto retry;
+			} else {
+				drm_err(&vm->xe->drm,
+					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				return err;
+			}
 		}
 	}
 
 	range_debug(range, "GET PAGES");
-	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
+	err = xe_svm_range_get_pages(vm, range, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		if (err == -EOPNOTSUPP) {
-			range_debug(range, "PAGE FAULT - EVICT PAGES");
-			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
-		}
 		drm_dbg(&vm->xe->drm,
 			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
 			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
@@ -852,6 +898,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
 
+/**
+ * xe_svm_range_clean_if_addr_within - Clean SVM mappings and ranges
+ * @start: start addr
+ * @end: end addr
+ *
+ * This function cleans up svm ranges if start or end address are inside them.
+ */
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier, *next;
+
+	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *range, *__next;
+
+		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
+			if (start > drm_gpusvm_range_start(range) ||
+			    end < drm_gpusvm_range_end(range)) {
+				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
+					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
+				__xe_svm_garbage_collector(vm, to_xe_range(range));
+			}
+		}
+	}
+}
+
 /**
  * xe_svm_bo_evict() - SVM evict BO to system memory
  * @bo: BO to evict
@@ -866,6 +937,62 @@ int xe_svm_bo_evict(struct xe_bo *bo)
 	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
 }
 
+/**
+ * xe_svm_range_find_or_insert- Find or insert GPU SVM range
+ * @vm: xe_vm pointer
+ * @addr: address for which range needs to be found/inserted
+ * @vma:  Pointer to struct xe_vma which mirrors CPU
+ *
+ * This function finds or inserts a newly allocated a SVM range based on the
+ * address.
+ *
+ * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
+ */
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma)
+{
+	struct drm_gpusvm_range *r;
+
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+		.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.check_pages_threshold = IS_DGFX(vm->xe) &&
+					 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+	};
+
+	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
+					    xe_vma_start(vma), xe_vma_end(vma), &ctx);
+	if (IS_ERR(r))
+		return ERR_PTR(PTR_ERR(r));
+
+	return to_xe_range(r);
+}
+
+/**
+ * xe_svm_range_get_pages() - Get pages for a SVM range
+ * @vm: Pointer to the struct xe_vm
+ * @range: Pointer to the xe SVM range structure
+ * @ctx: GPU SVM context
+ *
+ * This function gets pages for a SVM range and ensures they are mapped for
+ * DMA access. In case of failure with -EOPNOTSUPP, it evicts the range.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx)
+{
+	int err = 0;
+
+	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
+	if (err == -EOPNOTSUPP) {
+		range_debug(range, "PAGE FAULT - EVICT PAGES");
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+	}
+
+	return err;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct drm_pagemap_device_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 93442738666e..1e0aed2c801b 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -73,6 +73,21 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx);
+
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma);
+
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx);
+
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
+
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 prefetch_region);
 #else
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
@@ -125,8 +140,57 @@ static inline
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
+
+static inline
+int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+		      struct xe_svm_range *range,
+		      const struct drm_gpusvm_ctx *ctx)
+{
+	return 0;
+}
+
+static inline
+struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
+						 struct xe_vma *vma)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline
+int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
+			   struct drm_gpusvm_ctx *ctx)
+{
+	return -EINVAL;
+}
+
+static inline
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
+{
+}
+
+static inline
+bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
+					u32 prefetch_region)
+{
+	return false;
+}
+
 #endif
 
+/**
+ * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
+ * @r: Pointer to the drm_gpusvm_range structure
+ *
+ * This function takes a pointer to a drm_gpusvm_range structure and
+ * converts it to a pointer to the containing xe_svm_range structure.
+ *
+ * Return: Pointer to the xe_svm_range structure
+ */
+static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
+{
+	return container_of(r, struct xe_svm_range, base);
+}
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -139,6 +203,38 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.flags.has_dma_mapping;
 }
 
+/**
+ * xe_svm_range_start() - SVM range start address
+ * @range: SVM range
+ *
+ * Return: start address of range.
+ */
+static inline unsigned long xe_svm_range_start(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_start(&range->base);
+}
+
+/**
+ * xe_svm_range_start() - SVM range end address
+ * @range: SVM range
+ *
+ * Return: end address of range.
+ */
+static inline unsigned long xe_svm_range_end(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_end(&range->base);
+}
+
+/**
+ * xe_svm_range_start() - SVM range size
+ * @range: SVM range
+ *
+ * Return: Size of range.
+ */
+static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_size(&range->base);
+}
 #define xe_svm_assert_in_notifier(vm__) \
 	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 60303998bd61..5e174b7d57e0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -798,21 +798,47 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 }
 ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
 
+static void clean_svm_prefetch_op(struct xe_vma_op *op)
+{
+	struct xe_vma *vma;
+
+	vma = gpuva_to_vma(op->base.prefetch.va);
+
+	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma)) {
+		xa_destroy(&op->prefetch_range.range);
+		op->prefetch_range.ranges_count = 0;
+	}
+}
+
+static void clean_svm_prefetch_in_vma_ops(struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+
+	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
+		return;
+
+	list_for_each_entry(op, &vops->list, link) {
+		clean_svm_prefetch_op(op);
+	}
+}
+
 static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 {
 	int i;
 
+	clean_svm_prefetch_in_vma_ops(vops);
+
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		kfree(vops->pt_update_ops[i].ops);
 }
 
-static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, u8 inc_val)
 {
 	int i;
 
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		if (BIT(i) & tile_mask)
-			++vops->pt_update_ops[i].num_ops;
+			vops->pt_update_ops[i].num_ops += inc_val;
 }
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
@@ -842,7 +868,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 	xe_vm_populate_rebind(op, vma, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -977,7 +1003,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -1062,7 +1088,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_unbind(op, range);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
+	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
 
 	return 0;
 }
@@ -1195,7 +1221,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->pat_index = pat_index;
+	vma->attr.pat_index = pat_index;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
@@ -2135,6 +2161,129 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_query_num_vmas *args = data;
+	struct drm_gpuva *gpuva;
+	struct xe_vm *vm;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	args->num_vmas = 0;
+	down_write(&vm->lock);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, args->start, args->start + args->range)
+		args->num_vmas++;
+
+	up_write(&vm->lock);
+	return 0;
+}
+
+static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
+			 u64 end, struct drm_xe_vma_mem_attr *mem_attrs)
+{
+	struct drm_gpuva *gpuva;
+	int i = 0;
+
+	lockdep_assert_held(&vm->lock);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (i == *num_vmas)
+			return -EINVAL;
+
+		mem_attrs[i].start = xe_vma_start(vma);
+		mem_attrs[i].end = xe_vma_end(vma);
+		mem_attrs[i].atomic.val = vma->attr.atomic_access;
+		mem_attrs[i].pat_index.val = vma->attr.pat_index;
+		mem_attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
+		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
+
+		i++;
+	}
+
+	if (i <  (*num_vmas - 1))
+		*num_vmas = i;
+	return 0;
+}
+
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vma_mem_attr *mem_attrs;
+	struct drm_xe_vm_query_vmas_attr *args = data;
+	u64 __user *attrs_user = NULL;
+	struct xe_vm *vm;
+	int err;
+
+	if (XE_IOCTL_DBG(xe, args->num_vmas < 1))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	down_write(&vm->lock);
+
+	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
+	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
+				   GFP_KERNEL | __GFP_ACCOUNT |
+				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!mem_attrs)
+		return args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
+
+	err = get_mem_attrs(vm, &args->num_vmas, args->start,
+			    args->start + args->range, mem_attrs);
+	if (err)
+		goto free_mem_attrs;
+
+	err = __copy_to_user(attrs_user, mem_attrs,
+			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
+
+free_mem_attrs:
+	kvfree(mem_attrs);
+
+	up_write(&vm->lock);
+
+	return err;
+}
+
+static bool vma_matches(struct xe_vma *vma, u64 page_addr)
+{
+	if (page_addr > xe_vma_end(vma) - 1 ||
+	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
+		return false;
+
+	return true;
+}
+
+/**
+ * xe_vm_find_vma_by_addr() - Find a VMA by its address
+ *
+ * @vm: the xe_vm the vma belongs to
+ * @page_address: address to look up
+ */
+struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
+{
+	struct xe_vma *vma = NULL;
+
+	if (vm->usm.last_fault_vma) {   /* Fast lookup */
+		if (vma_matches(vm->usm.last_fault_vma, page_addr))
+			vma = vm->usm.last_fault_vma;
+	}
+	if (!vma)
+		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
+
+	return vma;
+}
+
 static const u32 region_to_mem_type[] = {
 	XE_PL_TT,
 	XE_PL_VRAM0,
@@ -2201,13 +2350,25 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 }
 #endif
 
+static void clean_svm_prefetch_in_gpuva_ops(struct drm_gpuva_ops *ops)
+{
+	struct drm_gpuva_op *__op;
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		clean_svm_prefetch_op(op);
+	}
+}
+
 /*
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
  */
 static struct drm_gpuva_ops *
-vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
-			 u64 bo_offset_or_userptr, u64 addr, u64 range,
+vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
+			 struct xe_bo *bo, u64 bo_offset_or_userptr,
+			 u64 addr, u64 range,
 			 u32 operation, u32 flags,
 			 u32 prefetch_region, u16 pat_index)
 {
@@ -2215,6 +2376,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct drm_gpuvm_bo *vm_bo;
+	u64 range_end = addr + range;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2273,19 +2435,82 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			struct xe_vma *old =
+				gpuva_to_vma(op->base.remap.unmap->va);
+			u64 start = xe_vma_start(old), end = xe_vma_end(old);
+
+			if (op->base.remap.prev)
+				start = op->base.remap.prev->va.addr +
+					op->base.remap.prev->va.range;
+			if (op->base.remap.next)
+				end = op->base.remap.next->va.addr;
+
+			if (xe_vma_is_cpu_addr_mirror(old) &&
+			    xe_svm_has_mapping(vm, start, end)) {
+				drm_gpuva_ops_free(&vm->gpuvm, ops);
+				return ERR_PTR(-EBUSY);
+			}
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
-			op->prefetch.region = prefetch_region;
-		}
+			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+			if (!xe_vma_is_cpu_addr_mirror(vma)) {
+				op->prefetch.region = prefetch_region;
+				break;
+			}
 
+			op->prefetch_range.region = prefetch_region;
+			struct xe_svm_range *svm_range;
+			int i = 0;
+
+			xa_init(&op->prefetch_range.range);
+			op->prefetch_range.ranges_count = 0;
+alloc_next_range:
+			svm_range = xe_svm_range_find_or_insert(vm, addr, vma);
+
+			if (PTR_ERR(svm_range) == -ENOENT)
+				break;
+
+			if (IS_ERR(svm_range)) {
+				err = PTR_ERR(svm_range);
+				goto unwind_prefetch_ops;
+			}
+
+			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
+			op->prefetch_range.ranges_count++;
+			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
+
+			if (range_end > xe_svm_range_end(svm_range) &&
+			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
+				i++;
+				addr = xe_svm_range_end(svm_range);
+				goto alloc_next_range;
+			}
+		}
 		print_op(vm->xe, __op);
 	}
 
 	return ops;
+
+unwind_prefetch_ops:
+	clean_svm_prefetch_in_gpuva_ops(ops);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return ERR_PTR(err);
 }
+
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
+static void cp_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)
+{
+	dst->preferred_loc.migration_policy = src->preferred_loc.migration_policy;
+	dst->preferred_loc.devmem_fd =  dst->preferred_loc.devmem_fd;
+	dst->atomic_access = src->atomic_access;
+	dst->pat_index = src->pat_index;
+}
+
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u16 pat_index, unsigned int flags)
+			      struct xe_vma_mem_attr attr, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
@@ -2314,7 +2539,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr.pat_index, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2333,6 +2558,8 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		vma = ERR_PTR(err);
 	}
 
+	cp_mem_attr(&vma->attr, &attr);
+
 	return vma;
 }
 
@@ -2457,6 +2684,17 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			struct xe_vma_mem_attr default_attr = {
+				.preferred_loc = {
+						  /*TODO: assign devmem_fd of local vram
+						   * once multi device support is added.
+						   */
+						   .devmem_fd = IS_DGFX(vm->xe) ? 1 : 0,
+						   .migration_policy = 1,	},
+				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
+				.pat_index = op->map.pat_index
+			};
+
 			flags |= op->map.read_only ?
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
@@ -2466,7 +2704,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2475,7 +2713,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
 			    !op->map.is_cpu_addr_mirror)
 				xe_vma_ops_incr_pt_update_ops(vops,
-							      op->tile_mask);
+							      op->tile_mask, 1);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2493,7 +2731,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (xe_vma_is_cpu_addr_mirror(old) &&
 			    xe_svm_has_mapping(vm, start, end))
-				return -EBUSY;
+				xe_svm_range_clean_if_addr_within(vm, start, end);
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
@@ -2512,7 +2750,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2536,13 +2774,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 				}
 			}
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2565,11 +2803,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 				}
 			}
 			if (!skip)
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
@@ -2581,7 +2819,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return -EBUSY;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		case DRM_GPUVA_OP_PREFETCH:
 			vma = gpuva_to_vma(op->base.prefetch.va);
@@ -2592,8 +2830,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					return err;
 			}
 
-			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (xe_vma_is_cpu_addr_mirror(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
+							      op->prefetch_range.ranges_count);
+			else
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
+
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
@@ -2719,6 +2961,65 @@ static int check_ufence(struct xe_vma *vma)
 	return 0;
 }
 
+static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
+					 struct xe_vma_op *op)
+{
+	int err = 0;
+
+	if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+		struct drm_gpusvm_ctx ctx = {
+			.read_only = xe_vma_read_only(vma),
+			.devmem_possible = IS_DGFX(vm->xe) &&
+					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+			.check_pages_threshold = IS_DGFX(vm->xe) &&
+						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
+						 SZ_64K : 0,
+		};
+		struct xe_svm_range *svm_range;
+		struct xe_tile *tile;
+		u32 region;
+		int i;
+
+		if (!xe_vma_is_cpu_addr_mirror(vma))
+			return 0;
+
+		region = (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) ?
+			  vma->attr.preferred_loc.devmem_fd : op->prefetch_range.region;
+
+		/* TODO: Threading the migration
+		 * TODO: Multigpu support migration
+		 */
+		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
+			svm_range = xa_load(&op->prefetch_range.range, i);
+
+			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+				region = region ? region : 1;
+				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
+				if (err) {
+					drm_err(&vm->xe->drm, "VRAM allocation failed, can be retried from userspace, asid=%u, gpusvm=0x%016llx, errno=%pe\n",
+						vm->usm.asid, (u64)&vm->svm.gpusvm, ERR_PTR(err));
+					return -ENODATA;
+				}
+				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
+			}
+
+			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
+			if (err) {
+				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
+					err = -ENODATA;
+
+				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=0x%016llx, errno=%pe\n",
+					vm->usm.asid, (u64)&vm->svm.gpusvm, ERR_PTR(err));
+				return err;
+			}
+			xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
+		}
+	}
+	return err;
+}
+
 static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 			    struct xe_vma_op *op)
 {
@@ -2755,16 +3056,29 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_PREFETCH:
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
-		u32 region = op->prefetch.region;
+		u32 region;
+
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			region = op->prefetch_range.region;
+		else
+			region = op->prefetch.region;
 
-		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
+			  region <= ARRAY_SIZE(region_to_mem_type));
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
 					    false);
-		if (!err && !xe_vma_has_no_bo(vma))
-			err = xe_bo_migrate(xe_vma_bo(vma),
+		if (!err && !xe_vma_has_no_bo(vma)) {
+			struct xe_bo *bo = xe_vma_bo(vma);
+
+			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
+			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
+				region = 1;
+
+			err = xe_bo_migrate(bo,
 					    region_to_mem_type[region]);
+		}
 		break;
 	}
 	default:
@@ -2774,6 +3088,23 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	return err;
 }
 
+static int xe_vma_ops_execute_ready(struct xe_vm *vm, struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+	int err;
+
+	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
+		return 0;
+
+	list_for_each_entry(op, &vops->list, link) {
+		err = prefetch_ranges_lock_and_prep(vm, op);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 					   struct xe_vm *vm,
 					   struct xe_vma_ops *vops)
@@ -2796,7 +3127,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
 		return -ENOSPC;
 #endif
-
 	return 0;
 }
 
@@ -3057,6 +3387,16 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
+static bool addr_not_in_cpu_addr_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma *vma;
+
+	down_write(&vm->lock);
+	vma = xe_vm_find_vma_by_addr(vm, addr);
+	up_write(&vm->lock);
+	return !xe_vma_is_cpu_addr_mirror(vma);
+}
+
 static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
@@ -3156,8 +3496,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
-				       xe->info.mem_region_mask)) ||
+		    XE_IOCTL_DBG(xe, (is_cpu_addr_mirror &&
+				      prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) &&
+				      !(BIT(prefetch_region) & xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
@@ -3165,8 +3506,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		}
 
 		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
+		    XE_IOCTL_DBG(xe, (addr & ~PAGE_MASK) &&
+				 (addr_not_in_cpu_addr_vma(vm, addr) ||
+				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
+		    XE_IOCTL_DBG(xe, (range & ~PAGE_MASK) &&
+				 (addr_not_in_cpu_addr_vma(vm, addr) ||
+				 op != DRM_XE_VM_BIND_OP_PREFETCH)) ||
 		    XE_IOCTL_DBG(xe, !range &&
 				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
@@ -3215,6 +3560,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->q = q;
 	vops->syncs = syncs;
 	vops->num_syncs = num_syncs;
+	vops->flags = false;
 }
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
@@ -3423,7 +3769,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
 
-		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
+		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
 						  addr, range, op, flags,
 						  prefetch_region, pat_index);
 		if (IS_ERR(ops[i])) {
@@ -3456,6 +3802,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto unwind_ops;
 
+	err = xe_vma_ops_execute_ready(vm, &vops);
+	if (err)
+		goto unwind_ops;
+
 	fence = vm_bind_ioctl_ops_execute(vm, &vops);
 	if (IS_ERR(fence))
 		err = PTR_ERR(fence);
@@ -3525,7 +3875,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	xe_vma_ops_init(&vops, vm, q, NULL, 0);
 
-	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
+	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
 				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
 				       vm->xe->pat.idx[cache_lvl]);
 	if (IS_ERR(ops)) {
@@ -3866,3 +4216,82 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct drm_gpuva_op *__op;
+	bool is_cpu_addr_mirror = false;
+	int err;
+
+	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
+
+	if (start & ~PAGE_MASK)
+		start = ALIGN_DOWN(start, SZ_4K);
+
+	if (range & ~PAGE_MASK)
+		range = ALIGN(range, SZ_4K);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+	ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, start, range, true, start);
+	if (!ops)
+		return 0;
+
+	if (IS_ERR(ops)) {
+		err = PTR_ERR(ops);
+		goto unwind_ops;
+	}
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		if (__op->op == DRM_GPUVA_OP_REMAP) {
+			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
+				is_cpu_addr_mirror = true;
+			else
+				is_cpu_addr_mirror = false;
+		}
+
+		if (__op->op == DRM_GPUVA_OP_MAP)
+			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+
+		print_op(vm->xe, __op);
+	}
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
+	if (err)
+		goto unwind_ops;
+
+	xe_vm_lock(vm, false);
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma;
+		struct xe_vma_mem_attr temp_attr;
+
+		if (__op->op == DRM_GPUVA_OP_UNMAP) {
+			/* There should be no unmap */
+			xe_assert(vm->xe, true);
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			vma = gpuva_to_vma(op->base.remap.unmap->va);
+			cp_mem_attr(&temp_attr, &vma->attr);
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_MAP) {
+			vma = op->map.vma;
+			cp_mem_attr(&vma->attr, &temp_attr);
+		}
+	}
+
+	xe_vm_unlock(vm);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return 0;
+
+unwind_ops:
+	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
+	if (ops)
+		drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0ef811fc2bde..0b2d6e9f77ef 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -169,6 +169,10 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 		!xe_vma_is_cpu_addr_mirror(vma);
 }
 
+struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
+
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
@@ -189,7 +193,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
-
+int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 void xe_vm_close_and_put(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
@@ -216,6 +221,9 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
+bool xe_vma_has_preferred_mem_loc(struct xe_vma *vma,
+				  u32 *mem_region, u32 *devmem_fd);
+
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
new file mode 100644
index 000000000000..bbae2faee603
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_vm_madvise.h"
+
+#include <linux/nospec.h>
+#include <drm/ttm/ttm_tt.h>
+#include <drm/xe_drm.h>
+
+#include "xe_bo.h"
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_pt.h"
+#include "xe_svm.h"
+
+static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
+				u64 addr, u64 range)
+{
+	struct xe_vma **vmas, **__vmas;
+	struct drm_gpuva *gpuva;
+	int max_vmas = 8;
+
+	lockdep_assert_held(&vm->lock);
+
+	*num_vmas = 0;
+	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
+	if (!vmas)
+		return NULL;
+
+	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (*num_vmas == max_vmas) {
+			max_vmas <<= 1;
+			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
+			if (!__vmas) {
+				kfree(vmas);
+				return NULL;
+			}
+			vmas = __vmas;
+		}
+
+		vmas[*num_vmas] = vma;
+		(*num_vmas)++;
+	}
+
+	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
+
+	if (!*num_vmas) {
+		kfree(vmas);
+		return NULL;
+	}
+
+	return vmas;
+}
+
+static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
+				     struct xe_vma **vmas, int num_vmas,
+				     struct drm_xe_madvise_ops ops)
+{
+	s32 devmem_fd;
+	u32 migration_policy;
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
+	vm_dbg(&xe->drm, "migration policy = %d, devmem_fd = %d\n",
+	       ops.preferred_mem_loc.migration_policy,
+	       ops.preferred_mem_loc.devmem_fd);
+
+	devmem_fd = (s32)ops.preferred_mem_loc.devmem_fd;
+	devmem_fd = (devmem_fd < 0) ? 0 : devmem_fd;
+
+	migration_policy = ops.preferred_mem_loc.migration_policy;
+
+	for (i = 0; i < num_vmas; i++) {
+		vmas[i]->attr.preferred_loc.devmem_fd = devmem_fd;
+		vmas[i]->attr.preferred_loc.migration_policy = migration_policy;
+	}
+
+	return 0;
+}
+
+static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
+			  struct xe_vma **vmas, int num_vmas,
+			  struct drm_xe_madvise_ops ops)
+{
+	struct xe_bo *bo;
+	int err, i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
+	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
+		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
+	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);
+
+	for (i = 0; i < num_vmas; i++) {
+		vmas[i]->attr.atomic_access = ops.atomic.val;
+
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				     !(bo->flags & XE_BO_FLAG_VRAM1)))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				      (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				      !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return -EINVAL;
+
+		err = xe_bo_lock(bo, true);
+		if (err)
+			return err;
+		bo->attr.atomic_access = ops.atomic.val;
+
+		/* Invalidate cpu page table, so bo can migrate to smem in next access */
+		if (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
+		    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL)
+			ttm_bo_unmap_virtual(&bo->ttm);
+
+		xe_bo_unlock(bo);
+	}
+	return 0;
+}
+
+static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
+			     struct xe_vma **vmas, int num_vmas,
+			     struct drm_xe_madvise_ops ops)
+{
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PAT);
+	vm_dbg(&xe->drm, "attr_value = %d", ops.pat_index.val);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.pat_index = ops.pat_index.val;
+
+	return 0;
+}
+
+static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
+				   struct xe_vma **vmas, int num_vmas,
+				   struct drm_xe_madvise_ops ops)
+{
+	/* Implementation pending */
+	return 0;
+}
+
+typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
+			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
+
+static const madvise_func madvise_funcs[] = {
+	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
+	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
+	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
+	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
+};
+
+static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
+{
+	struct drm_gpusvm_notifier *notifier;
+	struct drm_gpuva *gpuva;
+	struct xe_svm_range *range;
+	struct xe_tile *tile;
+	u64 adj_start, adj_end;
+	u8 id;
+
+	lockdep_assert_held(&vm->lock);
+
+	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
+				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
+		XE_WARN_ON(1);
+
+	down_write(&vm->svm.gpusvm.notifier_lock);
+
+	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *r = NULL;
+
+		adj_start = max(start, notifier->itree.start);
+		adj_end = min(end, notifier->itree.last + 1);
+		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
+			range = to_xe_range(r);
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes_range(tile, vm, range)) {
+					*tile_mask |= BIT(id);
+					range->tile_invalidated |= BIT(id);
+				}
+			}
+		}
+	}
+
+	up_write(&vm->svm.gpusvm.notifier_lock);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			continue;
+
+		if (xe_vma_is_userptr(vma)) {
+			WARN_ON_ONCE(!mmu_interval_check_retry
+				    (&to_userptr_vma(vma)->userptr.notifier,
+				     to_userptr_vma(vma)->userptr.notifier_seq));
+
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
+							     DMA_RESV_USAGE_BOOKKEEP));
+		}
+
+		if (xe_vma_bo(vma))
+			xe_bo_lock(xe_vma_bo(vma), false);
+
+		for_each_tile(tile, vm->xe, id) {
+			if (xe_pt_zap_ptes(tile, vma))
+				*tile_mask |= BIT(id);
+		}
+
+		if (xe_vma_bo(vma))
+			xe_bo_unlock(xe_vma_bo(vma));
+	}
+}
+
+static void xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct xe_gt_tlb_invalidation_fence
+		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	struct xe_tile *tile;
+	u32 fence_id = 0;
+	u8 tile_mask = 0;
+	u8 id;
+
+	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
+	if (!tile_mask)
+		return;
+
+	xe_device_wmb(vm->xe);
+
+	for_each_tile(tile, vm->xe, id) {
+		if (tile_mask & BIT(id)) {
+			int err;
+
+			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
+							   &fence[fence_id],
+							   start,
+							   end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+
+			if (!tile->media_gt)
+				continue;
+
+			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
+							  &fence[fence_id], true);
+
+			err = xe_gt_tlb_invalidation_range(tile->media_gt,
+							   &fence[fence_id],
+							   start,
+							   end,
+							   vm->usm.asid);
+			if (WARN_ON_ONCE(err < 0))
+				goto wait;
+			++fence_id;
+		}
+	}
+
+wait:
+	for (id = 0; id < fence_id; ++id)
+		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+}
+
+static int input_ranges_same(struct drm_xe_madvise_ops *old,
+			     struct drm_xe_madvise_ops *new)
+{
+	return (new->start == old->start && new->range == old->range);
+}
+
+int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_madvise_ops *advs_ops;
+	struct drm_xe_madvise *args = data;
+	struct xe_vm *vm;
+	struct xe_vma **vmas = NULL;
+	int num_vmas, err = 0;
+	int i, j, attr_type;
+
+	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !xe_vm_in_fault_mode(vm))) {
+		err = -EINVAL;
+		goto put_vm;
+	}
+
+	down_write(&vm->lock);
+
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
+	if (args->num_ops > 1) {
+		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
+
+		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
+					  GFP_KERNEL | __GFP_ACCOUNT |
+					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+		if (!advs_ops)
+			return args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
+
+		err = __copy_from_user(advs_ops, madvise_user,
+				       sizeof(struct drm_xe_madvise_ops) *
+				       args->num_ops);
+		if (XE_IOCTL_DBG(xe, err)) {
+			err = -EFAULT;
+			goto free_advs_ops;
+		}
+	} else {
+		advs_ops = &args->ops;
+	}
+
+	for (i = 0; i < args->num_ops; i++) {
+		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
+
+		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
+		if (!vmas) {
+			err = -ENOMEM;
+			goto unlock_vm;
+		}
+
+		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
+		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
+
+		kfree(vmas);
+		vmas = NULL;
+
+		if (err)
+			break;
+	}
+
+	for (i = 0; i < args->num_ops; i++) {
+		for (j = i + 1; j < args->num_ops; ++j) {
+			if (input_ranges_same(&advs_ops[j], &advs_ops[i]))
+				break;
+		}
+		xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
+					       advs_ops[i].start + advs_ops[i].range);
+	}
+free_advs_ops:
+	if (args->num_ops > 1)
+		kvfree(advs_ops);
+unlock_vm:
+	up_write(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
new file mode 100644
index 000000000000..c5cdd058c322
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_VM_MADVISE_H_
+#define _XE_VM_MADVISE_H_
+
+struct drm_device;
+struct drm_file;
+
+int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 84fa41b9fa20..43fa5bad7290 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -77,6 +77,23 @@ struct xe_userptr {
 #endif
 };
 
+/**
+ * struct xe_vma_mem_attr - memory attributes associated with vma
+ */
+struct xe_vma_mem_attr {
+	/** @preferred_loc: perferred memory_location*/
+	struct {
+		u32 migration_policy; /* represents migration policies */
+		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
+	} preferred_loc;
+	/** @atomic_access: The atomic access type for the vma */
+	u32 atomic_access;
+	/**
+	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 */
+	u16 pat_index;
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -118,16 +135,17 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
-	/**
-	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
-	 */
-	u16 pat_index;
-
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	/**
+	 * @attr: The attributes of vma which determines the migration policy
+	 * and encoding of the PTEs for this vma.
+	 */
+	struct xe_vma_mem_attr attr;
 };
 
 /**
@@ -372,6 +390,16 @@ struct xe_vma_op_unmap_range {
 	struct xe_svm_range *range;
 };
 
+/** struct xe_vma_op_prefetch_range - VMA prefetch range operation */
+struct xe_vma_op_prefetch_range {
+	/** @range: xarray for SVM ranges data */
+	struct xarray range;
+	/** @ranges_count: number of svm ranges to map */
+	u32 ranges_count;
+	/** @region: memory region to prefetch to */
+	u32 region;
+};
+
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
@@ -414,6 +442,8 @@ struct xe_vma_op {
 		struct xe_vma_op_map_range map_range;
 		/** @unmap_range: VMA unmap range operation specific data */
 		struct xe_vma_op_unmap_range unmap_range;
+		/** @prefetch: VMA prefetch range operation specific data */
+		struct xe_vma_op_prefetch_range prefetch_range;
 	};
 };
 
@@ -431,6 +461,9 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+	/** @flag: signify the properties within xe_vma_ops*/
+#define XE_VMA_OPS_HAS_SVM_PREFETCH BIT(0)
+	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
 	bool inject_error;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index df120b4d1f83..9bd03cb67d0e 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -489,6 +489,20 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
 	return NULL;
 }
 
+static inline struct drm_gpusvm_range *
+__drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier,
+			unsigned long start, unsigned long end)
+{
+	struct interval_tree_node *itree;
+
+	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
+
+	if (itree)
+		return container_of(itree, struct drm_gpusvm_range, itree);
+	else
+		return NULL;
+}
+
 /**
  * drm_gpusvm_for_each_range() - Iterate over GPU SVM ranges in a notifier
  * @range__: Iterator variable for the ranges. If set, it indicates the start of
@@ -502,8 +516,88 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
  */
 #define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
 	for ((range__) = (range__) ?:					\
-	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     __drm_gpusvm_range_find((notifier__), (start__), (end__));	\
 	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
 	     (range__) = __drm_gpusvm_range_next(range__))
 
+/**
+ * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
+ * @range__: Iterator variable for the ranges
+ * @next__: Iterator variable for the ranges temporay storage
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the range
+ * @end__: End address of the range
+ *
+ * This macro is used to iterate over GPU SVM ranges in a notifier while
+ * removing ranges from it.
+ */
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = __drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
+
+/**
+ * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
+ * @notifier: a pointer to the current drm_gpusvm_notifier
+ *
+ * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
+ *         the current notifier is the last one or if the input notifier is
+ *         NULL.
+ */
+static inline struct drm_gpusvm_notifier *
+__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
+{
+	if (notifier && !list_is_last(&notifier->entry,
+				      &notifier->gpusvm->notifier_list))
+		return list_next_entry(notifier, entry);
+
+	return NULL;
+}
+
+static inline struct drm_gpusvm_notifier *
+notifier_iter_first(struct rb_root_cached *root, unsigned long start,
+		    unsigned long last)
+{
+	struct interval_tree_node *itree;
+
+	itree = interval_tree_iter_first(root, start, last);
+
+	if (itree)
+		return container_of(itree, struct drm_gpusvm_notifier, itree);
+	else
+		return NULL;
+}
+
+/**
+ * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
+ */
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
+
+/**
+ * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @next__: Iterator variable for the notifiers temporay storage
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
+ * removing notifiers from it.
+ */
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+
 #endif /* __DRM_GPUSVM_H__ */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..e521ebabab9e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1062,6 +1062,12 @@ struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 addr, u64 range,
 			    struct drm_gem_object *obj, u64 offset);
+
+struct drm_gpuva_ops *
+drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
+			     u64 addr, u64 range,
+			     bool skip_gem_obj_va, u64 offset);
+
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 616916985e3f..68c447db9f2e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,9 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_MADVISE
+ *  - &DRM_IOCTL_XE_VM_QUERY_VMAS
+ *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
  */
 
 /*
@@ -102,6 +105,9 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_MADVISE			0x0c
+#define DRM_XE_VM_QUERY_VMAS		0x0d
+#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0e
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +123,9 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_VMAS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS, struct drm_xe_vm_query_num_vmas)
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1104,6 +1113,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
@@ -1961,6 +1971,209 @@ struct drm_xe_query_eu_stall {
 	__u64 sampling_rates[];
 };
 
+struct drm_xe_madvise_ops {
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
+#define DRM_XE_VMA_ATTR_ATOMIC		1
+#define DRM_XE_VMA_ATTR_PAT		2
+#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
+	/** @type: type of attribute */
+	__u32 type;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		struct {
+#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
+#define DRM_XE_VMA_ATOMIC_DEVICE	1
+#define DRM_XE_VMA_ATOMIC_GLOBAL	2
+#define DRM_XE_VMA_ATOMIC_CPU		3
+		/** @val: value of atomic operation*/
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} atomic;
+
+		struct {
+#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
+#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
+		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} purge_state_val;
+
+		struct {
+			/** @pat_index */
+			__u32 val;
+
+			/** @reserved: Reserved */
+			__u32 reserved;
+		} pat_index;
+
+		/** @preferred_mem_loc: preferred memory location */
+		struct {
+			__u32 devmem_fd;
+
+#define MIGRATE_ALL_PAGES 0
+#define MIGRATE_ONLY_SYSTEM_PAGES 1
+			__u32 migration_policy;
+		} preferred_mem_loc;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
+ *
+ * Set memory attributes to a virtual address range
+ */
+struct drm_xe_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_ops: number of madvises in ioctl */
+	__u32 num_ops;
+
+	union {
+		/** @ops: used if num_ops == 1 */
+		struct drm_xe_madvise_ops ops;
+
+		/**
+		 * @vector_of_ops: userptr to array of struct
+		 * drm_xe_vm_madvise_op if num_ops > 1
+		 */
+		__u64 vector_of_ops;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+
+};
+
+/**
+ * struct drm_xe_vm_query_num_vmas - Input of &DRM_IOCTL_XE_VM_QUERY_VMAS
+ *
+ * Get number of vmas in virtual range of vm_id
+ */
+struct drm_xe_vm_query_num_vmas {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_vmas: number of vmas in range returned in @num_vmas */
+	__u32 num_vmas;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+	 /** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_vma_mem_attr {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the vma */
+	__u64 start;
+
+	/** @size: end of the vma */
+	__u64 end;
+
+	struct {
+		struct {
+		/** @val: value of atomic operation*/
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} atomic;
+
+		struct {
+		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+			__u32 val;
+
+		/** @reserved: Reserved */
+			__u32 reserved;
+		} purge_state_val;
+
+		struct {
+			/** @pat_index */
+			__u32 val;
+
+			/** @reserved: Reserved */
+			__u32 reserved;
+		} pat_index;
+
+		/** @preferred_mem_loc: preferred memory location */
+		struct {
+			__u32 devmem_fd;
+
+			__u32 migration_policy;
+		} preferred_mem_loc;
+	};
+
+	 /** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
+ *
+ * Get memory attributes to a virtual address range
+ */
+struct drm_xe_vm_query_vmas_attr {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_vmas: number of vmas in range returned in @num_vmas */
+	__u32 num_vmas;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @size: size of the virtual address range */
+	__u64 range;
+
+	union {
+		/** @num_vmas: used if num_vmas == 1 */
+		struct drm_xe_vma_mem_attr attr;
+
+		/**
+		 * @vector_of_ops: userptr to array of struct
+		 * drm_xe_vma_mem_attr if num_vmas > 1
+		 */
+		__u64 vector_of_vma_mem_attr;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

