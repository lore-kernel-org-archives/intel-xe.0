Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA08C61DB2
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6113F10E550;
	Tue, 27 May 2025 16:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYklKQCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450D910E527
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362520; x=1779898520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDzMBvUxUzMOgZr0DyRi3wAvwM3rpxXkkXbsjRBTRU4=;
 b=QYklKQCbpF2I1EyQCcMgiFguhNZdoNvCYPDQlN+AjhwKdNrmW5wHrr/k
 2sbEIxacKGJeGsYzKFAuzJa/A5/OCe+Cy+NH1cKoFsVha8mllpCua5AJx
 TObfhgjCjca7R3ghzuowqszXWFVKHpLgfI+Dz/IWODETpvSxGG5o8Z+X/
 aUJgiuVNXL3IodnpnjIo99xlz+t/SKgXHtJUXxFlNZOvpw+NspRMGmcMR
 7xdtJ9VF08rB7McFsE+t3CZ0YfgdtvEIJ/XHBeS4U93VQrPrURjx51QAT
 jimFgKtYbStz0uGOtyxmOpJc/3m8wjiPhEtQr1Obbx/HFCBDbD67vq8Ej A==;
X-CSE-ConnectionGUID: XH532oU6QlavsJ/vStOgxQ==
X-CSE-MsgGUID: A+3LYJWATK+fg4ok/SaH4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471937"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471937"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:49 -0700
X-CSE-ConnectionGUID: 1g4JmENJRMKH1AkIsOp3CQ==
X-CSE-MsgGUID: 7f5sUoW7R2K4PcIR1c38sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646237"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 19/19] drm/xe/bo: Update atomic_access attribute on madvise
Date: Tue, 27 May 2025 22:10:03 +0530
Message-Id: <20250527164003.1068118-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 45 ++++++++++++++++++++++++++++--
 3 files changed, 69 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..9072e8ae3f3e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1662,6 +1662,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
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
@@ -1670,7 +1676,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1682,8 +1688,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
index 9611d7ca2bed..1bdf85c12374 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3116,9 +3116,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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
index 0f0b94cb43f2..e048eb48826c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -82,15 +82,54 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			  struct xe_vma **vmas, int num_vmas,
 			  struct drm_xe_madvise_ops ops)
 {
-	int i;
+	struct xe_bo *bo;
+	int err, i;
 
 	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
 	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
 		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
 
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
+		/* NOTE: The following atomic checks are platform-specific. For example,
+		 * if a device supports CXL atomics, these may not be necessary or
+		 * may behave differently.
+		 */
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
+				   xe->info.has_device_atomics_on_smem)))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return -EINVAL;
+
+		err = xe_bo_lock(bo, true);
+		if (err)
+			return err;
+		bo->attr.atomic_access = ops.atomic.val;
+
+		/* Invalidate cpu page table, so bo can migrate to smem in next access */
+		if (xe_bo_is_vram(bo) &&
+		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
+		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
+			ttm_bo_unmap_virtual(&bo->ttm);
+
+		xe_bo_unlock(bo);
+	}
 	return 0;
 }
 
-- 
2.34.1

