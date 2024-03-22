Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8609CD11BF
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A02C10EFAB;
	Fri, 22 Mar 2024 09:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apnXLOwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D2210EE46
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711098152; x=1742634152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BpIUoasozQIfRfIiXQvB3uU1gyYWbDOAYYQeCjSC5jI=;
 b=apnXLOwkIBsv0EQxY6aTMcJoJNgWJls7svwq6muGfqOALtphG/zIyJsL
 i8SnNw+l4OzyLbiOp7wjHoQ2GTAkzLGfWH/hf25sKZGVz3XunRlxPPROC
 ekoP7DVkUpC1ir3M4cKsbeosxEbH9uuxsydvCs2t49uXOlGnAFZiWZIe7
 6K9U9oLvvryH9S7m7VJQHOrATSQBvRDxD6LPBb/2ymc1exfMq5pT0uLqs
 le9/Y6QJ/lh3zhpLGhZmjneRKuXfPlS1FdXeuAUKyaFdUgvB9scbbTXCS
 R5BW0KIfPx/KUuiK6nbO2+BLKTilcTNFXcg5LK+NqCrBuZe9nPEHEqCUK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9087207"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9087207"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="15238793"
Received: from ettammin-desk.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.178])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:02:31 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 5/7] drm/xe: Move vma rebinding to the drm_exec locking loop
Date: Fri, 22 Mar 2024 10:02:11 +0100
Message-ID: <20240322090213.6091-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
References: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
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

Rebinding might allocate page-table bos, causing evictions.
To support blocking locking during these evictions,
perform the rebinding in the drm_exec locking loop.

v2:
- Remove a leftover call to xe_vm_rebind() (Matt Brost)
- Add a helper function xe_vm_validate_rebind() (Matt Brost)

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 24 ++--------------
 drivers/gpu/drm/xe/xe_vm.c   | 55 +++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h   |  3 ++
 3 files changed, 47 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 397a49b731f1..f442ef495235 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -96,21 +96,9 @@
 
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
-	struct drm_gem_object *obj;
-	unsigned long index;
-	int ret;
-
-	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
-	if (ret)
-		return ret;
-
-	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
-		ret = dma_resv_reserve_fences(obj->resv, 1);
-		if (ret)
-			return ret;
-	}
+	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
 
-	return 0;
+	return xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -264,14 +252,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
-	/*
-	 * Rebind any invalidated userptr or evicted BOs in the VM, non-compute
-	 * VM mode only.
-	 */
-	err = xe_vm_rebind(vm, false);
-	if (err)
-		goto err_put_job;
-
 	/* Wait behind rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6aefd6602310..b1d0df178a2d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -482,11 +482,50 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 	return 0;
 }
 
-static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
-				 bool *done)
+/**
+ * xe_vm_validate_rebind() - Validate buffer objects and rebind vmas
+ * @vm: The vm for which we are rebinding.
+ * @exec: The struct drm_exec with the locked GEM objects.
+ * @num_fences: The number of fences to reserve for the operation, not
+ * including rebinds and validations.
+ *
+ * Validates all evicted gem objects and rebinds their vmas. Note that
+ * rebindings may cause evictions and hence the validation-rebind
+ * sequence is rerun until there are no more objects to validate.
+ *
+ * Return: 0 on success, negative error code on error. In particular,
+ * may return -EINTR or -ERESTARTSYS if interrupted, and -EDEADLK if
+ * the drm_exec transaction needs to be restarted.
+ */
+int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
+			  unsigned int num_fences)
 {
 	struct drm_gem_object *obj;
 	unsigned long index;
+	int ret;
+
+	do {
+		ret = drm_gpuvm_validate(&vm->gpuvm, exec);
+		if (ret)
+			return ret;
+
+		ret = xe_vm_rebind(vm, false);
+		if (ret)
+			return ret;
+	} while (!list_empty(&vm->gpuvm.evict.list));
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		ret = dma_resv_reserve_fences(obj->resv, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
+				 bool *done)
+{
 	int err;
 
 	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, 0);
@@ -512,17 +551,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	err = drm_gpuvm_validate(&vm->gpuvm, exec);
-	if (err)
-		return err;
-
-	drm_exec_for_each_locked_object(exec, index, obj) {
-		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues);
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 20009d8b4702..306cd0934a19 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -244,6 +244,9 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
+int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
+			  unsigned int num_fences);
+
 /**
  * xe_vm_resv() - Return's the vm's reservation object
  * @vm: The vm
-- 
2.44.0

