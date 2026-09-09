Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE90C79FBF
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB79110F0FA;
	Wed,  9 Sep 2026 12:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0bNeBtf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831D810F114
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957723; x=1820493723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iPCwJ1IjLt2LEmM1QpSPLcCrJdHZ7MJkKFnQOcU5L5o=;
 b=B0bNeBtfpIlBv8nwaJKMf8j7fmc/JN8TNCB3WVkgXJfdxJILqGytBX3z
 zgpgkxM79zTMfwD9P0NMR40Z0xJj1Qoiz3pyW/msZyhOWDrX8+iqDapvs
 ZYtLTQbR9FEeUAi/4k1+4ZOdtwFf7zIy4xYSq1zRYdObBZdfd59MS3ZAp
 82w45JYKsIw8af/c1VZ4M5CoAxGEy2l1HebyULzmDeAqfse9WjxGGpvub
 v3KHxUkCU4OaTOidB5e/xOIBex/l3Sb3/4htKiwHFjHx6CAYPQmH3mAq3
 3oqUeHS1m3rs/0N9jzJDDI2Rk+iKfnoKf+DSuFqYUmS4ZRK5UAqH15kMU Q==;
X-CSE-ConnectionGUID: gMNjNCSCQN2zaXTjGTB0lA==
X-CSE-MsgGUID: uLJHw93ITKSHkMt6wfXsEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715531"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715531"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:03 -0700
X-CSE-ConnectionGUID: fxtjCzK+TCiarn1H2znZdA==
X-CSE-MsgGUID: ydgMLH8hT4yyBMr7CJD9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246597"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:02 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 09/21] drm/xe: Implement xe_access_counter_service
Date: Wed,  9 Sep 2026 18:15:03 +0530
Message-ID: <20260909124457.1610890-32-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Implement xe_access_counter_service() to look up the VM and VMA for an
access counter notification and rebind the VMA to VRAM.

Rather than waiting on the rebind fence under vm->lock, store it in
vma->ac_move_fence so the page-fault handler can wait on it before
checking xe_vm_has_valid_gpu_mapping(). Duplicate access counter events
for the same VMA are dropped if an unsignaled ac_move_fence is already
present. The fence is released in xe_vma_destroy_late() if the VMA is
destroyed before it signals.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 98 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pagefault.c      |  9 +++
 drivers/gpu/drm/xe/xe_vm.c             |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h       | 10 +++
 4 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index f54b4bd6cb2b..60595f93cd74 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -12,7 +12,9 @@
 #include "xe_access_counter_types.h"
 #include "xe_device.h"
 #include "xe_gt_printk.h"
+#include "xe_hw_engine.h"
 #include "xe_usm_queue.h"
+#include "xe_vm.h"
 
 /**
  * DOC: Xe access counters
@@ -29,10 +31,98 @@
  * xe_access_counter.c implements the consumer layer.
  */
 
