Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954A4C10F09
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 20:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586A410E615;
	Tue,  5 Dec 2023 20:37:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5510E60C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 20:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701808660; x=1733344660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DfaStDuEnvTDMEI8N54KXWZTCQz3HUmXF9evMj3BQ+g=;
 b=H8Nv/g5KZ97GxCT2jBn1QhW628rRAjL2uMsvecXOCn4k5bsJMQLVgx/M
 9thIwfHYx+XtOXRO6OIQEX+nH0EQbMZ5Gjvv0jVb9rxGglVV/jOgLq91e
 TdbufPwRcPjunC8z7lUHpjjcnOa6iwRcCUDgTKNk5yuS8RgzW7iVX4eAH
 hNkMjZ6VbYG6M4yuYP6AbcHX1xI1o78fPO/xQWPkhU/2/8aNZLc5xgxQE
 hVcG0de9VbMXXiR3MH46h47r6aPvIa64sMRUYZ8EmP7yNrcxW2d9iN+fa
 ILjyWQiIhto5tOyO3En6vqbifqLStfgBgJNFDpRpmtKXfEg9IdG2d5Hrz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397848604"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="397848604"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 12:37:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747366696"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="747366696"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 12:37:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  5 Dec 2023 12:37:54 -0800
Message-Id: <20231205203758.322438-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205203758.322438-1-matthew.brost@intel.com>
References: <20231205203758.322438-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/5] drm/xe: Use a flags field instead of
 bools for VMA create
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

Use a flags field instead of severval bools for VMA create as it is
easier to read and less bug prone.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 64 ++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e09050f16f07..44b2972d5d5f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -860,17 +860,20 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	return fence;
 }
 
+#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
+#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
+
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
-				    bool read_only,
-				    bool is_null,
-				    u16 pat_index)
+				    u16 pat_index, unsigned int flags)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
 	u8 id;
+	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
+	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -2242,7 +2245,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      bool read_only, bool is_null, u16 pat_index)
+			      u16 pat_index, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2257,8 +2260,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, read_only, is_null,
-			    pat_index);
+			    op->va.range - 1, pat_index, flags);
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2384,7 +2386,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma;
 		bool first = list_empty(ops_list);
+		unsigned int flags = 0;
 
 		INIT_LIST_HEAD(&op->link);
 		list_add_tail(&op->link, ops_list);
@@ -2400,10 +2404,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
-			struct xe_vma *vma;
+			flags |= op->map.read_only ?
+				VMA_CREATE_FLAG_READ_ONLY : 0;
+			flags |= op->map.is_null ?
+				VMA_CREATE_FLAG_IS_NULL : 0;
 
-			vma = new_vma(vm, &op->base.map, op->map.read_only,
-				      op->map.is_null, op->map.pat_index);
+			vma = new_vma(vm, &op->base.map, op->map.pat_index,
+				      flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
@@ -2419,16 +2426,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 			op->remap.range = xe_vma_size(old);
 
 			if (op->base.remap.prev) {
-				struct xe_vma *vma;
-				bool read_only =
-					op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY;
-				bool is_null =
-					op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE;
-
-				vma = new_vma(vm, op->base.remap.prev, read_only,
-					      is_null, old->pat_index);
+				flags |= op->base.remap.unmap->va->flags &
+					XE_VMA_READ_ONLY ?
+					VMA_CREATE_FLAG_READ_ONLY : 0;
+				flags |= op->base.remap.unmap->va->flags &
+					DRM_GPUVA_SPARSE ?
+					VMA_CREATE_FLAG_IS_NULL : 0;
+
+				vma = new_vma(vm, op->base.remap.prev,
+					      old->pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2451,17 +2457,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 			}
 
 			if (op->base.remap.next) {
-				struct xe_vma *vma;
-				bool read_only =
-					op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY;
-
-				bool is_null =
-					op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE;
-
-				vma = new_vma(vm, op->base.remap.next, read_only,
-					      is_null, old->pat_index);
+				flags |= op->base.remap.unmap->va->flags &
+					XE_VMA_READ_ONLY ?
+					VMA_CREATE_FLAG_READ_ONLY : 0;
+				flags |= op->base.remap.unmap->va->flags &
+					DRM_GPUVA_SPARSE ?
+					VMA_CREATE_FLAG_IS_NULL : 0;
+
+				vma = new_vma(vm, op->base.remap.next,
+					      old->pat_index, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
-- 
2.34.1

