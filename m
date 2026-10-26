Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78224606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 23:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XvXjo+ex
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDD710F1D1;
	Mon, 26 Oct 2026 23:26:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0092810F1D1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793057182; x=1824593182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xsjKLG/NOjdBvciZoLrvcprdlAWG8fKk0des4/rz0/4=;
 b=XvXjo+exRMTBK/qfMh0jfkGjgo/va1DIfFPCyMpDHlOpyWQ1T+sD9Sx5
 F7aL17/ZAk0zYM7DZP366s4pEOtrUNlmPXAZAqHHiocPaOedD7zQVH6fT
 tnIgf/m8XvIOT1/pMoPTl77Q/fgY72CbjhdzsX+gHMdpmEXBPkD74u7fO
 j0rZz5ljjo2OCpuJcxsC3C6cLYuQUjA7ARF1RL/0MfJ72BXTwRZVPHu6H
 cJpT5r+OoLTL2vnlAJIFinKte3q+u8e4/BDVAYtyTRBsDUtAKb8J0ZTnS
 oPjw8gy618zu4wWBCRWfYxtOSWf8Jy8IL8K1AwCjlCzkzgNymUvMzY9+N A==;
X-CSE-ConnectionGUID: YYYGdyrSSL6td8/7D1h7xw==
X-CSE-MsgGUID: V056jT+1SJqoCiTa7FyZDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1753594"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1753594"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 16:26:21 -0700
X-CSE-ConnectionGUID: Defz/Vk7TYqQgbbHs0rfUg==
X-CSE-MsgGUID: 6FPd/HE9TGGwyHmfVF9FXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4404023"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 16:26:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: riana.tauro@intel.com,
	harish.chegondi@intel.com
Subject: [PATCH] drm/xe/oa: Quiesce OA streams on device remove and PCI reset
Date: Mon, 26 Oct 2026 16:26:12 -0700
Message-ID: <20261026232611.1587501-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An OA stream fd can outlive the device: after a PCI slot reset (which
removes and re-probes the device) or after unbind. The poll hrtimer and
userspace calls on the fd could then access MMIO and other device-bound
objects that were released on remove, causing a NULL pointer dereference,
and xe_oa_release() would tear down against freed objects.

Add xe_oa_quiesce(), called from xe_device_remove() (which is also reached
from xe_pci_error_slot_reset() via the driver remove callback). For each
active stream it disables the OA unit, cancels the poll hrtimer, marks the
stream dead, shoots down userspace mappings of the OA buffer and releases
all device-bound resources (OA buffer, exec queues, configs, references)
without touching HW. Only the stream struct stays allocated, with
stream_lock and poll_wq valid, until the fd is closed.

Once dead, the hrtimer stops, read/mmap/ioctl return -ENODEV, poll reports
EPOLLERR | EPOLLHUP, and xe_oa_release() only frees the struct and drops
the drm device reference.

The OA buffer check tests the dead flag under ptr_lock and mmap takes
stream_lock so neither races with the buffer being freed.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   |   2 +
 drivers/gpu/drm/xe/xe_oa.c       | 187 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_oa.h       |   1 +
 drivers/gpu/drm/xe/xe_oa_types.h |   6 +
 4 files changed, 168 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a07655b4c7a9..3b9fdb20a937 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1106,6 +1106,8 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_oa_quiesce(xe);
+
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 42a95ec733d3..a85bff2faa35 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -259,13 +259,18 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 
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
 
@@ -317,6 +322,9 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	struct xe_oa_stream *stream =
 		container_of(hrtimer, typeof(*stream), poll_check_timer);
 
+	if (READ_ONCE(stream->dead))
+		return HRTIMER_NORESTART;
+
 	if (xe_oa_buffer_check_unlocked(stream))
 		wake_up(&stream->poll_wq);
 
@@ -528,12 +536,19 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 
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
@@ -562,6 +577,9 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 	size_t offset = 0;
 	int ret;
 
+	if (READ_ONCE(stream->dead))
+		return -ENODEV;
+
 	if (!stream->sample)
 		return -EINVAL;
 
@@ -572,13 +590,14 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
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
 
@@ -605,6 +624,9 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 
 	poll_wait(file, &stream->poll_wq, wait);
 
