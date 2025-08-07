Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902E7C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D1C10E88F;
	Thu,  7 Aug 2025 16:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAk/lucD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E1110E896
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583436; x=1786119436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VXBelFNVYJMUyf8Oe4JnPy5Wctr1rcnMckrcTAxEC6Q=;
 b=kAk/lucDdf7p9cN2BfuDwkpp8MDKFd0O9EIuILRGGlUWyebIJZN3QGWa
 UimrNvKmwKWY4eHnc4T7Wee5w5dI+JTd0BdpIJAh5he3LZYMWWxQ1tcNJ
 FqnpM5ECrmKm/DfN9zMIZz7WX72+dX43Nt2ab0LbSGMl2c6y5JsU0tfBP
 2zkk3vgCpQ8tC0M/xiE0pEN2dqvyjO+ariL5UN7c8MQEPfqhPi5GDrafO
 dU3wxIdonzXnXrn4C0nR3HvXcZVtlP/gJ7iejo7kEFR/nyOc1usy/mhyP
 GIGbM0PGFuaaonA8JgnGL9Cx8AyWqQ6C4LutHXA3oyvPuN6S0EtuYjYi7 w==;
X-CSE-ConnectionGUID: hRjRrji+SDymrb2DqhQJfg==
X-CSE-MsgGUID: ozqexOuLSZOdGocAbWNpHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845621"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845621"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:16 -0700
X-CSE-ConnectionGUID: f5Ex8QOpSTqCbqAYAiRwiA==
X-CSE-MsgGUID: 0De/P9iRR1mPESiIRhK5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937920"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:17:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 21/26] drm/xe/bo: Update atomic_access attribute on madvise
Date: Thu,  7 Aug 2025 22:13:33 +0530
Message-Id: <20250807164338.1832254-22-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 29 ++++++++++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 35 ++++++-----------
 drivers/gpu/drm/xe/xe_vm.c           |  7 +++-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 59 +++++++++++++++++++++++++++-
 4 files changed, 102 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fea39842e1e..72396d358a00 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1711,6 +1711,18 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
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
@@ -1719,7 +1731,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1731,8 +1743,19 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
 
 		if (ret == VM_FAULT_RETRY &&
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
index ae966755255d..8eac7a4ab22f 100644
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
index 675a05a24e3b..b2a78774ca83 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -102,6 +102,7 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
+	struct xe_bo *bo;
 	int i;
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
@@ -114,7 +115,19 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			continue;
 
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
 
@@ -267,6 +280,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
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
@@ -318,6 +366,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
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

