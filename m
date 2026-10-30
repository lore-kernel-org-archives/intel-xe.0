Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD59606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 23:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VH//Ooyu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1178910E3E2;
	Fri, 30 Oct 2026 23:39:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7CA10E311
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 23:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793403531; x=1824939531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8L+FI1I+V789MgjSTelAnkkn78bWyweTZJoxlmUixCo=;
 b=VH//OoyuGvUlEdsiMI6ArnbdVF7Aq001eh1ARng54UDjsrWGq/yi7+dC
 9TTeKUgZY8yxJn0KnFhXUpOtPHZV2wlAsVCylwEeWuNMbIYb5nKhYPiKQ
 lhc8KVd4qdBIMPC8JtnfmLXrREp8ij+XhUyM0QWbTTUwjBQpMTY1sUImd
 UXJ22WBojGVB1v3KozfENpryN8IUiUNGoN72y9J67pBEPhsxYat5qiZBq
 /KPh51K8k7Mc+vHVkUPvunR0aEqUNqvyeCLv6WYCgwtYQKfpAHvW6aTL1
 B8JPIbK4JkbsWAv8TaJkZDxF4dQ9Lu4XquwxWCKPkWPR3evRSWm1bG4Rb Q==;
X-CSE-ConnectionGUID: n5+OrlsuSqGbPQAh5zLt8g==
X-CSE-MsgGUID: 4xRbWXc4RseX9uwkk5DOTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2168348"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2168348"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:38:46 -0700
X-CSE-ConnectionGUID: qpW7yV8yTKizwhiA96i4oA==
X-CSE-MsgGUID: SEriTZhfSyO9JvHMOaABNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5970931"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 16:38:46 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: riana.tauro@intel.com,
	harish.chegondi@intel.com
Subject: [PATCH v3 3/3] drm/xe/oa: Quiesce OA streams on driver unbind and PCI
 reset
Date: Fri, 30 Oct 2026 16:38:43 -0700
Message-ID: <20261030233839.2284694-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030233839.2284694-5-umesh.nerlige.ramappa@intel.com>
References: <20261030233839.2284694-5-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An OA stream fd can outlive the device: after a PCI slot reset or after
unbind. The poll hrtimer and userspace calls on the fd could then access
MMIO and other device-bound objects that were released on remove,
causing a NULL pointer dereference, and xe_oa_release() would tear down
against freed objects.

Call xe_oa_quiesce() from xe_oa_fini() to cleanup the stream resources.
Only the stream struct stays allocated, with stream_lock and poll_wq
valid, until the fd is closed or the process owning the fd exits.

Once dead, OA interfaces return -ENODEV, poll reports EPOLLERR |
EPOLLHUP, and xe_oa_release() frees the stream struct and drops the drm
device reference.

Note:

- Introduce a dedicated mmap_mutex to handle an AB-BA deadlock between
  mmap_lock and stream_lock.

    mmap path: mmap_lock -> stream_lock
    read path: stream_lock -> mmap_lock (if copy_to_user faults)

- drm_dev_unplug() in xe_device_remove() zaps the OA buffer mmaps before
  the stream is marked dead. Make the OA fault handler also return
  SIGBUS once the device is unplugged, otherwise the generic BO fault
  handler silently installs a dummy page until the stream is quiesced.

- Unbind does not reset the GT or the device, so cleanup HW state as
  well in this case. In the wedged case, HW state cleanup is not
  attempted.

- drm_ioctl() only checks for unplug on entry, so a STREAM_OPEN ioctl
  that started before drm_dev_unplug() can still create a new live
  stream around xe_oa_quiesce(). Use per-GT quiesced flag to take care
  of that.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Include Sashiko's comments
v3: Fix circular lockdep issue due to scope of stream->mmap_mutex
---
 drivers/gpu/drm/xe/xe_oa.c       | 229 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h |   9 ++
 2 files changed, 208 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index e2198fdd2a09..b30ea99c49ce 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -42,6 +42,7 @@
 #include "xe_sriov.h"
 #include "xe_sync.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -259,13 +260,18 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
-	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 tail, hw_tail, partial_report_size, available;
+	u32 gtt_offset, tail, hw_tail, partial_report_size, available;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
 
 	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
 
+	if (stream->dead) {
+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+		return false;
+	}
+
+	gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
 	hw_tail = xe_oa_hw_tail_read(stream);
 	hw_tail -= gtt_offset;
 
