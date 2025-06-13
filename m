Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49622C71151
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047C310E963;
	Fri, 13 Jun 2025 12:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8QAbtLP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C0210E986
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817830; x=1781353830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zK2jDsNilBNyx0oAAj3AhJcmh2ZXG+0aKjiUjNZrr5U=;
 b=Z8QAbtLPyNF2tf2Nj/HA2X7310VlH3c2eMAZFicuPE03fxCLOSp3xDQv
 sZKBuYAJ43JkrJrs39/1eAHJWY03eaOlM5b1/LQuawnG4eY1MB7ckjZ+N
 WAvQD8tYyw7SAf4uYqEIsLMuWQgvlXRb6bEXkAPzkcalFE/PVFbCAUxkn
 5WAEJH4TOqmXsuvlLzKSOYeNaKAZZ2drkdvf2xjsnfkZ1XBerZYodJNjw
 w1MKsaHmh0L/4c2uuRtYdmAFgMeYeQUP8jjGwWWSWnITxgt73dOfxnDXx
 ZhBGQ/vLerF1nCBsFb4ay71A6ZeC9p/a+lzfOZ4Ap+m3vmYRJBFNJ92Ts w==;
X-CSE-ConnectionGUID: +5RgK6m7T6eqHXtrx0R/Ug==
X-CSE-MsgGUID: DqyjwT3FQUy1BUY/YDJwpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610192"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610192"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:30 -0700
X-CSE-ConnectionGUID: pPThIunmQleDONIaA+60yg==
X-CSE-MsgGUID: JaUL34/8S6+M2Uo3Qi7t8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290374"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:28 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 18/20] drm/xe/bo: Update atomic_access attribute on madvise
Date: Fri, 13 Jun 2025 18:25:56 +0530
Message-Id: <20250613125558.2607665-19-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 21 ++++++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c           |  5 ++-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 61 +++++++++++++++++++++++++++-
 4 files changed, 82 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e39188a021a..82b33dfc5515 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1667,6 +1667,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
+static bool should_migrate_to_smem(struct xe_bo *bo)
+{
+	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
+	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
+}
+
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -1675,7 +1681,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1687,8 +1693,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+		if (should_migrate_to_smem(bo)) {
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
index e2d975b2fddb..1335c5fc0e10 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -89,7 +89,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (xe_vma_need_vram_for_atomic(vm->xe, vma, atomic)) {
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0dd9f9e11030..14e554f3f4d5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4200,6 +4200,9 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
  */
 bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
 {
+	u32 atomic_access = xe_vma_bo(vma) ? xe_vma_bo(vma)->attr.atomic_access :
+					     vma->attr.atomic_access;
+
 	if (!IS_DGFX(xe))
 		return false;
 
@@ -4207,7 +4210,7 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
 	 * on a device supporting CXL atomics, these would ideally work universally
 	 * without additional handling.
 	 */
-	switch (vma->attr.atomic_access) {
+	switch (atomic_access) {
 	case DRM_XE_VMA_ATOMIC_DEVICE:
 		return !xe->info.has_device_atomics_on_smem;
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 973627edb23c..5b96c8fc73a5 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -102,14 +102,28 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
+	struct xe_bo *bo;
 	int i;
 
 	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_ATOMIC);
 	xe_assert(vm->xe, op->atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
 
-	for (i = 0; i < num_vmas; i++)
+	for (i = 0; i < num_vmas; i++) {
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
+		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
+		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
+			ttm_bo_unmap_virtual(&bo->ttm);
+	}
 }
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
@@ -231,6 +245,41 @@ static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const struct drm_x
 	return 0;
 }
 
+static int check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
+				  int num_vmas, u32 atomic_val)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_bo *bo;
+	int i;
+
+	for (i = 0; i < num_vmas; i++) {
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_VMA_ATOMIC_CPU &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
+			return -EINVAL;
+
+		/* NOTE: The following atomic checks are platform-specific. For example,
+		 * if a device supports CXL atomics, these may not be necessary or
+		 * may behave differently.
+		 */
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_VMA_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
+				   xe->info.has_device_atomics_on_smem)))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_VMA_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return -EINVAL;
+	}
+	return 0;
+}
 /**
  * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
  * @dev: DRM device pointer
@@ -276,6 +325,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		goto unlock_vm;
 
 	if (madvise_range.has_bo_vmas) {
+		if (args->type == DRM_XE_VMA_ATTR_ATOMIC) {
+			err = check_bo_args_are_sane(vm, madvise_range.vmas,
+						     madvise_range.num_vmas,
+						     args->atomic.val);
+			if (err)
+				goto unlock_vm;
+		}
+
 		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 		drm_exec_until_all_locked(&exec) {
 			for (int i = 0; i < madvise_range.num_vmas; i++) {
-- 
2.34.1

