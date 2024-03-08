Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D19C54E63
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5492112EDD;
	Fri,  8 Mar 2024 05:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+aaNwwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D33B11259C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874475; x=1741410475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OWuVNcWKIbRa9SxrDzQm/d9lf61oelrruRPmrcs5hM=;
 b=R+aaNwwnq8N4qZMnYgz267ug+FvKQm7ZC8VFH9sWJLu/rIntUnFnirOt
 ip+NfPRvBztHY6H0buo3zVZk6HQmQkgP/ifLcqKd/L2UC+LZjUapQI7FE
 9DkukwzdzvUAQF0BB5N8xIz7Ib6ZV6zhdsPUjRcD1UlYPVpkiHc4/JrXj
 mrunU0g8zwzPaS8+el/OEPllpUtqVes4UBWU3JdlatP3F5sFbNLCZ22pJ
 Ele0c5uyeg5Qv47ASgbJDP16bsLq0k+DvLOw66dP3dxHNb8medOZ/uhqk
 blyHArSNh8FJ41XuiCZw7BhtCcC1Wztw3mC31ua9gB4K0ubxjVqYiR8ya Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761983"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761983"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403053"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 28/30] drm/xe: Add VM bind IOCTL error injection
Date: Thu,  7 Mar 2024 21:08:04 -0800
Message-Id: <20240308050806.577176-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c           | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h     | 14 ++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3d86ab07a5cd..e73b9a086718 100644
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
@@ -459,6 +463,14 @@ struct xe_device {
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
index c941a73d408a..e0b0f6593ddc 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1766,6 +1766,12 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_tile_assert(tile, pt_update_ops->current_op ==
 		       pt_update_ops->num_ops);
 
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
+		return -ENOSPC;
+#endif
+
 	return 0;
 }
 
@@ -1899,6 +1905,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
+		return ERR_PTR(-ENOSPC);
+#endif
+
 	if (pt_update_ops->needs_invalidation) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dad8bd10d900..906734b423c5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2473,6 +2473,12 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 			return err;
 	}
 
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
+		return -ENOSPC;
+#endif
+
 	return 0;
 }
 
@@ -2718,8 +2724,13 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return err;
 }
 
+#ifdef TEST_VM_OPS_ERROR
+#define SUPPORTED_FLAGS	(FORCE_OP_ERROR | DRM_XE_VM_BIND_FLAG_NULL | \
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+#else
 #define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+#endif
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -3047,6 +3058,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 83cb13275904..a069989fd82c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -24,6 +24,16 @@ struct xe_user_fence;
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
@@ -211,6 +221,10 @@ struct xe_vma_ops {
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

