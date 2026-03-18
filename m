Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B15710854DD
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 09:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EAF10E768;
	Wed, 18 Mar 2026 09:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2cWdAng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3B410E78F
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773827059; x=1805363059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G9F4+9q3dpxfQ9nkm7x8kxoh33c6Oj9CvcylnLcMgdc=;
 b=M2cWdAngEVKVqHHke5td4x9xaHNHqAaBuy6jKaop+K7t7kyiggkUS4LH
 9KsNLmcCUmuM3uIAC9cUcwKPCkxlG7zD3GXl3HtqcTt1/zwDuMuDKOVJl
 T1QweMIuA17C9srTNbKWRpi+qht/8aFQ5XYJec3bh9L8IhMdzVxfHv4FP
 29nZVAotMulhqAJV/hStybRQhcK9qy2ZqKEc3mPuJ7arItQ5W0F1BHFiT
 Fe2UataOt25c6imi4Z+t57iqF58NBXegDO+Qa37fiyyycGFkQDS96GgSJ
 4JW4yHf+v0vmp6CI8Ws3sZRqa5Jm+OOlINonaIW069b8nv13JdhBJwNEa A==;
X-CSE-ConnectionGUID: /L2da4K3Qx2a6yzIkYLgXA==
X-CSE-MsgGUID: 6t6fakOJREy+3Qafygdrqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92258314"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="92258314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:44:18 -0700
X-CSE-ConnectionGUID: C9Z7mjcZTCeqKHaF7aLuOg==
X-CSE-MsgGUID: ESJWGJo9S6ucmL0sFuymUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221808989"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa010.jf.intel.com with ESMTP; 18 Mar 2026 02:44:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] [CI-only]: v1: Squash of Access Counter
Date: Wed, 18 Mar 2026 15:49:16 +0530
Message-Id: <20260318101916.2865689-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

DO NOT REVIEW

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/Makefile                  |   4 +-
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h        |   2 +-
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h      |  10 +
 drivers/gpu/drm/xe/xe_access_counter.c       | 255 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_access_counter.c.new   | 115 +++++++++
 drivers/gpu/drm/xe/xe_access_counter.h       |  17 ++
 drivers/gpu/drm/xe/xe_access_counter_types.h | 123 +++++++++
 drivers/gpu/drm/xe/xe_device.c               |  30 +++
 drivers/gpu/drm/xe/xe_device.h               |   1 +
 drivers/gpu/drm/xe/xe_device_types.h         |   6 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  29 ++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   9 +
 drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
 drivers/gpu/drm/xe/xe_guc_access_counter.c   |  62 +++++
 drivers/gpu/drm/xe/xe_guc_access_counter.h   |  15 ++
 drivers/gpu/drm/xe/xe_guc_ct.c               |   4 +
 drivers/gpu/drm/xe/xe_lrc.c                  |  35 ++-
 drivers/gpu/drm/xe/xe_lrc.h                  |   5 +-
 drivers/gpu/drm/xe/xe_pagefault.c            |  79 +-----
 drivers/gpu/drm/xe/xe_pagefault_types.h      |  27 +-
 drivers/gpu/drm/xe/xe_pt.c                   |  11 +
 drivers/gpu/drm/xe/xe_svm.c                  |  59 +++--
 drivers/gpu/drm/xe/xe_svm.h                  |  20 ++
 drivers/gpu/drm/xe/xe_trace_bo.h             |  32 ++-
 drivers/gpu/drm/xe/xe_usm_queue.h            | 100 ++++++++
 drivers/gpu/drm/xe/xe_vm.c                   |  72 ++++++
 drivers/gpu/drm/xe/xe_vm.h                   |   6 +
 include/uapi/drm/xe_drm.h                    |  39 +++
 28 files changed, 1041 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.c.new
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_access_counter_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_access_counter.h
 create mode 100644 drivers/gpu/drm/xe/xe_usm_queue.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3a3f9f22d42a..296b3cba0b89 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -32,7 +32,8 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 
 # core driver code
 
-xe-y += xe_bb.o \
+xe-y += xe_access_counter.o \
+	xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
 	xe_dep_scheduler.o \
@@ -73,6 +74,7 @@ xe-y += xe_bb.o \
 	xe_guc_id_mgr.o \
 	xe_guc_klv_helpers.o \
 	xe_guc_log.o \
+	xe_guc_access_counter.o \
 	xe_guc_pagefault.o \
 	xe_guc_pc.o \
 	xe_guc_rc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 4d83461e538b..ace3cbcc13d8 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -28,11 +28,11 @@
 #define XE_GGTT_PTE_DM			BIT_ULL(1)
 #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
 #define XE_PPGTT_PTE_DM			BIT_ULL(11)
+#define XE_PPGTT_PTE_NC			BIT_ULL(5)
 #define XE_PDE_64K			BIT_ULL(6)
 #define XE_PTE_PS64			BIT_ULL(8)
 #define XE_PTE_NULL			BIT_ULL(9)
 
 #define XE_PAGE_PRESENT			BIT_ULL(0)
 #define XE_PAGE_RW			BIT_ULL(1)
