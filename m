Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ABEC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD89D10F545;
	Fri, 12 Apr 2024 09:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGdGPkFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2847310F54B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914643; x=1744450643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWnmK/AEpF3zn55xjX/RwmulosGArFNW9Q8MuDx9BgE=;
 b=HGdGPkFeSGPnpPeYrpqOzzMQ5ClPkMGFkr0n9nJFA1XqGVxuHeWnoujw
 emFY6m8OoC7nt34tWSzBAInNGMQ9Wqo8ZFBgE8H8oCAa5ZiAIlI37Mu0Q
 bR/CeH0Ez6vQqSt7OsMzaldq7VpfqVbK8W2T/RN/9dgErWyNEui+KFSRp
 sUeUYwhKVv39BxRL0DP1PxMSZClW0gDZ4aQoWt4gTmbWy4Ca7ahkOylBi
 aVP4Kg92OIhjlkeF78orDWLrKs4QJIuN1ULUCpHczuUr0f3tT0SN+LW6g
 wL7crO2oG9yddRTXtCh2Z1O58S9bz4zeKtW5IuG9kUSg9h4FktmNgl8TO A==;
X-CSE-ConnectionGUID: l5j6F7RmSlOj+TLBVfcGpQ==
X-CSE-MsgGUID: BO8f570iRvW2mXCXbw1DaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19075960"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19075960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:04 -0700
X-CSE-ConnectionGUID: cPwRMHO7Q1GuBUHZhOssgw==
X-CSE-MsgGUID: Iux4uMqNTvSwrfcWF84ENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52342173"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:03 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 6/7] drm/xe/uapi: Introduce VMA bind flag for device atomics
Date: Fri, 12 Apr 2024 11:22:48 +0200
Message-ID: <20240412092249.3636-7-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412092249.3636-1-nirmoy.das@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
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
 drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        | 17 +++++++++++++----
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5e633014f017..df0cb5bd1c45 100644
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
+	bool enable_atomics = (flags & VMA_CREATE_FLAG_DEVICE_ATOMICS);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		xe_bo_assert_held(bo);
 
 		if (vm->xe->info.has_atomic_enable_pte_bit &&
-		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
+		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe) || enable_atomics))
 			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
@@ -2216,6 +2218,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		if (__op->op == DRM_GPUVA_OP_MAP) {
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
+			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
@@ -2412,6 +2415,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->map.enable_device_atomics ?
+				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 			vma = new_vma(vm, &op->base.map, op->map.pat_index,
 				      flags);
@@ -2439,6 +2444,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op->base.remap.unmap->va->flags &
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op->base.remap.unmap->va->flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      old->pat_index, flags);
@@ -2476,6 +2483,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op->base.remap.unmap->va->flags &
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op->base.remap.unmap->va->flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 				vma = new_vma(vm, op->base.remap.next,
 					      old->pat_index, flags);
@@ -2831,7 +2840,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
+	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -2974,7 +2984,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u64 addr, u64 range, u64 obj_offset,
-					u16 coh_mode, u16 pat_index)
+					u16 coh_mode, u16 pat_index, u32 flags)
 {
 	if (XE_IOCTL_DBG(xe, range > bo->size) ||
 	    XE_IOCTL_DBG(xe, obj_offset >
@@ -3007,6 +3017,15 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return  -EINVAL;
 	}
 
+	if (XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
+			 (!xe->info.has_device_atomics_on_smem &&
+			  !xe_bo_is_vram(bo))))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
+			 !xe_bo_has_single_placement(bo)))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -3107,7 +3126,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 		if (xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
 						 obj_offset, coh_mode,
-						 pat_index))
+						 pat_index, bind_ops[i].flags))
 			goto put_obj;
 
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index badf3945083d..5a20bd80c456 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -276,6 +276,8 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
+	/** @enable_device_atomics: Whether the VMA will allow device atomics */
+	bool enable_device_atomics;
 	/** @is_null: is NULL binding */
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1446c3bae515..a44c057d4471 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -883,6 +883,14 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set for
+ *    a VA range, all the corresponding PTEs will have atomic access bit
+ *    set. This will allow device atomics operation for that VA range.
+ *    This flag only works for single placement buffer objects and
+ *    mainly for SMEM only buffer objects where CPU atomics can be perform
+ *    by an application and so KMD can not set device atomics on such buffers
+ *    by default. This flag has no effect on LMEM only placed buffers as atomic
+ *    access bit is set for LMEM backed PTEs always.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -969,10 +977,11 @@ struct drm_xe_vm_bind_op {
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

