Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A7CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 17:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA8910F79B;
	Wed, 10 Apr 2024 17:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYIuSnzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3C3112DDC
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712769435; x=1744305435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cgQ33iVJ6xi5xq8ZGLCEQXX9MNzShVAbRHmNrsE5fIA=;
 b=jYIuSnzLSE0J9DTicR51H+uURXYvK+rcvzgQNrxlGGPUxkaCC81Kf+hI
 QaJjNaV4IJNIF6OBDr+0MZ1rruGZNpyR/OoFtRZTMAERjve3O2QQsuoXG
 LuDTNVFej9I3rF/ugGvqlVrNEw9WBHISaif4rVF+nZVJm0DXMS34CaZ6g
 ULsRLnxp4ai2QqyhJ+BYnMf6Wsi6cLfsUet9xHe4UgwGng2t8+XdgMKml
 2wB+kz/avC+Ww4GvOrP7OKy6gNaqujN78GYO0+sLSLXDWAX63WXBC1uAG
 6oGTgpAB/nZ1S2iSfBoRXbv0cknqOc/ENDf165FCSQpNCvwbSwEAOZ5Jn w==;
X-CSE-ConnectionGUID: Wq8JVRAeTY2sGNy1iR828A==
X-CSE-MsgGUID: wY4DCu8ERdaamN2x1ErhTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8009733"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8009733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:17:10 -0700
X-CSE-ConnectionGUID: fiKVjDb6Q3+nyiB2Fj7iGQ==
X-CSE-MsgGUID: AdOLf7t0QYis/9j1yjcN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20717918"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:17:09 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device atomics
Date: Wed, 10 Apr 2024 19:03:08 +0200
Message-ID: <20240410170308.409-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240410170308.409-1-nirmoy.das@intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Adds a new VMA bind flag to enable device atomics on SMEM only buffers.

Given that simultaneous usage of device atomics and CPU atomics on
the same SMEM buffer is not guaranteed to function without migration,
and UMD expects no migration for SMEM-only buffer objects, so this provide
a way to set device atomics when UMD is certain to use the buffer only
for device atomics.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        |  9 +++++----
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8f3474c5f480..530b4bbc186c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
 #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
 #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
 #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
+#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
 
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
@@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
 	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
 	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
+	bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		xe_bo_assert_held(bo);
 
 		if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
-		    !IS_DGFX(vm->xe))
+		    !IS_DGFX(vm->xe) || enable_atomics)
 			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
@@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	       operation, (ULL)addr, (ULL)range,
 	       (ULL)bo_offset_or_userptr);
 
+	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
+	    (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
+		drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is not supported for this platform");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
+	    !xe_bo_has_single_placement(bo))
+		drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be only set if the BO has single placement");
+		return ERR_PTR(-EINVAL);
+	}
+
 	switch (operation) {
 	case DRM_XE_VM_BIND_OP_MAP:
 	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
@@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		if (__op->op == DRM_GPUVA_OP_MAP) {
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
+			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
@@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->map.enable_device_atomics ?
+				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 			vma = new_vma(vm, &op->base.map, op->map.pat_index,
 				      flags);
@@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op->base.remap.unmap->va->flags &
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op->base.remap.unmap->va->flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      old->pat_index, flags);
@@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op->base.remap.unmap->va->flags &
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op->base.remap.unmap->va->flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
+
 
 				vma = new_vma(vm, op->base.remap.next,
 					      old->pat_index, flags);
@@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
+	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index badf3945083d..7b9c68909c78 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -282,6 +282,8 @@ struct xe_vma_op_map {
 	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
+	/** @enable_device_atomics: Whether the VMA will allow device atomics */
+	bool enable_device_atomics;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1446c3bae515..bffe8b1c040c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
-#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
+#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.42.0

