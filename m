Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DBBE7E632
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C84C10E3D9;
	Tue, 26 Sep 2023 13:02:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81CB10E3D7
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733366; x=1727269366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1IvMRiT7HAFmpU7iR91pRJ5F605z14I7qfdrr/cYGk0=;
 b=FZ6mGEnYDZPs29REnt/XLGnivTbGCNtIIQBqsLcGJp7uDZRcwptfj44o
 qC3nqpVeg5voJwaTvfAIcRcacxbFeScdVFSWrddsz2/qbzFfuR7BR8pBT
 FE7OQO9O02+N5soWZujI/L2n9jOoo6pE3BQA6jmBcU2mUwPyDvsCRnoWE
 HQeaoujJBm73Z9/ZyLP6Wmn4vD7XA0xWM/SBRJDh8nkCGvWk210jo69/x
 KpkdDDcYuVs+wB4ymPr+WG77xPyvVh2cCxtCGB+08IqJXX5gF7rJ2sYux
 MzPaV3qOo1SCMlddp4LnDfLoaY1qD9z5cGLBZv4ZC5ncMrx4098cfD4Qm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617062"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617062"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139511"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:00 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:14 +0000
Message-Id: <20230926125540.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 04/30] drm/xe/uapi: Separate VM_BIND's
 operation and flag
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use different members in the drm_xe_vm_bind_op for op and for flags as
it is done in other structures.

Type is left to u32 to leave enough room for future operations and flags.

v2: Remove the XE_VM_BIND_* flags shift (Rodrigo Vivi)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/303
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 29 ++++++++++++++++-------------
 include/uapi/drm/xe_drm.h  | 14 ++++++++------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 861d050871bb..e81d8cc5c29e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2160,11 +2160,11 @@ static void vm_set_async_error(struct xe_vm *vm, int err)
 }
 
 static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
-				    u64 addr, u64 range, u32 op)
+				    u64 addr, u64 range, u32 op, u32 flags)
 {
 	struct xe_device *xe = vm->xe;
 	struct xe_vma *vma;
-	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
+	bool async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
 
 	lockdep_assert_held(&vm->lock);
 
@@ -2265,7 +2265,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u8 tile_mask, u32 region)
+			 u32 operation, u32 flags, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
@@ -2293,10 +2293,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 			op->tile_mask = tile_mask;
 			op->map.immediate =
-				operation & XE_VM_BIND_FLAG_IMMEDIATE;
+				flags & XE_VM_BIND_FLAG_IMMEDIATE;
 			op->map.read_only =
-				operation & XE_VM_BIND_FLAG_READONLY;
-			op->map.is_null = operation & XE_VM_BIND_FLAG_NULL;
+				flags & XE_VM_BIND_FLAG_READONLY;
+			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
@@ -3108,15 +3108,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 range = (*bind_ops)[i].range;
 		u64 addr = (*bind_ops)[i].addr;
 		u32 op = (*bind_ops)[i].op;
+		u32 flags = (*bind_ops)[i].flags;
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
-		bool is_null = op & XE_VM_BIND_FLAG_NULL;
+		bool is_null = flags & XE_VM_BIND_FLAG_NULL;
 
 		if (i == 0) {
-			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
+			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
 		} else if (XE_IOCTL_DBG(xe, !*async) ||
-			   XE_IOCTL_DBG(xe, !(op & XE_VM_BIND_FLAG_ASYNC)) ||
+			   XE_IOCTL_DBG(xe, !(flags & XE_VM_BIND_FLAG_ASYNC)) ||
 			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
 					XE_VM_BIND_OP_RESTART)) {
 			err = -EINVAL;
@@ -3137,7 +3138,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
+		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
 		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
@@ -3352,8 +3353,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
+		u32 flags = bind_ops[i].flags;
 
-		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
+		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op, flags);
 		if (err)
 			goto free_syncs;
 	}
@@ -3362,13 +3364,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
+		u32 flags = bind_ops[i].flags;
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
-						  addr, range, op, tile_mask,
-						  region);
+						  addr, range, op, flags,
+						  tile_mask, region);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index fde1378a60b9..285bba48ffbf 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -663,8 +663,10 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_OP_RESTART		0x3
 #define XE_VM_BIND_OP_UNMAP_ALL		0x4
 #define XE_VM_BIND_OP_PREFETCH		0x5
+	/** @op: Bind operation to perform */
+	__u32 op;
 
-#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
+#define XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
 	/*
 	 * A bind ops completions are always async, hence the support for out
 	 * sync. This flag indicates the allocation of the memory for new page
@@ -689,12 +691,12 @@ struct drm_xe_vm_bind_op {
 	 * configured in the VM and must be set if the VM is configured with
 	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
 	 */
-#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
+#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -702,9 +704,9 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
-	__u32 op;
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 3)
+	/** @flags: Bind flags */
+	__u32 flags;
 
 	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
 	__u32 region;
-- 
2.34.1

