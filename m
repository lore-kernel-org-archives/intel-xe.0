Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D455CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597BA10EBF7;
	Fri, 31 Oct 2025 16:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJf/dGc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A78F10EBF5
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761929704; x=1793465704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IVZDQqSR8xQQQiOFgx76+IlBLqfTiZiHdrkUQPiajmw=;
 b=LJf/dGc7+qgv8t3UBH39odEAfGGNjPAN+rNvWaJy5Ge288ijGlL8IZcl
 /9BjgxAGmm3PASX3UXxhxckuqbQyL/TH7KBWLA/Oio/8krGiBiSeH9fNL
 hyHp3HO7ozdhF7sgPkrcqwS1fPkZbMefqTDsZn2YPkwQMZcsmkfLJQWQm
 R2uRsak4b5spLjpyQYLSrPBhOGKu4KKIJIU4KKXviRDN9LMzCmNPd05iz
 ln8aGe8mDsyS1z8Ax215qi6vs259Xe5S8FRsZamj17q1x4/6F/G+IWp0C
 VAxafrsKuhy8Zqu629AgW0jgPlzaE1GAjUOUYGsFBmTV2U6aPPXEvPF9l w==;
X-CSE-ConnectionGUID: FnPtIKseQWmyvRL5XxlfqQ==
X-CSE-MsgGUID: XKKDltEaTFyf1HbWLwFARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67933049"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67933049"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:03 -0700
X-CSE-ConnectionGUID: h7ouatCwTRicUaGtj+4ozA==
X-CSE-MsgGUID: o57ZI9WfSWuSIEO9muCnzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186734418"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:55:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com,
	francois.dugast@intel.com
Subject: [PATCH v4 7/7] drm/xe: Remove unused GT page fault code
Date: Fri, 31 Oct 2025 09:54:16 -0700
Message-Id: <20251031165416.2871503-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031165416.2871503-1-matthew.brost@intel.com>
References: <20251031165416.2871503-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

