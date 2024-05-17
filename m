Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A887EC41513
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 07:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FA910EE1F;
	Fri, 17 May 2024 07:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeOyYJxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2864310EE21
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 07:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931716; x=1747467716;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9YvzgV08fQSCX4YncM8I5vB7aSVaGbE317E7Be0HkRQ=;
 b=XeOyYJxl6j1HiuHdyKlHYvM16AFVL+X9BvnqO5nJRdf3BrMP9SRWd3kw
 46uWAAzgbDkCSJTk0FAQsgq3L3HWZWWpfUjNdJ/jiwSCSurca1hzqi2RY
 WQopUaPE0/B6pur9knnLOPssUYI8bLf2gzBRB+gLNJFzxQB5ESvEesA4j
 IoYUJCGxnHXZrJJuy5a+Lm4nQcPxLP2CrrCf4FY+NukMM2Jau2Di/hoQo
 gjGyIuZDLHFPXExmxyu+AcVriOnjR6TnHbbso+61WtRtw17KdkWA1ZgH9
 KZrtVP0+e6rhahQuVORmGGRQVzAUQHIkEpIv63Vc+Abs27jtfda0YGjCj g==;
X-CSE-ConnectionGUID: HM5U7pshQIevOXUCpsO35Q==
X-CSE-MsgGUID: THMFQWOxThKejHXkMdWE9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11897602"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11897602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:56 -0700
X-CSE-ConnectionGUID: Co533RjHRsitambcoNHC2A==
X-CSE-MsgGUID: MfutXuhBQSCu1aCBaon3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36213131"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:55 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 18/21] drm/ttm: Convert ttm vm to using drm_exec.
Date: Fri, 17 May 2024 09:41:27 +0200
Message-ID: <20240517074130.2908-19-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
References: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |   4 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c      |   4 +-
 drivers/gpu/drm/radeon/radeon_gem.c        |   4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 101 ++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                 |   5 +-
 include/drm/ttm/ttm_bo.h                   |   6 +-
 8 files changed, 85 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 17e16c971e21..22d61cdb0d88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -52,7 +52,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 	int idx;
 
-	ret = ttm_bo_vm_reserve(bo, vmf);
+	ret = ttm_bo_vm_reserve(bo, vmf, NULL);
 	if (ret)
 		return ret;
 
@@ -64,7 +64,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 		}
 
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+					       TTM_BO_VM_NUM_PREFAULT, NULL);
 
 		drm_dev_exit(idx);
 	} else {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e6f177183c0f..c66e2b54c9a2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1046,7 +1046,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 		     area->vm_flags & VM_WRITE))
 		return VM_FAULT_SIGBUS;
 
-	ret = ttm_bo_vm_reserve(bo, vmf);
+	ret = ttm_bo_vm_reserve(bo, vmf, NULL);
 	if (ret)
 		return ret;
 
@@ -1108,7 +1108,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 
 	if (drm_dev_enter(dev, &idx)) {
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+					       TTM_BO_VM_NUM_PREFAULT, NULL);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5a887d67dc0e..bc6901955508 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -46,7 +46,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
 	pgprot_t prot;
 	vm_fault_t ret;
 
-	ret = ttm_bo_vm_reserve(bo, vmf);
+	ret = ttm_bo_vm_reserve(bo, vmf, NULL);
 	if (ret)
 		return ret;
 
@@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
 
 	nouveau_bo_del_io_reserve_lru(bo);
 	prot = vm_get_page_prot(vma->vm_flags);
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
+	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, NULL);
 	nouveau_bo_add_io_reserve_lru(bo);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 2ef201a072f1..f29761b7ca97 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -54,7 +54,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault *vmf)
 
 	down_read(&rdev->pm.mclk_lock);
 
-	ret = ttm_bo_vm_reserve(bo, vmf);
+	ret = ttm_bo_vm_reserve(bo, vmf, NULL);
 	if (ret)
 		goto unlock_mclk;
 
@@ -63,7 +63,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault *vmf)
 		goto unlock_resv;
 
 	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT);