+	if (stream->dead)
+		return EPOLLERR | EPOLLHUP;
+
 	/*
 	 * We don't explicitly check whether there's something to read here since this
 	 * path may be hot depending on what else userspace is polling, or on the timeout
@@ -874,33 +896,42 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
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
+
+	xe_oa_stream_hw_teardown(stream);
+	xe_oa_stream_free_resources(stream);
+}
+
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
 {
 	u32 vram = mert_wa_14026633728(stream) ?
@@ -1649,6 +1680,9 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
 {
+	if (stream->dead)
+		return -ENODEV;
+
 	switch (cmd) {
 	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
 		return xe_oa_enable_locked(stream);
@@ -1681,6 +1715,14 @@ static long xe_oa_ioctl(struct file *file,
 
 static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
+	if (stream->dead) {
+		mutex_destroy(&stream->stream_lock);
+		kfree(stream);
+		return;
+	}
+
+	xe_pm_runtime_get(gt_to_xe(stream->gt));
+
 	if (stream->enabled)
 		xe_oa_disable_locked(stream);
 
@@ -1690,6 +1732,7 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
+	xe_pm_runtime_put(gt_to_xe(stream->gt));
 	kfree(stream);
 }
 
@@ -1698,11 +1741,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
-	xe_pm_runtime_put(gt_to_xe(gt));
 
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
@@ -1710,16 +1751,14 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
+static int xe_oa_mmap_locked(struct xe_oa_stream *stream, struct file *file,
+			     struct vm_area_struct *vma)
 {
-	struct xe_oa_stream *stream = file->private_data;
-	int ret = xe_observation_paranoid_check();
 	struct xe_bo *bo = stream->oa_buffer.bo;
+	int ret;
 
-	if (ret) {
-		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
-		return ret;
-	}
+	if (stream->dead)
+		return -ENODEV;
 
 	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
 	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
@@ -1738,7 +1777,29 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
 	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
 		     VM_MAYWRITE | VM_MAYEXEC);
 
-	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+	ret = drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
+	if (!ret)
+		stream->mapping = file->f_mapping;
+
+	return ret;
+}
+
+static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct xe_oa_stream *stream = file->private_data;
+	int ret = xe_observation_paranoid_check();
+
+	if (ret) {
+		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
+		return ret;
+	}
+
+	/* Serialize against xe_oa_quiesce() freeing the OA buffer */
+	mutex_lock(&stream->stream_lock);
+	ret = xe_oa_mmap_locked(stream, file, vma);
+	mutex_unlock(&stream->stream_lock);
+
+	return ret;
 }
 
 static const struct file_operations xe_oa_fops = {
@@ -2548,6 +2609,76 @@ static void xe_oa_unregister(void *arg)
 	oa->metrics_kobj = NULL;
 }
 
+static void xe_oa_quiesce_oa_unit(struct xe_oa_unit *u)
+{
+	struct xe_oa_stream *stream = u->exclusive_stream;
+	unsigned long flags;
+
+	if (!stream)
+		return;
+
+	mutex_lock(&stream->stream_lock);
+	if (stream->enabled)
+		xe_oa_disable(stream);
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
+	if (stream->mapping)
+		unmap_mapping_range(stream->mapping, 0,
+				    xe_bo_size(stream->oa_buffer.bo), 1);
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
+static void xe_oa_quiesce_gt(struct xe_gt *gt)
+{
+	int i;
+
+	mutex_lock(&gt->oa.gt_lock);
+	for (i = 0; i < gt->oa.num_oa_units; i++)
+		xe_oa_quiesce_oa_unit(&gt->oa.oa_unit[i]);
+	mutex_unlock(&gt->oa.gt_lock);
+}
+
+/**
+ * xe_oa_quiesce - Disable all active OA streams ahead of a device reset
+ * @xe: @xe_device
+ *
+ * Disables the OA unit and stops the poll timer of every active stream, marks it dead
+ * and releases all device-bound resources (OA buffer and its userspace mappings, exec
+ * queues, configs, references). Any further read, poll, mmap or ioctl on the stream fd
+ * is rejected (-ENODEV). Only the stream struct stays allocated until userspace closes
+ * the fd, at which point xe_oa_release() just frees it.
+ */
+void xe_oa_quiesce(struct xe_device *xe)
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
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index e510826f9efc..f0221a308b2f 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -16,6 +16,7 @@ struct xe_hw_engine;
 
 int xe_oa_init(struct xe_device *xe);
 int xe_oa_register(struct xe_device *xe);
+void xe_oa_quiesce(struct xe_device *xe);
 int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
 int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index e876e9be92ba..173224a9f2e1 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -214,6 +214,12 @@ struct xe_oa_stream {
 	/** @enabled: Whether the stream is currently enabled */
 	bool enabled;
 
+	/** @dead: Gate HW access when device is wedged or going away */
+	bool dead;
+
+	/** @mapping: address space of the fd the OA buffer was mmapped through, if any */
+	struct address_space *mapping;
+
 	/** @oa_config: OA configuration used by the stream */
 	struct xe_oa_config *oa_config;
 
-- 
2.55.0

