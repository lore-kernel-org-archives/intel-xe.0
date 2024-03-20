Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B52C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 10:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA32A10F58B;
	Wed, 20 Mar 2024 10:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBzVT/dI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8810F5A1
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710929451; x=1742465451;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jsWmWe3Y0sNo/4ttKHChEBoLym6vJII/O7KANxMDtaM=;
 b=WBzVT/dIgaYytQlYWhxo+VjxGG5LmVLumkbkG3y3VjbNW8uK6L9tiqbL
 xoA6OLOTu+tQ4Z0/gq+a7Yf8XRz/R1oSneQGL9Q0Nqps7DHI9E7egTveg
 +h0cm+3LV9VRraZApTIuBXA2H3KKF9pSDuogeVYqPny8DbprgC6E/vnNi
 4pSO/NUfuOkwu+lNwiYn+uL/Zc0XbRgPiX/dM1Ttcp1t+mRn6d/gPmeaH
 do+FotYAXchcm4NCVme69PUckon9407NByj3IB8wCkZlDruatKkpKeKka
 EWB/2LcGnyXw0XvGx9/eMz6o5ZL1TS8+nT1MnJrhqomrCdlj6suWxCjRf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5723773"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5723773"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="37232894"
Received: from suntharx-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.177])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:10:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 6/8] drm/xe/bo: Forward the decision to evict local objects
 during validation
Date: Wed, 20 Mar 2024 11:10:18 +0100
Message-ID: <20240320101020.5611-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
References: <20240320101020.5611-1-thomas.hellstrom@linux.intel.com>
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

Currently we refuse evicting the VM's local objects. However that
is necessary for some objects. Most notably completely unbound objects.
Forward this decision to be per-object based in the TTM
eviction_valuable() callback.

Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  4 +--
 drivers/gpu/drm/xe/tests/xe_bo.c       |  6 ++---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c  |  4 +--
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  2 +-
 drivers/gpu/drm/xe/xe_bo.c             | 36 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h             |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c        |  2 +-
 drivers/gpu/drm/xe/xe_exec.c           | 11 +++++---
 drivers/gpu/drm/xe/xe_ggtt.c           |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c   |  2 +-
 drivers/gpu/drm/xe/xe_vm.c             | 15 +++++++----
 drivers/gpu/drm/xe/xe_vm_types.h       | 10 +++++++
 12 files changed, 65 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..974d182b9537 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -286,7 +286,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (IS_DGFX(xe))
 		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
 	else
-		ret = xe_bo_validate(bo, NULL, true);
+		ret = xe_bo_validate(bo, bo->vm);
 	if (!ret)
 		ttm_bo_pin(&bo->ttm);
 	ttm_bo_unreserve(&bo->ttm);
@@ -381,4 +381,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 0926a1c2eb86..5410cb1780a6 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -28,7 +28,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	u32 offset;
 
 	/* Move bo to VRAM if not already there. */
-	ret = xe_bo_validate(bo, NULL, false);
+	ret = xe_bo_validate(bo, NULL);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate bo.\n");
 		return ret;
