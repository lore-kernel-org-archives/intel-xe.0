Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AE1CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F2B113175;
	Wed, 10 Apr 2024 05:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbmYQae5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10F2113173
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727634; x=1744263634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/oLWOKLskc4Y5G6SWi5stKous696GPUV7joHLkVnIX8=;
 b=HbmYQae5oJX2/q0nSI5WZDH0sLY/6b2jB1CpmlCZQB4LrktuZuoR7N8v
 lJogZhrzNltGdRqdqEW646WE0xgUOEHDq/v16MR0d7vwFmkxMej1rFFI1
 g7YJ0i0Guai2EzHfowPoGWIoIcT9HVyLWF7u+oZ47Y6Knee7ya9NT/nxV
 im9CEoUNfpMShUyRt7i9iozq2J6a445hjbalSH3pui5JCefwDlKVHuSbo
 Zortaugi1dc3t0quihahyUXAFjMjaVReI9tfSOQ+S13cDHTnKdMQ7Gm9h
 WARG2D918SCJzRrMrCxyU6YM/41W4vwozNfLq0rDEEpUHj8Q/sn5gyRjn Q==;
X-CSE-ConnectionGUID: YT8lUSkhTp2PTmSzKebgCg==
X-CSE-MsgGUID: QNWrUmISRYSBPX73pCmnew==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18680002"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18680002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
X-CSE-ConnectionGUID: 1LPAITYqQUCVy+2kNm01iA==
X-CSE-MsgGUID: rf0Ef6nnSRSxr6MYZKFBZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536829"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH 04/13] drm/xe: Add struct xe_vma_ops abstraction
Date: Tue,  9 Apr 2024 22:40:47 -0700
Message-Id: <20240410054056.478023-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410054056.478023-1-matthew.brost@intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
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

v2:
 - Rebase

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 37 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++++
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2c0521573154..4cd485d5bc0a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2354,7 +2354,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct list_head *ops_list, bool last)
+				   struct xe_vma_ops *vops, bool last)
 {
 	struct xe_device *xe = vm->xe;
 	struct xe_vma_op *last_op = NULL;
@@ -2366,11 +2366,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
@@ -2496,7 +2496,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	}
 
 	/* FIXME: Unhandled corner case */
-	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
+	XE_WARN_ON(!last_op && last && !list_empty(&vops->list));
 
 	if (!last_op)
 		return 0;
@@ -2835,7 +2835,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 					   struct xe_vm *vm,
-					   struct list_head *ops_list)
+					   struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op;
 	int err;
@@ -2844,7 +2844,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	if (err)
 		return err;
 
-	list_for_each_entry(op, ops_list, link) {
+	list_for_each_entry(op, &vops->list, link) {
 		err = op_lock_and_prep(exec, vm, op);
 		if (err)
 			return err;
@@ -2854,13 +2854,13 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
@@ -2878,7 +2878,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 }
 
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
-				     struct list_head *ops_list)
+				     struct xe_vma_ops *vops)
 {
 	struct drm_exec exec;
 	struct dma_fence *fence;
@@ -2889,12 +2889,12 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
 		      DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, ops_list);
+		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
 		drm_exec_retry_on_contention(&exec);
 		if (err)
 			goto unlock;
 
-		fence = ops_execute(vm, ops_list, true);
+		fence = ops_execute(vm, vops, true);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
@@ -3055,6 +3055,11 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
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
@@ -3068,7 +3073,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
-	LIST_HEAD(ops_list);
+	struct xe_vma_ops vops;
 	int err;
 	int i;
 
@@ -3219,6 +3224,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
+	xe_vma_ops_init(&vops);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3238,14 +3244,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3254,7 +3259,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (q)
 		xe_exec_queue_get(q);
 
-	err = vm_bind_ioctl_ops_execute(vm, &ops_list);
+	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 	up_write(&vm->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0447c79c40a2..466b6c62d1f9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -358,4 +358,11 @@ struct xe_vma_op {
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

