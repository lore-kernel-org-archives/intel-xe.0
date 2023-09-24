Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CFDCE7A8C
	for <intel-xe@archiver.kernel.org>; Sun, 24 Sep 2023 20:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3577610E144;
	Sun, 24 Sep 2023 20:02:40 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBD410E144
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Sep 2023 20:02:37 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Date: Sun, 24 Sep 2023 22:02:26 +0200
Message-Id: <20230924200226.3940-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe: Add VM snapshot support
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

Just an idea I had so far. Some opens:
- Do we want to set a flag on a VM_BIND or on a BO to choose what to
  snapshot? Likely VM_BIND.
- Handle BO mapping in atomic context? Right now I bind the mapping on VM_BIND,
  because it's easier there when we have all the locks. Due to signaling
  context usage, we can never take the BO lock there reliably..

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c                |   5 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       |   9 ++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_vm.c                | 126 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h                |   6 ++
 drivers/gpu/drm/xe/xe_vm_types.h          |  19 ++++
 6 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 27726d4f3423..1f6229da2b2d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -469,6 +469,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 		trace_xe_vma_evict(vma);
 
+		xe_vma_move_notify(vma);
+
 		if (xe_vm_in_fault_mode(vm)) {
 			/* Wait for pending binds / unbinds. */
 			long timeout;
@@ -1799,7 +1801,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 
 		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
-	}
+	} else if (!(bo_flags & XE_BO_CREATE_VRAM_MASK))
+		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
 
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68abc0b195be..298be162ed0c 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -16,6 +16,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_vm.h"
 
 /**
  * DOC: Xe device coredump
@@ -98,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
 						    &p);
+	if (coredump->snapshot.vm) {
+		drm_printf(&p, "\n**** VM state ****\n");
+		xe_vm_snapshot_print(coredump->snapshot.vm, &p);
+	}
 
 	return count - iter.remain;
 }
@@ -116,6 +121,7 @@ static void xe_devcoredump_free(void *data)
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
+	xe_vm_snapshot_free(coredump->snapshot.vm);
 
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -151,6 +157,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
+	if (q->vm)
+		coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
 
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
@@ -194,3 +202,4 @@ void xe_devcoredump(struct xe_exec_queue *q)
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
 #endif
+
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 7fdad9c3d3dd..93c2ad7bdc54 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -33,6 +33,8 @@ struct xe_devcoredump_snapshot {
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 	/** @hwe: HW Engine snapshot array */
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
+	/** @vm: Snapshot of VM state */
+	struct xe_vm_snapshot *vm;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2b225c0692a6..276b03847ecc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -889,6 +889,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (is_null)
 		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
 
+	if (bo && bo->flags & XE_BO_NEEDS_CPU_ACCESS) {
+		INIT_LIST_HEAD(&vma->snap.link);
+		vma->gpuva.flags |= XE_VMA_SNAPSHOTTABLE;
+	}
+
 	if (tile_mask) {
 		vma->tile_mask = tile_mask;
 	} else {
@@ -1238,6 +1243,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_LIST_HEAD(&vm->extobj.list);
 
+	mutex_init(&vm->snap.lock);
+	INIT_LIST_HEAD(&vm->snap.list);
+
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_get(xe);
 
@@ -1354,6 +1362,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	dma_resv_unlock(&vm->resv);
 	drm_gpuva_manager_destroy(&vm->mgr);
 err_put:
+	mutex_destroy(&vm->snap.lock);
 	dma_resv_fini(&vm->resv);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
@@ -1638,6 +1647,14 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 					     cf ? &cf->base : fence);
 	}
 
+	if (vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE &&
+	    !list_empty(&vma->snap.link)) {
+		mutex_lock(&vm->snap.lock);
+		list_del(&vma->snap.link);
+		vm->snap.num--;
+		mutex_unlock(&vm->snap.lock);
+	}
+
 	return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
 
 err_fences:
@@ -1669,6 +1686,13 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	trace_xe_vma_bind(vma);
 
+	/* Map for coredump */
+	if (vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE) {
+		err = xe_bo_vmap(xe_vma_bo(vma));
+		if (err)
+			return ERR_PTR(err);
+	}
+
 	if (number_tiles > 1) {
 		fences = kmalloc_array(number_tiles, sizeof(*fences),
 				       GFP_KERNEL);
@@ -1715,6 +1739,14 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 					     cf ? &cf->base : fence);
 	}
 
