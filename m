Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA8606A891
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9brjPaW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13A10E498;
	Mon, 16 Nov 2026 22:30:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA2410E7EB
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 22:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794868216; x=1826404216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpFXW8YXnNFAllL9ukcT2WSBLwN0S/kv+wDyJ4ZUQII=;
 b=b9brjPaWKTT9LXqw2oJ35/RgZpxcNlRJ4uOMeZjO0V4iWM4XPmX1EuZR
 P+PF6Tjh+3eCVXVMbeTXg3elzECtnhlLVLY+eYqBo2px+DLq3eSa7hNIG
 3AipxpBZePrbLiCMb5nm27MAEumsHh2ZbT0oPqv70HpjxSoT/uLypIWma
 SZAdM21TQih7V7haLSxZjbKahKvvd9ywAKxQ1zh6G+2zFCvYf1CH+bsb1
 hTCjRAIWADiCN76rEcrj9xAxsL3HlyzbuZY/dWAPg07J70d/OxtghTeEK
 QfYsrgwM6IX/5QUCxXVOw2rNegBHJKE1CmUjolXItJ+nig4pXjXEklvO7 g==;
X-CSE-ConnectionGUID: OrYErH/eRwe9ff1V/ICUcA==
X-CSE-MsgGUID: dUTuORdFRguC9ANJ2jazog==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3699708"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3699708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:28:06 -0800
X-CSE-ConnectionGUID: A7T/ZfBMRXGD/xLjMb1qYQ==
X-CSE-MsgGUID: CBE3cvvURTORvNafNFnM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9705063"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:28:05 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: shekhar.chauhan@intel.com, harish.chegondi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v6 7/7] drm/xe/oa: Quiesce OA streams on driver unbind and PCI
 reset
Date: Mon, 16 Nov 2026 14:28:00 -0800
Message-ID: <20261116222752.3677159-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
References: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Include Sashiko's comments
v3: Fix circular lockdep issue due to scope of stream->mmap_mutex
v4: Rely on drm_dev_unplug() to zap OA buffer mmaps and on the dummy page
    for refaults. Drop the OA specific fault handler and mmap_mutex. Split
    out the stream destroy refactor and the runtime PM move into separate
    patches. DMA-unmap the OA buffer on quiesce and run the OA ioctls in a
    drm_dev_enter() section instead of the per-GT quiesced flag. Don't
    restore the context state on quiesce, wait for pending OA batches on
    quiesce, don't block unplug on a synchronous OA config wait and
    quiesce a stream released during removal (Sashiko).
v5: Keep the OA buffer pinned until the stream fd is released instead of
    DMA-unmapping it on quiesce, so the shrinker can't drop the last
    reference after the device is gone (Sashiko).
v6: Run the stream fd ioctls in a drm_dev_enter() section and reject them
    on a wedged device. Stop the synchronous OA config wait on a wedged
    device too. Flush the TTM workqueue before dropping the drm device
    reference on release of an unplugged device (Sashiko).
---
 drivers/gpu/drm/xe/xe_oa.c          | 225 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_oa_types.h    |   3 +
 drivers/gpu/drm/xe/xe_observation.c |  20 ++-
 3 files changed, 224 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 1a37312de099..551f5a063163 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -261,13 +261,18 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 
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
 
@@ -319,6 +324,9 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	struct xe_oa_stream *stream =
 		container_of(hrtimer, typeof(*stream), poll_check_timer);
 
+	if (READ_ONCE(stream->dead))
+		return HRTIMER_NORESTART;
+
 	if (xe_oa_buffer_check_unlocked(stream))
 		wake_up(&stream->poll_wq);
 
@@ -530,12 +538,19 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 
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
@@ -564,6 +579,9 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	size_t offset = 0;
 	int ret;
 
+	if (READ_ONCE(stream->dead))
+		return -ENODEV;
+
 	if (!stream->sample)
 		return -EINVAL;
 
@@ -574,13 +592,14 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
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
 
@@ -607,6 +626,9 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 
 	poll_wait(file, &stream->poll_wq, wait);
 
+	if (stream->dead)
+		return EPOLLERR | EPOLLHUP;
+
 	/*
 	 * We don't explicitly check whether there's something to read here since this
 	 * path may be hot depending on what else userspace is polling, or on the timeout
@@ -863,8 +885,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
 			oag_configure_mmio_trigger(stream, false));
 
-	/* disable the context save/restore or OAR counters */
-	if (stream->exec_q)
+	if (stream->exec_q && !READ_ONCE(stream->dead))
 		xe_oa_configure_oa_context(stream, false);
 
 	/* Make sure we disable noa to save power. */
@@ -1134,9 +1155,15 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	if (err == -ENOENT)
 		xe_oa_config_cb(fence, &ofence->cb);
 
-	/* If nothing needs to be signaled we wait synchronously */
+	/*
+	 * If nothing needs to be signaled we wait synchronously unless the device
+	 * is unplugged/wedged.
+	 */
 	if (!num_signal) {
-		dma_fence_wait(&ofence->base, false);
+		while (!dma_fence_wait_timeout(&ofence->base, false, HZ / 10))
+			if (drm_dev_is_unplugged(&gt_to_xe(stream->gt)->drm) ||
+			    xe_wedged(gt_to_xe(stream->gt)))
+				break;
 		dma_fence_put(&ofence->base);
 	}
 
@@ -1627,7 +1654,7 @@ static int xe_oa_disable_locked(struct xe_oa_stream *stream)
 
 	xe_oa_stream_disable(stream);
 
