Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F434C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 21:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D537210E6E4;
	Tue, 14 May 2024 21:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/Xc8Urq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5FB10E6E4
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 21:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715723685; x=1747259685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vI4bLAXZilGKz3M/c8W+izw735XZLUBWoCmVdExNgoM=;
 b=X/Xc8Urq5mjuw66qBSEPa31WWp0RUItkishjlx9uMcCZV5Uv2rc4OXqM
 KeZ1KZRKcnQYLTkiBs6+XJCytArNLTFYw7LLlzCwnz28ipfhpIMzOSS/r
 hM6Co6qZyoOvZmH39LpXvlC7M51zWLaMn8wOrcbK4F+2VdjP9EScC7VwE
 uED2Ap6nRd4lLlSuFNcg2a55KpWholzTXRDplUMs5p+3YZfuRQNcpeoU1
 4+yIgjPljeixN8ciRNK/bs7B/0IO73nrBGnBYOqNfrl/7fSPAzhO4OIr8
 rqdeugeOEgtLIEtOPV1bLYRzkzJuOz1dR+lF/7CACPesbWqSDnnK6pmOv A==;
X-CSE-ConnectionGUID: UlR50zw9QySR3cHmb7Mp0A==
X-CSE-MsgGUID: mqew5YmbQ/CsMqOkgtEwWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11600139"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11600139"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 14:54:45 -0700
X-CSE-ConnectionGUID: Gyv+XH37STSsabQBh8M2eA==
X-CSE-MsgGUID: aeoJIaEmQtuAfGc9Nsm23Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35620804"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 14:54:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Rework GPU page fault handling
Date: Tue, 14 May 2024 14:55:23 -0700
Message-Id: <20240514215523.55065-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add helper function to implement VMA (user binding) page faults, remove
unnecessary userptr.invalidate_link list del operation, retry on memory
pressure, remove unnecessary xe_vma_userptr_check_repin after rebinding,
remove unnecessary TLB invalidation, and always use vm->lock in write
mode. Changes help facilitate SVM page faults.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 142 ++++++++++++---------------
 1 file changed, 62 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 040dd142c49c..eaf68f0135c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -125,126 +125,108 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	return 0;
 }
 
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
+				struct xe_vma *vma)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct drm_exec exec;
-	struct xe_vm *vm;
-	struct xe_vma *vma = NULL;
 	struct dma_fence *fence;
-	bool write_locked;
-	int ret = 0;
+	ktime_t end = 0;
+	int err;
 	bool atomic;
 
-	/* SW isn't expected to handle TRTT faults */
-	if (pf->trva_fault)
-		return -EFAULT;
-
-	/* ASID to VM */
-	mutex_lock(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
-	if (vm && xe_vm_in_fault_mode(vm))
-		xe_vm_get(vm);
-	else
-		vm = NULL;
-	mutex_unlock(&xe->usm.lock);
-	if (!vm)
-		return -EINVAL;
-
-retry_userptr:
-	/*
-	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
-	 * start out read-locked?
-	 */
-	down_write(&vm->lock);
-	write_locked = true;
-	vma = lookup_vma(vm, pf->page_addr);
-	if (!vma) {
-		ret = -EINVAL;
-		goto unlock_vm;
-	}
-
-	if (!xe_vma_is_userptr(vma) ||
-	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
-		downgrade_write(&vm->lock);
-		write_locked = false;
-	}
-
 	trace_xe_vma_pagefault(vma);
-
 	atomic = access_is_atomic(pf->access_type);
 
 	/* Check if VMA is valid */
 	if (vma_is_valid(tile, vma) && !atomic)
-		goto unlock_vm;
-
-	/* TODO: Validate fault */
+		return 0;
 
-	if (xe_vma_is_userptr(vma) && write_locked) {
+retry_userptr:
+	if (xe_vma_is_userptr(vma) &&
+	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_del_init(&uvma->userptr.invalidate_link);
-		spin_unlock(&vm->userptr.invalidated_lock);
-
-		ret = xe_vma_userptr_pin_pages(uvma);
-		if (ret)
-			goto unlock_vm;
-
-		downgrade_write(&vm->lock);
-		write_locked = false;
+		err = xe_vma_userptr_pin_pages(uvma);
+		if (err)
+			return err;
 	}
 
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->id);
 		drm_exec_retry_on_contention(&exec);
-		if (ret)
+		if (xe_vm_validate_should_retry(&exec, err, &end))
+			err = -EAGAIN;
+		if (err)
 			goto unlock_dma_resv;
 
 		/* Bind VMA only to the GT that has faulted */
 		trace_xe_vma_pf_bind(vma);
 		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
 		if (IS_ERR(fence)) {
-			ret = PTR_ERR(fence);
+			err = PTR_ERR(fence);
+			if (xe_vm_validate_should_retry(&exec, err, &end))
+				err = -EAGAIN;
 			goto unlock_dma_resv;
 		}
 	}
 
-	/*
-	 * XXX: Should we drop the lock before waiting? This only helps if doing
-	 * GPU binds which is currently only done if we have to wait for more
-	 * than 10ms on a move.
-	 */
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
-
-	if (xe_vma_is_userptr(vma))
-		ret = xe_vma_userptr_check_repin(to_userptr_vma(vma));
 	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
 	drm_exec_fini(&exec);
-unlock_vm:
-	if (!ret)
-		vm->usm.last_fault_vma = vma;
-	if (write_locked)
-		up_write(&vm->lock);
-	else
-		up_read(&vm->lock);
-	if (ret == -EAGAIN)
+	if (err == -EAGAIN)
 		goto retry_userptr;
 
-	if (!ret) {
-		ret = xe_gt_tlb_invalidation_vma(gt, NULL, vma);
-		if (ret >= 0)
-			ret = 0;
+	return err;
+}
+
+static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_vm *vm;
+	struct xe_vma *vma = NULL;
+	int err;
+
+	/* SW isn't expected to handle TRTT faults */
+	if (pf->trva_fault)
+		return -EFAULT;
+
+	/* ASID to VM */
+	mutex_lock(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
+	if (vm && xe_vm_in_fault_mode(vm))
+		xe_vm_get(vm);
+	else
+		vm = NULL;
+	mutex_unlock(&xe->usm.lock);
+	if (!vm)
+		return -EINVAL;
+
+	/*
+	 * TODO: Change to read lock? Using write lock for simplicity.
+	 */
+	down_write(&vm->lock);
+	vma = lookup_vma(vm, pf->page_addr);
+	if (!vma) {
+		err = -EINVAL;
+		goto unlock_vm;
 	}
+
+	err = handle_vma_pagefault(tile, pf, vma);
+
+unlock_vm:
+	if (!err)
+		vm->usm.last_fault_vma = vma;
+	up_write(&vm->lock);
 	xe_vm_put(vm);
 
-	return ret;
+	return err;
 }
 
 static int send_pagefault_reply(struct xe_guc *guc,
-- 
2.34.1

