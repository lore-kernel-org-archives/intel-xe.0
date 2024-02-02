Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099BFC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6F110F123;
	Fri,  2 Feb 2024 22:45:20 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C94310F123
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:45:19 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3.1] drm/xe: Implement VM snapshot support for BO's and
 userptr
Date: Fri,  2 Feb 2024 23:45:14 +0100
Message-ID: <20240202224514.855946-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224052.848867-4-maarten.lankhorst@linux.intel.com>
References: <20240202224052.848867-4-maarten.lankhorst@linux.intel.com>
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

Changes since v1:
- Fix crash on NULL captured vm.
- Use ascii85_encode to capture BO contents and save some space.
- Add length to coredump output for each captured area.
Changes since v2:
- Dump each mapping on their own line, to simplify tooling.
- Fix null pointer deref in xe_vm_snapshot_free.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       |  33 ++++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   8 ++
 drivers/gpu/drm/xe/xe_vm.c                | 162 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h                |   5 +
 4 files changed, 206 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 08d3f6cb72292..3e863e51b9d4d 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -17,6 +17,7 @@
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
 #include "xe_sched_job.h"
+#include "xe_vm.h"
 
 /**
  * DOC: Xe device coredump
@@ -59,12 +60,22 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
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
 	struct xe_device *xe = coredump_to_xe(coredump);
-	struct xe_devcoredump_snapshot *ss;
+	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
@@ -74,12 +85,14 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
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
@@ -104,6 +117,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
 						    &p);
+	if (coredump->snapshot.vm) {
+		drm_printf(&p, "\n**** VM state ****\n");
+		xe_vm_snapshot_print(coredump->snapshot.vm, &p);
+	}
 
 	return count - iter.remain;
 }
@@ -117,12 +134,16 @@ static void xe_devcoredump_free(void *data)
 	if (!data || !coredump_to_xe(coredump))
 		return;
 
+	cancel_work_sync(&coredump->snapshot.work);
+
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
 	xe_sched_job_snapshot_free(coredump->snapshot.job);
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
+	xe_vm_snapshot_free(coredump->snapshot.vm);
+	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
 
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -145,6 +166,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	ss->gt = q->gt;
+	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
+
 	cookie = dma_fence_begin_signalling();
 	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
 		if (adj_logical_mask & BIT(i)) {
@@ -160,6 +184,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
 	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
+	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
 
 	for_each_hw_engine(hwe, q->gt, id) {
 		if (hwe->class != q->hwe->class ||
@@ -170,6 +195,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
 	}
 
+	if (ss->vm)
+		queue_work(system_unbound_wq, &ss->work);
+
 	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
 	dma_fence_end_signalling(cookie);
 }
@@ -203,3 +231,4 @@ void xe_devcoredump(struct xe_sched_job *job)
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
 #endif
+
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index d259119b2c980..b389c1a298e3d 100644
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
@@ -36,6 +42,8 @@ struct xe_devcoredump_snapshot {
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
 	/** @job: Snapshot of job state */
 	struct xe_sched_job_snapshot *job;
+	/** @vm: Snapshot of VM state */
+	struct xe_vm_snapshot *vm;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1f0d58bfd1046..6965fe15bcbea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -13,6 +13,7 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
+#include <linux/ascii85.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/mm.h>
@@ -3267,3 +3268,164 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 
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
+	if (!vm)
+		return NULL;
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
+			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+			if (mmget_not_zero(userptr->notifier.mm))
+				snap->snap[i].mm = userptr->notifier.mm;
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
+		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
+		drm_printf(p, "[%llx].data: ",
+			   snap->snap[i].ofs + j);
+
+		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
+			uint32_t *val = snap->snap[i].data + j;
+			char dumped[ASCII85_BUFSZ];
+
+			drm_puts(p, ascii85_encode(*val, dumped));
+		}
+
+		drm_puts(p, "\n");
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
+	if (!snap)
+		return;
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
index df4a82e960ff0..6df1f1c7f85d9 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -271,3 +271,8 @@ static inline void vm_dbg(const struct drm_device *dev,
 { /* noop */ }
 #endif
 #endif
+
+struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
+void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
+void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
+void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
-- 
2.43.0

