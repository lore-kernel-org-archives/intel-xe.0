Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F68C28B2F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF210E991;
	Fri, 14 Mar 2025 07:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRwDpDdL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FF410E991
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937951; x=1773473951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dX+QVNN8pTguuGiyxcJ1bu8ylKGYz4ZdzcPDlsGkjdI=;
 b=DRwDpDdLi2P4dWNHEdhd5DB5/7jA6jf10iJmwLGZw6C5x28ZdbIoE/0l
 kKrT/5LJemHw3ZHyGAY1Qz7zd1XZ4HQVHQljjT/PvLkX7VbiQER9ljzLn
 a4GksAvINwSj7/Od+LcD73FsdGJAbKJnnNNCFHIFXCDtqr99xeNgjG0rh
 XeHUbskhurVdjKLP0nNXjXTq0g9ktESUO1Bzba0q7YHQoEs7jjxp52X+q
 5tdy8VXFkbwxr+ZsMorXxwduCcUE/BiucGxKtDTVMVRfVKNwzNWClP8i/
 x2Ozbgp0sx3QvJ8jx+/IzWRcwWls8tO5kYhfBONmbSfNNosYa9aHk/95a A==;
X-CSE-ConnectionGUID: 4c3bq1+qQOG8BpH4nPltnA==
X-CSE-MsgGUID: 5tJjFwgQQcevKKhXh9xCYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446174"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446174"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:39:11 -0700
X-CSE-ConnectionGUID: n8B78Ma1TASzgUeK9fuTrA==
X-CSE-MsgGUID: +/dsyokuQEy+I9zXMZT6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043932"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:39:08 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 29/29] drm/xe/bo : Update atomic_access attribute on madvise
Date: Fri, 14 Mar 2025 13:32:26 +0530
Message-Id: <20250314080226.2059819-30-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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
the migration to smem during a CPU fault.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c         | 11 +++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c | 38 +++++++++++++++++++++++++++---
 3 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 0c7a7f5e5596..0596348f7ff6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1329,6 +1329,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
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
@@ -1337,7 +1343,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1349,8 +1355,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
index 349481b13546..5e174b7d57e0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3069,9 +3069,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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

