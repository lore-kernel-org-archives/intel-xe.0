Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF261E92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C5F10E0C2;
	Fri,  6 Oct 2023 10:00:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB8410E0C2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586398; x=1728122398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UYGtS8Y+xK8Dl9/eiP1gPgBbvYT2/3KMbsRGm0D/jdo=;
 b=WoFqyCDwaWEL3QlKimqryxltQZ1+Yg56BXM6CU4LBuRQtZnkAuCimkLr
 aSa633Lu16ZSQBZmIJ0TDddeg82qpbtXVxAGlolrxCpKqmZQtTm5nxn7h
 1PG17QjdvXwKdTpdi8ifYZLINixAmB2RPfdN6QcZ/Ykm5vGon6ImBGdU2
 XmnoBJEKpixr4fqtgqB6lBcsniWcay49UR6UlrM7TnQ1BGUziuF/6xNJ8
 hubdkrfm2lJL1Hd36u7/U91UxuR73bp9NMneuduHi2/MhWuoRqxMLusIj
 qYRef+cY6r44dBc4lP+rAN1rrEaUkbAhZ79m14tmnIcqCYE81tBP5W2eU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907132"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 02:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815773"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815773"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 02:59:57 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:27 +0000
Message-Id: <20231006095943.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 04/20] drm/xe/uapi: Separate VM_BIND's
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
index ea17d026546c..7ccc1b759151 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2287,11 +2287,11 @@ static void vm_set_async_error(struct xe_vm *vm, int err)
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
 
@@ -2392,7 +2392,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u8 tile_mask, u32 region)
+			 u32 operation, u32 flags, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
@@ -2420,10 +2420,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
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
@@ -3234,15 +3234,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
@@ -3263,7 +3264,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
+		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
 		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
@@ -3478,8 +3479,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
+		u32 flags = bind_ops[i].flags;
 
-		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
+		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op, flags);
 		if (err)
 			goto free_syncs;
 	}
@@ -3488,13 +3490,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 079213a3df55..46db9334159b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -660,8 +660,10 @@ struct drm_xe_vm_bind_op {
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
@@ -686,12 +688,12 @@ struct drm_xe_vm_bind_op {
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
@@ -699,9 +701,9 @@ struct drm_xe_vm_bind_op {
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

