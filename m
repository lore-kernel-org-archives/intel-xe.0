Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAA1606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 00:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ls1Sk7mS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E1B10F8E6;
	Wed,  4 Nov 2026 00:52:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A389110F8EE
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 00:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753562; x=1825289562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qHNIIOrLP1TVgBjQ4NGb9b+X7ZtKcXYMky8w/ylAgLQ=;
 b=Ls1Sk7mSptYDzgKpzZ+8wGbLNBouVDLjunKDKkzwisQ6YJVz3Vp0H/tI
 We06eqGBVE1raBCMCw3H8ZrFyhXAcqf8oq5V9IcNWsJnX80Bp9k9cqE1K
 uiaTaGGtjsvpQlus17a2P9C5YG3cJmikaw02+qSK82IwT4ub8xtXRjUSQ
 PoMu6FdIHchH2S43+ouYHHldMkPZ3ZuLdX8iGyDytMP+qDv1X9lbba9/3
 KCgM0JkcWpmXdH+AxlBoWS1AxdIsqa423epq6WmIfnPfKmm7hrTG3IW4e
 IIfy3M/jXPqnxWk0+ARMJlutxpzNXZf3eQ+yePm/UWOkmiXgZVIes4sfr A==;
X-CSE-ConnectionGUID: rovnyT16TSuNru1zWQDsqQ==
X-CSE-MsgGUID: ASzIR95+ToS+xpqhn4hmUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2529528"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2529528"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:31 -0800
X-CSE-ConnectionGUID: lyLubBK/SqODOhGmAoqTZw==
X-CSE-MsgGUID: INzTVDzxTrmK3oxve6aquQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6649337"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v3 5/5] drm/xe/oa: Quiesce OA streams on driver unbind and PCI
 reset
Date: Tue,  3 Nov 2026 16:52:27 -0800
Message-ID: <20261104005221.3230003-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
References: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
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

- xe_oa_fini() is a devm action and runs after drm_dev_unplug() in
  xe_device_remove(). drm_dev_unplug() has zapped the OA buffer mmaps by
  then and refaults get a dummy page, so the OA buffer can be freed. Each
  vma holds a reference on the BO, which keeps the BO object alive until
  munmap. xe_oa_mmap() runs in a drm_dev_enter() section, which
  drm_dev_unplug() waits for, so no new mmap can reference the OA buffer
  once it is freed. stream_lock can't be used for that, since mmap runs
  under mmap_lock and read holds stream_lock across user copies.

- With an mmap still around, the OA buffer is no longer pinned when
  xe_bo_pinned_fini() DMA-unmaps the remaining kernel BOs, and
  xe_bo_pci_dev_remove_all() ran while it was still pinned. Drop its DMA
  mapping in quiesce while it is still pinned, so it doesn't outlive the
  device.

- Unbind does not reset the GT or the device, so cleanup HW state as
  well in this case. In the wedged case, HW state cleanup is not
  attempted. For a stream on an exec queue, the HW cleanup submits an LRI
  batch. Wait for it, bounded by the job timeout of the exec queue, since
  GuC submission and the fence irqs are torn down right after.

- drm_ioctl() only checks for unplug on entry, so an OA ioctl that
  started before drm_dev_unplug() could still open a stream, or access
  oa->xe and the metrics idr, around xe_oa_fini(). Run the OA ioctls in
  a drm_dev_enter() section, so drm_dev_unplug() waits for them.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Include Sashiko's comments
v3: Fix circular lockdep issue due to scope of stream->mmap_mutex
v4: Rely on drm_dev_unplug() to zap OA buffer mmaps and on the dummy page
    for refaults. Drop the OA specific fault handler, the per OA buffer
    mmap offset and mmap_mutex. Don't reject non-zero mmap offsets, that
    would change the uAPI. Split out the stream destroy refactor and the
    runtime PM move into separate patches. Wait for the LRI batch on
    quiesce, DMA-unmap the OA buffer on quiesce and run the OA ioctls in
    a drm_dev_enter() section instead of the per-GT quiesced flag
    (Sashiko).
