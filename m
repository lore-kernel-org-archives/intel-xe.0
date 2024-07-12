Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F38C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7457310EB81;
	Fri, 12 Jul 2024 21:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWTZwr8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DE810EA79
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819762; x=1752355762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KO5l6MHJ4aQTgLNpv08NRZR+HtrZDJ7/V++LrllgpkQ=;
 b=mWTZwr8RKn5WM+vPV+371jowHbaPF1LLF3VmxDq4ubzZQpsPlRdV4e8a
 dcMuhi6F/uhXrGG2kEULZe9a6LmaNBNAWhSWFjBQYQ5UqAjuqn69aXgGZ
 vdWuYqS6onVwc0v/r6517VWpfvQ3/FnJ9v55d+NfHDnLrvFQ8mYhtkMFe
 VWQMnk8FFtedscWawGOKNTsm5WagasLQnP3q33ZHHMc9FrOROmGmP8ri4
 gvF6Vn7rDJwtuX0vk0Xqg5+b2bR1ICskpeytRMLaDoaxSWbVq/Ik9TQsP
 VxBqv1z7RCjH6w5yQjWZCpxS63205r49GGmLN2NbZbKHsU/j4apcpwaY9 w==;
X-CSE-ConnectionGUID: fJo8/k47Q1Kn2jv+rx1Hbg==
X-CSE-MsgGUID: Xnf3Q+DaQgeUuIbHjsaL/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990155"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990155"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:22 -0700
X-CSE-ConnectionGUID: VvhTzR3PQuuU7swlB0H8vw==
X-CSE-MsgGUID: gSE6ewgiQju+mzY5O+2zEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864577"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:23 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC 03/14] drm/xe/pxp: Allocate PXP execution resources
Date: Fri, 12 Jul 2024 14:28:47 -0700
Message-ID: <20240712212901.2684239-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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

PXP requires submissions to the HW for the following operations

1) Key invalidation, done via the VCS engine
2) Communication with the GSC FW for session management, done via the
   GSCCS

For #1 we can allocate a simple kernel context, but #2 requires the
submissions to be done with PPGTT, which is not currently supported in Xe.
To add this support, the following changes have been included:

- a new type of kernel-owned VM (marked as GSC)
- a new function to map a BO into a VM from within the kernel

RFC note: I've tweaked some of the VM functions to return the fence
further up the stack, so I can wait on it from the PXP code. Not sure if
this is the best approach.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |   7 +
 drivers/gpu/drm/xe/xe_exec_queue.c            |   3 +
 drivers/gpu/drm/xe/xe_pxp.c                   |  25 ++-
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 188 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |  16 ++
 drivers/gpu/drm/xe/xe_pxp_types.h             |  33 +++
 drivers/gpu/drm/xe/xe_vm.c                    | 100 +++++++++-
 drivers/gpu/drm/xe/xe_vm.h                    |   6 +
 drivers/gpu/drm/xe/xe_vm_types.h              |   1 +
 10 files changed, 372 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_pxp_submit.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5f15e6dd5057..a4514265085b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -105,6 +105,7 @@ xe-y += xe_bb.o \
 	xe_pt.o \
 	xe_pt_walk.o \
 	xe_pxp.o \
+	xe_pxp_submit.o \
 	xe_query.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
index 57520809e48d..f3c4cf10ba20 100644
--- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
+++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
@@ -6,6 +6,7 @@
 #ifndef _ABI_GSC_PXP_COMMANDS_ABI_H
 #define _ABI_GSC_PXP_COMMANDS_ABI_H
 
+#include <linux/sizes.h>
 #include <linux/types.h>
 
 /* Heci client ID for PXP commands */
@@ -13,6 +14,12 @@
 
 #define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
 
