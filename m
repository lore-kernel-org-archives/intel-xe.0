Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5C7C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8D110E1FD;
	Wed, 30 Jul 2025 12:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOh7v0t2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EC110E1FD
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878054; x=1785414054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qL3XSyxu8lTyy56zc7Z81zPV+j9O5nJXwINENYKb5z8=;
 b=QOh7v0t2JlCBGf3U1AwbD4cDBV+/WBVlC1RaG9Uyswu5p+Z/FmINQveo
 Nt/I4D3lMLZl2H672TvfEAU01fEYST4F6h3D8NbWT7JJ+yPqBl4hQrLno
 cSfqK9Uqksu+YMRJRFQLIz86+ghwsjC1Zl8g5qDFS+spgaCCysj64eZOT
 efhaXvcnl6/AWoDngwBHV5kFuiEEGHT7SQJC7XVC2idFTx1GKABbxesZN
 g8Wn2LqussnUwmF2tXP4+xkskbQ5We8SIgVL2s0qnHsjez1+vMntXEBpB
 P9WRt/afPuvdc6kuTA8Xl15MlwSn3jiGcRsfQdcApcRezMhdu5W4eHhrl g==;
X-CSE-ConnectionGUID: tZtKZchVQTe6uzig6BYwKQ==
X-CSE-MsgGUID: xgFv/cX9TeCA2PBP++WIdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="59817017"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="59817017"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:20:53 -0700
X-CSE-ConnectionGUID: 8NYQVAUpTH69Z3OLx6DGpQ==
X-CSE-MsgGUID: fSgI10cfSCiMlSuBN2wNew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163320183"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa008.jf.intel.com with ESMTP; 30 Jul 2025 05:20:36 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] [v2] drm/xe: MADVISE SQUASH for
 CI-v5_addressed__with_gpuvm_changes
Date: Wed, 30 Jul 2025 18:17:28 +0530
Message-Id: <20250730124728.1001126-1-himal.prasad.ghimiray@intel.com>
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

DONOT REVIEW

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c           | 122 ++-----
 drivers/gpu/drm/drm_gpuvm.c            | 191 ++++++-----
 drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  33 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  13 +-
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  29 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
 drivers/gpu/drm/xe/xe_device.c         |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |  35 +-
 drivers/gpu/drm/xe/xe_pt.c             |  39 ++-
 drivers/gpu/drm/xe/xe_svm.c            | 238 ++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h            |  23 ++
 drivers/gpu/drm/xe/xe_vm.c             | 419 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h             |  10 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 449 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  50 ++-
 include/drm/drm_gpusvm.h               |  70 ++++
 include/drm/drm_gpuvm.h                |  47 ++-
 include/uapi/drm/xe_drm.h              | 274 +++++++++++++++
 22 files changed, 1812 insertions(+), 284 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 5bb4c77db2c3..647b49ff2da5 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -271,107 +271,50 @@ npages_in_range(unsigned long start, unsigned long end)
 }
 
 /**
- * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
- * @notifier: Pointer to the GPU SVM notifier structure.
- * @start: Start address of the range
- * @end: End address of the range
+ * drm_gpusvm_notifier_find() - Find GPU SVM notifier from GPU SVM
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @start: Start address of the notifier
+ * @end: End address of the notifier
  *
- * Return: A pointer to the drm_gpusvm_range if found or NULL
+ * Return: A pointer to the drm_gpusvm_notifier if found or NULL
  */
-struct drm_gpusvm_range *
-drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
-		      unsigned long end)
+struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
+			 unsigned long end)
 {
 	struct interval_tree_node *itree;
 
-	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
+	itree = interval_tree_iter_first(&gpusvm->root, start, end - 1);
 
 	if (itree)
-		return container_of(itree, struct drm_gpusvm_range, itree);
+		return container_of(itree, struct drm_gpusvm_notifier, itree);
 	else
 		return NULL;
 }
-EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
+EXPORT_SYMBOL_GPL(drm_gpusvm_notifier_find);
 
 /**
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
+ * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
+ * @notifier: Pointer to the GPU SVM notifier structure.
+ * @start: Start address of the range
+ * @end: End address of the range
  *
- * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
- *         the current notifier is the last one or if the input notifier is
- *         NULL.
+ * Return: A pointer to the drm_gpusvm_range if found or NULL
  */
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
+struct drm_gpusvm_range *
+drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
+		      unsigned long end)
 {
 	struct interval_tree_node *itree;
 
-	itree = interval_tree_iter_first(root, start, last);
+	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
 
 	if (itree)
-		return container_of(itree, struct drm_gpusvm_notifier, itree);
+		return container_of(itree, struct drm_gpusvm_range, itree);
 	else
 		return NULL;
 }
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
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
 
 /**
  * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
@@ -472,22 +415,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_init);
 
-/**
- * drm_gpusvm_notifier_find() - Find GPU SVM notifier
- * @gpusvm: Pointer to the GPU SVM structure
- * @fault_addr: Fault address
- *
- * This function finds the GPU SVM notifier associated with the fault address.
- *
- * Return: Pointer to the GPU SVM notifier on success, NULL otherwise.
- */
-static struct drm_gpusvm_notifier *
-drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm,
-			 unsigned long fault_addr)
-{
-	return notifier_iter_first(&gpusvm->root, fault_addr, fault_addr + 1);
-}
-
 /**
  * to_drm_gpusvm_notifier() - retrieve the container struct for a given rbtree node
  * @node: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
@@ -943,7 +870,7 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 	if (!mmget_not_zero(mm))
 		return ERR_PTR(-EFAULT);
 
-	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
+	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr, fault_addr + 1);
 	if (!notifier) {
 		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
 		if (IS_ERR(notifier)) {
@@ -1107,7 +1034,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
 	drm_gpusvm_driver_lock_held(gpusvm);
 
 	notifier = drm_gpusvm_notifier_find(gpusvm,
-					    drm_gpusvm_range_start(range));
+					    drm_gpusvm_range_start(range),
+					    drm_gpusvm_range_start(range) + 1);
 	if (WARN_ON_ONCE(!notifier))
 		return;
 
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..2aeae8c2296f 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -486,13 +486,18 @@
  *				  u64 addr, u64 range,
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
+ *	        struct drm_gpuva_op_map op_map = {
+ *	                 .va.addr = addr,
+ *	                 .va.range = range,
+ *	                 .gem.obj = obj,
+ *	                 .gem.offset = offset,
+ *	           };
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op
  *		struct drm_gpuvm_bo *vm_bo;
  *
  *		driver_lock_va_space();
- *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
- *						  obj, offset);
+ *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &op_map);
  *		if (IS_ERR(ops))
  *			return PTR_ERR(ops);
  *
@@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
 
 static int
 op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
-	  u64 addr, u64 range,
-	  struct drm_gem_object *obj, u64 offset)
+	  const struct drm_gpuva_op_map *req)
 {
 	struct drm_gpuva_op op = {};
 
 	op.op = DRM_GPUVA_OP_MAP;
-	op.map.va.addr = addr;
-	op.map.va.range = range;
-	op.map.gem.obj = obj;
-	op.map.gem.offset = offset;
+	op.map.va.addr = req->va.addr;
+	op.map.va.range = req->va.range;
+	op.map.gem.obj = req->gem.obj;
+	op.map.gem.offset = req->gem.offset;
 
 	return fn->sm_step_map(&op, priv);
 }
@@ -2102,48 +2106,58 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
-		   u64 req_addr, u64 req_range,
-		   struct drm_gem_object *req_obj, u64 req_offset)
+		   const struct drm_gpuva_op_map *req)
 {
 	struct drm_gpuva *va, *next;
-	u64 req_end = req_addr + req_range;
+	u64 req_end = req->va.addr + req->va.range;
+	bool is_madvise_ops = (req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
+	bool needs_map = !is_madvise_ops;
 	int ret;
 
-	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
+	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
 		return -EINVAL;
 
-	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
+	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->va.addr, req_end) {
 		struct drm_gem_object *obj = va->gem.obj;
 		u64 offset = va->gem.offset;
 		u64 addr = va->va.addr;
 		u64 range = va->va.range;
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
+		bool skip_madvise_ops = is_madvise_ops && merge;
 
-		if (addr == req_addr) {
-			merge &= obj == req_obj &&
-				 offset == req_offset;
+		needs_map = !is_madvise_ops;
+		if (addr == req->va.addr) {
+			merge &= obj == req->gem.obj &&
+				 offset == req->gem.offset;
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
-					.va.range = range - req_range,
+					.va.range = range - req->va.range,
 					.gem.obj = obj,
-					.gem.offset = offset + req_range,
+					.gem.offset = offset + req->va.range,
 				};
 				struct drm_gpuva_op_unmap u = {
 					.va = va,
@@ -2153,10 +2167,13 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
-		} else if (addr < req_addr) {
-			u64 ls_range = req_addr - addr;
+		} else if (addr < req->va.addr) {
+			u64 ls_range = req->va.addr - addr;
 			struct drm_gpuva_op_map p = {
 				.va.addr = addr,
 				.va.range = ls_range,
@@ -2165,58 +2182,95 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
-			merge &= obj == req_obj &&
-				 offset + ls_range == req_offset;
+			merge &= obj == req->gem.obj &&
+				 offset + ls_range == req->gem.offset;
 			u.keep = merge;
 
 			if (end == req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
+
 				break;
 			}
 
 			if (end < req_end) {
+				if (skip_madvise_ops)
+					continue;
+
 				ret = op_remap_cb(ops, priv, &p, NULL, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops) {
+					struct drm_gpuva_op_map map_req = {
+						.va.addr =  req->va.addr,
+						.va.range = end - req->va.addr,
+					};
+
+					ret = op_map_cb(ops, priv, &map_req);
+					if (ret)
+						return ret;
+				}
+
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = end - req_end,
 					.gem.obj = obj,
 					.gem.offset = offset + ls_range +
-						      req_range,
+						      req->va.range,
 				};
 
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
-		} else if (addr > req_addr) {
-			merge &= obj == req_obj &&
-				 offset == req_offset +
-					   (addr - req_addr);
+		} else if (addr > req->va.addr) {
+			merge &= obj == req->gem.obj &&
+				 offset == req->gem.offset +
+					   (addr - req->va.addr);
 
 			if (end == req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
+
 				break;
 			}
 
 			if (end < req_end) {
-				ret = op_unmap_cb(ops, priv, va, merge);
-				if (ret)
-					return ret;
+				if (!is_madvise_ops) {
+					ret = op_unmap_cb(ops, priv, va, merge);
+					if (ret)
+						return ret;
+				}
+
 				continue;
 			}
 
 			if (end > req_end) {
+				if (skip_madvise_ops)
+					break;
+
 				struct drm_gpuva_op_map n = {
 					.va.addr = req_end,
 					.va.range = end - req_end,
@@ -2231,14 +2285,20 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops) {
+					struct drm_gpuva_op_map map_req = {
+						.va.addr =  addr,
+						.va.range = req_end - addr,
+					};
+
+					return op_map_cb(ops, priv, &map_req);
+				}
 				break;
 			}
 		}
 	}
-
-	return op_map_cb(ops, priv,
-			 req_addr, req_range,
-			 req_obj, req_offset);
+	return needs_map ? op_map_cb(ops, priv, req) : 0;
 }
 
 static int
@@ -2303,10 +2363,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
  * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
- * @req_addr: the start address of the new mapping
- * @req_range: the range of the new mapping
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @req: ptr to drm_gpuva_op_map struct
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2333,8 +2390,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
  */
 int
 drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		 u64 req_addr, u64 req_range,
