Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA6EC531DE
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1928510E82F;
	Fri, 16 Aug 2024 19:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUSGps3c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BDE10E82D
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723834852; x=1755370852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ii8GohSlZsi9XYi+BThBzu2DkXbAoKqfeZW627+553k=;
 b=fUSGps3cKuVK1407Iuf8KSbAkClT884YWHXr8kFbg1T5bcgACqNSl2sG
 hiyC9I1j+hVhhPE/5ZnY4n3zbbl6oViXUbqy/0l6ljg4ozw1CbDkInh7L
 gZ0V2GGnsJPTM7Och5DYc2CaY2eCojDp5dfZAej6u2dOztQO0a3YC1DGD
 w47UvIeYsSzCm0s8LWAqKGEzHJMtytKVkRIXrdoQ3EizXHIeI99RVKAgN
 AZ/hDr+2yuFUN/A0ACF2tRXqWr2pUZP4ilinD1smqFRp8OSas+Buq+EJS
 /mrN33Ze1L6rnIvurN+FVrc7XxRQWEllJdMxzP463jhMrkLhiU3S8X111 A==;
X-CSE-ConnectionGUID: h2vLaEJXQzGdTmXiAfD49w==
X-CSE-MsgGUID: ERzfMyAKS5KTFNBzdtaCEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21772458"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21772458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:52 -0700
X-CSE-ConnectionGUID: j1eiKLGvTSebJWV2SbgWqw==
X-CSE-MsgGUID: U+y8xGcxRnOXi09JbZ2apw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59767974"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:51 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
Date: Fri, 16 Aug 2024 12:00:18 -0700
Message-ID: <20240816190024.2176976-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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

The driver needs to know if a BO is encrypted with PXP to enable the
display decryption at flip time.
Furthermore, we want to keep track of the status of the encryption and
reject any operation that involves a BO that is encrypted using an old
key. There are two points in time where such checks can kick in:

1 - at VM bind time, all operations except for unmapping will be
    rejected if the key used to encrypt the BO is no longer valid. This
    check is opt-in via a new VM_BIND flag, to avoid a scenario where a
    malicious app purposely shares an invalid BO with the compositor (or
    other app) and cause an error there.

2 - at job submission time, if the queue is marked as using PXP, all
    objects bound to the VM will be checked and the submission will be
    rejected if any of them was encrypted with a key that is no longer
    valid.

Note that there is no risk of leaking the encrypted data if a user does
not opt-in to those checks; the only consequence is that the user will
not realize that the encryption key is changed and that the data is no
longer valid.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../xe/compat-i915-headers/pxp/intel_pxp.h    |  10 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 100 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h                    |   5 +
 drivers/gpu/drm/xe/xe_bo_types.h              |   3 +
 drivers/gpu/drm/xe/xe_exec.c                  |   6 ++
 drivers/gpu/drm/xe/xe_pxp.c                   |  74 +++++++++++++
 drivers/gpu/drm/xe/xe_pxp.h                   |   4 +
 drivers/gpu/drm/xe/xe_pxp_types.h             |   3 +
 drivers/gpu/drm/xe/xe_vm.c                    |  46 +++++++-
 drivers/gpu/drm/xe/xe_vm.h                    |   2 +
 include/uapi/drm/xe_drm.h                     |  19 ++++
 11 files changed, 265 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
index 881680727452..d8682f781619 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
@@ -9,6 +9,9 @@
 #include <linux/errno.h>
 #include <linux/types.h>
 
+#include "xe_bo.h"
+#include "xe_pxp.h"
+
 struct drm_i915_gem_object;
 struct xe_pxp;
 
