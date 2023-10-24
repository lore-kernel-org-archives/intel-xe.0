Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0675EC00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 12:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70F10E363;
	Tue, 24 Oct 2023 12:23:15 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1183D10E367
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 12:23:11 +0000 (UTC)
From: Maarten@mblankhorst.nl,
	"Lankhorst <maarten.lankhorst"@linux.intel.com
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 14:22:56 +0200
Message-Id: <20231024122256.19512-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231024122256.19512-1-dev@lankhorst.se>
References: <20231024122256.19512-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Implement VM snapshot support
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       |   9 ++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_vm.c                | 111 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h                |   4 +
 4 files changed, 126 insertions(+)

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
index b42ca1069c5b..13494c81e964 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3329,3 +3329,114 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
 	return 0;
 }
+
+struct xe_vm_snapshot {
+	unsigned long num_snaps;
+	struct {
+		uint64_t ofs, bo_ofs;
+		unsigned long len;
+		struct xe_bo *bo;
+		void *data;
+	} snap[];
+};
+
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
+{
+	unsigned long num_snaps = 0, i;
+	struct xe_vm_snapshot *snap;
+	struct drm_gpuva *gpuva;
+
+	mutex_lock(&vm->snap_mutex);
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
+		if (gpuva->flags & XE_VMA_DUMPABLE)
+			num_snaps++;
+	}
+
+	snap = kvmalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]), GFP_NOWAIT);
+	if (!snap)
+		goto out_unlock;
+
+	snap->num_snaps = num_snaps;
+	i = 0;
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_bo *bo = gem_to_xe_bo(vma->gpuva.gem.obj);
+
+		if (!(gpuva->flags & XE_VMA_DUMPABLE))
+			continue;
+
+		snap->snap[i].ofs = xe_vma_start(vma);
+		snap->snap[i].len = xe_vma_size(vma);
+		snap->snap[i].bo = xe_bo_get(bo);
+		snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
+		i++;
+	}
+
+out_unlock:
+	mutex_unlock(&vm->snap_mutex);
+	return snap;
+}
+
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
+{
+	unsigned long i, j;
+
+	for (i = 0; i < snap->num_snaps; i++) {
+		struct xe_bo *bo = snap->snap[i].bo;
+		struct iosys_map src;
+		int err;
+
+		if (snap->snap[i].data)
+			goto print;
+
+		/* Capture data, but try only once */
+		if (bo)
+			snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
+		if (!snap->snap[i].data)
+			goto kvfree;
+
+		/* TODO: Locking, VMAP magic etc here.. */
+		dma_resv_lock(bo->ttm.base.resv, NULL);
+		err = ttm_bo_vmap(&bo->ttm, &src);
+		if (!err) {
+			xe_map_memcpy_from(xe_bo_device(bo),
+					   snap->snap[i].data,
+					   &src, snap->snap[i].bo_ofs,
+					   snap->snap[i].len);
+			ttm_bo_vunmap(&bo->ttm, &src);
+		}
+		dma_resv_unlock(bo->ttm.base.resv);
+
+		if (err)
+			goto kvfree;
+
+print:
+		for (j = 0; j < snap->snap[i].len; j += 64) {
+			uint32_t *x = snap->snap[i].data + j;
+
+			drm_printf(p, "[%llx] = { %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x }\n",
+				   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7],
+				   x[8], x[9], x[10], x[11], x[12], x[13], x[14], x[15]);
+		}
+		xe_bo_put(bo);
+		snap->snap[i].bo = NULL;
+		continue;
+kvfree:
+		kvfree(snap->snap[i].data);
+		snap->snap[i].data = NULL;
+
+		drm_printf(p, "Unable to capture range [%llx-%llx]\n",
+			   snap->snap[i].ofs, snap->snap[i].ofs + snap->snap[i].len - 1);
+	}
+}
+
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
+{
+	unsigned long i;
+
+	for (i = 0; i < snap->num_snaps; i++) {
+		kvfree(snap->snap[i].data);
+		xe_bo_put(snap->snap[i].bo);
+	}
+	kvfree(snap);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b08c75fbd8a1..ef23fe3c2f40 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -233,3 +233,7 @@ static inline void vm_dbg(const struct drm_device *dev,
 { /* noop */ }
 #endif
 #endif
+
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
-- 
2.40.1

