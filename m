Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC98606A688
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQI1CPaC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA1F10E93C;
	Sat, 21 Nov 2026 02:02:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDCF10E93C
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795226525; x=1826762525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vLUYkv5AMwYM7emkTmX9hw0QzUEKDP2epO4sEACX9z8=;
 b=MQI1CPaCLiT/aEyG9gF9SmbCoir1gnQ0C0FJ5sKjb3Q/cknxLQQJ5cam
 FHJfTXatavL5MzM0OlRTDF7HN0vC06U8v+FvQ7GszkP1GCYWabUGsNWS4
 rzprpyFnDgPtl7zV1GvPd0w2t9sZfqCYrmHsfevPx/AbiNlEbX3FNwYVh
 Rus8w2w60D7Git1iMLKdfvIR7hntf7hBXlZvIDY33pa3k3bX4stworKRc
 oFCjYeS/GwkyXYhkejoX+Z72vO6t5buJiCfHwFmltI/SGFZbXADHdNhbM
 ZcYn37zYK0ouXC1AHiLJICdB3+wAxptgo+1pXhwx6p3J1MtXsBvZc8p0I Q==;
X-CSE-ConnectionGUID: jFKaczTOTEO2hdmpEu3Ijg==
X-CSE-MsgGUID: 2625oIfoQ3yDVyvdM44/lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4118797"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4118797"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:55 -0800
X-CSE-ConnectionGUID: KnOPQkWPTQSlzkxE+vE/pA==
X-CSE-MsgGUID: VRWMDdxfSre74Orb+OTp8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="11182124"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v9 5/7] drm/xe/oa: Fence OA ioctls and mmap against device
 unplug and wedging
Date: Fri, 20 Nov 2026 18:01:51 -0800
Message-ID: <20261121020145.147384-14-umesh.nerlige.ramappa@intel.com>
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

drm_ioctl() only checks for unplug on entry, so an OA ioctl that
started before drm_dev_unplug() can still open a stream, or access
oa->xe and the metrics idr, while the device is removed. The ioctls and
the mmap of the OA stream fd don't go through drm_ioctl() at all, and
neither through the wedged check of xe_drm_ioctl().

Run the OA ioctls of the drm fd and the ioctls and mmap of the OA stream
fd in a drm_dev_enter() section, so that they fail with -ENODEV once the
device is unplugged, and drm_dev_unplug() waits for the ones in flight.
Fail the stream fd ioctls with -ECANCELED on a wedged device, like
xe_drm_ioctl() does.

A config without output syncs waits synchronously for its batch, while
holding stream_lock or gt_lock and now in a drm_dev_enter() section. If
the batch waits on an input fence that never signals, or never completes
on a wedged device, that would block drm_dev_unplug() or the stream
teardown. Stop waiting once the device is unplugged or wedged, and fail
the config.

A stream fd can still outlive the device, the following patch handles
that.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
v8: Split out of "drm/xe/oa: Quiesce OA streams on driver unbind and PCI
    reset", which carried these changes since v4
---
 drivers/gpu/drm/xe/xe_oa.c          | 75 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_observation.c | 20 +++++++-
 2 files changed, 78 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7241cf18b325..3f51dca91c51 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -43,6 +43,7 @@
 #include "xe_sriov.h"
 #include "xe_sync.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -1082,6 +1083,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	struct xe_oa_fence *ofence;
 	int i, err, num_signal = 0;
 	struct dma_fence *fence;
+	int ret = 0;
 
 	ofence = kzalloc_obj(*ofence);
 	if (!ofence) {
@@ -1125,12 +1127,28 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	if (err == -ENOENT)
 		xe_oa_config_cb(fence, &ofence->cb);
 
-	/* If nothing needs to be signaled we wait synchronously */
+	/*
+	 * If nothing needs to be signaled we wait synchronously unless the device
+	 * is unplugged/wedged.
+	 */
 	if (!num_signal) {
-		dma_fence_wait(&ofence->base, false);
+		while (!dma_fence_wait_timeout(&ofence->base, false, HZ / 10)) {
+			if (drm_dev_is_unplugged(&gt_to_xe(stream->gt)->drm)) {
+				ret = -ENODEV;
+				break;
+			}
+			if (xe_wedged(gt_to_xe(stream->gt))) {
+				ret = -ECANCELED;
+				break;
+			}
+		}
 		dma_fence_put(&ofence->base);
 	}
 
+	/* The callers clean up the syncs on error */
+	if (ret)
+		return ret;
+
 	/* Done with syncs */
 	for (i = 0; i < stream->num_syncs; i++)
 		xe_sync_entry_cleanup(&stream->syncs[i]);
@@ -1722,11 +1740,20 @@ static long xe_oa_ioctl(struct file *file,
 			unsigned long arg)
 {
 	struct xe_oa_stream *stream = file->private_data;
-	long ret;
+	struct xe_device *xe = gt_to_xe(stream->gt);
+	long ret = -ECANCELED;
+	int idx;
 
-	mutex_lock(&stream->stream_lock);
-	ret = xe_oa_ioctl_locked(stream, cmd, arg);
-	mutex_unlock(&stream->stream_lock);
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (!xe_wedged(xe)) {
+		mutex_lock(&stream->stream_lock);
+		ret = xe_oa_ioctl_locked(stream, cmd, arg);
+		mutex_unlock(&stream->stream_lock);
+	}
+
+	drm_dev_exit(idx);
 
 	return ret;
 }
@@ -1765,27 +1792,41 @@ static int xe_oa_release(struct inode *inode, struct file *file)
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
@@ -1793,15 +1834,19 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
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