@@ -16,13 +19,16 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
 				      struct drm_i915_gem_object *obj,
 				      bool assign)
 {
-	return -ENODEV;
+	if (assign)
+		return -EINVAL;
+
+	return xe_pxp_key_check(pxp, obj);
 }
 
 static inline bool
 i915_gem_object_is_protected(const struct drm_i915_gem_object *obj)
 {
-	return false;
+	return xe_bo_is_protected(obj);
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 56a089aa3916..0f591b7d93b1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -6,6 +6,7 @@
 #include "xe_bo.h"
 
 #include <linux/dma-buf.h>
+#include <linux/nospec.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -24,6 +25,7 @@
 #include "xe_migrate.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
+#include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -1949,6 +1951,95 @@ void xe_bo_vunmap(struct xe_bo *bo)
 	__xe_bo_vunmap(bo);
 }
 
+static int gem_create_set_pxp_type(struct xe_device *xe, struct xe_bo *bo, u64 value)
+{
+	if (value == DRM_XE_PXP_TYPE_NONE)
+		return 0;
+
+	/* we only support DRM_XE_PXP_TYPE_HWDRM for now */
+	if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
+		return -EINVAL;
+
+	xe_pxp_key_assign(xe->pxp, bo);
+
+	return 0;
+}
+
+typedef int (*xe_gem_create_set_property_fn)(struct xe_device *xe,
+					     struct xe_bo *bo,
+					     u64 value);
+
+static const xe_gem_create_set_property_fn gem_create_set_property_funcs[] = {
+	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_set_pxp_type,
+};
+
+static int gem_create_user_ext_set_property(struct xe_device *xe,
+					    struct xe_bo *bo,
+					    u64 extension)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_ext_set_property ext;
+	int err;
+	u32 idx;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.property >=
+			 ARRAY_SIZE(gem_create_set_property_funcs)) ||
+	    XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.property, ARRAY_SIZE(gem_create_set_property_funcs));
+	if (!gem_create_set_property_funcs[idx])
+		return -EINVAL;
+
+	return gem_create_set_property_funcs[idx](xe, bo, ext.value);
+}
+
+typedef int (*xe_gem_create_user_extension_fn)(struct xe_device *xe,
+					       struct xe_bo *bo,
+					       u64 extension);
+
+static const xe_gem_create_user_extension_fn gem_create_user_extension_funcs[] = {
+	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_user_ext_set_property,
+};
+
+#define MAX_USER_EXTENSIONS	16
+static int gem_create_user_extensions(struct xe_device *xe, struct xe_bo *bo,
+				      u64 extensions, int ext_number)
+{
+	u64 __user *address = u64_to_user_ptr(extensions);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
+		return -E2BIG;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(gem_create_user_extension_funcs)))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.name,
+				 ARRAY_SIZE(gem_create_user_extension_funcs));
+	err = gem_create_user_extension_funcs[idx](xe, bo, extensions);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	if (ext.next_extension)
+		return gem_create_user_extensions(xe, bo, ext.next_extension,
+						  ++ext_number);
+
+	return 0;
+}
+
 int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file)
 {
@@ -1961,8 +2052,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
+	if (XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -2037,6 +2127,12 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		goto out_vm;
 	}
 
+	if (args->extensions) {
+		err = gem_create_user_extensions(xe, bo, args->extensions, 0);
+		if (err)
+			goto out_bulk;
+	}
+
 	err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
 	if (err)
 		goto out_bulk;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 1c9dc8adaaa3..721f7dc35aac 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -171,6 +171,11 @@ static inline bool xe_bo_is_pinned(struct xe_bo *bo)
 	return bo->ttm.pin_count;
 }
 
