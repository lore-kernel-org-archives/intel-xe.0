Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC2C61CE8
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB810E526;
	Tue, 27 May 2025 16:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcXzU8wW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C8710E181
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362519; x=1779898519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xs/DiprNaZ1zdflgOXXlqPefTcgrMzTTrNZpFyYjkAA=;
 b=CcXzU8wWu8Dpp/FKSho4nYat8WwgaIzaK5refymnmjvs//UZheLeJWop
 gw+FtNQPPZ4vT3iEkWknq//89WAMN/Gzl2iVtfHSUA8OCLFUbeUAGMeCC
 KVkw9oVCHiu0TNRdvNvNxlGAc6uzraioVWGIEpaNbJtV2azmOuNzVcd1D
 73R/FFPr5ymDSIif7IAzdGUMHd2hsYSUHBwOw6aacMx5Iy5GtDaZ/qmVO
 SZeSvpoAv0OtqxkIP4y0JrCnqgkw8aRZOivGlcVdi52LnXve1Hh1rn4mq
 7OmXvtqZU4hhNZc15BAFK0j1juf/RCvMwxystgBxWIfFiPuqspbAUtV+u Q==;
X-CSE-ConnectionGUID: ciky9E8VTvuQE47wkCZh0g==
X-CSE-MsgGUID: MMLQ6RZDQVCpzyQv5Bqq7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471871"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:34 -0700
X-CSE-ConnectionGUID: 8yUXxpsxQm2psmNC//78BA==
X-CSE-MsgGUID: YZuG4V6QTcudvRl2c3UH3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646070"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 09/19] drm/xe/svm: Split system allocator vma incase of
 madvise call
Date: Tue, 27 May 2025 22:09:53 +0530
Message-Id: <20250527164003.1068118-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 95 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  2 +
 2 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d60b711e97e9..c220bf904ee0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4161,3 +4161,98 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
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
+	struct xe_vma_ops vops;
+	struct drm_gpuva_ops *ops = NULL;
+	struct drm_gpuva_op *__op;
+	bool is_cpu_addr_mirror = false;
+	int err;
+
+	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
+					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
+					  NULL, start);
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
+			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
+				is_cpu_addr_mirror = true;
+			else
+				is_cpu_addr_mirror = false;
+		}
+
+		if (__op->op == DRM_GPUVA_OP_MAP)
+			/* In case of madvise ops DRM_GPUVA_OP_REMAP is always by
+			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
+			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+			 */
+			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+
+		print_op(vm->xe, __op);
+	}
+
+	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
+	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
+	if (err)
+		goto unwind_ops;
+
+	xe_vm_lock(vm, false);
+
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma;
+		struct xe_vma_mem_attr temp_attr;
+
+		if (__op->op == DRM_GPUVA_OP_UNMAP) {
+			/* There should be no unmap */
+			XE_WARN_ON("UNEXPECTED UNMAP");
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			vma = gpuva_to_vma(op->base.remap.unmap->va);
+			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
+			 * to newly MAPPED vma.
+			 */
+			cp_vma_mem_attr(&temp_attr, &vma->attr);
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_MAP) {
+			vma = op->map.vma;
+			cp_vma_mem_attr(&vma->attr, &temp_attr);
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
+	if (ops)
+		drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 1ef98113fa5b..8151b1b01a13 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
-- 
2.34.1

