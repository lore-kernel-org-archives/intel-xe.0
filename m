Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F5C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 23:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA44510E4A5;
	Tue, 29 Aug 2023 23:16:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4452710E4B1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 23:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693351016; x=1724887016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hHD+qlwszoOIg6hbveZpUk39pMa0KJUkcD0trS5yMIA=;
 b=Dpfv2vzHSBjGX6IjX/kIDf8gxpobWPDvJMysQmES1E8/4XNWv8t8qd1i
 nKtHSLLtEX7O9oJxPCKY/iEi+wFrx+kUt115UDQMFRz22G8rVoo9IUZBS
 AUGOorVCHKxqRq6kSdSjXG4SKSvDzVVTGJiJWq/PNKmSpg0Hpos4qquR5
 9nrQw4gMsAR9BDONLfrfzOUck94xqsOpHPIhEaXpQUzVCYP+1s5gsgbs/
 xPqbV8zZuQk+McWxgG4PO3N6FefcP86QzPZPjXYDoJumPefiBZ5Ytz36N
 efJGmLLRGXwDCsWk9qZBK4UnPa5T21raKYzLFNddhKzVWTweBoh2fP+yn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461878572"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="461878572"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 16:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732383271"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="732383271"
Received: from dut731pvc.fm.intel.com ([10.1.40.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 16:16:53 -0700
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 23:16:48 +0000
Message-Id: <20230829231648.4438-1-yu.bruce.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault is
 enabled
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
Cc: Stuart Summers <stuart.summers@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The PVC HW has a limitation that the page fault due to invalid access
will halt the corresponding EUs. So, in order to activate the debugger,
kmd needs to setup the scratch pages to unhalt the EUs.

This feature can only be enabled if scratch flag is set per VM. So, once
EU debugger is running, the debugger umd will set the scratch flag,
otherwise, this flag should not be set. So, in regular run, this feature
will not be activated.

The idea is to bind a scratch vma if the page fault is from an
invalid access. This patch is taking advantage of null pte.
After the bind, the user app can continue to run without causing a
fatal failure or reset and stop.

In case the app will bind this scratch vma to a valid address, GPUVA
handles all of this (e.g. it will create ops to unbind the old
VMA, bind the new one).

This patch only kicks in when there is a failure for both page fault
and bind, so it should have no impact to regular code path. On
another hand, it uses actual page tables instead of special scratch
page tables, so it may not require to invalidate TLBs when doing
unbind if all upper layer page tables are still being used.

tested on new scratch igt tests which will be sent out for review.

v2: per Matt's suggestion, remove the scratch page unbind.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 +++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 24 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.h           |  2 ++
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index b6f781b3d9d7..adfd2206b942 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -137,8 +137,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	write_locked = true;
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
-		ret = -EINVAL;
-		goto unlock_vm;
+		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
+			vma = xe_vm_create_scratch_vma(vm, pf->page_addr);
+
+		if (!vma) {
+			ret = -EINVAL;
+			goto unlock_vm;
+		}
 	}
 
 	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 389ac5ba8ddf..5190807089e8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1262,7 +1262,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		}
 	}
 
-	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
+	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
+	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
 		for_each_tile(tile, xe, id) {
 			if (!vm->pt_root[id])
 				continue;
@@ -1998,10 +1999,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
@@ -2783,6 +2780,23 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 	return err;
 }
 
+struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma *vma = 0;
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return ERR_PTR(-ENOENT);
+
+	vma = xe_vma_create(vm, NULL, 0, addr, addr + SZ_64K - 1, false, true, 0);
+	if (!vma)
+		return 0;
+	XE_WARN_ON(xe_vm_insert_vma(vm, vma));
+
+	/* fault will handle the bind */
+
+	return vma;
+}
+
 static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6de6e3edb24a..ddd387333cd2 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -212,6 +212,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
+struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr);
+
 /*
  * XE_ONSTACK_TV is used to size the tv_onstack array that is input
  * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
-- 
2.25.1