-		 struct drm_gem_object *req_obj, u64 req_offset)
+		 const struct drm_gpuva_op_map *req)
 {
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
 
@@ -2343,9 +2399,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
@@ -2421,10 +2475,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @exec: the &drm_exec locking context
  * @num_fences: for newly mapped objects, the # of fences to reserve
- * @req_addr: the start address of the range to unmap
- * @req_range: the range of the mappings to unmap
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @op: ptr to drm_gpuva_op_map struct
  *
  * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
  * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
@@ -2442,12 +2493,10 @@ static const struct drm_gpuvm_ops lock_ops = {
  *            for_each_vm_bind_operation {
  *                switch (op->op) {
  *                case DRIVER_OP_UNMAP:
- *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
+ *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->va.addr, op->va.range);
  *                    break;
  *                case DRIVER_OP_MAP:
- *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
- *                                                     op->addr, op->range,
- *                                                     obj, op->obj_offset);
+ *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, op);
  *                    break;
  *                }
  *
@@ -2478,18 +2527,16 @@ static const struct drm_gpuvm_ops lock_ops = {
 int
 drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			   struct drm_exec *exec, unsigned int num_fences,
-			   u64 req_addr, u64 req_range,
-			   struct drm_gem_object *req_obj, u64 req_offset)
+			   struct drm_gpuva_op_map *req)
 {
-	if (req_obj) {
-		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+	if (req->gem.obj) {
+		int ret = drm_exec_prepare_obj(exec, req->gem.obj, num_fences);
 		if (ret)
 			return ret;
 	}
 
 	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+				  req);
 
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
@@ -2611,10 +2658,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 /**
  * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
- * @req_addr: the start address of the new mapping
- * @req_range: the range of the new mapping
- * @req_obj: the &drm_gem_object to map
- * @req_offset: the offset within the &drm_gem_object
+ * @req: ptr to drm_gpuva_op_map struct
  *
  * This function creates a list of operations to perform splitting and merging
  * of existent mapping(s) with the newly requested one.
@@ -2642,8 +2686,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
  */
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 req_addr, u64 req_range,
-			    struct drm_gem_object *req_obj, u64 req_offset)
+			    const struct drm_gpuva_op_map *req)
 {
 	struct drm_gpuva_ops *ops;
 	struct {
@@ -2661,9 +2704,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 	args.vm = gpuvm;
 	args.ops = ops;
 
-	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
-				 req_addr, req_range,
-				 req_obj, req_offset);
+	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
 	if (ret)
 		goto err_free_ops;
 
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 2896fa7501b1..57116709de81 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
 static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 {
 	switch (bind_op->type) {
-	case PVR_VM_BIND_TYPE_MAP:
+	case PVR_VM_BIND_TYPE_MAP: {
+		const struct drm_gpuva_op_map map_req = {
+			.va.addr = bind_op->device_addr,
+			.va.range = bind_op->size,
+			.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
+			.gem.offset = bind_op->offset,
+		};
+
 		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
-					bind_op, bind_op->device_addr,
-					bind_op->size,
-					gem_from_pvr_gem(bind_op->pvr_obj),
-					bind_op->offset);
+					bind_op, &map_req);
+	}
 
 	case PVR_VM_BIND_TYPE_UNMAP:
 		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3cd8562a5109..59a9b41bc967 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -371,6 +371,12 @@ struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end)
 {
+	struct drm_gpuva_op_map op_map = {
+		.va.addr = range_start,
+		.va.range = range_end - range_start,
+		.gem.obj = obj,
+		.gem.offset = offset,
+	};
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuvm_bo *vm_bo;
 	struct msm_gem_vma *vma;
@@ -399,7 +405,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (obj)
 		GEM_WARN_ON((range_end - range_start) > obj->size);
 
-	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
+	drm_gpuva_init_from_op(&vma->base, &op_map);
 	vma->mapped = false;
 
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
@@ -1172,10 +1178,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
 				break;
 			case MSM_VM_BIND_OP_MAP:
 			case MSM_VM_BIND_OP_MAP_NULL:
-				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
-							    op->iova, op->range,
-							    op->obj, op->obj_offset);
+			{
+				struct drm_gpuva_op_map map_req = {
+					.va.addr = op->iova,
+					.va.range = op->range,
+					.gem.obj = op->obj,
+					.gem.offset = op->obj_offset,
+				};
+
+				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
 				break;
+			}
 			default:
 				/*
 				 * lookup_op() should have already thrown an error for
@@ -1283,9 +1296,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 				arg.flags |= MSM_VMA_DUMP;
 			fallthrough;
 		case MSM_VM_BIND_OP_MAP_NULL:
-			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
-					       op->range, op->obj, op->obj_offset);
+		{
+			struct drm_gpuva_op_map map_req = {
+				.va.addr = op->iova,
+				.va.range = op->range,
+				.gem.obj = op->obj,
+				.gem.offset = op->obj_offset,
+			};
+
+			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
 			break;
+		}
 		default:
 			/*
 			 * lookup_op() should have already thrown an error for
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ddfc46bc1b3e..b74054b0a476 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			break;
 		case OP_MAP: {
 			struct nouveau_uvma_region *reg;
+			struct drm_gpuva_op_map map_req = {
+				.va.addr = op->va.addr,
+				.va.range = op->va.range,
+				.gem.obj = op->gem.obj,
+				.gem.offset = op->gem.offset,
+			};
 
 			reg = nouveau_uvma_region_find_first(uvmm,
 							     op->va.addr,
@@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			}
 
 			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
-							      op->va.addr,
-							      op->va.range,
-							      op->gem.obj,
-							      op->gem.offset);
+							      &map_req);
 			if (IS_ERR(op->ops)) {
 				ret = PTR_ERR(op->ops);
 				goto unwind_continue;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5a..5fd4245a57b9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2169,15 +2169,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
 	mutex_lock(&vm->op_lock);
 	vm->op_ctx = op;
 	switch (op_type) {
-	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
+	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
+		const struct drm_gpuva_op_map map_req = {
+			.va.addr = op->va.addr,
+			.va.range = op->va.range,
+			.gem.obj = op->map.vm_bo->obj,
+			.gem.offset = op->map.bo_offset,
+		};
+
 		if (vm->unusable) {
 			ret = -EINVAL;
 			break;
 		}
 
-		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
-				       op->map.vm_bo->obj, op->map.bo_offset);
+		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
 		break;
+	}
 
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
 		ret = drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range);
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..d0ea869fcd24 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -128,6 +128,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vm_madvise.o \
 	xe_vram.o \
 	xe_vram_freq.o \
 	xe_vsec.o \
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ffca1cea5585..6ab297f94d12 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1709,6 +1709,18 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
+static bool should_migrate_to_smem(struct xe_bo *bo)
+{
+	/*
+	 * NOTE: The following atomic checks are platform-specific. For example,
+	 * if a device supports CXL atomics, these may not be necessary or
+	 * may behave differently.
+	 */
+
+	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
+	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
+}
+
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -1717,7 +1729,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1729,8 +1741,19 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+		if (should_migrate_to_smem(bo)) {
+			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
+
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
index cf604adc13a3..314652afdca7 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -61,6 +61,14 @@ struct xe_bo {
 	 */
 	struct list_head client_link;
 #endif
+	/** @attr: User controlled attributes for bo */
+	struct {
+		/**
+		 * @atomic_access: type of atomic access bo needs
+		 * protected by bo dma-resv lock
+		 */
+		u32 atomic_access;
+	} attr;
 	/**
 	 * @pxp_key_instance: PXP key instance this BO was created against. A
 	 * 0 in this variable indicates that the BO does not use PXP encryption.
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c754374f1a8d..1e4334f8bdf4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -63,6 +63,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 #include "xe_vsec.h"
@@ -201,6 +202,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab43dec52776..4ea30fbce9bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -75,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, struct xe_vram_region *vram)
+		       bool need_vram_move, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -85,26 +85,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && vram) {
-		xe_assert(vm->xe, IS_DGFX(vm->xe));
+	if (!bo)
+		return 0;
 
-		if (xe_vma_is_userptr(vma)) {
-			err = -EACCES;
-			return err;
-		}
+	err = need_vram_move ? xe_bo_migrate(bo, vram->placement) :
+			       xe_bo_validate(bo, vm, true);
 
-		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, vram->placement);
-		if (err)
-			return err;
-	} else if (bo) {
-		/* Create backing store if needed */
-		err = xe_bo_validate(bo, vm, true);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return err;
 }
 
 static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
@@ -115,10 +102,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	ktime_t end = 0;
-	int err;
+	int err, needs_vram;
 
 	lockdep_assert_held_write(&vm->lock);
 
+	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
+		return needs_vram < 0 ? needs_vram : -EACCES;
+
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);
 