-	if (stream->no_preempt)
+	if (stream->no_preempt && !READ_ONCE(stream->dead))
 		ret = xe_oa_enable_preempt_timeslice(stream);
 
 	stream->enabled = false;
@@ -1710,6 +1737,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
 {
+	if (stream->dead)
+		return -ENODEV;
+
 	switch (cmd) {
 	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
 		return xe_oa_enable_locked(stream);
@@ -1731,17 +1761,34 @@ static long xe_oa_ioctl(struct file *file,
 			unsigned long arg)
 {
 	struct xe_oa_stream *stream = file->private_data;
+	struct xe_device *xe = gt_to_xe(stream->gt);
 	long ret;
+	int idx;
+
+	if (xe_wedged(xe))
+		return -ECANCELED;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
 
 	mutex_lock(&stream->stream_lock);
 	ret = xe_oa_ioctl_locked(stream, cmd, arg);
 	mutex_unlock(&stream->stream_lock);
 
+	drm_dev_exit(idx);
+
 	return ret;
 }
 
 static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
+	if (stream->dead) {
+		xe_oa_free_oa_buffer(stream);
+		mutex_destroy(&stream->stream_lock);
+		kfree(stream);
+		return;
+	}
+
 	xe_pm_runtime_get(gt_to_xe(stream->gt));
 
 	/* A wedged device may be unresponsive, skip HW access */
@@ -1758,17 +1805,37 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 	kfree(stream);
 }
 
+static void xe_oa_quiesce_oa_unit(struct xe_oa_unit *u, bool hw_accessible);
+
 static int xe_oa_release(struct inode *inode, struct file *file)
 {
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	int idx;
 
 	mutex_lock(&gt->oa.gt_lock);
-	xe_oa_destroy_locked(stream);
+	if (drm_dev_enter(&xe->drm, &idx)) {
+		xe_oa_destroy_locked(stream);
+		drm_dev_exit(idx);
+	} else {
+		if (!stream->dead)
+			xe_oa_quiesce_oa_unit(stream->oa_unit, !xe_wedged(xe));
+
+		xe_oa_destroy_locked(stream);
+	}
 	mutex_unlock(&gt->oa.gt_lock);
 
+	/*
+	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue. Once the device
+	 * is unplugged, this may be the last reference on the drm device, so let the destroy
+	 * finish before drm_dev_put() releases the GGTT.
+	 */
+	if (drm_dev_is_unplugged(&xe->drm))
+		flush_workqueue(xe->ttm.wq);
+
 	/* Release the reference the OA stream kept on the driver */
-	drm_dev_put(&gt_to_xe(gt)->drm);
+	drm_dev_put(&xe->drm);
 
 	return 0;
 }
@@ -1776,27 +1843,46 @@ static int xe_oa_release(struct inode *inode, struct file *file)
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
+	 * drm_dev_unplug() zaps the OA buffer mmaps and waits for this section to finish, so
+	 * no mmap of the OA buffer can be set up after that. Can't use stream_lock here, it is
+	 * held across user copies which fault on mmap_lock, held by the caller.
+	 */
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (READ_ONCE(stream->dead)) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	/*
 	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
 	 * buffer's own range in the drm device's address_space below
 	 */
 	if (vma->vm_pgoff) {
-		drm_dbg(&stream->oa->xe->drm, "Wrong mmap offset, must be 0\n");
-		return -EINVAL;
+		drm_dbg(&xe->drm, "Wrong mmap offset, must be 0\n");
+		ret = -EINVAL;
+		goto exit;
 	}
 
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
@@ -1804,15 +1890,19 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
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
 
 	vma->vm_pgoff = drm_vma_node_start(&bo->ttm.base.vma_node);
 
-	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+	ret = drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+exit:
+	drm_dev_exit(idx);
+	return ret;
 }
 
 static const struct file_operations xe_oa_fops = {
@@ -2638,6 +2728,95 @@ static void xe_oa_unregister(void *arg)
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
+
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+	WRITE_ONCE(stream->dead, true);
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
+	if (stream->enabled && hw_accessible)
+		xe_oa_disable_locked(stream);
+
+	stream->enabled = false;
+
+	if (stream->sample)
+		hrtimer_cancel(&stream->poll_check_timer);
+
+	wake_up_all(&stream->poll_wq);
+
+	xe_oa_stream_drain(stream);
+
+	/*
+	 * Restore the HW state while the stream still holds its runtime PM ref and exec_q.
+	 * The device is not reset on unbind, so this can't be left to a later reset.
+	 */
+	if (hw_accessible)
+		xe_oa_stream_hw_teardown(stream);
+
+	/*
+	 * Keep the OA buffer pinned until xe_oa_release(). An mmap holds a reference on the
+	 * BO, so unpinning it here leaves it on the TTM LRU, where the shrinker may take the
+	 * last reference and free the BO after the GGTT and the shrinker itself are gone.
+	 * While pinned, the shrinker doesn't see the BO and xe_bo_pinned_fini() DMA-unmaps
+	 * it like any other kernel BO. drm_dev_unplug() has zapped the userspace mappings
+	 * and refaults get a dummy page.
+	 */
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
@@ -2949,6 +3128,8 @@ static void xe_oa_fini(void *arg)
 	if (!oa->xe)
 		return;
 
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
index 39e05b9131a7..9e23ade51dc1 100644
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
@@ -50,6 +51,21 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
 	}
 }
 
+static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
+		       struct drm_file *file)
+{
+	int idx, ret;
+
+	/* Hold off drm_dev_unplug() while the OA ioctls run */
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

