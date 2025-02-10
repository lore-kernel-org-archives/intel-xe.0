Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75657C021A5
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 13:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1B810E558;
	Mon, 10 Feb 2025 13:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WW8VOJwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2F510E1C3
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739195218; x=1770731218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bOm8ddqujbT0hKFt/kKFM8VM0+n0qGS8qprrCTSEO1A=;
 b=WW8VOJwuYNGJCaGJcLSuyF+8JfTjncrKs1XMms6LjgKrOgrvEEiHht75
 ojL4lBNDBlNVjnWXbYuTW5sIWVkg4WKfOYAA1DngyvyRZgCu1FO9uvgwL
 jtS4uVDH9h40MVIAxA6JciK1pnwYcQz0IYmI17+bokDBwjFnrvi/lIW4U
 fFYz7C7d85g1kuhl+qk7FvSN3kjtXHYyBPJcDfHzpUnmeCGLiPdvTtbd3
 I2WoEBCUugMn4Blj8joxettHGPj02yFr9kEX83KLG9zqiJx/8WRAmwOy0
 5KyopukopTAbyHcEM2lTab0SLiS2lxTgXvlhoYs//PQBgs9ERLOjpktA+ w==;
X-CSE-ConnectionGUID: cA/8l9f3TR+VpFjaH8nWwQ==
X-CSE-MsgGUID: k5iUJ94HQbmI6jcs1AWWvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27378422"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="27378422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
X-CSE-ConnectionGUID: DQqo26/uQTSrpARR4iv79w==
X-CSE-MsgGUID: teVGkzkUT3eyPsO8c/zzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149386839"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v9 3/8] drm/xe/eustall: Add support to init,
 enable and disable EU stall sampling
Date: Mon, 10 Feb 2025 05:46:44 -0800
Message-ID: <724540fe6e68526abc8a271d500f5a8a84acc0a9.1739193510.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739193510.git.harish.chegondi@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
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

Implement EU stall sampling APIs introduced in the previous patch for
Xe_HPC (PVC). Add register definitions and the code that accesses these
registers to the APIs.

Add initialization and clean up functions and their implementations,
EU stall enable and disable functions.

v9: Moved structure definitions from xe_eu_stall.h to xe_eu_stall.c
    Moved read and poll implementations to the next patch
    Used xe_bo_create_pin_map_at_aligned instead of xe_bo_create_pin_map
    Changed lock names as per review feedback
    Moved drop data handling into a subsequent patch
    Moved code around as per review feedback
v8: Updated copyright year in xe_eu_stall_regs.h to 2025.
    Renamed struct drm_xe_eu_stall_data_pvc to struct xe_eu_stall_data_pvc
    since it is a local structure.
v6: Fix buffer wrap around over write bug (Matt Olson)

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |  29 ++
 drivers/gpu/drm/xe/xe_eu_stall.c           | 379 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eu_stall.h           |   7 +-
 drivers/gpu/drm/xe/xe_gt.c                 |   6 +
 drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
 5 files changed, 408 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
new file mode 100644
index 000000000000..c53f57fdde65
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_EU_STALL_REGS_H_
+#define _XE_EU_STALL_REGS_H_
+
+#include "regs/xe_reg_defs.h"
+
+#define XEHPC_EUSTALL_BASE			XE_REG_MCR(0xe520)
+#define   XEHPC_EUSTALL_BASE_BUF_ADDR		REG_GENMASK(31, 6)
+#define   XEHPC_EUSTALL_BASE_XECORE_BUF_SZ	REG_GENMASK(5, 3)
+#define   XEHPC_EUSTALL_BASE_ENABLE_SAMPLING	REG_BIT(1)
+
+#define XEHPC_EUSTALL_BASE_UPPER		XE_REG_MCR(0xe524)
+
+#define XEHPC_EUSTALL_REPORT			XE_REG_MCR(0xe528, XE_REG_OPTION_MASKED)
+#define   XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK	REG_GENMASK(15, 2)
+#define   XEHPC_EUSTALL_REPORT_OVERFLOW_DROP	REG_BIT(1)
+
+#define XEHPC_EUSTALL_REPORT1			XE_REG_MCR(0xe52c, XE_REG_OPTION_MASKED)
+#define   XEHPC_EUSTALL_REPORT1_READ_PTR_MASK	REG_GENMASK(15, 2)
+
+#define XEHPC_EUSTALL_CTRL			XE_REG_MCR(0xe53c, XE_REG_OPTION_MASKED)
+#define   EUSTALL_MOCS				REG_GENMASK(9, 3)
+#define   EUSTALL_SAMPLE_RATE			REG_GENMASK(2, 0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 0ceb3091f81e..12afa9720971 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -8,17 +8,57 @@
 #include <linux/poll.h>
 #include <linux/types.h>
 
