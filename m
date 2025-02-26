Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C5AC021BE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 01:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73EF10E837;
	Wed, 26 Feb 2025 01:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkEjaM5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4F210E82F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 01:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740534444; x=1772070444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lQK+wwBunyDj0WpSx9qZygZqXFUAln00Lq0gWNYVbag=;
 b=EkEjaM5nvAcKlYW9ihp95h27BPIqkyLHQqpKrSJQfgmeCoxVB5npPg1y
 Do8RcHicIPupqLWS1W9lPZ8eedmMrdp98n78PIWby8JKgrd24IvHz6c1M
 oyf5bGmuu5JWUC/pv8yk/uIRySRQj7StkT3aHhVpE5rcI66fD2Lth8AKA
 ESd6Q1IDt+bbd+eKSNT+GhjkXnkkGaSM6ldaAF4LviAxPu2iTnNL1rvom
 D3sUvzlwLCD13shFhfHg7Lx+w0Rg1qVrePRKR/SFX6oB3Q4d3/9Y9YA6O
 NUiek3TGiaYMz0em99O9JMmiWVCoEtUAkIGL0Nhe/nN9rSKtV5LDs4nN2 w==;
X-CSE-ConnectionGUID: gC3UNScWR9qo8Nkn3w3sLw==
X-CSE-MsgGUID: 6spxaP0YSAu4RuOlfMeDBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40602936"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="40602936"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 17:47:24 -0800
X-CSE-ConnectionGUID: NprKy4FwQhSvzf9fu1Cy7w==
X-CSE-MsgGUID: pKTzu57oR0CCcbZ28h93hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117050221"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 17:47:24 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v12 3/8] drm/xe/eustall: Add support to init,
 enable and disable EU stall sampling
Date: Tue, 25 Feb 2025 17:47:07 -0800
Message-ID: <b6aeca593d521828a0b4fbf6cfd2844716c4fc66.1740533885.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740533885.git.harish.chegondi@intel.com>
References: <cover.1740533885.git.harish.chegondi@intel.com>
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

v11: Move stream->xecore_buf alloc to xe_eu_stall_data_buf_alloc().
     Register xe_eu_stall_fini() with devm_add_action_or_reset()
     instead of calling it from xe_gt_fini().
     Changed a couple of variables in struct xe_eu_stall_data_stream
     from unsigned int to int.
v10: Fixed error rewinding code
     Moved code around as per review feedback
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

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |  29 ++
 drivers/gpu/drm/xe/xe_eu_stall.c           | 378 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eu_stall.h           |   1 +
 drivers/gpu/drm/xe/xe_gt.c                 |   5 +
 drivers/gpu/drm/xe/xe_gt_types.h           |   3 +
 5 files changed, 409 insertions(+), 7 deletions(-)
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
index 62a92aa161e8..2e7d00f8ff40 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -8,14 +8,52 @@
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
+static size_t per_xecore_buf_size = SZ_512K;
+
+struct per_xecore_buf {
+	/* Buffer vaddr */
+	u8 *vaddr;
+	/* Write pointer */
+	u32 write;
+	/* Read pointer */
+	u32 read;
+};
+
+struct xe_eu_stall_data_stream {
+	bool enabled;
+	int wait_num_reports;
+	int sampling_rate_mult;
+	size_t data_record_size;
+	size_t per_xecore_buf_size;
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
 
 /**
  * struct eu_stall_open_properties - EU stall sampling properties received
@@ -31,6 +69,88 @@ struct eu_stall_open_properties {
 	struct xe_gt *gt;
 };
 
+/*
+ * EU stall data format for PVC
+ */
+struct xe_eu_stall_data_pvc {
+	__u64 ip_addr:29;	  /* Bits 0  to 28  */
+	__u64 active_count:8;	  /* Bits 29 to 36  */
+	__u64 other_count:8;	  /* Bits 37 to 44  */
+	__u64 control_count:8;	  /* Bits 45 to 52  */
+	__u64 pipestall_count:8;  /* Bits 53 to 60  */
+	__u64 send_count:8;	  /* Bits 61 to 68  */
+	__u64 dist_acc_count:8;	  /* Bits 69 to 76  */
+	__u64 sbid_count:8;	  /* Bits 77 to 84  */
+	__u64 sync_count:8;	  /* Bits 85 to 92  */
+	__u64 inst_fetch_count:8; /* Bits 93 to 100 */
+	__u64 unused_bits:27;
+	__u64 unused[6];
+} __packed;
+
+static size_t xe_eu_stall_data_record_size(struct xe_device *xe)
+{
+	size_t record_size = 0;
+
+	if (xe->info.platform == XE_PVC)
+		record_size = sizeof(struct xe_eu_stall_data_pvc);
+
+	xe_assert(xe, is_power_of_2(record_size));
+
+	return record_size;
+}
+
+/**
+ * num_data_rows - Return the number of EU stall data rows of 64B each
+ *		   for a given data size.
+ *
+ * @data_size: EU stall data size
+ */
+static u32 num_data_rows(u32 data_size)
+{
+	return data_size >> 6;
+}
+
+static void xe_eu_stall_fini(void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	mutex_destroy(&gt->eu_stall->stream_lock);
+	kfree(gt->eu_stall);
+}
+
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
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret;
+
+	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
+	if (!gt->eu_stall) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	mutex_init(&gt->eu_stall->stream_lock);
+
+	ret = devm_add_action_or_reset(xe->drm.dev, xe_eu_stall_fini, gt);
+	if (ret)
+		goto exit_free;
+
+	return 0;
+exit_free:
+	mutex_destroy(&gt->eu_stall->stream_lock);
+	kfree(gt->eu_stall);
+exit:
+	return ret;
+}
+
 static int set_prop_eu_stall_sampling_rate(struct xe_device *xe, u64 value,
 					   struct eu_stall_open_properties *props)
 {
@@ -140,6 +260,135 @@ static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 	return ret;
 }
 