@@ -141,7 +132,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
+		err = xe_pf_begin(&exec, vma, needs_vram == 1, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -576,7 +567,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
+		ret = xe_pf_begin(&exec, vma, IS_DGFX(vm->xe), tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 330cc0f54a3f..6f5b384991cd 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -518,7 +518,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
-	u16 pat_index = xe_walk->vma->pat_index;
+	u16 pat_index = xe_walk->vma->attr.pat_index;
 	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_vm *vm = xe_walk->vm;
 	struct xe_pt *xe_child;
@@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  *    - In all other cases device atomics will be disabled with AE=0 until an application
  *      request differently using a ioctl like madvise.
  */
-static bool xe_atomic_for_vram(struct xe_vm *vm)
+static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
 {
+	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
+		return false;
+
 	return true;
 }
 
-static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
+static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
 {
 	struct xe_device *xe = vm->xe;
+	struct xe_bo *bo = xe_vma_bo(vma);
 
-	if (!xe->info.has_device_atomics_on_smem)
+	if (!xe->info.has_device_atomics_on_smem ||
+	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
 		return false;
 
+	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
+		return true;
+
 	/*
 	 * If a SMEM+LMEM allocation is backed by SMEM, a device
 	 * atomics will cause a gpu page fault and which then
 	 * gets migrated to LMEM, bind such allocations with
 	 * device atomics enabled.
-	 *
-	 * TODO: Revisit this. Perhaps add something like a
-	 * fault_on_atomics_in_system UAPI flag.
-	 * Note that this also prohibits GPU atomics in LR mode for
-	 * userptr and system memory on DGFX.
 	 */
 	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
 				 (bo && xe_bo_has_single_placement(bo))));
@@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		goto walk_pt;
 
 	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
-		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
-		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
+		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
+		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
@@ -950,7 +953,19 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	struct xe_pt *pt = vm->pt_root[tile->id];
 	u8 pt_mask = (range->tile_present & ~range->tile_invalidated);
 
-	xe_svm_assert_in_notifier(vm);
+	/*
+	 * Locking rules:
+	 *
+	 * - notifier_lock (write): full protection against page table changes
+	 *   and MMU notifier invalidations.
+	 *
+	 * - notifier_lock (read) + vm_lock (write): combined protection against
+	 *   invalidations and concurrent page table modifications. (e.g., madvise)
+	 *
+	 */
+	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
+		       (lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
+		       lockdep_is_held_type(&vm->lock, 0)));
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e..9b3a3f61758c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -253,9 +253,55 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 	return 0;
 }
 
+static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
+{
+	struct xe_vma *vma;
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc = {
+			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		},
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+	};
+	int err = 0;
+
+	vma = xe_vm_find_vma_by_addr(vm, range_start);
+	if (!vma)
+		return -EINVAL;
+
+	if (xe_vma_has_default_mem_attrs(vma))
+		return 0;
+
+	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
+	       xe_vma_start(vma), xe_vma_end(vma));
+
+	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
+		default_attr.pat_index = vma->attr.default_pat_index;
+		default_attr.default_pat_index  = vma->attr.default_pat_index;
+		vma->attr = default_attr;
+	} else {
+		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
+		       range_start, range_end);
+		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
+		if (err) {
+			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
+			xe_vm_kill(vm, true);
+			return err;
+		}
+	}
+
+	/*
+	 * On call from xe_svm_handle_pagefault original VMA might be changed
+	 * signal this to lookup for VMA again.
+	 */
+	return -EAGAIN;
+}
+
 static int xe_svm_garbage_collector(struct xe_vm *vm)
 {
 	struct xe_svm_range *range;
+	u64 range_start;
+	u64 range_end;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -271,6 +317,9 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		if (!range)
 			break;
 
+		range_start = xe_svm_range_start(range);
+		range_end = xe_svm_range_end(range);
+
 		list_del(&range->garbage_collector_link);
 		spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -283,6 +332,10 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			return err;
 		}
 
