Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01249C55162
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 02:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D4B10F0E2;
	Fri, 31 Jul 2026 02:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9jU+fPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778C110E111
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 02:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785464685; x=1817000685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3gCoC3E89Q7J+lFOuk0K8XWRTiWNCj9XqMvlVQvtRhc=;
 b=n9jU+fPu98pLOqNOzo1JsHyTCEn5kWTL9OFTZGKrvlpku3hxWhgXfGzk
 gU3nwQhRpknhXf5Eo3M2se5sxUEBbttXBf18gP5rj6kZX9IHvCVT5961B
 LOeBJsmjYKdB563htVpMaZM3ieAb15MYUUzR32by6ccYwSJT7jWXrN7z0
 CI9jPpcd0BhJuHccA/Qqb2fzUU7M6CZV0Nwzq+Ebt8/+rEsRFvkxx7VN8
 EW5RoDJF4e6n8KIJwbXJ4wbJoG8ZOWMxjSdrs/gQ4Azp3UTZsdGdReDob
 n9JeakrgRHiLKsoi38UQDsD9QgPPrjS3OActczba3coijPXn2nbEar46z A==;
X-CSE-ConnectionGUID: IsyKGAdwQm2DAS+ifAptlQ==
X-CSE-MsgGUID: vC4MaigcTSu82EvOX3ypsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88623493"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="88623493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
X-CSE-ConnectionGUID: UqfWQgfhS3uUoF95b4MEFg==
X-CSE-MsgGUID: gGa4yuI2Q4632Gsayghi7g==
X-ExtLoop1: 1
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 19:24:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v6 4/8] drm/xe: Fix up BO TTM priority for late VM binds
Date: Thu, 30 Jul 2026 19:24:35 -0700
Message-Id: <20260731022439.2446486-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731022439.2446486-1-matthew.brost@intel.com>
References: <20260731022439.2446486-1-matthew.brost@intel.com>
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

A BO's TTM priority is only ever set once, at creation time, based on
the priority band of exec queues attached to its VM at that moment
(xe_vm_bo_priority()), or XE_BO_PRIORITY_HIGHEST for an extobj not
tied to any single VM. This misses the common flow of VM create -> BO
create -> exec queue create -> VM bind: the BO is created before any
exec queue exists on the VM (so it gets XE_BO_PRIORITY_HIGH, the "no
exec queues yet" default), the exec queue is added afterwards
(xe_vm_add_exec_queue() only re-prioritizes BOs already bound to the
VM at that time), and only then is the BO bound into the VM via
VM_BIND, leaving it stuck at a stale priority that no longer reflects
the VM's exec queues.

It also misses a second flow specific to extobjs: create BO with no
vm_id (bo->vm == NULL) -> bind -> unbind -> rebind. The unbind can
lower the BO's priority to XE_BO_PRIORITY_LOW once it has no VMA
mappings left anywhere (see xe_vma_destroy()), but on rebind nothing
brought it back up, leaving a still-useful, freshly rebound extobj
stuck at the lowest priority, an easy target for eviction/shrinking.

Add xe_vma_update_bo_priority(), called from op_update_bo_priority()
for each DRM_GPUVA_OP_MAP operation in vm_bind_ioctl_ops_fini(). For a
BO private to the VM being bound (bo->vm == vm), recompute the current
priority band via xe_vm_bo_priority() and, if it differs, update
bo->ttm.priority and move the BO to the tail of its new priority's LRU
list. For an extobj (bo->vm == NULL, potentially shared with other
VMs), instead restore it directly to XE_BO_PRIORITY_HIGHEST, since it
is now in active use again and extobjs aren't tied to any single VM's
exec queue priority band.

This must only run while the BO's dma-resv is locked and the BO has
been (re)validated: some MAP ops never lock or validate the BO at bind
time at all, e.g. invalidate_on_bind ops, or ops on a fault-mode VM
whose bind is deferred to the page fault handler
(vma_lock_and_validate()'s "validate" flag is false). Track whether a
given MAP op actually locked and validated its BO in the new
op->map.is_validated flag, set in op_lock_and_prep(), and skip the
priority update entirely in op_update_bo_priority() when it is not
set. To still cover the deferred-validation, fault-mode case, also call
xe_vma_update_bo_priority() from xe_pagefault_handle_vma(), right after
a successful xe_vma_rebind(), where the BO has just been locked and
validated (or intentionally left unvalidated for DONTNEED/purged BOs)
via xe_pagefault_begin().

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c |  2 +
 drivers/gpu/drm/xe/xe_vm.c        | 71 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h        |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h  |  6 +++
 4 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..c7f183bd24f4 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -133,6 +133,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 			xe_validation_retry_on_oom(&ctx, &err);
 			goto unlock_dma_resv;
 		}
+
+		xe_vma_update_bo_priority(vma);
 	}
 
 	dma_fence_wait(fence, false);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 27da09c9ee2a..a0b407bc149c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3236,16 +3236,21 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.invalidate_on_bind)
