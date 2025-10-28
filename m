Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D725CCF9EF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 03:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5B910E1E1;
	Tue, 28 Oct 2025 03:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZESNWmMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B0410E27C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 03:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761623929; x=1793159929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kCOOijCHQLdl5kI08u13mdO+PKYkJa8C06SdK+GsWg4=;
 b=ZESNWmMoteLJ/748KdHBmhjD5OubYzkFbbSx1eshjVaCxPI5kw0EizFu
 iAdmnukuUMDhE629iJ06rqmuLY9b3vSjuJpdUA70+q68JMm3PX8emWfL3
 8KtpK42K2k0eOlgbvTVEgcXYPBnP06FDjETKsaI/4FgZs5QkJpnc2WOGQ
 xcEmqksoa9AFuI8/msyV1zeMyJvJ7EtdKi9hBE9DkEr3WACRvRsYod3IZ
 XDf2HP+RAIRhOs5x13Oy4u6bQ2jzxHNukQ9UQfY7l4E400ByExFVk8RQL
 ePAA+UME/YN7zEMjN3tCBK7ZpwDykbpCkWodKDYxH0QS7Mep+yFv7/5M0 g==;
X-CSE-ConnectionGUID: kt8mWgAMSfeVZuVt9pFCNg==
X-CSE-MsgGUID: nmjoD/OoR3yHNJZ1xfBuXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67550955"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67550955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:47 -0700
X-CSE-ConnectionGUID: 60yaSAimSoC9lEbUw94VBQ==
X-CSE-MsgGUID: y06Oh2/vTP6F/gnybvnH8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184461076"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 20:58:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v3 5/7] drm/xe: Implement xe_pagefault_queue_work
Date: Mon, 27 Oct 2025 20:58:41 -0700
Message-Id: <20251028035843.2488613-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028035843.2488613-1-matthew.brost@intel.com>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
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

Implement a worker that services page faults, using the same
implementation as in xe_gt_pagefault.c.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 235 +++++++++++++++++++++++++++++-
 1 file changed, 234 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 6a4f34328d3c..e173544fa57a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -5,12 +5,20 @@
 
 #include <linux/circ_buf.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