+/*
+ * A PXP sub-section in an HECI packet can be up to 64K big in each direction.
+ * This does not include the top-level GSC header.
+ */
+#define PXP_MAX_PACKET_SIZE SZ_64K
+
 /*
  * there are a lot of status codes for PXP, but we only define the cross-API
  * common ones that we actually can handle in the kernel driver. Other failure
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 0ba37835849b..bc6e867aba17 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -131,6 +131,9 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	struct xe_exec_queue *q;
 	int err;
 
+	/* VMs for GSCCS queues (and only those) must have the XE_VM_FLAG_GSC flag */
+	xe_assert(xe, !vm || (!!(vm->flags & XE_VM_FLAG_GSC) == !!(hwe->engine_id == XE_HW_ENGINE_GSCCS0)));
+
 	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
 				  extensions);
 	if (IS_ERR(q))
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index cdb29b104006..01386b9f0c50 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_mmio.h"
+#include "xe_pxp_submit.h"
 #include "xe_pxp_types.h"
 #include "xe_uc_fw.h"
 #include "regs/xe_pxp_regs.h"
@@ -50,6 +51,20 @@ static int kcr_pxp_enable(const struct xe_pxp *pxp)
 	return kcr_pxp_set_status(pxp, true);
 }
 
+static int kcr_pxp_disable(const struct xe_pxp *pxp)
+{
+	return kcr_pxp_set_status(pxp, false);
+}
+
+static void pxp_fini(void *arg)
+{
+	struct xe_pxp *pxp = arg;
+
+	xe_pxp_destroy_execution_resources(pxp);
+
+	/* no need to explicitly disable KCR since we're going to do an FLR */
+}
+
 /**
  * xe_pxp_init - initialize PXP support
  * @xe: the xe_device structure
@@ -97,7 +112,15 @@ int xe_pxp_init(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_pxp_allocate_execution_resources(pxp);
+	if (err)
+		goto kcr_disable;
+
 	xe->pxp = pxp;
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, pxp_fini, pxp);
+
+kcr_disable:
+	kcr_pxp_disable(pxp);
+	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
new file mode 100644
index 000000000000..4fc3c7c58101
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation.
+ */
+
+#include "xe_pxp_submit.h"
+
+#include <drm/xe_drm.h>
+
+#include "xe_device_types.h"
+#include "xe_bo.h"
+#include "xe_exec_queue.h"
+#include "xe_gsc_submit.h"
+#include "xe_gt.h"
+#include "xe_pxp_types.h"
+#include "xe_vm.h"
+#include "regs/xe_gt_regs.h"
+
+static int create_vcs_context(struct xe_pxp *pxp)
+{
+	struct xe_gt *gt = pxp->gt;
+	struct xe_hw_engine *hwe;
+	struct xe_exec_queue *q;
+
+	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_VIDEO_DECODE, 0, true);
+	if (!hwe)
+		return -ENODEV;
+
+	q = xe_exec_queue_create(pxp->xe, NULL, BIT(hwe->logical_instance), 1, hwe,
+				 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
+	if (IS_ERR(q))
+		return PTR_ERR(q);
+
+	pxp->vcs_queue = q;
+
+	return 0;
+}
+
+static void destroy_vcs_context(struct xe_pxp *pxp)
+{
+	if (pxp->vcs_queue)
+		xe_exec_queue_put(pxp->vcs_queue);
+}
+
+/*
+ * We allocate a single object for the batch and the input and output BOs. PXP
+ * commands can require a lot of BO space (see PXP_MAX_PACKET_SIZE), but we
+ * currently only support a subset of commands that are small (< 20 dwords),
+ * so a single page is enough for now.
+ */
+#define PXP_BB_SIZE		XE_PAGE_SIZE
+#define PXP_INOUT_SIZE		XE_PAGE_SIZE
+#define PXP_BO_SIZE		(PXP_BB_SIZE + (2 * PXP_INOUT_SIZE))
+#define PXP_BB_OFFSET		0
+#define PXP_MSG_IN_OFFSET 	PXP_BB_SIZE
+#define PXP_MSG_OUT_OFFSET 	(PXP_MSG_IN_OFFSET + PXP_INOUT_SIZE)
+static int allocate_gsc_execution_resources(struct xe_pxp *pxp)
+{
+	struct xe_gt *gt = pxp->gt;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = pxp->xe;
+	struct xe_hw_engine *hwe;
+	struct xe_vm *vm;
+	struct xe_bo *bo;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+	long timeout;
+	int err = 0;
+
+	hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_OTHER, OTHER_GSC_INSTANCE, false);
+
+	/* we shouldn't reach here if the GSC engine is not available */
+	xe_assert(xe, hwe);
+
+	/* PXP instructions must be issued from PPGTT */
+	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
+	if (IS_ERR(vm))
+		return PTR_ERR(vm);
+
+	/* We allocate a single object for the batch and the in/out memory */
+	xe_vm_lock(vm, false);
+	bo = xe_bo_create_pin_map(xe, tile, vm, PXP_BO_SIZE, ttm_bo_type_kernel,
+				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_NEEDS_UC);
+	xe_vm_unlock(vm);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		goto vm_out;
+	}
+
+	fence = xe_vm_bind_bo(vm, bo, NULL, 0, XE_CACHE_WB);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto bo_out;
+	}
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+	dma_fence_put(fence);
+	if (timeout <= 0) {
+		err = timeout ?: -ETIME;
+		goto bo_out;
+	}
+
+	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
+				 EXEC_QUEUE_FLAG_KERNEL |
+				 EXEC_QUEUE_FLAG_PERMANENT, 0);
+	if (IS_ERR(q)) {
+		err = PTR_ERR(q);
+		goto bo_out;
+	}
+
+	pxp->gsc_exec.vm = vm;
+	pxp->gsc_exec.bo = bo;
+	pxp->gsc_exec.batch = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_BB_OFFSET);
+	pxp->gsc_exec.msg_in = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_MSG_IN_OFFSET);
+	pxp->gsc_exec.msg_out = IOSYS_MAP_INIT_OFFSET(&bo->vmap, PXP_MSG_OUT_OFFSET);
+	pxp->gsc_exec.q = q;
+
+	/* initialize host-session-handle (for all Xe-to-gsc-firmware PXP cmds) */
+	pxp->gsc_exec.host_session_handle = xe_gsc_create_host_session_id();
+
+	return 0;
+
+bo_out:
+	xe_vm_lock(vm, false);
+	xe_bo_unpin(bo);
+	xe_vm_unlock(vm);
+
+	xe_bo_put(bo);
+vm_out:
+	xe_vm_close_and_put(vm);
+
+	return err;
+}
+
+static void destroy_gsc_execution_resources(struct xe_pxp *pxp)
+{
+	if (!pxp->gsc_exec.q)
+		return;
+
+	iosys_map_clear(&pxp->gsc_exec.msg_out);
+	iosys_map_clear(&pxp->gsc_exec.msg_in);
+	iosys_map_clear(&pxp->gsc_exec.batch);
+
+	xe_exec_queue_put(pxp->gsc_exec.q);
+
+	xe_vm_lock(pxp->gsc_exec.vm, false);
+	xe_bo_unpin(pxp->gsc_exec.bo);
+	xe_vm_unlock(pxp->gsc_exec.vm);
+	xe_bo_put(pxp->gsc_exec.bo);
+
+	xe_vm_close_and_put(pxp->gsc_exec.vm);
+}
+
+/**
+ * xe_pxp_allocate_execution_resources - Allocate PXP submission objects
+ * @pxp: the xe_pxp structure
+ *
+ * Allocates exec_queues objects for VCS and GSCCS submission. The GSCCS
+ * submissions are done via PPGTT, so this function allocates a VM for it and
+ * maps the object into it.
+ *
+ * Returns 0 if the allocation and mapping is successful, an errno value
+ * otherwise.
+ */
+int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp)
+{
+	int err;
+
+	err = create_vcs_context(pxp);
+	if (err)
+		return err;
+
+	err = allocate_gsc_execution_resources(pxp);
+	if (err)
+		goto destroy_vcs_context;
+
+	return 0;
+
+destroy_vcs_context:
+	destroy_vcs_context(pxp);
+	return err;
+}
+
+void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
+{
+	destroy_gsc_execution_resources(pxp);
+	destroy_vcs_context(pxp);
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
new file mode 100644
index 000000000000..1a971fadc081
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_PXP_SUBMIT_H__
+#define __XE_PXP_SUBMIT_H__
+
+#include <linux/types.h>
+
+struct xe_pxp;
+
+int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
+void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
+
+#endif /* __XE_PXP_SUBMIT_H__ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index 1561e3bd2676..c16813253b47 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -6,10 +6,14 @@
 #ifndef __XE_PXP_TYPES_H__
 #define __XE_PXP_TYPES_H__
 
+#include <linux/iosys-map.h>
 #include <linux/types.h>
 
+struct xe_bo;
+struct xe_exec_queue;
 struct xe_device;
 struct xe_gt;
+struct xe_vm;
 
 /**
  * struct xe_pxp - pxp state
@@ -23,6 +27,35 @@ struct xe_pxp {
 	 * (VDBOX, KCR and GSC)
 	 */
 	struct xe_gt *gt;
+
+	/** @vcs_queue: kernel-owned VCS exec queue used for PXP operations */
+	struct xe_exec_queue *vcs_queue;
+
+	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
+	struct {
+		/**
+		 * @gsc_exec.host_session_handle: handle used in communications
+		 * with the GSC firmware.
+		 */
+		u64 host_session_handle;
+		/** @gsc_exec.vm: VM used for PXP submissions to the GSCCS */
+		struct xe_vm *vm;
+		/** @gsc_exec.q: GSCCS exec queue for PXP submissions */
+		struct xe_exec_queue *q;
+
+		/**
+		 * @gsc_exec.bo: BO used for submissions to the GSCCS and GSC
+		 * FW. It includes space for the GSCCS batch and the
+		 * input/output buffers read/written by the FW
+		 */
+		struct xe_bo *bo;
+		/** @gsc_exec.batch: iosys_map to the batch memory within the BO */
+		struct iosys_map batch;
+		/** @gsc_exec.msg_in: iosys_map to the input memory within the BO */
+		struct iosys_map msg_in;
+		/** @gsc_exec.msg_out: iosys_map to the output memory within the BO */
+		struct iosys_map msg_out;
+	} gsc_exec;
 };
 
 #endif /* __XE_PXP_TYPES_H__ */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 02f684c0330d..412ec9cb9650 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1315,6 +1315,15 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	struct xe_tile *tile;
 	u8 id;
 