---
 drivers/gpu/drm/xe/xe_oa.c          | 188 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  23 +++-
 3 files changed, 199 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7a151f338ae2..b4ba8874f17e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -43,6 +43,7 @@
 #include "xe_sriov.h"
 #include "xe_sync.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -260,13 +261,18 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 
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
 
@@ -318,6 +324,9 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	struct xe_oa_stream *stream =
 		container_of(hrtimer, typeof(*stream), poll_check_timer);
 
+	if (READ_ONCE(stream->dead))
+		return HRTIMER_NORESTART;
+
 	if (xe_oa_buffer_check_unlocked(stream))
 		wake_up(&stream->poll_wq);
 
@@ -529,12 +538,19 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 
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
@@ -563,6 +579,9 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	size_t offset = 0;
 	int ret;
 
+	if (READ_ONCE(stream->dead))
+		return -ENODEV;
+
 	if (!stream->sample)
 		return -EINVAL;
 
@@ -573,13 +592,14 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
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
 
@@ -606,6 +626,9 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 
 	poll_wait(file, &stream->poll_wq, wait);
 
+	if (stream->dead)
+		return EPOLLERR | EPOLLHUP;
+
 	/*
 	 * We don't explicitly check whether there's something to read here since this
 	 * path may be hot depending on what else userspace is polling, or on the timeout
@@ -752,6 +775,20 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 		goto free_bb;
 	}
 	xe_bb_free(bb, fence);
+
+	/*
+	 * When quiescing the stream, GuC submission and the fence irqs are torn down right
+	 * after, so wait for the batch. It may be queued behind other jobs of the exec queue,
+	 * which complete or get reset within the job timeout.
+	 */
+	if (READ_ONCE(stream->dead)) {
+		struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
+		long timeout = msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
+
+		if (!dma_fence_wait_timeout(fence, false, timeout))
+			drm_err(&stream->oa->xe->drm,
+				"Timed out waiting for OA LRI batch on quiesce\n");
+	}
 	dma_fence_put(fence);
 
 	return 0;
@@ -1659,6 +1696,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
 {
+	if (stream->dead)
+		return -ENODEV;
+
 	switch (cmd) {
 	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
 		return xe_oa_enable_locked(stream);
@@ -1691,6 +1731,12 @@ static long xe_oa_ioctl(struct file *file,
 
 static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
+	if (stream->dead) {
+		mutex_destroy(&stream->stream_lock);
+		kfree(stream);
+		return;
+	}
+
 	xe_pm_runtime_get(gt_to_xe(stream->gt));
 
 	if (stream->enabled)
@@ -1724,18 +1770,36 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct xe_oa_stream *stream = file->private_data;
+	struct xe_device *xe = gt_to_xe(stream->gt);
 	int ret = xe_observation_paranoid_check();
-	struct xe_bo *bo = stream->oa_buffer.bo;
+	struct xe_bo *bo;
+	int idx;
 
 	if (ret) {
-		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
+		drm_dbg(&xe->drm, "Insufficient privilege to map OA buffer\n");
 		return ret;
 	}
 
+	/*
+	 * xe_oa_quiesce() frees the OA buffer only after drm_dev_unplug(), which waits for
+	 * this section to finish. Can't use stream_lock here, it is held across user copies
+	 * which fault on mmap_lock, held by the caller.
+	 */
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (READ_ONCE(stream->dead)) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	bo = stream->oa_buffer.bo;
+
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
 	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
-		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
-		return -EINVAL;
+		drm_dbg(&xe->drm, "Wrong mmap size, must be OA buffer size\n");
+		ret = -EINVAL;
+		goto exit;
 	}
 
 	/*
@@ -1743,13 +1807,17 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	 * VM_MAYSHARE, don't copy the vma on fork
 	 */
 	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
-		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
-		return -EINVAL;
+		drm_dbg(&xe->drm, "mmap must be read only\n");
+		ret = -EINVAL;
+		goto exit;
 	}
 	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
 		     VM_MAYWRITE | VM_MAYEXEC);
 
