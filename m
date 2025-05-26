Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559D9C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 14:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0181310E320;
	Mon, 26 May 2025 14:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUK6IfJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB58F10E320
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748268854; x=1779804854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAmSZx0ivHcD8jeLkCX3gQN23fOw9ekcwDLzibOYCCE=;
 b=jUK6IfJi5aZraScRGSURxLWH+BTdxcvLtLaeZdqLzFAPTEFLD4rC8UVP
 xzxYXblkrsrKlG0iojHFCltPkhornqb762HPNzUqk74lM8lhqXfABo0/u
 NEChLw5XNgo8fBEB8wxbZ3h+7WAai8rFiRBxaQ/MjcOpwU6KbUJYartSj
 RHz429RVbT3LfYpf718Xau/BqBsJdKKa7JlhsOEID+tTz+IqjSw+eUY4b
 YRJLEmiL/4A7suAhHE0GJA5Ml3X4PLWAcpwRp4+uzpolHdf+/KKQujhKo
 8Cecs+E4GmG2iysmum9yn1J27Hx7QTcfk792zEiT9oDqi7euogl1Jx8nK A==;
X-CSE-ConnectionGUID: K5mhh0TdTK+UuYGjQTBTEg==
X-CSE-MsgGUID: mDaP07fATf+aeyDuNzU4tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61655555"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="61655555"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 07:14:14 -0700
X-CSE-ConnectionGUID: eFUYxgMYQQC5kF0+7zM+Lg==
X-CSE-MsgGUID: g6dcVjf9QD6AUksgPWNElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="142340535"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 26 May 2025 07:14:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/1] [CI]: drm/xe/: Madvise SQUASH for CI
Date: Mon, 26 May 2025 20:09:52 +0530
Message-Id: <20250526143952.1011208-1-himal.prasad.ghimiray@intel.com>
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

- Do not Review

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c           | 122 ++------
 drivers/gpu/drm/drm_gpuvm.c            |  93 ++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |   1 +
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_bo.c             |  21 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   5 +
 drivers/gpu/drm/xe/xe_device.c         |   3 +
 drivers/gpu/drm/xe/xe_pt.c             |  11 +-
 drivers/gpu/drm/xe/xe_svm.c            | 165 +++++++---
 drivers/gpu/drm/xe/xe_svm.h            |  30 ++
 drivers/gpu/drm/xe/xe_vm.c             | 402 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h             |  12 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c     | 330 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
 drivers/gpu/drm/xe/xe_vm_types.h       |  28 +-
 include/drm/drm_gpusvm.h               |  70 +++++
 include/drm/drm_gpuvm.h                |  25 +-
 include/uapi/drm/xe_drm.h              | 183 +++++++++++
 18 files changed, 1293 insertions(+), 224 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 7bb9eb71c9aa..e50a25fe1079 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -380,107 +380,50 @@ static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
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
@@ -581,22 +524,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
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
@@ -1052,7 +979,7 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 	if (!mmget_not_zero(mm))
 		return ERR_PTR(-EFAULT);
 
-	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
+	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr, fault_addr + 1);
 	if (!notifier) {
 		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
 		if (IS_ERR(notifier)) {
@@ -1216,7 +1143,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
 	drm_gpusvm_driver_lock_held(gpusvm);
 
 	notifier = drm_gpusvm_notifier_find(gpusvm,
-					    drm_gpusvm_range_start(range));
+					    drm_gpusvm_range_start(range),
+					    drm_gpusvm_range_start(range) + 1);
 	if (WARN_ON_ONCE(!notifier))
 		return;
 
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..9d09d177b9fa 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2102,10 +2102,13 @@ static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
 		   u64 req_addr, u64 req_range,
+		   enum drm_gpuvm_sm_map_ops_flags flags,
 		   struct drm_gem_object *req_obj, u64 req_offset)
 {
 	struct drm_gpuva *va, *next;
 	u64 req_end = req_addr + req_range;
+	bool is_madvise_ops = (flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
+	bool needs_map = !is_madvise_ops;
 	int ret;
 
 	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
@@ -2118,26 +2121,35 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 range = va->va.range;
 		u64 end = addr + range;
 		bool merge = !!va->gem.obj;
+		bool skip_madvise_ops = is_madvise_ops && merge;
 
+		needs_map = false;
 		if (addr == req_addr) {
 			merge &= obj == req_obj &&
 				 offset == req_offset;
 
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
 					.va.range = range - req_range,
@@ -2152,6 +2164,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr < req_addr) {
@@ -2169,20 +2184,42 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
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
+					ret = op_map_cb(ops, priv, req_addr,
+							min(end - req_addr, req_end - end),
+							NULL, req_offset);
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
@@ -2194,6 +2231,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, &p, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					needs_map = true;
 				break;
 			}
 		} else if (addr > req_addr) {
@@ -2202,20 +2242,29 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 					   (addr - req_addr);
 
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
+				if (is_madvise_ops) {
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
@@ -2230,14 +2279,16 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				ret = op_remap_cb(ops, priv, NULL, &n, &u);
 				if (ret)
 					return ret;
+
+				if (is_madvise_ops)
+					return op_map_cb(ops, priv, addr,
+							(req_end - addr), NULL, req_offset);
 				break;
 			}
 		}
 	}