@@ -274,7 +274,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		if (i) {
 			down_read(&vm->lock);
 			xe_vm_lock(vm, false);
-			err = xe_bo_validate(bo, bo->vm, false);
+			err = xe_bo_validate(bo, bo->vm);
 			xe_vm_unlock(vm);
 			up_read(&vm->lock);
 			if (err) {
@@ -283,7 +283,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 				goto cleanup_all;
 			}
 			xe_bo_lock(external, false);
-			err = xe_bo_validate(external, NULL, false);
+			err = xe_bo_validate(external, NULL);
 			xe_bo_unlock(external);
 			if (err) {
 				KUNIT_FAIL(test, "external bo valid err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 9f6d571d7fa9..37bcf812f3ca 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -80,7 +80,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	}
 
 	/* Re-validate the importer. This should move also exporter in. */
-	ret = xe_bo_validate(imported, NULL, false);
+	ret = xe_bo_validate(imported, NULL);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Validating importer failed with err=%d.\n",
@@ -156,7 +156,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 
 			/* Is everything where we expect it to be? */
 			xe_bo_lock(import_bo, false);
-			err = xe_bo_validate(import_bo, NULL, false);
+			err = xe_bo_validate(import_bo, NULL);
 
 			/* Pinning in VRAM is not allowed. */
 			if (!is_dynamic(params) &&
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index ce531498f57f..97735a3c66ab 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -120,7 +120,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 		return;
 	}
 
-	err = xe_bo_validate(remote, NULL, false);
+	err = xe_bo_validate(remote, NULL);
 	if (err) {
 		KUNIT_FAIL(test, "Failed to validate system bo for %s: %li\n",
 			   str, err);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6603a0ea79c5..eddac9f93ef1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1049,6 +1049,23 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
+				    const struct ttm_place *place)
+{
+	if (xe_bo_is_xe_bo(ttm_bo)) {
+		struct xe_bo *xe_bo = ttm_to_xe_bo(ttm_bo);
+		struct xe_vm *vm = xe_bo->vm;
+
+		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
+		    vm->is_validating) {
+			xe_vm_assert_held(vm);
+			return false;
+		}
+	}
+
+	return ttm_bo_eviction_valuable(ttm_bo, place);
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1059,7 +1076,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.io_mem_reserve = xe_ttm_io_mem_reserve,
 	.io_mem_pfn = xe_ttm_io_mem_pfn,
 	.release_notify = xe_ttm_bo_release_notify,
-	.eviction_valuable = ttm_bo_eviction_valuable,
+	.eviction_valuable = xe_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
 };
 
@@ -1677,7 +1694,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
-		err = xe_bo_validate(bo, NULL, false);
+		err = xe_bo_validate(bo, NULL);
 		if (err)
 			return err;
 
@@ -1721,7 +1738,7 @@ int xe_bo_pin(struct xe_bo *bo)
 	/* We only expect at most 1 pin */
 	xe_assert(xe, !xe_bo_is_pinned(bo));
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, bo->vm);
 	if (err)
 		return err;
 
@@ -1818,19 +1835,17 @@ void xe_bo_unpin(struct xe_bo *bo)
  * xe_bo_validate() - Make sure the bo is in an allowed placement
  * @bo: The bo,
  * @vm: Pointer to a the vm the bo shares a locked dma_resv object with, or
- *      NULL. Used together with @allow_res_evict.
- * @allow_res_evict: Whether it's allowed to evict bos sharing @vm's
- *                   reservation object.
+ *      NULL.
  *
  * Make sure the bo is in allowed placement, migrating it if necessary. If
  * needed, other bos will be evicted. If bos selected for eviction shares
- * the @vm's reservation object, they can be evicted iff @allow_res_evict is
- * set to true, otherwise they will be bypassed.
+ * the @vm's reservation object, they can be evicted if the
+ * xe_bo_eviction_valuable() function allows it.
  *
  * Return: 0 on success, negative error code on failure. May return
  * -EINTR or -ERESTARTSYS if internal waits are interrupted by a signal.
  */
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1838,10 +1853,9 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 	};
 
 	if (vm) {
-		lockdep_assert_held(&vm->lock);
 		xe_vm_assert_held(vm);
 
-		ctx.allow_res_evict = allow_res_evict;
+		ctx.allow_res_evict = true;
 		ctx.resv = xe_vm_resv(vm);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c59ad15961ce..df5e10a50cf3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -191,7 +191,7 @@ int xe_bo_pin_external(struct xe_bo *bo);
 int xe_bo_pin(struct xe_bo *bo);
 void xe_bo_unpin_external(struct xe_bo *bo);
 void xe_bo_unpin(struct xe_bo *bo);
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict);
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm);
 
 static inline bool xe_bo_is_pinned(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 5b26af21e029..f1dc2bc5179b 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -102,7 +102,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 		if (!attach->peer2peer)
 			r = xe_bo_migrate(bo, XE_PL_TT);
 		else
-			r = xe_bo_validate(bo, NULL, false);
+			r = xe_bo_validate(bo, NULL);
 		if (r)
 			return ERR_PTR(r);
 	}
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index a14a17588315..4673de6b084c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -101,23 +101,27 @@ static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 	unsigned long index;
 	int ret;
 
+	vm->is_validating = true;
 	do {
 		ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
 		if (ret)
-			return ret;
+			goto out;
 
 		ret = xe_vm_rebind(vm, false);
 		if (ret)
-			return ret;
+			goto out;
 	} while (!list_empty(&vm->gpuvm.evict.list));
 
 	drm_exec_for_each_locked_object(&vm_exec->exec, index, obj) {
 		ret = dma_resv_reserve_fences(obj->resv, 1);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	return 0;
+out:
+	vm->is_validating = false;
+	return ret;
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -335,6 +339,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
+	vm->is_validating = false;
 	drm_exec_fini(exec);
 err_unlock_list:
 	if (write_locked)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 717d0e76277a..275e18e36b13 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -414,7 +414,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return 0;
 	}
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, bo->vm);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 12a5735f4352..3e93e9008392 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -118,7 +118,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 			return err;
 	} else if (bo) {
 		/* Create backing store if needed */
-		err = xe_bo_validate(bo, vm, true);
+		err = xe_bo_validate(bo, vm);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5352654e2f61..0257c7d3f8ed 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -474,7 +474,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
-	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm);
 	if (ret)
 		return ret;
 
@@ -512,23 +512,27 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
+	vm->is_validating = true;
 	do {
 		err = drm_gpuvm_validate(&vm->gpuvm, exec);
 		if (err)
-			return err;
+			goto out;
 
 		err = xe_vm_rebind(vm, true);
 		if (err)
-			return err;
+			goto out;
 	} while (!list_empty(&vm->gpuvm.evict.list));
 
 	drm_exec_for_each_locked_object(exec, index, obj) {
 		err = dma_resv_reserve_fences(obj->resv, vm->preempt.num_exec_queues);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	return 0;
+out:
+	vm->is_validating = false;
+	return err;
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
@@ -617,6 +621,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
+	vm->is_validating = false;
 	drm_exec_fini(&exec);
 out_unlock_outer:
 	if (err == -EAGAIN) {
@@ -1832,7 +1837,7 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
 	xe_bo_assert_held(bo);
 
 	if (bo && immediate) {
-		err = xe_bo_validate(bo, vm, true);
+		err = xe_bo_validate(bo, vm);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 6b504e2f51d8..47f0a54ddda4 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -271,6 +271,16 @@ struct xe_vm {
 	u64 tlb_flush_seqno;
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+
+	/**
+	 * @is_validaing: Whether we are validating the vm's local objects.
+	 * This field is protected by the vm's resv. Note that this
+	 * is needed only since TTM doesn't forward the ttm_operation_ctx to the
+	 * eviction_valuable() callback, so if / when that is in place, this
+	 * should be removed.
+	 */
+	bool is_validating;
+
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
 };
-- 
2.44.0