+static inline bool xe_bo_is_protected(const struct xe_bo *bo)
+{
+	return bo->pxp_key_instance;
+}
+
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index ebc8abf7930a..8668e0374b18 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -56,6 +56,9 @@ struct xe_bo {
 	 */
 	struct list_head client_link;
 #endif
+	/** @pxp_key_instance: key instance this bo was created against (if any) */
+	u32 pxp_key_instance;
+
 	/** @freed: List node for delayed put. */
 	struct llist_node freed;
 	/** @update_index: Update index if PT BO */
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f36980aa26e6..aa4f2fe2e131 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -250,6 +250,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
+	if (xe_exec_queue_uses_pxp(q)) {
+		err = xe_vm_validate_protected(q->vm);
+		if (err)
+			goto err_exec;
+	}
+
 	job = xe_sched_job_create(q, xe_exec_queue_is_parallel(q) ?
 				  addresses : &args->address);
 	if (IS_ERR(job)) {
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index ca4302af4ced..640e62d1d5d7 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -8,6 +8,8 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "xe_bo.h"
+#include "xe_bo_types.h"
 #include "xe_device_types.h"
 #include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
@@ -132,6 +134,9 @@ static void pxp_terminate(struct xe_pxp *pxp)
 
 	pxp_invalidate_queues(pxp);
 
+	if (pxp->status == XE_PXP_ACTIVE)
+		pxp->key_instance++;
+
 	/*
 	 * If we have a termination already in progress, we need to wait for
 	 * it to complete before queueing another one. We update the state
@@ -343,6 +348,8 @@ int xe_pxp_init(struct xe_device *xe)
 	pxp->xe = xe;
 	pxp->gt = gt;
 
+	pxp->key_instance = 1;
+
 	/*
 	 * we'll use the completion to check if there is a termination pending,
 	 * so we start it as completed and we reinit it when a termination
@@ -574,3 +581,70 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp)
 	spin_unlock_irq(&pxp->queues.lock);
 }
 
+/**
+ * xe_pxp_key_assign - mark a BO as using the current PXP key iteration
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @bo: the BO to mark
+ *
+ * Returns: -ENODEV if PXP is disabled, 0 otherwise.
+ */
+int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo)
+{
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	xe_assert(pxp->xe, !bo->pxp_key_instance);
+
+	/*
+	 * Note that the PXP key handling is inherently racey, because the key
+	 * can theoretically change at any time (although it's unlikely to do
+	 * so without triggers), even right after we copy it. Taking a lock
+	 * wouldn't help because the value might still change as soon as we
+	 * release the lock.
+	 * Userspace needs to handle the fact that their BOs can go invalid at
+	 * any point.
+	 */
+	bo->pxp_key_instance = pxp->key_instance;
+
+	return 0;
+}
+
+/**
+ * xe_pxp_key_check - check if the key used by a BO is valid
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @bo: the BO we want to check
+ *
+ * Checks whether a BO was encrypted with the current key or an obsolete one.
+ *
+ * Returns: 0 if the key is valid, -ENODEV if PXP is disabled, -EINVAL if the
+ * BO is not using PXP,  -ENOEXEC if the key is not valid.
+ */
+int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
+{
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	if (!xe_bo_is_protected(bo))
+		return -EINVAL;
+
+	xe_assert(pxp->xe, bo->pxp_key_instance);
+
+	/*
+	 * Note that the PXP key handling is inherently racey, because the key
+	 * can theoretically change at any time (although it's unlikely to do
+	 * so without triggers), even right after we check it. Taking a lock
+	 * wouldn't help because the value might still change as soon as we
+	 * release the lock.
+	 * We mitigate the risk by checking the key at multiple points (on each
+	 * submission involving the BO and right before flipping it on the
+	 * display), but there is still a very small chance that we could
+	 * operate on an invalid BO for a single submission or a single frame
+	 * flip. This is a compromise made to protect the encrypted data (which
+	 * is what the key termination is for).
+	 */
+	if (bo->pxp_key_instance != pxp->key_instance)
+		return -ENOEXEC;
+
+	return 0;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 868813cc84b9..2d22a6e6ab27 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct xe_bo;
 struct xe_device;
 struct xe_exec_queue;
 struct xe_pxp;
@@ -23,4 +24,7 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 t
 int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
 void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
 
+int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo);
+int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo);
+
 #endif /* __XE_PXP_H__ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index eb6a0183320a..1bb747837f86 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -108,6 +108,9 @@ struct xe_pxp {
 		/** @queues.list: list of exec_queues that use PXP */
 		struct list_head list;
 	} queues;
