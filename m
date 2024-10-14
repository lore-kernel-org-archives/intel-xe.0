Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F1BD1A42C
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 06:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C75910E276;
	Mon, 14 Oct 2024 06:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqTv4pZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B1A10E26F
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 06:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728885643; x=1760421643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lAcjtMfac/zsXBhljLXPtFf1AUUWlGHakSqQEFSWX6I=;
 b=VqTv4pZ7BDWkM11R3ahrxXFtlHOFFv+I+/lYS950DHrna8naIm3ez0bz
 XtP1Zgt6sfNIYuktRDlVwJDibdkEY9y+jGa+H+cHI2sjZ9IcRDKO3FF8G
 yyYvrc1T373rwYVnQMK1JDokUjV/fCDLce6/ZiyS95s4u7DJnGcKiGLtl
 nq/cW8JpimmDIcYajU7/XN/Y3iRDsg4RD+WhO6j9KajnU8hvYpAcSumDU
 eI8RggeH9aOvcBH33sYk9lfQAZhuGBeOK8V5XwlBviY2bpSruMXU3KsOm
 RFsI6CRjOgG2U1TCDKcec9hYdvigK5Iu6lChytKyeuWo+rm4h6hEoIm83 w==;
X-CSE-ConnectionGUID: wXNYFIKES3utaFQyIgQQIg==
X-CSE-MsgGUID: qd9iEN3vSjKm0+2ovyrigQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39599328"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="39599328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:42 -0700
X-CSE-ConnectionGUID: 7n16zOZASiG/cHw3nvamlg==
X-CSE-MsgGUID: Ieo+TySPSGmbyPmRucwTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77575036"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:43 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Date: Sun, 13 Oct 2024 23:00:33 -0700
Message-ID: <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1728884074.git.harish.chegondi@intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

A new hardware feature first introduced in PVC gives capability to
periodically sample EU stall state and record counts for different stall
reasons, on a per IP basis, aggregate across all EUs in a subslice and
record the samples in a buffer in each subslice. Eventually, the aggregated
data is written out to a buffer in the memory. This feature is also
supported in XE2 and later architecture GPUs.

Use an existing IOCTL DRM_IOCTL_XE_OBSERVATION as interface into the driver
from the user space to do initial setup and obtain a file descriptor for
the EU stall counter data stream.  Input parameter to the IOCTL is a struct
drm_xe_observation_param in which observation_type should be set to
DRM_XE_OBSERVATION_TYPE_EU_STALL, observation_op should be
DRM_XE_OBSERVATION_OP_STREAM_OPEN and param should point to a chain of
drm_xe_ext_set_property structures in which each structure has a pair of
property and value. The EU stall sampling input properties are defined in
drm_xe_eu_stall_property_id enum.

With the file descriptor obtained from DRM_IOCTL_XE_OBSERVATION, user space
can enable and disable EU stall sampling with the IOCTLs:
DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE.
User space can also call poll() to check for availability of data in the
buffer. The data can be read with read(). Finally, the file descriptor
can be closed with close().

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_eu_stall.c    | 275 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h    |  12 ++
 drivers/gpu/drm/xe/xe_observation.c |  14 ++
 include/uapi/drm/xe_drm.h           |  42 +++++
 5 files changed, 344 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cb6c625bdef0..bf21feae6950 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -33,6 +33,7 @@ xe-y += xe_bb.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
 	xe_drm_client.o \
