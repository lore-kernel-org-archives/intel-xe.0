Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D9606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=COzf/ocx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8033D10EA00;
	Wed, 21 Oct 2026 04:13:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0BE10EA00
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556032; x=1824092032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oe7Z6XVdU+95yTm1+wBNAaXoDLXXiiEIdebdw4FIYVA=;
 b=COzf/ocxO0kYzpz5rjdBGoZL+cU4tZ4kVs/QgOmgUtAKtaIuoqZnOxry
 M44aW6vA8GEAuqGoKyG1c5BsvkDpeD0GwscSGB7E0Kyyu1+Ak+OJ5stAU
 XhVVnvGIb8KBRoSdTo0jhszSv9nnpNUyKIHzxY4n+RqHomqSbrH2+41c/
 uTBCDH7MDu52+VEQ//anoSqE4ttS9moPis7OSl48B8mFJQMcPlWUmUrwI
 luguMtO18Xw+JzkRqH5t8PXToOQw4qbNiJ82G8wRe18TzUca2EQrqSJ7m
 BVjTobnp9Gd4XxFdAKcMZoYvvaRfOymYAwkm8p6MZfxkP4XvnTMKtfUwf w==;
X-CSE-ConnectionGUID: aupvdVl2RqCIfSssl4JLmA==
X-CSE-MsgGUID: JXs7XKa/SySUCNd3m7EeUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264311"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264311"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:13:51 -0700
X-CSE-ConnectionGUID: MTct4ljYTgOw+ndB+TZjZA==
X-CSE-MsgGUID: 0jclMHQkSD6vstNjjkGcrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2868689"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 21:13:50 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 2/6] drm/xe/vm: Setup SVA infrastructure for PASID support
Date: Wed, 21 Oct 2026 09:41:13 +0530
Message-ID: <20261021041117.1774877-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Add sva_handle to struct xe_vm to represent the device-mm bond
established via iommu_sva_bind_device(). This handle will be used to
retrieve the PASID for SVM-enabled VMs

Introduce xe_vm_sva_bind() to bind the VM to the current process
address space using Shared Virtual Addressing(SVA) when ATS and
PASID are enabled on the device. This allows the GPU to shate the
same virtual address space as the CPU.

If sva binding fails, the VM continues without PASID support.
Also introduce a cleanup helper to unbind during VM teardown.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 40 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  6 +++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 761bc136145f..b1d37e5a673f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -45,6 +45,7 @@
 #include "xe_trace_bo.h"
 #include "xe_vm_madvise.h"
 #include "xe_wa.h"
+#include "xe_pci.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -1648,6 +1649,41 @@ static void xe_vm_init_prove_locking(struct xe_device *xe, struct xe_vm *vm)
 	up_read(&vm->exec_queues.lock);
 }
 
+static void xe_vm_sva_handle_init(struct xe_vm *vm)
+{
+	struct device *dev = vm->xe->drm.dev;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct iommu_sva *sva_handle;
+
+	/*
+	 * Assumes the IOMMU driver has already decided and latched the
+	 * device's ATS/PASID enablement by the time any VM is created (true
+	 * for Intel VT-d, which enables both eagerly at IOMMU probe). If a
+	 * backend instead enables them lazily on first SVA bind, this check
+	 * will never see them set and SVA/PASID support is silently skipped.
+	 */
+	if (!xe_pci_ats_pasid_enabled(pdev))
+		return;
+
+	sva_handle = iommu_sva_bind_device(dev, current->mm);
+	if (IS_ERR(sva_handle)) {
+		drm_err(&vm->xe->drm, "SVA binding failed, preventing PASID creation.\n");
+		return;
+	}
+
+	vm->sva_handle = sva_handle;
+}
+
+static void xe_vm_sva_handle_fini(struct xe_vm *vm)
+{
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+	if (!vm->sva_handle)
+		return;
+
+	iommu_sva_unbind_device(vm->sva_handle);
+	vm->sva_handle = NULL;
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1994,6 +2030,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	xe_svm_fini(vm);
 
+	xe_vm_sva_handle_fini(vm);
 	up_write(&vm->lock);
 
 	down_write(&xe->usm.lock);
@@ -2159,6 +2196,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	if (flags & XE_VM_FLAG_FAULT_MODE)
+		xe_vm_sva_handle_init(vm);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fb9305124679..113807fa4ea0 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -11,6 +11,7 @@
 #include <drm/drm_pagemap_util.h>
 
 #include <linux/dma-resv.h>
+#include <linux/iommu.h>
 #include <linux/kref.h>
 #include <linux/mmu_notifier.h>
 #include <linux/scatterlist.h>
@@ -423,6 +424,11 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: Xe file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+	/**
+	 * @sva_handle: the sva_handle to a device-mm bond, populated using
+	 * iommu_sva_bind_device(). To be used to determine pasid in case of svm vm.
+	 */
+	struct iommu_sva *sva_handle;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.43.0