+#include <drm/drm_drv.h>
 #include <uapi/drm/xe_drm.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_eu_stall.h"
+#include "xe_force_wake.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_topology.h"
 #include "xe_macros.h"
 #include "xe_observation.h"
+#include "xe_pm.h"
+
+#include "regs/xe_eu_stall_regs.h"
+#include "regs/xe_gt_regs.h"
+
+#define POLL_PERIOD_MS	10
 
 static size_t per_xecore_buf_size = SZ_512K;
 
+struct per_xecore_buf {
+	/* Buffer vaddr */
+	u8 *vaddr;
+	/* Write pointer */
+	u32 write;
+	/* Read pointer */
+	u32 read;
+	/* lock to protect read and write pointers */
+	struct mutex ptr_lock;
+};
+
+struct xe_eu_stall_data_stream {
+	bool enabled;
+	size_t data_record_size;
+	size_t per_xecore_buf_size;
+	unsigned int wait_num_reports;
+	unsigned int sampling_rate_mult;
+
+	struct xe_gt *gt;
+	struct xe_bo *bo;
+	struct per_xecore_buf *xecore_buf;
+};
+
+struct xe_eu_stall_gt {
+	/* Lock to protect stream */
+	struct mutex stream_lock;
+	/* EU stall data stream */
+	struct xe_eu_stall_data_stream *stream;
+};
+
 /**
  * struct eu_stall_open_properties - EU stall sampling properties received
  *				     from user space at open.
@@ -33,6 +73,47 @@ struct eu_stall_open_properties {
 	struct xe_gt *gt;
 };
 
+/**
+ * struct xe_eu_stall_data_pvc - EU stall data format for PVC
+ *			Bits		Field
+ * @ip_addr:		0  to 28	IP (addr)
+ * @active_count:	29 to 36	active count
+ * @other_count:	37 to 44	other count
+ * @control_count:	45 to 52	control count
+ * @pipestall_count:	53 to 60	pipestall count
+ * @send_count:		61 to 68	send count
+ * @dist_acc_count:	69 to 76	dist_acc count
+ * @sbid_count:		77 to 84	sbid count
+ * @sync_count:		85 to 92	sync count
+ * @inst_fetch_count:	93 to 100	inst_fetch count
+ * @unused_bits:	101 to 127	unused bits
+ * @unused:		remaining	unused bytes
+ */
+struct xe_eu_stall_data_pvc {
+	__u64 ip_addr:29;
+	__u64 active_count:8;
+	__u64 other_count:8;
+	__u64 control_count:8;
+	__u64 pipestall_count:8;
+	__u64 send_count:8;
+	__u64 dist_acc_count:8;
+	__u64 sbid_count:8;
+	__u64 sync_count:8;
+	__u64 inst_fetch_count:8;
+	__u64 unused_bits:27;
+	__u64 unused[6];
+} __packed;
+
+static size_t xe_eu_stall_data_record_size(struct xe_device *xe)
+{
+	unsigned long record_size = 0;
+
+	if (xe->info.platform == XE_PVC)
+		record_size = sizeof(struct xe_eu_stall_data_pvc);
+
+	return record_size;
+}
+
 /**
  * num_data_rows - Return the number of EU stall data rows of 64B each
  *		   for a given data size.
@@ -44,6 +125,36 @@ static u32 num_data_rows(u32 data_size)
 	return (data_size >> 6);
 }
 
+/**
+ * xe_eu_stall_init() - Allocate and initialize GT level EU stall data
+ *			structure xe_eu_stall_gt within struct xe_gt.
+ *
+ * @gt: GT being initialized.
+ *
+ * Returns: zero on success or a negative error code.
+ */
+int xe_eu_stall_init(struct xe_gt *gt)
+{
+	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
+	if (!gt->eu_stall)
+		return -ENOMEM;
+
+	mutex_init(&gt->eu_stall->stream_lock);
+	return 0;
+}
+
+/**
+ * xe_eu_stall_fini() - Clean up the GT level EU stall data
+ *			structure xe_eu_stall_gt within struct xe_gt.
+ *
+ * @gt: GT being cleaned up.
+ */
+void xe_eu_stall_fini(struct xe_gt *gt)
+{
+	mutex_destroy(&gt->eu_stall->stream_lock);
+	kfree(gt->eu_stall);
+}
+
 static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
 					   struct eu_stall_open_properties *props)
 {
@@ -166,6 +277,120 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 	return ret;
 }
 
