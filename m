Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2659FC2BB85
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 17:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E162D10E72B;
	Tue, 18 Jun 2024 17:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1vTV5i5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8642C10E75C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718730876; x=1750266876;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4/apdfYwqd4rP8ygUymHENbfJFfTQphhbYULJqq8eOo=;
 b=k1vTV5i5V4DM0m793Hyx+uSdPOAs1IMbTE3O+Pm0X5q/a5gdI2dBNmmP
 kOCz3abj4cAEkdrJgp1uVHzO6rKviA2G+O6uRO/E/1ZLqA1oIyYpKMFvN
 5HMfpooenIWDnF2sy0Wc+BOoNaTGU4GUaelh3gGc/glBkY9qsFVlBvdfg
 HEDhdjdbJWXAgFQ6dKCxNRIvZuU6cDsmScEAO6TuCZ87hoEdovkdOCNvT
 rZZLZKe6ylNa85zjP0LcdUmKNUSuZySfwTAmWZV0hkCuKfuaJGnoKqwXo
 0uTnnaMK6/OQFey/bLx0o3k71zL7P1zm9eqapOgYaMk3tjyl9JajEQTaC A==;
X-CSE-ConnectionGUID: dQ0hz5wTS3q265RZcfHYZg==
X-CSE-MsgGUID: Eag2KLCdTFWNuRP42Eurqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26754436"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26754436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
X-CSE-ConnectionGUID: qlU9fJ2CQGG/1BavsauiNQ==
X-CSE-MsgGUID: LpbqFxNYS2SiMg8YiJ9pSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46583658"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:14:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/xe: Add VM bind IOCTL error injection
Date: Tue, 18 Jun 2024 10:15:09 -0700
Message-Id: <20240618171509.3336601-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618171509.3336601-1-matthew.brost@intel.com>
References: <20240618171509.3336601-1-matthew.brost@intel.com>
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

v4:
 - Change define layout (Jonathan)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_pt.c           | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h     | 14 ++++++++++++++
 4 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 52bc461171d5..0629a0d0f920 100644
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
@@ -473,6 +477,14 @@ struct xe_device {
 		int mode;
 	} wedged;
 
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
index b46b95531c2a..abdb2fda13b2 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1870,6 +1870,12 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_tile_assert(tile, pt_update_ops->current_op <=
 		       pt_update_ops->num_ops);
 
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
+		return -ENOSPC;
+#endif
+
 	return 0;
 }
 
@@ -2010,6 +2016,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		return dma_fence_get_stub();
 	}
 
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
index 913f1d683b3b..a81fa02b663e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2473,6 +2473,12 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
 
@@ -2709,11 +2715,18 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return err;
 }
 
-#define SUPPORTED_FLAGS	\
+#define SUPPORTED_FLAGS_STUB  \
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+
+#ifdef TEST_VM_OPS_ERROR
+#define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
+#else
+#define SUPPORTED_FLAGS	SUPPORTED_FLAGS_STUB
+#endif
+
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -3061,6 +3074,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
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
index 27d651093d30..7f9a303e51d8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -23,6 +23,16 @@ struct xe_user_fence;
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
@@ -359,6 +369,10 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+#ifdef TEST_VM_OPS_ERROR
+	/** @inject_error: inject error to test error handling */
+	bool inject_error;
+#endif
 };
 
 #endif
-- 
2.34.1

