Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDCDC25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076D510E752;
	Thu, 26 Oct 2023 04:01:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781210E74E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292909; x=1729828909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f/a2dI4UOZSsbIe04Ye0kl56xDUC9VVn9qA3JOutYAE=;
 b=BfoskoNZPFx8jHS8FvYdyc0wKlKFtV/XvDTPUHgunFBzA1ew8MLsReM1
 2PUx/zS8aExH28HB87UDAs+c1YJQD80zxaPq0QKzkystAoXJFJa1hTrb5
 ha1Zhk02edhRzBAs20gU6al9UFLH3BjXzL4ytufmdKqLSFKdj9LQ4xvEw
 XQKavj2LLMvRclrZ9YS9fPgxbj0/x7glqmNPWv/nItm8qSHK/7uMLnK2+
 TdAphP92IxSrZQ5Ak4NyHtEhkodbptZOBFrqE6I0SkZ6RZJfN8jvg1EO2
 PgEmLQA7o1kg/p4vYI/0S8SnpPV9GwwD/MSvhJmJpfGYS4gTVior/mShc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377821986"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377821986"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682341"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682341"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:01:53 -0700
Message-Id: <20231026040213.1272993-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/26] drm/xe: Add struct xe_vma_ops abstraction
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
index 816442a68be2..8edc14d5babd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2356,7 +2356,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct list_head *ops_list, bool last,
+				   struct xe_vma_ops *vops, bool last,
 				   bool async)
 {
 	struct xe_vma_op *last_op = NULL;
@@ -2367,10 +2367,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-		bool first = list_empty(ops_list);
+		bool first = list_empty(&vops->list);
 
 		INIT_LIST_HEAD(&op->link);
-		list_add_tail(&op->link, ops_list);
+		list_add_tail(&op->link, &vops->list);
 
 		if (first) {
 			op->flags |= XE_VMA_OP_FIRST;
@@ -2485,7 +2485,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	}
 
 	/* FIXME: Unhandled corner case */
-	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
+	XE_WARN_ON(!last_op && last && !list_empty(&vops->list));
 
 	if (!last_op)
 		return 0;
@@ -2811,7 +2811,7 @@ static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
 
 static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 				  struct xe_vm *vm,
-				  struct list_head *ops_list)
+				  struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op;
 	int err;
@@ -2823,7 +2823,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 		if (err)
 			goto out;
 
-		list_for_each_entry(op, ops_list, link) {
+		list_for_each_entry(op, &vops->list, link) {
 			err = op_lock(exec, vm, op);
 			drm_exec_retry_on_contention(exec);
 			if (err)
@@ -2836,13 +2836,13 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
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
@@ -2857,7 +2857,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 }
 
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
-				     struct list_head *ops_list)
+				     struct xe_vma_ops *vops)
 {
 	struct drm_exec exec;
 	struct dma_fence *fence;
@@ -2865,11 +2865,11 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
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
@@ -2999,6 +2999,11 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
@@ -3012,7 +3017,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
-	LIST_HEAD(ops_list);
+	struct xe_vma_ops vops;
 	bool async;
 	int err;
 	int i;
@@ -3155,6 +3160,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
+	xe_vma_ops_init(&vops);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3174,15 +3180,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3191,7 +3196,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

