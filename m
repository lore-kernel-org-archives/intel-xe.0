Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F59CCA1009
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 12:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9E210E6B4;
	Tue,  2 Sep 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPLTEVNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0604110E6B4
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816869; x=1788352869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1G7mrRqzII8Ln/vLPvWsgXNc9vV4TogeGlu0ZUdzWZI=;
 b=lPLTEVNW2TxtXrNchjwGsh7r3ig4r92YsLIdE3RexuvAbA5vmw9lZfZp
 MpJTRAbg+zljvI79Z0U/4v8HFPmGlwh+g/0G+30R9ogFPVDMgbDDkJZVS
 zYeVonDWEdBufblPhOmE9RWtuygKi81YspNLE0sM6eC0fPshBut+g/hVK
 kOsvalnmSvFKhbqsNRNLhJVR4rBcAcvaacRDTb4C+FJ0hys0Q+3vsECOb
 PMCPDjVGeFjpcVgntA1ihuv2NuVoDI7xo1z5YNXiczQWua9k8k7Er5cEd
 SbjSjVG1FEgI9jWMsVZHkhp0DE9MYMMWobVGx1WvWQBFlj7ljuGejWAYs w==;
X-CSE-ConnectionGUID: UJ1ICU/BTp2BYfKhfXAlKA==
X-CSE-MsgGUID: pCw4uIO1T3yfi7C5d0iZqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59157318"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59157318"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:08 -0700
X-CSE-ConnectionGUID: LK9aTdZ7Ssu2Mv2FeTYZjA==
X-CSE-MsgGUID: r+zGSFTLQHigqQnjRJ5sIQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.33])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:41:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 06/13] drm/xe: Convert the CPU fault handler for exhaustive
 eviction
Date: Tue,  2 Sep 2025 14:40:14 +0200
Message-ID: <20250902124021.70211-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
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

The CPU fault handler may populate bos and migrate, and in doing
so might interfere with other tasks validating.

Rework the CPU fault handler completely into a fastpath
and a slowpath. The fastpath trylocks only the validation lock
in read-mode. If that fails, there's a fallback to the
slowpath, where we do a full validation transaction.

This mandates open-coding of bo locking, bo idling and
bo populating, but we still call into TTM for fault
finalizing.

v2:
- Rework the CPU fault handler to actually take part in
  the exhaustive eviction scheme (Matthew Brost).
v3:
- Don't return anything but VM_FAULT_RETRY if we've dropped the
  mmap_lock. Not even if a signal is pending.
- Rebase on gpu_madvise() and split out fault migration.
- Wait for idle after migration.
- Check whether the resource manager uses tts to determine
  whether to map the tt or iomem.
- Add a number of asserts.
- Allow passing a ttm_operation_ctx to xe_bo_migrate() so that
  it's possible to try non-blocking migration.
- Don't fall through to TTM on migration / population error
  Instead remove the gfp_retry_mayfail in mode 2 where we
  must succeed. (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |   2 +-
 drivers/gpu/drm/xe/xe_bo.c             | 240 ++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h             |   3 +-
 drivers/gpu/drm/xe/xe_dma_buf.c        |   6 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |   2 +-
 drivers/gpu/drm/xe/xe_validation.c     |   3 +-
 drivers/gpu/drm/xe/xe_vm.c             |   1 +
 7 files changed, 205 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 4b0748e6fdd6..d7a8448a43dc 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -314,7 +314,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		goto err;
 
 	if (IS_DGFX(xe))
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0, exec);
+		ret = xe_bo_migrate(bo, XE_PL_VRAM0, NULL, exec);
 	else
 		ret = xe_bo_validate(bo, NULL, true, exec);
 	if (!ret)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d417d6c7f526..c3151f3874da 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1725,68 +1725,213 @@ static bool should_migrate_to_smem(struct xe_bo *bo)
 	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
 }
 