-
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index b5eff383902c..35ee070059dd 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -40,4 +40,14 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+/* Fields for CTX_ACC_CTR_THOLD */
+#define ACC_TRIGGER_MASK		REG_GENMASK(15, 0)
+#define ACC_TRIGGER_VAL(x)		REG_FIELD_PREP(ACC_TRIGGER_MASK, x)
+#define ACC_NOTIFY_MASK			REG_GENMASK(31, 16)
+#define ACC_NOTIFY_VAL(x)		REG_FIELD_PREP(ACC_NOTIFY_MASK, x)
+
+/* Fields for CTX_ASID */
+#define ACC_GRANULARITY_MASK            REG_GENMASK(22, 20)
+#define ACC_GRANULARITY_VAL(x)          REG_FIELD_PREP(ACC_GRANULARITY_MASK, x)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
new file mode 100644
index 000000000000..ba15f21c6803
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/circ_buf.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_managed.h>
+
+#include "xe_access_counter.h"
+#include "xe_access_counter_types.h"
+#include "xe_device.h"
+#include "xe_gt_printk.h"
+#include "xe_hw_engine.h"
+#include "xe_svm.h"
+#include "xe_trace_bo.h"
+#include "xe_usm_queue.h"
+#include "xe_vm.h"
+
+/**
+ * DOC: Xe access counters
+ *
+ * Xe access counters are handled in two layers with one-way communication.
+ * The producer layer interacts with hardware or firmware to receive and parse
+ * access counter notifications into struct xe_access_counter, then forwards them
+ * to the consumer. The consumer layer services the notifications (e.g., memory
+ * migration hints, binding decisions). No acknowledgment is sent back to the
+ * producer. The consumer uses an access counter queue sized to absorb all potential
+ * notifications and a multi-threaded worker to process them. Multiple producers
+ * are supported, with a single shared consumer.
+ *
+ * xe_access_counter.c implements the consumer layer.
+ */
+
+static int xe_access_counter_entry_size(void)
+{
+	return roundup_pow_of_two(sizeof(struct xe_access_counter));
+}
+
+static int xe_access_counter_sub_granularity_in_byte(int val)
+{
+	return xe_access_counter_granularity_in_byte(val) / 32;
+}
+
+static u64 xe_access_counter_get_va(struct xe_access_counter *ac)
+{
+	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K)
+		return ac->consumer.va_range_base;
+
+	return ac->consumer.va_range_base +
+	       (ffs(ac->consumer.sub_granularity) - 1) *
+	       xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
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
+	u64 page_va;
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
+	page_va  = xe_access_counter_get_va(ac);
+	vma = xe_vm_find_vma_by_addr(vm, page_va);
+	if (!vma) {
+		err = -EINVAL;
+		goto unlock_vm;
+	}
+
+	trace_xe_vma_acc(vma, ac->consumer.counter_type);
+
+	if (xe_vma_has_no_bo(vma)) {
+		if (xe_vma_is_cpu_addr_mirror(vma))
+			err = xe_svm_range_setup(vm, vma, gt, page_va,
+						 false, true);
+		goto unlock_vm;
+	}
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
+static void xe_access_counter_queue_work_func(struct work_struct *w)
+{
+	struct xe_usm_queue *ac_queue =
+		container_of(w, typeof(*ac_queue), worker);
+	struct xe_access_counter ac = {};
+	unsigned long threshold;
+
+#define USM_QUEUE_MAX_RUNTIME_MS	20
+	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
+
+	while (xe_usm_queue_pop(ac_queue, &ac, sizeof(struct xe_access_counter))) {
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
+}
+
+static int xe_access_counter_queue_init(struct xe_device *xe,
+					struct xe_usm_queue *ac_queue)
+{
+	/*
+	 * Allocate a fixed-size queue for access counter notifications.
+	 * Size is determined based on hardware capabilities.
+	 */
+#define XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES	128
+	ac_queue->size = XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES *
+			 xe_access_counter_entry_size();
+#undef XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES
+
+	ac_queue->data = devm_kzalloc(xe->drm.dev, ac_queue->size, GFP_KERNEL);
+	if (!ac_queue->data)
+		return -ENOMEM;
+
+	spin_lock_init(&ac_queue->lock);
+	INIT_WORK(&ac_queue->worker, xe_access_counter_queue_work_func);
+
+	return 0;
+}
+
+/**
+ * xe_access_counter_init - Initialize access counter consumer layer
+ * @xe: xe device
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_init(struct xe_device *xe)
+{
+	int err, i;
+
+	if (!xe->info.has_usm)
+		return 0;
+
+	for (i = 0; i < XE_ACCESS_COUNTER_QUEUE_COUNT; ++i) {
+		err = xe_access_counter_queue_init(xe, xe->usm.ac_queue + i);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_access_counter_handler - Handle an access counter notification
+ * @xe: xe device
+ * @ac: access counter notification
+ *
+ * Sink the access counter notification to a queue (i.e., a memory buffer) and
+ * queue a worker to service it.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
+{
+	struct xe_usm_queue *ac_queue = xe->usm.ac_queue +
+		(ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);
+	unsigned long flags;
+	bool full;
+
+	spin_lock_irqsave(&ac_queue->lock, flags);
+	full = xe_usm_queue_full(ac_queue, sizeof(struct xe_access_counter));
+	if (!full) {
+		xe_usm_queue_push(ac_queue, ac, sizeof(struct xe_access_counter));
+		queue_work(xe->usm.pf_wq, &ac_queue->worker);
+	} else {
+		drm_warn(&xe->drm,
+			 "AccessCounter Queue (%d) full, shouldn't be possible\n",
+			 ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);
+	}
+	spin_unlock_irqrestore(&ac_queue->lock, flags);
+
+	return full ? -ENOSPC : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_access_counter.c.new b/drivers/gpu/drm/xe/xe_access_counter.c.new
new file mode 100644
index 000000000000..a7b513b7440b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter.c.new
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/circ_buf.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_managed.h>
+
+#include "xe_access_counter.h"
+#include "xe_access_counter_types.h"
+#include "xe_device.h"
+#include "xe_usm_queue.h"
+
+/**
+ * DOC: Xe access counters
+ *
+ * Xe access counters are handled in two layers with one-way communication.
+ * The producer layer interacts with hardware or firmware to receive and parse
+ * access counter notifications into struct xe_access_counter, then forwards them
+ * to the consumer. The consumer layer services the notifications (e.g., memory
+ * migration hints, binding decisions). No acknowledgment is sent back to the
+ * producer. The consumer uses an access counter queue sized to absorb all potential
+ * notifications and a multi-threaded worker to process them. Multiple producers
+ * are supported, with a single shared consumer.
+ *
+ * xe_access_counter.c implements the consumer layer.
+ */
+
+static int xe_access_counter_entry_size(void)
+{
+	return roundup_pow_of_two(sizeof(struct xe_access_counter));
+}
+
+static void xe_access_counter_queue_work_func(struct work_struct *w)
+{
+	/* TODO: Implement */
+}
+
+static int xe_access_counter_queue_init(struct xe_device *xe,
+					struct xe_usm_queue *ac_queue)
+{
+	/*
+	 * Allocate a fixed-size queue for access counter notifications.
+	 * Size is determined based on hardware capabilities.
+	 */
+#define XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES	128
+	ac_queue->size = XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES *
+			 xe_access_counter_entry_size();
+#undef XE_ACCESS_COUNTER_QUEUE_NUM_ENTRIES
+
+	ac_queue->data = devm_kzalloc(xe->drm.dev, ac_queue->size, GFP_KERNEL);
+	if (!ac_queue->data)
+		return -ENOMEM;
+
+	spin_lock_init(&ac_queue->lock);
+	INIT_WORK(&ac_queue->worker, xe_access_counter_queue_work_func);
+
+	return 0;
+}
+
+/**
+ * xe_access_counter_init - Initialize access counter consumer layer
+ * @xe: xe device
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_init(struct xe_device *xe)
+{
+	int err, i;
+
+	if (!xe->info.has_usm)
+		return 0;
+
+	for (i = 0; i < XE_ACCESS_COUNTER_QUEUE_COUNT; ++i) {
+		err = xe_access_counter_queue_init(xe, xe->usm.ac_queue + i);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_access_counter_handler - Handle an access counter notification
+ * @xe: xe device
+ * @ac: access counter notification
+ *
+ * Sink the access counter notification to a queue (i.e., a memory buffer) and
+ * queue a worker to service it.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac)
+{
+	struct xe_usm_queue *ac_queue = xe->usm.ac_queue +
+		(ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);
+	unsigned long flags;
+	bool full;
+
+	spin_lock_irqsave(&ac_queue->lock, flags);
+	full = xe_usm_queue_full(ac_queue, xe_access_counter_entry_size());
+	if (!full) {
+		xe_usm_queue_push(ac_queue, ac, xe_access_counter_entry_size());
+		queue_work(xe->usm.pf_wq, &ac_queue->worker);
+	} else {
+		drm_warn(&xe->drm,
+			 "AccessCounter Queue (%d) full, shouldn't be possible\n",
+			 ac->consumer.xe3.asid % XE_ACCESS_COUNTER_QUEUE_COUNT);
+	}
+	spin_unlock_irqrestore(&ac_queue->lock, flags);
+
+	return full ? -ENOSPC : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_access_counter.h b/drivers/gpu/drm/xe/xe_access_counter.h
new file mode 100644
index 000000000000..b3a331687f13
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ACCESS_COUNTER_H_
+#define _XE_ACCESS_COUNTER_H_
+
+struct xe_device;
+struct xe_gt;
+struct xe_access_counter;
+
+int xe_access_counter_init(struct xe_device *xe);
+
+int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_access_counter_types.h b/drivers/gpu/drm/xe/xe_access_counter_types.h
new file mode 100644
index 000000000000..74b903b9461b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_access_counter_types.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_ACCESS_COUNTER_TYPES_H_
+#define _XE_ACCESS_COUNTER_TYPES_H_
+
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+struct xe_gt;
+struct xe_access_counter;
+
+/** enum xe_access_counter_type - Xe access counter type */
+enum xe_access_counter_type {
+	/** @XE_ACCESS_COUNTER_TYPE_TRIGGER */
+	XE_ACCESS_COUNTER_TYPE_TRIGGER		= 0,
+	/** @XE_ACCESS_COUNTER_TYPE_NOTIFY*/
+	XE_ACCESS_COUNTER_TYPE_NOTIFY	= 1,
+};
+
+/** enum xe_access_counter_granularity - Xe access counter granularity */
+enum xe_access_counter_granularity {
+	/** @XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_128K	= 0,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_2M	= 1,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_16M	= 2,
+	/** @XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
+	XE_ACCESS_COUNTER_GRANULARITY_64M	= 3,
+};
+
+static inline int xe_access_counter_granularity_in_byte(int val)
+{
+	switch (val) {
+	case XE_ACCESS_COUNTER_GRANULARITY_128K:
+		return SZ_128K;
+	case XE_ACCESS_COUNTER_GRANULARITY_2M:
+		return SZ_2M;
+	case XE_ACCESS_COUNTER_GRANULARITY_16M:
+		return SZ_16M;
+	case XE_ACCESS_COUNTER_GRANULARITY_64M:
+		return SZ_64M;
+	default:
+		return 0;
+	}
+}
+
+/**
+ * struct xe_access_counter - Xe access counter
+ *
+ * Generic access counter structure for communication between producer and consumer.
+ * Carefully sized to be 64 bytes. Upon a device access counter notification, the
+ * producer populates this structure, and the consumer copies it into the access
+ * counter queue for deferred handling.
+ */
+struct xe_access_counter {
+	/**
+	 * @gt: GT of access counter
+	 */
+	struct xe_gt *gt;
+	/**
+	 * @consumer: State for the software handling the access counter.
+	 * Populated by the producer and may be modified by the consumer to
+	 * communicate information back to the producer upon acknowledgment.
+	 */
+	struct {
+		/** @consumer.va_range_base: base virtual address of range */
+		u64 va_range_base;
+		/** @consumer.sub_granularity: sub-granularity */
+		u32 sub_granularity;
+		/**
+		 * @consumer.counter_type: counter type, u8 rather than enum to
+		 * keep size compact
+		 */
+		u8 counter_type;
+		/**
+		 * @consumer.granularity: access granularity, u8 rather than enum
+		 * to keep size compact
+		 */
+		u8 granularity;
+		/** @consumer.reserved: reserved bits for alignment */
+		u8 reserved[2];
+		/** @consumer: Platform-specific fields */
+		union {
+			/** @consumer.xe3: Xe3-specific fields */
+			struct {
+				/** @consumer.xe3.asid: address space ID */
+				u32 asid;
+				/** @consumer.xe3.engine_class: engine class */
+				u8 engine_class;
+				/** @consumer.xe3.engine_instance: engine instance */
+				u8 engine_instance;
+				/** @consumer.xe3.vfid: VFID */
+				u8 vfid;
+				/** @consumer.xe3.reserved: reserved bits */
+				u8 reserved;
+			} xe3;
+		};
+	} consumer;
+	/**
+	 * @producer: State for the producer (i.e., HW/FW interface). Populated
+	 * by the producer and should not be modified—or even inspected—by the
+	 * consumer, except for calling operations.
+	 */
+	struct {
+		/** @producer.private: private pointer */
+		void *private;
+#define XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW	4
+		/**
+		 * @producer.msg: access counter message, used by producer in
+		 * acknowledgment to formulate response to HW/FW interface.
+		 * Included in the access counter message because the producer
+		 * typically receives the notification in a context where memory
+		 * cannot be allocated (e.g., atomic context or the reclaim path).
+		 */
+		u32 msg[XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW];
+	} producer;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e77a3a3db73d..ba2f0e345257 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -23,6 +23,7 @@
 #include "instructions/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_access_counter.h"
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_debugfs.h"
@@ -933,6 +934,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_access_counter_init(xe);
+	if (err)
+		return err;
+
 	if (xe->tiles->media_gt &&
 	    XE_GT_WA(xe->tiles->media_gt, 15015404425_disable))
 		XE_DEVICE_WA_DISABLE(xe, 15015404425);
@@ -1394,3 +1399,28 @@ struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
 
 	return vm;
 }
+
+/**
+ * xe_device_asid_to_fault_vm() - Find FAULT VM from ASID
+ * @xe: the &xe_device
+ * @asid: Address space ID
+ *
+ * Find a FAULTING VM from ASID and take a reference to VM which
+ * caller must drop. Reclaim safe.
+ *
+ * Return: VM on success, ERR_PTR on failure
+ */
+struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid)
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
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index c4d267002661..e746f5c7cce0 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -209,6 +209,7 @@ int xe_is_injection_active(void);
 bool xe_is_xe_file(const struct file *file);
 
 struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
+struct xe_vm *xe_device_asid_to_fault_vm(struct xe_device *xe, u32 asid);
 
 /*
  * Occasionally it is seen that the G2H worker starts running after a delay of more than
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 615218d775b1..526cfd09d0b9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_access_counter_types.h"
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
@@ -310,7 +311,10 @@ struct xe_device {
 		 */
 #define XE_PAGEFAULT_QUEUE_COUNT	4
 		/** @usm.pf_queue: Page fault queues */
-		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
+		struct xe_usm_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
+#define XE_ACCESS_COUNTER_QUEUE_COUNT	4
+		/** @usm.ac_queue: Access counter queues */
+		struct xe_usm_queue ac_queue[XE_ACCESS_COUNTER_QUEUE_COUNT];
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
 		struct drm_pagemap_shrinker *dpagemap_shrinker;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b287d0e0e60a..05c808b330b4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -379,7 +379,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 
 			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+			lrc = xe_lrc_create(q, q->hwe, q->vm, q->replay_state,
 					    xe_lrc_ring_size(), q->msix_vec, flags);
 			if (IS_ERR(lrc)) {
 				err = PTR_ERR(lrc);
@@ -1080,6 +1080,32 @@ static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properti
 	return 0;
 }
 
+static int exec_queue_user_ext_set_acc_param(struct xe_device *xe,
+					     struct xe_exec_queue *q,
+					      u64 extension, u64 *properties)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_exec_queue_set_acc_param ext;
+	int err;
+
+	if (!xe->info.has_access_counter)
+		return -EINVAL;
+
+	err = copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad1 || ext.pad2))
+		return -EINVAL;
+
+	/* Store access counter parameters in exec queue */
+	q->acc.trigger = ext.trigger;
+	q->acc.notify = ext.notify;
+	q->acc.granularity = ext.granularity;
+
+	return 0;
+}
+
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    struct xe_exec_queue *q,
 					    u64 extension, u64 *properties)
