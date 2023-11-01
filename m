Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8D0C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 23:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5159A10E7F7;
	Wed,  1 Nov 2023 23:57:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C71310E7F4
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 23:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698883074; x=1730419074;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rZHn2SNWuEhezl7CRKddpfs67G4LEl5alPnaExyOFzA=;
 b=jqYPTxFp3xiWnI4Vf/FXMpZ/fAQtwTxfV9OgGRfbhbXDBNjMONoGeB6A
 ovo3bjsbyaXipIiz50KxSQ6Su/esTwR6yHxcAs/2efocAHgYtxTQn2kLm
 c8Yy46mxl3fhsI/3gp6qTgL13ZuIsD7KhIrhYbQuqoQiBrRrqRFAXzmU4
 XuBEN2DjkGL8icVoE9pY+NtdbJU4+hYKC3w2OYu6ymjHDCoefkYvjfChr
 tkX5Q/ExEfixktzxzOBqtIcL9jfnnN5ypjEf1t2E3xW3gfkuqp6A5GzfQ
 twmm+Zw8jYnZ4Gmea9Q54cqprSIoNEB6znuWyvr6OpZM6W1se4m12xk+S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378996970"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="378996970"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 16:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008276013"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="1008276013"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 16:57:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 16:57:49 -0700
Message-Id: <20231101235749.4720-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v2 2/2] drm/xe: Prevent exec_queues creation on
 diabled CCS engines
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

Ensure no exec_queues are opened when changing CCS mode.
Allow exec_queue creation only with enabled CCS engines.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  9 ++++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 45 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_tile_sysfs.c   |  8 +++++
 4 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8341acf66e5f..a0d2fa7f63ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -226,6 +226,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.force_execlist = force_execlist;
 
 	spin_lock_init(&xe->irq.lock);
+	spin_lock_init(&xe->ccs_mode.lock);
 
 	init_waitqueue_head(&xe->ufence_wq);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cb537cac1ef9..803cca66a19c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -297,6 +297,15 @@ struct xe_device {
 		struct ttm_resource_manager sys_mgr;
 	} mem;
 
+	/** @ccs_mode: ccs mode */
+	struct {
+		/** @lock: Ensures no client is active while setting ccs_mode */
+		spinlock_t lock;
+
+		/** @num_exec_queues: number of open exec queues */
+		u64 num_exec_queues;
+	} ccs_mode;
+
 	/** @usm: unified memory state */
 	struct {
 		/** @asid: convert a ASID to VM */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4fd44a9203e4..beb89d41ef7b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -539,6 +539,15 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 	return logical_mask;
 }
 
+static inline bool ccs_mode_engine_enabled(struct xe_device *xe,
+					   struct drm_xe_engine_class_instance eci)
+{
+	struct xe_gt *gt = xe_device_get_gt(xe, eci.gt_id);
+
+	return !(eci.engine_class == DRM_XE_ENGINE_CLASS_COMPUTE &&
+		 eci.engine_instance >= gt->ccs.num_engines);
+}
+
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
@@ -561,6 +570,9 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 
 			n = j * width + i;
 
+			if (XE_IOCTL_DBG(xe, !ccs_mode_engine_enabled(xe, eci[n])))
+				return 0;
+
 			hwe = find_hw_engine(xe, eci[n]);
 			if (XE_IOCTL_DBG(xe, !hwe))
 				return 0;
@@ -590,8 +602,8 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 	return return_mask;
 }
 
-int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
-			       struct drm_file *file)
+static int __xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
+					struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
@@ -747,6 +759,34 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	return err;
 }
 
+static void inc_exec_queue_count(struct xe_device *xe)
+{
+	spin_lock(&xe->ccs_mode.lock);
+	xe->ccs_mode.num_exec_queues++;
+	spin_unlock(&xe->ccs_mode.lock);
+}
+
+static void dec_exec_queue_count(struct xe_device *xe)
+{
+	spin_lock(&xe->ccs_mode.lock);
+	xe->ccs_mode.num_exec_queues--;
+	spin_unlock(&xe->ccs_mode.lock);
+}
+
+int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
+			       struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	int err;
+
+	inc_exec_queue_count(xe);
+	err = __xe_exec_queue_create_ioctl(dev, data, file);
+	if (err)
+		dec_exec_queue_count(xe);
+
+	return err;
+}
+
 int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file)
 {
@@ -872,6 +912,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
+	dec_exec_queue_count(xe);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERSISTENT))
 		xe_exec_queue_kill(q);
 	else
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index a0162744ce24..88f016f651ba 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -72,12 +72,20 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
+	spin_lock(&xe->ccs_mode.lock);
+	if (xe->ccs_mode.num_exec_queues) {
+		spin_unlock(&xe->ccs_mode.lock);
+		return -EBUSY;
+	}
+
 	if (gt->ccs.num_engines != num_engines) {
 		drm_info(&xe->drm, "tile-%d: setting compute mode to %d\n", tile->id, num_engines);
 		gt->ccs.num_engines = num_engines;
 		xe_gt_reset_async(gt);
 	}
 
+	spin_unlock(&xe->ccs_mode.lock);
+
 	return count;
 }
 
-- 
2.21.0.rc0.32.g243a4c7e27

