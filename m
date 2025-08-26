Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE06CA0FF6
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 17:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AF310E6B3;
	Tue, 26 Aug 2025 17:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXn7WFmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B429310E6B2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756230653; x=1787766653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y2hDOjHU9H2TNuYvDbjPkjVg3qq69uftT6rFPWMLee4=;
 b=gXn7WFmQkDYoMwMLLKveX6F27t7mqw3Igv9aYZ6Pym65gSQuOStyjwmC
 70bo3itq4RudL6KFmbQs8ZYUdkGOFnKfz4VTRVD5JU+yrOiZ7ZNsumlxt
 se8VXeNeNu4Tjw45WpmjrzyZgHSOdstKV4nfWZOjo3KSWAu+9OIZv2Eqv
 7RpH4D0kPjTVzcAxhJajLSrnIa3rkpUK4qMAfxFq0z6mqBnNYJ9Ne0E0T
 KXxFFhH2UPxH1cwn6ntHvp+3LR6dWvS4UwRB63W6pzoxiNYTRPn0QjMUw
 zKDRBGCtlPxDfYbQkmbyBPWEkgmqEUkaOmZvlQKjrvl4c/UrNG2AxX1yq w==;
X-CSE-ConnectionGUID: 8kMnwtiZQPSoZoZ02bMBXQ==
X-CSE-MsgGUID: OQ9sHLhtQT+Iy8xJOUMK7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61110842"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61110842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:50:52 -0700
X-CSE-ConnectionGUID: erbsidRxRiGCbxONwZeI0g==
X-CSE-MsgGUID: sg3novPmRxC5ZaxTGMeI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169150389"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 10:50:52 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH 1/2] Revert "drm/xe: Add VM bind IOCTL error injection"
Date: Tue, 26 Aug 2025 17:50:53 +0000
Message-ID: <20250826175051.92563-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826175051.92563-4-jonathan.cavitt@intel.com>
References: <20250826175051.92563-4-jonathan.cavitt@intel.com>
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
index 71fc29b3372a..42a7d910ca70 100644
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
index c0a70c80dff9..e7bccccdbc44 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2160,12 +2160,6 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
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
@@ -2396,12 +2390,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		return dma_fence_get_stub();
 	}
 
-#ifdef TEST_VM_OPS_ERROR
-	if (vops->inject_error &&
-	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
-		return ERR_PTR(-ENOSPC);
-#endif
-
 	if (pt_update_ops->needs_invalidation) {
 		ijob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
 						  tile->primary_gt,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e913efa2057b..1a8841116e40 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3218,12 +3218,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
 
@@ -3467,7 +3461,7 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 }
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
 
-#define SUPPORTED_FLAGS_STUB  \
+#define SUPPORTED_FLAGS	\
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
@@ -3475,12 +3469,6 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
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
 
@@ -3863,15 +3851,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