-
-	return op_map_cb(ops, priv,
-			 req_addr, req_range,
-			 req_obj, req_offset);
+	return needs_map ? op_map_cb(ops, priv, req_addr,
+			   req_range, req_obj, req_offset) : 0;
 }
 
 static int
@@ -2336,15 +2387,15 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 		 struct drm_gem_object *req_obj, u64 req_offset)
 {
 	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	enum drm_gpuvm_sm_map_ops_flags flags = DRM_GPUVM_SM_MAP_NOT_MADVISE;
 
 	if (unlikely(!(ops && ops->sm_step_map &&
 		       ops->sm_step_remap &&
 		       ops->sm_step_unmap)))
 		return -EINVAL;
 
-	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
-				  req_addr, req_range,
-				  req_obj, req_offset);
+	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req_addr, req_range,
+				  flags, req_obj, req_offset);
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
@@ -2486,6 +2537,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
+ * @drm_gpuvm_sm_map_ops_flag: ops flag determining madvise or not
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
  *
@@ -2516,6 +2568,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
 struct drm_gpuva_ops *
 drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 			    u64 req_addr, u64 req_range,
+			    enum drm_gpuvm_sm_map_ops_flags flags,
 			    struct drm_gem_object *req_obj, u64 req_offset)
 {
 	struct drm_gpuva_ops *ops;
@@ -2535,7 +2588,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
 	args.ops = ops;
 
 	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
-				 req_addr, req_range,
+				 req_addr, req_range, flags,
 				 req_obj, req_offset);
 	if (ret)
 		goto err_free_ops;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..26e13fcdbdb8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1303,6 +1303,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
 							      op->va.addr,
 							      op->va.range,