+#include "xe_gt_stats.h"
+#include "xe_hw_engine.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_svm.h"
+#include "xe_trace_bo.h"
+#include "xe_vm.h"
 
 /**
  * DOC: Xe page faults
@@ -32,9 +40,234 @@ static int xe_pagefault_entry_size(void)
 	return roundup_pow_of_two(sizeof(struct xe_pagefault));
 }
 
+static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
+			      struct xe_vram_region *vram, bool need_vram_move)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	int err;
+
+	err = xe_vm_lock_vma(exec, vma);
+	if (err)
+		return err;
+
+	if (!bo)
+		return 0;
+
+	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
+		xe_bo_validate(bo, vm, true, exec);
+}
+
+static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
+				   bool atomic)
+{
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct dma_fence *fence;
+	int err, needs_vram;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
+		return needs_vram < 0 ? needs_vram : -EACCES;
+
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
+			 xe_vma_size(vma) / SZ_1K);
+
+	trace_xe_vma_pagefault(vma);
+
+	/* Check if VMA is valid, opportunistic check only */
+	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
+					vma->tile_invalidated) && !atomic)
+		return 0;
+
+retry_userptr:
+	if (xe_vma_is_userptr(vma) &&
+	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
+		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+
+		err = xe_vma_userptr_pin_pages(uvma);
+		if (err)
+			return err;
+	}
+
+	/* Lock VM and BOs dma-resv */
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
+					 needs_vram == 1);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
+		if (err)
+			goto unlock_dma_resv;
+
+		/* Bind VMA only to the GT that has faulted */
+		trace_xe_vma_pf_bind(vma);
+		xe_vm_set_validation_exec(vm, &exec);
+		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
+		xe_vm_set_validation_exec(vm, NULL);
+		if (IS_ERR(fence)) {
+			err = PTR_ERR(fence);
+			xe_validation_retry_on_oom(&ctx, &err);
+			goto unlock_dma_resv;
+		}
+	}
+
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+unlock_dma_resv:
+	xe_validation_ctx_fini(&ctx);
+	if (err == -EAGAIN)
+		goto retry_userptr;
+
+	return err;
+}
+
+static bool
+xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
+{
+	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
+}
+
+static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
+{
+	struct xe_vm *vm;
+
+	down_read(&xe->usm.lock);
+	vm = xa_load(&xe->usm.asid_to_vm, asid);
+	if (vm && xe_vm_in_fault_mode(vm))
+		xe_vm_get(vm);
+	else
+		vm = ERR_PTR(-EINVAL);
+	up_read(&xe->usm.lock);
+
+	return vm;
+}
+
+static int xe_pagefault_service(struct xe_pagefault *pf)
+{
+	struct xe_gt *gt = pf->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_vm *vm;
+	struct xe_vma *vma = NULL;
+	int err;
+	bool atomic;
+
+	/* Producer flagged this fault to be nacked */
+	if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
+		return -EFAULT;
+
+	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
+
+	/*
+	 * TODO: Change to read lock? Using write lock for simplicity.
+	 */
+	down_write(&vm->lock);
+
+	if (xe_vm_is_closed(vm)) {
+		err = -ENOENT;
+		goto unlock_vm;
+	}
+
+	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
+	if (!vma) {
+		err = -EINVAL;
+		goto unlock_vm;
+	}
+
+	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
+
+	if (xe_vma_is_cpu_addr_mirror(vma))
+		err = xe_svm_handle_pagefault(vm, vma, gt,
+					      pf->consumer.page_addr, atomic);
+	else
+		err = xe_pagefault_handle_vma(gt, vma, atomic);
+
+unlock_vm:
+	if (!err)
+		vm->usm.last_fault_vma = vma;
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+
+	return err;
+}
+
+static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
+				   struct xe_pagefault *pf)
+{
+	bool found_fault = false;
+
+	spin_lock_irq(&pf_queue->lock);
+	if (pf_queue->tail != pf_queue->head) {
+		memcpy(pf, pf_queue->data + pf_queue->tail, sizeof(*pf));
+		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
+			pf_queue->size;
+		found_fault = true;
+	}
+	spin_unlock_irq(&pf_queue->lock);
+
+	return found_fault;
+}
+
+static void xe_pagefault_print(struct xe_pagefault *pf)
+{
+	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
+		  "\tFaulted Address: 0x%08x%08x\n"
+		  "\tFaultType: %d\n"
+		  "\tAccessType: %d\n"
+		  "\tFaultLevel: %d\n"
+		  "\tEngineClass: %d %s\n"
+		  "\tEngineInstance: %d\n",
+		  pf->consumer.asid,
+		  upper_32_bits(pf->consumer.page_addr),
+		  lower_32_bits(pf->consumer.page_addr),
+		  pf->consumer.fault_type,
+		  pf->consumer.access_type,
+		  pf->consumer.fault_level,
+		  pf->consumer.engine_class,
+		  xe_hw_engine_class_to_str(pf->consumer.engine_class),
+		  pf->consumer.engine_instance);
+}
+
 static void xe_pagefault_queue_work(struct work_struct *w)
 {
-	/* TODO: Implement */
+	struct xe_pagefault_queue *pf_queue =
+		container_of(w, typeof(*pf_queue), worker);
+	struct xe_pagefault pf;
+	unsigned long threshold;
+
+#define USM_QUEUE_MAX_RUNTIME_MS      20
+	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
+
+	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
+		int err;
+
+		if (!pf.gt)	/* Fault squashed during reset */
+			continue;
+
+		err = xe_pagefault_service(&pf);
+		if (err) {
+			xe_pagefault_print(&pf);
+			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
+				  ERR_PTR(err));
+		}
+
+		pf.producer.ops->ack_fault(&pf, err);
+
+		if (time_after(jiffies, threshold)) {
+			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
+			break;
+		}
+	}
+#undef USM_QUEUE_MAX_RUNTIME_MS
 }
 
 static int xe_pagefault_queue_init(struct xe_device *xe,
-- 
2.34.1

