Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A378606A686
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KVnSlIAF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA4D10E83E;
	Sat, 21 Nov 2026 02:02:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D768B10E925
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795226531; x=1826762531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0rUiAxTgoarxg3/e+fWrxvXsUyrKmCFgdSTGJk3EbAM=;
 b=KVnSlIAFFpX7TX1dvwSGBvq1nnFxROCB5B8WN2s9l+W43zBDBzlB/fcE
 Se2L83ZIEL2ZJgcAbpawXYq/+LeSK4Zbb4TiRve8Gn08VKkazuxqIl3oE
 aw19/xgt4jrh8srrnkvAu5rg37SOz8tPFHrdhszyJ9UBPVoqTD+9UpIUv
 1Nub+FPWzyPNIBz5ZVttakXnqmqM7IPVJMGIYhZOktQdzEjNp5x+VXSRC
 z4sAdxviFjfGVw9G0+TfrqaQdNeHOgN1U2zNfTGyEI+m6QcIhIL1M6j32
 1WUoxtc/lZdK5NtUOIeg/x5KwkSoxTZymNspyAcWQkXDVN1bFRZJOedb9 A==;
X-CSE-ConnectionGUID: olW0bEWRTRuzJ9APtMmVew==
X-CSE-MsgGUID: HlfVIF4OQJWvZfCuXG/nhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4118799"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4118799"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:55 -0800
X-CSE-ConnectionGUID: Brv5d17GTHGglzmcr83ejg==
X-CSE-MsgGUID: AkW6eOSzSg2My89tVQqzPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="11182132"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:54 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v9 7/7] drm/xe/oa: Quiesce OA streams on driver unbind and PCI
 reset
Date: Fri, 20 Nov 2026 18:01:53 -0800
Message-ID: <20261121020145.147384-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
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

Destroy a stream the same way whether its fd is closed or the device
goes away: xe_oa_destroy_locked() marks the stream dead, disables it,
restores the HW state and releases everything but the OA buffer and the
stream struct, whether or not the HW still responds. xe_oa_fini() calls
xe_oa_quiesce() to destroy the streams of a removed device, and
xe_oa_release() skips the destroy of such a dead stream. Only the
stream struct, with stream_lock and poll_wq valid, and the pinned OA
buffer stay allocated until the fd is closed or the process owning the
fd exits. The quiesce drops the DMA mapping of the OA buffer, which
stays pinned past xe_bo_pinned_fini(). On a wedged device, pending OA
batches aren't waited for, nothing in the ring runs anymore.

The quiesce needs no runtime PM reference of its own: xe_oa_fini() runs
after xe_pm_fini(), which keeps the device resumed with runtime suspend
forbidden. xe_oa_release() doesn't take one for a stream destroyed by
the quiesce either, so that it doesn't wake a removed device.

Once dead, OA interfaces return -ENODEV, poll reports EPOLLERR |
EPOLLHUP, and xe_oa_release() frees the stream struct and the OA
buffer, and drops the drm device reference.

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
v7: Return -ENODEV rather than -ECANCELED from stream fd ioctls once the
    device is unplugged, also when it is wedged. Fail the synchronous OA
    config wait when it is cut short. DMA-unmap the OA buffer on quiesce,
    as xe_bo_pinned_fini() can race with its release. Fix the
    xe_oa_quiesce() comment (Sashiko).
v8: Destroy a stream the same way on close and on quiesce, whether or
    not the device is wedged or still responds, all HW waits are
    bounded. This also restores preemption and the context state on
    quiesce. Drop the release time drm_dev_enter() section, gt_lock
    already serializes release against the quiesce. Replace the stream
    destroy split with a patch that only moves freeing the OA buffer and
    the stream to the callers. Split out the ioctl and mmap
    unplug/wedged fencing and the synchronous config wait into a
    separate patch. Drop the runtime PM move, xe_oa_release() keeps the
    runtime PM reference across freeing the OA buffer, so that unpinning
    it can't race with the pinned BO eviction of a D3cold runtime
    suspend (Sashiko).
v9: DMA-unmap the OA buffer on quiesce only, not on every stream destroy,
    so that a pinned OA buffer is never left without its DMA mapping
    across a suspend/resume. Don't wait for OA batches on a wedged
    device. Drain the OA batches in the stream init error path too
    (Sashiko).
---
 drivers/gpu/drm/xe/xe_oa.c       | 132 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 2 files changed, 125 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 9c4c4548c4a0..ea08acbac326 100644
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
 
@@ -328,6 +333,9 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	struct xe_oa_stream *stream =
 		container_of(hrtimer, typeof(*stream), poll_check_timer);
 
+	if (READ_ONCE(stream->dead))
+		return HRTIMER_NORESTART;
+
 	if (xe_oa_buffer_check_unlocked(stream))
 		wake_up(&stream->poll_wq);
 
@@ -539,12 +547,19 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 
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
@@ -573,6 +588,9 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	size_t offset = 0;
 	int ret;
 
+	if (READ_ONCE(stream->dead))
+		return -ENODEV;
+
 	if (!stream->sample)
 		return -EINVAL;
 
@@ -583,13 +601,14 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
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
 