+	if (vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE &&
+	    list_empty(&vma->snap.link)) {
+		mutex_lock(&vm->snap.lock);
+		list_add_tail(&vma->snap.link, &vm->snap.list);
+		vm->snap.num++;
+		mutex_unlock(&vm->snap.lock);
+	}
+
 	return cf ? &cf->base : fence;
 
 err_fences:
@@ -3561,3 +3593,97 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
+
+struct xe_vm_snapshot {
+	unsigned long num_snaps;
+	struct {
+		uint64_t ofs;
+		unsigned long len;
+		void *data;
+	} snap[];
+};
+
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
+{
+	unsigned long num_snaps, i;
+	struct xe_vm_snapshot *snap;
+	struct xe_vma *vma;
+
+	mutex_lock(&vm->snap.lock);
+	num_snaps = vm->snap.num;
+
+	snap = kvmalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]), GFP_NOWAIT);
+	if (!snap)
+		goto out_unlock;
+
+	snap->num_snaps = num_snaps;
+	i = 0;
+	list_for_each_entry(vma, &vm->snap.list, snap.link) {
+		struct xe_bo *bo = gem_to_xe_bo(vma->gpuva.gem.obj);
+		unsigned long bo_ofs = xe_vma_bo_offset(vma);
+
+		snap->snap[i].ofs = xe_vma_start(vma);
+		snap->snap[i].len = xe_vma_size(vma);
+		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_NOWAIT);
+		if (!snap->snap[i].data)
+			goto next;
+
+		/* TODO: Some way around trylock? */
+		xe_map_memcpy_from(vm->xe, snap->snap[i].data,
+				   &bo->vmap, bo_ofs, snap->snap[i].len);
+
+next:
+		i++;
+	}
+
+out_unlock:
+	mutex_unlock(&vm->snap.lock);
+	return snap;
+}
+
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
+{
+	unsigned long i, j;
+
+	for (i = 0; i < snap->num_snaps; i++) {
+		if (!snap->snap[i].data) {
+			drm_printf(p, "Unable to capture range [%llx-%llx]\n",
+				   snap->snap[i].ofs, snap->snap[i].ofs + snap->snap[i].len - 1);
+			continue;
+		}
+
+		for (j = 0; j < snap->snap[i].len; j += 64) {
+			uint32_t *x = snap->snap[i].data + j;
+
+			drm_printf(p, "[%llx] = { %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x }\n",
+				   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7],
+				   x[8], x[9], x[10], x[11], x[12], x[13], x[14], x[15]);
+		}
+	}
+}
+
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
+{
+	unsigned long i;
+
+	for (i = 0; i < snap->num_snaps; i++)
+		kvfree(snap->snap[i].data);
+	kvfree(snap);
+}
+
+void xe_vma_move_notify(struct xe_vma *vma)
+{
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	if (!(vma->gpuva.flags & XE_VMA_SNAPSHOTTABLE))
+		return;
+
+	if (list_empty(&vma->snap.link))
+		return;
+
+	mutex_lock(&vm->snap.lock);
+	list_del(&vma->snap.link);
+	vm->snap.num--;
+	mutex_unlock(&vm->snap.lock);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f966ed39b711..b0b96f158f8b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -234,3 +234,9 @@ static inline void vm_dbg(const struct drm_device *dev,
 { /* noop */ }
 #endif
 #endif
+
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+void xe_vma_move_notify(struct xe_vma *vma);
+
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52e5eaed91c3..eb558e5a7f27 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -33,6 +33,7 @@ struct xe_vm;
 #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
+#define XE_VMA_SNAPSHOTTABLE	(DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -123,6 +124,14 @@ struct xe_vma {
 		struct list_head link;
 	} extobj;
 
+	struct {
+		/**
+		 * @snap.link: Link into list of xe_vm's snapshottable vma's.
+		 * protected by vm->snap.lock.
+		 */
+		struct list_head link;
+	} snap;
+
 	/**
 	 * @userptr: user pointer state, only allocated for VMAs that are
 	 * user pointers
@@ -336,6 +345,16 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+
+	/** @snap: Snapshot support structures */
+	struct {
+		/** @mutex: Mutex held in signaling context */
+		struct mutex lock;
+		/** @list: List of all vma's to snapshot */
+		struct list_head list;
+		/** @num: Number of snapshottable vma's */
+		unsigned long num;
+	} snap;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.40.1