With the Xe page fault layer and GuC page layer in place, this is now
dead code and can be removed. ACC code is also removed, but this was
dead code.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 679 ---------------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  19 -
 drivers/gpu/drm/xe/xe_gt_types.h     |  65 ---
 3 files changed, 763 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.c
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault.h

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
deleted file mode 100644
index a054d6010ae0..000000000000
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ /dev/null
@@ -1,679 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#include "xe_gt_pagefault.h"
-
-#include <linux/bitfield.h>
-#include <linux/circ_buf.h>
-
-#include <drm/drm_exec.h>
-#include <drm/drm_managed.h>
-
-#include "abi/guc_actions_abi.h"
-#include "xe_bo.h"
-#include "xe_gt.h"
-#include "xe_gt_printk.h"
-#include "xe_gt_stats.h"
-#include "xe_guc.h"
-#include "xe_guc_ct.h"
-#include "xe_migrate.h"
-#include "xe_svm.h"
-#include "xe_trace_bo.h"
-#include "xe_vm.h"
-#include "xe_vram_types.h"
-
-struct pagefault {
-	u64 page_addr;
-	u32 asid;
-	u16 pdata;
-	u8 vfid;
-	u8 access_type;
-	u8 fault_type;
-	u8 fault_level;
-	u8 engine_class;
-	u8 engine_instance;
-	u8 fault_unsuccessful;
-	bool trva_fault;
-};
-
-enum access_type {
-	ACCESS_TYPE_READ = 0,
-	ACCESS_TYPE_WRITE = 1,
-	ACCESS_TYPE_ATOMIC = 2,
-	ACCESS_TYPE_RESERVED = 3,
-};
-
-enum fault_type {
-	NOT_PRESENT = 0,
-	WRITE_ACCESS_VIOLATION = 1,
-	ATOMIC_ACCESS_VIOLATION = 2,
-};
-
-struct acc {
-	u64 va_range_base;
-	u32 asid;
-	u32 sub_granularity;
-	u8 granularity;
-	u8 vfid;
-	u8 access_type;
-	u8 engine_class;
-	u8 engine_instance;
-};
-
-static bool access_is_atomic(enum access_type access_type)
-{
-	return access_type == ACCESS_TYPE_ATOMIC;
-}
-
-static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
-{
-	return xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
-					   vma->tile_invalidated);
-}
-
-static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool need_vram_move, struct xe_vram_region *vram)
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
-static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
-				bool atomic)
-{
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_validation_ctx ctx;
-	struct drm_exec exec;
-	struct dma_fence *fence;
-	int err, needs_vram;
-
-	lockdep_assert_held_write(&vm->lock);
-
-	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
-	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
-		return needs_vram < 0 ? needs_vram : -EACCES;
-
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
-	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);
-
-	trace_xe_vma_pagefault(vma);
-
-	/* Check if VMA is valid, opportunistic check only */
-	if (vma_is_valid(tile, vma) && !atomic)
-		return 0;
-
-retry_userptr:
-	if (xe_vma_is_userptr(vma) &&
-	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
-		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
-
-		err = xe_vma_userptr_pin_pages(uvma);
-		if (err)
-			return err;
-	}
-
-	/* Lock VM and BOs dma-resv */
-	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
-	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, needs_vram == 1, tile->mem.vram);
-		drm_exec_retry_on_contention(&exec);
-		xe_validation_retry_on_oom(&ctx, &err);
-		if (err)
-			goto unlock_dma_resv;
-
-		/* Bind VMA only to the GT that has faulted */
-		trace_xe_vma_pf_bind(vma);
-		xe_vm_set_validation_exec(vm, &exec);
-		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
-		xe_vm_set_validation_exec(vm, NULL);
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			xe_validation_retry_on_oom(&ctx, &err);
-			goto unlock_dma_resv;
-		}
-	}
-
-	dma_fence_wait(fence, false);
-	dma_fence_put(fence);
-
-unlock_dma_resv:
-	xe_validation_ctx_fini(&ctx);
-	if (err == -EAGAIN)
-		goto retry_userptr;
-
-	return err;
-}
-
-static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
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
-
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_vm *vm;
-	struct xe_vma *vma = NULL;
-	int err;
-	bool atomic;
-
-	/* SW isn't expected to handle TRTT faults */
-	if (pf->trva_fault)
-		return -EFAULT;
-
-	vm = asid_to_vm(xe, pf->asid);
-	if (IS_ERR(vm))
-		return PTR_ERR(vm);
-
-	/*
-	 * TODO: Change to read lock? Using write lock for simplicity.
-	 */
-	down_write(&vm->lock);
-
-	if (xe_vm_is_closed(vm)) {
-		err = -ENOENT;
-		goto unlock_vm;
-	}
-
-	vma = xe_vm_find_vma_by_addr(vm, pf->page_addr);
-	if (!vma) {
-		err = -EINVAL;
-		goto unlock_vm;
-	}
-
-	atomic = access_is_atomic(pf->access_type);
-
-	if (xe_vma_is_cpu_addr_mirror(vma))
-		err = xe_svm_handle_pagefault(vm, vma, gt,
-					      pf->page_addr, atomic);
-	else
-		err = handle_vma_pagefault(gt, vma, atomic);
-
-unlock_vm:
-	if (!err)
-		vm->usm.last_fault_vma = vma;
-	up_write(&vm->lock);
-	xe_vm_put(vm);
-
-	return err;
-}
-
-static int send_pagefault_reply(struct xe_guc *guc,
-				struct xe_guc_pagefault_reply *reply)
-{
-	u32 action[] = {
-		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
-		reply->dw0,
-		reply->dw1,
-	};
-
-	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
-}
-
-static void print_pagefault(struct xe_gt *gt, struct pagefault *pf)
-{
-	xe_gt_dbg(gt, "\n\tASID: %d\n"
-		  "\tVFID: %d\n"
-		  "\tPDATA: 0x%04x\n"
-		  "\tFaulted Address: 0x%08x%08x\n"
-		  "\tFaultType: %d\n"
-		  "\tAccessType: %d\n"
-		  "\tFaultLevel: %d\n"
-		  "\tEngineClass: %d %s\n"
-		  "\tEngineInstance: %d\n",
-		  pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
-		  lower_32_bits(pf->page_addr),
-		  pf->fault_type, pf->access_type, pf->fault_level,
-		  pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
-		  pf->engine_instance);
-}
-
-#define PF_MSG_LEN_DW	4
-
-static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
-{
-	const struct xe_guc_pagefault_desc *desc;
-	bool ret = false;
-
-	spin_lock_irq(&pf_queue->lock);
-	if (pf_queue->tail != pf_queue->head) {
-		desc = (const struct xe_guc_pagefault_desc *)
-			(pf_queue->data + pf_queue->tail);
-
-		pf->fault_level = FIELD_GET(PFD_FAULT_LEVEL, desc->dw0);
-		pf->trva_fault = FIELD_GET(XE2_PFD_TRVA_FAULT, desc->dw0);
-		pf->engine_class = FIELD_GET(PFD_ENG_CLASS, desc->dw0);
-		pf->engine_instance = FIELD_GET(PFD_ENG_INSTANCE, desc->dw0);
-		pf->pdata = FIELD_GET(PFD_PDATA_HI, desc->dw1) <<
-			PFD_PDATA_HI_SHIFT;
-		pf->pdata |= FIELD_GET(PFD_PDATA_LO, desc->dw0);
-		pf->asid = FIELD_GET(PFD_ASID, desc->dw1);
-		pf->vfid = FIELD_GET(PFD_VFID, desc->dw2);
-		pf->access_type = FIELD_GET(PFD_ACCESS_TYPE, desc->dw2);
-		pf->fault_type = FIELD_GET(PFD_FAULT_TYPE, desc->dw2);
-		pf->page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, desc->dw3)) <<
-			PFD_VIRTUAL_ADDR_HI_SHIFT;
-		pf->page_addr |= FIELD_GET(PFD_VIRTUAL_ADDR_LO, desc->dw2) <<
-			PFD_VIRTUAL_ADDR_LO_SHIFT;
-
-		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
-			pf_queue->num_dw;
-		ret = true;
-	}
-	spin_unlock_irq(&pf_queue->lock);
-
-	return ret;
-}
-
-static bool pf_queue_full(struct pf_queue *pf_queue)
-{
-	lockdep_assert_held(&pf_queue->lock);
-
-	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
-			  pf_queue->num_dw) <=
-		PF_MSG_LEN_DW;
-}
-
-int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	struct pf_queue *pf_queue;
-	unsigned long flags;
-	u32 asid;
-	bool full;
-
-	if (unlikely(len != PF_MSG_LEN_DW))
-		return -EPROTO;
-
-	asid = FIELD_GET(PFD_ASID, msg[1]);
-	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
-
-	/*
-	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
-	 */
-	xe_gt_assert(gt, !(pf_queue->num_dw % PF_MSG_LEN_DW));
-
-	spin_lock_irqsave(&pf_queue->lock, flags);
-	full = pf_queue_full(pf_queue);
-	if (!full) {
-		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
-		pf_queue->head = (pf_queue->head + len) %
-			pf_queue->num_dw;
-		queue_work(gt->usm.pf_wq, &pf_queue->worker);
-	} else {
-		xe_gt_warn(gt, "PageFault Queue full, shouldn't be possible\n");
-	}
-	spin_unlock_irqrestore(&pf_queue->lock, flags);
-
-	return full ? -ENOSPC : 0;
-}
-
-#define USM_QUEUE_MAX_RUNTIME_MS	20
-
-static void pf_queue_work_func(struct work_struct *w)
-{
-	struct pf_queue *pf_queue = container_of(w, struct pf_queue, worker);
-	struct xe_gt *gt = pf_queue->gt;
-	struct xe_guc_pagefault_reply reply = {};
-	struct pagefault pf = {};
-	unsigned long threshold;
-	int ret;
-
-	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
-
-	while (get_pagefault(pf_queue, &pf)) {
-		ret = handle_pagefault(gt, &pf);
-		if (unlikely(ret)) {
-			print_pagefault(gt, &pf);
-			pf.fault_unsuccessful = 1;
-			xe_gt_dbg(gt, "Fault response: Unsuccessful %pe\n", ERR_PTR(ret));
-		}
-
-		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
-			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
-			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
-			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
-			FIELD_PREP(PFR_ASID, pf.asid);
-
-		reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
-			FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
-			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
-			FIELD_PREP(PFR_PDATA, pf.pdata);
-
-		send_pagefault_reply(&gt->uc.guc, &reply);
-
-		if (time_after(jiffies, threshold) &&
-		    pf_queue->tail != pf_queue->head) {
-			queue_work(gt->usm.pf_wq, w);
-			break;
-		}
-	}
-}
-
-static void acc_queue_work_func(struct work_struct *w);
-
-static void pagefault_fini(void *arg)
-{
-	struct xe_gt *gt = arg;
-	struct xe_device *xe = gt_to_xe(gt);
-
-	if (!xe->info.has_usm)
-		return;
-
-	destroy_workqueue(gt->usm.acc_wq);
-	destroy_workqueue(gt->usm.pf_wq);
-}
-
-static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	xe_dss_mask_t all_dss;
-	int num_dss, num_eus;
-
-	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
-		  XE_MAX_DSS_FUSE_BITS);
-
-	num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
-	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
-				XE_MAX_EU_FUSE_BITS) * num_dss;
-
-	/*
-	 * user can issue separate page faults per EU and per CS
-	 *
-	 * XXX: Multiplier required as compute UMD are getting PF queue errors
-	 * without it. Follow on why this multiplier is required.
-	 */
-#define PF_MULTIPLIER	8
-	pf_queue->num_dw =
-		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW * PF_MULTIPLIER;
-	pf_queue->num_dw = roundup_pow_of_two(pf_queue->num_dw);
-#undef PF_MULTIPLIER
-
-	pf_queue->gt = gt;
-	pf_queue->data = devm_kcalloc(xe->drm.dev, pf_queue->num_dw,
-				      sizeof(u32), GFP_KERNEL);
-	if (!pf_queue->data)
-		return -ENOMEM;
-
-	spin_lock_init(&pf_queue->lock);
-	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
-
-	return 0;
-}
-
-int xe_gt_pagefault_init(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	int i, ret = 0;
-
-	if (!xe->info.has_usm)
-		return 0;
-
-	for (i = 0; i < NUM_PF_QUEUE; ++i) {
-		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
-		if (ret)
-			return ret;
-	}
-	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
-		gt->usm.acc_queue[i].gt = gt;
-		spin_lock_init(&gt->usm.acc_queue[i].lock);
-		INIT_WORK(&gt->usm.acc_queue[i].worker, acc_queue_work_func);
-	}
-
-	gt->usm.pf_wq = alloc_workqueue("xe_gt_page_fault_work_queue",
-					WQ_UNBOUND | WQ_HIGHPRI, NUM_PF_QUEUE);
-	if (!gt->usm.pf_wq)
-		return -ENOMEM;
-
-	gt->usm.acc_wq = alloc_workqueue("xe_gt_access_counter_work_queue",
-					 WQ_UNBOUND | WQ_HIGHPRI,
-					 NUM_ACC_QUEUE);
-	if (!gt->usm.acc_wq) {
-		destroy_workqueue(gt->usm.pf_wq);
-		return -ENOMEM;
-	}
-
-	return devm_add_action_or_reset(xe->drm.dev, pagefault_fini, gt);
-}
-
-void xe_gt_pagefault_reset(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	int i;
-
-	if (!xe->info.has_usm)
-		return;
-
-	for (i = 0; i < NUM_PF_QUEUE; ++i) {
-		spin_lock_irq(&gt->usm.pf_queue[i].lock);
-		gt->usm.pf_queue[i].head = 0;
-		gt->usm.pf_queue[i].tail = 0;
-		spin_unlock_irq(&gt->usm.pf_queue[i].lock);
-	}
-
-	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
-		spin_lock(&gt->usm.acc_queue[i].lock);
-		gt->usm.acc_queue[i].head = 0;
-		gt->usm.acc_queue[i].tail = 0;
-		spin_unlock(&gt->usm.acc_queue[i].lock);
-	}
-}
-
-static int granularity_in_byte(int val)
-{
-	switch (val) {
-	case 0:
-		return SZ_128K;
-	case 1:
-		return SZ_2M;
-	case 2:
-		return SZ_16M;
-	case 3:
-		return SZ_64M;
-	default:
-		return 0;
-	}
-}
-
-static int sub_granularity_in_byte(int val)
-{
-	return (granularity_in_byte(val) / 32);
-}
-
-static void print_acc(struct xe_gt *gt, struct acc *acc)
-{
-	xe_gt_warn(gt, "Access counter request:\n"
-		   "\tType: %s\n"
-		   "\tASID: %d\n"
-		   "\tVFID: %d\n"
-		   "\tEngine: %d:%d\n"
-		   "\tGranularity: 0x%x KB Region/ %d KB sub-granularity\n"
-		   "\tSub_Granularity Vector: 0x%08x\n"
-		   "\tVA Range base: 0x%016llx\n",
-		   acc->access_type ? "AC_NTFY_VAL" : "AC_TRIG_VAL",
-		   acc->asid, acc->vfid, acc->engine_class, acc->engine_instance,
-		   granularity_in_byte(acc->granularity) / SZ_1K,
-		   sub_granularity_in_byte(acc->granularity) / SZ_1K,
-		   acc->sub_granularity, acc->va_range_base);
-}
-
-static struct xe_vma *get_acc_vma(struct xe_vm *vm, struct acc *acc)
-{
-	u64 page_va = acc->va_range_base + (ffs(acc->sub_granularity) - 1) *
-		sub_granularity_in_byte(acc->granularity);
-
-	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
-}
-
-static int handle_acc(struct xe_gt *gt, struct acc *acc)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_validation_ctx ctx;
-	struct drm_exec exec;
-	struct xe_vm *vm;
-	struct xe_vma *vma;
-	int ret = 0;
-
-	/* We only support ACC_TRIGGER at the moment */
-	if (acc->access_type != ACC_TRIGGER)
-		return -EINVAL;
-
-	vm = asid_to_vm(xe, acc->asid);
-	if (IS_ERR(vm))
-		return PTR_ERR(vm);
-
-	down_read(&vm->lock);
-
-	/* Lookup VMA */
-	vma = get_acc_vma(vm, acc);
-	if (!vma) {
-		ret = -EINVAL;
-		goto unlock_vm;
-	}
-
-	trace_xe_vma_acc(vma);
-
-	/* Userptr or null can't be migrated, nothing to do */
-	if (xe_vma_has_no_bo(vma))
-		goto unlock_vm;
-
-	/* Lock VM and BOs dma-resv */
-	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
-	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, IS_DGFX(vm->xe), tile->mem.vram);
-		drm_exec_retry_on_contention(&exec);
-		xe_validation_retry_on_oom(&ctx, &ret);
-	}
-
-	xe_validation_ctx_fini(&ctx);
-unlock_vm:
-	up_read(&vm->lock);
-	xe_vm_put(vm);
-
-	return ret;
-}
-
-#define make_u64(hi__, low__)  ((u64)(hi__) << 32 | (u64)(low__))
-
-#define ACC_MSG_LEN_DW        4
-
-static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
-{
-	const struct xe_guc_acc_desc *desc;
-	bool ret = false;
-
-	spin_lock(&acc_queue->lock);
-	if (acc_queue->tail != acc_queue->head) {
-		desc = (const struct xe_guc_acc_desc *)
-			(acc_queue->data + acc_queue->tail);
-
-		acc->granularity = FIELD_GET(ACC_GRANULARITY, desc->dw2);
-		acc->sub_granularity = FIELD_GET(ACC_SUBG_HI, desc->dw1) << 31 |
-			FIELD_GET(ACC_SUBG_LO, desc->dw0);
-		acc->engine_class = FIELD_GET(ACC_ENG_CLASS, desc->dw1);
-		acc->engine_instance = FIELD_GET(ACC_ENG_INSTANCE, desc->dw1);
-		acc->asid =  FIELD_GET(ACC_ASID, desc->dw1);
-		acc->vfid =  FIELD_GET(ACC_VFID, desc->dw2);
-		acc->access_type = FIELD_GET(ACC_TYPE, desc->dw0);
-		acc->va_range_base = make_u64(desc->dw3 & ACC_VIRTUAL_ADDR_RANGE_HI,
-					      desc->dw2 & ACC_VIRTUAL_ADDR_RANGE_LO);
-
-		acc_queue->tail = (acc_queue->tail + ACC_MSG_LEN_DW) %
-				  ACC_QUEUE_NUM_DW;
-		ret = true;
-	}
-	spin_unlock(&acc_queue->lock);
-
-	return ret;
-}
-
-static void acc_queue_work_func(struct work_struct *w)
-{
-	struct acc_queue *acc_queue = container_of(w, struct acc_queue, worker);
-	struct xe_gt *gt = acc_queue->gt;
-	struct acc acc = {};
-	unsigned long threshold;
-	int ret;
-
-	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
-
-	while (get_acc(acc_queue, &acc)) {
-		ret = handle_acc(gt, &acc);
-		if (unlikely(ret)) {
-			print_acc(gt, &acc);
-			xe_gt_warn(gt, "ACC: Unsuccessful %pe\n", ERR_PTR(ret));
-		}
-
-		if (time_after(jiffies, threshold) &&
-		    acc_queue->tail != acc_queue->head) {
-			queue_work(gt->usm.acc_wq, w);
-			break;
-		}
-	}
-}
-
-static bool acc_queue_full(struct acc_queue *acc_queue)
-{
-	lockdep_assert_held(&acc_queue->lock);
-
-	return CIRC_SPACE(acc_queue->head, acc_queue->tail, ACC_QUEUE_NUM_DW) <=
-		ACC_MSG_LEN_DW;
-}
-
-int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	struct acc_queue *acc_queue;
-	u32 asid;
-	bool full;
-
-	/*
-	 * The below logic doesn't work unless ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW == 0
-	 */
-	BUILD_BUG_ON(ACC_QUEUE_NUM_DW % ACC_MSG_LEN_DW);
-
-	if (unlikely(len != ACC_MSG_LEN_DW))
-		return -EPROTO;
-
-	asid = FIELD_GET(ACC_ASID, msg[1]);
-	acc_queue = &gt->usm.acc_queue[asid % NUM_ACC_QUEUE];
-
-	spin_lock(&acc_queue->lock);
-	full = acc_queue_full(acc_queue);
-	if (!full) {
-		memcpy(acc_queue->data + acc_queue->head, msg,
-		       len * sizeof(u32));
-		acc_queue->head = (acc_queue->head + len) % ACC_QUEUE_NUM_DW;
-		queue_work(gt->usm.acc_wq, &acc_queue->worker);
-	} else {
-		xe_gt_warn(gt, "ACC Queue full, dropping ACC\n");
-	}
-	spin_unlock(&acc_queue->lock);
-
-	return full ? -ENOSPC : 0;
-}
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
deleted file mode 100644
index 839c065a5e4c..000000000000
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#ifndef _XE_GT_PAGEFAULT_H_
-#define _XE_GT_PAGEFAULT_H_
-
-#include <linux/types.h>
-
-struct xe_gt;
-struct xe_guc;
-
-int xe_gt_pagefault_init(struct xe_gt *gt);
-void xe_gt_pagefault_reset(struct xe_gt *gt);
-int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
-int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
-
-#endif	/* _XE_GT_PAGEFAULT_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 0b525643a048..0a728180b6fe 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -220,71 +220,6 @@ struct xe_gt {
 		 * operations (e.g. migrations, fixing page tables)
 		 */
 		u16 reserved_bcs_instance;