+
+	/** @key_instance: keep track of the current iteration of the PXP key */
+	u32 key_instance;
 };
 
 #endif /* __XE_PXP_TYPES_H__ */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 56f105797ae6..1011d643ebb8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
+#include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
@@ -2754,7 +2755,8 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
+	 DRM_XE_VM_BIND_FLAG_CHECK_PXP)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -2916,7 +2918,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u64 addr, u64 range, u64 obj_offset,
-					u16 pat_index)
+					u16 pat_index, u32 op, u32 bind_flags)
 {
 	u16 coh_mode;
 
@@ -2951,6 +2953,12 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return  -EINVAL;
 	}
 
+	/* If a BO is protected it must be valid to be mapped */
+	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && xe_bo_is_protected(bo) &&
+	    op != DRM_XE_VM_BIND_OP_UNMAP && op != DRM_XE_VM_BIND_OP_UNMAP_ALL)
+		if (XE_IOCTL_DBG(xe, xe_pxp_key_check(xe->pxp, bo) != 0))
+			return -ENOEXEC;
+
 	return 0;
 }
 
@@ -3038,6 +3046,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 obj = bind_ops[i].obj;
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u16 pat_index = bind_ops[i].pat_index;
+		u32 op = bind_ops[i].op;
+		u32 bind_flags = bind_ops[i].flags;
 
 		if (!obj)
 			continue;
@@ -3050,7 +3060,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		bos[i] = gem_to_xe_bo(gem_obj);
 
 		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
-						   obj_offset, pat_index);
+						   obj_offset, pat_index, op,
+						   bind_flags);
 		if (err)
 			goto put_obj;
 	}
@@ -3343,6 +3354,35 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	return ret;
 }
 
+int xe_vm_validate_protected(struct xe_vm *vm)
+{
+	struct drm_gpuva *gpuva;
+	int err = 0;
+
+	if (!vm)
+		return -ENODEV;
+
+	mutex_lock(&vm->snap_mutex);
+
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_bo *bo = vma->gpuva.gem.obj ?
+			gem_to_xe_bo(vma->gpuva.gem.obj) : NULL;
+
+		if (!bo)
+			continue;
+
+		if (xe_bo_is_protected(bo)) {
+			err = xe_pxp_key_check(vm->xe->pxp, bo);
+			if (err)
+				break;
+		}
+	}
+
+	mutex_unlock(&vm->snap_mutex);
+	return err;
+}
+
 struct xe_vm_snapshot {
 	unsigned long num_snaps;
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index bfc19e8113c3..dd51c9790dab 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -216,6 +216,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
+int xe_vm_validate_protected(struct xe_vm *vm);
+
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9972ceb3fbfb..335febe03e40 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -776,8 +776,23 @@ struct drm_xe_device_query {
  *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
  *    is uncached. Scanout surfaces should likely use this. All objects
  *    that can be placed in VRAM must use this.
+ *
+ * This ioctl supports setting the following properties via the
+ * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
+ * generic @drm_xe_ext_set_property struct:
+ *
+ *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
+ *    this object will be used with. Valid values are listed in enum
+ *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
+ *    there is no need to explicitly set that. Objects used with session of type
+ *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP invalidation
+ *    event occurs after their creation. Attempting to flip an invalid object
+ *    will cause a black frame to be displayed instead. Submissions with invalid
+ *    objects mapped in the VM will be rejected.
  */
 struct drm_xe_gem_create {
+#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY	0
+#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE	0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -939,6 +954,9 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
+ *    reject the binding if the encryption key is no longer valid. This
+ *    flag has no effect on BOs that are not marked as using PXP.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1029,6 +1047,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.43.0

