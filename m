Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B9C87FD2
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FB310E69C;
	Wed, 30 Jul 2025 12:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBovjtUg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D473C10E691
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878875; x=1785414875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XzFC9RwsZzA4rnmR3sAiHif54jX/KENyzX9w/mKFMfg=;
 b=hBovjtUg7fAAKckOphOYOkU8ZQFt0AO6/roFAnfr7u/UDu/Hi8Qkyano
 D9z8hmDCZBmwJwgm6iT6Rxkpfc5esd4aoJpiXCNdy2BGqblSpRccq1+gb
 8p36JrgMeCp++cwR+y7TwaO3FYjM+sgLnOEgb+LInwzqXW4qsCGgq3Z5c
 qg/tTyL+ssQ/dY3SzrT13apxgrrZ4PQf423aMfrLy98bJENJ+h8GXzlRk
 jT9gJ1cD500pMRhdEBmMkBklAIYoUx8lxXBLEQRACPwe9I2NTwtKfySue
 18CuTcYFb5UacIWn3rGGFLeP3u+rM1wVDbCz7dxPqVsvpxpymwbCqmeFo g==;
X-CSE-ConnectionGUID: RMTRyxFwSgiqZKDqGjSmWw==
X-CSE-MsgGUID: oh+dm3npQGiflIt+7HWwJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450184"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450184"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:35 -0700
X-CSE-ConnectionGUID: KGcCVn8SSn6N8J5JaBO2rw==
X-CSE-MsgGUID: rfkX2i3jQa22W/AZlRc8KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649509"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 20/25] drm/xe/bo: Update atomic_access attribute on madvise
Date: Wed, 30 Jul 2025 18:30:45 +0530
Message-Id: <20250730130050.1001648-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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

Update the bo_atomic_access based on user-provided input and determine
the migration to smem during a CPU fault

v2 (Matthew Brost)
- Avoid cpu unmapping if bo is already in smem
- check atomics on smem too for ioctl
- Add comments

v3
- Avoid migration in prefetch

v4 (Matthew Brost)
- make sanity check function bool
- add assert for smem placement
- fix doc

v5 (Matthew Brost)
- NACK atomic fault with  DRM_XE_ATOMIC_CPU

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 29 ++++++++++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 35 ++++++----------
 drivers/gpu/drm/xe/xe_vm.c           |  7 +++-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 60 +++++++++++++++++++++++++++-
 4 files changed, 103 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ffca1cea5585..6ab297f94d12 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1709,6 +1709,18 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
+static bool should_migrate_to_smem(struct xe_bo *bo)
+{
+	/*
+	 * NOTE: The following atomic checks are platform-specific. For example,
+	 * if a device supports CXL atomics, these may not be necessary or
+	 * may behave differently.
+	 */
+
+	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
+	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
+}
+
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -1717,7 +1729,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1729,8 +1741,19 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+		if (should_migrate_to_smem(bo)) {
+			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
+
+			r = xe_bo_migrate(bo, XE_PL_TT);
+			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
+				ret = VM_FAULT_NOPAGE;
+			else if (r)
+				ret = VM_FAULT_SIGBUS;
+		}
+		if (!ret)
+			ret = ttm_bo_vm_fault_reserved(vmf,
+						       vmf->vma->vm_page_prot,
+						       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab43dec52776..4ea30fbce9bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -75,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, struct xe_vram_region *vram)
+		       bool need_vram_move, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -85,26 +85,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && vram) {
-		xe_assert(vm->xe, IS_DGFX(vm->xe));
+	if (!bo)
+		return 0;
 
-		if (xe_vma_is_userptr(vma)) {
-			err = -EACCES;
-			return err;
-		}
+	err = need_vram_move ? xe_bo_migrate(bo, vram->placement) :
+			       xe_bo_validate(bo, vm, true);
 
-		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, vram->placement);
-		if (err)
-			return err;
-	} else if (bo) {
-		/* Create backing store if needed */
-		err = xe_bo_validate(bo, vm, true);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return err;
 }
 
 static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
@@ -115,10 +102,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	ktime_t end = 0;
-	int err;
+	int err, needs_vram;
 
 	lockdep_assert_held_write(&vm->lock);
 
+	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
+		return needs_vram < 0 ? needs_vram : -EACCES;
+
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);
 
@@ -141,7 +132,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
+		err = xe_pf_begin(&exec, vma, needs_vram == 1, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -576,7 +567,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
+		ret = xe_pf_begin(&exec, vma, IS_DGFX(vm->xe), tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d57fc1071142..0774b40bc37b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4214,15 +4214,18 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
  */
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
 {
+	u32 atomic_access = xe_vma_bo(vma) ? xe_vma_bo(vma)->attr.atomic_access :
+					     vma->attr.atomic_access;
+
 	if (!IS_DGFX(xe) || !is_atomic)
-		return 0;
+		return false;
 
 	/*
 	 * NOTE: The checks implemented here are platform-specific. For
 	 * instance, on a device supporting CXL atomics, these would ideally
 	 * work universally without additional handling.
 	 */
-	switch (vma->attr.atomic_access) {
+	switch (atomic_access) {
 	case DRM_XE_ATOMIC_DEVICE:
 		return !xe->info.has_device_atomics_on_smem;
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 51a9364abc72..16ab1267ad21 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -102,6 +102,7 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
+	struct xe_bo *bo;
 	int i;
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
@@ -113,8 +114,21 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			      xe->info.has_device_atomics_on_smem))
 				continue;
 		}
+
 		vmas[i]->attr.atomic_access = op->atomic.val;
-	/*TODO: handle bo backed vmas */
+
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+
+		xe_bo_assert_held(bo);
+		bo->attr.atomic_access = op->atomic.val;
+
+		/* Invalidate cpu page table, so bo can migrate to smem in next access */
+		if (xe_bo_is_vram(bo) &&
+		    (bo->attr.atomic_access == DRM_XE_ATOMIC_CPU ||
+		     bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL))
+			ttm_bo_unmap_virtual(&bo->ttm);
 	}
 }
 
@@ -263,6 +277,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 	return true;
 }
 
+static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
+				   int num_vmas, u32 atomic_val)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_bo *bo;
+	int i;
+
+	for (i = 0; i < num_vmas; i++) {
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+		/*
+		 * NOTE: The following atomic checks are platform-specific. For example,
+		 * if a device supports CXL atomics, these may not be necessary or
+		 * may behave differently.
+		 */
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_CPU &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
+				   xe->info.has_device_atomics_on_smem)))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return false;
+	}
+	return true;
+}
 /**
  * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
  * @dev: DRM device pointer
@@ -314,6 +363,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		goto unlock_vm;
 
 	if (madvise_range.has_bo_vmas) {
+		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
+			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
+						    madvise_range.num_vmas,
+						    args->atomic.val)) {
+				err = -EINVAL;
+				goto unlock_vm;
+			}
+		}
+
 		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 		drm_exec_until_all_locked(&exec) {
 			for (int i = 0; i < madvise_range.num_vmas; i++) {
-- 
2.34.1