+	/*
+	 * All GSC VMs are owned by the kernel and can also only be used on
+	 * the GSCCS. We don't want a kernel-owned VM to put the device in
+	 * either fault or not fault mode, so we need to exclude the GSC VMs
+	 * from that count; this is only safe if we ensure that all GSC VMs are
+	 * non-faulting.
+	 */
+	xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
+
 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
 	if (!vm)
 		return ERR_PTR(-ENOMEM);
@@ -1442,7 +1451,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	mutex_lock(&xe->usm.lock);
 	if (flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode++;
-	else if (!(flags & XE_VM_FLAG_MIGRATION))
+	else if (!(flags & (XE_VM_FLAG_MIGRATION | XE_VM_FLAG_GSC)))
 		xe->usm.num_vm_in_non_fault_mode++;
 	mutex_unlock(&xe->usm.lock);
 
@@ -2867,11 +2876,10 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 	for (i = 0; i < vops->num_syncs; i++)
 		xe_sync_entry_signal(vops->syncs + i, fence);
 	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	dma_fence_put(fence);
 }
 
-static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops)
+static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
+						   struct xe_vma_ops *vops)
 {
 	struct drm_exec exec;
 	struct dma_fence *fence;
@@ -2889,7 +2897,6 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
 			xe_vm_kill(vm, false);
 			goto unlock;
@@ -2900,7 +2907,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 unlock:
 	drm_exec_fini(&exec);
-	return err;
+	return fence;
 }
 
 #define SUPPORTED_FLAGS	\
