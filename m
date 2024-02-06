Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF16FC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 04:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82F91128EC;
	Tue,  6 Feb 2024 04:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK3O+u4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BF61128EC
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 04:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707195051; x=1738731051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b2P5oGIMjNdRKA1BuanEthAsaDbOTf4jAlBVsqoGMqQ=;
 b=cK3O+u4eo/bUK/w/vILattx5JLwIvauFv1At1w71g/f7va66mxdsreYC
 p7997zbyYuQJeOoHDF6vmbMGEI8Sv14YJ1q5z6bxPvR6gVl+433QC+fQG
 KFgfgv+7hzCNoG84FXHfX/Eecum6Id6pzt8HSeb0CCDoRJT1+8EuoYXPO
 UVBgIVolReVOGx6QJZGTyMpup0K9JWel3+UA5e2iLYENueCZNnMFZ0fKn
 HVLHpIKzS8trUBOIAAHQd9c3s7acPDJC2OVTKLi8On7oXYHFLxEJNDZ9Z
 X/luC4URYe17LgOaclWT+64Smzn2FZi2k3SzTAbqH28yriTnK7oZYluwe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11254750"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="11254750"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 20:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="31724874"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 20:49:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR
Date: Mon,  5 Feb 2024 20:50:10 -0800
Message-Id: <20240206045010.2981051-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

TEST_VM_ASYNC_OPS_ERROR is broken and unused. Remove for now and will
pull back in a later time when it is used, fixed, and properly hidden
behind a Kconfig option. Also fixup the supported flags value.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs"
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 28 +---------------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  8 --------
 2 files changed, 1 insertion(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ed594fa2f8da..b49a5065b0e2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -37,8 +37,6 @@
 #include "generated/xe_wa_oob.h"
 #include "xe_wa.h"
 
-#define TEST_VM_ASYNC_OPS_ERROR
-
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
 	return vm->gpuvm.r_obj;
@@ -2065,7 +2063,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
-	struct xe_vma_op *op;
 	struct drm_gpuvm_bo *vm_bo;
 	int err;
 
@@ -2112,15 +2109,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	if (IS_ERR(ops))
 		return ops;
 
-#ifdef TEST_VM_ASYNC_OPS_ERROR
-	if (operation & FORCE_ASYNC_OP_ERROR) {
-		op = list_first_entry_or_null(&ops->list, struct xe_vma_op,
-					      base.entry);
-		if (op)
-			op->inject_error = true;
-	}
-#endif
-
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
@@ -2563,13 +2551,6 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 
 	lockdep_assert_held_write(&vm->lock);
 
-#ifdef TEST_VM_ASYNC_OPS_ERROR
-	if (op->inject_error) {
-		op->inject_error = false;
-		return -ENOMEM;
-	}
-#endif
-
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		ret = __xe_vma_op_execute(vm, op->map.vma, op);
@@ -2729,16 +2710,9 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return 0;
 }
 
-#ifdef TEST_VM_ASYNC_OPS_ERROR
-#define SUPPORTED_FLAGS	\
-	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
-	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
-#else
 #define SUPPORTED_FLAGS	\
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
-	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
-	 0xffff)
-#endif
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1fec66ae2eb2..5ac9c5bebabc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -21,9 +21,6 @@ struct xe_bo;
 struct xe_sync_entry;
 struct xe_vm;
 
-#define TEST_VM_ASYNC_OPS_ERROR
-#define FORCE_ASYNC_OP_ERROR	BIT(31)
-
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
 #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
 #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
@@ -360,11 +357,6 @@ struct xe_vma_op {
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
-#ifdef TEST_VM_ASYNC_OPS_ERROR
-	/** @inject_error: inject error to test async op error handling */
-	bool inject_error;
-#endif
-
 	union {
 		/** @map: VMA map operation specific data */
 		struct xe_vma_op_map map;
-- 
2.34.1