+	xe_eu_stall.o \
 	xe_exec.o \
 	xe_execlist.o \
 	xe_exec_queue.o \
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
new file mode 100644
index 000000000000..5e4c90f9614d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/types.h>
+#include <linux/poll.h>
+#include <linux/fs.h>
+
+#include <uapi/drm/xe_drm.h>
+
+#include "xe_macros.h"
+#include "xe_device.h"
+#include "xe_eu_stall.h"
+#include "xe_gt_printk.h"
+#include "xe_gt_topology.h"
+#include "xe_observation.h"
+
+/**
+ * struct eu_stall_open_properties
+ *
+ * @eu_stall_sampling_rate: Hardware EU stall sampling rate.
+ * @event_report_count: Minimum no of EU stall data rows for poll to set POLLIN.
+ * @poll_period: The period in nanoseconds at which the CPU will check for
+ *		 EU stall data in the buffer.
+ * @gt: GT on which EU stall data will be captured.
+ */
+struct eu_stall_open_properties {
+	u8 eu_stall_sampling_rate;
+	u32 event_report_count;
+	u64 poll_period;
+	struct xe_gt *gt;
+};
+
+/**
+ * num_data_rows - Return the number of EU stall data rows of 64B each
+ *		   for a given data size.
+ *
+ * @data_size: EU stall data size
+ */
+static inline u32
+num_data_rows(u32 data_size)
+{
+	return (data_size >> 6);
+}
+
+static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
+					   struct eu_stall_open_properties *props)
+{
+	if (value == 0 || value > 7) {
+		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
+		return -EINVAL;
+	}
+	props->eu_stall_sampling_rate = value;
+	return 0;
+}
+
+static int set_prop_eu_stall_poll_period(struct xe_device *xe, u64 value,
+					 struct eu_stall_open_properties *props)
+{
+	if (value < 100000 /* 100us */) {
+		drm_dbg(&xe->drm, "EU stall data poll period %lluns less than 100us\n", value);
+		return -EINVAL;
+	}
+	props->poll_period = value;
+	return 0;
+}
+
+static int set_prop_eu_stall_event_report_count(struct xe_device *xe, u64 value,
+						struct eu_stall_open_properties *props)
+{
+	if (value == 0) {
+		drm_dbg(&xe->drm, "Invalid EU stall poll event report count %llu\n", value);
+		return -EINVAL;
+	}
+	props->event_report_count = (u32)value;
+	return 0;
+}
+
+static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
+				   struct eu_stall_open_properties *props)
+{
+	props->gt = xe_device_get_gt(xe, (u8)value);
+	if (!props->gt) {
+		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
+					struct eu_stall_open_properties *props);
+
+static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
+	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
+	[DRM_XE_EU_STALL_PROP_POLL_PERIOD] = set_prop_eu_stall_poll_period,
+	[DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT] = set_prop_eu_stall_event_report_count,
+	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
+};
+
+static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 extension,
+					     struct eu_stall_open_properties *props)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_ext_set_property ext;
+	int err;
+	u32 idx;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.property >= ARRAY_SIZE(xe_set_eu_stall_property_funcs)) ||
+	    XE_IOCTL_DBG(xe, ext.pad))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_set_eu_stall_property_funcs));
+	return xe_set_eu_stall_property_funcs[idx](xe, ext.value, props);
+}
+
+typedef int (*xe_eu_stall_user_extension_fn)(struct xe_device *xe, u64 extension,
+					     struct eu_stall_open_properties *props);
+static const xe_eu_stall_user_extension_fn xe_eu_stall_user_extension_funcs[] = {
+	[DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY] = xe_eu_stall_user_ext_set_property,
+};
+
+static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
+				       struct eu_stall_open_properties *props)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(xe_eu_stall_user_extension_funcs)))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_eu_stall_user_extension_funcs));
+	err = xe_eu_stall_user_extension_funcs[idx](xe, extension, props);
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	if (ext.next_extension)
+		return xe_eu_stall_user_extensions(xe, ext.next_extension, props);
+
+	return 0;
+}
+
+/**
+ * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
+ *
+ * @file: An xe EU stall data stream file
+ * @buf: destination buffer given by userspace
+ * @count: the number of bytes userspace wants to read
+ * @ppos: (inout) file seek position (unused)
+ *
+ * Returns: The number of bytes copied or a negative error code on failure.
+ */
+static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
+				       size_t count, loff_t *ppos)
+{
+	ssize_t ret = 0;
+
+	return ret;
+}
+
+/**
+ * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
+ *
+ * @file: An xe EU stall data stream file
+ * @wait: Poll table
+ *
+ * Returns: Bit mask of returned events.
+ */
+static __poll_t
+xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
+{
+	__poll_t ret = 0;
+
+	return ret;
+}
+
+/**
+ * xe_eu_stall_stream_ioctl - support ioctl() usage with xe EU stall data
+ *								stream fd
+ * @file: An xe EU stall data stream file
+ * @cmd: the ioctl request
+ * @arg: the ioctl data
+ *
+ * Returns: zero on success or a negative error code. Returns -EINVAL for
+ * an unknown ioctl request.
+ */
+static long xe_eu_stall_stream_ioctl(struct file *file,
+				     unsigned int cmd,
+				     unsigned long arg)
+{
+	switch (cmd) {
+	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
+		return 0;
+	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * xe_eu_stall_stream_close - handles userspace close() of a EU stall data
+ *			      stream file.
+ * @inode: anonymous inode associated with file
+ * @file: An xe EU stall data stream file
+ *
+ * Cleans up any resources associated with an open EU stall data stream file.
+ */
+static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static const struct file_operations fops_eu_stall = {
+	.owner		= THIS_MODULE,
+	.llseek		= noop_llseek,
+	.release	= xe_eu_stall_stream_close,
+	.poll		= xe_eu_stall_stream_poll,
+	.read		= xe_eu_stall_stream_read,
+	.unlocked_ioctl = xe_eu_stall_stream_ioctl,
+	.compat_ioctl   = xe_eu_stall_stream_ioctl,
+};
+
+static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
+{
+	return false;
+}
+
+int xe_eu_stall_stream_open(struct drm_device *dev,
+			    u64 data,
+			    struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct eu_stall_open_properties props;
+	int ret, stream_fd;
+
+	memset(&props, 0, sizeof(struct eu_stall_open_properties));
+
+	ret = xe_eu_stall_user_extensions(xe, data, &props);
+	if (ret)
+		return ret;
+
+	if (!props.gt) {
+		drm_dbg(&xe->drm, "GT ID not provided for EU stall sampling\n");
+		return -EINVAL;
+	}
+
+	if (xe_observation_paranoid && !perfmon_capable()) {
+		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
+		return -EACCES;
+	}
+
+	if (!has_eu_stall_sampling_support(xe)) {
+		xe_gt_dbg(props.gt, "EU stall monitoring is not supported on this platform\n");
+		return -EPERM;
+	}
+	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
+				     NULL, 0);
+	if (stream_fd < 0)
+		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
+
+	return stream_fd;
+}
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
new file mode 100644
index 000000000000..70fc89480df2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __XE_EU_STALL_H__
+#define __XE_EU_STALL_H__
+
+int xe_eu_stall_stream_open(struct drm_device *dev,
+			    u64 data,
+			    struct drm_file *file);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index 8ec1b84cbb9e..cca661de60ac 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -9,6 +9,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_oa.h"
+#include "xe_eu_stall.h"
 #include "xe_observation.h"
 
 u32 xe_observation_paranoid = true;
@@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
 	}
 }
 