@@ -1123,6 +1149,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
+	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM] = exec_queue_user_ext_set_acc_param,
 };
 
 #define MAX_USER_EXTENSIONS	16
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 8ce78e0b1d50..3f10e3371e5a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -239,6 +239,15 @@ struct xe_exec_queue {
 
 	/** @replay_state: GPU hang replay state */
 	void *replay_state;
+	/** @acc: Access counter parameters */
+	struct {
+		/** @acc.trigger: Access counter trigger threshold */
+		u16 trigger;
+		/** @acc.notify: Access counter notify threshold */
+		u16 notify;
+		/** @acc.granularity: Access counter granularity */
+		u8 granularity;
+	} acc;
 
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 7e8a3a7db741..05de991ae90a 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -268,7 +268,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
+	port->lrc = xe_lrc_create(NULL, hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.c b/drivers/gpu/drm/xe/xe_guc_access_counter.c
new file mode 100644
index 000000000000..2158400bc50a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_access_counter.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_guc_access_counter.h"
+
+#include "xe_access_counter.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_guc.h"
+#include "xe_guc_fwif.h"
+
+/**
+ * xe_guc_access_counter_handler() - G2H access counter handler
+ * @guc: GuC object
+ * @msg: G2H message
+ * @len: Length of G2H message
+ *
+ * Parse GuC to host (G2H) message into a struct xe_access_counter and forward
+ * onto the Xe access counter layer.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_access_counter ac;
+	struct xe_device *xe = guc_to_xe(guc);
+	int i;
+
+#define GUC_ACC_MSG_LEN_DW	\
+	(sizeof(struct xe_guc_acc_desc) / sizeof(u32))
+
+	BUILD_BUG_ON(GUC_ACC_MSG_LEN_DW > XE_ACCESS_COUNTER_PRODUCER_MSG_LEN_DW);
+
+	if (len != GUC_ACC_MSG_LEN_DW)
+		return -EPROTO;
+
+	ac.gt = guc_to_gt(guc);
+
+	/* Parse access counter descriptor */
+	ac.consumer.granularity = FIELD_GET(ACC_GRANULARITY, msg[2]);
+	ac.consumer.sub_granularity = FIELD_GET(ACC_SUBG_HI, msg[1]) << 31 |
+				      FIELD_GET(ACC_SUBG_LO, msg[0]);
+	ac.consumer.counter_type = FIELD_GET(ACC_TYPE, msg[0]);
+	ac.consumer.va_range_base = ((u64)(msg[3] & ACC_VIRTUAL_ADDR_RANGE_HI) << 32) |
+				    (msg[2] & ACC_VIRTUAL_ADDR_RANGE_LO);
+	/* xe3: Use ASID and engine info */
+	ac.consumer.xe3.asid = FIELD_GET(ACC_ASID, msg[1]);
+	ac.consumer.xe3.engine_class = FIELD_GET(ACC_ENG_CLASS, msg[1]);
+	ac.consumer.xe3.engine_instance = FIELD_GET(ACC_ENG_INSTANCE, msg[1]);
+	ac.consumer.xe3.vfid = FIELD_GET(ACC_VFID, msg[2]);
+
+	/* Store producer message for potential acknowledgment */
+	ac.producer.private = guc;
+	for (i = 0; i < GUC_ACC_MSG_LEN_DW; ++i)
+		ac.producer.msg[i] = msg[i];
+
+#undef GUC_ACC_MSG_LEN_DW
+
+	return xe_access_counter_handler(xe, &ac);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_access_counter.h b/drivers/gpu/drm/xe/xe_guc_access_counter.h
new file mode 100644
index 000000000000..1ac8e76398d2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_access_counter.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_ACCESS_COUNTER_H_
+#define _XE_GUC_ACCESS_COUNTER_H_
+
+#include <linux/types.h>
+
+struct xe_guc;
+
+int xe_guc_access_counter_handler(struct xe_guc *guc, u32 *msg, u32 len);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index a11cff7a20be..8ac0938f7a28 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -26,6 +26,7 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_guc.h"
 #include "xe_guc_log.h"
+#include "xe_guc_access_counter.h"
 #include "xe_guc_pagefault.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
@@ -1630,6 +1631,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
+	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
+		ret = xe_guc_access_counter_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
 		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 35b365ac55e5..9cb91ce63d59 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1439,8 +1439,10 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
 	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
 }
 
-static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
-			   void *replay_state, u16 msix_vec, u32 init_flags)
+static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+			   struct xe_hw_engine *hwe, struct xe_vm *vm,
+			   void *replay_state,
+			   u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -1527,8 +1529,20 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
 
