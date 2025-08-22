Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F81CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836B110EAAF;
	Fri, 22 Aug 2025 09:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bof+upSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420E310EAB0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855671; x=1787391671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cjMmDiX0FRmj0xgLc96ppz/ZXcpf9xTyZHkJpsc1ZBo=;
 b=Bof+upSWDsl0MvNYruNjqrLL1XzNskhHK3OgQkvBwpq9mD9LqkJ1oCaa
 bLd93tN+DPcf+Q4PD4xPuwk4WrNi/yBMGlAEpB8MNwj2HSmzyyVuMd6R+
 ntnVby+khlFoiebXi1IhsSYnztMTZ8a5SpvChg88WZZVvMgNuUUfHUDCc
 8jFcldc8GHwJsUvqnQ2QO4Fq8CMRjTnGn7rE0tjpIeNGiXhE5iySz0Cwh
 Yst3rP5WnjTtt/tstkM1zYa8wP8RaEZGAap/IJj9FnkiLCyeEPrfvb3Hi
 yvCOqtoR79k3wRkZVxMykzijEPgyXO67RZat9duv7YLrK3m8sX3P+EZgf w==;
X-CSE-ConnectionGUID: 7FqGCtJnTT2pUCMRw6lobg==
X-CSE-MsgGUID: MxKZk5EKRNq60WYGnyQH0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80760616"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80760616"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:11 -0700
X-CSE-ConnectionGUID: oHxRYN91SBCRvEBBln5+WA==
X-CSE-MsgGUID: DwsKkDkWT4iBYD2AIbvpqw==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:41:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 09/16] drm/xe: Convert the CPU fault handler for exhaustive
 eviction
Date: Fri, 22 Aug 2025 11:40:23 +0200
Message-ID: <20250822094030.3499-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 191 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_validation.c |   3 +-
 2 files changed, 163 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 76e9c93826a2..686ca5d6038a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1713,57 +1713,188 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
-static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
+static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
+{
+	vm_fault_t ret;
+
+	trace_xe_bo_cpu_fault(bo);
+
+	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+				       TTM_BO_VM_NUM_PREFAULT);
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
+	if (!dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL))
+		goto out_unlock;
+
+	if (!tbo->resource->bus.is_iomem) {
+		struct ttm_operation_ctx ctx = {
+			.interruptible = true,
+			.no_wait_gpu = true,
+			.gfp_retry_mayfail = true,
+		};
+
+		err = ttm_bo_populate(tbo, &ctx);
+		if (err) {
+			if (err != -ENOMEM && err != -ENOSPC)
+				ret = xe_err_to_fault_t(err);
+			goto out_unlock;
+		}
+	}
+
+	ret = __xe_bo_cpu_fault(vmf, xe, bo);
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
+	int err = 0;
 	int idx;
 
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+
+	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
+	if (ret != VM_FAULT_RETRY)
+		goto out;
+
+	if (fault_flag_allow_retry_first(vmf->flags)) {
+		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
+			goto out;
+		retry_after_wait = true;
+		xe_bo_get(bo);
+		mmap_read_unlock(vmf->vma->vm_mm);
+	} else {
+		ret = VM_FAULT_NOPAGE;
+	}
+
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
+
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
 
-	exec = XE_VALIDATION_UNIMPLEMENTED;
-	ret = ttm_bo_vm_reserve(tbo, vmf);
-	if (ret)
-		goto out;
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
+			    err) {
+		long lerr;
 
-	if (drm_dev_enter(ddev, &idx)) {
-		trace_xe_bo_cpu_fault(bo);
+		err = drm_exec_lock_obj(&exec, &tbo->base);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			break;
 
-		xe_validation_assert_exec(xe, exec, &tbo->base);
-		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
-		drm_dev_exit(idx);
+		lerr = dma_resv_wait_timeout(tbo->base.resv,
+					     DMA_RESV_USAGE_KERNEL, true,
+					     MAX_SCHEDULE_TIMEOUT);
+		if (lerr < 0) {
+			err = lerr;
+			break;
+		}
 
-		if (ret == VM_FAULT_RETRY &&
-		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-			goto out;
+		if (!tbo->resource->bus.is_iomem) {
+			struct ttm_operation_ctx tctx = {
+				.interruptible = true,
+				.no_wait_gpu = false,
+				.gfp_retry_mayfail = true,
+			};
 
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
+			err = ttm_bo_populate(tbo, &tctx);
+			xe_validation_retry_on_oom(&ctx, &err);
+			if (err && (err == -EINTR || err == -ERESTARTSYS))
+				break;
 		}
-	} else {
-		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+		if (!retry_after_wait)
+			ret = __xe_bo_cpu_fault(vmf, xe, bo);
 	}
+	if (err)
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
 
@@ -1807,7 +1938,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
 }
 
 static const struct vm_operations_struct xe_gem_vm_ops = {
-	.fault = xe_gem_fault,
+	.fault = xe_bo_cpu_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
 	.access = xe_bo_vm_access,
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
 
-- 
2.50.1

