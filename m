Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900D1C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 12:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CB210EB02;
	Fri, 12 Jan 2024 12:42:00 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8184410EB02
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 12:41:57 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/xe: Implement VM snapshot support for BO's and userptr
Date: Fri, 12 Jan 2024 13:41:48 +0100
Message-Id: <20240112124148.166954-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
References: <20240112124148.166954-1-maarten.lankhorst@linux.intel.com>
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

Since we cannot immediately capture the BO's and userptr, perform it in
2 stages. The immediate stage takes a reference to each BO and userptr,
while a delayed worker captures the contents and then frees the
reference.

This is required because in signaling context, no locks can be taken, no
memory can be allocated, and no waits on userspace can be performed.

With the delayed worker, all of this can be performed very easily,
without having to resort to hacks.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       |  34 ++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 ++
 drivers/gpu/drm/xe/xe_vm.c                | 149 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h                |   5 +
 4 files changed, 194 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68abc0b195be..1ffae670f739 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -16,6 +16,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_vm.h"
 
 /**
  * DOC: Xe device coredump
@@ -58,11 +59,21 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
+static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
+{
+	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
+
+	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	if (ss->vm)
+		xe_vm_snapshot_capture_delayed(ss->vm);
+	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
 	struct xe_devcoredump *coredump = data;
-	struct xe_devcoredump_snapshot *ss;
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
@@ -72,12 +83,14 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	if (!data || !coredump_to_xe(coredump))
 		return -ENODEV;
 
+	/* Ensure delayed work is captured before continuing */
+	flush_work(&ss->work);
+
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
 	iter.remain = count;
 
-	ss = &coredump->snapshot;
 	p = drm_coredump_printer(&iter);
 
 	drm_printf(&p, "**** Xe Device Coredump ****\n");
@@ -98,6 +111,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
 						    &p);
+	if (coredump->snapshot.vm) {
+		drm_printf(&p, "\n**** VM state ****\n");
+		xe_vm_snapshot_print(coredump->snapshot.vm, &p);
+	}
 
 	return count - iter.remain;
 }
@@ -111,11 +128,15 @@ static void xe_devcoredump_free(void *data)
 	if (!data || !coredump_to_xe(coredump))
 		return;
 
+	cancel_work_sync(&coredump->snapshot.work);
+
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
+	xe_vm_snapshot_free(coredump->snapshot.vm);
+	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
 
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -137,6 +158,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	ss->gt = q->gt;
+	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
+
 	cookie = dma_fence_begin_signalling();
 	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
 		if (adj_logical_mask & BIT(i)) {
@@ -151,6 +175,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
+	if (q->vm)
+		coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
 
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
@@ -161,6 +187,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
 	}
 
+	if (ss->vm)
+		queue_work(system_unbound_wq, &ss->work);
+
 	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 	dma_fence_end_signalling(cookie);
 }
@@ -194,3 +223,4 @@ void xe_devcoredump(struct xe_exec_queue *q)
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
 #endif
+
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 7fdad9c3d3dd..17ae3e3597b0 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -12,6 +12,7 @@
 #include "xe_hw_engine_types.h"
 
 struct xe_device;
+struct xe_gt;
 
 /**
  * struct xe_devcoredump_snapshot - Crash snapshot
@@ -26,6 +27,11 @@ struct xe_devcoredump_snapshot {
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
 
+	/** @gt: Affected GT, used by forcewake for delayed capture */
+	struct xe_gt *gt;
+	/** @work: Workqueue for deffered capture outside of signaling context */
+	struct work_struct work;
+
 	/* GuC snapshots */
 	/** @ct: GuC CT snapshot */
 	struct xe_guc_ct_snapshot *ct;