+static void free_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream)
+{
+	if (stream->bo)
+		xe_bo_unpin_map_no_vm(stream->bo);
+}
+
+static int alloc_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream,
+				   u16 num_xecore)
+{
+	struct xe_tile *tile = stream->gt->tile;
+	struct xe_bo *bo;
+	u32 size;
+
+	size = stream->per_xecore_buf_size * num_xecore;
+
+	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
+					     size, ~0ull, ttm_bo_type_kernel,
+					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	XE_WARN_ON(!IS_ALIGNED(xe_bo_ggtt_addr(bo), SZ_64));
+	stream->bo = bo;
+
+	return 0;
+}
+
+static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
+{
+	u32 write_ptr_reg, write_ptr, read_ptr_reg, reg_value;
+	struct per_xecore_buf *xecore_buf;
+	struct xe_gt *gt = stream->gt;
+	u16 group, instance;
+	unsigned int fw_ref;
+	int xecore;
+
+	/* Take runtime pm ref and forcewake to disable RC6 */
+	xe_pm_runtime_get(gt_to_xe(gt));
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_RENDER);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_RENDER)) {
+		xe_gt_err(gt, "Failed to get RENDER forcewake\n");
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
+		xe_pm_runtime_put(gt_to_xe(gt));
+		return -ETIMEDOUT;
+	}
+
+	for_each_dss_steering(xecore, gt, group, instance) {
+		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
+		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
+		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
+		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
+		/* Initialize the read pointer to the write pointer */
+		xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
+		write_ptr <<= 6;
+		write_ptr &= (stream->per_xecore_buf_size << 1) - 1;
+		xecore_buf = &stream->xecore_buf[xecore];
+		xecore_buf->write = write_ptr;
+		xecore_buf->read = write_ptr;
+	}
+	reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
+				  REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
+				  REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
+						 stream->sampling_rate_mult));
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_CTRL, reg_value);
+	/* GGTT addresses can never be > 32 bits */
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE_UPPER, 0);
+	reg_value = xe_bo_ggtt_addr(stream->bo);
+	reg_value |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_XECORE_BUF_SZ, 2);
+	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
+
+	return 0;
+}
+
+static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
+				   struct eu_stall_open_properties *props)
+{
+	struct per_xecore_buf *xecore_buf;
+	u16 num_xecore, group, instance;
+	struct xe_gt *gt = stream->gt;
+	xe_dss_mask_t all_xecore;
+	u32 vaddr_offset;
+	int ret, xecore;
+
+	stream->sampling_rate_mult = props->sampling_rate_mult;
+	stream->wait_num_reports = props->wait_num_reports;
+	stream->per_xecore_buf_size = per_xecore_buf_size;
+	stream->data_record_size = xe_eu_stall_data_record_size(gt_to_xe(gt));
+
+	bitmap_or(all_xecore, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+	/*
+	 * Enabled subslices can be discontiguous. Find the maximum number of subslices
+	 * that are enabled.
+	 */
+	num_xecore = xe_gt_topology_mask_last_dss(all_xecore) + 1;
+
+	ret = alloc_eu_stall_data_buf(stream, num_xecore);
+	if (ret)
+		return ret;
+
+	stream->xecore_buf = kcalloc(num_xecore, sizeof(*stream->xecore_buf), GFP_KERNEL);
+	if (!stream->xecore_buf)
+		return -ENOMEM;
+
+	for_each_dss_steering(xecore, gt, group, instance) {
+		xecore_buf = &stream->xecore_buf[xecore];
+		vaddr_offset = xecore * stream->per_xecore_buf_size;
+		xecore_buf->vaddr = stream->bo->vmap.vaddr + vaddr_offset;
+		mutex_init(&xecore_buf->ptr_lock);
+	}
+	return 0;
+}
+
 /**
  * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
  *
@@ -181,6 +406,49 @@ static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
+static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
+{
+	int ret = 0;
+
+	if (stream->enabled)
+		return ret;
+
+	stream->enabled = true;
+
+	ret = xe_eu_stall_stream_enable(stream);
+	return ret;
+}
+
+static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
+{
+	struct xe_gt *gt = stream->gt;
+
+	if (!stream->enabled)
+		return 0;
+
+	stream->enabled = false;
+
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, 0);
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
+static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
+					    unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
+		return xe_eu_stall_enable_locked(stream);
+	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
+		return xe_eu_stall_disable_locked(stream);
+	}
+
+	return -EINVAL;
+}
+
 /**
  * xe_eu_stall_stream_ioctl - support ioctl() of a xe EU stall data stream fd.
  *
@@ -195,14 +463,22 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
 				     unsigned int cmd,
 				     unsigned long arg)
 {
-	switch (cmd) {
-	case DRM_XE_OBSERVATION_IOCTL_ENABLE:
-		return 0;
-	case DRM_XE_OBSERVATION_IOCTL_DISABLE:
-		return 0;
-	}
+	struct xe_eu_stall_data_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+	long ret;
 
-	return -EINVAL;
+	mutex_lock(&gt->eu_stall->stream_lock);
+	ret = xe_eu_stall_stream_ioctl_locked(stream, cmd, arg);
+	mutex_unlock(&gt->eu_stall->stream_lock);
+
+	return ret;
+}
+
+static void
+xe_eu_stall_stream_close_locked(struct xe_eu_stall_data_stream *stream)
+{
+	xe_eu_stall_disable_locked(stream);
+	free_eu_stall_data_buf(stream);
 }
 
 /**
@@ -215,6 +491,19 @@ static long xe_eu_stall_stream_ioctl(struct file *file,
  */
 static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
 {
+	struct xe_eu_stall_data_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+
+	mutex_lock(&gt->eu_stall->stream_lock);
+	xe_eu_stall_stream_close_locked(stream);
+	kfree(stream->xecore_buf);
+	kfree(stream);
+	gt->eu_stall->stream = NULL;
+	mutex_unlock(&gt->eu_stall->stream_lock);
+
+	/* Release the reference the EU stall stream kept on the driver */
+	drm_dev_put(&gt->tile->xe->drm);
+
 	return 0;
 }
 
@@ -230,7 +519,67 @@ static const struct file_operations fops_eu_stall = {
 
 static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
 {
-	return false;
+	return ((xe->info.platform == XE_PVC) ? true : false);
+}
+
+/**
+ * xe_eu_stall_stream_open_locked - Open a EU stall data stream FD.
+ * @dev: drm device instance
+ * @props: individually validated u64 property value pairs
+ * @file: drm file
+ *
+ * Returns: zero on success or a negative error code.
+ */
+static int
+xe_eu_stall_stream_open_locked(struct drm_device *dev,
+			       struct eu_stall_open_properties *props,
+			       struct drm_file *file)
+{
+	struct xe_eu_stall_data_stream *stream;
+	struct xe_gt *gt = props->gt;
+	unsigned long f_flags = 0;
+	int ret, stream_fd;
+
+	/* Only one session can be active at any time */
+	if (gt->eu_stall->stream) {
+		xe_gt_dbg(gt, "EU stall sampling session already active\n");
+		return -EBUSY;
+	}
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	gt->eu_stall->stream = stream;
+	stream->gt = gt;
+
+	ret = xe_eu_stall_stream_init(stream, props);
+	if (ret) {
+		xe_gt_dbg(gt, "EU stall stream init failed : %d\n", ret);
+		goto err_alloc;
+	}
+
+	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall, stream, f_flags);
+	if (stream_fd < 0) {
+		ret = stream_fd;
+		xe_gt_dbg(gt, "EU stall inode get fd failed : %d\n", ret);
+		goto err_open;
+	}
+
+	/* Take a reference on the driver that will be kept with stream_fd
+	 * until its release.
+	 */
+	drm_dev_get(&gt->tile->xe->drm);
+
+	return stream_fd;
+
+err_open:
+	free_eu_stall_data_buf(stream);
+err_alloc:
+	gt->eu_stall->stream = NULL;
+	kfree(stream->xecore_buf);
+	kfree(stream);
+	return ret;
 }
 
 /**
@@ -252,7 +601,7 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct eu_stall_open_properties props = {};
-	int ret, stream_fd;
+	int ret;
 
 	if (xe_observation_paranoid && !perfmon_capable()) {
 		xe_gt_dbg(props.gt, "Insufficient privileges for EU stall monitoring\n");
@@ -263,6 +612,10 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
 		return -EPERM;
 	}
 
+	/* Initialize and set default values */
+	props.wait_num_reports = 1;
+	props.sampling_rate_mult = 4;
+
 	ret = xe_eu_stall_user_extensions(xe, data, &props);
 	if (ret)
 		return ret;
@@ -272,9 +625,9 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall, NULL, 0);
-	if (stream_fd < 0)
-		xe_gt_dbg(props.gt, "EU stall inode get fd failed : %d\n", stream_fd);
+	mutex_lock(&props.gt->eu_stall->stream_lock);
+	ret = xe_eu_stall_stream_open_locked(dev, &props, file);
+	mutex_unlock(&props.gt->eu_stall->stream_lock);
 
