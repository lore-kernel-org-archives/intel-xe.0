Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFFBEB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 22:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B2810E0F7;
	Mon, 10 Jul 2023 22:07:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE010E0F7
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 22:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689026826; x=1720562826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hoGQEcKdb7zog/ypwYtmNbbEtHrKrqCoHWlRsu13O50=;
 b=kBUVJ9JI0VaNeTYWT8KnCPU8P8b0zDBkq4b9GRNmjwUIOky6yGB0dtxp
 qjRDjYvDUDX9hgzwYju8giy+Prsc/12YqOe3wPIBJcUInxqdtcgEgycpD
 NX8IZ/9ryzUrLtLSHjZqRs/ASs4XG+zI/x9bJMD10VZ5/RW8FaS6pU5eV
 esDlp8qAUzqJsRmK/BjJSiKRlWZpULax7GKYApinjUdVdXTV8KSMPWYyL
 BrXNr3LHVAS3cMEhsQcxkm6RZEFZ133UlotZ0xYlMK69k+vYxyTFbhqQw
 W20oip/Gye0qwhtn9XI1ZLcqmO2CdjmjpHZn7lXmhGGv0Ym9FCakH1kpz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344067299"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="344067299"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 15:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="810951234"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="810951234"
Received: from dut731-pvc.fm.intel.com ([10.1.40.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 15:07:05 -0700
From: "Chang, Bruce" <yu.bruce.chang@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 22:06:54 +0000
Message-Id: <20230710220654.323844-1-yu.bruce.chang@intel.com>
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
Cc: Oak Zeng <oak.zeng@intel.com>, Stuart Summers <stuart.summers@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is just a proposal and not fully tested yet. Once it is got
agreenment, more efforts needed to make it fully working, including igt
test changes.

i915 can use scratch page even when page fault is enabled, this patch
is trying to port this feature over.

The current i915 solution changes page table directly which may be hard to
make to upstream, so a more complex solution is needed to apply to the
current Xe framework if following the existing i915 solution.

This patch is trying to make the minimum impact to the existing driver,
but still enable the scratch page support.

So, the idea is to bind a scratch vma if the page fault is from an invalid
access. This patch is taking advantage of null pte at this point, we may
introduce a special vma for scratch vma if needed. After the bind, the user
app can continue to run without causing a fatal failure or reset and
stop.

In case the app will bind this scratch vma to a valid address, it will
fail the bind, this patch will handle the failre and unbind the scrach
vma[s], so that the user binding will be retried to the valid address.

This patch only kicks in when there is a failure for both page fault
and bind, so it should has no impact to the exiating code path. On
another hand, it uses actual page tables instead of special scratch
page tables, so it enables potential not to invalidate TLBs when doing
unbind if all upper layer page tables are still being used.

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  8 +++--
 drivers/gpu/drm/xe/xe_vm.c           | 52 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.h           |  2 ++
 3 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 6faebd02f3fb..01d316baf0e4 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -138,8 +138,12 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	write_locked = true;
 	vma = lookup_vma(vm, pf->page_addr);
 	if (!vma) {
-		ret = -EINVAL;
-		goto unlock_vm;
+		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
+			ret = xe_bind_scratch_vma(vm, pf->page_addr, SZ_64K);
+		else
+			ret = -EINVAL;
+		if (ret)
+			goto unlock_vm;
 	}
 
 	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dbff75a9087b..dc2d0cdfb0dc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1241,7 +1241,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		}
 	}
 
-	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
+	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
+	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
 		for_each_tile(tile, xe, id) {
 			if (!vm->pt_root[id])
 				continue;
@@ -1931,10 +1932,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
-	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
-			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
-		return -EINVAL;
-
 	if (XE_IOCTL_ERR(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
@@ -2603,6 +2600,44 @@ static int prep_replacement_vma(struct xe_vm *vm, struct xe_vma *vma)
 	return 0;
 }
 
+int xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size)
+{
+	struct xe_vma *vma;
+
+	if (!vm->size)
+		return -ENOMEM;
+
+	vma = xe_vma_create(vm, NULL, 0, addr, addr + size - 1, false, true, 0);
+	if (!vma)
+		return -ENOMEM;
+	xe_vm_insert_vma(vm, vma);
+
+	/*
+	 * fault will handle the bind
+	*/
+
+	return 0;
+}
+
+int xe_unbind_scratch_vma(struct xe_vm *vm, u64 addr, u64 range)
+{
+	struct xe_vma *vma, lookup;
+
+	lookup.start = addr;
+	lookup.end = addr + range - 1;
+
+	vma = xe_vm_find_overlapping_vma(vm, &lookup);
+	if (!vma)
+		return -ENXIO;
+
+	if (xe_vma_is_null(vma)) {
+		prep_vma_destroy(vm, vma);
+		xe_vm_unbind(vm, vma, NULL, NULL, 0, NULL);
+	}
+
+	return 0;
+}
+
 /*
  * Find all overlapping VMAs in lookup range and add to a list in the returned
  * VMA, all of VMAs found will be unbound. Also possibly add 2 new VMAs that
@@ -3220,10 +3255,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
-
+retry:
 		err = __vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
-		if (err)
+		if (err) {
+			if (!xe_unbind_scratch_vma(vm, addr, range))
+				goto retry;
 			goto release_vm_lock;
+		}
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 5edb7771629c..74f99b38f60d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -140,6 +140,8 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
 }
 
+int xe_bind_scratch_vma(struct xe_vm *vm, u64 addr, u64 size);
+
 /*
  * XE_ONSTACK_TV is used to size the tv_onstack array that is input
  * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
-- 
2.25.1

