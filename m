Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2CDC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95310E987;
	Fri, 14 Mar 2025 07:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4AQ+lkn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1005E10E987
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937930; x=1773473930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srwJkkmNDA89PDY2Uh3tpS5CWWJBUqg7g81dpWQmDdI=;
 b=A4AQ+lkn9NootoyW8dhy3Bk0HOWMkkxH+VkxyBf9d/Qocs52QB562Qbq
 RcPQu2oVcLR2qBMAnGK8LHadQECkbLzI83wizVVkRBwrTYIcoljzILRy3
 aymIrEs96cAorDuszT/5WNJDBvlkBJVfogHlvDDn3PkP81vpTfrxwUp8c
 fQFhbGnqXiRVQVkLLLIig6HMFDzqKBeJc3mQnYX99oGCvpDa4u2xrtZqB
 JZKDTEgLW7yK1g0nWWrCG/6sJdHtoR/mPWZhevNxQFCdaVtlQ520bDLLA
 RP4KhTsKQJQohSi43nk842rioGgzXBivdzEml/tMjsNHS7L27CMFrgcz3 w==;
X-CSE-ConnectionGUID: ytcBxVDPTNuxkkvYV0yOhA==
X-CSE-MsgGUID: lsAN4PQ2R1GbsdlZfek6+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446069"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:38:50 -0700
X-CSE-ConnectionGUID: rVXYDIAqSXC+DpCpCUJAAA==
X-CSE-MsgGUID: AGClIFyGRXCjIRBX0JOPhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043841"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:48 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 19/29] drm/xe/svm: Split system allocator vma incase of madvise
 call
Date: Fri, 14 Mar 2025 13:32:16 +0530
Message-Id: <20250314080226.2059819-20-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 79 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  2 +
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b892b43d6665..b24bd078aeec 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4093,3 +4093,82 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
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
+	if (start & ~PAGE_MASK)
+		start = ALIGN_DOWN(start, SZ_4K);
+
+	if (range & ~PAGE_MASK)
+		range = ALIGN(range, SZ_4K);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+	ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, start, range, true, start);
+	if (!ops)
+		return 0;
+
+	if (IS_ERR(ops)) {
+		err = PTR_ERR(ops);
+		goto unwind_ops;
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
+			xe_assert(vm->xe, true);
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
+			vma = gpuva_to_vma(op->base.remap.unmap->va);
+			cp_mem_attr(&temp_attr, &vma->attr);
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
+		} else if (__op->op == DRM_GPUVA_OP_MAP) {
+			vma = op->map.vma;
+			cp_mem_attr(&vma->attr, &temp_attr);
+		}
+	}
+
+	xe_vm_unlock(vm);
+	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return 0;
+
+unwind_ops:
+	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
+	if (ops)
+		drm_gpuva_ops_free(&vm->gpuvm, ops);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 99e164852f63..4e45230b7205 100644
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