@@ -317,6 +323,9 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	struct xe_oa_stream *stream =
 		container_of(hrtimer, typeof(*stream), poll_check_timer);
 
+	if (READ_ONCE(stream->dead))
+		return HRTIMER_NORESTART;
+
 	if (xe_oa_buffer_check_unlocked(stream))
 		wake_up(&stream->poll_wq);
 
@@ -528,12 +537,19 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 
 static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
 {
+	int ret;
+
 	/* We might wait indefinitely if periodic sampling is not enabled */
 	if (!stream->periodic)
 		return -EINVAL;
 
-	return wait_event_interruptible(stream->poll_wq,
-					xe_oa_buffer_check_unlocked(stream));
+	ret = wait_event_interruptible(stream->poll_wq,
+				       READ_ONCE(stream->dead) ||
+				       xe_oa_buffer_check_unlocked(stream));
+	if (ret)
+		return ret;
+
+	return READ_ONCE(stream->dead) ? -ENODEV : 0;
 }
 
 #define OASTATUS_RELEVANT_BITS (OASTATUS_MMIO_TRG_Q_FULL | OASTATUS_COUNTER_OVERFLOW | \
@@ -562,6 +578,9 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	size_t offset = 0;
 	int ret;
 
+	if (READ_ONCE(stream->dead))
+		return -ENODEV;
+
 	if (!stream->sample)
 		return -EINVAL;
 
@@ -572,13 +591,14 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 				return ret;
 
 			mutex_lock(&stream->stream_lock);
-			ret = __xe_oa_read(stream, buf, count, &offset);
+			ret = stream->dead ? -ENODEV :
+				__xe_oa_read(stream, buf, count, &offset);
 			mutex_unlock(&stream->stream_lock);
 		} while (!offset && !ret);
 	} else {
 		xe_oa_buffer_check_unlocked(stream);
 		mutex_lock(&stream->stream_lock);
-		ret = __xe_oa_read(stream, buf, count, &offset);
+		ret = stream->dead ? -ENODEV : __xe_oa_read(stream, buf, count, &offset);
 		mutex_unlock(&stream->stream_lock);
 	}
 
@@ -605,6 +625,9 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 
 	poll_wait(file, &stream->poll_wq, wait);
 
+	if (stream->dead)
+		return EPOLLERR | EPOLLHUP;
+
 	/*
 	 * We don't explicitly check whether there's something to read here since this
 	 * path may be hot depending on what else userspace is polling, or on the timeout
@@ -874,33 +897,43 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
 }
 
-static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
+static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
 {
-	struct xe_oa_unit *u = stream->oa_unit;
-	struct xe_gt *gt = stream->hwe->gt;
-
-	if (WARN_ON(stream != u->exclusive_stream))
-		return;
-
-	WRITE_ONCE(u->exclusive_stream, NULL);
-
-	mutex_destroy(&stream->stream_lock);
-
 	if (stream->sample)
 		xe_reg_dewhitelist_oa_regs(stream->gt);
 
 	xe_oa_disable_metric_set(stream);
+	xe_force_wake_put(gt_to_fw(stream->hwe->gt), stream->fw_ref);
+}
+
+static void xe_oa_stream_free_resources(struct xe_oa_stream *stream)
+{
 	xe_exec_queue_put(stream->k_exec_q);
 
 	xe_oa_free_oa_buffer(stream);
 
-	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
 	xe_oa_free_configs(stream);
 	xe_file_put(stream->xef);
 }
 
+static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
+{
+	struct xe_oa_unit *u = stream->oa_unit;
+
+	if (WARN_ON(stream != u->exclusive_stream))
+		return;
+
+	WRITE_ONCE(u->exclusive_stream, NULL);
+
+	mutex_destroy(&stream->stream_lock);
+	mutex_destroy(&stream->mmap_mutex);
+
+	xe_oa_stream_hw_teardown(stream);
+	xe_oa_stream_free_resources(stream);
+}
+
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
 	u32 vram = mert_wa_14026633728(stream) ?
@@ -1661,6 +1694,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
 {
+	if (stream->dead)
+		return -ENODEV;
+
 	switch (cmd) {
 	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
 		return xe_oa_enable_locked(stream);
@@ -1693,6 +1729,15 @@ static long xe_oa_ioctl(struct file *file,
 
 static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
+	if (stream->dead) {
+		mutex_destroy(&stream->stream_lock);
+		mutex_destroy(&stream->mmap_mutex);
+		kfree(stream);
+		return;
+	}
+
+	xe_pm_runtime_get(gt_to_xe(stream->gt));
+
 	if (stream->enabled)
 		xe_oa_disable_locked(stream);
 
@@ -1702,6 +1747,7 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
+	xe_pm_runtime_put(gt_to_xe(stream->gt));
 	kfree(stream);
 }
 
@@ -1710,11 +1756,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
-	xe_pm_runtime_put(gt_to_xe(gt));
 
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
@@ -1730,8 +1774,11 @@ static vm_fault_t xe_oa_buffer_fault(struct vm_fault *vmf)
 	 * Once the stream is dead its OA buffer may already be gone (or about
 	 * to be). Refuse to (re-)install a PTE rather than letting the
 	 * generic BO fault handler touch a buffer that's being torn down.
+	 * drm_dev_unplug() zaps the mapping before the stream is marked dead,
+	 * so also refuse once unplugged, the generic handler would install a
+	 * dummy page.
 	 */