@@ -3114,6 +3121,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
 	struct xe_vma_ops vops;
+	struct dma_fence *fence;
 	int err;
 	int i;
 
@@ -3264,7 +3272,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
-	err = vm_bind_ioctl_ops_execute(vm, &vops);
+	fence = vm_bind_ioctl_ops_execute(vm, &vops);
+	if (IS_ERR(fence))
+		err = PTR_ERR(fence);
+	else
+		dma_fence_put(fence);
 
 unwind_ops:
 	if (err && err != -ENODATA)
@@ -3297,6 +3309,80 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+/**
+ * xe_vm_bind_bo - bind a kernel BO to a VM
+ * @vm: VM to bind the BO to
+ * @bo: BO to bind
+ * @q: exec queue to use for the bind (optional)
+ * @addr: address at which to bind the BO
+ * @cache_lvl: PAT cache level to use
+ *
+ * Execute a VM bind map operation on a kernel-owned BO to bind it into a
+ * kernel-owned VM.
+ *
+ * Returns 0 if the ops execution is successful, an errno value otherwise.
+ * TODO: return a fence instead.
+ */
+struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
+				struct xe_exec_queue *q, u64 addr,
+				enum xe_cache_level cache_lvl)
+{
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct dma_fence *fence;
+	int err;
+
+	xe_bo_get(bo);
+	xe_vm_get(vm);
+	if (q)
+		xe_exec_queue_get(q);
+
+	down_write(&vm->lock);
+
+	xe_vma_ops_init(&vops, vm, q, NULL, 0);
+
+	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
+				       DRM_XE_VM_BIND_OP_MAP, 0,
+				       vm->xe->pat.idx[cache_lvl], 0);
+	if (IS_ERR(ops)) {
+		err = PTR_ERR(ops);
+		goto release_vm_lock;
+	}
+
+	err = vm_bind_ioctl_ops_parse(vm, q, ops, NULL, 0, &vops, true);
+	if (err)
+		goto release_vm_lock;
+
+	/* Nothing to do */
+	if (list_empty(&vops.list)) {
+		err = -ENODATA;
+		goto unwind_ops;
+	}
+
+	fence = vm_bind_ioctl_ops_execute(vm, &vops);
+	if (IS_ERR(fence))
+		err = PTR_ERR(fence);
+
+unwind_ops:
+	if (err && err != -ENODATA)
+		vm_bind_ioctl_ops_unwind(vm, &ops, 1);
+
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+
+release_vm_lock:
+	up_write(&vm->lock);
+
+	if (q)
+		xe_exec_queue_put(q);
+	xe_vm_put(vm);
+	xe_bo_put(bo);
+
+	if (err)
+		fence = ERR_PTR(err);
+
+	return fence;
+}
+
 /**
  * xe_vm_lock() - Lock the vm's dma_resv object
  * @vm: The struct xe_vm whose lock is to be locked
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b481608b12f1..5e298ac90dfc 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -19,6 +19,8 @@ struct drm_file;
 struct ttm_buffer_object;
 struct ttm_validate_buffer;
 
+struct dma_fence;
+
 struct xe_exec_queue;
 struct xe_file;
 struct xe_sync_entry;
@@ -248,6 +250,10 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences);
 
+struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
+				struct xe_exec_queue *q, u64 addr,
+				enum xe_cache_level cache_lvl);
+
 /**
  * xe_vm_resv() - Return's the vm's reservation object
  * @vm: The vm
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..60ce327d303c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -152,6 +152,7 @@ struct xe_vm {
 #define XE_VM_FLAG_BANNED		BIT(5)
 #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
 #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
+#define XE_VM_FLAG_GSC			BIT(8)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
-- 
2.43.0

