Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7C1CA0FF7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 20:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1504010E8B1;
	Wed, 27 Aug 2025 20:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfSBqsMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0603510E8AA
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756325649; x=1787861649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zQtUor/kF9vwdpGdvl1UmTBT8maon/o80Mn17jlJ3lA=;
 b=XfSBqsMutg78n3Zu7HLPPDxFKnvzBoiLGYUlnp3mTSggoMAVKyh/CFb8
 TedsbFZy6Nw8cZEs0XTMmmzFk0lqQ6zSR4ivdm4vi/HLEtVeqWf249xef
 IeFU2PaaeHAPV5l1NTYpfZBTuU1xXzTJijdJrlRg52dOWX83rrKCAyxm5
 ufFksIRyoJLwzmTK5dVvktE2aDMHTNiKUfbEapBjWDSeXNrCSyIYgMJ4P
 MO//40YP8NFyodA0Tm9btZ1r8qOICS3pP0XHl3kqHZcziSoiK+F/AQHBI
 ZCKCK0cCOxd6ZRMG7VIlKXH+rhIgfrPLgnxBSbloF8TfARrbEaMPPMvTS g==;
X-CSE-ConnectionGUID: Wy2pFEELRF2D71zZT0kZYQ==
X-CSE-MsgGUID: 4DXMFlpoTuuZoSuRznJEeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58439696"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58439696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:14:08 -0700
X-CSE-ConnectionGUID: UzBoSg7uR1C9d8RxdFcCUw==
X-CSE-MsgGUID: SR+RCIyWTGaBjKZ4m4UXRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169221889"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 13:14:08 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v5 2/3] Revert "drm/xe: Add VM bind IOCTL error injection"
Date: Wed, 27 Aug 2025 20:14:08 +0000
Message-ID: <20250827201405.116855-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827201405.116855-5-jonathan.cavitt@intel.com>
References: <20250827201405.116855-5-jonathan.cavitt@intel.com>
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

This reverts commit 04e9c0ce19ac68afd8be7fd54772db3b0356cf75.

Error injection should use the error injection interface, and should be
decoupled from CONFIG_DRM_XE_DEBUG.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 12 ------------
 drivers/gpu/drm/xe/xe_pt.c           | 12 ------------
 drivers/gpu/drm/xe/xe_vm.c           | 23 +----------------------
 drivers/gpu/drm/xe/xe_vm_types.h     | 14 --------------
 4 files changed, 1 insertion(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 092004d14db2..ef4b843dbd7d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -27,10 +27,6 @@
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define TEST_VM_OPS_ERROR
-#endif
-
 struct dram_info;
 struct intel_display;
 struct intel_dg_nvm_dev;
@@ -565,14 +561,6 @@ struct xe_device {
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
-#ifdef TEST_VM_OPS_ERROR
-	/**
-	 * @vm_inject_error_position: inject errors at different places in VM
-	 * bind IOCTL based on this value
-	 */
-	u8 vm_inject_error_position;
-#endif
-
 #if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
 	/**
 	 * @global_total_pages: global GPU page usage tracked for gpu_mem
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e1b2da20b881..d15f5dac88b7 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2163,12 +2163,6 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_tile_assert(tile, pt_update_ops->current_op <=
 		       pt_update_ops->num_ops);
 
-#ifdef TEST_VM_OPS_ERROR
-	if (vops->inject_error &&
-	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
-		return -ENOSPC;
-#endif
-
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
@@ -2409,12 +2403,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		return dma_fence_get_stub();
 	}
 
-#ifdef TEST_VM_OPS_ERROR
-	if (vops->inject_error &&
-	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
-		return ERR_PTR(-ENOSPC);
-#endif
-
 	if (pt_update_ops->needs_invalidation) {
 		struct xe_exec_queue *q = pt_update_ops->q;
 		struct xe_dep_scheduler *dep_scheduler =
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 04e98c7e8935..5602e6cb4a72 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3222,12 +3222,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 			return err;
 	}
 
-#ifdef TEST_VM_OPS_ERROR
-	if (vops->inject_error &&
-	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
-		return -ENOSPC;
-#endif
-
 	return 0;
 }
 
@@ -3472,7 +3466,7 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 }
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 
-#define SUPPORTED_FLAGS_STUB  \
+#define SUPPORTED_FLAGS	\
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
@@ -3480,12 +3474,6 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
 	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
 
-#ifdef TEST_VM_OPS_ERROR
-#define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
-#else
-#define SUPPORTED_FLAGS	SUPPORTED_FLAGS_STUB
-#endif
-
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -3868,15 +3856,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
 		if (err)
 			goto unwind_ops;
-
-#ifdef TEST_VM_OPS_ERROR
-		if (flags & FORCE_OP_ERROR) {
-			vops.inject_error = true;
-			vm->xe->vm_inject_error_position =
-				(vm->xe->vm_inject_error_position + 1) %
-				FORCE_OP_ERROR_COUNT;
-		}
-#endif
 	}
 
 	/* Nothing to do */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index b5108d010786..a7a9e80777f3 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -25,16 +25,6 @@ struct xe_user_fence;
 struct xe_vm;
 struct xe_vm_pgtable_update_op;
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
-#define TEST_VM_OPS_ERROR
-#define FORCE_OP_ERROR	BIT(31)
-
-#define FORCE_OP_ERROR_LOCK	0
-#define FORCE_OP_ERROR_PREPARE	1
-#define FORCE_OP_ERROR_RUN	2
-#define FORCE_OP_ERROR_COUNT	3
-#endif
-
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
 #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
 #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
@@ -512,10 +502,6 @@ struct xe_vma_ops {
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
 #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
 	u32 flags;
-#ifdef TEST_VM_OPS_ERROR
-	/** @inject_error: inject error to test error handling */
-	bool inject_error;
-#endif
 };
 
 #endif
-- 
2.43.0

