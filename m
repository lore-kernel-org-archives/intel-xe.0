Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4493AC47071
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 03:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154F610E390;
	Wed, 15 Nov 2023 03:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADF110E390
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 03:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700018097; x=1731554097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=22vVL6l9gCxgY9bItqC+CGXgyoM9QWh8AWlW8rJh6kQ=;
 b=Qa6rx61RiUu25g+R3b8FKPau6ycrZkNtA7Bhm/HuylxjteVxV6CvuTJI
 TvpZ/baZght05UCCZFHj54w71A0DLSy3GUnZWo5vwuRB8KDZOaW0P4OLr
 puu72t6pfDDidlMGZKJKOK3xfgpTnedA4j+S90VUpgX7/UY40xokXyYXq
 PuuduBXfNGWdKMiIHaN7tpIE/2HxgGJvCP4w43v5zRhb/BJ8dECqmJ7uz
 FOybPiAiud/nWNDTCrtpfEo4qxd4dZwLuJ3alnR+BF5qFEATd2T+9tauv
 iTKS5gfDUnGFwd/TycSeBdVxNWe5mCA2FAVbYoVktz0VGRrlpyab2LtN2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="394716419"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="394716419"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 19:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="6000141"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 19:14:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 19:15:08 -0800
Message-Id: <20231115031508.173140-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Only set xe_vma_op.map fields for GPUVA
 map operations
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

XE_VM_BIND_OP_MAP_* IOCTL operations can result in GPUVA unmap, remap,
or map operations in vm_bind_ioctl_ops_create. The xe_vma_op.map fields
are blindly set which is incorrect for GPUVA unmap or remap operations.
Fix this by only setting xe_vma_op.map for GPUVA map operations. Also
restructure a bit vm_bind_ioctl_ops_create to make the code a bit more
readable.

Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Signec-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++--------------------------
 1 file changed, 18 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d45f4f1d490f..1049869b5a6f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2187,42 +2187,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	case XE_VM_BIND_OP_MAP_USERPTR:
 		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
 						  obj, bo_offset_or_userptr);
-		if (IS_ERR(ops))
-			return ops;
-
-		drm_gpuva_for_each_op(__op, ops) {
-			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-
-			op->tile_mask = tile_mask;
-			op->map.immediate =
-				flags & XE_VM_BIND_FLAG_IMMEDIATE;
-			op->map.read_only =
-				flags & XE_VM_BIND_FLAG_READONLY;
-			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
-		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
 		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
-		if (IS_ERR(ops))
-			return ops;
-
-		drm_gpuva_for_each_op(__op, ops) {
-			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-
-			op->tile_mask = tile_mask;
-		}
 		break;
 	case XE_VM_BIND_OP_PREFETCH:
 		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
-		if (IS_ERR(ops))
-			return ops;
-
-		drm_gpuva_for_each_op(__op, ops) {
-			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-
-			op->tile_mask = tile_mask;
-			op->prefetch.region = region;
-		}
 		break;
 	case XE_VM_BIND_OP_UNMAP_ALL:
 		xe_assert(vm->xe, bo);
@@ -2232,19 +2202,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			return ERR_PTR(err);
 		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
 		xe_bo_unlock(bo);
-		if (IS_ERR(ops))
-			return ops;
-
-		drm_gpuva_for_each_op(__op, ops) {
-			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-
-			op->tile_mask = tile_mask;
-		}
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		ops = ERR_PTR(-EINVAL);
 	}
+	if (IS_ERR(ops))
+		return ops;
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 	if (operation & FORCE_ASYNC_OP_ERROR) {
@@ -2255,9 +2219,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	}
 #endif
 
-	if (!IS_ERR(ops))
-		drm_gpuva_for_each_op(__op, ops)
-			print_op(vm->xe, __op);
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+		op->tile_mask = tile_mask;
+		if (__op->op == DRM_GPUVA_OP_MAP) {
+			op->map.immediate =
+				flags & XE_VM_BIND_FLAG_IMMEDIATE;
+			op->map.read_only =
+				flags & XE_VM_BIND_FLAG_READONLY;
+			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
+		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
+			op->prefetch.region = region;
+		}
+
+		print_op(vm->xe, __op);
+	}
 
 	return ops;
 }
-- 
2.34.1