+				       TTM_BO_VM_NUM_PREFAULT, NULL);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		goto unlock_mclk;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 4212b8c91dd4..74daa910d0b7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -31,6 +31,8 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_exec.h>
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -39,7 +41,8 @@
 #include <drm/drm_managed.h>
 
 static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
-				struct vm_fault *vmf)
+				       struct vm_fault *vmf,
+				       struct drm_exec *exec)
 {
 	long err = 0;
 
@@ -63,7 +66,10 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 		(void)dma_resv_wait_timeout(bo->base.resv,
 					    DMA_RESV_USAGE_KERNEL, true,
 					    MAX_SCHEDULE_TIMEOUT);
-		dma_resv_unlock(bo->base.resv);
+		if (exec)
+			drm_exec_unlock_obj(exec, &bo->base);
+		else
+			dma_resv_unlock(bo->base.resv);
 		ttm_bo_put(bo);
 		return VM_FAULT_RETRY;
 	}
@@ -96,6 +102,7 @@ static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
  * ttm_bo_vm_reserve - Reserve a buffer object in a retryable vm callback
  * @bo: The buffer object
  * @vmf: The fault structure handed to the callback
+ * @exec: The drm_exec locking transaction context. May be NULL.
  *
  * vm callbacks like fault() and *_mkwrite() allow for the mmap_lock to be dropped
  * during long waits, and after the wait the callback will be restarted. This
@@ -114,15 +121,16 @@ static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
  *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed.
  */
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
-			     struct vm_fault *vmf)
+			     struct vm_fault *vmf, struct drm_exec *exec)
 {
-	/*
-	 * Work around locking order reversal in fault / nopfn
-	 * between mmap_lock and bo_reserve: Perform a trylock operation
-	 * for reserve, and if it fails, retry the fault after waiting
-	 * for the buffer to become unreserved.
-	 */
-	if (unlikely(!dma_resv_trylock(bo->base.resv))) {
+	int ret;
+
+	if (exec)
+		ret = drm_exec_trylock_obj(exec, &bo->base);
+	else
+		ret = dma_resv_trylock(bo->base.resv) ? 0 : -EBUSY;
+
+	if (unlikely(ret == -EBUSY)) {
 		/*
 		 * If the fault allows retry and this is the first
 		 * fault attempt, we try to release the mmap_lock
@@ -132,16 +140,26 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			if (!(vmf->flags & FAULT_FLAG_RETRY_NOWAIT)) {
 				ttm_bo_get(bo);
 				mmap_read_unlock(vmf->vma->vm_mm);
-				if (!dma_resv_lock_interruptible(bo->base.resv,
-								 NULL))
-					dma_resv_unlock(bo->base.resv);
+				if (exec) {
+					ret = drm_exec_lock_obj(exec, &bo->base);
+					if (!ret)
+						drm_exec_unlock_obj(exec, &bo->base);
+				} else  {
+					if (!dma_resv_lock_interruptible(bo->base.resv,
+									 NULL))
+						dma_resv_unlock(bo->base.resv);
+				}
 				ttm_bo_put(bo);
 			}
 
 			return VM_FAULT_RETRY;
 		}
 
-		if (dma_resv_lock_interruptible(bo->base.resv, NULL))
+		if (exec)
+			ret = drm_exec_lock_obj(exec, &bo->base);
+		else
+			ret = dma_resv_lock_interruptible(bo->base.resv, NULL);
+		if (ret)
 			return VM_FAULT_NOPAGE;
 	}
 
@@ -151,7 +169,10 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 	 */
 	if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
 		if (!(bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE)) {
-			dma_resv_unlock(bo->base.resv);
+			if (exec)
+				drm_exec_unlock_obj(exec, &bo->base);
+			else
+				dma_resv_unlock(bo->base.resv);
 			return VM_FAULT_SIGBUS;
 		}
 	}
@@ -167,6 +188,7 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
  * @num_prefault: Maximum number of prefault pages. The caller may want to
  * specify this based on madvice settings and the size of the GPU object
  * backed by the memory.
+ * @exec: The struct drm_exec locking transaction context. May be NULL.
  *
  * This function inserts one or more page table entries pointing to the
  * memory backing the buffer object, and then returns a return code
@@ -180,7 +202,8 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
  */
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgprot_t prot,
-				    pgoff_t num_prefault)
+				    pgoff_t num_prefault,
+				    struct drm_exec *exec)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
@@ -199,7 +222,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	 * Wait for buffer data in transit, due to a pipelined
 	 * move.
 	 */