+		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
+		if (err)
+			return err;
+
 		spin_lock(&vm->svm.garbage_collector.lock);
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
@@ -793,35 +846,59 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic)
 {
-	struct drm_gpusvm_ctx ctx = {
-		.read_only = xe_vma_read_only(vma),
-		.devmem_possible = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.check_pages_threshold = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
-			vm->xe->atomic_svm_timeslice_ms : 0,
-	};
+	struct drm_gpusvm_ctx ctx = { };
+	struct drm_pagemap *dpagemap;
 	struct xe_svm_range *range;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
-	int migrate_try_count = ctx.devmem_only ? 3 : 1;
+	bool vma_updated = false;
+	int need_vram;
+	int migrate_try_count;
 	ktime_t end = 0;
 	int err;
 
-	lockdep_assert_held_write(&vm->lock);
+find_vma:
+	if (vma_updated) {
+		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
+		if (!vma)
+			return -EINVAL;
+	}
+
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
+	vma_updated = false;
+
+	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	if (need_vram < 0)
+		return need_vram;
 
+	ctx.read_only = xe_vma_read_only(vma);
+	ctx.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
+	ctx.check_pages_threshold = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
+				    SZ_64K : 0;
+	ctx.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
+	ctx.timeslice_ms = atomic && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
+			   vm->xe->atomic_svm_timeslice_ms : 0;
+
+	migrate_try_count = ctx.devmem_only ? 3 : 1;
+
+	lockdep_assert_held_write(&vm->lock);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
-	if (err)
-		return err;
+	if (err) {
+		if (err == -EAGAIN) {
+			/*
+			 * VMA might have changed due to garbage
+			 * collection; retry lookup
+			 */
+			vma_updated = true;
+			goto find_vma;
+		} else {
+			return err;
+		}
+	}
 
 	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
@@ -836,8 +913,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
+	dpagemap = xe_vma_resolve_pagemap(vma, tile);
 	if (--migrate_try_count >= 0 &&
-	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
+	    xe_svm_range_needs_migrate_to_vram(range, vma, !!dpagemap || ctx.devmem_only)) {
+		/* TODO : For multi-device dpagemap will be used to find the
+		 * remote tile and remote device. Will need to modify
+		 * xe_svm_alloc_vram to use dpagemap for future multi-device
+		 * support.
+		 */
 		err = xe_svm_alloc_vram(tile, range, &ctx);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
@@ -919,6 +1002,41 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
 }
 
+/**
+ * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
+ * @vm: The VM
+ * @start: start addr
+ * @end: end addr
+ *
+ * This function UNMAPS svm ranges if start or end address are inside them.
+ */
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier, *next;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *range, *__next;
+
+		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
+			if (start > drm_gpusvm_range_start(range) ||
+			    end < drm_gpusvm_range_end(range)) {
+				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
+					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
+				drm_gpusvm_range_get(range);
+				__xe_svm_garbage_collector(vm, to_xe_range(range));
+				if (!list_empty(&to_xe_range(range)->garbage_collector_link)) {
+					spin_lock(&vm->svm.garbage_collector.lock);
+					list_del(&to_xe_range(range)->garbage_collector_link);
+					spin_unlock(&vm->svm.garbage_collector.lock);
+				}
+				drm_gpusvm_range_put(range);
+			}
+		}
+	}
+}
+
 /**
  * xe_svm_bo_evict() - SVM evict BO to system memory
  * @bo: BO to evict
@@ -983,6 +1101,56 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
+/**
+ * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
+ * @vm: Pointer to the xe_vm structure
+ * @start: Start of the input range
+ * @end: End of the input range
+ *
+ * This function removes the page table entries (PTEs) associated
+ * with the svm ranges within the given input start and end
+ *
+ * Return: tile_mask for which gt's need to be tlb invalidated.
+ */
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpusvm_notifier *notifier;
+	struct xe_svm_range *range;
+	u64 adj_start, adj_end;
+	struct xe_tile *tile;
+	u8 tile_mask = 0;
+	u8 id;
+
+	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
+		       lockdep_is_held_type(&vm->lock, 0));
+
+	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
+		struct drm_gpusvm_range *r = NULL;
+
+		adj_start = max(start, drm_gpusvm_notifier_start(notifier));
+		adj_end = min(end, drm_gpusvm_notifier_end(notifier));
+		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
+			range = to_xe_range(r);
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes_range(tile, vm, range)) {
+					tile_mask |= BIT(id);
+					/*
+					 * WRITE_ONCE pairs with READ_ONCE in
+					 * xe_vm_has_valid_gpu_mapping().
+					 * Must not fail after setting
+					 * tile_invalidated and before
+					 * TLB invalidation.
+					 */
+					WRITE_ONCE(range->tile_invalidated,
+						   range->tile_invalidated | BIT(id));
+				}
+			}
+		}
+	}
+
+	return tile_mask;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 
 static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
@@ -990,6 +1158,37 @@ static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
 	return &tile->mem.vram->dpagemap;
 }
 