+		if (!op->map.invalidate_on_bind) {
+			bool validate = !xe_vm_in_fault_mode(vm) ||
+				op->map.immediate;
+
 			err = vma_lock_and_validate(exec, op->map.vma,
 						    (struct xe_vma_lock_and_validate_flags) {
 							.res_evict = res_evict,
-							.validate = !xe_vm_in_fault_mode(vm) ||
-								    op->map.immediate,
+							.validate = validate,
 							.request_decompress =
 							op->map.request_decompress,
 							.check_purged = false,
 						    });
+			if (!err && validate)
+				op->map.is_validated = true;
+		}
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
@@ -3583,6 +3588,64 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 	}
 }
 
+/**
+ * xe_vma_update_bo_priority() - Bring @vma's BO's TTM priority up to date
+ * @vma: The vma whose BO's TTM priority is to be refreshed
+ *
+ * A BO's TTM priority is set when it is created, based on the priority band
+ * of @vma's VM's exec queues at that time (for a private BO), or to the
+ * highest level (for an extobj, bo->vm == NULL). If the BO is (re)mapped
+ * afterwards, its priority may be stale: a private BO's VM may have gained
+ * or lost exec queues since, and an extobj may have been lowered to
+ * XE_BO_PRIORITY_LOW by xe_vma_destroy() after losing all of its VMA
+ * mappings. Bring it in line with the current priority band here.
+ *
+ * The caller must hold the BO's dma-resv lock (the VM's dma-resv lock for
+ * a private BO), typically already required to (re)validate the BO before
+ * calling this function.
+ */
+void xe_vma_update_bo_priority(struct xe_vma *vma)
+{
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo;
+	int priority;
+
+	bo = xe_vma_bo(vma);
+	if (!bo)
+		return;
+
+	/* Private BOs are only ever bound to the VM they were created for. */
+	xe_assert(vm->xe, !bo->vm || bo->vm == vm);
+
+	priority = bo->vm ? xe_vm_bo_priority(vm) : XE_BO_PRIORITY_HIGHEST;
+	if (bo->ttm.priority == priority)
+		return;
+
+	xe_bo_assert_held(bo);
+	xe_vm_assert_held(vm);
+	xe_bo_update_ttm_priority(bo, priority);
+}
+
+/*
+ * Refresh the BO's TTM priority for a MAP op, mirroring
+ * xe_vma_update_bo_priority(). This is only safe to do when the BO was
+ * actually locked and validated as part of this bind, i.e.
+ * op->map.is_validated is set: some MAP ops (e.g. invalidate_on_bind, or
+ * binds on a fault-mode VM that defer validation to the page fault handler)
+ * never validate the BO here, in which case the priority is instead brought
+ * up to date from xe_pagefault_handle_vma() once the BO is faulted in.
+ */
+static void op_update_bo_priority(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	if (op->base.op != DRM_GPUVA_OP_MAP)
+		return;
+
+	if (!op->map.is_validated)
+		return;
+
+	xe_vma_update_bo_priority(op->map.vma);
+}
+
 static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
@@ -3595,6 +3658,8 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 		if (ufence)
 			op_add_ufence(vm, op, ufence);
 
+		op_update_bo_priority(vm, op);
+
 		if (op->base.op == DRM_GPUVA_OP_UNMAP)
 			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), fence);
 		else if (op->base.op == DRM_GPUVA_OP_REMAP)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 64d3665bb05a..d69481ef360f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -256,6 +256,8 @@ int xe_vm_invalidate_vma_submit(struct xe_vma *vma, struct xe_tlb_inval_batch *b
 
 int xe_vm_validate_protected(struct xe_vm *vm);
 
+void xe_vma_update_bo_priority(struct xe_vma *vma);
+
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d75546c4eb66..b07e1da3a3d6 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -427,6 +427,12 @@ struct xe_vma_op_map {
 	bool invalidate_on_bind;
 	/** @request_decompress: schedule decompression for GPU map */
 	bool request_decompress;
+	/**
+	 * @is_validated: The op's BO (if any) was locked and validated as
+	 * part of this bind, so it is safe to refresh its TTM priority in
+	 * op_update_bo_priority().
+	 */
+	bool is_validated;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
 };
-- 
2.34.1

