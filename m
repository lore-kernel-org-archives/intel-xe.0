Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846DBC54788
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 13:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477D910E748;
	Wed, 21 Feb 2024 13:30:36 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DE510E743
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 13:30:34 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v5 4/9] drm/xe: Annotate each dumpable vma as such
Date: Wed, 21 Feb 2024 14:30:19 +0100
Message-ID: <20240221133024.898315-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In preparation for snapshot dumping, mark each dumpable VMA as such, so
we can walk over the VM later and dump it.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 08462f80f000e..df1e3841005d4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -792,6 +792,7 @@ static void xe_vma_free(struct xe_vma *vma)
 
 #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
 #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
+#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
 
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
@@ -804,6 +805,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	u8 id;
 	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
 	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
+	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -838,6 +840,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->gpuva.va.range = end - start + 1;
 	if (read_only)
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
+	if (dumpable)
+		vma->gpuva.flags |= XE_VMA_DUMPABLE;
 
 	for_each_tile(tile, vm->xe, id)
 		vma->tile_mask |= 0x1 << id;
@@ -2122,6 +2126,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.read_only =
 				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
@@ -2317,6 +2322,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
 				VMA_CREATE_FLAG_IS_NULL : 0;
+			flags |= op->map.dumpable ?
+				VMA_CREATE_FLAG_DUMPABLE : 0;
 
 			vma = new_vma(vm, &op->base.map, op->map.pat_index,
 				      flags);
@@ -2341,6 +2348,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE ?
 					VMA_CREATE_FLAG_IS_NULL : 0;
+				flags |= op->base.remap.unmap->va->flags &
+					XE_VMA_DUMPABLE ?
+					VMA_CREATE_FLAG_DUMPABLE : 0;
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      old->pat_index, flags);
@@ -2372,6 +2382,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE ?
 					VMA_CREATE_FLAG_IS_NULL : 0;
+				flags |= op->base.remap.unmap->va->flags &
+					XE_VMA_DUMPABLE ?
+					VMA_CREATE_FLAG_DUMPABLE : 0;
 
 				vma = new_vma(vm, op->base.remap.next,
 					      old->pat_index, flags);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index a603cc2eb56b3..a975ac83eccae 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -31,6 +31,7 @@ struct xe_vm;
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 9)
+#define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 10)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -294,6 +295,8 @@ struct xe_vma_op_map {
 	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
+	/** @dumpable: whether BO is dumped on GPU hang */
+	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
 };
-- 
2.43.0

