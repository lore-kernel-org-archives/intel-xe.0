Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEC9C87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E144F10E0E9;
	Thu,  7 Aug 2025 16:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxsnxmxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A83B10E0E9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583417; x=1786119417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DdHu6iEd7EJ15O18Fir+UsFcC5mKiRhF5wEyuOD6TEw=;
 b=cxsnxmxZhbJVK8vJwYe0RW7CIjWVRHmPwmjb4f/srcnzznVrJrIs4I6M
 JijvFkXVo+VvYYdMSAaRoiq9pYV2uAknpH8LJHLzu/xoqWqnTs/XwEKvj
 O7eGpfV28q1SAq21QkB5yvm6LEQifQGC5CTxAliW7ejOuKNxYee59E4Q7
 6Xyq/oumgi/0huCXdlWvN0SjHobom6lJetGPErKauRNVSujgawlFYnMyL
 R/MjFugPgPgR/P5eMg7nFzG063BIf2s9pnsAKjerhYe0HV5gY+NOplvK6
 FWesSleRcJFs8auodi4QtI3Pv7gULXC8eI9mPbHPWkdCblB/rGM4uN5zr Q==;
X-CSE-ConnectionGUID: f7evzQAmQjK6de4hr9a45w==
X-CSE-MsgGUID: 7e/qyhDFT7eJawofg+MbjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845567"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845567"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:16:57 -0700
X-CSE-ConnectionGUID: MWX8f4cQTn20PjdgHoXWzw==
X-CSE-MsgGUID: W1Ec6P+9T/KXbBeAIDSSqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937807"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:16:55 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 10/26] drm/xe/svm: Split system allocator vma incase of
 madvise call
Date: Thu,  7 Aug 2025 22:13:22 +0530
Message-Id: <20250807164338.1832254-11-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

If the start or end of input address range lies within system allocator
vma split the vma to create new vma's as per input range.

v2 (Matthew Brost)
- Add lockdep_assert_write for vm->lock
- Remove unnecessary page aligned checks
- Add kerrnel-doc and comments
- Remove unnecessary unwind_ops and return

v3
- Fix copying of attributes

v4
- Nit fixes

v5
- Squash identifier for madvise in xe_vma_ops to this patch

v6/v7
- Rebase on drm_gpuvm changes

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 109 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h |   1 +
 3 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c5fe475b1fcc..d43de3101d4f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4178,3 +4178,112 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+/**
+ * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits existing vma to create new vma for user provided input range
+ *
+ *  Return: 0 if success
+ */
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	struct drm_gpuvm_map_req map_req = {
+		.op_map.va.addr = start,
+		.op_map.va.range = range,
+		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
+	};
+
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct drm_gpuva_op *__op;
+	bool is_cpu_addr_mirror = false;
+	bool remap_op = false;
+	struct xe_vma_mem_attr tmp_attr;
+	int err;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
+	if (IS_ERR(ops))
+		return PTR_ERR(ops);
+
+	if (list_empty(&ops->list)) {
+		err = 0;
+		goto free_ops;
+	}
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		if (__op->op == DRM_GPUVA_OP_REMAP) {
+			xe_assert(vm->xe, !remap_op);
+			remap_op = true;
+
+			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
+				is_cpu_addr_mirror = true;
+			else
+				is_cpu_addr_mirror = false;
+		}
+
+		if (__op->op == DRM_GPUVA_OP_MAP) {
+			xe_assert(vm->xe, remap_op);
+			remap_op = false;
+
+			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
+			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
+			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+			 */
+			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+		}
+
+		print_op(vm->xe, __op);
+	}
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
+	if (err)
+		goto unwind_ops;
+
+	xe_vm_lock(vm, false);
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma;
+
+		if (__op->op == DRM_GPUVA_OP_UNMAP) {
+			/* There should be no unmap */
+			XE_WARN_ON("UNEXPECTED UNMAP");
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			vma = gpuva_to_vma(op->base.remap.unmap->va);
+			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
+			 * to newly MAP created vma.
+			 */
+			tmp_attr = vma->attr;
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_MAP) {
+			vma = op->map.vma;
+			/* In case of madvise call, MAP will always be follwed by REMAP.
+			 * Therefore temp_attr will always have sane values, making it safe to
+			 * copy them to new vma.
+			 */
+			vma->attr = tmp_attr;
+		}
+	}
+
+	xe_vm_unlock(vm);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return 0;
+
+unwind_ops:
+	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
+free_ops:
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..0d6b08cc4163 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c30f404a00e3..cd94d8b5819d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -495,6 +495,7 @@ struct xe_vma_ops {
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 	/** @flag: signify the properties within xe_vma_ops*/
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
+#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