-	ret = ttm_bo_vm_fault_idle(bo, vmf);
+	ret = ttm_bo_vm_fault_idle(bo, vmf, exec);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -220,7 +243,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		struct ttm_operation_ctx ctx = {
 			.interruptible = true,
 			.no_wait_gpu = false,
-			.force_alloc = true
+			.force_alloc = true,
+			.exec = exec,
 		};
 
 		ttm = bo->ttm;
@@ -324,25 +348,34 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 	pgprot_t prot;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
 	struct drm_device *ddev = bo->base.dev;
+	struct drm_exec exec;
 	vm_fault_t ret;
-	int idx;
-
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
-
-	prot = vma->vm_page_prot;
-	if (drm_dev_enter(ddev, &idx)) {
-		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
-		drm_dev_exit(idx);
-	} else {
-		ret = ttm_bo_vm_dummy_page(vmf, prot);
+	int idx, err;
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 16);
+	drm_exec_until_all_locked(&exec) {
+		ret = ttm_bo_vm_reserve(bo, vmf, &exec);
+		err = drm_exec_retry_on_contention(&exec, 0);
+		if (err)
+			ret = VM_FAULT_NOPAGE;
+		if (ret)
+			goto out;
+
+		prot = vma->vm_page_prot;
+		if (drm_dev_enter(ddev, &idx)) {
+			ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT,
+						       &exec);
+			drm_dev_exit(idx);
+			err = drm_exec_retry_on_contention(&exec, 0);
+			if (err)
+				ret = VM_FAULT_NOPAGE;
+		} else {
+			ret = ttm_bo_vm_dummy_page(vmf, prot);
+		}
 	}
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
-
-	dma_resv_unlock(bo->base.resv);
 
+out:
+	drm_exec_fini(&exec);
 	return ret;
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 74ff2812d66a..fc275afd000c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -388,7 +388,7 @@ vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf)
 	 */
 	save_flags = vmf->flags;
 	vmf->flags &= ~FAULT_FLAG_ALLOW_RETRY;
-	ret = ttm_bo_vm_reserve(bo, vmf);
+	ret = ttm_bo_vm_reserve(bo, vmf, NULL);
 	vmf->flags = save_flags;
 	if (ret)
 		return ret;
@@ -423,7 +423,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 	pgprot_t prot;
 	vm_fault_t ret;
 
-	ret = ttm_bo_vm_reserve(bo, vmf);
+	ret = ttm_bo_vm_reserve(bo, vmf, NULL);
 	if (ret)
 		return ret;
 
@@ -457,7 +457,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 	else
 		prot = vm_get_page_prot(vma->vm_flags);
 
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
+	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, NULL);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9a0ca2cab7b6..3c56858e0751 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1223,7 +1223,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
 
-	ret = ttm_bo_vm_reserve(tbo, vmf);
+	ret = ttm_bo_vm_reserve(tbo, vmf, NULL);
 	if (ret)
 		goto out;
 
@@ -1231,7 +1231,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 		trace_xe_bo_cpu_fault(bo);
 
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+					       TTM_BO_VM_NUM_PREFAULT,
+					       NULL);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 0839f870b818..b10c1d2b5d4f 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -427,10 +427,12 @@ int ttm_bo_evict_first(struct ttm_device *bdev,
 		       struct ttm_resource_manager *man,
 		       struct ttm_operation_ctx *ctx);
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
-			     struct vm_fault *vmf);
+			     struct vm_fault *vmf,
+			     struct drm_exec *exec);
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgprot_t prot,
-				    pgoff_t num_prefault);
+				    pgoff_t num_prefault,
+				    struct drm_exec *exec);
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
 void ttm_bo_vm_open(struct vm_area_struct *vma);
 void ttm_bo_vm_close(struct vm_area_struct *vma);
-- 
2.44.0

