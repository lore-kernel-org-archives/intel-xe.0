Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08604C83F0C
	for <intel-xe@archiver.kernel.org>; Sat, 26 Aug 2023 00:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F04A10E6F1;
	Sat, 26 Aug 2023 00:14:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D3110E6F1
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Aug 2023 00:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693008859; x=1724544859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rDVl392AquIr5Tq2UrKy//P8p1JkHOTpfTxgtmIOK9Y=;
 b=iPEZuG81TYBgoFJJOE27s81RF1U/bIKcHj6jl75eiFrXf+fd9q07WjXQ
 RsEUildH2gKJiPs1ceIiehfBpFoBcwb5BvRRwYnVX/87PV/7DkQzBVbwk
 c8or4+1Fiw9VxBbjYcWCiVhMUuInEqjSPvoWpv3n88hsEAJ4UuHWkGFPC
 XUIIFeOLGKiRwUAr8YW/kkjroXgJWHFCUXtzEpv0L81UdcHEGG30Nx132
 /RWNxf+Tb8PfLyqMypS+jmpWd12qGc1DYNFMSf3jI1QC90KYf5TA60Vnn
 Dd0bn3hwBfb3yJr+OrZ6E7DLh8uOR6zggRqOrWpipHrCD9srj7R8CZaVI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373702165"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; d="scan'208";a="373702165"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 17:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="803122316"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; d="scan'208";a="803122316"
Received: from dut731pvc.fm.intel.com ([10.1.40.30])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 17:14:19 -0700
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 26 Aug 2023 00:14:12 +0000
Message-Id: <20230826001412.6949-1-yu.bruce.chang@intel.com>
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

i915 can use scratch page even when page fault is enabled, this patch
is trying to port this feature over.

The current i915 solution changes page table directly which may be hard
to make to upstream, so a more complex solution is needed to apply to the
current Xe framework if following the existing i915 solution.

This patch is trying to make the minimum impact to the existing driver,
but still enable the scratch page support.

So, the idea is to bind a scratch vma if the page fault is from an
invalid access. This patch is taking advantage of null pte at this
point, we may introduce a special vma for scratch vma if needed.
After the bind, the user app can continue to run without causing a
fatal failure or reset and stop.

In case the app will bind this scratch vma to a valid address, it will
fail the bind, this patch will handle the failre and unbind the scrach
vma[s], so that the user binding will be retried to the valid address.

This patch only kicks in when there is a failure for both page fault
and bind, so it should has no impact to the exiating code path. On
another hand, it uses actual page tables instead of special scratch
page tables, so it enables potential not to invalidate TLBs when doing
unbind if all upper layer page tables are still being used.

tested on new scratch igt tests which will be sent out for review.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++++--
 drivers/gpu/drm/xe/xe_vm.c           | 48 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.h           |  2 ++
 3 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index b6f781b3d9d7..524b38df3d7a 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -137,8 +137,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	write_locked = true;
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
-		ret = -EINVAL;
-		goto unlock_vm;
+		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
+			vma = xe_bind_scratch_vma(vm, pf->page_addr, SZ_64K);
+
+		if (!vma) {
+			ret = -EINVAL;
+			goto unlock_vm;
+		}
 	}
 
 	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 389ac5ba8ddf..4c3d5d781b58 100644
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
@@ -2783,6 +2780,39 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 	return err;
 }
 
+struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size)
+{
+	struct xe_vma *vma = 0;
+
+	if (!vm->size)
+		return 0;
+
+	vma = xe_vma_create(vm, NULL, 0, addr, addr + size - 1, false, true, 0);
+	if (!vma)
+		return 0;
+	xe_vm_insert_vma(vm, vma);
+
+	/* fault will handle the bind */
+
+	return vma;
+}
+
+int xe_unbind_scratch_vma(struct xe_vm *vm, u64 addr, u64 range)
+{
+	struct xe_vma *vma;
+
+	vma = xe_vm_find_overlapping_vma(vm, addr, range);
+	if (!vma)
+		return -ENXIO;
+
+	if (xe_vma_is_null(vma)) {
+		prep_vma_destroy(vm, vma, true);
+		xe_vm_unbind(vm, vma, NULL, NULL, 0, NULL, true, false);
+	}
+
+	return 0;
+}
+
 static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	int ret = 0;
@@ -3205,7 +3235,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
 	if (err)
 		return err;
-
 	if (args->exec_queue_id) {
 		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
 		if (XE_IOCTL_DBG(xe, !q)) {
@@ -3352,10 +3381,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
-
+retry:
 		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
-		if (err)
+		if (err) {
+			if (!xe_unbind_scratch_vma(vm, addr, range))
+				goto retry;
 			goto free_syncs;
+		}
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6de6e3edb24a..6447bed427b1 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -212,6 +212,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
+struct xe_vma *xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size);
+
 /*
  * XE_ONSTACK_TV is used to size the tv_onstack array that is input
  * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
-- 
2.25.1

