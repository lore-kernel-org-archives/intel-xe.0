Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AF3C25B67
	for <intel-xe@archiver.kernel.org>; Sat, 28 Oct 2023 03:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEBC10EAA9;
	Sat, 28 Oct 2023 03:39:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4345210EAA9
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Oct 2023 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698464356; x=1730000356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iqY4jt9ji0uPXSSPNgkYF3Ks77/pxMHrrCkDQDYsGKc=;
 b=dhLBKMmaOw9318X/7YSZBj1loRh5p1SqREkhHoBEg0sbP39KEz9VI6P3
 6PLRCLvwct0bn37wICJfYzZo2cyh7RhJzwrisqZuV0ECgY+TB3ovHotam
 6DiVHaAXWhfB9xmiKOi1CHGKpO7Ohrf8H6AotuutDpF+UyOZRB0UIywgf
 n5BMiiiD4wsJbffLk7XBt7OOR9/7eNQuERod7p8tQ2LB3iiwCy/xVRa9K
 ghsr1B5EmAsWoMfpIt+4GgOmLVc6Jm8nwRoyc27gBbi2AJpYVTHk2gaUs
 PmgEr3vi3nG8Wfva5S4i8xSiMSCRXCrNxASxRna8yAWFr2zBWLQc6MP5G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="6510327"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="6510327"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 20:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="7825410"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 20:39:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 20:39:10 -0700
Message-ID: <20231028033910.2479157-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231028033910.2479157-1-ashutosh.dixit@intel.com>
References: <20231028033910.2479157-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] drm/xe/uapi: "Perf" layer to support
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
Cc: Harish Chegondi <harish.chegondi@intel.com>, gzadicario@habana.ai,
 ogabbay@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In Xe, the plan is to support multiple types of perf counter streams (OA is
only one type of these streams). Rather than introduce NxM ioctls for
these (N perf streams with M ioctl's per perf stream), we decide to
multiplex these (N different stream types and the M ops for each of these
stream types) through a single PERF ioctl. This multiplexing is the purpose
of the PERF layer.

In addition to PERF DRM ioctl's, another set of ioctl's on the PERF fd are
defined. These are expected to be common to different PERF stream types and
therefore defined at the PERF layer itself.

v2: Add param_size to 'struct drm_xe_perf_param' (Umesh)
v3: Rename 'enum drm_xe_perf_ops' to
    'enum drm_xe_perf_ioctls' (Guy Zadicario)
    Add DRM_ prefix to ioctl names to indicate uapi names
v4: Add 'enum drm_xe_perf_op' previously missed out (Guy Zadicario)
v5: Squash the ops and PERF layer patches into a single patch (Umesh)
    Remove param_size from struct 'drm_xe_perf_param' (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  2 ++
 drivers/gpu/drm/xe/xe_perf.c   | 21 ++++++++++++
 drivers/gpu/drm/xe/xe_perf.h   | 16 +++++++++
 include/uapi/drm/xe_drm.h      | 59 ++++++++++++++++++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_perf.c
 create mode 100644 drivers/gpu/drm/xe/xe_perf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cee57681732d5..87c57f6c927e9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -89,6 +89,7 @@ xe-y += xe_bb.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_perf.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8341acf66e5f9..4b5a0c504eda1 100644
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
@@ -127,6 +128,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
 };
 
 static const struct file_operations xe_driver_fops = {
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
new file mode 100644
index 0000000000000..a130076b59aa2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/errno.h>
+
+#include "xe_perf.h"
+
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 0000000000000..254cc7cf49fef
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -0,0 +1,16 @@
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
+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 24bf8f0f52e82..3eb4b20159824 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -110,6 +110,7 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_VM_MADVISE		0x0b
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
+#define DRM_XE_PERF			0x0d
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -125,6 +126,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
 
 /** struct drm_xe_engine_class_instance - instance of an engine class */
 struct drm_xe_engine_class_instance {
@@ -1074,6 +1076,63 @@ struct drm_xe_vm_madvise {
 #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
 #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
 
+/**
+ * enum drm_xe_perf_type - Perf stream types
+ */
+enum drm_xe_perf_type {
+	DRM_XE_PERF_TYPE_MAX,
+};
+
+/**
+ * enum drm_xe_perf_op - Perf stream ops
+ */
+enum drm_xe_perf_op {
+	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
+	DRM_XE_PERF_OP_STREAM_OPEN,
+
+	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
+	DRM_XE_PERF_OP_ADD_CONFIG,
+
+	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
+	DRM_XE_PERF_OP_REMOVE_CONFIG,
+};
+
+/**
+ * struct drm_xe_perf_param - Perf layer param
+ *
+ * The perf layer enables multiplexing perf counter streams of multiple
+ * types. The actual params for a particular stream operation are supplied
+ * via the @param pointer (use __copy_from_user to get these params).
+ */
+struct drm_xe_perf_param {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
+	__u64 perf_type;
+	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
+	__u64 perf_op;
+	/** @param: Pointer to actual stream params */
+	__u64 param;
+};
+
+/**
+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
+ */
+enum drm_xe_perf_ioctls {
+	/**
+	 * @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream that
+	 * was e.g. either opened in a disabled state or was disabled via
+	 * DRM_XE_PERF_IOCTL_DISABLE
+	 */
+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
+
+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
+
+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