-static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
+/* Populate the bo if swapped out, or migrate if the access mode requires that. */
+static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
+			       struct drm_exec *exec)
+{
+	struct ttm_buffer_object *tbo = &bo->ttm;
+	int err = 0;
+
+	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
+		xe_assert(xe_bo_device(bo),
+			  dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) ||
+			  (tbo->ttm && ttm_tt_is_populated(tbo->ttm)));
+		err = ttm_bo_populate(&bo->ttm, ctx);
+	} else if (should_migrate_to_smem(bo)) {
+		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
+		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
+	}
+
+	return err;
+}
+
+/* Call into TTM to populate PTEs, and register bo for PTE removal on runtime suspend. */
+static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
+{
+	vm_fault_t ret;
+
+	trace_xe_bo_cpu_fault(bo);
+
+	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+				       TTM_BO_VM_NUM_PREFAULT);
+	/*
+	 * When TTM is actually called to insert PTEs, ensure no blocking conditions
+	 * remain, in which case TTM may drop locks and return VM_FAULT_RETRY.
+	 */
+	xe_assert(xe, ret != VM_FAULT_RETRY);
+
+	if (ret == VM_FAULT_NOPAGE &&
+	    mem_type_is_vram(bo->ttm.resource->mem_type)) {
+		mutex_lock(&xe->mem_access.vram_userfault.lock);
+		if (list_empty(&bo->vram_userfault_link))
+			list_add(&bo->vram_userfault_link,
+				 &xe->mem_access.vram_userfault.list);
+		mutex_unlock(&xe->mem_access.vram_userfault.lock);
+	}
+
+	return ret;
+}
+
+static vm_fault_t xe_err_to_fault_t(int err)
+{
+	switch (err) {
+	case 0:
+	case -EINTR:
+	case -ERESTARTSYS:
+	case -EAGAIN:
+		return VM_FAULT_NOPAGE;
+	case -ENOMEM:
+	case -ENOSPC:
+		return VM_FAULT_OOM;
+	default:
+		break;
+	}
+	return VM_FAULT_SIGBUS;
+}
+
+static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_device *xe,
+					   struct xe_bo *bo, bool needs_rpm)
+{
+	struct ttm_buffer_object *tbo = &bo->ttm;
+	vm_fault_t ret = VM_FAULT_RETRY;
+	struct xe_validation_ctx ctx;
+	struct ttm_operation_ctx tctx = {
+		.interruptible = true,
+		.no_wait_gpu = true,
+		.gfp_retry_mayfail = true,
+
+	};
+	int err;
+
+	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
+		return VM_FAULT_RETRY;
+
+	err = xe_validation_ctx_init(&ctx, &xe->val, NULL,
+				     (struct xe_val_flags) {
+					     .interruptible = true,
+					     .no_block = true
+				     });
+	if (err)
+		goto out_pm;
+
+	if (!dma_resv_trylock(tbo->base.resv))
+		goto out_validation;
+
+	err = xe_bo_fault_migrate(bo, &tctx, NULL);
+	if (err) {
+		/* Return VM_FAULT_RETRY on these errors. */
+		if (err != -ENOMEM && err != -ENOSPC && err != -EBUSY)
+			ret = xe_err_to_fault_t(err);
+		goto out_unlock;
+	}
+
+	if (dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL))
+		ret = __xe_bo_cpu_fault(vmf, xe, bo);
+
+out_unlock:
+	dma_resv_unlock(tbo->base.resv);
+out_validation:
+	xe_validation_ctx_fini(&ctx);
+out_pm:
+	if (needs_rpm)
+		xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
 	struct drm_device *ddev = tbo->base.dev;
 	struct xe_device *xe = to_xe_device(ddev);
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
-	struct drm_exec *exec;
+	bool retry_after_wait = false;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	vm_fault_t ret;
-	int idx, r = 0;
+	int err = 0;
+	int idx;
 
-	if (needs_rpm)
-		xe_pm_runtime_get(xe);
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 
-	exec = XE_VALIDATION_UNIMPLEMENTED;
-	ret = ttm_bo_vm_reserve(tbo, vmf);
-	if (ret)
+	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
+	if (ret != VM_FAULT_RETRY)
 		goto out;
 