+/**
+ * xe_vma_resolve_pagemap - Resolve the appropriate DRM pagemap for a VMA
+ * @vma: Pointer to the xe_vma structure containing memory attributes
+ * @tile: Pointer to the xe_tile structure used as fallback for VRAM mapping
+ *
+ * This function determines the correct DRM pagemap to use for a given VMA.
+ * It first checks if a valid devmem_fd is provided in the VMA's preferred
+ * location. If the devmem_fd is negative, it returns NULL, indicating no
+ * pagemap is available and smem to be used as preferred location.
+ * If the devmem_fd is equal to the default faulting
+ * GT identifier, it returns the VRAM pagemap associated with the tile.
+ *
+ * Future support for multi-device configurations may use drm_pagemap_from_fd()
+ * to resolve pagemaps from arbitrary file descriptors.
+ *
+ * Return: A pointer to the resolved drm_pagemap, or NULL if none is applicable.
+ */
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
+{
+	s32 fd = (s32)vma->attr.preferred_loc.devmem_fd;
+
+	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
+		return NULL;
+
+	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
+		return IS_DGFX(tile_to_xe(tile)) ? tile_local_pagemap(tile) : NULL;
+
+	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
+	return NULL;
+}
+
 /**
  * xe_svm_alloc_vram()- Allocate device memory pages for range,
  * migrating existing data.
@@ -1102,6 +1301,11 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 {
 	return 0;
 }
+
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
+{
+	return NULL;
+}
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index da9a69ea0bb1..494823afaa98 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -90,6 +90,12 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 
 u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
 
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
+
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
+
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -303,6 +309,23 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
 	return ULONG_MAX;
 }
 
+static inline
+void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
+{
+}
+
+static inline
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	return 0;
+}
+
+static inline
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
+{
+	return NULL;
+}
+
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..a3ca3041e812 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -38,6 +38,7 @@
 #include "xe_res_cursor.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
@@ -1168,7 +1169,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
-				    u16 pat_index, unsigned int flags)
+				    struct xe_vma_mem_attr *attr,
+				    unsigned int flags)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
@@ -1223,7 +1225,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->pat_index = pat_index;
+	vma->attr = *attr;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
@@ -2169,6 +2171,108 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+static int xe_vm_query_vmas(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpuva *gpuva;
+	u32 num_vmas = 0;
+
+	lockdep_assert_held(&vm->lock);
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
+		num_vmas++;
+
+	return num_vmas;
+}
+
+static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
+			 u64 end, struct drm_xe_mem_range_attr *attrs)
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
+			return -ENOSPC;
+
+		attrs[i].start = xe_vma_start(vma);
+		attrs[i].end = xe_vma_end(vma);
+		attrs[i].atomic.val = vma->attr.atomic_access;
+		attrs[i].pat_index.val = vma->attr.pat_index;
+		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
+		attrs[i].preferred_mem_loc.migration_policy =
+		vma->attr.preferred_loc.migration_policy;
+
+		i++;
+	}
+
+	*num_vmas = i;
+	return 0;
+}
+
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_mem_range_attr *mem_attrs;
+	struct drm_xe_vm_query_mem_range_attr *args = data;
+	u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
+	struct xe_vm *vm;
+	int err = 0;
+
+	if (XE_IOCTL_DBG(xe,
+			 ((args->num_mem_ranges == 0 &&
+			  (attrs_user || args->sizeof_mem_range_attr != 0)) ||
+			 (args->num_mem_ranges > 0 &&
+			  (!attrs_user ||
+			   args->sizeof_mem_range_attr !=
+			   sizeof(struct drm_xe_mem_range_attr))))))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	err = down_read_interruptible(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
+
+	if (args->num_mem_ranges == 0 && !attrs_user) {
+		args->num_mem_ranges = xe_vm_query_vmas(vm, args->start, args->start + args->range);
+		args->sizeof_mem_range_attr = sizeof(struct drm_xe_mem_range_attr);
+		goto unlock_vm;
+	}
+
+	mem_attrs = kvmalloc_array(args->num_mem_ranges, args->sizeof_mem_range_attr,
+				   GFP_KERNEL | __GFP_ACCOUNT |
+				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!mem_attrs) {
+		err = args->num_mem_ranges > 1 ? -ENOBUFS : -ENOMEM;
+		goto unlock_vm;
+	}
+
+	memset(mem_attrs, 0, args->num_mem_ranges * args->sizeof_mem_range_attr);
+	err = get_mem_attrs(vm, &args->num_mem_ranges, args->start,
+			    args->start + args->range, mem_attrs);
+	if (err)
+		goto free_mem_attrs;
+
+	err = copy_to_user(attrs_user, mem_attrs,
+			   args->sizeof_mem_range_attr * args->num_mem_ranges);
+
+free_mem_attrs:
+	kvfree(mem_attrs);
+unlock_vm:
+	up_read(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
+	return err;
+}
+
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 {
 	if (page_addr > xe_vma_end(vma) - 1 ||
@@ -2316,10 +2420,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
-	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
-		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
-						  obj, bo_offset_or_userptr);
+	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
+		struct drm_gpuva_op_map map_req = {
+			.va.addr = addr,
+			.va.range = range,
+			.gem.obj = obj,
+			.gem.offset = bo_offset_or_userptr,
+		};
+
+		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
 		break;
+	}
 	case DRM_XE_VM_BIND_OP_UNMAP:
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
 		break;
@@ -2443,7 +2554,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u16 pat_index, unsigned int flags)
+			      struct xe_vma_mem_attr *attr, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
@@ -2472,7 +2583,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2589,6 +2700,29 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
+/**
+ * xe_vma_has_default_mem_attrs - Check if a VMA has default memory attributes
+ * @vma: Pointer to the xe_vma structure to check
+ *
+ * This function determines whether the given VMA (Virtual Memory Area)
+ * has its memory attributes set to their default values. Specifically,
+ * it checks the following conditions:
+ *
+ * - `atomic_access` is `DRM_XE_VMA_ATOMIC_UNDEFINED`
+ * - `pat_index` is equal to `default_pat_index`
+ * - `preferred_loc.devmem_fd` is `DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE`
+ * - `preferred_loc.migration_policy` is `DRM_XE_MIGRATE_ALL_PAGES`
+ *
+ * Return: true if all attributes are at their default values, false otherwise.
+ */
+bool xe_vma_has_default_mem_attrs(struct xe_vma *vma)
+{
+	return (vma->attr.atomic_access == DRM_XE_ATOMIC_UNDEFINED &&
+		vma->attr.pat_index ==  vma->attr.default_pat_index &&
+		vma->attr.preferred_loc.devmem_fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE &&
+		vma->attr.preferred_loc.migration_policy == DRM_XE_MIGRATE_ALL_PAGES);
+}
+
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				   struct xe_vma_ops *vops)
 {
@@ -2615,6 +2749,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			struct xe_vma_mem_attr default_attr = {
+				.preferred_loc = {
+					.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+				},
+				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+				.default_pat_index = op->map.pat_index,
+				.pat_index = op->map.pat_index,
+			};
+
 			flags |= op->map.read_only ?
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
@@ -2624,7 +2768,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, &default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2652,8 +2796,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				end = op->base.remap.next->va.addr;
 
 			if (xe_vma_is_cpu_addr_mirror(old) &&
-			    xe_svm_has_mapping(vm, start, end))
-				return -EBUSY;
+			    xe_svm_has_mapping(vm, start, end)) {
+				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
+					xe_svm_unmap_address_range(vm, start, end);
+				else
+					return -EBUSY;
+			}
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
@@ -2672,7 +2820,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2702,7 +2850,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->pat_index, flags);
+					      &old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2892,15 +3040,28 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	int err = 0;
 
 	struct xe_svm_range *svm_range;
+	struct drm_pagemap *dpagemap;
 	struct drm_gpusvm_ctx ctx = {};
-	struct xe_tile *tile;
+	struct xe_tile *tile = NULL;
 	unsigned long i;
 	u32 region;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
 
-	region = op->prefetch_range.region;
+	if (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
+		dpagemap = xe_vma_resolve_pagemap(vma, xe_device_get_root_tile(vm->xe));
+		/*
+		 * TODO: Once multigpu support is enabled will need
+		 * something to dereference tile from dpagemap.
+		 */
+		if (dpagemap)
+			tile = xe_device_get_root_tile(vm->xe);
+	} else {
+		region = op->prefetch_range.region;
+		if (region)
+			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+	}
 
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
@@ -2908,11 +3069,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!region)
+		if (!tile)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
 			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
@@ -2980,7 +3140,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		else
 			region = op->prefetch.region;
 
-		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
+			  region <= ARRAY_SIZE(region_to_mem_type));
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
@@ -3398,8 +3559,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
-				       xe->info.mem_region_mask)) ||
+		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
+				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
@@ -4161,3 +4322,221 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+/**
+ * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
+ * @xe: Pointer to the XE device structure
+ * @vma: Pointer to the virtual memory area (VMA) structure
+ * @is_atomic: In pagefault path and atomic operation
+ *
+ * This function determines whether the given VMA needs to be migrated to
+ * VRAM in order to do atomic GPU operation.
+ *
+ * Return:
+ *   1        - Migration to VRAM is required
+ *   0        - Migration is not required
+ *   -EINVAL  - Invalid access for atomic memory attr
+ *
+ */
+int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
+{
+	u32 atomic_access = xe_vma_bo(vma) ? xe_vma_bo(vma)->attr.atomic_access :
+					     vma->attr.atomic_access;
+
+	if (!IS_DGFX(xe) || !is_atomic)
+		return false;
+
+	/*
+	 * NOTE: The checks implemented here are platform-specific. For
+	 * instance, on a device supporting CXL atomics, these would ideally
+	 * work universally without additional handling.
+	 */
+	switch (atomic_access) {
+	case DRM_XE_ATOMIC_DEVICE:
+		return !xe->info.has_device_atomics_on_smem;
+
+	case DRM_XE_ATOMIC_CPU:
+		return -EINVAL;
+
+	case DRM_XE_ATOMIC_UNDEFINED:
+	case DRM_XE_ATOMIC_GLOBAL:
+	default:
+		return 1;
+	}
+}
+
+static int xe_vm_alloc_vma(struct xe_vm *vm, struct drm_gpuva_op_map *map_req)
+{
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct drm_gpuva_op *__op;
+	bool is_cpu_addr_mirror = false;
+	bool remap_op = false;
+	bool is_madvise = (map_req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
+	struct xe_vma_mem_attr tmp_attr;
+	u16 default_pat;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
+	       map_req->va.addr, map_req->va.range);
+
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+
+	if (list_empty(&ops->list)) {
+		err = 0;
+		goto free_ops;
+	}
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma = NULL;
+
+		if (!is_madvise) {
+			if (__op->op == DRM_GPUVA_OP_UNMAP) {
+				vma = gpuva_to_vma(op->base.unmap.va);
+				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
+				default_pat = vma->attr.default_pat_index;
+			}
+
+			if (__op->op == DRM_GPUVA_OP_REMAP) {
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+				default_pat = vma->attr.default_pat_index;
+			}
+
+			if (__op->op == DRM_GPUVA_OP_MAP) {
+				op->map.is_cpu_addr_mirror = true;
+				op->map.pat_index = default_pat;
+			}
+		} else {
+			if (__op->op == DRM_GPUVA_OP_REMAP) {
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+				xe_assert(vm->xe, !remap_op);
+				remap_op = true;
+
+				if (xe_vma_is_cpu_addr_mirror(vma))
+					is_cpu_addr_mirror = true;
+				else
+					is_cpu_addr_mirror = false;
+			}
+
+			if (__op->op == DRM_GPUVA_OP_MAP) {
+				xe_assert(vm->xe, remap_op);
+				remap_op = false;
+				/*
+				 * In case of madvise ops DRM_GPUVA_OP_MAP is
+				 * always after DRM_GPUVA_OP_REMAP, so ensure
+				 * we assign op->map.is_cpu_addr_mirror true
+				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+				 */
+				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+			}
+		}
+		print_op(vm->xe, __op);
+	}
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+
+	if (is_madvise)
+		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+
+	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
+	if (err)
+		goto unwind_ops;
+
+	xe_vm_lock(vm, false);
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma;
+
+		if (__op->op == DRM_GPUVA_OP_UNMAP) {
+			vma = gpuva_to_vma(op->base.unmap.va);
+			/* There should be no unmap for madvise */
+			if (is_madvise)
+				XE_WARN_ON("UNEXPECTED UNMAP");
+
+			xe_vma_destroy(vma, NULL);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			vma = gpuva_to_vma(op->base.remap.unmap->va);
+			/* In case of madvise ops Store attributes for REMAP UNMAPPED
+			 * VMA, so they can be assigned to newly MAP created vma.
+			 */
+			if (is_madvise)
+				tmp_attr = vma->attr;
+
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_MAP) {
+			vma = op->map.vma;
+			/* In case of madvise call, MAP will always be follwed by REMAP.
+			 * Therefore temp_attr will always have sane values, making it safe to
+			 * copy them to new vma.
+			 */
+			if (is_madvise)
+				vma->attr = tmp_attr;
+		}
+	}
+
+	xe_vm_unlock(vm);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return 0;
+
+unwind_ops:
+	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
+free_ops:
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return err;
+}
+
+/**
+ * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits existing vma to create new vma for user provided input range
+ *
+ * Return: 0 if success
+ */
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	struct drm_gpuva_op_map map_req = {
+		.va.addr = start,
+		.va.range = range,
+		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
+	};
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+
+	return xe_vm_alloc_vma(vm, &map_req);
+}
+
+/**
+ * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits/merges existing vma to create new vma for user provided input range
+ *
+ * Return: 0 if success
+ */
+int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	struct drm_gpuva_op_map map_req = {
+		.va.addr = start,
+		.va.range = range,
+	};
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
+	       start, range);
+
+	return xe_vm_alloc_vma(vm, &map_req);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..3953b3ee2955 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -66,6 +66,8 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
 struct xe_vma *
 xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
 
+bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
+
 /**
  * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
  * @vm: The vm
@@ -171,6 +173,12 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
+
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
+int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
@@ -191,7 +199,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
-
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 void xe_vm_close_and_put(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
new file mode 100644
index 000000000000..99fec6793e41
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_vm_madvise.h"
+
+#include <linux/nospec.h>
+#include <drm/xe_drm.h>
+
+#include "xe_bo.h"
+#include "xe_pat.h"
+#include "xe_pt.h"
+#include "xe_svm.h"
+
+struct xe_vmas_in_madvise_range {
+	u64 addr;
+	u64 range;
+	struct xe_vma **vmas;
+	int num_vmas;
+	bool has_svm_vmas;
+	bool has_bo_vmas;
+	bool has_userptr_vmas;
+};
+
+static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
+{
+	u64 addr = madvise_range->addr;
+	u64 range = madvise_range->range;
+
+	struct xe_vma  **__vmas;
+	struct drm_gpuva *gpuva;
+	int max_vmas = 8;
+
+	lockdep_assert_held(&vm->lock);
+
+	madvise_range->num_vmas = 0;
+	madvise_range->vmas = kmalloc_array(max_vmas, sizeof(*madvise_range->vmas), GFP_KERNEL);
+	if (!madvise_range->vmas)
+		return -ENOMEM;
+
+	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (xe_vma_bo(vma))
+			madvise_range->has_bo_vmas = true;
+		else if (xe_vma_is_cpu_addr_mirror(vma))
+			madvise_range->has_svm_vmas = true;
+		else if (xe_vma_is_userptr(vma))
+			madvise_range->has_userptr_vmas = true;
+
+		if (madvise_range->num_vmas == max_vmas) {
+			max_vmas <<= 1;
+			__vmas = krealloc(madvise_range->vmas,
+					  max_vmas * sizeof(*madvise_range->vmas),
+					  GFP_KERNEL);
+			if (!__vmas) {
+				kfree(madvise_range->vmas);
+				return -ENOMEM;
+			}
+			madvise_range->vmas = __vmas;
+		}
+
+		madvise_range->vmas[madvise_range->num_vmas] = vma;
+		(madvise_range->num_vmas)++;
+	}
+
+	if (!madvise_range->num_vmas)
+		kfree(madvise_range->vmas);
+
+	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n", madvise_range->num_vmas);
+
+	return 0;
+}
+
+static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
+				      struct xe_vma **vmas, int num_vmas,
+				      struct drm_xe_madvise *op)
+{
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC);
+
+	for (i = 0; i < num_vmas; i++) {
+		/*TODO: Extend attributes to bo based vmas */
+		if (!xe_vma_is_cpu_addr_mirror(vmas[i])) {
+			vmas[i]->skip_invalidation = true;
+			continue;
+		}
+
+		if (vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		    vmas[i]->attr.preferred_loc.migration_policy ==
+		    op->preferred_mem_loc.migration_policy) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			/* Till multi-device support is not added migration_policy
+			 * is of no use and can be ignored.
+			 */
+			vmas[i]->attr.preferred_loc.migration_policy =
+						op->preferred_mem_loc.migration_policy;
+		}
+	}
+}
+
+static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
+			   struct xe_vma **vmas, int num_vmas,
+			   struct drm_xe_madvise *op)
+{
+	struct xe_bo *bo;
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
+	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
+
+	for (i = 0; i < num_vmas; i++) {
+		if (xe_vma_is_userptr(vmas[i])) {
+			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
+			    xe->info.has_device_atomics_on_smem)) {
+				vmas[i]->skip_invalidation = true;
+				continue;
+			}
+		}
+
+		if (vmas[i]->attr.atomic_access == op->atomic.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.atomic_access = op->atomic.val;
+		}
+
+		vmas[i]->attr.atomic_access = op->atomic.val;
+
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+
+		xe_bo_assert_held(bo);
+		bo->attr.atomic_access = op->atomic.val;
+
+		/* Invalidate cpu page table, so bo can migrate to smem in next access */
+		if (xe_bo_is_vram(bo) &&
+		    (bo->attr.atomic_access == DRM_XE_ATOMIC_CPU ||
+		     bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL))
+			ttm_bo_unmap_virtual(&bo->ttm);
+	}
+}
+
+static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
+			      struct xe_vma **vmas, int num_vmas,
+			      struct drm_xe_madvise *op)
+{
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
+
+	for (i = 0; i < num_vmas; i++) {
+		if (vmas[i]->attr.pat_index == op->pat_index.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.pat_index = op->pat_index.val;
+		}
+	}
+}
+
+typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
+			     struct xe_vma **vmas, int num_vmas,
+			     struct drm_xe_madvise *op);
+
+static const madvise_func madvise_funcs[] = {
+	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
+	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
+	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
+};
+
+static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct drm_gpuva *gpuva;
+	struct xe_tile *tile;
+	u8 id, tile_mask;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	/* Wait for pending binds */
+	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
+				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
+		XE_WARN_ON(1);
+
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (vma->skip_invalidation || xe_vma_is_null(vma))
+			continue;
+
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+								      xe_vma_start(vma),
+								      xe_vma_end(vma));
+		} else {
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes(tile, vma)) {
+					tile_mask |= BIT(id);
+
+				/*
+				 * WRITE_ONCE pairs with READ_ONCE
+				 * in xe_vm_has_valid_gpu_mapping()
+				 */
+				WRITE_ONCE(vma->tile_invalidated,
+					   vma->tile_invalidated | BIT(id));
+				}
+			}
+		}
+	}
+
+	return tile_mask;
+}
+
+static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	u8 tile_mask = xe_zap_ptes_in_madvise_range(vm, start, end);
+
+	if (!tile_mask)
+		return 0;
+
+	xe_device_wmb(vm->xe);
+
+	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
+}
+
+static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
+{
+	if (XE_IOCTL_DBG(xe, !args))
+		return false;
+
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
+		return false;
+
+	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
+		return false;
+
+	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
+		return false;
+
+	switch (args->type) {
+	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
+	{
+		s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
+
+		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.migration_policy >
+				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->preferred_mem_loc.pad))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
+			return false;
+		break;
+	}
+	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
+		if (XE_IOCTL_DBG(xe, args->atomic.val > DRM_XE_ATOMIC_CPU))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->atomic.pad))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->atomic.reserved))
+			return false;
+
+		break;
+	case DRM_XE_MEM_RANGE_ATTR_PAT:
+	{
+		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
+
+		if (XE_IOCTL_DBG(xe, !coh_mode))
+			return false;
+
+		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->pat_index.reserved))
+			return false;
+		break;
+	}
+	default:
+		if (XE_IOCTL_DBG(xe, 1))
+			return false;
+	}
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return false;
+
+	return true;
+}
+
+static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
+				   int num_vmas, u32 atomic_val)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_bo *bo;
+	int i;
+
+	for (i = 0; i < num_vmas; i++) {
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+		/*
+		 * NOTE: The following atomic checks are platform-specific. For example,
+		 * if a device supports CXL atomics, these may not be necessary or
+		 * may behave differently.
+		 */
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_CPU &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
+				   xe->info.has_device_atomics_on_smem)))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return false;
+	}
+	return true;
+}
+/**
+ * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
+ * @dev: DRM device pointer
+ * @data: Pointer to ioctl data (drm_xe_madvise*)
+ * @file: DRM file pointer
+ *
+ * Handles the MADVISE ioctl to provide memory advice for vma's within
+ * input range.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_madvise *args = data;
+	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
+							 .range =  args->range, };
+	struct xe_vm *vm;
+	struct drm_exec exec;
+	int err, attr_type;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (!madvise_args_are_sane(vm->xe, args)) {
+		err = -EINVAL;
+		goto put_vm;
+	}
+
+	xe_svm_flush(vm);
+
+	err = down_write_killable(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
+	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	if (err)
+		goto unlock_vm;
+
+	err = get_vmas(vm, &madvise_range);
+	if (err || !madvise_range.num_vmas)
+		goto unlock_vm;
+
+	if (madvise_range.has_bo_vmas) {
+		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
+			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
+						    madvise_range.num_vmas,
+						    args->atomic.val)) {
+				err = -EINVAL;
+				goto unlock_vm;
+			}
+		}
+
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+		drm_exec_until_all_locked(&exec) {
+			for (int i = 0; i < madvise_range.num_vmas; i++) {
+				struct xe_bo *bo = xe_vma_bo(madvise_range.vmas[i]);
+
+				if (!bo)
+					continue;
+				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
+				drm_exec_retry_on_contention(&exec);
+				if (err)
+					goto err_fini;
+			}
+		}
+	}
+
+	if (madvise_range.has_userptr_vmas) {
+		err = down_read_interruptible(&vm->userptr.notifier_lock);
+		if (err)
+			goto err_fini;
+	}
+
+	if (madvise_range.has_svm_vmas) {
+		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
+		if (err)
+			goto unlock_userptr;
+	}
+
+	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
+	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args);
+
+	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
+
+	if (madvise_range.has_svm_vmas)
+		xe_svm_notifier_unlock(vm);
+
+unlock_userptr:
+	if (madvise_range.has_userptr_vmas)
+		up_read(&vm->userptr.notifier_lock);
+err_fini:
+	if (madvise_range.has_bo_vmas)
+		drm_exec_fini(&exec);
+	kfree(madvise_range.vmas);
+	madvise_range.vmas = NULL;
+unlock_vm:
+	up_write(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
new file mode 100644
index 000000000000..b0e1fc445f23
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
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
index bed6088e1bb3..351242c92c12 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -77,6 +77,44 @@ struct xe_userptr {
 #endif
 };
 
+/**
+ * struct xe_vma_mem_attr - memory attributes associated with vma
+ */
+struct xe_vma_mem_attr {
+	/** @preferred_loc: perferred memory_location */
+	struct {
+		/** @preferred_loc.migration_policy: Pages migration policy */
+		u32 migration_policy;
+
+		/**
+		 * @preferred_loc.devmem_fd: used for determining pagemap_fd
+		 * requested by user DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and
+		 * DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE mean system memory or
+		 * closest device memory respectively.
+		 */
+		u32 devmem_fd;
+	} preferred_loc;
+
+	/**
+	 * @atomic_access: The atomic access type for the vma
+	 * See %DRM_XE_VMA_ATOMIC_UNDEFINED, %DRM_XE_VMA_ATOMIC_DEVICE,
+	 * %DRM_XE_VMA_ATOMIC_GLOBAL, and %DRM_XE_VMA_ATOMIC_CPU for possible
+	 * values. These are defined in uapi/drm/xe_drm.h.
+	 */
+	u32 atomic_access;
+
+	/**
+	 * @default_pat_index: The pat index for VMA set during first bind by user.
+	 */
+	u16 default_pat_index;
+
+	/**
+	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 * same as default_pat_index unless overwritten by madvise.
+	 */
+	u16 pat_index;
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -126,15 +164,22 @@ struct xe_vma {
 	u8 tile_staged;
 
 	/**
-	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 * @skip_invalidation: Used in madvise to avoid invalidation
+	 * if mem attributes doesn't change
 	 */
-	u16 pat_index;
+	bool skip_invalidation;
 
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
@@ -462,6 +507,7 @@ struct xe_vma_ops {
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 	/** @flag: signify the properties within xe_vma_ops*/
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
+#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 4aedc5423aff..142fc2af1716 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -282,6 +282,10 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
 			    unsigned long end);
 
+struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
+			 unsigned long end);
+
 struct drm_gpusvm_range *
 drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 		      unsigned long end);