+static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
+			     struct drm_file *file)
+{
+	switch (arg->observation_op) {
+	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
+		return xe_eu_stall_stream_open(dev, arg->param, file);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * xe_observation_ioctl - The top level observation layer ioctl
  * @dev: @drm_device
@@ -51,6 +63,8 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	switch (arg->observation_type) {
 	case DRM_XE_OBSERVATION_TYPE_OA:
 		return xe_oa_ioctl(dev, arg, file);
+	case DRM_XE_OBSERVATION_TYPE_EU_STALL:
+		return xe_eu_stall_ioctl(dev, arg, file);
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c4182e95a619..50ad6b2e1450 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
 enum drm_xe_observation_type {
 	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
 	DRM_XE_OBSERVATION_TYPE_OA,
+	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
+	DRM_XE_OBSERVATION_TYPE_EU_STALL,
 };
 
 /**
@@ -1696,6 +1698,46 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
+ *
+ * These properties are passed to the driver as a chain of
+ * @drm_xe_ext_set_property structures with @property set to these
+ * properties' enums and @value set to the corresponding values of these
+ * properties. @drm_xe_user_extension base.name should be set to
+ * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
+ */
+enum drm_xe_eu_stall_property_id {
+#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
+	/**
+	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
+	 * in multiples of 251 cycles. Valid values are 1 to 7.
+	 * If the value is 1, sampling interval is 251 cycles.
+	 * If the value is 7, sampling interval is 7 x 251 cycles.
+	 */
+	DRM_XE_EU_STALL_PROP_SAMPLE_RATE = 1,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
+	 * poll period in nanoseconds at which the driver polls
+	 * for EU stall data in the buffer. Should be at least 100000 ns.
+	 */
+	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
+	 * EU stall data rows to be present in the kernel buffer for
+	 * poll() to set POLLIN (data present).
+	 */
+	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
+	 * EU stall data will be captured.
+	 */
+	DRM_XE_EU_STALL_PROP_GT_ID,
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.45.1