-	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
+	if (xe->info.has_asid && vm) {
+		u32 asid;
+
+		if (q)
+			asid = vm->usm.asid | ACC_GRANULARITY_VAL(q->acc.granularity);
+		else
+			asid = vm->usm.asid;
+		xe_lrc_write_ctx_reg(lrc, CTX_ASID, asid);
+	}
+
+	if (q && xe->info.has_access_counter && vm)
+		xe_lrc_write_ctx_reg(lrc, CTX_ACC_CTR_THOLD,
+				     ACC_NOTIFY_VAL(q->acc.notify) |
+				     ACC_TRIGGER_VAL(q->acc.trigger));
 
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
@@ -1570,7 +1584,8 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
 	return err;
 }
 
-static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
+static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+		       struct xe_hw_engine *hwe, struct xe_vm *vm,
 		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
@@ -1626,7 +1641,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	err = xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
+	err = xe_lrc_ctx_init(lrc, q, hwe, vm, replay_state, msix_vec, init_flags);
 	if (err)
 		goto err_lrc_finish;
 
@@ -1642,6 +1657,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
 
 /**
  * xe_lrc_create - Create a LRC
+ * @q: Exec queue (can be NULL for kernel queues)
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @replay_state: GPU hang replay state
@@ -1654,8 +1670,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
  * Return pointer to created LRC upon success and an error pointer
  * upon failure.
  */
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags)
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, void *replay_state, u32 ring_size,
+			     u16 msix_vec, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1664,7 +1681,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec, flags);
+	err = xe_lrc_init(lrc, q, hwe, vm, replay_state, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7c975f9e2d9..b101aabe3d0d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -51,8 +51,9 @@ struct xe_lrc_snapshot {
 #define XE_LRC_CREATE_USER_CTX		BIT(2)
 #define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
 
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, void *replay_state,
+			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index ea4857acf28d..a4ee9393e4af 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -45,24 +45,6 @@ static int xe_pagefault_entry_size(void)
 	return roundup_pow_of_two(sizeof(struct xe_pagefault));
 }
 
-static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
-			      struct xe_vram_region *vram, bool need_vram_move)
-{
-	struct xe_bo *bo = xe_vma_bo(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	int err;
-
-	err = xe_vm_lock_vma(exec, vma);
-	if (err)
-		return err;
-
-	if (!bo)
-		return 0;
-
-	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
-		xe_bo_validate(bo, vm, true, exec);
-}
-
 static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 				   bool atomic)
 {
@@ -103,8 +85,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
-					 needs_vram == 1);
+		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram,
+					       needs_vram == 1);
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &err);
 		if (err)
