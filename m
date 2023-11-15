Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F69C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 00:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C4710E23B;
	Wed, 15 Nov 2023 00:56:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B43F10E235
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 00:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700009772; x=1731545772;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CUav6S6549O3UK1FcroLrKz+ldl7Yj+BXoEPtrwUJqM=;
 b=GoI31TuZQkwtlDB26zgBQfauWkXLV82DyH3ZK3oh2V18eBJY/dmW3zZv
 Qquurv2dqfRqkQv/ctgXnk++COeEGikRJX+1jQfm+v9IsVW087q0UdB3z
 e4WWYzgkcQMv3/73F1k93mQarLcED018hVvHzj1Qoc/fFd5sRNtu7o5LU
 hfeX5/iEelO9SG/f82MgNupnzFiVW5txarifkIh53lMmW63FNrsGzcoTR
 A8BqHJej6+MSkgqtYvBlVApzV+cNaKlIFZjClifXUZEBJSe9zdjR54DCO
 DzHcwPYy8U6UwfPYwIw8HAo3lEVQVAN3oPyH0OxFu3Y0QAdmPJHt3XZv3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381176948"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="381176948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="6244247"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 16:56:11 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 16:56:11 -0800
Message-Id: <20231115005611.29266-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4] drm/xe: Extend scratch page support to fault
 mode
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

The PVC HW has a limitation that the page fault due to invalid access
will halt the corresponding EUs. So, in order to activate the debugger,
kmd needs to setup the scratch pages to unhalt the EUs.

This feature can only be enabled if scratch flag is set per VM during
VM_CREATE. For use with EU debugger, the debugger umd will set the flag.

The idea is to bind a scratch vma if the page fault is from an invalid
access. This patch is taking advantage of null pte. After the bind, the
user application can continue to run without causing a GPU hang or reset.

In case the app will bind this scratch vma to a valid address, GPUVA
handles all of this (e.g. it will create ops to unbind the old VMA and
bind the new one).
Future optimization: as we use null pte, it may not require to invalidate
TLBs when doing unbind if all upper layer page tables are unmodified.

v2: per Matt's suggestion, remove the scratch page unbind.
v3: correct error handlings.
v4: add test for XE_VM_FLAG_64K, and ALIGN_DOWN the address

Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
Reviewed-by: Brian Welty <brian.welty@intel.com>
Acked-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++++--
 drivers/gpu/drm/xe/xe_vm.c           | 42 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.h           |  2 ++
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 5b3585e2c125..91ad843713a6 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -161,8 +161,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	write_locked = true;
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
-		ret = -EINVAL;
-		goto unlock_vm;
+		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
+			vma = xe_vm_create_scratch_vma(vm, pf->page_addr);
+
+		if (IS_ERR_OR_NULL(vma)) {
+			ret = -EINVAL;
+			goto unlock_vm;
+		}
 	}
 
 	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d45f4f1d490f..191a1d2e9835 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1397,7 +1397,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		}
 	}
 
-	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
+	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
+	    !(flags & XE_VM_FLAG_FAULT_MODE)) {
+		/*
+		 * Create a global scratch page for mapping the whole VM's
+		 * address space. However, in fault mode, we instead defer
+		 * creation of scratch (null pte) to the fault handler.
+		 */
 		for_each_tile(tile, xe, id) {
 			if (!vm->pt_root[id])
 				continue;
@@ -1951,10 +1957,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
@@ -3269,6 +3271,36 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return 0;
 }
 
+struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma *vma;
+	u64 end;
+	int err;
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return ERR_PTR(-ENOENT);
+
+	if (vm->flags & XE_VM_FLAG_64K) {
+		addr = ALIGN_DOWN(addr, SZ_64K);
+		end = addr + SZ_64K - 1;
+	} else {
+		end = addr + PAGE_SIZE - 1;
+	}
+	vma = xe_vma_create(vm, NULL, 0, addr, end, false, true, 0);
+	if (IS_ERR_OR_NULL(vma))
+		return vma;
+
+	err = xe_vm_insert_vma(vm, vma);
+	if (err) {
+		xe_vma_destroy_late(vma);
+		return ERR_PTR(err);
+	}
+
+	/* fault will handle the bind */
+
+	return vma;
+}
+
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 {
 	struct drm_gpuva *gpuva;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b08c75fbd8a1..e07ced37223d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -180,6 +180,8 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
+struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr);
+
 extern struct ttm_device_funcs xe_ttm_funcs;
 
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
-- 
2.38.0

