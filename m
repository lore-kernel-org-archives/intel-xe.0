Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3FEEE57C7
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DCF10E86C;
	Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4A10E85F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147036; x=1725683036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IMV4SuqUDBHz7+ttPOM5G9Jad27dJ3CmddlY/+jpnJ8=;
 b=jAcEQzZ7wht60aZHTkBphlu7ZunS5e2LvkErkqHqi0/FbFEoKbIXJ9+S
 kS19hODUSivOMmoVAF4EymkvvqAFEORJSRdCeFB47MeUK1gTzW8xxuOUe
 gRL4OEjgN+w1o1oMyZvC6qBvEvRfBU9Ut9gJRhALlNyKckN94H04zTeeM
 2XnOL8D44gDPIWzavxdf5cc/jqElySzky4WPfrDuDAImz60sajYDJBh79
 1Ike812sHoJKb85hcu4TnwHp3O3PigLT5Y+POxN74eIFDCty7RnfocFHx
 3YSz0weaZPGtI3w/D2rMVslm0JpyIJhOecPMdPN824ptWagm8RzlFbra3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935402"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935402"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200752"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200752"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:43 -0700
Message-ID: <20230908042348.1592535-13-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/17] drm/xe/perf: "Perf" layer to support
 multiple perf counter stream types
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

In XE, the plan is to support multiple types of perf counter streams (OA is
only one type of these streams). This requires addition of a PERF layer to
multiplex these different stream types through a single set of PERF
ioctl's.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  8 +++---
 drivers/gpu/drm/xe/xe_oa.c     | 43 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_perf.c   | 52 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 18 ++++++++++++
 include/uapi/drm/xe_drm.h      | 44 +++++++++++++++++++---------
 6 files changed, 133 insertions(+), 33 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c01b4cab84746..827ccd41360ae 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -88,6 +88,7 @@ xe-y += xe_bb.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_perf.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c67570853d3f1..8447d1251fa59 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -25,8 +25,8 @@
 #include "xe_irq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
-#include "xe_oa.h"
 #include "xe_pcode.h"
+#include "xe_perf.h"
 #include "xe_pm.h"
 #include "xe_query.h"
 #include "xe_tile.h"
@@ -115,9 +115,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 
-	DRM_IOCTL_DEF_DRV(XE_OA_OPEN, xe_oa_stream_open_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_OA_ADD_CONFIG, xe_oa_add_config_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_OA_REMOVE_CONFIG, xe_oa_remove_config_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
 
 };
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6a5492b1b5f29..3a8684c41c339 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1173,13 +1173,13 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned long arg)
 {
 	switch (cmd) {
-	case XE_OA_IOCTL_ENABLE:
+	case XE_PERF_IOCTL_ENABLE:
 		xe_oa_enable_locked(stream);
 		return 0;
-	case XE_OA_IOCTL_DISABLE:
+	case XE_PERF_IOCTL_DISABLE:
 		xe_oa_disable_locked(stream);
 		return 0;
-	case XE_OA_IOCTL_CONFIG:
+	case XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
 	}
 
@@ -1692,12 +1692,11 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
 	return 0;
 }
 
-int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
-			    struct drm_file *file)
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
-	struct drm_xe_oa_open_param *param = data;
 	struct xe_oa_open_properties props = {};
+	struct drm_xe_oa_open_param param;
 	u32 known_open_flags;
 	struct xe_gt *gt;
 	int ret;
@@ -1707,14 +1706,18 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
 		return -ENODEV;
 	}
 
+	ret = __copy_from_user(&param, data, sizeof(param));
+	if (XE_IOCTL_DBG(oa->xe, ret))
+		return -EFAULT;
+
 	known_open_flags = XE_OA_FLAG_FD_CLOEXEC | XE_OA_FLAG_FD_NONBLOCK | XE_OA_FLAG_DISABLED;
-	if (param->flags & ~known_open_flags) {
+	if (param.flags & ~known_open_flags) {
 		drm_dbg(&oa->xe->drm, "Unknown drm_xe_oa_open_param flag\n");
 		return -EINVAL;
 	}
 
-	ret = xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param->properties_ptr),
-					     param->num_properties,
+	ret = xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param.properties_ptr),
+					     param.num_properties,
 					     &props);
 	if (ret)
 		return ret;
@@ -1722,7 +1725,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
 	gt = props.hwe->gt;
 
 	mutex_lock(&gt->oa.lock);
-	ret = xe_oa_stream_open_ioctl_locked(oa, param, &props, file);
+	ret = xe_oa_stream_open_ioctl_locked(oa, &param, &props, file);
 	mutex_unlock(&gt->oa.lock);
 
 	return ret;
@@ -1918,7 +1921,8 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
-	struct drm_xe_oa_config *arg = data;
+	struct drm_xe_oa_config param;
+	struct drm_xe_oa_config *arg = &param;
 	struct xe_oa_config *oa_config, *tmp;
 	struct xe_oa_reg *regs;
 	int err, id;
@@ -1933,6 +1937,10 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 		return -EACCES;
 	}
 