@@ -434,4 +438,70 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
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
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
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
+/**
+ * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @gpusvm__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
+ */
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
+
+/**
+ * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @next__: Iterator variable for the notifiers temporay storage
+ * @gpusvm__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
+ * removing notifiers from it.
+ */
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+
 #endif /* __DRM_GPUSVM_H__ */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 274532facfd6..a8e9f70501ef 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gpuvm *gpuvm,
 struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start);
 struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
 
-static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 range,
-				  struct drm_gem_object *obj, u64 offset)
-{
-	va->va.addr = addr;
-	va->va.range = range;
-	va->gem.obj = obj;
-	va->gem.offset = offset;
-}
-
 /**
  * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gpuva is
  * invalidated
@@ -819,6 +810,21 @@ enum drm_gpuva_op_type {
 	DRM_GPUVA_OP_DRIVER,
 };
 
+/** DOC: flags for struct drm_gpuva_op_map
+ *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT split and merge,
+ *  It cannot be combined with other flags.
+ *
+ *  %DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE: This flag is used by
+ *  drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the user-provided
+ *  range and split the existing non-GEM object VMA if the start or end of
+ *  the input range lies within it. The operations can create up to 2 REMAPS
+ *  and 2 MAPs. Unlike DRM_GPUVM_SM_MAP_OPS_FLAG_NONE flag, the operation with
+ *  this flag will never have UNMAPs and merges, and can be without any final
+ *  operations.
+ */
+#define DRM_GPUVM_SM_MAP_OPS_FLAG_NONE 0
+#define DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE BIT(0)
+
 /**
  * struct drm_gpuva_op_map - GPU VA map operation
  *
@@ -856,6 +862,13 @@ struct drm_gpuva_op_map {
 		 */
 		struct drm_gem_object *obj;
 	} gem;
