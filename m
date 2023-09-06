Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228A2EB8FB3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 13:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C980B10E1AF;
	Wed,  6 Sep 2023 13:49:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BEF10E65D
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694008174; x=1725544174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FiOmE3uod9M+bzYXdcdsiRzTcBwQ8GAYmeMvuIg5ajc=;
 b=aWoNDY/ymei8dVnP3B94ocOLwT0IIBIKi9ioFDfXc4Luk8vvFa5eV7Wx
 Y/d3m8T5RDDQ7uM7SGLtGFGJ+qKFjVSB57uij9g8ZCowqT7lJqZxd1hTX
 vd4r0525Wz9HwfLad56AT1gGBWGSNSvXQeSFwYJD9wUtwJa8IG04FUsXt
 NU+rc6gNgyrNPDLfnjGGiZByNXqU1mxxbeMBM6wsZ4ttY5M5v2K8fxiUc
 3xwNhcuXXgYgphWapPaU37WewtyhMBA6MfRhWt2yWTnCRZRiB3S8qKarB
 Fr37eL5EcR8MvPtO0Pe6F3aX0IuR4F1bLRwYB8+XalIzbaCj60I6UpfwX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="375971324"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="375971324"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 06:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="718279002"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="718279002"
Received: from mzizka-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.220])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 06:49:32 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 13:49:24 +0000
Message-Id: <20230906134924.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/uapi: Separate VM_BIND's operation and
 flag
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use different members in the drm_xe_vm_bind_op for op and for flags as
it is done in other structures.

Type is left to u32 to leave enough room for future operations and flags.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 29 ++++++++++++++++-------------
 include/uapi/drm/xe_drm.h  |  6 ++++--
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1d9aa5c40659..d0e5974b5292 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2159,11 +2159,11 @@ static void vm_set_async_error(struct xe_vm *vm, int err)
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
 
@@ -2264,7 +2264,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u8 tile_mask, u32 region)
+			 u32 operation, u32 flags, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct ww_acquire_ctx ww;
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
@@ -3116,15 +3116,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
@@ -3145,7 +3146,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
+		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
 		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
@@ -3360,8 +3361,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
+		u32 flags = bind_ops[i].flags;
 
-		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
+		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op, flags);
 		if (err)
 			goto free_syncs;
 	}
@@ -3370,13 +3372,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 86f16d50e9cc..54123ee736b5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -591,6 +591,8 @@ struct drm_xe_vm_bind_op {
 #define XE_VM_BIND_OP_RESTART		0x3
 #define XE_VM_BIND_OP_UNMAP_ALL		0x4
 #define XE_VM_BIND_OP_PREFETCH		0x5
+	/** @op: Bind operation to perform */
+	__u32 op;
 
 #define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
 	/*
@@ -631,8 +633,8 @@ struct drm_xe_vm_bind_op {
 	 * intended to implement VK sparse bindings.
 	 */
 #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
-	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
-	__u32 op;
+	/** @flags: Bind flags */
+	__u32 flags;
 
 	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
 	__u32 region;
-- 
2.34.1

