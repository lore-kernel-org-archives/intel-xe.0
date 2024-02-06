Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F9CC48BC0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A29112F6B;
	Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a89J/gLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38A5112F67
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262614; x=1738798614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2E6DlNPyldznXskd3Mzij9gXryU7/i7OBwVZ/AmmIOw=;
 b=a89J/gLqJmTfOKCFHsYKUyFG1IxsRFL0ihzNC0aZipIttQs6jtYchyDu
 rKtoDQFGDKb+XMnhiF6HmANaWLL78mBifEvuJQMfvQWT0byQCDx6pywEq
 SiHRO7wImP3lDo38pIY+n9zaRaitdEzQJFEE9m3Q/nJcmwR0AOylC+sAM
 u0RI9lAIaXoOZVo2DS8vhLJdhi03M33oFTZUPGs4trRq3hcw8Q4962hAf
 vv4kj3sgLwDONPn0af0M7zxJb7rySxMFmTXs0mm0Oef6WDCkG8xxZWpEV
 qjYCWTt2be35FfhOD7Aj1IFLTGE9A0fbzxnq7JA0+dWz2qHOd7A7XiAiR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776786"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793786"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 04/22] drm/xe: Add struct xe_vma_ops abstraction
Date: Tue,  6 Feb 2024 15:37:11 -0800
Message-Id: <20240206233729.3173206-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

Having a structure which encapsulates a list of VMA operations will help
enable 1 job for the entire list.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 37 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++++
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0f552fd8d7e0..768fb223019b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2244,7 +2244,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct list_head *ops_list, bool last)
+				   struct xe_vma_ops *vops, bool last)
 {
 	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
@@ -2255,11 +2255,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 		struct xe_vma *vma;
-		bool first = list_empty(ops_list);
+		bool first = list_empty(&vops->list);
 		unsigned int flags = 0;
 
 		INIT_LIST_HEAD(&op->link);
-		list_add_tail(&op->link, ops_list);
+		list_add_tail(&op->link, &vops->list);
 
 		if (first) {
 			op->flags |= XE_VMA_OP_FIRST;
@@ -2371,7 +2371,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	}
 
 	/* FIXME: Unhandled corner case */
-	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
+	XE_WARN_ON(!last_op && last && !list_empty(&vops->list));
 
 	if (!last_op)
 		return 0;
@@ -2703,7 +2703,7 @@ static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
 
 static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 				  struct xe_vm *vm,
-				  struct list_head *ops_list)
+				  struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op;
 	int err;
@@ -2712,7 +2712,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 	if (err)
 		return err;
 
-	list_for_each_entry(op, ops_list, link) {
+	list_for_each_entry(op, &vops->list, link) {
 		err = op_lock(exec, vm, op);
 		if (err)
 			return err;
@@ -2722,13 +2722,13 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct list_head *ops_list,
+				     struct xe_vma_ops *vops,
 				     bool cleanup)
 {
 	struct xe_vma_op *op, *next;
 	struct dma_fence *fence = NULL;
 
-	list_for_each_entry_safe(op, next, ops_list, link) {
+	list_for_each_entry_safe(op, next, &vops->list, link) {
 		if (!IS_ERR(fence)) {
 			dma_fence_put(fence);
 			fence = xe_vma_op_execute(vm, op);
@@ -2746,7 +2746,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 }
 
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
-				     struct list_head *ops_list)
+				     struct xe_vma_ops *vops)
 {
 	struct drm_exec exec;
 	struct dma_fence *fence;
@@ -2756,12 +2756,12 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
+		err = vm_bind_ioctl_ops_lock(&exec, vm, vops);
 		drm_exec_retry_on_contention(&exec);
 		if (err)
 			goto unlock;
 
-		fence = ops_execute(vm, ops_list, true);
+		fence = ops_execute(vm, vops, true);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
@@ -2922,6 +2922,11 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 	return err;
 }
 
+static void xe_vma_ops_init(struct xe_vma_ops *vops)
+{
+	INIT_LIST_HEAD(&vops->list);
+}
+
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -2935,7 +2940,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
-	LIST_HEAD(ops_list);
+	struct xe_vma_ops vops;
 	int err;
 	int i;
 
@@ -3084,6 +3089,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
+	xe_vma_ops_init(&vops);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3103,14 +3109,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 
 		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
-					      &ops_list,
-					      i == args->num_binds - 1);
+					      &vops, i == args->num_binds - 1);
 		if (err)
 			goto unwind_ops;
 	}
 
 	/* Nothing to do */
-	if (list_empty(&ops_list)) {
+	if (list_empty(&vops.list)) {
 		err = -ENODATA;
 		goto unwind_ops;
 	}
@@ -3119,7 +3124,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (q)
 		xe_exec_queue_get(q);
 
-	err = vm_bind_ioctl_ops_execute(vm, &ops_list);
+	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 	up_write(&vm->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5ac9c5bebabc..0c70062f3065 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -366,4 +366,11 @@ struct xe_vma_op {
 		struct xe_vma_op_prefetch prefetch;
 	};
 };
+
+/** struct xe_vma_ops - VMA operations */
+struct xe_vma_ops {
+	/** @list: list of VMA operations */
+	struct list_head list;
+};
+
 #endif
-- 
2.34.1