+static void xe_eu_stall_stream_free(struct xe_eu_stall_data_stream *stream)
+{
+	struct xe_gt *gt = stream->gt;
+
+	gt->eu_stall->stream = NULL;
+	kfree(stream);
+}
+
+static void xe_eu_stall_data_buf_destroy(struct xe_eu_stall_data_stream *stream)
+{
+	xe_bo_unpin_map_no_vm(stream->bo);
+	kfree(stream->xecore_buf);
+}
+
+static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
+				      u16 last_xecore)
+{
+	struct xe_tile *tile = stream->gt->tile;
+	struct xe_bo *bo;
+	u32 size;
+
+	stream->xecore_buf = kcalloc(last_xecore, sizeof(*stream->xecore_buf), GFP_KERNEL);
+	if (!stream->xecore_buf)
+		return -ENOMEM;
+
+	size = stream->per_xecore_buf_size * last_xecore;
+
+	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
+					     size, ~0ull, ttm_bo_type_kernel,
+					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
+	if (IS_ERR(bo)) {
+		kfree(stream->xecore_buf);
+		return PTR_ERR(bo);
+	}
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
+	reg_value |= REG_FIELD_PREP(XEHPC_EUSTALL_BASE_XECORE_BUF_SZ,
+				    stream->per_xecore_buf_size / SZ_256K);
+	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
+	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
+
+	return 0;
+}
+
+static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
+				   struct eu_stall_open_properties *props)
+{
+	unsigned int max_wait_num_reports, xecore, last_xecore, num_xecores;
+	struct per_xecore_buf *xecore_buf;
+	struct xe_gt *gt = stream->gt;
+	xe_dss_mask_t all_xecores;
+	u16 group, instance;
+	u32 vaddr_offset;
+	int ret;
+
+	bitmap_or(all_xecores, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+	num_xecores = bitmap_weight(all_xecores, XE_MAX_DSS_FUSE_BITS);
+	last_xecore = xe_gt_topology_mask_last_dss(all_xecores) + 1;
+
+	max_wait_num_reports = num_data_rows(per_xecore_buf_size * num_xecores);
+	if (props->wait_num_reports == 0 || props->wait_num_reports > max_wait_num_reports) {
+		xe_gt_dbg(gt, "Invalid EU stall event report count %u\n",
+			  props->wait_num_reports);
+		xe_gt_dbg(gt, "Minimum event report count is 1, maximum is %u\n",
+			  max_wait_num_reports);
+		return -EINVAL;
+	}
+	stream->per_xecore_buf_size = per_xecore_buf_size;
+	stream->sampling_rate_mult = props->sampling_rate_mult;
+	stream->wait_num_reports = props->wait_num_reports;
+	stream->data_record_size = xe_eu_stall_data_record_size(gt_to_xe(gt));
+
+	ret = xe_eu_stall_data_buf_alloc(stream, last_xecore);
+	if (ret)
+		return ret;
+
+	for_each_dss_steering(xecore, gt, group, instance) {
+		xecore_buf = &stream->xecore_buf[xecore];
+		vaddr_offset = xecore * stream->per_xecore_buf_size;
+		xecore_buf->vaddr = stream->bo->vmap.vaddr + vaddr_offset;
+	}
+	return 0;
+}
+
 static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
 {
 	__poll_t ret = 0;
@@ -147,13 +396,75 @@ static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
-static long xe_eu_stall_stream_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
 {
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
 	return 0;
 }
 
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
+static long xe_eu_stall_stream_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct xe_eu_stall_data_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+	long ret;
+
+	mutex_lock(&gt->eu_stall->stream_lock);
+	ret = xe_eu_stall_stream_ioctl_locked(stream, cmd, arg);
+	mutex_unlock(&gt->eu_stall->stream_lock);
+
+	return ret;
+}
+
 static int xe_eu_stall_stream_close(struct inode *inode, struct file *file)
 {
+	struct xe_eu_stall_data_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+
+	drm_dev_put(&gt->tile->xe->drm);
+
+	mutex_lock(&gt->eu_stall->stream_lock);
+	xe_eu_stall_disable_locked(stream);
+	xe_eu_stall_data_buf_destroy(stream);
+	xe_eu_stall_stream_free(stream);
+	mutex_unlock(&gt->eu_stall->stream_lock);
+
 	return 0;
 }
 
@@ -169,7 +480,56 @@ static const struct file_operations fops_eu_stall = {
 
 static inline bool has_eu_stall_sampling_support(struct xe_device *xe)
 {
-	return false;
+	return xe->info.platform == XE_PVC;
+}
+
+static int xe_eu_stall_stream_open_locked(struct drm_device *dev,
+					  struct eu_stall_open_properties *props,
+					  struct drm_file *file)
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
+		goto err_free;
+	}
+
+	stream_fd = anon_inode_getfd("[xe_eu_stall]", &fops_eu_stall, stream, f_flags);
+	if (stream_fd < 0) {
+		ret = stream_fd;
+		xe_gt_dbg(gt, "EU stall inode get fd failed : %d\n", ret);
+		goto err_destroy;
+	}
+
+	/* Take a reference on the driver that will be kept with stream_fd
+	 * until its release.
+	 */
+	drm_dev_get(&gt->tile->xe->drm);
+
+	return stream_fd;
+
+err_destroy:
+	xe_eu_stall_data_buf_destroy(stream);
+err_free:
+	xe_eu_stall_stream_free(stream);
+	return ret;
 }
 
 /**
@@ -189,7 +549,7 @@ int xe_eu_stall_stream_open(struct drm_device *dev, u64 data, struct drm_file *f
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct eu_stall_open_properties props = {};
-	int ret, stream_fd;
+	int ret;
 
 	if (!has_eu_stall_sampling_support(xe)) {
 		drm_dbg(&xe->drm, "EU stall monitoring is not supported on this platform\n");
@@ -201,6 +561,10 @@ int xe_eu_stall_stream_open(struct drm_device *dev, u64 data, struct drm_file *f
 		return -EACCES;
 	}
 
+	/* Initialize and set default values */
+	props.wait_num_reports = 1;
+	props.sampling_rate_mult = 4;
+
 	ret = xe_eu_stall_user_extensions(xe, data, 0, &props);
 	if (ret)
 		return ret;
@@ -210,9 +574,9 @@ int xe_eu_stall_stream_open(struct drm_device *dev, u64 data, struct drm_file *f
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
index c1aef8adac6e..24e215b840c0 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.h
+++ b/drivers/gpu/drm/xe/xe_eu_stall.h
@@ -8,6 +8,7 @@
 
 #include "xe_gt_types.h"
 
+int xe_eu_stall_init(struct xe_gt *gt);
 int xe_eu_stall_stream_open(struct drm_device *dev,
 			    u64 data,
 			    struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 650a0ee56e97..5bd8dfdce300 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -19,6 +19,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eu_stall.h"
 #include "xe_exec_queue.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
@@ -613,6 +614,10 @@ int xe_gt_init(struct xe_gt *gt)
 
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

