Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F398E92FFA
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC57C10E185;
	Fri,  6 Oct 2023 10:00:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBF610E0C2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696586400; x=1728122400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a/JSTIbgQQEztUrnJABW6wF/fKHz4NFDPXQ1hIq99i8=;
 b=OBtKDSsV/R601Xo7gab0NScb8B5/k7kmMOz8IUH97yyc7UDXtvgQMiFY
 X4LPb42ptclvkp5/gYtrbboo1Z19a5aahzV5p6OGEY0ubaurAs58Eeq0C
 Wz1Lue6QO64gTLCzFN+CgWTTH1NlhXngHZ2mrmoolsRO21m5fZlian+BQ
 /80raW0JAXJt8a0yZodDdwGeaoQ2XZUoi1weOdzsnKP8/78hqHirGksxe
 iTt3EE6sJBXLf9qnx5Yp95xIV0l3q0aUY2MxyxLmjW8+tYqt5Z3IaDk6E
 aKkJbXe/DIinUJHjUfcizQ6nCSlNmp/Hf50YqzFJc8YeZd/EcP3MsR+V3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447907136"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447907136"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 02:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745815781"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745815781"
Received: from triebel-mobl.ger.corp.intel.com (HELO 8688cc0b8d51.intel.com)
 ([10.252.41.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 02:59:58 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:59:28 +0000
Message-Id: <20231006095943.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 05/20] drm/xe/vm: Remove VM_BIND_OP macro
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

This macro was necessary when bind operations were shifted but this
is no longer the case, so removing to simplify code.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 42 +++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7ccc1b759151..756f20d891ae 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2269,8 +2269,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	}
 }
 
-#define VM_BIND_OP(op)	(op & 0xffff)
-
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 {
 	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
@@ -2295,7 +2293,7 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 
 	lockdep_assert_held(&vm->lock);
 
-	switch (VM_BIND_OP(op)) {
+	switch (op) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		vma = xe_vm_find_overlapping_vma(vm, addr, range);
@@ -2404,10 +2402,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 	vm_dbg(&vm->xe->drm,
 	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
-	       VM_BIND_OP(operation), (ULL)addr, (ULL)range,
+	       operation, (ULL)addr, (ULL)range,
 	       (ULL)bo_offset_or_userptr);
 
-	switch (VM_BIND_OP(operation)) {
+	switch (operation) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
@@ -3244,50 +3242,48 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC);
 		} else if (XE_IOCTL_DBG(xe, !*async) ||
 			   XE_IOCTL_DBG(xe, !(flags & XE_VM_BIND_FLAG_ASYNC)) ||
-			   XE_IOCTL_DBG(xe, VM_BIND_OP(op) ==
-					XE_VM_BIND_OP_RESTART)) {
+			   XE_IOCTL_DBG(xe, op == XE_VM_BIND_OP_RESTART)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
 		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op == XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
 		if (XE_IOCTL_DBG(xe, !*async &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH)) {
+				 op == XE_VM_BIND_OP_PREFETCH)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
-				 XE_VM_BIND_OP_PREFETCH) ||
+		if (XE_IOCTL_DBG(xe, op > XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
 		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
-		    XE_IOCTL_DBG(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
+		    XE_IOCTL_DBG(xe, op != XE_VM_BIND_OP_MAP &&
 				 is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
+				 op == XE_VM_BIND_OP_MAP &&
 				 !is_null) ||
 		    XE_IOCTL_DBG(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, range &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
+				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
+				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH) ||
+				 op == XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, region &&
-				 VM_BIND_OP(op) != XE_VM_BIND_OP_PREFETCH) ||
+				 op != XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, !(BIT(region) &
 				       xe->info.mem_region_mask)) ||
 		    XE_IOCTL_DBG(xe, obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP)) {
+				 op == XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
@@ -3295,9 +3291,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, !range && VM_BIND_OP(op) !=
+		    XE_IOCTL_DBG(xe, !range && op !=
 				 XE_VM_BIND_OP_RESTART &&
-				 VM_BIND_OP(op) != XE_VM_BIND_OP_UNMAP_ALL)) {
+				 op != XE_VM_BIND_OP_UNMAP_ALL)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
@@ -3361,7 +3357,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto release_vm_lock;
 	}
 
-	if (VM_BIND_OP(bind_ops[0].op) == XE_VM_BIND_OP_RESTART) {
+	if (bind_ops[0].op == XE_VM_BIND_OP_RESTART) {
 		if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
 			err = -EOPNOTSUPP;
 		if (XE_IOCTL_DBG(xe, !err && args->num_syncs))
-- 
2.34.1

