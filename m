Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EE3C021BC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 09:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E97610E5DD;
	Tue, 25 Feb 2025 09:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4ml8XiP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986710E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475233; x=1772011233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zMp7ZNmJmQcVjPMZAlTU7ogT2E9UDmZw9T+sr6HOOwg=;
 b=F4ml8XiPMyO7ViB7PTlU/0icrW0o77soqlJZdoqdnX12mDLvMQSqcFfL
 G8jogBqRrTuNBqeTjVVN0WGVJYQgo5cgnT7D0NQ8paavEIuS6e5UDKtKI
 aNIZgOrA80bPkO2YBVMxS4KQK87Gl/DhoHf6D31Xfaz/bLjbdw+SFqu/r
 4dr/vsVe5fWOt+v/vBJLMoHvHOCxwaVjWbTM/zeTfCYZwEbUNlrT3TMCk
 lmedKKkOxai+aA3TB+JrisTzsmiAFAQE7M4gzrY1y1gdg/OFuf3X7p3lM
 7ntzd4DMHBkS3sbSxguYVbmXaanMYZfbOSvfQ4uYNI/UQ13MvH8KoqIbh Q==;
X-CSE-ConnectionGUID: lnWgg/PCTV2R2w/29zMxrw==
X-CSE-MsgGUID: MBqeJDXNSPiSsHTexK7CZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40507677"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40507677"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:33 -0800
X-CSE-ConnectionGUID: NMEwce+JSnGuKD7aKLU3ug==
X-CSE-MsgGUID: 7nINZH7DSIC+CeiWZIcUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117261781"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:20:32 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v11 5/8] drm/xe/eustall: Add support to handle dropped EU
 stall data
Date: Tue, 25 Feb 2025 01:20:22 -0800
Message-ID: <33eb4ea0ee3097eef392b837205c21a78e4c64ea.1740474556.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740474556.git.harish.chegondi@intel.com>
References: <cover.1740474556.git.harish.chegondi@intel.com>
MIME-Version: 1.0
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

If the user space doesn't read the EU stall data fast enough,
it is possible that the EU stall data buffer can get filled,
and if the hardware wants to write more data, it simply drops
data due to unavailable buffer space. In that case, hardware
sets a bit in a register. If the driver detects data drop,
the driver read() returns -EIO error to let the user space
know that HW has dropped data. The -EIO error is returned
even if there is EU stall data in the buffer. A subsequent
read by the user space returns the remaining EU stall data.

v11: Clear drop bit even for empty data buffer as the data
     was read from the buffer in the previous read.
v10: Reverted the changes back to v8:
     Clear the drop bits only after reading the data.
v9:  Move all data drop handling code to this patch
     Clear all drop data bits before returning -EIO.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index e82a6ebfe979..d0d4151bea10 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -51,6 +51,10 @@ struct xe_eu_stall_data_stream {
 	struct xe_gt *gt;
 	struct xe_bo *bo;
 	struct per_xecore_buf *xecore_buf;
+	struct {
+		bool reported_to_user;
+		xe_dss_mask_t mask;
+	} data_drop;
 	struct delayed_work buf_poll_work;
 };
 
@@ -330,6 +334,8 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 			if (num_data_rows(total_data) >= stream->wait_num_reports)
 				min_data_present = true;
 		}
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			set_bit(xecore, stream->data_drop.mask);
 		xecore_buf->write = write_ptr;
 	}
 	mutex_unlock(&gt->eu_stall->stream_lock);
@@ -337,6 +343,16 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 	return min_data_present;
 }
 
+static void clear_dropped_eviction_line_bit(struct xe_gt *gt, u16 group, u16 instance)
+{
+	u32 write_ptr_reg;
+
+	/* On PVC, the overflow bit has to be cleared by writing 1 to it. */
+	write_ptr_reg = _MASKED_BIT_ENABLE(XEHPC_EUSTALL_REPORT_OVERFLOW_DROP);
+
+	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT, write_ptr_reg, group, instance);
+}
+
 static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
 				     char __user *buf, size_t count,
 				     size_t *total_data_size, struct xe_gt *gt,
@@ -362,6 +378,9 @@ static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
 	buf_size = stream->per_xecore_buf_size;
 
 	read_data_size = buf_data_size(buf_size, read_ptr, write_ptr);
+	if (read_data_size == 0)
+		goto exit_drop;
+
 	/* Read only the data that the user space buffer can accommodate */
 	read_data_size = min_t(size_t, count - *total_data_size, read_data_size);
 	if (read_data_size == 0)
@@ -397,6 +416,15 @@ static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
 	xecore_buf->read = read_ptr;
 	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
 				    read_data_size, *total_data_size);
+exit_drop:
+	/* Clear drop bit (if set) after any data was read or if the buffer was empty.
+	 * Drop bit can be set even if the buffer is empty as the buffer may have been emptied
+	 * in the previous read() and the data drop bit was set during the previous read().
+	 */
+	if (test_bit(xecore, stream->data_drop.mask)) {
+		clear_dropped_eviction_line_bit(gt, group, instance);
+		clear_bit(xecore, stream->data_drop.mask);
+	}
 	return 0;
 }
 
@@ -422,6 +450,16 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 	unsigned int xecore;
 	int ret = 0;
 
+	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
+		if (!stream->data_drop.reported_to_user) {
+			stream->data_drop.reported_to_user = true;
+			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
+				  XE_MAX_DSS_FUSE_BITS, stream->data_drop.mask);
+			return -EIO;
+		}
+		stream->data_drop.reported_to_user = false;
+	}
+
 	for_each_dss_steering(xecore, gt, group, instance) {
 		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
 						gt, group, instance, xecore);
@@ -434,6 +472,9 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 /*
  * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
  * before calling read().
+ *
+ * Returns: The number of bytes copied or a negative error code on failure.
+ *	    -EIO if HW drops any EU stall data when the buffer is full.
  */
 static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 				       size_t count, loff_t *ppos)
@@ -538,6 +579,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
+		/* Clear any drop bits set and not cleared in the previous session. */
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			clear_dropped_eviction_line_bit(gt, group, instance);
 		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
 		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
 		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
@@ -549,6 +593,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 		xecore_buf->write = write_ptr;
 		xecore_buf->read = write_ptr;
 	}
+	stream->data_drop.reported_to_user = false;
+	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
+
 	reg_value = _MASKED_FIELD(EUSTALL_MOCS | EUSTALL_SAMPLE_RATE,
 				  REG_FIELD_PREP(EUSTALL_MOCS, gt->mocs.uc_index << 1) |
 				  REG_FIELD_PREP(EUSTALL_SAMPLE_RATE,
-- 
2.48.1

