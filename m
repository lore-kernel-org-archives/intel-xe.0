Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF831C3DA42
	for <intel-xe@archiver.kernel.org>; Sun,  7 Jul 2024 22:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE28010E122;
	Sun,  7 Jul 2024 22:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCeO5XVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C47B10E122
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Jul 2024 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720392107; x=1751928107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hbeTbiN1L9JjmGwZuVRn7lm+tY78HyEC31NxL8YhG40=;
 b=cCeO5XVBCeKFhFmBmxhFWwm0jJHXrhZyqVybJOfG1c4XvJSKtXILStBT
 rRSZ35lDAsqPy8B75Azw/koPzq0EVHY3VZbeVRimGAQQVB+3O/Xffk+7X
 PRLxOddK6seiifFRev9d8MorAVgyuY8AMZ2bI0e9LFJFTlDsXKXdo4jVU
 /oD/oJSf16WjRctF/sm28niM+K4NCbByewx+Ld+2cO7fjabFc0cUp7HDD
 QwimiZrWhJe8CK7n+J7NfSfPfObO1Hp1DllK+GWqsfXWgixkO14fycbg0
 0pB6lc0bC4+C5azaFbdMeNqQP61VjTEUj/M9Yu+jvq0dWC0WOfjAkpBlZ Q==;
X-CSE-ConnectionGUID: nK3Qj+fPQh2PavWtoFTu7g==
X-CSE-MsgGUID: LPurjVj6QiWlaStfVhISEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17793171"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="17793171"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 15:41:46 -0700
X-CSE-ConnectionGUID: iUhpUEBmQcyfOy8TZ5JFAA==
X-CSE-MsgGUID: FmFae4ovT0a6NFXy1ATF9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="47265675"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 15:41:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Date: Sun,  7 Jul 2024 15:41:41 -0700
Message-ID: <20240707224141.2865472-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
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

From: Harish Chegondi <harish.chegondi@intel.com>

A new hardware feature first introduced in PVC gives capability to
periodically sample EU stall state and record counts for different stall
reasons, on a per IP basis, aggregate across all EUs in a subslice and
record the samples in a buffer in each subslice. Eventually, the aggregated
data is written out to a buffer in the memory. This feature is also
supported in XE2 architecture GPUs - LNL and BMG.

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
can enable and disable EU stall sampling with
DRM_XE_OBSERVATION_IOCTL_ENABLE and DRM_XE_OBSERVATION_IOCTL_DISABLE
IOCTLs.  User space can also call poll() to check for availability of
data. The data can be read with read(). EU stall data consists of header
and data pairs. The header format is defined in struct
drm_xe_eu_stall_data_header. If the user space doesn't read the EU stall
data fast enough, it is possible that the EU stall data buffer can get
filled up and if the hardware wants to write data, it simply drops data due
to unavailable buffer space. In that case hardware sets a bit in a
register.  The driver sets a flag in the EU stall data header flags field
to let the user space know that the hardware has dropped data.

v2: Rename xe perf layer as xe observation layer (Ashutosh)

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |    1 +
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   33 +
 drivers/gpu/drm/xe/xe_eustall_cntr.c       | 1005 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eustall_cntr.h       |   62 ++
 drivers/gpu/drm/xe/xe_gt.c                 |    3 +
 drivers/gpu/drm/xe/xe_gt_topology.c        |    9 +
 drivers/gpu/drm/xe/xe_gt_topology.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_types.h           |    4 +
 drivers/gpu/drm/xe/xe_observation.c        |   14 +
 drivers/gpu/drm/xe/xe_trace.h              |   35 +
 include/uapi/drm/xe_drm.h                  |   77 ++
 11 files changed, 1246 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.c
 create mode 100644 drivers/gpu/drm/xe/xe_eustall_cntr.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0eb0acc4f198..13d935ac40b3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -54,6 +54,7 @@ xe-y += xe_bb.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
 	xe_drm_client.o \
+	xe_eustall_cntr.o \
 	xe_exec.o \
 	xe_execlist.o \
 	xe_exec_queue.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
