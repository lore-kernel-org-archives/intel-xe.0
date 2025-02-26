Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C313C021BF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 01:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C8010E834;
	Wed, 26 Feb 2025 01:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPiTDpvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E90F10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 01:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740534445; x=1772070445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qvhNPlreEzjEnA/2r0S6EYewYqYvLrCBU0n2SYHS5PA=;
 b=JPiTDpvENXLxkXtlW28rxX+j3UVrhVDspeHf5Cnlvhre/24/dj9ONG2x
 z4QpPuHStwe5S5DPfknAWec/KWZBfEGB1ajmNNt0egmAuP5otRY6Dz3qT
 vGS4UQ0ieIA8fDFL4MMDDCuVbTcA6qqop0SZgYndfifpCKV+nrfCp1LIe
 OIH+HhTz48787DqZg2WKaOGQqaP3NQWzPainketpawKhsshSc0jhPhhdI
 JahRprrHZzS5+rNRKb3MIcg7bRrPpECZXJX6OTb2ZaXd/atwHNu44yUN2
 hkFnEH9X52460Jvl2n9XXDSfy6C8E0d35ozQxUMZOzOEtbg4JPED3pbUM Q==;
X-CSE-ConnectionGUID: STsHb7cFSNmjelI43ZUzEw==
X-CSE-MsgGUID: cx/+L+WrRZyoUsk5sY8agg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40602938"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="40602938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 17:47:25 -0800
X-CSE-ConnectionGUID: bYPAVHnnTjm/B58Bgg+fkQ==
X-CSE-MsgGUID: c8i0iZttSry9jnLRpraRSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117050227"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 17:47:25 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 shubham.kumar@intel.com, joshua.santosh.ranjan@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v12 5/8] drm/xe/eustall: Add support to handle dropped EU
 stall data
Date: Tue, 25 Feb 2025 17:47:09 -0800
Message-ID: <6fbfd7cfa42cb3ef5515b6412573d74c7cd3d27a.1740533885.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740533885.git.harish.chegondi@intel.com>
References: <cover.1740533885.git.harish.chegondi@intel.com>
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

v12: Move 'goto exit_drop;' to the next
     'if (read_data_size == 0)' statement.
v11: Clear drop bit even for empty data buffer as the data
     was read from the buffer in the previous read.
v10: Reverted the changes back to v8:
     Clear the drop bits only after reading the data.
v9:  Move all data drop handling code to this patch
     Clear all drop data bits before returning -EIO.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 46 +++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index e82a6ebfe979..ebda54ea8871 100644
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
@@ -365,7 +381,7 @@ static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
 	/* Read only the data that the user space buffer can accommodate */
 	read_data_size = min_t(size_t, count - *total_data_size, read_data_size);
 	if (read_data_size == 0)
-		return 0;
+		goto exit_drop;
 
 	read_offset = read_ptr & (buf_size - 1);
 	write_offset = write_ptr & (buf_size - 1);
@@ -397,6 +413,15 @@ static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
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
 
@@ -422,6 +447,16 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
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
@@ -434,6 +469,9 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 /*
  * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
  * before calling read().
+ *
+ * Returns: The number of bytes copied or a negative error code on failure.
+ *	    -EIO if HW drops any EU stall data when the buffer is full.
  */
 static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 				       size_t count, loff_t *ppos)
@@ -538,6 +576,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
+		/* Clear any drop bits set and not cleared in the previous session. */
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			clear_dropped_eviction_line_bit(gt, group, instance);
 		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
 		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
 		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
@@ -549,6 +590,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
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

