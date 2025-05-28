Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB15C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 16:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B9810E65C;
	Wed, 28 May 2025 16:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScnuVnFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B610E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748450517; x=1779986517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ejoaZpjWLYBg0g+xbDFPf8ILM4+SGd1h1yj4Va+S0mA=;
 b=ScnuVnFL26GOWNpjg95vzGQLEqWpAWwaF9eAfo6x6DiiKa619M1SBoai
 DBShKDDcZKcmQNwU3Zxv7CCOSwb39kBl9IxJ1BoAqvZ6akaskIfLJyPG/
 t3EGvQC54okR98Q867WMApILw3w+V3mY9VQUjGcvFxyR4fbhSBE2bbdj9
 ToP2rFN/Z+dd2IAorsZrNcHPQ5LWLWbnYZ2qZxq7Dp84mQ/SZm1xD4vhz
 KWoOL2daINQlItg0qY1he1JLRyEgkB8fso+/kDBQfbOv7Imfq1Z0bCkaA
 EBAPJ1NKHVma5bkY1CXJT7M3wjkbztskiR42h/M78axDcxgi2YehEcRjH w==;
X-CSE-ConnectionGUID: Vyoyqv7wSduGTK3debhm2A==
X-CSE-MsgGUID: hR67diGlS5aULy6W9WFvsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73019014"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="73019014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:41:56 -0700
X-CSE-ConnectionGUID: 0g+o773gQZuyzgqfueXcbg==
X-CSE-MsgGUID: 5C4srAW/TeynjkDCe5TAcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="144272000"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.106])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:41:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3] drm/xe: Rework eviction rejection of bound external bos
Date: Wed, 28 May 2025 18:41:05 +0200
Message-ID: <20250528164105.234718-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

For preempt_fence mode VM's we're rejecting eviction of
shared bos during VM_BIND. However, since we do this in the
move() callback, we're getting an eviction failure warning from
TTM. The TTM callback intended for these things is
eviction_valuable().

However, the latter doesn't pass in the struct ttm_operation_ctx
needed to determine whether the caller needs this.

Instead, attach the needed information to the vm under the
vm->resv, until we've been able to update TTM to provide the
needed information. And add sufficient lockdep checks to prevent
misuse and races.

v2:
- Fix a copy-paste error in xe_vm_clear_validating()
v3:
- Fix kerneldoc errors.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 0af944f0e308 ("drm/xe: Reject BO eviction if BO is bound to current VM")
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 46 ++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h       | 69 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
 3 files changed, 105 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..3c48a8c5f439 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -841,21 +841,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