-	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+	ret = drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+exit:
+	drm_dev_exit(idx);
+	return ret;
 }
 
 static const struct file_operations xe_oa_fops = {
@@ -2575,6 +2643,92 @@ static void xe_oa_unregister(void *arg)
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
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+	WRITE_ONCE(stream->dead, true);
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
+	if (stream->sample)
+		hrtimer_cancel(&stream->poll_check_timer);
+
+	wake_up_all(&stream->poll_wq);
+
+	/*
+	 * Restore the HW state while the stream still holds its runtime PM ref and exec_q.
+	 * The device is not reset on unbind, so this can't be left to a later reset.
+	 */
+	if (hw_accessible)
+		xe_oa_stream_hw_teardown(stream);
+
+	/*
+	 * drm_dev_unplug() has already zapped the userspace mappings of the OA buffer and
+	 * refaults get a dummy page, so the OA buffer can go. Each vma holds a reference on
+	 * the BO, keeping the BO object itself alive until munmap. The BO is then no longer
+	 * pinned when xe_bo_pinned_fini() DMA-unmaps the other kernel BOs, so drop its DMA
+	 * mapping here, while it is still pinned.
+	 */
+	xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
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
+ * and releases all device-bound resources (OA buffer, exec queues, configs, references).
+ * Unless the device is wedged, the HW state (whitelist, metric set, forcewake, preemption)
+ * is restored first. Any further read, poll, mmap or ioctl on the stream fd is rejected
+ * (-ENODEV). Only the stream struct stays allocated until userspace closes the fd, at
+ * which point xe_oa_release() just frees it.
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
@@ -2886,6 +3040,14 @@ static void xe_oa_fini(void *arg)
 	if (!oa->xe)
 		return;
 
+	/*
+	 * Devm action, so this runs on unbind and PCI slot reset after xe_device_remove() even
+	 * if streams are still open. Quiesce them before the configs they hold are destroyed.
+	 * Must run after drm_dev_unplug(), which zaps the OA buffer mmaps and fences off mmap
+	 * and the OA ioctls.
+	 */
+	xe_oa_quiesce(xe);
+
 	idr_for_each(&oa->metrics_idr, destroy_config, oa);
 	idr_destroy(&oa->metrics_idr);
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index e876e9be92ba..e60a90bae1c6 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -214,6 +214,9 @@ struct xe_oa_stream {
 	/** @enabled: Whether the stream is currently enabled */
 	bool enabled;
 
+	/** @dead: Gate HW access when device is wedged or going away */
+	bool dead;
+
 	/** @oa_config: OA configuration used by the stream */
 	struct xe_oa_config *oa_config;
 
diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index 39e05b9131a7..a3a8ac358c81 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -7,6 +7,7 @@
 #include <linux/perf_event.h>
 #include <linux/sysctl.h>
 
+#include <drm/drm_drv.h>
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_eu_stall.h"
@@ -35,8 +36,8 @@ int xe_observation_paranoid_check(void)
 	return perf_allow_cpu();
 }
 
-static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
-		       struct drm_file *file)
+static int __xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
+			 struct drm_file *file)
 {
 	switch (arg->observation_op) {
 	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
@@ -50,6 +51,24 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
 	}
 }
 
+static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
+		       struct drm_file *file)
+{
+	int idx, ret;
+
+	/*
+	 * drm_ioctl() only checks for unplug on entry. Hold off drm_dev_unplug() while the OA
+	 * ioctls run, so that xe_oa_fini() can't tear down OA under them.
+	 */
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
+
+	ret = __xe_oa_ioctl(dev, arg, file);
+
+	drm_dev_exit(idx);
+	return ret;
+}
+
 static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
 			     struct drm_file *file)
 {
-- 
2.55.0

