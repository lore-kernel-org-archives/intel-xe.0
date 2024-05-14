Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5510BC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 10:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197A310E22A;
	Tue, 14 May 2024 10:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7UYk1Hd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB4B10E22A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 10:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715683758; x=1747219758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7OFaS+xXFuo2eFeLR8ZTZdv9XeoVAm/BbgzThbiZmic=;
 b=X7UYk1Hd/46Sj8H1qlJydZKX8FVvB9yJZE0CyZLOCz0FFJwD+T88mHZF
 oDn5BIX/wpuH5NdMGBnzf6kRa+esiVfjkdljUQFH6lopKSQE4AHvL1DGo
 m33TaXCd8MilafBbk/SbgtmvJGURZUCiKp5jYU7BtFL/iZt0giLXkxvB3
 GsR7VJHHU8RgqHeSspqrmeghGpPdwyZUqkklSYai5zG/NGHM6ZpDHNy+N
 h6hmvyZfPj70T3oV8hciyq+cWaRUk73mxXdfLizdrkNM+Wvh2R2p9Oe6f
 EixZpMa9exZ9Jlfr0Ll6LvRTQn6Z27xq4JAKubLQ+0zKcDo+vClYcbw0a Q==;
X-CSE-ConnectionGUID: 0kKawkg7QQKG0pBRGGWp0A==
X-CSE-MsgGUID: Q/HbiiR+Sc+OwQ8t/ycHHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="37031623"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="37031623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 03:49:18 -0700
X-CSE-ConnectionGUID: pXryRW4KTxiIdAIXI1DUkA==
X-CSE-MsgGUID: QIYowS7WQa+f4JBD7IlVuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="31202698"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa007.jf.intel.com with ESMTP; 14 May 2024 03:49:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Remove the pat_index field from xe_vma_op_map
Date: Tue, 14 May 2024 16:33:41 +0530
Message-Id: <20240514110341.3581829-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

The pat_index field within xe_vma_op_map facilitates the creation of new
VMAs for DRM_GPUVA_OP_MAP as a GPU baseva operation. Rather than
initializing this field in vm_bind_ioctl_ops_create and subsequently
utilizing it in vm_bind_ioctl_ops_parse, eliminate pat_index from
xe_vma_op_map altogether. Instead, directly pass the user-provided
pat_index to vm_bind_ioctl_ops_parse.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 16 +++++++---------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 --
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c5b1694b292f..a11685e9546b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2055,8 +2055,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u32 flags,
-			 u32 prefetch_region, u16 pat_index)
+			 u32 operation, u32 flags, u32 prefetch_region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
@@ -2117,7 +2116,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
-			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
 		}
@@ -2278,7 +2276,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 
 
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
-				   struct drm_gpuva_ops *ops,
+				   struct drm_gpuva_ops *ops, u16 pat_index,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
 				   struct xe_vma_ops *vops, bool last)
 {
@@ -2322,8 +2320,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.pat_index,
-				      flags);
+			vma = new_vma(vm, &op->base.map, pat_index, flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
@@ -3242,15 +3239,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
-						  prefetch_region, pat_index);
+						  prefetch_region);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
 			goto unwind_ops;
 		}
 
-		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
-					      &vops, i == args->num_binds - 1);
+		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], pat_index,
+					      syncs, num_syncs, &vops,
+					      i == args->num_binds - 1);
 		if (err)
 			goto unwind_ops;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..e13400dd5ee8 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -284,8 +284,6 @@ struct xe_vma_op_map {
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
 	bool dumpable;
-	/** @pat_index: The pat index to use for this operation. */
-	u16 pat_index;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
-- 
2.25.1