new file mode 100644
index 000000000000..c70f35f82cc5
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_EU_STALL_REGS_H_
+#define _XE_EU_STALL_REGS_H_
+
+#include "regs/xe_reg_defs.h"
+
+#define XEHPC_EUSTALL_BASE			XE_REG_MCR(0xe520)
+#define   XEHPC_EUSTALL_BASE_BUF_ADDR		REG_GENMASK(31, 6)
+#define   XEHPC_EUSTALL_BASE_DSS_BUF_SZ		REG_GENMASK(5, 3)
+#define   XEHPC_EUSTALL_BASE_ENABLE_SAMPLING	REG_BIT(1)
+#define   XEHPC_EUSTALL_BASE_EVICT_TDL_STALL_BUF	REG_BIT(0)
+
+#define XEHPC_EUSTALL_BASE_UPPER		XE_REG_MCR(0xe524)
+
+#define XEHPC_EUSTALL_REPORT			XE_REG_MCR(0xe528)
+#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK	REG_GENMASK(15, 2)
+#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT	2
+#define   XEHPC_EUSTALL_REPORT_OVERFLOW_DROP	REG_BIT(1)
+
+#define XEHPC_EUSTALL_REPORT1			XE_REG_MCR(0xe52c)
+#define   XEHPC_EUSTALL_REPORT1_MASK_SHIFT	16
+#define   XEHPC_EUSTALL_REPORT1_READ_PTR_MASK	REG_GENMASK(15, 2)
+#define   XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT	2
+
+#define XEHPC_EUSTALL_CTRL			XE_REG_MCR(0xe53c)
+#define   EUSTALL_MOCS				REG_GENMASK(9, 3)
+#define   EUSTALL_SAMPLE_RATE			REG_GENMASK(2, 0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_eustall_cntr.c b/drivers/gpu/drm/xe/xe_eustall_cntr.c
new file mode 100644
index 000000000000..183638f8e1e2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eustall_cntr.c
@@ -0,0 +1,1005 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/nospec.h>
+#include <linux/poll.h>
+#include <drm/drm_drv.h>
+#include "xe_gt.h"
+#include "xe_bo.h"
+#include "xe_pm.h"
+#include "xe_trace.h"
+#include "xe_device.h"
+#include "xe_gt_mcr.h"
+#include "xe_gt_topology.h"
+#include "xe_eustall_cntr.h"
+#include "xe_force_wake.h"
+#include "regs/xe_gt_regs.h"
+
+#define CACHELINE_BYTES 64
+#define DEFAULT_POLL_FREQUENCY_HZ 100
+#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
+#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+			     __stringify(x), (long)(x))
+
+extern u32 xe_observation_paranoid;
+
+/**
+ * struct eu_stall_open_properties
+ *
+ * @eu_stall_sampling_rate: Hardware EU stall sampling rate.
+ * @event_report_count: Minimum no of EU stall data rows for poll to set POLLIN.
+ * @eu_stall_buf_sz: Per subslice EU stall data buffer size.
+ * @open_disabled: Should EU stall sampling be disabled at open.
+ * @poll_period: The period in nanoseconds at which the CPU will check for
+ *		 EU stall data in the buffer.
+ * @gt_id: GT ID of the GT on which EU stall data will be captured.
+ */
+struct eu_stall_open_properties {
+	u8 eu_stall_sampling_rate;
+	u32 event_report_count;
+	u32 eu_stall_buf_sz;
+	bool open_disabled;
+	u64 poll_period;
+	u8 gt_id;
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
+void xe_eustall_cntr_init(struct xe_gt *gt)
+{
+	mutex_init(&gt->eu_stall_cntr.lock);
+}
+
+static int set_prop_eu_stall_buffer_size(struct xe_device *xe, u64 value,
+					 struct eu_stall_open_properties *props)
+{
+	if (value != SZ_128K &&
+	    value != SZ_256K &&
+	    value != SZ_512K) {
+		drm_dbg(&xe->drm, "Invalid EU stall buffer size %llu\n", value);
+		return -EINVAL;
+	}
+	props->eu_stall_buf_sz = value;
+	return 0;
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
+	if (value >= XE_MAX_GT_PER_TILE) {
+		drm_dbg(&xe->drm, "Invalid GT ID %llu for EU stall sampling\n", value);
+		return -EINVAL;
+	}
+	props->gt_id = (u8)value;
+	return 0;
+}
+
+static int set_prop_eu_stall_open_disabled(struct xe_device *xe, u64 value,
+					   struct eu_stall_open_properties *props)
+{
+	props->open_disabled = value;
+	return 0;
+}
+
+typedef int (*set_eu_stall_property_fn)(struct xe_device *xe, u64 value,
+					struct eu_stall_open_properties *props);
+
+static const set_eu_stall_property_fn xe_set_eu_stall_property_funcs[] = {
+	[DRM_XE_EU_STALL_PROP_BUF_SZ] = set_prop_eu_stall_buffer_size,
+	[DRM_XE_EU_STALL_PROP_SAMPLE_RATE] = set_prop_eu_stall_sampling_rate,
+	[DRM_XE_EU_STALL_PROP_POLL_PERIOD] = set_prop_eu_stall_poll_period,
+	[DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT] = set_prop_eu_stall_event_report_count,
+	[DRM_XE_EU_STALL_PROP_GT_ID] = set_prop_eu_stall_gt_id,
+	[DRM_XE_EU_STALL_PROP_OPEN_DISABLED] = set_prop_eu_stall_open_disabled,
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
+static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension, int ext_number,
+				       struct eu_stall_open_properties *props)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(xe, ext_number >= DRM_XE_EU_STALL_PROP_MAX))
+		return -E2BIG;
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
+		return xe_eu_stall_user_extensions(xe, ext.next_extension, ++ext_number, props);
+
+	return 0;
+}
+
+/**
+ * buf_data_size - Calculate the number of bytes in a circular buffer
+ *		   of size buf_size given the read and write pointers
+ *		   into the buffer.
+ *
+ * @read_ptr: Read pointer. Uses an additional overflow bit
+ * @write_ptr: Write pointer. Uses an additional overflow bit
+ *
+ * Returns: number of bytes of data in the buffer
+ */
+static u32
+buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
+{
+	u32 read_offset, write_offset, size = 0;
+
+	read_offset = read_ptr & (buf_size - 1);
+	write_offset = write_ptr & (buf_size - 1);
+
+	if (write_offset > read_offset)
+		size = write_offset - read_offset;
+	else
+		size = buf_size - read_offset + write_offset;
+
+	return size;
+}
+
+/**
+ * eu_stall_cntr_buf_check - check for data in the EU stall counter buffer
+ *
+ * @stream: xe EU stall data stream instance
+ *
+ * Returns: true if the EU stall buffer contains minimum stall data as
+ *	    specified by the event report count, else false.
+ */
+static bool
+eu_stall_cntr_buf_check(struct xe_eu_stall_cntr_stream *stream)
+{
+	u32 read_ptr_reg, read_ptr, write_ptr_reg, write_ptr, total_data = 0;
+	u32 buf_size = stream->per_dss_buf_size;
+	struct xe_gt *gt = stream->gt;
+	struct per_dss_buf *dss_buf;
+	bool min_data_present;
+	u16 group, instance;
+	int dss;
+
+	min_data_present = false;
+	for_each_dss_steering(dss, gt, group, instance) {
+		dss_buf = &stream->dss_buf[dss];
+		mutex_lock(&dss_buf->lock);
+		read_ptr = dss_buf->read;
+		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
+						       group, instance);
+		write_ptr = write_ptr_reg & XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK;
+		write_ptr <<= (6 - XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT);
+		write_ptr &= ((buf_size << 1) - 1);
+		/*
+		 * If there has been an engine reset by GuC, and GuC doesn't restore
+		 * the read and write pointer registers, the pointers will reset to 0.
+		 * If so, update the cached read pointer.
+		 */
+		if (unlikely((write_ptr < read_ptr) &&
+			     ((read_ptr & buf_size) == (write_ptr & buf_size)))) {
+			read_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT1,
+							      group, instance);
+			read_ptr = read_ptr_reg & XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
+			read_ptr <<= (6 - XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
+			read_ptr &= ((buf_size << 1) - 1);
+			dss_buf->read = read_ptr;
+		}
+		if ((write_ptr != read_ptr) && !min_data_present) {
+			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
+			/*
+			 * Check if there are at least minimum number of stall data
+			 * rows for poll() to indicate that the data is present.
+			 * Each stall data row is 64B (cacheline size).
+			 */
+			if (num_data_rows(total_data) >= stream->event_report_count)
+				min_data_present = true;
+		}
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			dss_buf->line_drop = true;
+		dss_buf->write = write_ptr;
+		mutex_unlock(&dss_buf->lock);
+	}
+	return min_data_present;
+}
+
+static void
+clear_dropped_eviction_line_bit(struct xe_gt *gt, u8 s, u8 ss)
+{
+	enum xe_platform platform;
+	u32 write_ptr_reg;
+
+	platform = gt_to_xe(gt)->info.platform;
+
+	/* On PVC, the overflow bit has to be cleared by writing 1 to it.
+	 * On other GPUs, the bit has to be cleared by writing 0 to it.
+	 */
+	if (platform == XE_PVC)
+		write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
+	else
+		write_ptr_reg = _MASKED_BIT_DISABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
+	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, s, ss);
+	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_REPORT.__reg).addr,
+			write_ptr_reg, sizeof(write_ptr_reg));
+}
+
+static int
+__xe_eu_stall_buf_read(struct xe_eu_stall_cntr_stream *stream,
+		       char __user *buf, size_t count,
+		       size_t *total_size, struct xe_gt *gt,
+		       u8 s, u8 ss)
+{
+	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	size_t size, buf_size = stream->per_dss_buf_size;
+	u16 flags = 0, subslice = (s * dss_per_grp) + ss;
+	struct drm_xe_eu_stall_data_header header;
+	u32 read_ptr_reg, read_ptr, write_ptr;
+	u8 *dss_start_vaddr, *read_vaddr;
+	u32 read_offset, write_offset;
+	struct per_dss_buf *dss_buf;
+	bool line_drop = false;
+	int ret = 0;
+
+	/* Hardware increments the read and write pointers such that they can
+	 * overflow into one additional bit. For example, a 256KB size buffer
+	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
+	 * write pointers. This technique avoids wasting a slot in the buffer.
+	 * Read and write offsets are calculated from the pointers in order to
+	 * check if the write pointer has wrapped around the array.
+	 */
+	dss_buf = &stream->dss_buf[subslice];
+	mutex_lock(&dss_buf->lock);
+	dss_start_vaddr = dss_buf->vaddr;
+	read_ptr = dss_buf->read;
+	write_ptr = dss_buf->write;
+	line_drop = dss_buf->line_drop;
+	read_offset = read_ptr & (buf_size - 1);
+	write_offset = write_ptr & (buf_size - 1);
+	/*
+	 * If there has been an engine reset by GuC, and GuC doesn't restore
+	 * the read and write pointer registers, the pointers will reset to 0.
+	 * If so, update the cached read pointer.
+	 */
+	if (unlikely((write_ptr < read_ptr) &&
+		     ((read_ptr & buf_size) == (write_ptr & buf_size)))) {
+		read_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT1,
+						      s, ss);
+		read_ptr = read_ptr_reg & XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
+		read_ptr <<= (6 - XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
+		read_ptr &= ((buf_size << 1) - 1);
+		read_offset = read_ptr & (buf_size - 1);
+		dss_buf->read = read_ptr;
+	}
+
+	trace_xe_eu_stall_cntr_read(s, ss, read_ptr, write_ptr,
+				    read_offset, write_offset, *total_size);
+	if (write_ptr == read_ptr) {
+		mutex_unlock(&dss_buf->lock);
+		return 0;
+	}
+
+	/* If write pointer offset is less than the read pointer offset,
+	 * it means, write pointer has wrapped around the array.
+	 */
+	if (write_offset > read_offset)
+		size = write_offset - read_offset;
+	else
+		size = buf_size - read_offset + write_offset;
+
+	/* Read only the data that the user space buffer can accommodate */
+	if ((*total_size + size + sizeof(header)) > count) {
+		mutex_unlock(&dss_buf->lock);
+		return 0;
+	}
+
+	if (line_drop)
+		flags = XE_EU_STALL_FLAG_OVERFLOW_DROP;
+
+	/* Driver doesn't expose the number of C-slices to user space.
+	 * A PVC configuration of 8 c-slices x 8 sub-slices will be
+	 * exposed to the user space as 1 slice x 64 sub-slices.
+	 */
+	header.subslice = subslice;
+	header.flags = flags;
+	header.record_size = CACHELINE_BYTES;
+	header.num_records = size / header.record_size;
+
+	if (copy_to_user((buf + *total_size), &header, sizeof(header))) {
+		mutex_unlock(&dss_buf->lock);
+		return -EFAULT;
+	}
+	*total_size += sizeof(header);
+
+	read_vaddr = dss_start_vaddr + read_offset;
+
+	if (write_offset > read_offset) {
+		if (copy_to_user((buf + *total_size), read_vaddr, size)) {
+			mutex_unlock(&dss_buf->lock);
+			return -EFAULT;
+		}
+	} else {
+		if (copy_to_user((buf + *total_size), read_vaddr, (buf_size - read_offset))) {
+			mutex_unlock(&dss_buf->lock);
+			return -EFAULT;
+		}
+		if (copy_to_user((buf + *total_size), dss_start_vaddr, write_offset)) {
+			mutex_unlock(&dss_buf->lock);
+			return -EFAULT;
+		}
+	}
+
+	*total_size += size;
+	read_ptr += size;
+
+	/* Read pointer can overflow into one additional bit */
+	read_ptr &= ((buf_size << 1) - 1);
+	read_ptr_reg = ((read_ptr >> 6) << XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
+	read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
+	read_ptr_reg |= (XEHPC_EUSTALL_REPORT1_READ_PTR_MASK <<
+			 XEHPC_EUSTALL_REPORT1_MASK_SHIFT);
+	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, s, ss);
+	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_REPORT1.__reg).addr,
+			read_ptr_reg, sizeof(read_ptr_reg));
+	if (dss_buf->line_drop) {
+		clear_dropped_eviction_line_bit(gt, s, ss);
+		dss_buf->line_drop = false;
+	}
+	dss_buf->read = read_ptr;
+	mutex_unlock(&dss_buf->lock);
+	trace_xe_eu_stall_cntr_read(s, ss, read_ptr, write_ptr,
+				    read_offset, write_offset, *total_size);
+	return ret;
+}
+
+/**
+ * xe_eu_stall_buf_read_locked - copy EU stall counters data from the
+ *				   per dss buffers to the userspace buffer
+ * @stream: A stream opened for EU stall count metrics
+ * @buf: destination buffer given by userspace
+ * @count: the number of bytes userspace wants to read
+ * @ppos: (inout) file seek position (unused)
+ *
+ * Returns: Number of bytes copied or a negative error code
+ * If we've successfully copied any data then reporting that takes
+ * precedence over any internal error status, so the data isn't lost.
+ */
+static ssize_t
+xe_eu_stall_buf_read_locked(struct xe_eu_stall_cntr_stream *stream,
+			    struct file *file, char __user *buf,
+			    size_t count, loff_t *ppos)
+{
+	struct xe_gt *gt = stream->gt;
+	size_t total_size = 0;
+	u16 group, instance;
+	int ret = 0, dss;
+
+	if (count == 0)
+		return -EINVAL;
+
+	for_each_dss_steering(dss, gt, group, instance) {
+		ret = __xe_eu_stall_buf_read(stream, buf, count, &total_size,
+					     gt, group, instance);
+		if (ret || count == total_size)
+			goto exit;
+	}
+exit:
+	if (total_size)
+		return total_size;
+	else if (ret)
+		return ret;
+	else
+		return -EAGAIN;
+}
+
+static void
+free_eu_stall_cntr_buf(struct xe_eu_stall_cntr_stream *stream)
+{
+	if (stream->bo) {
+		xe_bo_unpin_map_no_vm(stream->bo);
+		stream->vaddr = NULL;
+		stream->bo = NULL;
+	}
+	destroy_workqueue(stream->buf_check_wq);
+}
+
+static int alloc_eu_stall_cntr_buf(struct xe_eu_stall_cntr_stream *stream,
+				   u32 per_dss_buf_size)
+{
+	struct xe_tile *tile = stream->gt->tile;
+	struct xe_gt *gt = stream->gt;
+	struct xe_bo *bo;
+	u32 size;
+	int ret = 0;
+	unsigned int last_dss;
+	xe_dss_mask_t all_dss;
+
+	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+	/*
+	 * Enabled subslices can be discontiguous. Find the last subslice
+	 * and calculate total buffer size based on that.
+	 * intel_sseu_highest_xehp_dss returns zero based position.
+	 * Therefore the result is incremented.
+	 */
+	last_dss = xe_dss_mask_last_dss(all_dss);
+	size = per_dss_buf_size * (last_dss + 1);
+
+	bo = xe_bo_create_pin_map(tile->xe, tile, NULL,
+				  size, ttm_bo_type_kernel,
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				  XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo))
+		ret = PTR_ERR(bo);
+
+	stream->bo = bo;
+	stream->vaddr = bo->vmap.is_iomem ? bo->vmap.vaddr_iomem : bo->vmap.vaddr;
+
+	return ret;
+}
+
+static u32
+gen_eustall_base(struct xe_eu_stall_cntr_stream *stream, bool enable)
+{
+	u32 val = xe_bo_ggtt_addr(stream->bo);
+	u32 sz;
+
+	XE_WARN_ON(!IS_ALIGNED(val, 64));
+
+	switch (stream->per_dss_buf_size) {
+	case SZ_128K:
+		sz = 0;
+		break;
+	case SZ_256K:
+		sz = 1;
+		break;
+	case SZ_512K:
+		sz = 2;
+		break;
+	default:
+		MISSING_CASE(stream->per_dss_buf_size);
+		sz = 2;
+	}
+
+	val |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_DSS_BUF_SZ, sz);
+	if (enable)
+		val |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
+
+	return val;
+}
+
+static void
+xe_eu_stall_stream_enable(struct xe_eu_stall_cntr_stream *stream)
+{
+	struct xe_gt *gt = stream->gt;
+	enum xe_platform platform;
+	u32 reg_value;
+
+	platform = gt_to_xe(gt)->info.platform;
+
+	/* Take runtime pm ref and forcewake to disable RC6 */
+	xe_pm_runtime_get(gt_to_xe(gt));
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+
+	/*
+	 * Wa_22016596838:pvc
+	 * Disable EU DOP gating for PVC.
+	 */
+	if (platform == XE_PVC)
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
+
+	reg_value = gen_eustall_base(stream, true);
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
+	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
+			reg_value, sizeof(reg_value));
+}
+
+static void
+xe_eu_stall_stream_disable(struct xe_eu_stall_cntr_stream *stream)
+{
+	struct xe_gt *gt = stream->gt;
+	enum xe_platform platform;
+	u16 group, instance;
+	u32 reg_value;
+	int dss;
+
+	platform = gt_to_xe(gt)->info.platform;
+
+	/*
+	 * Before disabling EU stall sampling, check if any of the
+	 * XEHPC_EUSTALL_REPORT registers have the drop bit set. If set,
+	 * clear the bit. If the user space application reads all the
+	 * stall data, the drop bit would be cleared during the read.
+	 * But if there is any unread data and the drop bit is set for
+	 * any subslice, the drop bit would continue to be set even
+	 * after disabling EU stall sampling and may cause erroneous
+	 * stall data in the subsequent stall data sampling run.
+	 */
+	for_each_dss_steering(dss, gt, group, instance) {
+		reg_value = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
+						   group, instance);
+		if (reg_value & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			clear_dropped_eviction_line_bit(gt, group, instance);
+	}
+	reg_value = gen_eustall_base(stream, false);
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
+	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
+			reg_value, sizeof(reg_value));
+
+	/* Wa_22016596838:pvc */
+	if (platform == XE_PVC)
+		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
+					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_pm_runtime_put(gt_to_xe(gt));
+}
+
+static void eu_stall_buf_check_work_fn(struct work_struct *work)
+{
+	struct xe_eu_stall_cntr_stream *stream =
+		container_of(work, typeof(*stream), buf_check_work);
+
+	if (eu_stall_cntr_buf_check(stream)) {
+		stream->pollin = true;
+		wake_up(&stream->poll_wq);
+	}
+}
+
+static enum
+hrtimer_restart eu_stall_poll_check_timer_cb(struct hrtimer *hrtimer)
+{
+	struct xe_eu_stall_cntr_stream *stream =
+		container_of(hrtimer, typeof(*stream), poll_check_timer);
+
+	queue_work(stream->buf_check_wq, &stream->buf_check_work);
+	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period));
+
+	return HRTIMER_RESTART;
+}
+
+static int xe_eu_stall_stream_init(struct xe_eu_stall_cntr_stream *stream,
+				   struct eu_stall_open_properties *props)
+{
+	u32 write_ptr_reg, write_ptr, read_ptr_reg;
+	u32 vaddr_offset, reg_value;
+	struct xe_gt *gt = stream->gt;
+	struct per_dss_buf *dss_buf;
+	u16 group, instance;
+	int ret, dss;
+
+	init_waitqueue_head(&stream->poll_wq);
+	INIT_WORK(&stream->buf_check_work, eu_stall_buf_check_work_fn);
+	stream->buf_check_wq = alloc_ordered_workqueue("xe_eustall_cntr", 0);
+	if (!stream->buf_check_wq)
+		return -ENOMEM;
+	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	stream->poll_check_timer.function = eu_stall_poll_check_timer_cb;
+	stream->event_report_count = props->event_report_count;
+	stream->per_dss_buf_size = props->eu_stall_buf_sz;
+	stream->poll_period = props->poll_period;
+
+	ret = alloc_eu_stall_cntr_buf(stream, props->eu_stall_buf_sz);
+	if (ret)
+		return ret;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+
+	reg_value = gen_eustall_base(stream, false);
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
+	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_BASE.__reg).addr,
+			reg_value, sizeof(reg_value));
+	/* GGTT addresses can never be > 32 bits */
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE_UPPER, 0);
+	reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
+				  REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
+				  REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
+						 props->eu_stall_sampling_rate));
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_CTRL, reg_value);
+	trace_xe_reg_rw(gt, true, (XEHPC_EUSTALL_CTRL.__reg).addr,
+			reg_value, sizeof(reg_value));
+
+	for_each_dss_steering(dss, gt, group, instance) {
+		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
+						       group, instance);
+		write_ptr = write_ptr_reg & XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK;
+		write_ptr <<= (6 - XEHPC_EUSTALL_REPORT_WRITE_PTR_SHIFT);
+		write_ptr &= ((stream->per_dss_buf_size << 1) - 1);
+		read_ptr_reg = write_ptr >> (6 - XEHPC_EUSTALL_REPORT1_READ_PTR_SHIFT);
+		read_ptr_reg &= XEHPC_EUSTALL_REPORT1_READ_PTR_MASK;
+		read_ptr_reg |= (XEHPC_EUSTALL_REPORT1_READ_PTR_MASK <<
+				 XEHPC_EUSTALL_REPORT1_MASK_SHIFT);
+		xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1,
+					read_ptr_reg, group, instance);
+		dss_buf = &stream->dss_buf[dss];
+		vaddr_offset = dss * props->eu_stall_buf_sz;
+		dss_buf->vaddr = stream->vaddr + vaddr_offset;
+		dss_buf->write = write_ptr;
+		dss_buf->read = write_ptr;
+		dss_buf->line_drop = false;
+		mutex_init(&dss_buf->lock);
+	}
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_pm_runtime_put(gt_to_xe(gt));
+	return 0;
+}
+
+/**
+ * xe_eu_stall_buf_read - handles read FOP for xe EU stall cntr stream FDs
+ * @file: An xe EU stall cntr stream file
+ * @buf: destination buffer given by userspace
+ * @count: the number of bytes userspace wants to read
+ * @ppos: (inout) file seek position (unused)
+ *
+ * Returns: The number of bytes copied or a negative error code on failure.
+ */
+static ssize_t xe_eu_stall_buf_read(struct file *file, char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	struct xe_eu_stall_cntr_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+	ssize_t ret;
+
+	if (!stream->enabled)
+		return -EIO;
+
+	if (!(file->f_flags & O_NONBLOCK)) {
+		do {
+			if (!stream->pollin) {
+				ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
+				if (ret)
+					return -EINTR;
+			}
+
+			mutex_lock(&gt->eu_stall_cntr.lock);
+			ret = xe_eu_stall_buf_read_locked(stream, file, buf, count, ppos);
+			mutex_unlock(&gt->eu_stall_cntr.lock);
+		} while (ret == -EAGAIN);
+	} else {
+		mutex_lock(&gt->eu_stall_cntr.lock);
+		ret = xe_eu_stall_buf_read_locked(stream, file, buf, count, ppos);
+		mutex_unlock(&gt->eu_stall_cntr.lock);
+	}
+
+	stream->pollin = false;
+
+	return ret;
+}
+
+static __poll_t
+xe_eu_stall_buf_poll_locked(struct xe_eu_stall_cntr_stream *stream,
+			    struct file *file, poll_table *wait)
+{
+	__poll_t events = 0;
+
+	poll_wait(file, &stream->poll_wq, wait);
+
+	if (stream->pollin)
+		events |= EPOLLIN;
+
+	return events;
+}
+
+static __poll_t
+xe_eu_stall_buf_poll(struct file *file, poll_table *wait)
+{
+	struct xe_eu_stall_cntr_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+	__poll_t ret;
+
+	mutex_lock(&gt->eu_stall_cntr.lock);
+	ret = xe_eu_stall_buf_poll_locked(stream, file, wait);
+	mutex_unlock(&gt->eu_stall_cntr.lock);
+
+	return ret;
+}
+
+static void
+xe_eu_stall_cntr_enable_locked(struct xe_eu_stall_cntr_stream *stream)
+{
+	if (stream->enabled)
+		return;
+
+	stream->enabled = true;
+
+	xe_eu_stall_stream_enable(stream);
+	hrtimer_start(&stream->poll_check_timer,
+		      ns_to_ktime(stream->poll_period),
+		      HRTIMER_MODE_REL);
+}
+
+static void
+xe_eu_stall_cntr_disable_locked(struct xe_eu_stall_cntr_stream *stream)
+{
+	if (!stream->enabled)
+		return;
+
+	stream->enabled = false;
+
+	hrtimer_cancel(&stream->poll_check_timer);
+	flush_workqueue(stream->buf_check_wq);
+	xe_eu_stall_stream_disable(stream);
+}
+
+static long
+xe_eu_stall_cntr_ioctl_locked(struct xe_eu_stall_cntr_stream *stream,
+			      unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
+		xe_eu_stall_cntr_enable_locked(stream);
+		return 0;
+	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
+		xe_eu_stall_cntr_disable_locked(stream);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * xe_eu_stall_cntr_ioctl - support ioctl() usage with xe EU stall counter
+ *								stream FDs
+ * @file: An xe EU stall cntr stream file
+ * @cmd: the ioctl request
+ * @arg: the ioctl data
+ *
+ * Implementation deferred to xe_eu_stall_cntr_ioctl_locked().
+ *
+ * Returns: zero on success or a negative error code. Returns -EINVAL for
+ * an unknown ioctl request.
+ */
+static long xe_eu_stall_cntr_ioctl(struct file *file,
+				   unsigned int cmd,
+				   unsigned long arg)
+{
+	struct xe_eu_stall_cntr_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+	long ret;
+
+	mutex_lock(&gt->eu_stall_cntr.lock);
+	ret = xe_eu_stall_cntr_ioctl_locked(stream, cmd, arg);
+	mutex_unlock(&gt->eu_stall_cntr.lock);
+
+	return ret;
+}
+
+static void
+xe_eu_stall_destroy_locked(struct xe_eu_stall_cntr_stream *stream)
+{
+	xe_eu_stall_cntr_disable_locked(stream);
+	free_eu_stall_cntr_buf(stream);
+}
+
+/**
+ * xe_eu_stall_release - handles userspace close() of a EU stall data
+ *			   stream file.
+ * @inode: anonymous inode associated with file
+ * @file: An xe EU stall stream file
+ *
+ * Cleans up any resources associated with an open EU stall data stream file.
+ */
+static int xe_eu_stall_release(struct inode *inode, struct file *file)
+{
+	struct xe_eu_stall_cntr_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+
+	mutex_lock(&gt->eu_stall_cntr.lock);
+	xe_eu_stall_destroy_locked(stream);
+	kfree(stream);
+	gt->eu_stall_cntr.stream = NULL;
+	mutex_unlock(&gt->eu_stall_cntr.lock);
+
+	/* Release the reference the EU stall stream kept on the driver */
+	drm_dev_put(&gt->tile->xe->drm);
+
+	return 0;
+}
+
+static const struct file_operations fops_eu_stall = {
+	.owner		= THIS_MODULE,
+	.llseek		= no_llseek,
+	.release	= xe_eu_stall_release,
+	.poll		= xe_eu_stall_buf_poll,
+	.read		= xe_eu_stall_buf_read,
+	.unlocked_ioctl = xe_eu_stall_cntr_ioctl,
+	.compat_ioctl   = xe_eu_stall_cntr_ioctl,
+};
+
+/**
+ * xe_open_eu_stall_stream_locked - Open a EU stall data stream FD.
+ * @dev: drm device instance
+ * @props: individually validated u64 property value pairs
+ * @file: drm file
+ * @gt: GT from which the EU stall data will be captured
+ *
+ * Returns: zero on success or a negative error code.
+ */
+static int
+xe_open_eu_stall_stream_locked(struct drm_device *dev,
+			       struct eu_stall_open_properties *props,
+			       struct drm_file *file,
+			       struct xe_gt *gt)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_eu_stall_cntr_stream *stream;
+	unsigned long f_flags = 0;
+	xe_dss_mask_t all_dss;
+	int ret, stream_fd;
+	u32 tile_buf_size;
+
+	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+
+	if (xe_observation_paranoid && !perfmon_capable()) {
+		drm_dbg(&xe->drm, "Insufficient privileges for EU stall monitoring\n");
+		return -EACCES;
+	}
+
+	/* Only one session can be active at any time */
+	if (gt->eu_stall_cntr.stream) {
+		drm_dbg(&xe->drm, "EU stall cntr session already active\n");
+		return -EBUSY;
+	}
+
+	tile_buf_size = props->eu_stall_buf_sz * (xe_dss_mask_last_dss(all_dss) + 1);
+	if (props->event_report_count > num_data_rows(tile_buf_size)) {
+		drm_dbg(&xe->drm, "Invalid EU stall data poll event report count %u\n",
+			props->event_report_count);
+		drm_dbg(&xe->drm, "Maximum event report count for the given buffer size is %u\n",
+			num_data_rows(tile_buf_size));
+		return -EINVAL;
+	}
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	gt->eu_stall_cntr.stream = stream;
+	stream->gt = gt;
+
+	ret = xe_eu_stall_stream_init(stream, props);
+	if (ret) {
+		drm_dbg(&xe->drm, "EU stall stream init failed : %d\n", ret);
+		goto err_alloc;
+	}
+
+	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall,
+				     stream, f_flags);
+	if (stream_fd < 0) {
+		ret = stream_fd;
+		drm_dbg(&xe->drm, "EU stall inode get fd failed : %d\n", ret);
+		goto err_open;
+	}
+
+	if (!props->open_disabled)
+		xe_eu_stall_cntr_enable_locked(stream);
+
+	/* Take a reference on the driver that will be kept with stream_fd
+	 * until its release.
+	 */
+	drm_dev_get(&gt->tile->xe->drm);
+
+	return stream_fd;
+
+err_open:
+	free_eu_stall_cntr_buf(stream);
+err_alloc:
+	gt->eu_stall_cntr.stream = NULL;
+	kfree(stream);
+	return ret;
+}
+
+int xe_open_eu_stall_stream(struct drm_device *dev,
+			    u64 data,
+			    struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct eu_stall_open_properties props;
+	struct xe_gt *gt;
+	int ret;
+
+	memset(&props, 0, sizeof(struct eu_stall_open_properties));
+
+	/* Set default values */
+	props.gt_id = 0;
+	props.eu_stall_buf_sz = SZ_256K;
+	props.eu_stall_sampling_rate = 4;
+	props.poll_period = DEFAULT_POLL_PERIOD_NS;
+	props.event_report_count = 1;
+
+	ret = xe_eu_stall_user_extensions(xe, data, 0, &props);
+	if (ret)
+		return ret;
+
+	gt = xe_device_get_gt(xe, props.gt_id);
+	if (!gt) {
+		drm_dbg(&xe->drm, "Invalid GT for EU stall sampling \n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&gt->eu_stall_cntr.lock);
+	ret = xe_open_eu_stall_stream_locked(dev, &props, file, gt);
+	mutex_unlock(&gt->eu_stall_cntr.lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_eustall_cntr.h b/drivers/gpu/drm/xe/xe_eustall_cntr.h
new file mode 100644
index 000000000000..7a99b8c819d3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eustall_cntr.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __XE_EUSTALL_CNTR_H__
+#define __XE_EUSTALL_CNTR_H__
+
+#include <drm/drm_file.h>
+#include <drm/xe_drm.h>
+#include "regs/xe_eu_stall_regs.h"
+
+#define XE_MAX_DSS	128
+
+struct per_dss_buf {
+	u8 *vaddr;
+	u32 write;
+	u32 read;
+	bool line_drop;
+	/* lock to protect read and write pointers */
+	struct mutex lock;
+};
+
+/**
+ * struct xe_eu_stall_cntr_stream - state of EU stall counter stream FD
+ */
+struct xe_eu_stall_cntr_stream {
+	struct xe_bo *bo;
+	struct xe_gt *gt;
+
+	bool enabled;
+	bool pollin;
+	size_t per_dss_buf_size;
+	struct hrtimer poll_check_timer;
+	struct work_struct buf_check_work;
+	struct workqueue_struct *buf_check_wq;
+	wait_queue_head_t poll_wq;
+	u32 event_report_count;
+	u64 poll_period;
+
+	/**
+	 * State of the EU stall counter buffer.
+	 */
+	u8 *vaddr;
+	struct per_dss_buf dss_buf[XE_MAX_DSS];
+};
+
+struct xe_eu_stall_cntr_gt {
+	/* Lock to protect stream */
+	struct mutex lock;
+
+	/* Execution Unit (EU) stall counter stream */
+	struct xe_eu_stall_cntr_stream *stream;
+};
+
+void xe_eustall_cntr_init(struct xe_gt *gt);
+
+int xe_open_eu_stall_stream(struct drm_device *dev,
+			    u64 data,
+			    struct drm_file *file);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index ce8994b808fe..74f4205a6d60 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -61,6 +61,7 @@
 #include "xe_vm.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
+#include "xe_eustall_cntr.h"
 
 static void gt_fini(struct drm_device *drm, void *arg)
 {
@@ -622,6 +623,8 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_gt_record_user_engines(gt);
 
+	xe_eustall_cntr_init(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 25ff03ab8448..54a57179a53c 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -247,6 +247,15 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
 }
 
+/*
+ * Used to obtain the index of the last DSS.
+ */
+unsigned int
+xe_dss_mask_last_dss(const xe_dss_mask_t mask)
+{
+	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
+}
+
 bool xe_dss_mask_empty(const xe_dss_mask_t mask)
 {
 	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 746b325bbf6e..7ee022784397 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -28,6 +28,9 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 unsigned int
 xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
 
+unsigned int
+xe_dss_mask_last_dss(const xe_dss_mask_t mask);
+
 bool xe_dss_mask_empty(const xe_dss_mask_t mask);
 
 bool
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6b5e0b45efb0..609db0154122 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -16,6 +16,7 @@
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
+#include "xe_eustall_cntr.h"
 
 struct xe_exec_queue_ops;
 struct xe_migrate;
@@ -391,6 +392,9 @@ struct xe_gt {
 
 	/** @oa: oa observation subsystem per gt info */
 	struct xe_oa_gt oa;
+
+	/** @eu_stall_cntr: EU stall counters subsystem per gt info */
+	struct xe_eu_stall_cntr_gt eu_stall_cntr;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
index fcb584b42a7d..5db9c589ce24 100644
--- a/drivers/gpu/drm/xe/xe_observation.c
+++ b/drivers/gpu/drm/xe/xe_observation.c
@@ -8,6 +8,7 @@
 
 #include <drm/xe_drm.h>
 
+#include "xe_eustall_cntr.h"
 #include "xe_oa.h"
 #include "xe_observation.h"
 
@@ -29,6 +30,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_observation_param *
 	}
 }
 
+static int xe_eu_stall_ioctl(struct drm_device *dev, struct drm_xe_observation_param *arg,
+			     struct drm_file *file)
+{
+	switch (arg->observation_op) {
+	case DRM_XE_OBSERVATION_OP_STREAM_OPEN:
+		return xe_open_eu_stall_stream(dev, arg->param, file);
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
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 09ca1ad057b0..ef532eae3f88 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -374,6 +374,41 @@ TRACE_EVENT(xe_reg_rw,
 		  (u32)(__entry->val >> 32))
 );
 
+TRACE_EVENT(xe_eu_stall_cntr_read,
+	    TP_PROTO(u8 slice, u8 subslice,
+		     u32 read_ptr, u32 write_ptr,
+		     u32 read_offset, u32 write_offset,
+		     size_t total_size),
+	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
+		    read_offset, write_offset, total_size),
+
+	    TP_STRUCT__entry(
+			     __field(u8, slice)
+			     __field(u8, subslice)
+			     __field(u32, read_ptr)
+			     __field(u32, write_ptr)
+			     __field(u32, read_offset)
+			     __field(u32, write_offset)
+			     __field(size_t, total_size)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->slice = slice;
+			   __entry->subslice = subslice;
+			   __entry->read_ptr = read_ptr;
+			   __entry->write_ptr = write_ptr;
+			   __entry->read_offset = read_offset;
+			   __entry->write_offset = write_offset;
+			   __entry->total_size = total_size;
+			   ),
+
+	    TP_printk("slice:%u subslice:%u readptr:0x%x writeptr:0x%x read off:%u write off:%u size:%zu ",
+		      __entry->slice, __entry->subslice,
+		      __entry->read_ptr, __entry->write_ptr,
+		      __entry->read_offset, __entry->write_offset,
+		      __entry->total_size)
+);
+
 #endif
 
 /* This part must be outside protection */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 19619d4952a8..343de700d10d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1387,6 +1387,8 @@ struct drm_xe_wait_user_fence {
 enum drm_xe_observation_type {
 	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
 	DRM_XE_OBSERVATION_TYPE_OA,
+	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
+	DRM_XE_OBSERVATION_TYPE_EU_STALL,
 };
 
 /**
@@ -1686,6 +1688,81 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * enum drm_xe_eu_stall_property_id - EU stall data stream property ids.
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
+	 * @DRM_XE_EU_STALL_PROP_BUF_SZ: Per DSS Memory Buffer Size.
+	 * Valid values are 128 KB, 256 KB, and 512 KB.
+	 */
+	DRM_XE_EU_STALL_PROP_BUF_SZ = 1,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
+	 * in multiples of 251 cycles. Valid values are 1 to 7.
+	 * If the value is 1, sampling interval is 251 cycles.
+	 * If the value is 7, sampling interval is 7 x 251 cycles.
+	 */
+	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
+	 * poll period in nanoseconds. should be at least 100000 ns.
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
+
+	/**
+	 * @DRM_XE_EU_STALL_PROP_OPEN_DISABLED: A value of 1 will open
+	 * the EU stall data stream without enabling EU stall sampling.
+	 */
+	DRM_XE_EU_STALL_PROP_OPEN_DISABLED,
+
+	DRM_XE_EU_STALL_PROP_MAX
+};
+
+/**
+ * struct drm_xe_eu_stall_data_header - EU stall data header.
+ * Header with additional information that the driver adds
+ * before EU stall data of each subslice during read().
+ */
+struct drm_xe_eu_stall_data_header {
+	/** @subslice: subslice number from which the following data
+	 * has been captured.
+	 */
+	__u16 subslice;
+	/** @flags: flags */
+	__u16 flags;
+/* EU stall data dropped by the HW due to memory buffer being full */
+#define XE_EU_STALL_FLAG_OVERFLOW_DROP	(1 << 0)
+	/** @record_size: size of each EU stall data record */
+	__u16 record_size;
+	/** @num_records: number of records following the header */
+	__u16 num_records;
+	/** @reserved: Reserved */
+	__u16 reserved[4];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