@@ -33,6 +39,8 @@ struct xe_devcoredump_snapshot {
 	struct xe_guc_submit_exec_queue_snapshot *ge;
 	/** @hwe: HW Engine snapshot array */
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
+	/** @vm: Snapshot of VM state */
+	struct xe_vm_snapshot *vm;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e1c07c6ecbaf..c16d0fd89411 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3229,3 +3229,152 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
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
+		struct mm_struct *mm;
+	} snap[];
+};
+
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
+{
+	unsigned long num_snaps = 0, i;
+	struct xe_vm_snapshot *snap = NULL;
+	struct drm_gpuva *gpuva;
+
+	mutex_lock(&vm->snap_mutex);
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
+		if (gpuva->flags & XE_VMA_DUMPABLE)
+			num_snaps++;
+	}
+
+	if (num_snaps)
+		snap = kvzalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]), GFP_NOWAIT);
+	if (!snap)
+		goto out_unlock;
+
+	snap->num_snaps = num_snaps;
+	i = 0;
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_bo *bo = vma->gpuva.gem.obj ?
+			gem_to_xe_bo(vma->gpuva.gem.obj) : NULL;
+
+		if (!(gpuva->flags & XE_VMA_DUMPABLE))
+			continue;
+
+		snap->snap[i].ofs = xe_vma_start(vma);
+		snap->snap[i].len = xe_vma_size(vma);
+		if (bo) {
+			snap->snap[i].bo = xe_bo_get(bo);
+			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
+		} else if (xe_vma_is_userptr(vma)) {
+			if (mmget_not_zero(vma->userptr.notifier.mm))
+				snap->snap[i].mm = vma->userptr.notifier.mm;
+			else
+				snap->snap[i].data = ERR_PTR(-EFAULT);
+			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
+		} else {
+			snap->snap[i].data = ERR_PTR(-ENOENT);
+		}
+		i++;
+	}
+
+out_unlock:
+	mutex_unlock(&vm->snap_mutex);
+	return snap;
+}
+
+void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
+{
+	for (int i = 0; i < snap->num_snaps; i++) {
+		struct xe_bo *bo = snap->snap[i].bo;
+		struct iosys_map src;
+		int err;
+
+		if (IS_ERR(snap->snap[i].data))
+			continue;
+
+		snap->snap[i].data = kvmalloc(snap->snap[i].len, GFP_USER);
+		if (!snap->snap[i].data) {
+			snap->snap[i].data = ERR_PTR(-ENOMEM);
+			goto cleanup_bo;
+		}
+
+		if (bo) {
+			dma_resv_lock(bo->ttm.base.resv, NULL);
+			err = ttm_bo_vmap(&bo->ttm, &src);
+			if (!err) {
+				xe_map_memcpy_from(xe_bo_device(bo),
+						   snap->snap[i].data,
+						   &src, snap->snap[i].bo_ofs,
+						   snap->snap[i].len);
+				ttm_bo_vunmap(&bo->ttm, &src);
+			}
+			dma_resv_unlock(bo->ttm.base.resv);
+		} else {
+			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
+			kthread_use_mm(snap->snap[i].mm);
+
+			if (!copy_from_user(snap->snap[i].data, userptr, snap->snap[i].len))
+				err = 0;
+			else
+				err = -EFAULT;
+			kthread_unuse_mm(snap->snap[i].mm);
+			mmput(snap->snap[i].mm);
+			snap->snap[i].mm = NULL;
+		}
+
+		if (err) {
+			kvfree(snap->snap[i].data);
+			snap->snap[i].data = ERR_PTR(err);
+		}
+
+cleanup_bo:
+		xe_bo_put(bo);
+		snap->snap[i].bo = NULL;
+	}
+}
+
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
+{
+	unsigned long i, j;
+
+	for (i = 0; i < snap->num_snaps; i++) {
+		if (IS_ERR(snap->snap[i].data))
+			goto uncaptured;
+
+		for (j = 0; j < snap->snap[i].len; j += 64) {
+			uint32_t *x = snap->snap[i].data + j;
+
+			drm_printf(p, "[%llx] = { %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x, %x }\n",
+				   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7],
+				   x[8], x[9], x[10], x[11], x[12], x[13], x[14], x[15]);
+		}
+		continue;
+
+uncaptured:
+		drm_printf(p, "Unable to capture range [%llx-%llx]: %li\n",
+			   snap->snap[i].ofs, snap->snap[i].ofs + snap->snap[i].len - 1,
+			   PTR_ERR(snap->snap[i].data));
+	}
+}
+
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
+{
+	unsigned long i;
+
+	for (i = 0; i < snap->num_snaps; i++) {
+		if (!IS_ERR(snap->snap[i].data))
+			kvfree(snap->snap[i].data);
+		xe_bo_put(snap->snap[i].bo);
+		if (snap->snap[i].mm)
+			mmput(snap->snap[i].mm);
+	}
+	kvfree(snap);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index cf2f96e8c1ab..9a7513d31b2b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -261,3 +261,8 @@ static inline void vm_dbg(const struct drm_device *dev,
 { /* noop */ }
 #endif
 #endif
+
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
+void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
-- 
2.40.1

