Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253BCC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA4E10E40E;
	Mon,  7 Apr 2025 09:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIlqgXQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9088C10E408
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019620; x=1775555620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=psZd6UeyKghN6MmPiWeWp5agd6Mh7Zlh/96+iqtCwfo=;
 b=PIlqgXQYgh/y3VodlI1/IIuOyZbzRNeDXbwQaJI/hiMGUoMptGYWZNIF
 OsZfZMSzFftWE8YyhcIYyI1SEffYirscfqzSsjmxjx5ugrDGgvszLjlYR
 0SCaFMXfBKil/0cuqoFwD4K96+VTyIiXsYpBkHp0IrSGwfVfV4ulpuZC/
 bn8MQHmb3SHPFmTe9dub+8f4j0RCUPxBXLJFVT0De5kYXEJ+ilOUSBXLc
 pnEcI2EYrFleO8IqPjsv75Cp7alcH0F/e/qxihW+h4qHNESrvMSC58kiM
 RDn0CIewQocPLNG84tZbH2tYUqh1AiykCplf0q3yySBZlEoNctVSugeaV g==;
X-CSE-ConnectionGUID: sfqGa0oXQw+ulhk8e++ToQ==
X-CSE-MsgGUID: pdIgstkdSNGbKhZSz4M7YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029473"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:40 -0700
X-CSE-ConnectionGUID: /HZIaj4LQYe/ta4YgdEw+Q==
X-CSE-MsgGUID: GD7IrYkSRKy2kP+o/+pd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778963"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:39 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 32/32] drm/xe/bo: Update atomic_access attribute on madvise
Date: Mon,  7 Apr 2025 15:47:19 +0530
Message-Id: <20250407101719.3350996-33-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c         | 11 +++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 38 +++++++++++++++++++++++++++---
 3 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c337790c81ae..fe78f6da7054 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1573,6 +1573,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
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
@@ -1581,7 +1587,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1593,8 +1599,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f1d4daf90efe..189e97113dbe 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3104,9 +3104,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
 					    false);
-		if (!err && !xe_vma_has_no_bo(vma))
-			err = xe_bo_migrate(xe_vma_bo(vma),
+		if (!err && !xe_vma_has_no_bo(vma)) {
+			struct xe_bo *bo = xe_vma_bo(vma);
+
+			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
+			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
+				region = 1;
+
+			err = xe_bo_migrate(bo,
 					    region_to_mem_type[region]);
+		}
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index f4e0545937b0..bbae2faee603 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -87,16 +87,48 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			  struct xe_vma **vmas, int num_vmas,
 			  struct drm_xe_madvise_ops ops)
 {
-	int i;
+	struct xe_bo *bo;
+	int err, i;
 
 	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
 	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
 		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
 	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);
 
-	for (i = 0; i < num_vmas; i++)
+	for (i = 0; i < num_vmas; i++) {
 		vmas[i]->attr.atomic_access = ops.atomic.val;
-	/*TODO: handle bo backed vmas */
+
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				     !(bo->flags & XE_BO_FLAG_VRAM1)))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				      (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				      !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return -EINVAL;
+
+		err = xe_bo_lock(bo, true);
+		if (err)
+			return err;
+		bo->attr.atomic_access = ops.atomic.val;
+
+		/* Invalidate cpu page table, so bo can migrate to smem in next access */
+		if (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
+		    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL)
+			ttm_bo_unmap_virtual(&bo->ttm);
+
+		xe_bo_unlock(bo);
+	}
 	return 0;
 }
 
-- 
2.34.1