-	if (READ_ONCE(stream->dead))
+	if (READ_ONCE(stream->dead) || drm_dev_is_unplugged(&stream->oa->xe->drm))
 		return VM_FAULT_SIGBUS;
 
 	return xe_bo_cpu_fault(vmf);
@@ -1744,18 +1791,12 @@ static const struct vm_operations_struct xe_oa_vm_ops = {
 	.access	= xe_bo_vm_access,
 };
 
-static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
+static int xe_oa_mmap_locked(struct xe_oa_stream *stream, struct vm_area_struct *vma)
 {
-	struct xe_oa_stream *stream = file->private_data;
-	int ret = xe_observation_paranoid_check();
 	struct xe_bo *bo = stream->oa_buffer.bo;
+	int ret;
 
-	if (ret) {
-		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
-		return ret;
-	}
-
-	if (stream->dead)
+	if (READ_ONCE(stream->dead))
 		return -ENODEV;
 
 	/*
@@ -1793,6 +1834,30 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	return ret;
 }
 
+static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct xe_oa_stream *stream = file->private_data;
+	int ret = xe_observation_paranoid_check();
+
+	if (ret) {
+		drm_dbg(&gt_to_xe(stream->gt)->drm, "Insufficient privilege to map OA buffer\n");
+		return ret;
+	}
+
+	/*
+	 * Serialize against xe_oa_quiesce() marking the stream dead before it frees the OA
+	 * buffer. Can't use stream_lock here, it is held across user copies which fault on
+	 * mmap_lock, held by the caller. A vma that isn't yet linked into the address_space
+	 * when quiesce zaps the mappings is still safe: it holds a GEM ref on the BO and
+	 * xe_oa_buffer_fault() refuses faults once the stream is dead.
+	 */
+	mutex_lock(&stream->mmap_mutex);
+	ret = xe_oa_mmap_locked(stream, vma);
+	mutex_unlock(&stream->mmap_mutex);
+
+	return ret;
+}
+
 static const struct file_operations xe_oa_fops = {
 	.owner		= THIS_MODULE,
 	.release	= xe_oa_release,
@@ -1898,6 +1963,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	spin_lock_init(&stream->oa_buffer.ptr_lock);
 	mutex_init(&stream->stream_lock);
+	mutex_init(&stream->mmap_mutex);
 
 	return 0;
 
@@ -1924,6 +1990,12 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	int stream_fd;
 	int ret;
 
+	if (param->hwe->gt->oa.quiesced) {
+		drm_dbg(&oa->xe->drm, "OA is quiesced\n");
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	/* We currently only allow exclusive access */
 	if (param->oa_unit->exclusive_stream) {
 		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
@@ -2616,6 +2688,97 @@ static void xe_oa_unregister(void *arg)
 	oa->metrics_kobj = NULL;
 }
 
+static void xe_oa_quiesce_oa_unit(struct xe_oa_unit *u, bool hw_accessible)
+{
+	struct xe_oa_stream *stream = u->exclusive_stream;
+	unsigned long flags;
+
+	if (!stream)
+		return;
+
+	mutex_lock(&stream->stream_lock);
+	if (stream->enabled && hw_accessible)
+		xe_oa_disable_locked(stream);
+
+	stream->enabled = false;
+
+	/*
+	 * Once dead is set under mmap_mutex, no new xe_oa_mmap() can reference the OA buffer.
+	 * Don't hold mmap_mutex any longer than that: it nests under mmap_lock, and the HW
+	 * teardown below submits batches, taking vm->lock and the vm resv.
+	 */
+	mutex_lock(&stream->mmap_mutex);
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+	WRITE_ONCE(stream->dead, true);
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+	mutex_unlock(&stream->mmap_mutex);
+
+	if (stream->sample)
+		hrtimer_cancel(&stream->poll_check_timer);
+
+	wake_up_all(&stream->poll_wq);
+
+	/* Zap userspace mappings of this OA buffer only, others in the address_space stay */
+	drm_vma_node_unmap(&stream->oa_buffer.bo->ttm.base.vma_node,
+			   stream->oa->xe->drm.anon_inode->i_mapping);
+
+	/*
+	 * Restore the HW state while the stream still holds its runtime PM ref and exec_q.
+	 * The device is not reset on unbind, so this can't be left to a later reset.
+	 */
+	if (hw_accessible)
+		xe_oa_stream_hw_teardown(stream);
+
+	xe_oa_stream_free_resources(stream);
+	if (stream->exec_q) {
+		xe_exec_queue_put(stream->exec_q);
+		stream->exec_q = NULL;
+	}
+	drm_syncobj_put(stream->ufence_syncobj);
+
+	WRITE_ONCE(u->exclusive_stream, NULL);
+	mutex_unlock(&stream->stream_lock);
+}
+
+static void xe_oa_quiesce_gt(struct xe_gt *gt, bool hw_accessible)
+{
+	int i;
+
+	mutex_lock(&gt->oa.gt_lock);
+	/* Set before touching the units so a racing STREAM_OPEN can't slip in a new stream */
+	gt->oa.quiesced = true;
+	for (i = 0; i < gt->oa.num_oa_units; i++)
+		xe_oa_quiesce_oa_unit(&gt->oa.oa_unit[i], hw_accessible);
+	mutex_unlock(&gt->oa.gt_lock);
+}
+
+/**
+ * xe_oa_quiesce - Disable all active OA streams on driver unbind or PCI slot reset
+ * @xe: @xe_device
+ *
+ * Disables the OA unit and stops the poll timer of every active stream, marks it dead
+ * and releases all device-bound resources (OA buffer and its userspace mappings, exec
+ * queues, configs, references). Unless the device is wedged, the HW state (whitelist,
+ * metric set, forcewake, preemption) is restored first. Any further read, poll, mmap or
+ * ioctl on the stream fd is rejected (-ENODEV). Only the stream struct stays allocated
+ * until userspace closes the fd, at which point xe_oa_release() just frees it.
+ */
+static void xe_oa_quiesce(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	if (!xe->oa.xe)
+		return;
+
+	/*
+	 * A wedged device may be unresponsive and a driver FLR follows on fini, so skip HW
+	 * access there and only release the SW resources.
+	 */
+	for_each_gt(gt, xe, id)
+		xe_oa_quiesce_gt(gt, !xe_wedged(xe));
+}
+
 /**
  * xe_oa_register - Xe OA registration
  * @xe: @xe_device
@@ -2927,6 +3090,12 @@ static void xe_oa_fini(void *arg)
 	if (!oa->xe)
 		return;
 
+	/*
+	 * Devm action, so this runs on unbind and PCI slot reset after xe_device_remove() even
+	 * if streams are still open. Quiesce them before the configs they hold are destroyed.
+	 */
+	xe_oa_quiesce(xe);
+
 	idr_for_each(&oa->metrics_idr, destroy_config, oa);
 	idr_destroy(&oa->metrics_idr);
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index e60a90bae1c6..f17e12079b9d 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -121,6 +121,9 @@ struct xe_oa_gt {
 	/** @gt_lock: lock protecting create/destroy OA streams */
 	struct mutex gt_lock;
 
+	/** @quiesced: OA is being torn down, no new streams allowed. Protected by @gt_lock */
+	bool quiesced;
+
 	/** @num_oa_units: number of oa units for each gt */
 	u32 num_oa_units;
 
@@ -202,6 +205,12 @@ struct xe_oa_stream {
 	/** @stream_lock: Lock serializing stream operations */
 	struct mutex stream_lock;
 
+	/**
+	 * @mmap_mutex: Serializes mmap against quiesce freeing the OA buffer. Leaf lock, taken
+	 * under mmap_lock in mmap, so never take stream_lock or fault on user memory under it
+	 */
+	struct mutex mmap_mutex;
+
 	/** @sample: true if DRM_XE_OA_PROP_SAMPLE_OA is provided */
 	bool sample;
 
-- 
2.55.0