+
+	/**
+	 * @flags: Bitmask of DRM_GPUVM_SM_MAP_* flags.
+	 * Use DRM_GPUVM_SM_MAP_OPS_FLAG_NONE (0) for default split merge.
+	 * It cannot be combined with other flags.
+	 */
+	u32 flags;
 };
 
 /**
@@ -1060,8 +1073,8 @@ struct drm_gpuva_ops {
 
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 addr, u64 range,
-			    struct drm_gem_object *obj, u64 offset);
+			    const struct drm_gpuva_op_map *req);
+
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
 			      u64 addr, u64 range);
@@ -1079,8 +1092,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
 					  struct drm_gpuva_op_map *op)
 {
-	drm_gpuva_init(va, op->va.addr, op->va.range,
-		       op->gem.obj, op->gem.offset);
+	va->va.addr = op->va.addr;
+	va->va.range = op->va.range;
+	va->gem.obj = op->gem.obj;
+	va->gem.offset = op->gem.offset;
 }
 
 /**
@@ -1205,16 +1220,14 @@ struct drm_gpuvm_ops {
 };
 
 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
-		     u64 addr, u64 range,
-		     struct drm_gem_object *obj, u64 offset);
+		     const struct drm_gpuva_op_map *req);
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
 int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
 			  struct drm_exec *exec, unsigned int num_fences,
-			  u64 req_addr, u64 req_range,
-			  struct drm_gem_object *obj, u64 offset);
+			  struct drm_gpuva_op_map *req);
 
 int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 				 u64 req_addr, u64 req_range);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c721e130c1d2..6b03f319ab70 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,8 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_MADVISE
+ *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
  */
 
 /*
@@ -102,6 +104,8 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_MADVISE			0x0c
+#define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +121,8 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1007,6 +1013,10 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
+ *
+ * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
+ *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
+ *    the memory region advised by madvise.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1112,6 +1122,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
@@ -1978,6 +1989,269 @@ struct drm_xe_query_eu_stall {
 	__u64 sampling_rates[];
 };
 
+/**
+ * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
+ *
+ * This structure is used to set memory attributes for a virtual address range
+ * in a VM. The type of attribute is specified by @type, and the corresponding
+ * union member is used to provide additional parameters for @type.
+ *
+ * Supported attribute types:
+ * - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
+ * - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
+ * - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ * struct drm_xe_madvise madvise = {
+ *          .vm_id = vm_id,
+ *          .start = 0x100000,
+ *          .range = 0x2000,
+ *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+ *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
+ *         };
+ *
+ * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
+ *
+ */
+struct drm_xe_madvise {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @range: size of the virtual address range */
+	__u64 range;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+#define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
+#define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
+#define DRM_XE_MEM_RANGE_ATTR_PAT		2
+	/** @type: type of attribute */
+	__u32 type;
+
+	union {
+		/**
+		 * @preferred_mem_loc: preferred memory location
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
+		 *
+		 * Supported values for @preferred_mem_loc.devmem_fd:
+		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
+		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
+		 *
+		 * Supported values for @preferred_mem_loc.migration_policy:
+		 * - DRM_XE_MIGRATE_ALL_PAGES
+		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
+		 */
+		struct {
+#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
+#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
+			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+			__u32 devmem_fd;
+
+#define DRM_XE_MIGRATE_ALL_PAGES		0
+#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1
+			/** @preferred_mem_loc.migration_policy: Page migration policy */
+			__u16 migration_policy;
+
+			/** @preferred_mem_loc.pad : MBZ */
+			__u16 pad;
+
+			/** @preferred_mem_loc.reserved : Reserved */
+			__u64 reserved;
+		} preferred_mem_loc;
+
+		/**
+		 * @atomic: Atomic access policy
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
+		 *
+		 * Supported values for @atomic.val:
+		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
+		 *   Support both GPU and CPU atomic operations for system allocator
+		 *   Support GPU atomic operations for normal(bo) allocator
+		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
+		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
+		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
+		 */
+		struct {
+#define DRM_XE_ATOMIC_UNDEFINED	0
+#define DRM_XE_ATOMIC_DEVICE	1
+#define DRM_XE_ATOMIC_GLOBAL	2
+#define DRM_XE_ATOMIC_CPU	3
+			/** @atomic.val: value of atomic operation */
+			__u32 val;
+
+			/** @atomic.pad: MBZ */
+			__u32 pad;
+
+			/** @atomic.reserved: Reserved */
+			__u64 reserved;
+		} atomic;
+
+		/**
+		 * @pat_index: Page attribute table index
+		 *
+		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PAT.
+		 */
+		struct {
+			/** @pat_index.val: PAT index value */
+			__u32 val;
+
+			/** @pat_index.pad: MBZ */
+			__u32 pad;
+
+			/** @pat_index.reserved: Reserved */
+			__u64 reserved;
+		} pat_index;
+	};
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_mem_range_attr - Output of &DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS
+ *
+ * This structure is provided by userspace and filled by KMD in response to the
+ * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
+ * a memory ranges within a user specified address range in a VM.
+ *
+ * The structure includes information such as atomic access policy,
+ * page attribute table (PAT) index, and preferred memory location.
+ * Userspace allocates an array of these structures and passes a pointer to the
+ * ioctl to retrieve attributes for each memory ranges
+ *
+ * @extensions: Pointer to the first extension struct, if any
+ * @start: Start address of the memory range
+ * @end: End address of the virtual memory range
+ *
+ */
+struct drm_xe_mem_range_attr {
+	 /** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @start: start of the memory range */
+	__u64 start;
+
+	/** @end: end of the memory range */
+	__u64 end;
+
+	/** @preferred_mem_loc: preferred memory location */
+	struct {
+		/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+		__u32 devmem_fd;
+
+		/** @preferred_mem_loc.migration_policy: Page migration policy */
+		__u32 migration_policy;
+	} preferred_mem_loc;
+
+	/** * @atomic: Atomic access policy */
+	struct {
+		/** @atomic.val: atomic attribute */
+		__u32 val;
+
+		/** @atomic.reserved: Reserved */
+		__u32 reserved;
+	} atomic;
+
+	 /** @pat_index: Page attribute table index */
+	struct {
+		/** @pat_index.val: PAT index */
+		__u32 val;
+
+		/** @pat_index.reserved: Reserved */
+		__u32 reserved;
+	} pat_index;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_vm_query_mem_range_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
+ *
+ * This structure is used to query memory attributes of memory regions
+ * within a user specified address range in a VM. It provides detailed
+ * information about each memory range, including atomic access policy,
+ * page attribute table (PAT) index, and preferred memory location.
+ *
+ * Userspace first calls the ioctl with @num_mem_ranges = 0,
+ * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL to retrieve
+ * the number of memory regions and size of each memory range attribute.
+ * Then, it allocates a buffer of that size and calls the ioctl again to fill
+ * the buffer with memory range attributes.
+ *
+ * If second call fails with -ENOSPC, it means memory ranges changed between
+ * first call and now, retry IOCTL again with @num_mem_ranges = 0,
+ * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
+ * Second ioctl call.
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *    struct drm_xe_vm_query_mem_range_attr query = {
+ *         .vm_id = vm_id,
+ *         .start = 0x100000,
+ *         .range = 0x2000,
+ *     };
+ *
+ *    // First ioctl call to get num of mem regions and sizeof each attribute
+ *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
+ *
+ *    // Allocate buffer for the memory region attributes
+ *    void *ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
+ *
+ *    query.vector_of_mem_attr = (uintptr_t)ptr;
+ *
+ *    // Second ioctl call to actually fill the memory attributes
+ *    ioctl(fd, DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS, &query);
+ *
+ *    // Iterate over the returned memory region attributes
+ *    for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
+ *       struct drm_xe_mem_range_attr *attr = (struct drm_xe_mem_range_attr *)ptr;
+ *
+ *       // Do something with attr
+ *
+ *       // Move pointer by one entry
+ *       ptr += query.sizeof_mem_range_attr;
+ *     }
+ *
+ *    free(ptr);
+ */
+struct drm_xe_vm_query_mem_range_attr {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: vm_id of the virtual range */
+	__u32 vm_id;
+
+	/** @num_mem_ranges: number of mem_ranges in range */
+	__u32 num_mem_ranges;
+
+	/** @start: start of the virtual address range */
+	__u64 start;
+
+	/** @range: size of the virtual address range */
+	__u64 range;
+
+	/** @sizeof_mem_range_attr: size of struct drm_xe_mem_range_attr */
+	__u64 sizeof_mem_range_attr;
+
+	/** @vector_of_mem_attr: userptr to array of struct drm_xe_mem_range_attr */
+	__u64 vector_of_mem_attr;
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

