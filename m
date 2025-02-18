Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80FEC021B3
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 19:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA4E10E758;
	Tue, 18 Feb 2025 19:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bu1GES86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B9810E753
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739908458; x=1771444458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhIuLZxixeSNwl0/7zxLoHb/ECAhqRo7Sc6gVp6Ajhg=;
 b=bu1GES86uai+xlHV9m3bsdCSLDxK6bmmg1c2nk+8m2nZ00X34SlYlmD+
 qZBf3jfSZxw9rS8ugIYp0XJTN8Xm6cUvasdBdjXG28dCq0U8DxQiuPzaQ
 uhen6FWd28/JLBsCkb0sSOjSlWvdxtct/Q3gUHZQG8cR8zCOiQ5dAjf+s
 5WG8kNi665qk054LRDSbS1V9qub1Q4CQ9eHJmRR6aikp+Qqz5B3122b9i
 cKvDGim+s+DokKVHgGSXJ4GsyzpSnCxGGTy0niMm8dCv+nktFoYrRnbQH
 RTJLM49+2loUpVsDMKll3Hm0d1Sc1qin2rdByCXNYm/OLRG1J6uR6zXff A==;
X-CSE-ConnectionGUID: mWVQYA1LSS2d52jeQA2TlQ==
X-CSE-MsgGUID: 8kzWJwc/Twa0EMcNWl4q5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44382055"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44382055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:18 -0800
X-CSE-ConnectionGUID: uIv8OXhkTNSnzMbnmskCKg==
X-CSE-MsgGUID: 3PfmLmR+Tz+zIqQUg2I1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151706359"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 11:54:18 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v10 5/8] drm/xe/eustall: Add support to handle dropped EU
 stall data
Date: Tue, 18 Feb 2025 11:53:55 -0800
Message-ID: <42c8cecda3f50374ed90fe2911e7f5a3523e157b.1739906138.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739906138.git.harish.chegondi@intel.com>
References: <cover.1739906138.git.harish.chegondi@intel.com>
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

v10: Reverted the changes back to v8:
     Clear the drop bits only after reading the data.
v9:  Move all data drop handling code to this patch
     Clear all drop data bits before returning -EIO.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 122dc99cd09b..c37fa4486b2e 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -53,6 +53,10 @@ struct xe_eu_stall_data_stream {
 	/* Lock to protect xecore_buf */
 	struct mutex buf_lock;
 	struct per_xecore_buf *xecore_buf;
+	struct {
+		bool reported_to_user;
+		xe_dss_mask_t mask;
+	} data_drop;
 	struct delayed_work buf_poll_work;
 	struct workqueue_struct *buf_poll_wq;
 };
@@ -311,6 +315,8 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
 			if (num_data_rows(total_data) >= stream->wait_num_reports)
 				min_data_present = true;
 		}
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			set_bit(xecore, stream->data_drop.mask);
 		xecore_buf->write = write_ptr;
 	}
 	mutex_unlock(&stream->buf_lock);
@@ -318,6 +324,16 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
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
@@ -376,6 +392,10 @@ static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
 	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
 	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
 	xecore_buf->read = read_ptr;
+	if (test_bit(xecore, stream->data_drop.mask)) {
+		clear_dropped_eviction_line_bit(gt, group, instance);
+		clear_bit(xecore, stream->data_drop.mask);
+	}
 	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
 				    read_offset, write_offset, *total_data_size);
 	return 0;
@@ -403,6 +423,16 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
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
 	mutex_lock(&stream->buf_lock);
 	for_each_dss_steering(xecore, gt, group, instance) {
 		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
@@ -417,6 +447,9 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 /*
  * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
  * before calling read().
+ *
+ * Returns: The number of bytes copied or a negative error code on failure.
+ *	    -EIO if HW drops any EU stall data when the buffer is full.
  */
 static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 				       size_t count, loff_t *ppos)
@@ -516,6 +549,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 
 	for_each_dss_steering(xecore, gt, group, instance) {
 		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
+		/* Clear any drop bits set and not cleared in the previous session. */
+		if (write_ptr_reg & XEHPC_EUSTALL_REPORT_OVERFLOW_DROP)
+			clear_dropped_eviction_line_bit(gt, group, instance);
 		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
 		read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, write_ptr);
 		read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
@@ -527,6 +563,9 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
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

