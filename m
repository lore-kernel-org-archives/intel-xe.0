Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2A1E77186
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 09:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB29310E8D7;
	Tue, 17 Dec 2024 09:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgAkkBLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B2010E8CD
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734428832; x=1765964832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L2RT38ePktgl7nyGG5ZZBtOLywEVlAF0tKyuV2GLQTA=;
 b=dgAkkBLoBBR+4utM7XCq/iQeoIHM6b543Un2Opw59R7yWpJEx1wYp2Ci
 aLnfh+elWFYxTxsGOra263eqz2S0vnj8TXwQxPqXcKOgx2xdNzOs1XrQZ
 aneGLVQ0nweFZQXeGsL8Pq/yLNy5nYeP3SP5kzgoRAakSN7qFPlfQ7feN
 f6EHwusJtsVnrKkbcP5Nv8meQc5/9Q63qm+JYFYctQFP7lTc1Xy5FPycn
 6RFI13rL4gIRXlmD4xosIYdX5nZvGwJax+0TYdKVbcb9o6jIlEy93Sfix
 wqzwch3yGjOio1XJfDkNAj0xKLrjRhQ+hq423ahbqSE5vfIrhArygA+HT w==;
X-CSE-ConnectionGUID: g/BUW1n+QdCzwFeOOKMpSw==
X-CSE-MsgGUID: tWpa/cHXT6+kTaEeQ6LqCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46238181"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46238181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:12 -0800
X-CSE-ConnectionGUID: 3E/uBVUwTRib3GgnPYL1MQ==
X-CSE-MsgGUID: JegLtZYwQwCPvEYDquxi2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97364652"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 01:47:11 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v6 2/7] drm/xe/uapi: Introduce API for EU stall sampling
Date: Tue, 17 Dec 2024 01:46:52 -0800
Message-ID: <03e289da2ba0426649774b2a68569003c2aa0945.1734427624.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1734427624.git.harish.chegondi@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
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

Use an existing IOCTL - DRM_IOCTL_XE_OBSERVATION as the interface into the
driver from the user space to do initial setup and obtain a file descriptor
for the EU stall data stream.  Input parameter to the IOCTL is a struct
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

A user space consumer for this feature is Mesa.

Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142

v6: Change the input sampling rate to GPU cycles instead of
    GPU cycles multiplier.

Cc: Felix Degrood <felix.j.degrood@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_eu_stall.c    | 283 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eu_stall.h    |  12 ++
 drivers/gpu/drm/xe/xe_observation.c |  14 ++
 include/uapi/drm/xe_drm.h           |  41 ++++
 5 files changed, 351 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
 create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7730e0596299..259ccbb0c031 100644
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
index 000000000000..5f7f504e4980
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -0,0 +1,283 @@
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
+ * struct eu_stall_open_properties - EU stall sampling properties received
+ *				     from user space at open.
+ * @eu_stall_sampling_rate: EU stall sampling rate multiplier.
+ *			    HW will sample every (eu_stall_sampling_rate x 251) cycles.
+ * @event_report_count: Minimum number of EU stall data rows for poll to set POLLIN.
+ * @gt: GT on which EU stall data will be captured.
+ */
+struct eu_stall_open_properties {
+	u8 eu_stall_sampling_rate;
+	u32 event_report_count;
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
+	value = value / 251;
+	if (value == 0 || value > 7) {
+		drm_dbg(&xe->drm, "Invalid EU stall sampling rate %llu\n", value);
+		return -EINVAL;
+	}
+	props->eu_stall_sampling_rate = value;
+	return 0;
+}
+
+static int set_prop_eu_stall_event_report_count(struct xe_device *xe, u64 value,
+						struct eu_stall_open_properties *props)
+{
+	u32 max_event_report_count;
+
+	max_event_report_count = num_data_rows(SZ_512K * XE_MAX_DSS_FUSE_BITS);
+	if (value == 0 || value > max_event_report_count) {
+		drm_dbg(&xe->drm, "Invalid EU stall poll event report count %llu\n", value);
+		drm_dbg(&xe->drm, "Minimum event report count is 1, maximum is %u\n",
+			max_event_report_count);
+		return -EINVAL;
+	}
+	props->event_report_count = value;
+	return 0;
+}
+
+static int set_prop_eu_stall_gt_id(struct xe_device *xe, u64 value,
+				   struct eu_stall_open_properties *props)
+{
+	if (value >= xe->info.gt_count) {
+		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
+		return -EINVAL;
+	}
+	props->gt = xe_device_get_gt(xe, value);
+	return 0;
+}
+
+typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
+					struct eu_stall_open_properties *props);
+
+static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
+	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
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
+ * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
+ * before calling read().
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
+ * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
+ *
+ * @file: An xe EU stall data stream file
+ * @cmd: the ioctl request
+ * @arg: the ioctl data
+ *
+ * Returns: zero on success or a negative error code.
+ *	    -EINVAL for an unknown ioctl request.
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
+/**
+ * xe_eu_stall_stream_open - Open a xe EU stall data stream fd
+ *
+ * @dev: DRM device pointer
+ * @data: pointer to first struct @drm_xe_ext_set_property in
+ *	  the chain of input properties from the user space.
+ * @file: DRM file pointer
+ *
+ * This function opens a EU stall data stream with input properties from
+ * the user space.
+ *
+ * Returns: EU stall data stream fd on success or a negative error code.
+ */
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
index f62689ca861a..4ee3b04a1bb5 100644
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
@@ -1729,6 +1731,45 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
+ *
+ * These properties are passed to the driver at open as a chain of
+ * @drm_xe_ext_set_property structures with @property set to these
+ * properties' enums and @value set to the corresponding values of these
+ * properties. @drm_xe_user_extension base.name should be set to
+ * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
+ *
+ * With the file descriptor obtained from open, user space must enable
+ * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
+ * calling read(). read() returns number of bytes of EU stall data read
+ * from the EU stall data buffer or an error. One of the errors returned
+ * from read is -EIO which indicates HW dropped data due to full buffer.
+ *
+ */
+enum drm_xe_eu_stall_property_id {
+#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
+	/**
+	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
+	 * EU stall data will be captured.
+	 */
+	DRM_XE_EU_STALL_PROP_GT_ID = 1,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
+	 * in GPU cycles. Valid values are:
+	 * 251, 251x2, 251x3, 251x4, 251x5, 251x6 and 251x7.
+	 */
+	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
+	 * EU stall data rows to be present in the kernel buffer for
+	 * poll() to set POLLIN (data present).
+	 */
+	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.0

