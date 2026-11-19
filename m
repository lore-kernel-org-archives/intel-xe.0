Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199F606A330
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E/Ls16Zg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934801120EE;
	Thu, 19 Nov 2026 00:29:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C159F1120EE
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795048157; x=1826584157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zIaL1wEDaSOSbikTOwSPEMTNTfmyIQOM2udPGc3yCMk=;
 b=E/Ls16ZgYu/iQjPAsV2lqt0dGGjxxUmC06RJIHtp6rw8HfghxcgqRtaE
 aewTt2mlSu6JmtFnrzqEGIjrM687YGgSP7p5DOePWwhMP1hHdgkwXyEBY
 sK/hBZvEv9ofp74j9gobuZnXbYdS79YflkVWIJowswUlCfhvgBECKAHee
 vTOM75Fqy6XOGK1ixtQqXQyFAH44nZAITRE5vdkt4nPPskiI7tsTJlWb/
 m1I3pxGC6qnmVXKrfb9bIlVXY7IqwebAhng/ub4ZqoF43PLGx+NRnSpVM
 oQ5UFZ3IJShzBorBc1F6R20obfFM9+iXhSSffIOXLwwOfXsPpTQGUnM3N Q==;
X-CSE-ConnectionGUID: nUYOXFYEROKa0soKzpMqyg==
X-CSE-MsgGUID: /v4AYPV0R7aGJpkrxDQdtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3876669"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3876669"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
X-CSE-ConnectionGUID: NA6UNuenSa+o+6nsMysXZQ==
X-CSE-MsgGUID: rjxDF0uHSOW0xAg8DYILVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10081567"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v8 8/8] drm/xe/oa: Quiesce OA streams on driver unbind and PCI
 reset
Date: Wed, 18 Nov 2026 16:27:46 -0800
Message-ID: <20261119002737.3899877-18-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
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
fd exits.

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
    separate patch.
---
 drivers/gpu/drm/xe/xe_oa.c       | 110 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 2 files changed, 106 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 223419347eb7..0b51bc818ef4 100644
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
@@ -937,6 +959,13 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	xe_oa_disable_metric_set(stream);
 	xe_exec_queue_put(stream->k_exec_q);
 
+	/*
+	 * The OA buffer is freed on release of the stream fd, an mmap may still hold a
+	 * reference on it. Drop its DMA mapping now, while pinned: the fd may be released, and
+	 * the BO unpinned, while xe_bo_pinned_fini() DMA-unmaps it without the BO lock.
+	 */
+	xe_bo_dma_unmap_pinned(stream->oa_buffer.bo);
+
 	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
 	xe_pm_runtime_put(stream->oa->xe);
 
@@ -1715,6 +1744,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
 {
+	if (stream->dead)
+		return -ENODEV;
+
 	switch (cmd) {
 	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
 		return xe_oa_enable_locked(stream);
@@ -1754,19 +1786,35 @@ static long xe_oa_ioctl(struct file *file,
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
 	xe_pm_runtime_get(gt_to_xe(stream->gt));
+	mutex_lock(&stream->stream_lock);
+
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+	WRITE_ONCE(stream->dead, true);
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
 	if (stream->enabled)
 		xe_oa_disable_locked(stream);
 
+	wake_up_all(&stream->poll_wq);
+
 	xe_oa_stream_destroy(stream);
 
 	if (stream->exec_q)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
+	mutex_unlock(&stream->stream_lock);
 	xe_pm_runtime_put(gt_to_xe(stream->gt));
 }
 
@@ -1775,14 +1823,24 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
+	/* gt_lock serializes against xe_oa_fini(), which destroys the stream on device removal */
 	mutex_lock(&gt->oa.gt_lock);
-	xe_oa_destroy_locked(stream);
+	if (!stream->dead)
+		xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
 
 	xe_oa_free_oa_buffer(stream);
 	mutex_destroy(&stream->stream_lock);
 	kfree(stream);
 
+	/*
+	 * Freeing the OA buffer may defer the BO destroy to the TTM workqueue. Once the device
+	 * is unplugged, this may be the last reference on the drm device, so let the destroy
+	 * finish before drm_dev_put() releases the GGTT.
+	 */
+	if (drm_dev_is_unplugged(&gt_to_xe(gt)->drm))
+		flush_workqueue(gt_to_xe(gt)->ttm.wq);
+
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
 
@@ -1810,6 +1868,11 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
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
@@ -2674,6 +2737,37 @@ static void xe_oa_unregister(void *arg)
 	oa->metrics_kobj = NULL;
 }
 
+static void xe_oa_quiesce_gt(struct xe_gt *gt)
+{
+	int i;
+
+	mutex_lock(&gt->oa.gt_lock);
+	for (i = 0; i < gt->oa.num_oa_units; i++)
+		if (gt->oa.oa_unit[i].exclusive_stream)
+			xe_oa_destroy_locked(gt->oa.oa_unit[i].exclusive_stream);
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
@@ -2985,6 +3079,8 @@ static void xe_oa_fini(void *arg)
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