@@ -139,20 +121,6 @@ xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
 	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
 }
 
-static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
-{
-	struct xe_vm *vm;
-
-	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm, asid);
-	if (vm && xe_vm_in_fault_mode(vm))
-		xe_vm_get(vm);
-	else
-		vm = ERR_PTR(-EINVAL);
-	up_read(&xe->usm.lock);
-
-	return vm;
-}
 
 static int xe_pagefault_service(struct xe_pagefault *pf)
 {
@@ -167,7 +135,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
-	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
+	vm = xe_device_asid_to_fault_vm(xe, pf->consumer.asid);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
@@ -204,23 +172,6 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	return err;
 }
 
-static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
-				   struct xe_pagefault *pf)
-{
-	bool found_fault = false;
-
-	spin_lock_irq(&pf_queue->lock);
-	if (pf_queue->tail != pf_queue->head) {
-		memcpy(pf, pf_queue->data + pf_queue->tail, sizeof(*pf));
-		pf_queue->tail = (pf_queue->tail + xe_pagefault_entry_size()) %
-			pf_queue->size;
-		found_fault = true;
-	}
-	spin_unlock_irq(&pf_queue->lock);
-
-	return found_fault;
-}
-
 static void xe_pagefault_print(struct xe_pagefault *pf)
 {
 	xe_gt_info(pf->gt, "\n\tASID: %d\n"
@@ -246,7 +197,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 
 static void xe_pagefault_queue_work(struct work_struct *w)
 {
-	struct xe_pagefault_queue *pf_queue =
+	struct xe_usm_queue *pf_queue =
 		container_of(w, typeof(*pf_queue), worker);
 	struct xe_pagefault pf;
 	unsigned long threshold;
@@ -254,7 +205,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 #define USM_QUEUE_MAX_RUNTIME_MS      20
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
-	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
+	while (xe_usm_queue_pop(pf_queue, &pf, sizeof(struct xe_pagefault))) {
 		int err;
 
 		if (!pf.gt)	/* Fault squashed during reset */
@@ -284,7 +235,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 }
 
 static int xe_pagefault_queue_init(struct xe_device *xe,
-				   struct xe_pagefault_queue *pf_queue)
+				   struct xe_usm_queue *pf_queue)
 {
 	struct xe_gt *gt;
 	int total_num_eus = 0;
@@ -373,7 +324,7 @@ int xe_pagefault_init(struct xe_device *xe)
 }
 
 static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
-				     struct xe_pagefault_queue *pf_queue)
+				     struct xe_usm_queue *pf_queue)
 {
 	u32 i;
 
@@ -410,14 +361,6 @@ void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
 		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
 }
 