@@ -616,6 +635,9 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 
 	poll_wait(file, &stream->poll_wq, wait);
 
+	if (stream->dead)
+		return EPOLLERR | EPOLLHUP;
+
 	/*
 	 * We don't explicitly check whether there's something to read here since this
 	 * path may be hot depending on what else userspace is polling, or on the timeout
@@ -865,7 +887,9 @@ static void xe_oa_stream_drain(struct xe_oa_stream *stream)
 	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
 	long timeout;
 
-	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
+	/* Nothing in the ring runs anymore on a wedged device */
+	if (xe_wedged(stream->oa->xe) || !stream->last_fence ||
+	    dma_fence_is_signaled(stream->last_fence))
 		return;
 
 	/*
@@ -1715,6 +1739,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
 {
+	if (stream->dead)
+		return -ENODEV;
+
 	switch (cmd) {
 	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
 		return xe_oa_enable_locked(stream);
@@ -1754,33 +1781,67 @@ static long xe_oa_ioctl(struct file *file,
 	return ret;
 }
 
+/*
+ * Disable the stream, restore the HW state and release everything but the OA buffer and the
+ * stream struct, the same whether the stream fd is closed or the device goes away, and
+ * whether or not the HW still responds: all HW waits are bounded. Afterwards the stream is
+ * dead and any further read, poll, mmap or ioctl on the stream fd fails with -ENODEV.
+ */
 static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
+	unsigned long flags;
+
+	mutex_lock(&stream->stream_lock);
+
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+	WRITE_ONCE(stream->dead, true);
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
 	if (stream->enabled)
 		xe_oa_disable_locked(stream);
 
+	wake_up_all(&stream->poll_wq);
+
 	xe_oa_stream_destroy(stream);
 
 	if (stream->exec_q)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
+	mutex_unlock(&stream->stream_lock);
 }
 
 static int xe_oa_release(struct inode *inode, struct file *file)
 {
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
+	/*
+	 * Don't wake a removed device for a stream xe_oa_fini() destroyed. If xe_oa_fini()
+	 * marks the stream dead only after this, the device is still bound while it does.
+	 */
+	bool rpm = !READ_ONCE(stream->dead);
 
-	xe_pm_runtime_get(gt_to_xe(gt));
+	if (rpm)
+		xe_pm_runtime_get(gt_to_xe(gt));
+	/* gt_lock serializes against xe_oa_fini(), which destroys the stream on device removal */
 	mutex_lock(&gt->oa.gt_lock);
-	xe_oa_destroy_locked(stream);
+	if (!stream->dead)
+		xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
 
 	xe_oa_free_oa_buffer(stream);
 	mutex_destroy(&stream->stream_lock);
 	kfree(stream);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	if (rpm)
+		xe_pm_runtime_put(gt_to_xe(gt));
+
+	/*
+	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue. Once the device
+	 * is unplugged, this may be the last reference on the drm device, so let the destroy
+	 * finish before drm_dev_put() releases the GGTT.
+	 */
+	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
+		flush_workqueue(gt_to_xe(gt)->ttm.wq);
 
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
@@ -1809,6 +1870,11 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
+	if (READ_ONCE(stream->dead)) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	/*
 	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
 	 * buffer's own range in the drm device's address_space below
@@ -1957,6 +2023,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	return 0;
 
 err_put_k_exec_q:
+	xe_oa_stream_drain(stream);
 	xe_oa_disable_metric_set(stream);
 	xe_exec_queue_put(stream->k_exec_q);
 err_free_oa_buf:
@@ -2673,6 +2740,49 @@ static void xe_oa_unregister(void *arg)
 	oa->metrics_kobj = NULL;
 }
 
+static void xe_oa_quiesce_gt(struct xe_gt *gt)
+{
+	int i;
+
+	mutex_lock(&gt->oa.gt_lock);
+	for (i = 0; i < gt->oa.num_oa_units; i++) {
+		struct xe_oa_stream *stream = gt->oa.oa_unit[i].exclusive_stream;
+
+		if (!stream)
+			continue;
+
+		xe_oa_destroy_locked(stream);
+
+		/*
+		 * The OA buffer stays pinned until the stream fd is released, an mmap may still
+		 * hold a reference on it. Drop its DMA mapping now: the fd may be released, and
+		 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the BO lock.
+		 */
+		xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
+	}
+	mutex_unlock(&gt->oa.gt_lock);
+}
+
+/**
+ * xe_oa_quiesce - Disable all active OA streams on driver unbind or PCI slot reset
+ * @xe: @xe_device
+ *
+ * Destroys every active stream like closing its fd would, see xe_oa_destroy_locked().
+ * Only the stream struct and the pinned OA buffer stay allocated until userspace closes
+ * the fd, at which point xe_oa_release() frees them.
+ */
+static void xe_oa_quiesce(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	if (!xe->oa.xe)
+		return;
+
+	for_each_gt(gt, xe, id)
+		xe_oa_quiesce_gt(gt);
+}
+
 /**
  * xe_oa_register - Xe OA registration
  * @xe: @xe_device
@@ -2984,6 +3094,8 @@ static void xe_oa_fini(void *arg)
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
 
-- 
2.55.0

