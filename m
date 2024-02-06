Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B5EC48BC1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F71E112F6D;
	Tue,  6 Feb 2024 23:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFa69z9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB147112F6E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262615; x=1738798615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8/44KysiN7C85C9bSzyHAuO6vSNXAVwb+A+zxPtguQ=;
 b=SFa69z9PrWKDQaFMZjxnFRGO63BIP4K2Bi9LFtDeAzrGhVnHB4Dh4eYO
 /W5UZCXtBzkoVD5xgDpCOTWbQ+5M/hvpf19fO29cLFAClYzAi4oFV8TZf
 WMQtXhnioZr461Kr+LSmD8n1Lo6zZ5NTSqnXdTXrLzPZH1uRX1uCeYDqj
 GbBv9fICfFcYsEIyGIqn2zxRVocC9G7uec+8j7QQrExbHMUuKQqF4ADC+
 dNgZIxwDmmCJ7CWImTXIBlHLvMJ6LbQ/ZzK+1ro/nSsiKxKnEl3vWpFLU
 uKKOAryYuXfQeSk6VO3bH5J753BIPS788I+YeCopuE2uCcKFmHHign1W8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776805"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776805"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793849"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 22/22] drm/xe: Add VM bind IOCTL error injection
Date: Tue,  6 Feb 2024 15:37:29 -0800
Message-Id: <20240206233729.3173206-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

Add VM bind IOCTL error injection which steals MSB of the bind flags
field which if set injects errors at various points in the VM bind
IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_pt.c           | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h     | 14 ++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3018f1d79177..16bec6d7e724 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -22,6 +22,10 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define TEST_VM_OPS_ERROR
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "soc/intel_pch.h"
 #include "intel_display_core.h"
@@ -467,6 +471,14 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+#ifdef TEST_VM_OPS_ERROR
+	/**
+	 * @vm_inject_error_position: inject errors at different places in VM
+	 * bind IOCTL based on this value
+	 */
+	u8 vm_inject_error_position;
+#endif
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 26a00af6c4a6..818546cc216d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1748,6 +1748,12 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_tile_assert(tile, pt_update_ops->current_op ==
 		       pt_update_ops->num_ops);
 
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
+	       return -ENOSPC;
+#endif
+
 	return 0;
 }
 
@@ -1876,6 +1882,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
+	       return ERR_PTR(-ENOSPC);
+#endif
+
 	if (pt_update_ops->needs_invalidation) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3b3136045327..bd36512ef3d5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2394,6 +2394,12 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 			return err;
 	}
 
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
+	       return -ENOSPC;
+#endif
+
 	return 0;
 }
 
@@ -2601,9 +2607,15 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return err;
 }
 
+#ifdef TEST_VM_OPS_ERROR
+#define SUPPORTED_FLAGS	\
+	(FORCE_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
+#else
 #define SUPPORTED_FLAGS	\
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
+#endif
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -2931,6 +2943,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 					      &vops, i == args->num_binds - 1);
 		if (err)
 			goto unwind_ops;
+
+#ifdef TEST_VM_OPS_ERROR
+		if (flags & FORCE_OP_ERROR) {
+			vops.inject_error = true;
+			vm->xe->vm_inject_error_position =
+				(vm->xe->vm_inject_error_position + 1) %
+				FORCE_OP_ERROR_COUNT;
+		}
+#endif
 	}
 
 	/* Nothing to do */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7e639ed5ba4a..b7094fc69053 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -23,6 +23,16 @@ struct xe_sync_entry;
 struct xe_vm;
 struct xe_vm_pgtable_update_op;
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define TEST_VM_OPS_ERROR
+#define FORCE_OP_ERROR	BIT(31)
+
+#define FORCE_OP_ERROR_LOCK	0
+#define FORCE_OP_ERROR_PREPARE	1
+#define FORCE_OP_ERROR_RUN	2
+#define FORCE_OP_ERROR_COUNT	3
+#endif
+
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
 #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
 #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
@@ -201,6 +211,10 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+#ifdef TEST_VM_OPS_ERROR
+	/** @inject_error: inject error to test error handling */
+	bool inject_error;
+#endif
 };
 
 struct xe_vm {
-- 
2.34.1

