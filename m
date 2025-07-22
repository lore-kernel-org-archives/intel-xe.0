Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698C0C83F34
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352F610E699;
	Tue, 22 Jul 2025 13:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1gYXnfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E93310E698
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189752; x=1784725752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gggnIScOP7eBGm3MTFV4qQ6Bp42fyt2Y5M4/+HiPhwA=;
 b=A1gYXnfFHclwpfLoQ1oPzHBqjKwZqzI8hdFFoJw2dgMhc6CA84pr3uTt
 UaNaFfHqhnsP+zHvSZjI7DBoYi1gIcwz1c7/xJ3hHzku7XzU7SQrL4BUl
 YsJQgBStE/q2F5+dlJf/iG1P3w5pX973WcLDyc5lqMu5zZTIoTW7wSJWX
 eD4dYPQtquMrwCAbsdQ07sfwkjS/oFMQy2J9RthdMYa+Ln5cM4xSJK+HM
 R++dfMj1Nf4E3qcITJh2AHDW65ccWNiT9tGWnh/T5fv9giZxRjH8AcLCz
 /yJGT8RibQmJQnsSy1OvRE3XThJZ/zbBKeTTKMTjHW4jPR7IiJufBGU4G A==;
X-CSE-ConnectionGUID: YuOufLMdSu2vjEBmI6WRWQ==
X-CSE-MsgGUID: +GewbSBbSPW/Vvy1uLAeig==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530398"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:12 -0700
X-CSE-ConnectionGUID: uLEtMMEURp6kzFcO+c4g8A==
X-CSE-MsgGUID: vryhYfsoQqO+Tl98Slpx9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420685"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 17/23] drm/xe/bo: Update atomic_access attribute on madvise
Date: Tue, 22 Jul 2025 19:05:20 +0530
Message-Id: <20250722133526.3550547-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 29 +++++++++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c           |  5 ++-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 62 +++++++++++++++++++++++++++-
 4 files changed, 91 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4e0355d0f406..f133fc54664e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1685,6 +1685,18 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
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
@@ -1693,7 +1705,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1705,8 +1717,19 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
index 5a75d56d8558..c1cb69c6ada8 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -84,7 +84,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (xe_vma_need_vram_for_atomic(vm->xe, vma, atomic)) {
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2226b1eb46f1..5dc7cd7769f8 100644
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
 
@@ -4208,7 +4211,7 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
 	 * instance, on a device supporting CXL atomics, these would ideally
 	 * work universally without additional handling.
 	 */
-	switch (vma->attr.atomic_access) {
+	switch (atomic_access) {
 	case DRM_XE_ATOMIC_DEVICE:
 		return !xe->info.has_device_atomics_on_smem;
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 1dc4d19a5f2a..727833780b4b 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -98,14 +98,28 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
+	struct xe_bo *bo;
 	int i;
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
 	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
 
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
+		    (bo->attr.atomic_access == DRM_XE_ATOMIC_CPU ||
+		     bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL))
+			ttm_bo_unmap_virtual(&bo->ttm);
+	}
 }
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
@@ -253,6 +267,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
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
@@ -302,6 +351,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
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