+	err = __copy_from_user(&param, data, sizeof(param));
+	if (XE_IOCTL_DBG(oa->xe, err))
+		return -EFAULT;
+
 	if ((!arg->mux_regs_ptr || !arg->n_mux_regs) &&
 	    (!arg->boolean_regs_ptr || !arg->n_boolean_regs) &&
 	    (!arg->flex_regs_ptr || !arg->n_flex_regs)) {
@@ -2035,7 +2043,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
 	struct xe_oa_config *oa_config;
-	u64 *arg = data;
+	u64 arg, *ptr = data;
 	int ret;
 
 	if (!oa->xe) {
@@ -2048,22 +2056,25 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 		return -EACCES;
 	}
 
+	ret = get_user(arg, ptr);
+	if (XE_IOCTL_DBG(oa->xe, ret))
+		return ret;
+
 	ret = mutex_lock_interruptible(&oa->metrics_lock);
 	if (ret)
 		return ret;
 
-	oa_config = idr_find(&oa->metrics_idr, *arg);
+	oa_config = idr_find(&oa->metrics_idr, arg);
 	if (!oa_config) {
 		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
 		ret = -ENOENT;
 		goto err_unlock;
 	}
 
-	WARN_ON(*arg != oa_config->id);
+	WARN_ON(arg != oa_config->id);
 
 	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
-
-	idr_remove(&oa->metrics_idr, *arg);
+	idr_remove(&oa->metrics_idr, arg);
 
 	mutex_unlock(&oa->metrics_lock);
 
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
new file mode 100644
index 0000000000000..0f747af59f245
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_oa.h"
+#include "xe_perf.h"
+
+int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_xe_perf_param *arg = data;
+
+	if (arg->extensions)
+		return -EINVAL;
+
+	switch (arg->perf_type) {
+	case XE_PERF_TYPE_OA:
+		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
+	default:
+		return -EINVAL;
+	}
+}
+
+int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_xe_perf_param *arg = data;
+
+	if (arg->extensions)
+		return -EINVAL;
+
+	switch (arg->perf_type) {
+	case XE_PERF_TYPE_OA:
+		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
+	default:
+		return -EINVAL;
+	}
+}
+
+int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct drm_xe_perf_param *arg = data;
+
+	if (arg->extensions)
+		return -EINVAL;
+
+	switch (arg->perf_type) {
+	case XE_PERF_TYPE_OA:
+		return xe_oa_remove_config_ioctl(dev, (void *)arg->param, file);
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
new file mode 100644
index 0000000000000..7ee90491132a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PERF_H_
+#define _XE_PERF_H_
+
+#include <drm/xe_drm.h>
+
+struct drm_device;
+struct drm_file;
+
+int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 186720872ca63..91aaeab603571 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -111,9 +111,9 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
-#define DRM_XE_OA_OPEN			0x16
-#define DRM_XE_OA_ADD_CONFIG		0x17
-#define DRM_XE_OA_REMOVE_CONFIG		0x18
+#define DRM_XE_PERF_OPEN		0x16
+#define DRM_XE_PERF_ADD_CONFIG		0x17
+#define DRM_XE_PERF_REMOVE_CONFIG	0x18
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -130,9 +130,9 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
-#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
-#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
-#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
+#define DRM_IOCTL_XE_PERF_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_OPEN, struct drm_xe_perf_param)
+#define DRM_IOCTL_XE_PERF_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_ADD_CONFIG, struct drm_xe_perf_param)
+#define DRM_IOCTL_XE_PERF_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_REMOVE_CONFIG, struct drm_xe_perf_param)
 
 /**
  * enum drm_xe_memory_class - Supported memory classes.
@@ -1065,6 +1065,26 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
+enum drm_xe_perf_type {
+	XE_PERF_TYPE_OA,
+};
+
+/**
+ * struct drm_xe_perf_param - XE perf layer param
+ *
+ * The perf layer enables multiplexing perf counter streams of multiple
+ * types. The actual params for a particular stream operation are supplied
+ * via the @param pointer (use __copy_from_user to get these params).
+ */
+struct drm_xe_perf_param {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @perf_type: Type, of enum drm_xe_perf_type, of perf stream  */
+	__u64 perf_type;
+	/** @param: Pointer to actual stream params */
+	__u64 param;
+};
+
 enum drm_xe_oa_format {
 	XE_OA_FORMAT_C4_B8 = 7,
 
@@ -1291,21 +1311,19 @@ struct drm_xe_oa_config {
  *
  * It's undefined whether any pending data for the stream will be lost.
  */
-#define XE_OA_IOCTL_ENABLE	_IO('i', 0x0)
+#define XE_PERF_IOCTL_ENABLE	_IO('i', 0x0)
 
 /*
- * Disable data capture for a stream.
+ * Disable data capture for a stream
  *
  * It is an error to try and read a stream that is disabled.
  */
-#define XE_OA_IOCTL_DISABLE	_IO('i', 0x1)
+#define XE_PERF_IOCTL_DISABLE	_IO('i', 0x1)
 
 /*
- * Change metrics_set captured by a stream.
- *
- * Returns the previously bound metrics set id, or a negative error code.
+ * Change stream configuration
  */
-#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
+#define XE_PERF_IOCTL_CONFIG	_IO('i', 0x2)
 
 #if defined(__cplusplus)
 }
-- 
2.41.0

