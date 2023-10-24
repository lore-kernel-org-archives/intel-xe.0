Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF9EC25B6C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 12:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5F10E365;
	Tue, 24 Oct 2023 12:23:08 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2BE10E369
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 12:23:06 +0000 (UTC)
From: Maarten@mblankhorst.nl,
	"Lankhorst <maarten.lankhorst"@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 14:22:54 +0200
Message-Id: <20231024122256.19512-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231024122256.19512-1-dev@lankhorst.se>
References: <20231024122256.19512-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Annotate each dumpable vma as such
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <dev@lankhorst.se>

In preparation for snapshot dumping, mark each dumpable VMA as such, so
we can walk over the VM later and dump it.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_vm.c       | 21 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dca03d8ad98e..e17af7aa1ca1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -864,6 +864,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
+				    bool dumpable,
 				    u8 tile_mask)
 {
 	struct xe_vma *vma;
@@ -895,6 +896,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
 	if (is_null)
 		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
+	if (dumpable)
+		vma->gpuva.flags |= XE_VMA_DUMPABLE;
 
 	if (tile_mask) {
 		vma->tile_mask = tile_mask;
@@ -2199,6 +2202,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.read_only =
 				flags & XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
+			op->map.dumpable = operation & XE_VM_BIND_FLAG_DUMPABLE;
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
@@ -2263,7 +2267,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null,
+			      bool dumpable)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2279,7 +2284,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, read_only, is_null,
-			    tile_mask);
+			    dumpable, tile_mask);
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2414,7 +2419,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 			vma = new_vma(vm, &op->base.map,
 				      op->tile_mask, op->map.read_only,
-				      op->map.is_null);
+				      op->map.is_null, op->map.dumpable);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
@@ -2437,10 +2442,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				bool is_null =
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
+				bool dumpable =
+					op->base.remap.unmap->va->flags &
+					XE_VMA_DUMPABLE;
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, dumpable);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2471,10 +2479,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				bool is_null =
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
+				bool dumpable =
+					op->base.remap.unmap->va->flags &
+					XE_VMA_DUMPABLE;
 
 				vma = new_vma(vm, op->base.remap.next,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, dumpable);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aaf0c7101019..6852af366ea2 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -32,6 +32,7 @@ struct xe_vm;
 #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -340,6 +341,8 @@ struct xe_vma_op_map {
 	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
+	/** @dumpable: whether BO is dumped on GPU hang */
+	bool dumpable;
 };
 
 /** struct xe_vma_op_remap - VMA remap operation */
-- 
2.40.1