-		/** @usm.pf_wq: page fault work queue, unbound, high priority */
-		struct workqueue_struct *pf_wq;
-		/** @usm.acc_wq: access counter work queue, unbound, high priority */
-		struct workqueue_struct *acc_wq;
-		/**
-		 * @usm.pf_queue: Page fault queue used to sync faults so faults can
-		 * be processed not under the GuC CT lock. The queue is sized so
-		 * it can sync all possible faults (1 per physical engine).
-		 * Multiple queues exist for page faults from different VMs to be
-		 * processed in parallel.
-		 */
-		struct pf_queue {
-			/** @usm.pf_queue.gt: back pointer to GT */
-			struct xe_gt *gt;
-			/** @usm.pf_queue.data: data in the page fault queue */
-			u32 *data;
-			/**
-			 * @usm.pf_queue.num_dw: number of DWORDS in the page
-			 * fault queue. Dynamically calculated based on the number
-			 * of compute resources available.
-			 */
-			u32 num_dw;
-			/**
-			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
-			 * moved by worker which processes faults (consumer).
-			 */
-			u16 tail;
-			/**
-			 * @usm.pf_queue.head: head pointer in DWs for page fault queue,
-			 * moved by G2H handler (producer).
-			 */
-			u16 head;
-			/** @usm.pf_queue.lock: protects page fault queue */
-			spinlock_t lock;
-			/** @usm.pf_queue.worker: to process page faults */
-			struct work_struct worker;
-#define NUM_PF_QUEUE	4
-		} pf_queue[NUM_PF_QUEUE];
-		/**
-		 * @usm.acc_queue: Same as page fault queue, cannot process access
-		 * counters under CT lock.
-		 */
-		struct acc_queue {
-			/** @usm.acc_queue.gt: back pointer to GT */
-			struct xe_gt *gt;
-#define ACC_QUEUE_NUM_DW	128
-			/** @usm.acc_queue.data: data in the page fault queue */
-			u32 data[ACC_QUEUE_NUM_DW];
-			/**
-			 * @usm.acc_queue.tail: tail pointer in DWs for access counter queue,
-			 * moved by worker which processes counters
-			 * (consumer).
-			 */
-			u16 tail;
-			/**
-			 * @usm.acc_queue.head: head pointer in DWs for access counter queue,
-			 * moved by G2H handler (producer).
-			 */
-			u16 head;
-			/** @usm.acc_queue.lock: protects page fault queue */
-			spinlock_t lock;
-			/** @usm.acc_queue.worker: to process access counters */
-			struct work_struct worker;
-#define NUM_ACC_QUEUE	4
-		} acc_queue[NUM_ACC_QUEUE];
 	} usm;
 
 	/** @ordered_wq: used to serialize GT resets and TDRs */
-- 
2.34.1

