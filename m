Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A7BFCD0BE
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C639B10E6A5;
	Wed, 18 Mar 2026 07:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CD/QwG9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3751910E2E9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817826; x=1805353826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kkWcX8sia6AOl+hE2igaVdWkDBys8e2nN0npVSC3ORc=;
 b=CD/QwG9V/o67Nv1iDzjKRrMiKMyZtmyMm/qpCK89vn9ZNS8RDUSeL4FI
 v4FRBBve32pn+wZLfD4aawXH8lsCB5e67F8xmb/8lEA9haSJHDM5cIZcN
 MVpo+BcVQiq+bbVv/qu+VEMlUKvdN44YDOMvXk20Yl42bXBRmh6+Fb1g2
 S8+ru4tMdBMgvJ/FOzW5tTe3kw8/gsJs9yBzvhXc1M0LPs/Idaz9KIDFy
 a0wlrYI/ieodgABaPJDet7sZel7JdxlRds7pzBte5PV5bsS8FgD3vm4ER
 QqgKwWPUQfY5OyMS8Io5Pu5DxFzJAYn8wA28cr6BSxOA5RokwuYhVZ/CD g==;
X-CSE-ConnectionGUID: NbtJVY5lQUyzTEGPwZ6MUw==
X-CSE-MsgGUID: StEaW+XsRWiAbBPD9SxrlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764268"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:26 -0700
X-CSE-ConnectionGUID: IYYllk/kTCWbevjGzHnVNQ==
X-CSE-MsgGUID: +jKm8stsSaKWGBvB9Pm+dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424052"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:24 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 08/15] drm/xe: Implement xe_access_counter_queue_work
Date: Wed, 18 Mar 2026 13:14:49 +0530
Message-Id: <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Implement worker function to dequeue and process access counter
notifications and migrate bo based vma to vram and rebind it.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_access_counter.c | 139 ++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
index a2ce9dc45d05..9eb9917d8da7 100644
--- a/drivers/gpu/drm/xe/xe_access_counter.c
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -11,7 +11,10 @@
 #include "xe_access_counter.h"
 #include "xe_access_counter_types.h"
 #include "xe_device.h"
+#include "xe_gt_printk.h"
+#include "xe_hw_engine.h"
 #include "xe_usm_queue.h"
+#include "xe_vm.h"
 
 /**
  * DOC: Xe access counters
@@ -33,9 +36,143 @@ static int xe_access_counter_entry_size(void)
 	return roundup_pow_of_two(sizeof(struct xe_access_counter));
 }
 
+static int xe_access_counter_sub_granularity_in_byte(int val)
+{
+	return xe_access_counter_granularity_in_byte(val) / 32;
+}
+
+static struct xe_vma *xe_access_counter_get_vma(struct xe_vm *vm,
+						struct xe_access_counter *ac)
+{
+	u64 page_va;
+
+	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K) {
+		page_va = ac->consumer.va_range_base;
+	} else {
+		page_va = ac->consumer.va_range_base +
+			  (ffs(ac->consumer.sub_granularity) - 1) *
+			  xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
+	}
+
+	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
+}
+
+static void xe_access_counter_print(struct xe_access_counter *ac)
+{
+	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
+		  "\tVA Range Base: 0x%08x%08x\n"
+		  "\tCounter Type: %d\n"
+		  "\tGranularity: %d\n"
+		  "\tSub-Granularity: 0x%08x\n"
+		  "\tEngineClass: %d %s\n"
+		  "\tEngineInstance: %d\n",
+		  ac->consumer.xe3.asid,
+		  upper_32_bits(ac->consumer.va_range_base),
+		  lower_32_bits(ac->consumer.va_range_base),
+		  ac->consumer.counter_type,
+		  ac->consumer.granularity,
+		  ac->consumer.sub_granularity,
+		  ac->consumer.xe3.engine_class,
+		  xe_hw_engine_class_to_str(ac->consumer.xe3.engine_class),
+		  ac->consumer.xe3.engine_instance);
+}
+
+static int xe_access_counter_service(struct xe_access_counter *ac)
+{
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
+	if (ac->consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
+		return -EINVAL;
+
+	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.xe3.asid);
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
+	vma = xe_access_counter_get_vma(vm, ac);
+	if (!vma) {
+		err = -EINVAL;
+		goto unlock_vm;
+	}
+
+	/* TODO: Handle svm vma's  */
+	if (xe_vma_has_no_bo(vma))
+		goto unlock_vm;
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
+	if (!err && !IS_ERR(fence)) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
+
+	xe_validation_ctx_fini(&ctx);
+
+unlock_vm:
+	up_write(&vm->lock);
+	xe_vm_put(vm);
+
+	return err;
+}
+
 static void xe_access_counter_queue_work_func(struct work_struct *w)
 {
-	/* TODO: Implement */
+	struct xe_usm_queue *ac_queue =
+		container_of(w, typeof(*ac_queue), worker);
+	struct xe_access_counter ac = {};
+	unsigned long threshold;
+
+#define USM_QUEUE_MAX_RUNTIME_MS	20
+	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
+
+	while (xe_usm_queue_pop(ac_queue, &ac, xe_access_counter_entry_size())) {
+		int err;
+
+		if (!ac.gt)	/* Access counter squashed during reset */
+			continue;
+
+		err = xe_access_counter_service(&ac);
+		if (err) {
+			xe_access_counter_print(&ac);
+			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
+				  ERR_PTR(err));
+		}
+
+		if (time_after(jiffies, threshold) &&
+		    ac_queue->tail != ac_queue->head) {
+			queue_work(gt_to_xe(ac.gt)->usm.pf_wq, w);
+			break;
+		}
+	}
+#undef USM_QUEUE_MAX_RUNTIME_MS
 }
 
 static int xe_access_counter_queue_init(struct xe_device *xe,
-- 
2.34.1