+static void xe_access_counter_print(struct xe_access_counter *ac)
+{
+	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
+		  "\tVA: 0x%08x%08x\n"
+		  "\tCounter Type: %d\n"
+		  "\tGranularity: %d\n"
+		  "\tSub-Granularity: 0x%08x\n"
+		  "\tEngineClass: %d %s\n"
+		  "\tEngineInstance: %d\n",
+		  ac->consumer.asid,
+		  upper_32_bits(ac->consumer.page_va),
+		  lower_32_bits(ac->consumer.page_va),
+		  ac->consumer.counter_type,
+		  ac->consumer.granularity,
+		  ac->consumer.sub_granularity,
+		  ac->consumer.engine_class,
+		  xe_hw_engine_class_to_str(ac->consumer.engine_class),
+		  ac->consumer.engine_instance);
+}
+
 static int xe_access_counter_service(struct xe_access_counter *ac)
 {
-	/* TODO: Implement */
-	return 0;
+	struct xe_gt *gt = ac->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct dma_fence *fence;
+	struct xe_vm *vm;
+	struct xe_vma *vma;
+	int err = 0;
+
+	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
+
+	down_write(&vm->lock);
+
+	if (xe_vm_is_closed(vm)) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+	/* Lookup VMA */
+	vma = xe_vm_find_overlapping_vma(vm, ac->consumer.page_va, SZ_4K);
+	if (!vma) {
+		err = -EINVAL;
+		goto unlock_vm;
+	}
+
+	/* TODO: Handle svm vma's  */
+	if (xe_vma_has_no_bo(vma))
+		goto unlock_vm;
+
+	/* Drop duplicate event if migration/rebind is already in-flight */
+	if (vma->ac_move_fence && !dma_fence_is_signaled(vma->ac_move_fence))
+		goto unlock_vm;
+
+	/* Previous migration completed; release its fence before starting a new one */
+	dma_fence_put(vma->ac_move_fence);
+	vma->ac_move_fence = NULL;
+
+	/* Lock VM and BOs dma-resv */
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
+	drm_exec_until_all_locked(&exec) {
+		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram, true);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
+		if (err)
+			break;
+
+		xe_vm_set_validation_exec(vm, &exec);
+		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
+		xe_vm_set_validation_exec(vm, NULL);
+		if (IS_ERR(fence))
+			err = PTR_ERR(fence);
+	}
+
+	/*
+	 * Migrations and binds are pipelined GPU operations with no H2G ack;
+	 * store the fence on the VMA so the page-fault handler can wait on it
+	 * if needed, rather than blocking here under vm->lock.
+	 */
+	if (!err && !IS_ERR(fence))
+		vma->ac_move_fence = fence;
+
+	xe_validation_ctx_fini(&ctx);
+
+unlock_vm:
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+
+	return err;
 }
 
 static void xe_access_counter_queue_work_func(struct work_struct *w)
@@ -48,9 +138,11 @@ static void xe_access_counter_queue_work_func(struct work_struct *w)
 	if (ac.gt) {	/* Skip if access counter was squashed during reset */
 		int err = xe_access_counter_service(&ac);
 
-		if (err)
+		if (err) {
+			xe_access_counter_print(&ac);
 			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
 				  ERR_PTR(err));
+		}
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index f4b0c0e5113a..77e357384872 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -136,6 +136,15 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	trace_xe_vma_pagefault(vma);
 
 	guard(mutex)(&vma->fault_lock);
+	/*
+	 * If an access-counter triggered migration is in-flight, wait for it
+	 * to complete before checking whether the GPU mapping is already valid.
+	 */
+	if (vma->ac_move_fence) {
+		dma_fence_wait(vma->ac_move_fence, false);
+		dma_fence_put(vma->ac_move_fence);
+		vma->ac_move_fence = NULL;
+	}
 
 	/* Check if VMA is valid, opportunistic check only */
 	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7dd8fbf94bc8..68adb2a7422c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1219,6 +1219,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		vma->ufence = NULL;
 	}
 
+	dma_fence_put(vma->ac_move_fence);
+
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 648031e64145..a21f73f23c59 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -175,6 +175,16 @@ struct xe_vma {
 	 */
 	struct xe_user_fence *ufence;
 
+	/**
+	 * @ac_move_fence: Fence for an in-progress access-counter triggered
+	 * migration/rebind. Written by the AC service and read+cleared by the
+	 * page-fault handler, both under down_read(&vm->lock) + @fault_lock;
+	 * any access under the read lock MUST also hold @fault_lock. The final
+	 * put on VMA destroy (xe_vma_destroy_late()) is unlocked - safe as no
+	 * other reference to the VMA remains.
+	 */
+	struct dma_fence *ac_move_fence;
+
 	/**
 	 * @attr: The attributes of vma which determines the migration policy
 	 * and encoding of the PTEs for this vma.
-- 
2.43.0