-	/* Reject BO eviction if BO is bound to current VM. */
-	if (evict && ctx->resv) {
-		struct drm_gpuvm_bo *vm_bo;
-
-		drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base) {
-			struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
-
-			if (xe_vm_resv(vm) == ctx->resv &&
-			    xe_vm_in_preempt_fence_mode(vm)) {
-				ret = -EBUSY;
-				goto out;
-			}
-		}
-	}
-
 	/*
 	 * Failed multi-hop where the old_mem is still marked as
 	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
@@ -1013,6 +998,25 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
 	return lret;
 }
 
+static bool
+xe_bo_eviction_valuable(struct ttm_buffer_object *bo, const struct ttm_place *place)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	if (!ttm_bo_eviction_valuable(bo, place))
+		return false;
+
+	if (!xe_bo_is_xe_bo(bo))
+		return true;
+
+	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
+		if (xe_vm_is_validating(gpuvm_to_vm(vm_bo->vm)))
+			return false;
+	}
+
+	return true;
+}
+
 /**
  * xe_bo_shrink() - Try to shrink an xe bo.
  * @ctx: The struct ttm_operation_ctx used for shrinking.
@@ -1047,7 +1051,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 	    (flags.purge && !xe_tt->purgeable))
 		return -EBUSY;
 
-	if (!ttm_bo_eviction_valuable(bo, &place))
+	if (!xe_bo_eviction_valuable(bo, &place))
 		return -EBUSY;
 
 	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
@@ -1588,7 +1592,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
 	.access_memory = xe_ttm_access_memory,
 	.release_notify = xe_ttm_bo_release_notify,
-	.eviction_valuable = ttm_bo_eviction_valuable,
+	.eviction_valuable = xe_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
 	.swap_notify = xe_ttm_bo_swap_notify,
 };
@@ -2431,6 +2435,8 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		.no_wait_gpu = false,
 		.gfp_retry_mayfail = true,
 	};
+	struct pin_cookie cookie;
+	int ret;
 
 	if (vm) {
 		lockdep_assert_held(&vm->lock);
@@ -2440,8 +2446,12 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		ctx.resv = xe_vm_resv(vm);
 	}
 
+	cookie = xe_vm_set_validating(vm, allow_res_evict);
 	trace_xe_bo_validate(bo);
-	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
+	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
+	xe_vm_clear_validating(vm, allow_res_evict, cookie);
+
+	return ret;
 }
 
 bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 99e164852f63..88d6c0ef89c7 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -303,6 +303,75 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
 
+/**
+ * xe_vm_set_validating() - Register this task as currently making bos resident
+ * @allow_res_evict: Allow eviction of buffer objects bound to @vm when
+ * validating.
+ * @vm: Pointer to the vm or NULL.
+ *
+ * Register this task as currently making bos resident for the vm. Intended
+ * to avoid eviction by the same task of shared bos bound to the vm.
+ * Call with the vm's resv lock held.
+ *
+ * Return: A pin cookie that should be used for xe_vm_clear_validating().
+ */
+static inline struct pin_cookie xe_vm_set_validating(struct xe_vm *vm,
+						     bool allow_res_evict)
+{
+	struct pin_cookie cookie = {};
+
+	if (vm && !allow_res_evict) {
+		xe_vm_assert_held(vm);
+		cookie = lockdep_pin_lock(&xe_vm_resv(vm)->lock.base);
+		/* Pairs with READ_ONCE in xe_vm_is_validating() */
+		WRITE_ONCE(vm->validating, current);
+	}
+
+	return cookie;
+}
+
+/**
+ * xe_vm_clear_validating() - Unregister this task as currently making bos resident
+ * @vm: Pointer to the vm or NULL
+ * @allow_res_evict: Eviction from @vm was allowed. Must be set to the same
+ * value as for xe_vm_set_validation().
+ * @cookie: Cookie obtained from xe_vm_set_validating().
+ *
+ * Register this task as currently making bos resident for the vm. Intended
+ * to avoid eviction by the same task of shared bos bound to the vm.
+ * Call with the vm's resv lock held.
+ */
+static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict,
+					  struct pin_cookie cookie)
+{
+	if (vm && !allow_res_evict) {
+		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base, cookie);
+		/* Pairs with READ_ONCE in xe_vm_is_validating() */
+		WRITE_ONCE(vm->validating, NULL);
+	}
+}
+
+/**
+ * xe_vm_is_validating() - Whether bos bound to the vm are currently being made resident
+ * by the current task.
+ * @vm: Pointer to the vm.
+ *
+ * If this function returns %true, we should be in a vm resv locked region, since
+ * the current process is the same task that called xe_vm_set_validating().
+ * The function asserts that that's indeed the case.
+ *
+ * Return: %true if the task is currently making bos resident, %false otherwise.
+ */
+static inline bool xe_vm_is_validating(struct xe_vm *vm)
+{
+	/* Pairs with WRITE_ONCE in xe_vm_is_validating() */
+	if (READ_ONCE(vm->validating) == current) {
+		xe_vm_assert_held(vm);
+		return true;
+	}
+	return false;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
 #else
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bfc145baad49..0e1318a15c9e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -310,6 +310,14 @@ struct xe_vm {
 	 * protected by the vm resv.
 	 */
 	u64 tlb_flush_seqno;
+	/**
+	 * @validating: The task that is currently making bos resident for this vm.
+	 * Protected by the VM's resv for writing. Opportunistic reading can be done
+	 * using READ_ONCE. Note: This is a workaround for the
+	 * TTM eviction_valuable() callback not being passed a struct
+	 * ttm_operation_context(). Future work might want to address this.
+	 */
+	struct task_struct *validating;
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
-- 
2.49.0