+							      DRM_GPUVM_SM_MAP_NOT_MADVISE,
 							      op->gem.obj,
 							      op->gem.offset);
 			if (IS_ERR(op->ops)) {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c5d6681645ed..dc64bdcddfdc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -117,6 +117,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vm_madvise.o \
 	xe_vram.o \
 	xe_vram_freq.o \
 	xe_vsec.o \
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..9072e8ae3f3e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1662,6 +1662,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
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
@@ -1670,7 +1676,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1682,8 +1688,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
index eb5e83c5f233..70960368a5a8 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -62,6 +62,11 @@ struct xe_bo {
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
index d4b6e623aa48..8c965d15c187 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -61,6 +61,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vm_madvise.h"
 #include "xe_vram.h"
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
@@ -197,6 +198,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c9c41fbe125c..ad17ded0ecaa 100644
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
@@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
 	return true;
 }
 
-static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
+static bool xe_atomic_for_system(struct xe_vm *vm,
+				 struct xe_bo *bo,
+				 struct xe_vma *vma)
 {
 	struct xe_device *xe = vm->xe;
 
 	if (!xe->info.has_device_atomics_on_smem)
 		return false;
 
+	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
+		return true;
+
 	/*
 	 * If a SMEM+LMEM allocation is backed by SMEM, a device
 	 * atomics will cause a gpu page fault and which then
@@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
 		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
-		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
+		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4432685936ed..ee2cdb57d392 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -167,14 +167,9 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 {
 	struct xe_vm *vm = gpusvm_to_vm(gpusvm);
 	struct xe_device *xe = vm->xe;
-	struct xe_tile *tile;
 	struct drm_gpusvm_range *r, *first;
-	struct xe_gt_tlb_invalidation_fence
-		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
 	u64 adj_start = mmu_range->start, adj_end = mmu_range->end;
 	u8 tile_mask = 0;
-	u8 id;
-	u32 fence_id = 0;
 	long err;
 
 	xe_svm_assert_in_notifier(vm);
@@ -220,42 +215,8 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_device_wmb(xe);
 
-	for_each_tile(tile, xe, id) {
-		if (tile_mask & BIT(id)) {
-			int err;
-
-			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[fence_id], true);
-
-			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
-							   &fence[fence_id],
-							   adj_start,
-							   adj_end,
-							   vm->usm.asid);
-			if (WARN_ON_ONCE(err < 0))
-				goto wait;
-			++fence_id;
-
-			if (!tile->media_gt)
-				continue;
-
-			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id], true);
-
-			err = xe_gt_tlb_invalidation_range(tile->media_gt,
-							   &fence[fence_id],
-							   adj_start,
-							   adj_end,
-							   vm->usm.asid);
-			if (WARN_ON_ONCE(err < 0))
-				goto wait;
-			++fence_id;
-		}
-	}
-
-wait:
-	for (id = 0; id < fence_id; ++id)
-		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	err = xe_vm_range_tilemask_tlb_invalidation(vm, adj_start, adj_end, tile_mask);
+	XE_WARN_ON(err);
 
 range_notifier_event_end:
 	r = first;
@@ -810,6 +771,8 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
+	preferred_region_is_vram |=  xe_vma_need_vram_migrate_for_atomic(vm->xe, vma);
+
 	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
 		return false;
 
@@ -828,6 +791,48 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return true;
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
+	if (fd < 0)
+		return NULL;
+
+	if (fd == DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD && tile)
+		return &tile->mem.vram.dpagemap;
+
+	/* TODO: Support multi-device with drm_pagemap_from_fd(fd) */
+	return NULL;
+}
+
+/**
+ * xe_tile_from_dpagemap - Find xe_tile from drm_pagemap
+ * @dpagemap: pointer to struct drm_pagemap
+ *
+ * Return: Pointer to xe_tile
+ */
+struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
+{
+	return container_of(dpagemap, struct xe_tile, mem.vram.dpagemap);
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -851,7 +856,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
+		.devmem_only = atomic && xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
@@ -860,6 +865,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_svm_range *range;
 	struct drm_exec exec;
 	struct dma_fence *fence;
+	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
@@ -889,8 +895,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
+	dpagemap = xe_vma_resolve_pagemap(vma, tile);
 	if (--migrate_try_count >= 0 &&
-	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
+	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe) && !!dpagemap)) {
+		/* TODO : For multi-device dpagemap will be used to find the remote tile
+		 * and remote device. Will need to modify xe_svm_alloc_vram to use dpagemap
+		 * for future multi-device support.
+		 */
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
 		if (err) {
@@ -986,6 +997,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
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
@@ -1050,6 +1086,49 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 	return err;
 }
 
+/**
+ * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
+ * @vm: Pointer to the xe_vm structure
+ * @start: Start of the input range
+ * @end: End of the input range
+ *
+ * This function removes the page table entries (PTEs) associated
+ * with the svm ranges within the given input start amnd end
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
+	xe_svm_notifier_lock(vm);
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
+					tile_mask |= BIT(id);
+					range->tile_invalidated |= BIT(id);
+				}
+			}
+		}
+	}
+
+	xe_svm_notifier_unlock(vm);
+
+	return tile_mask;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 
 static struct drm_pagemap_device_addr
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 19ce4f2754a7..a8b5bebf7a54 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -91,6 +91,14 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 
 u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
 
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
+
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
+
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
+
+struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -305,6 +313,28 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
 	return ULONG_MAX;
 }
 
+static inline
+u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	return 0;
+}
+
+static inline
+void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
+{
+}
+
+static inline
+struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile)
+{
+	return NULL;
+}
+
+static inline
+struct xe_tile *xe_tile_from_dpagemap(struct drm_pagemap *dpagemap)
+{
+	return NULL;
+}
 #define xe_svm_assert_in_notifier(...) do {} while (0)
 #define xe_svm_range_has_dma_mapping(...) false
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5a978da411b0..1bdf85c12374 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1221,7 +1221,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->pat_index = pat_index;
+	vma->attr.pat_index = pat_index;
 
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
@@ -2162,6 +2162,93 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+static void xe_vm_query_vmas(struct xe_vm *vm, u32 *num_vmas, u64 start, u64 end)
+{
+	struct drm_gpuva *gpuva;
+
+	lockdep_assert_held(&vm->lock);
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
+		(*num_vmas)++;
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
+	int err = 0;
+
+	if (XE_IOCTL_DBG(xe, args->num_vmas < 0))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	down_read(&vm->lock);
+
+	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
+
+	if (args->num_vmas == 0 && !attrs_user) {
+		xe_vm_query_vmas(vm, &args->num_vmas, args->start, args->start + args->range);
+		goto unlock_vm;
+	}
+
+	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
+				   GFP_KERNEL | __GFP_ACCOUNT |
+				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
+	if (!mem_attrs) {
+		err = args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
+		goto unlock_vm;
+	}
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
+unlock_vm:
+	up_read(&vm->lock);
+	return err;
+}
+
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 {
 	if (page_addr > xe_vma_end(vma) - 1 ||
@@ -2311,6 +2398,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
+						  DRM_GPUVM_SM_MAP_NOT_MADVISE,
 						  obj, bo_offset_or_userptr);
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP:
@@ -2358,6 +2446,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			op->map.pat_index = pat_index;
 			op->map.invalidate_on_bind =
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
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
 			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 			struct xe_svm_range *svm_range;
@@ -2435,8 +2539,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
 
+static void cp_vma_mem_attr(struct xe_vma_mem_attr *dst, struct xe_vma_mem_attr *src)
+{
+	*dst = *src;
+}
+
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u16 pat_index, unsigned int flags)
+			      struct xe_vma_mem_attr attr, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct drm_exec exec;
@@ -2465,7 +2574,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
+			    op->va.range - 1, attr.pat_index, flags);
 	if (IS_ERR(vma))
 		goto err_unlock;
 
@@ -2482,6 +2591,8 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 		prep_vma_destroy(vm, vma, false);
 		xe_vma_destroy_unlocked(vma);
 		vma = ERR_PTR(err);
+	} else {
+		cp_vma_mem_attr(&vma->attr, &attr);
 	}
 
 	return vma;
@@ -2608,6 +2719,14 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
+			struct xe_vma_mem_attr default_attr = {
+				.preferred_loc = {
+				.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD,
+				},
+				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
+				.pat_index = op->map.pat_index
+			};
+
 			flags |= op->map.read_only ?
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
@@ -2617,7 +2736,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			flags |= op->map.is_cpu_addr_mirror ?
 				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+			vma = new_vma(vm, &op->base.map, default_attr,
 				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2646,7 +2765,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (xe_vma_is_cpu_addr_mirror(old) &&
 			    xe_svm_has_mapping(vm, start, end))
-				return -EBUSY;
+				xe_svm_range_clean_if_addr_within(vm, start, end);
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
@@ -2665,7 +2784,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
-					      old->pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2695,7 +2814,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 
 			if (op->base.remap.next) {
 				vma = new_vma(vm, op->base.remap.next,
-					      old->pat_index, flags);
+					      old->attr, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2885,27 +3004,45 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
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
+		dpagemap = xe_vma_resolve_pagemap(vma, tile);
+		if (dpagemap)
+			tile = xe_tile_from_dpagemap(dpagemap);
+	} else {
+		region = op->prefetch_range.region;
+		if (region)
+			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+	}
 
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
+	ctx.devmem_only = xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
+			  IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!region)
+		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile);
+
+		if (!needs_vram) {
 			xe_svm_range_migrate_to_smem(vm, svm_range);
+		} else if (needs_vram) {
+			/* If migration is mandated by atomic attributes
+			 * in vma, and prefetch region is smem, force prefetch
+			 * in vram of root tile.
+			 */
+			if (!tile)
+				tile = xe_device_get_root_tile(vm->xe);
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
@@ -2973,14 +3110,22 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		else
 			region = op->prefetch.region;
 
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
@@ -3391,8 +3536,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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
@@ -3835,6 +3980,68 @@ void xe_vm_unlock(struct xe_vm *vm)
 	dma_resv_unlock(xe_vm_resv(vm));
 }
 
