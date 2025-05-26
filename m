Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB9C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 16:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CA110E328;
	Mon, 26 May 2025 16:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bzn5BL/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8910E328
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748276207; x=1779812207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZFpGO/5TyHfWf0OvL1afx6L3f106z4/8aIGkvBkb5Xo=;
 b=Bzn5BL/dFW671cKaZOrvgLIhK+pe6wIx/IMpKDvLBqjFfVA7mfKV6BIi
 wQTcVzAu4iNVeJ5ZGo8UArsvLY5dNNUjgS62fG2fNIaVI5ULdBY6YVVQP
 vCo7TkJAYZu/NiV3LnafbGG6a9aPVVd6gnihDDDBdKmzgKhV/2Zwo32cD
 bTddiTVAxhSIP/J+VHhK/rOMjiU3DBPncZWrEIotmAn+3CvvgtNsU14s7
 fJPn3ZcrJmWwqpYiu+e7f+3vVCwnpGyZtR8Sq8wDuM4BkPzR2voonyi5o
 Hf1Hgkj4jx5tw/WN/fQMER7O3gDgioY3nStnDcSQPrxm37+3u7XdQLn2T w==;
X-CSE-ConnectionGUID: WQjt41LkR/eJpkYYRX5xaA==
X-CSE-MsgGUID: 5xgHdgqZQCSWOpEADw07ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49959957"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="49959957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 09:16:47 -0700
X-CSE-ConnectionGUID: yl8KxA58T2aT4fnAT8fGMQ==
X-CSE-MsgGUID: eNZ4V3weTyyMK5BaCUjbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="142391824"
Received: from tjmaciei-mobl5.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.175])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 09:16:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2] drm/xe: Rework eviction rejection of bound external bos
Date: Mon, 26 May 2025 18:16:32 +0200
Message-ID: <20250526161632.20694-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 0af944f0e308 ("drm/xe: Reject BO eviction if BO is bound to current VM")
Cc: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 46 +++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h       | 65 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
 3 files changed, 101 insertions(+), 18 deletions(-)

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
index 99e164852f63..fe05c4f7f425 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -303,6 +303,71 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
 
+/**
+ * xe_vm_set_validating() - Register this task as currently making bos resident
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

