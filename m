Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB66C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F63310E00A;
	Thu, 16 Nov 2023 19:40:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CE810E00A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700163638; x=1731699638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ypgDvNnIVc1d591BPbg6BhJ9yPNl9p1g0GZyjTEF+Q=;
 b=PH+en75h/tbZ5S3uM/w6gSicidTZZf4oMVsG+DGNlYhPp3UfTeP6qoYS
 2UAELAeJoLfYqiG2aR3MMUbbIhRCXVTCCxjOlEsOT9QeDtKmSYrIH1jfo
 h1lo9NYCewBfD2FvHQ3ECYqruWVdAI9UbEV7kzu3lXRnTLhmBMa5cSFWD
 CgoxWHa/v8089PcPu2HDJkx8hFdQuD82hzZnb4kJKOrWYjCs3HAqDYZ01
 QF7fq+bblNxwiXCALgy+gYMVbzKSwKuXmRTdgnPRZE/3wzzfSnHw29M3W
 Y8UNLNIK/p508hCcj/9Ar3iX8Bi+eh4vnLx5Kp4V5DpjFDRlnyKYQghlO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="394016991"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="394016991"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769004694"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="769004694"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 11:40:44 -0800
Message-Id: <20231116194047.214330-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116194047.214330-1-matthew.brost@intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe: Use a flags field instead of bools
 for VMA create
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
---
 drivers/gpu/drm/xe/xe_vm.c | 58 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cd8c2332a22e..13c8a9c6117c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -858,17 +858,21 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
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
-				    u8 tile_mask)
+				    u8 tile_mask,
+				    unsigned int flags)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
 	u8 id;
+	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
+	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -2263,7 +2267,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2278,8 +2282,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, read_only, is_null,
-			    tile_mask);
+			    op->va.range - 1, tile_mask, flags);
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2405,7 +2408,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma;
 		bool first = list_empty(ops_list);
+		unsigned int flags = 0;
 
 		INIT_LIST_HEAD(&op->link);
 		list_add_tail(&op->link, ops_list);
@@ -2421,11 +2426,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
-			struct xe_vma *vma;
+			flags |= op->map.read_only ?
+				VMA_CREATE_FLAG_READ_ONLY : 0;
+			flags |= op->map.is_null ?
+				VMA_CREATE_FLAG_IS_NULL : 0;
 
 			vma = new_vma(vm, &op->base.map,
-				      op->tile_mask, op->map.read_only,
-				      op->map.is_null);
+				      op->tile_mask, flags);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
@@ -2441,17 +2448,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 			op->remap.range = xe_vma_size(old);
 
 			if (op->base.remap.prev) {
-				struct xe_vma *vma;
-				bool read_only =
-					op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY;
-				bool is_null =
-					op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE;
+				flags |= op->base.remap.unmap->va->flags &
+					XE_VMA_READ_ONLY ?
+					VMA_CREATE_FLAG_READ_ONLY : 0;
+				flags |= op->base.remap.unmap->va->flags &
+					DRM_GPUVA_SPARSE ?
+					VMA_CREATE_FLAG_IS_NULL : 0;
 
 				vma = new_vma(vm, op->base.remap.prev,
-					      op->tile_mask, read_only,
-					      is_null);
+					      op->tile_mask, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2474,18 +2479,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
+				flags |= op->base.remap.unmap->va->flags &
+					XE_VMA_READ_ONLY ?
+					VMA_CREATE_FLAG_READ_ONLY : 0;
+				flags |= op->base.remap.unmap->va->flags &
+					DRM_GPUVA_SPARSE ?
+					VMA_CREATE_FLAG_IS_NULL : 0;
 
 				vma = new_vma(vm, op->base.remap.next,
-					      op->tile_mask, read_only,
-					      is_null);
+					      op->tile_mask, flags);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
-- 
2.34.1