-	return stream_fd;
+	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
index d514e78341d5..e42250c1d294 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -6,9 +6,10 @@
 #ifndef __XE_EU_STALL_H__
 #define __XE_EU_STALL_H__
 
-#include <drm/drm_device.h>
-#include <drm/drm_file.h>
-#include <linux/types.h>
+#include "xe_gt_types.h"
+
+int xe_eu_stall_init(struct xe_gt *gt);
+void xe_eu_stall_fini(struct xe_gt *gt);
 
 int xe_eu_stall_stream_open(struct drm_device *dev,
 			    u64 data,
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9fb8f1e678dc..ee5a16727300 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -60,6 +60,7 @@
 #include "xe_vm.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
+#include "xe_eu_stall.h"
 
 static void gt_fini(struct drm_device *drm, void *arg)
 {
@@ -159,6 +160,7 @@ void xe_gt_remove(struct xe_gt *gt)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
 
 	xe_gt_disable_host_l2_vram(gt);
+	xe_eu_stall_fini(gt);
 }
 
 static void gt_reset_worker(struct work_struct *w);
@@ -625,6 +627,10 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_gt_record_user_engines(gt);
 
+	err = xe_eu_stall_init(gt);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6e66bf0e8b3f..833a1a67e9ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -430,6 +430,9 @@ struct xe_gt {
 
 	/** @oa: oa observation subsystem per gt info */
 	struct xe_oa_gt oa;
+
+	/** @eu_stall: EU stall counters subsystem per gt info */
+	struct xe_eu_stall_gt *eu_stall;
 };
 
 #endif
-- 
2.48.1

