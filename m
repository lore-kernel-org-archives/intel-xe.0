Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3B5C05021
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2087010E4C3;
	Tue,  7 Nov 2023 05:26:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAF510E4B1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1mx6bDIlS+CZggLSSraQeq0gA4XI55L3VhnZZyp+0Dc=;
 b=l2YseNaMdhCJE1paf2SmIcfF3trEINKFqZoMd+pJVvBJRPKaNVTIFUXu
 BktYgWtVub7LKTrIpLEGLYMifvNTPHGKik9gDdXZ41CrL7kIkVtJwtimo
 ruI8VT6higKe8WPoqJ9Du/Z0NhrcnvAjYj1RR/S0mIgej+3S/g79VDuxP
 z4qKCf0DkcAaWAWyFKlEerwJXN4bUTwRv7Op6A52+2Ack1d0almBU2Rtq
 bU54VVx3A1W+e6XaW5Zt55QGTUj5fL32srXtyXo1t1RDSd25hpd37vmZr
 sljFWymK85ZqgPpyeSvRVi6RhqCICp70QuKtkCCKXGV40FUrBoe8GAp2f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769519"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769519"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689836"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689836"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:43 -0800
Message-Id: <20231107052603.124361-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 07/27] drm/xe: Add struct xe_vma_ops
 abstraction
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

This will help with upcoming change to 1 job for list VMA operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 37 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm_types.h |  5 +++++
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7c1491cdd0c3..afb229cf2149 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2367,7 +2367,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct list_head *ops_list, bool last,
+				   struct xe_vma_ops *vops, bool last,
 				   bool async)
 {
 	struct xe_vma_op *last_op = NULL;
@@ -2378,10 +2378,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-		bool first = list_empty(ops_list);
+		bool first = list_empty(&vops->list);
 
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
@@ -2822,7 +2822,7 @@ static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
 
 static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 				  struct xe_vm *vm,
-				  struct list_head *ops_list)
+				  struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op;
 	int err;
@@ -2834,7 +2834,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 		if (err)
 			goto out;
 
-		list_for_each_entry(op, ops_list, link) {
+		list_for_each_entry(op, &vops->list, link) {
 			err = op_lock(exec, vm, op);
 			drm_exec_retry_on_contention(exec);
 			if (err)
@@ -2847,13 +2847,13 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
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
 		fence = xe_vma_op_execute(vm, op);
 		if (IS_ERR(fence)) {
 			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
@@ -2868,7 +2868,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 }
 
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
-				     struct list_head *ops_list)
+				     struct xe_vma_ops *vops)
 {
 	struct drm_exec exec;
 	struct dma_fence *fence;
@@ -2876,11 +2876,11 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 	lockdep_assert_held_write(&vm->lock);
 
-	err = vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
+	err = vm_bind_ioctl_ops_lock(&exec, vm, vops);
 	if (err)
 		return err;
 
-	fence = ops_execute(vm, ops_list, true);
+	fence = ops_execute(vm, vops, true);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		/* FIXME: Killing VM rather than proper error handling */
@@ -3010,6 +3010,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
@@ -3023,7 +3028,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
-	LIST_HEAD(ops_list);
+	struct xe_vma_ops vops;
 	bool async;
 	int err;
 	int i;
@@ -3166,6 +3171,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
+	xe_vma_ops_init(&vops);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3185,15 +3191,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 
 		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
-					      &ops_list,
-					      i == args->num_binds - 1,
+					      &vops, i == args->num_binds - 1,
 					      async);
 		if (err)
 			goto unwind_ops;
 	}
 
 	/* Nothing to do */
-	if (list_empty(&ops_list)) {
+	if (list_empty(&vops.list)) {
 		err = -ENODATA;
 		goto unwind_ops;
 	}
@@ -3202,7 +3207,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (q)
 		xe_exec_queue_get(q);
 
-	err = vm_bind_ioctl_ops_execute(vm, &ops_list);
+	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 	up_write(&vm->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aaf0c7101019..eb06a59b6d2f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -420,4 +420,9 @@ struct xe_vma_op {
 	};
 };
 
+/** struct xe_vma_ops - VMA operations */
+struct xe_vma_ops {
+	struct list_head list;
+};
+
 #endif
-- 
2.34.1