-static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
-{
-	lockdep_assert_held(&pf_queue->lock);
-
-	return CIRC_SPACE(pf_queue->head, pf_queue->tail, pf_queue->size) <=
-		xe_pagefault_entry_size();
-}
-
 /**
  * xe_pagefault_handler() - Page fault handler
  * @xe: xe device instance
@@ -430,17 +373,15 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
  */
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
-	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
+	struct xe_usm_queue *pf_queue = xe->usm.pf_queue +
 		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
 	unsigned long flags;
 	bool full;
 
 	spin_lock_irqsave(&pf_queue->lock, flags);
-	full = xe_pagefault_queue_full(pf_queue);
+	full = xe_usm_queue_full(pf_queue, sizeof(struct xe_pagefault));
 	if (!full) {
-		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
-		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
-			pf_queue->size;
+		xe_usm_queue_push(pf_queue, pf, sizeof(struct xe_pagefault));
 		queue_work(xe->usm.pf_wq, &pf_queue->worker);
 	} else {
 		drm_warn(&xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
index b3289219b1be..49359f643358 100644
--- a/drivers/gpu/drm/xe/xe_pagefault_types.h
+++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
@@ -8,6 +8,8 @@
 
 #include <linux/workqueue.h>
 
+#include "xe_usm_queue.h"
+
 struct xe_gt;
 struct xe_pagefault;
 
@@ -110,29 +112,4 @@ struct xe_pagefault {
 		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
 	} producer;
 };
-
-/**
- * struct xe_pagefault_queue: Xe pagefault queue (consumer)
- *
- * Used to capture all device page faults for deferred processing. Size this
- * queue to absorb the device’s worst-case number of outstanding faults.
- */
-struct xe_pagefault_queue {
-	/**
-	 * @data: Data in queue containing struct xe_pagefault, protected by
-	 * @lock
-	 */
-	void *data;
-	/** @size: Size of queue in bytes */
-	u32 size;
-	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
-	u32 head;
-	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
-	u32 tail;
-	/** @lock: protects page fault queue */
-	spinlock_t lock;
-	/** @worker: to process page faults */
-	struct work_struct worker;
-};
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2d9ce2c4cb4f..f28b31c65141 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -755,6 +755,17 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
+	if (!xe_vma_supports_access_ctr(xe, vma, tile)) {
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
+	if (range) {
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		if (!xe_svm_range_can_migrate_to_vram(range))
+			xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	if (!range)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index a91c84487a67..fe0f86a2d0bf 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1186,9 +1186,9 @@ DECL_SVM_RANGE_US_STATS(get_pages, GET_PAGES)
 DECL_SVM_RANGE_US_STATS(bind, BIND)
 DECL_SVM_RANGE_US_STATS(fault, PAGEFAULT)
 
-static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-				     struct xe_gt *gt, u64 fault_addr,
-				     bool need_vram)
+static int __xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+				struct xe_gt *gt, u64 fault_addr,
+				bool need_vram, bool acc_ctr_trigger)
 {
 	int devmem_possible = IS_DGFX(vm->xe) &&
 		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
@@ -1196,7 +1196,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.read_only = xe_vma_read_only(vma),
 		.devmem_possible = devmem_possible,
 		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
-		.devmem_only = need_vram && devmem_possible,
+		.devmem_only = (need_vram || acc_ctr_trigger) && devmem_possible,
 		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
@@ -1213,7 +1213,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
+	if (!acc_ctr_trigger)
+		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
 	/* Always process UNMAPs first so view SVM ranges is current */
@@ -1229,7 +1230,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (IS_ERR(range))
 		return PTR_ERR(range);
 
-	xe_svm_range_fault_count_stats_incr(gt, range);
+	if (!acc_ctr_trigger)
+		xe_svm_range_fault_count_stats_incr(gt, range);
 
 	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
 		err = -EACCES;
@@ -1244,6 +1246,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT");
 
+	if (acc_ctr_trigger && !range->base.pages.flags.migrate_devmem) {
+		goto out;
+	}
+
 	if (--migrate_try_count >= 0 &&
 	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
 		ktime_t migrate_start = xe_gt_stats_ktime_get();
@@ -1307,6 +1313,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 
 	xe_svm_range_get_pages_us_stats_incr(gt, range, get_pages_start);
+
 	range_debug(range, "PAGE FAULT - BIND");
 
 	bind_start = xe_gt_stats_ktime_get();
@@ -1347,21 +1354,22 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 }
 
 /**
- * xe_svm_handle_pagefault() - SVM handle page fault
+ * xe_svm_range_setup - Setup range for GPU access
  * @vm: The VM.
  * @vma: The CPU address mirror VMA.
- * @gt: The gt upon the fault occurred.
- * @fault_addr: The GPU fault address.
+ * @gt: The gt for which binding.
+ * @addr: Addr for which need to bind svm range.
  * @atomic: The fault atomic access bit.
+ * @acc_ctr_trigger: If true, always migrate to local device memory.
  *
  * Create GPU bindings for a SVM page fault. Optionally migrate to device
  * memory.
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-			    struct xe_gt *gt, u64 fault_addr,
-			    bool atomic)
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_gt *gt, u64 addr,
+		       bool atomic, bool acc_ctr_trigger)
 {
 	int need_vram, ret;
 retry:
@@ -1369,14 +1377,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (need_vram < 0)
 		return need_vram;
 
-	ret =  __xe_svm_handle_pagefault(vm, vma, gt, fault_addr,
-					 need_vram ? true : false);
+	ret =  __xe_svm_range_setup(vm, vma, gt, addr,
+				    need_vram ? true : false,
+				    acc_ctr_trigger);
 	if (ret == -EAGAIN) {
 		/*
 		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
 		 * may have been split by xe_svm_range_set_default_attr.
 		 */
-		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
+		vma = xe_vm_find_vma_by_addr(vm, addr);
 		if (!vma)
 			return -EINVAL;
 
@@ -1385,6 +1394,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	return ret;
 }
 
+/**
+ * xe_svm_handle_pagefault() - SVM handle page fault
+ * @vm: The VM.
+ * @vma: The CPU address mirror VMA.
+ * @gt: The gt upon the fault occurred.
+ * @fault_addr: The GPU fault address.
+ * @atomic: The fault atomic access bit.
+ *
+ * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * memory.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_gt *gt, u64 fault_addr,
+			    bool atomic)
+{
+	return xe_svm_range_setup(vm, vma, gt, fault_addr, atomic, false);
+}
+
 /**
  * xe_svm_has_mapping() - SVM has mappings
  * @vm: The VM.
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b7b8eeacf196..6931c529d292 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -85,6 +85,10 @@ void xe_svm_fini(struct xe_vm *vm);
 
 void xe_svm_close(struct xe_vm *vm);
 
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_gt *gt, u64 addr,
+		       bool atomic, bool acc_ctr_trigger);
+
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic);
@@ -135,6 +139,12 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.pages.flags.has_dma_mapping;
 }
 
+static inline bool xe_svm_range_can_migrate_to_vram(struct xe_svm_range *range)
+{
+	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
+	return range->base.pages.flags.migrate_devmem;
+}
+
 /**
  * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
  * @r: Pointer to the drm_gpusvm_range structure
@@ -279,6 +289,15 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
 
+static inline
+int xe_svm_range_setup(struct xe_vm *vm, struct xe_vma *vma,
+		       struct xe_gt *gt, u64 addr,
+		       bool atomic, bool acc_ctr_trigger)
+{
+	return -EOPNOTSUPP;
+}
+
+
 static inline int
 xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
 		  struct drm_pagemap *dpagemap)
@@ -388,6 +407,7 @@ static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_inst
 }
 
 #define xe_svm_range_has_dma_mapping(...) false
+#define xe_svm_range_can_migrate_to_vram(...) false
 #endif /* CONFIG_DRM_XE_GPUSVM */
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM) /* Need to support userptr without XE_GPUSVM */
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 86323cf3be2c..eae5a5d0dbdc 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -12,6 +12,7 @@
 #include <linux/tracepoint.h>
 #include <linux/types.h>
 
