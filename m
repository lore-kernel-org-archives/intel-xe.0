Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84D0E81E18
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 22:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8E910E0F1;
	Mon,  9 Oct 2023 22:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1E110E082
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 22:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696890413; x=1728426413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgp+Kp4OPfBMeQVyCxktUOTBkLHGrye+NIvYWm56UHE=;
 b=lQbhZLxDDUUTm1A4ZnzD603uwbgQ7hqIbamH3YUQLp1V8s6nr5Mv5laj
 0iR3YmRBeUI6XjiThCkqis41Mbr5h9ypRbh9NSqREmivjJ9APV1HNBP/O
 oTLBmaHJDymkj7lzEp5H2XSRRH1dC+zvR8j0bsoHWcYLvWG0IAjO3xh1d
 v9HaJTMCDkaWcToc+6mSHaKUTGwW2Wsxqa9XyEb2i+MJsbjqWQA35N/6L
 uELQZ9JAATZBO8aJ8uvKJ8+yD/q1Y/NQQslewWqO63oe300owUM1VV2A+
 BIBNKExhqi4Ic0KEShm71NO4IN/D6KDb4jutLm0Wa4TeyB9llQy4rOA8y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369325832"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="369325832"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000389579"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="1000389579"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 15:24:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 15:24:08 -0700
Message-ID: <20231009222409.620443-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009222409.620443-1-ashutosh.dixit@intel.com>
References: <20231009222409.620443-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/uapi: "Perf" layer to support
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
Cc: ogabbay@habana.ai, gzadicario@habana.ai,
 Harish Chegondi <harish.chegondi@intel.com>, bdotan@habana.ai, talbo@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In XE, the plan is to support multiple types of perf counter streams (OA is
only one type of these streams). This requires addition of a PERF layer to
multiplex these different stream types through a single set of PERF
ioctl's.

v2: Add param_size to 'struct drm_xe_perf_param' (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  4 +++
 drivers/gpu/drm/xe/xe_perf.c   | 47 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 18 +++++++++++++
 include/uapi/drm/xe_drm.h      | 49 ++++++++++++++++++++++++++++++++++
 5 files changed, 119 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index dff1386ee6b31..122498e24251c 100644
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
index ef42c33e30558..3c0c28c6f9fb8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -28,6 +28,7 @@
 #include "xe_module.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
+#include "xe_perf.h"
 #include "xe_pm.h"
 #include "xe_query.h"
 #include "xe_tile.h"
@@ -128,6 +129,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
new file mode 100644
index 0000000000000..de430065e0d27
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/errno.h>
+
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
index d48d8e3c898ce..a2b20335aacd7 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -111,6 +111,9 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
+#define DRM_XE_PERF_OPEN		0x0e
+#define DRM_XE_PERF_ADD_CONFIG		0x0f
+#define DRM_XE_PERF_REMOVE_CONFIG	0x10
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -127,6 +130,9 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_PERF_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_OPEN, struct drm_xe_perf_param)
+#define DRM_IOCTL_XE_PERF_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_ADD_CONFIG, struct drm_xe_perf_param)
+#define DRM_IOCTL_XE_PERF_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_REMOVE_CONFIG, struct drm_xe_perf_param)
 
 /**
  * enum drm_xe_memory_class - Supported memory classes.
@@ -1093,6 +1099,49 @@ struct drm_xe_vm_madvise {
 #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
 #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
 
+/**
+ * enum drm_xe_perf_type - Perf stream types
+ */
+enum drm_xe_perf_type {
+	XE_PERF_TYPE_MAX,
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
+	/** @perf_type: Type, of enum @drm_xe_perf_type, of perf stream  */
+	__u64 perf_type;
+	/** @param_size: size of data struct pointed to by @param */
+	__u64 param_size;
+	/** @param: Pointer to actual stream params */
+	__u64 param;
+};
+
+/**
+ * enum drm_xe_perf_ops - Perf stream ops
+ */
+enum drm_xe_perf_ops {
+	/**
+	 * @XE_PERF_IOCTL_ENABLE: Enable data capture for a stream that was
+	 * e.g. either opened in a disabled state or was disabled via
+	 * XE_PERF_IOCTL_DISABLE.
+	 */
+	XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
+
+	/** @XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
+	XE_PERF_IOCTL_DISABLE =	_IO('i', 0x1),
+
+	/** @XE_PERF_IOCTL_CONFIG: Change stream configuration */
+	XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

