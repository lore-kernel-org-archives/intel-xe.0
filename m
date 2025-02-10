Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188D1C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 13:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D3810E54E;
	Mon, 10 Feb 2025 13:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHx85J1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D848610E1C3
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739195219; x=1770731219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMrpP9LaTN7tmCYDL3eUeQGvjl1LacKdI3Bz5hthGJ8=;
 b=cHx85J1xTIg2bEi/oSBBHac/wyyG84Op3lNN8oDiPCXe523BJrLgiyCB
 boKJEmHr/9DSYF3I8mHYZT8wwPx5BoJAbWTG956V4KKbAxFliAF5VROyB
 kdwjzAscVZy4AvCu8n8wOa17/QXN9T55+3C5AlcLIZv2WiiTICV+UkpEq
 OGYJ/P+wVkRdYpW9HGNafKtypX7t6R2u6EIttziH1cOQ7BwzELxiINCmH
 8thiULXq5QAfvWCd6FAr/cYDqTIA2bd5ZXnOA1CxQkhewebQcHX9G3uBV
 Qx5aw1AEfq5Gr4lnigGSib9XS+WCTVTU+2sAuVP/96EQt6IRY83SI24VP g==;
X-CSE-ConnectionGUID: 9ulXq4SmS9SyWZFpgolexw==
X-CSE-MsgGUID: ncyY31/GTTacvSQ+ScuqZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27378424"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="27378424"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
X-CSE-ConnectionGUID: 52KDh8hLR/K/7BxRMy4XXg==
X-CSE-MsgGUID: xh2KjuxmRyGMeRSQJ8letQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149386845"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v9 5/8] drm/xe/eustall: Add support to handle dropped EU stall
 data
Date: Mon, 10 Feb 2025 05:46:46 -0800
Message-ID: <c47e43598403dd36346d3236c9eb880f8ddd549d.1739193510.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739193510.git.harish.chegondi@intel.com>
References: <cover.1739193510.git.harish.chegondi@intel.com>
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

v9:  Move all data drop handling code to this patch
     Clear all drop data bits before returning -EIO.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 53f17aac7d3b..428267010805 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -53,6 +53,10 @@ struct xe_eu_stall_data_stream {
 	struct xe_gt *gt;
 	struct xe_bo *bo;
 	struct per_xecore_buf *xecore_buf;
+	struct {
+		bool reported_to_user;
+		xe_dss_mask_t mask;
+	} data_drop;
 	struct delayed_work buf_poll_work;
 	struct workqueue_struct *buf_poll_wq;
 };
@@ -331,12 +335,24 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 			if (num_data_rows(total_data) >= stream->wait_num_reports)
 				min_data_present = true;
 		}
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			set_bit(xecore, stream->data_drop.mask);
 		xecore_buf->write = write_ptr;
 		mutex_unlock(&xecore_buf->ptr_lock);
 	}
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
@@ -436,6 +452,22 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 	unsigned int xecore;
 	int ret = 0;
 
+	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
+		if (!stream->data_drop.reported_to_user) {
+			for_each_dss_steering(xecore, gt, group, instance) {
+				if (test_bit(xecore, stream->data_drop.mask)) {
+					clear_dropped_eviction_line_bit(gt, group, instance);
+					clear_bit(xecore, stream->data_drop.mask);
+				}
+			}
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
@@ -457,6 +489,7 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
  * before calling read().
  *
  * Returns: The number of bytes copied or a negative error code on failure.
+ *	    -EIO if HW drops any EU stall data when the buffer is full.
  */
 static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 				       size_t count, loff_t *ppos)
@@ -543,6 +576,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
+		/* Clear any drop bits set and not cleared in the previous session. */
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			clear_dropped_eviction_line_bit(gt, group, instance);
 		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
 		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
 		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
@@ -554,6 +590,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
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