+#include "xe_access_counter_types.h"
 #include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_vm.h"
@@ -125,9 +126,34 @@ DEFINE_EVENT(xe_vma, xe_vma_pagefault,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_acc,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
+TRACE_EVENT(xe_vma_acc,
+	    TP_PROTO(struct xe_vma *vma, u8 counter_type),
+	    TP_ARGS(vma, counter_type),
+
+	    TP_STRUCT__entry(
+		     __string(dev, __dev_name_vma(vma))
+		     __field(struct xe_vma *, vma)
+		     __field(struct xe_vm *, vm)
+		     __field(u32, asid)
+		     __field(u64, start)
+		     __field(u64, end)
+		     __field(u8, counter_type)
+		     ),
+
+	    TP_fast_assign(
+		   __assign_str(dev);
+		   __entry->vma = vma;
+		   __entry->vm = xe_vma_vm(vma);
+		   __entry->asid = xe_vma_vm(vma)->usm.asid;
+		   __entry->start = xe_vma_start(vma);
+		   __entry->end = xe_vma_end(vma) - 1;
+		   __entry->counter_type = counter_type;
+		   ),
+
+	    TP_printk("dev=%s, vma=%p, vm=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, type=%s",
+		      __get_str(dev), __entry->vma, __entry->vm,
+		      __entry->asid, __entry->start, __entry->end,
+		      __entry->counter_type == XE_ACCESS_COUNTER_TYPE_NOTIFY ? "NOTIFY" : "TRIGGER")
 );
 
 DEFINE_EVENT(xe_vma, xe_vma_bind,
diff --git a/drivers/gpu/drm/xe/xe_usm_queue.h b/drivers/gpu/drm/xe/xe_usm_queue.h
new file mode 100644
index 000000000000..5dc2d692d8bb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_usm_queue.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_USM_QUEUE_H_
+#define _XE_USM_QUEUE_H_
+
+#include <linux/circ_buf.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
+/**
+ * struct xe_usm_queue - Generic USM circular FIFO queue
+ *
+ * A lock-protected circular buffer used by both the page fault consumer and
+ * the access counter consumer. Producers push fixed-size entries from IRQ
+ * context; a work_struct processes them asynchronously.
+ */
+struct xe_usm_queue {
+	/**
+	 * @data: Raw byte buffer backing the queue, protected by @lock
+	 */
+	void *data;
+	/** @size: Total size of @data in bytes */
+	u32 size;
+	/** @head: Write cursor in bytes, moved by producer, protected by @lock */
+	u32 head;
+	/** @tail: Read cursor in bytes, moved by consumer, protected by @lock */
+	u32 tail;
+	/** @lock: Protects the queue head/tail */
+	spinlock_t lock;
+	/** @worker: Work item scheduled to drain the queue */
+	struct work_struct worker;
+};
+
+/**
+ * xe_usm_queue_full - Check whether the queue has no room for one more entry
+ * @q: queue
+ * @size: exact size of one entry in bytes (sizeof the entry struct)
+ *
+ * Must be called with @q->lock held.
+ *
+ * Return: true if the queue is full
+ */
+static inline bool xe_usm_queue_full(struct xe_usm_queue *q, u32 size)
+{
+	u32 entry_size = roundup_pow_of_two(size);
+
+	lockdep_assert_held(&q->lock);
+
+	return CIRC_SPACE(q->head, q->tail, q->size) <= entry_size;
+}
+/**
+ * xe_usm_queue_pop - Pop one entry from the queue into @out
+ * @q: queue
+ * @out: destination buffer, must be at least @size bytes
+ * @size: exact size of one entry in bytes (sizeof the entry struct)
+ *
+ * Acquires @q->lock internally with spin_lock_irq().
+ *
+ * Return: true if an entry was dequeued, false if the queue was empty
+ */
+static inline bool xe_usm_queue_pop(struct xe_usm_queue *q, void *out,
+				    u32 size)
+{
+	u32 entry_size = roundup_pow_of_two(size);
+	bool found = false;
+
+	spin_lock_irq(&q->lock);
+	if (q->tail != q->head) {
+		memcpy(out, q->data + q->tail, size);
+		q->tail = (q->tail + entry_size) % q->size;
+		found = true;
+	}
+	spin_unlock_irq(&q->lock);
+
+	return found;
+}
+
+/**
+ * xe_usm_queue_push - Push one entry into the queue
+ * @q: queue
+ * @in: source buffer, must be at least @size bytes
+ * @size: size of one entry of in bytes
+ *
+ * Must be called with @q->lock held.
+ * Caller must check xe_usm_queue_full() before calling.
+ */
+static inline void xe_usm_queue_push(struct xe_usm_queue *q, const void *in,
+				     u32 size)
+{
+	u32 entry_size = roundup_pow_of_two(size);
+
+	lockdep_assert_held(&q->lock);
+
+	memcpy(q->data + q->head, in, size);
+	q->head = (q->head + entry_size) % q->size;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5572e12c2a7e..7f979d6205f4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1170,6 +1170,37 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 	return err;
 }
 
+/**
+ * xe_vma_lock_and_validate - Lock Vma and Validate bo location
+ * @exec: drm execution context
+ * @vma: VMA to prepare
+ * @vram: target VRAM region
+ * @need_vram_move: true if BO must be moved to VRAM
+ *
+ * Locks the VMA and its associated BO, then ensures the BO is in the correct
+ * memory location for GPU access. If need_vram_move is true, migrates the BO
+ * to VRAM; otherwise validates it in its current location.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+			     struct xe_vram_region *vram, bool need_vram_move)
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
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
@@ -4325,6 +4356,47 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	kvfree(snap);
 }
 
+/**
+ * xe_vma_supports_access_ctr - Determine if VMA is eligible for access counting
+ * @xe: Pointer to the Xe device structure
+ * @vma: The VMA
+ * @tile: Tile with which VMA bound is associated to
+ *
+ * Note, access counters are not used unless enabled in LRC.
+ */
+bool xe_vma_supports_access_ctr(struct xe_device *xe,
+				struct xe_vma *vma,
+				struct xe_tile *tile)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct ttm_resource *res;
+
+	if (!IS_DGFX(xe))
+		return false;
+
+	if (xe_vma_is_cpu_addr_mirror(vma))
+		return true;
+
+	/* userptr or using null vma*/
+	if (!bo)
+		return false;
+
+	res = bo->ttm.resource;
+	/* if for some reason no backing store, nothing to migrate */
+	if (!res)
+		return false;
+
+	/* cannot migrate if single placement */
+	if (bo->placement.num_placement <= 1)
+		return false;
+
+	/* cannot migrate to ourself (already in VRAM local to @tile) */
+	if (!tile->mem.vram || res->mem_type == tile->mem.vram->placement)
+		return false;
+
+	return true;
+}
+
 /**
  * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
  * @xe: Pointer to the Xe device structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0bc7ed23eeae..17844ef0f0b7 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -178,6 +178,9 @@ struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
 
+bool xe_vma_supports_access_ctr(struct xe_device *xe, struct xe_vma *vma,
+				struct xe_tile *tile);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
@@ -271,6 +274,9 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
+int xe_vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+			     struct xe_vram_region *vram, bool need_vram_move);
+
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f8b2afb20540..19447ba10b1d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1337,6 +1337,7 @@ struct drm_xe_vm_bind {
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
@@ -1377,6 +1378,44 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
+/** enum drm_xe_access_counter_granularity - Xe access counter granularity */
+enum drm_xe_access_counter_granularity {
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_128K,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_16M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_64M,
+};
+
+/**
+ * struct drm_xe_exec_queue_set_acc_param - Access counter parameters extension
+ *
+ * Extension to configure access counter notifications for an exec queue.
+ * Used with DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM.
+ */
+struct drm_xe_exec_queue_set_acc_param {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @trigger: Access counter trigger threshold */
+	__u16 trigger;
+
+	/** @notify: Access counter notify threshold */
+	__u16 notify;
+
+	/** @granularity: granularity, enum @drm_xe_access_counter_granularity */
+	__u8 granularity;
+
+	/** @pad1: MBZ */
+	__u8 pad1;
+
+	/** @pad2: MBZ */
+	__u16 pad2;
+};
+
 /**
  * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
  */
-- 
2.34.1