-	if (drm_dev_enter(ddev, &idx)) {
-		trace_xe_bo_cpu_fault(bo);
+	if (fault_flag_allow_retry_first(vmf->flags)) {
+		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
+			goto out;
+		retry_after_wait = true;
+		xe_bo_get(bo);
+		mmap_read_unlock(vmf->vma->vm_mm);
+	} else {
+		ret = VM_FAULT_NOPAGE;
+	}
 
-		xe_validation_assert_exec(xe, exec, &tbo->base);
-		if (should_migrate_to_smem(bo)) {
-			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
+	/*
+	 * The fastpath failed and we were not required to return and retry immediately.
+	 * We're now running in one of two modes:
+	 *
+	 * 1) retry_after_wait == true: The mmap_read_lock() is dropped, and we're trying
+	 * to resolve blocking waits. But we can't resolve the fault since the
+	 * mmap_read_lock() is dropped. After retrying the fault, the aim is that the fastpath
+	 * should succeed. But it may fail since we drop the bo lock.
+	 *
+	 * 2) retry_after_wait == false: The fastpath failed, typically even after
+	 * a retry. Do whatever's necessary to resolve the fault.
+	 *
+	 * This construct is recommended to avoid excessive waits under the mmap_lock.
+	 */
 
-			r = xe_bo_migrate(bo, XE_PL_TT, exec);
-			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
-				ret = VM_FAULT_NOPAGE;
-			else if (r)
-				ret = VM_FAULT_SIGBUS;
-		}
-		if (!ret)
-			ret = ttm_bo_vm_fault_reserved(vmf,
-						       vmf->vma->vm_page_prot,
-						       TTM_BO_VM_NUM_PREFAULT);
-		drm_dev_exit(idx);
+	if (needs_rpm)
+		xe_pm_runtime_get(xe);
 
-		if (ret == VM_FAULT_RETRY &&
-		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-			goto out;
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
+			    err) {
+		struct ttm_operation_ctx tctx = {
+			.interruptible = true,
+			.no_wait_gpu = false,
+			.gfp_retry_mayfail = retry_after_wait,
+		};
+		long lerr;
 
-		/*
-		 * ttm_bo_vm_reserve() already has dma_resv_lock.
-		 */
-		if (ret == VM_FAULT_NOPAGE &&
-		    mem_type_is_vram(tbo->resource->mem_type)) {
-			mutex_lock(&xe->mem_access.vram_userfault.lock);
-			if (list_empty(&bo->vram_userfault_link))
-				list_add(&bo->vram_userfault_link,
-					 &xe->mem_access.vram_userfault.list);
-			mutex_unlock(&xe->mem_access.vram_userfault.lock);
+		err = drm_exec_lock_obj(&exec, &tbo->base);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			break;
+
+		err = xe_bo_fault_migrate(bo, &tctx, &exec);
+		if (err) {
+			drm_exec_retry_on_contention(&exec);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
 		}
-	} else {
-		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+
+		lerr = dma_resv_wait_timeout(tbo->base.resv,
+					     DMA_RESV_USAGE_KERNEL, true,
+					     MAX_SCHEDULE_TIMEOUT);
+		if (lerr < 0) {
+			err = lerr;
+			break;
+		}
+
+		if (!retry_after_wait)
+			ret = __xe_bo_cpu_fault(vmf, xe, bo);
 	}
+	/* if retry_after_wait == true, we *must* return VM_FAULT_RETRY. */
+	if (err && !retry_after_wait)
+		ret = xe_err_to_fault_t(err);
 
-	dma_resv_unlock(tbo->base.resv);
-out:
 	if (needs_rpm)
 		xe_pm_runtime_put(xe);
 
+	if (retry_after_wait)
+		xe_bo_put(bo);
+out:
+	drm_dev_exit(idx);
+
 	return ret;
 }
 
@@ -1830,7 +1975,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
 }
 
 static const struct vm_operations_struct xe_gem_vm_ops = {
-	.fault = xe_gem_fault,
+	.fault = xe_bo_cpu_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
 	.access = xe_bo_vm_access,
@@ -3060,6 +3205,8 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
  * xe_bo_migrate - Migrate an object to the desired region id
  * @bo: The buffer object to migrate.
  * @mem_type: The TTM region type to migrate to.
+ * @tctx: A pointer to a struct ttm_operation_ctx or NULL if
+ * a default interruptibe ctx is to be used.
  * @exec: The drm_exec transaction to use for exhaustive eviction.
  *
  * Attempt to migrate the buffer object to the desired memory region. The
@@ -3072,7 +3219,8 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
  * Return: 0 on success. Negative error code on failure. In particular may
  * return -EINTR or -ERESTARTSYS if signal pending.
  */
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *tctx,
+		  struct drm_exec *exec)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct ttm_operation_ctx ctx = {
@@ -3084,6 +3232,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
 	struct ttm_place requested;
 
 	xe_bo_assert_held(bo);
+	tctx = tctx ? tctx : &ctx;
 
 	if (bo->ttm.resource->mem_type == mem_type)
 		return 0;
@@ -3110,8 +3259,9 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
 		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
 	}
 
-	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
-	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
+	if (!tctx->no_wait_gpu)
+		xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
+	return ttm_bo_validate(&bo->ttm, &placement, tctx);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c6bb90ca5c2e..8a057d39f0a8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -284,7 +284,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec);
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *ctc,
+		  struct drm_exec *exec);
 int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
 
 int xe_bo_evict_pinned(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 78a827d4e726..2fdfeaf59fb1 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -64,7 +64,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return -EINVAL;
 	}
 
-	ret = xe_bo_migrate(bo, XE_PL_TT, exec);
+	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			drm_dbg(&xe->drm,
@@ -102,7 +102,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 
 	if (!xe_bo_is_pinned(bo)) {
 		if (!attach->peer2peer)
-			r = xe_bo_migrate(bo, XE_PL_TT, exec);
+			r = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
 		else
 			r = xe_bo_validate(bo, NULL, false, exec);
 		if (r)
@@ -170,7 +170,7 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 
 	/* Can we do interruptible lock here? */
 	xe_bo_lock(bo, false);
-	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
+	(void)xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
 	xe_bo_unlock(bo);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ec6f6d520a9c..a054d6010ae0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -87,7 +87,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (!bo)
 		return 0;
 
-	return need_vram_move ? xe_bo_migrate(bo, vram->placement, exec) :
+	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
 		xe_bo_validate(bo, vm, true, exec);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
index b90fda3dd5f4..826cd09966ef 100644
--- a/drivers/gpu/drm/xe/xe_validation.c
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -241,7 +241,8 @@ int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
  */
 void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
 {
-	drm_exec_fini(ctx->exec);
+	if (ctx->exec)
+		drm_exec_fini(ctx->exec);
 	xe_validation_unlock(ctx);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 38d50ec3d939..d3060c5b2e8f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3166,6 +3166,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
 					    region_to_mem_type[region],
+					    NULL,
 					    exec);
 		break;
 	}
-- 
2.50.1