+/**
+ * xe_vm_range_tilemask_tlb_invalidation - Issue a TLB invalidation on this tilemask for an
+ * address range
+ * @vm: The VM
+ * @start: start address
+ * @end: end address
+ * @tile_mask: mask for which gt's issue tlb invalidation
+ *
+ * Issue a range based TLB invalidation for gt's in tilemask
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
+					  u64 end, u8 tile_mask)
+{
+	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+	struct xe_tile *tile;
+	u32 fence_id = 0;
+	u8 id;
+	int err;
+
+	if (!tile_mask)
+		return 0;
+
+	for_each_tile(tile, vm->xe, id) {
+		if (tile_mask & BIT(id)) {
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
+
+	return err;
+}
+
 /**
  * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
  * @vma: VMA to invalidate
@@ -3849,11 +4056,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
-	struct xe_gt_tlb_invalidation_fence
-		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
-	u8 id;
-	u32 fence_id = 0;
+	u8 tile_mask = 0;
 	int ret = 0;
+	u8 id;
 
 	xe_assert(xe, !xe_vma_is_null(vma));
 	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
@@ -3877,37 +4082,14 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		}
 	}
 
-	for_each_tile(tile, xe, id) {
-		if (xe_pt_zap_ptes(tile, vma)) {
-			xe_device_wmb(xe);
-			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
-							  &fence[fence_id],
-							  true);
-
-			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
-							 &fence[fence_id], vma);
-			if (ret)
-				goto wait;
-			++fence_id;
-
-			if (!tile->media_gt)
-				continue;
-
-			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
-							  &fence[fence_id],
-							  true);
+	for_each_tile(tile, xe, id)
+		if (xe_pt_zap_ptes(tile, vma))
+			tile_mask |= BIT(id);
 
-			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
-							 &fence[fence_id], vma);
-			if (ret)
-				goto wait;
-			++fence_id;
-		}
-	}
+	xe_device_wmb(xe);
 
-wait:
-	for (id = 0; id < fence_id; ++id)
-		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
+	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
+						    xe_vma_end(vma), tile_mask);
 
 	vma->tile_invalidated = vma->tile_mask;
 
@@ -4108,3 +4290,123 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+/**
+ * xe_vma_need_vram_migrate_for_atomic - Check if VMA needs VRAM migration for atomic operations
+ * @xe: Pointer to the XE device structure
+ * @vma: Pointer to the virtual memory area (VMA) structure
+ *
+ * This function determines whether the given VMA needs to be migrated to
+ * VRAM in order to do atomic GPU operation.
+ *
+ * Return: true if migration to VRAM is required, false otherwise.
+ */
+bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma)
+{
+	/* Note: The checks implemented here are platform-specific. For instance,
+	 * on a device supporting CXL atomics, these would ideally work universally
+	 * without additional handling.
+	 */
+	if (!IS_DGFX(xe) || vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
+	    vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
+	    (xe->info.has_device_atomics_on_smem &&
+	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
+		return false;
+
+	return true;
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
+ *  Return: 0 if success
+ */
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
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
+					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
+					  NULL, start);
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
+
+		if (__op->op == DRM_GPUVA_OP_REMAP) {
+			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
+				is_cpu_addr_mirror = true;
+			else
+				is_cpu_addr_mirror = false;
+		}
+
+		if (__op->op == DRM_GPUVA_OP_MAP)
+			/* In case of madvise ops DRM_GPUVA_OP_REMAP is always by
+			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
+			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+			 */
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
+			XE_WARN_ON("UNEXPECTED UNMAP");
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			vma = gpuva_to_vma(op->base.remap.unmap->va);
+			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
+			 * to newly MAPPED vma.
+			 */
+			cp_vma_mem_attr(&temp_attr, &vma->attr);
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_MAP) {
+			vma = op->map.vma;
+			cp_vma_mem_attr(&vma->attr, &temp_attr);
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
+	if (ops)
+		drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 99e164852f63..b1e94b536c80 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -171,6 +171,10 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma);
+
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
@@ -191,7 +195,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
-
+int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 void xe_vm_close_and_put(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
@@ -218,6 +222,9 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
+bool xe_vma_has_preferred_mem_loc(struct xe_vma *vma,
+				  u32 *mem_region, u32 *devmem_fd);
+
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
@@ -228,6 +235,9 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 				     struct xe_svm_range *range);
 
+int xe_vm_range_tilemask_tlb_invalidation(struct xe_vm *vm, u64 start,
+					  u64 end, u8 tile_mask);
+
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 int xe_vm_validate_protected(struct xe_vm *vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
new file mode 100644
index 000000000000..e048eb48826c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -0,0 +1,330 @@
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
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
+
+	for (i = 0; i < num_vmas; i++) {
+		vmas[i]->attr.preferred_loc.devmem_fd = ops.preferred_mem_loc.devmem_fd;
+
+		/* Till multi-device support is not added migration_policy
+		 * is of no use and can be ignored.
+		 */
+		//vmas[i]->attr.preferred_loc.migration_policy =
+		//				ops.preferred_mem_loc.migration_policy;
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
+		/* NOTE: The following atomic checks are platform-specific. For example,
+		 * if a device supports CXL atomics, these may not be necessary or
+		 * may behave differently.
+		 */
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
+				   xe->info.has_device_atomics_on_smem)))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return -EINVAL;
+
+		err = xe_bo_lock(bo, true);
+		if (err)
+			return err;
+		bo->attr.atomic_access = ops.atomic.val;
+
+		/* Invalidate cpu page table, so bo can migrate to smem in next access */
+		if (xe_bo_is_vram(bo) &&
+		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
+		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
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
+	struct drm_gpuva *gpuva;
+	struct xe_tile *tile;
+	u8 id;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
+				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
+		XE_WARN_ON(1);
+
+	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
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
+static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	u8 tile_mask = 0;
+
+	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
+	if (!tile_mask)
+		return 0;
+
+	xe_device_wmb(vm->xe);
+
+	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
+}
+
+static int input_ranges_same(struct drm_xe_madvise_ops *old,
+			     struct drm_xe_madvise_ops *new)
+{
+	return (new->start == old->start && new->range == old->range);
+}
+
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
+	struct drm_xe_madvise_ops *advs_ops;
+	struct drm_xe_madvise *args = data;
+	struct xe_vm *vm;
+	struct xe_vma **vmas = NULL;
+	int num_vmas, err = 0;
+	int i, j, attr_type;
+	bool needs_invalidation;
+
+	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
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
+		if (!advs_ops) {
+			err =  args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
+			goto unlock_vm;
+		}
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
+			goto free_advs_ops;
+		}
+
+		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
+		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
+
+		kfree(vmas);
+		vmas = NULL;
+
+		if (err)
+			goto free_advs_ops;
+	}
+
+	for (i = 0; i < args->num_ops; i++) {
+		needs_invalidation = true;
+		for (j = i + 1; j < args->num_ops; ++j) {
+			if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
+				needs_invalidation = false;
+				break;
+			}
+		}
+		if (needs_invalidation) {
+			err = xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
+							     advs_ops[i].start + advs_ops[i].range);
+			if (err)
+				goto free_advs_ops;
+		}
+	}
+
+free_advs_ops:
+	if (args->num_ops > 1)
+		kvfree(advs_ops);
+unlock_vm:
+	up_write(&vm->lock);
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
index bfc145baad49..2f58c7bb0a85 100644
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
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 6a5156476bf4..cdd89e5af4f8 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -373,6 +373,10 @@ const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
 bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
 			    unsigned long end);
 
+struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
+			 unsigned long end);
+
 struct drm_gpusvm_range *
 drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 		      unsigned long end);
@@ -530,4 +534,70 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
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
index 2a9629377633..c589b886a4fd 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -211,6 +211,27 @@ enum drm_gpuvm_flags {
 	DRM_GPUVM_USERBITS = BIT(1),
 };
 
+/**
+ * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
+ */
+enum drm_gpuvm_sm_map_ops_flags {
+	/**
+	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
+	 */
+	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
+
+	/**
+	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
+	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
+	 * user-provided range and split the existing non-GEM object VMA if the
+	 * start or end of the input range lies within it. The operations can
+	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
+	 * in default mode, the operation with this flag will never have UNMAPs and
+	 * merges, and can be without any final operations.
+	 */
+	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -1059,8 +1080,8 @@ struct drm_gpuva_ops {
 #define drm_gpuva_next_op(op) list_next_entry(op, entry)
 
 struct drm_gpuva_ops *
-drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
-			    u64 addr, u64 range,
+drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm, u64 addr, u64 range,
+			    enum drm_gpuvm_sm_map_ops_flags flags,
 			    struct drm_gem_object *obj, u64 offset);
 struct drm_gpuva_ops *
 drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9c08738c3b91..6ff9ff0c09dd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,8 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_MADVISE
+ *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
  */
 
 /*
@@ -102,6 +104,8 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_MADVISE			0x0c
+#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0d
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +121,8 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1108,6 +1114,10 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+	/** DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC as prefetch_mem_region_instance
+	 * ensures prefetching in madvise-advised memory region.
+	 */
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
@@ -1965,6 +1975,179 @@ struct drm_xe_query_eu_stall {
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
+#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVMEM_FD 0
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
+	/**
+	 * @vector_of_ops: userptr to array of struct
+	 * drm_xe_vma_mem_attr
+	 */
+	__u64 vector_of_vma_mem_attr;
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

