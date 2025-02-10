Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF269C0219D
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 13:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A637110E54B;
	Mon, 10 Feb 2025 13:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsze0tqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA84710E161
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739195219; x=1770731219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3u0nGP2+RKwzo2Kd5iuKqrK9cqRPSiNqSyL8LFTBqzE=;
 b=gsze0tqw79q8YrdUfqLpy3gKHMpjny43gdtpxR692K5Ge9GAegZb9BHA
 946fYMzuA8kk+K80UYZ/3BXY3j70OD96t0QL49shBJWmoh9D/y0WLN4b3
 TZ1YGeOopQxHuX5nFPk1rGjpHb7+aznoPFrMG5eGmYTcdZJI6uljiJ3K3
 dpZQ4urmXmLRDSS4nSs3V5GLNzp6idm87NKFVoOJNWOVI0Kk2nvC0+fpv
 fLqmF+C57ekAfSAQ3CYf+z7bC6vjf6wp4UavsDvsCSPEzXOfioSCA/tLF
 ajEhGixEOFETEcA/BErD+CJeOIeUpYeyEWkzxLHmZZtAvDy9Yw85K7n7S A==;
X-CSE-ConnectionGUID: J8nXEY35SOeiiwpnarqKUw==
X-CSE-MsgGUID: GCSqluLtT6uIkDCDlElC4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27378423"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="27378423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
X-CSE-ConnectionGUID: Pu4AyrGuSbeS7m8Qyg5i7A==
X-CSE-MsgGUID: CVrCGI8jR66Itkvq0eR21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149386842"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:46:58 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matthew.olson@intel.com,
 lucas.demarchi@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v9 4/8] drm/xe/eustall: Add support to read() and poll() EU
 stall data
Date: Mon, 10 Feb 2025 05:46:45 -0800
Message-ID: <2c6ba4545b30b3f7ff0055fd9994618fd31d12ab.1739193510.git.harish.chegondi@intel.com>
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

Implement the EU stall sampling APIs to read() and poll() EU stall data.
A work function periodically polls the EU stall data buffer write pointer
registers to look for any new data and caches the write pointer. The read
function compares the cached read and write pointers and copies any new
data to the user space.

v9:  New patch split from the previous patch.
     Used *_delayed_work functions instead of hrtimer
     Addressed the review feedback in read and poll functions

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 267 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_trace.h    |  33 ++++
 2 files changed, 298 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 12afa9720971..53f17aac7d3b 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -21,6 +21,7 @@
 #include "xe_macros.h"
 #include "xe_observation.h"
 #include "xe_pm.h"
+#include "xe_trace.h"
 
 #include "regs/xe_eu_stall_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -41,7 +42,9 @@ struct per_xecore_buf {
 };
 
 struct xe_eu_stall_data_stream {
+	bool pollin;
 	bool enabled;
+	wait_queue_head_t poll_wq;
 	size_t data_record_size;
 	size_t per_xecore_buf_size;
 	unsigned int wait_num_reports;
@@ -50,6 +53,8 @@ struct xe_eu_stall_data_stream {
 	struct xe_gt *gt;
 	struct xe_bo *bo;
 	struct per_xecore_buf *xecore_buf;
+	struct delayed_work buf_poll_work;
+	struct workqueue_struct *buf_poll_wq;
 };
 
 struct xe_eu_stall_gt {
@@ -256,6 +261,190 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
 	return 0;
 }
 
+/**
+ * buf_data_size - Calculate the number of bytes in a circular buffer
+ *		   given the read and write pointers and the size of
+ *		   the buffer.
+ *
+ * @buf_size: Size of the circular buffer
+ * @read_ptr: Read pointer with an additional overflow bit
+ * @write_ptr: Write pointer with an additional overflow bit
+ *
+ * Since the read and write pointers have an additional overflow bit,
+ * this function calculates the offsets from the pointers and use the
+ * offsets to calculate the data size in the buffer.
+ *
+ * Returns: number of bytes of data in the buffer
+ */
+static u32 buf_data_size(size_t buf_size, u32 read_ptr, u32 write_ptr)
+{
+	u32 read_offset, write_offset, size = 0;
+
+	if (read_ptr == write_ptr)
+		goto exit;
+
+	read_offset = read_ptr & (buf_size - 1);
+	write_offset = write_ptr & (buf_size - 1);
+
+	if (write_offset > read_offset)
+		size = write_offset - read_offset;
+	else
+		size = buf_size - read_offset + write_offset;
+exit:
+	return size;
+}
+
+/**
+ * eu_stall_data_buf_poll - Poll for EU stall data in the buffer.
+ *
+ * @stream: xe EU stall data stream instance
+ *
+ * Returns: true if the EU stall buffer contains minimum stall data as
+ *	    specified by the event report count, else false.
+ */
+static bool eu_stall_data_buf_poll(struct xe_eu_stall_data_stream *stream)
+{
+	u32 read_ptr, write_ptr_reg, write_ptr, total_data = 0;
+	u32 buf_size = stream->per_xecore_buf_size;
+	struct per_xecore_buf *xecore_buf;
+	struct xe_gt *gt = stream->gt;
+	bool min_data_present = false;
+	u16 group, instance;
+	unsigned int xecore;
+
+	for_each_dss_steering(xecore, gt, group, instance) {
+		xecore_buf = &stream->xecore_buf[xecore];
+		mutex_lock(&xecore_buf->ptr_lock);
+		read_ptr = xecore_buf->read;
+		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT,
+						       group, instance);
+		write_ptr = REG_FIELD_GET(XEHPC_EUSTALL_REPORT_WRITE_PTR_MASK, write_ptr_reg);
+		write_ptr <<= 6;
+		write_ptr &= ((buf_size << 1) - 1);
+		if (write_ptr != read_ptr && !min_data_present) {
+			total_data += buf_data_size(buf_size, read_ptr, write_ptr);
+			/*
+			 * Check if there are at least minimum number of stall data
+			 * rows for poll() to indicate that the data is present.
+			 * Each stall data row is 64B (cacheline size).
+			 */
+			if (num_data_rows(total_data) >= stream->wait_num_reports)
+				min_data_present = true;
+		}
+		xecore_buf->write = write_ptr;
+		mutex_unlock(&xecore_buf->ptr_lock);
+	}
+	return min_data_present;
+}
+
+static int xe_eu_stall_data_buf_read(struct xe_eu_stall_data_stream *stream,
+				     char __user *buf, size_t count,
+				     size_t *total_data_size, struct xe_gt *gt,
+				     u16 group, u16 instance, unsigned int xecore)
+{
+	size_t read_data_size, copy_size, buf_size, data_record_size;
+	u32 read_ptr_reg, read_ptr, write_ptr;
+	u8 *xecore_start_vaddr, *read_vaddr;
+	struct per_xecore_buf *xecore_buf;
+	u32 read_offset, write_offset;
+	int ret = 0;
+
+	/* Hardware increments the read and write pointers such that they can
+	 * overflow into one additional bit. For example, a 256KB size buffer
+	 * offset pointer needs 18 bits. But HW uses 19 bits for the read and
+	 * write pointers. This technique avoids wasting a slot in the buffer.
+	 * Read and write offsets are calculated from the pointers in order to
+	 * check if the write pointer has wrapped around the array.
+	 */
+	xecore_buf = &stream->xecore_buf[xecore];
+	mutex_lock(&xecore_buf->ptr_lock);
+	xecore_start_vaddr = xecore_buf->vaddr;
+	read_ptr = xecore_buf->read;
+	write_ptr = xecore_buf->write;
+	buf_size = stream->per_xecore_buf_size;
+	data_record_size = stream->data_record_size;
+
+	read_data_size = buf_data_size(buf_size, read_ptr, write_ptr);
+	/* Read only the data that the user space buffer can accommodate */
+	if ((*total_data_size + read_data_size) > count) {
+		read_data_size = count - *total_data_size;
+		read_data_size = (read_data_size / data_record_size) * data_record_size;
+	}
+	if (read_data_size == 0)
+		goto exit;
+
+	read_offset = read_ptr & (buf_size - 1);
+	write_offset = write_ptr & (buf_size - 1);
+	read_vaddr = xecore_start_vaddr + read_offset;
+
+	if (write_offset > read_offset) {
+		if (copy_to_user((buf + *total_data_size), read_vaddr, read_data_size)) {
+			ret = -EFAULT;
+			goto exit;
+		}
+	} else {
+		if (read_data_size >= (buf_size - read_offset))
+			copy_size = buf_size - read_offset;
+		else
+			copy_size = read_data_size;
+		if (copy_to_user((buf + *total_data_size), read_vaddr, copy_size)) {
+			ret = -EFAULT;
+			goto exit;
+		}
+		if (copy_to_user((buf + *total_data_size + copy_size),
+				 xecore_start_vaddr, read_data_size - copy_size)) {
+			ret = -EFAULT;
+			goto exit;
+		}
+	}
+
+	*total_data_size += read_data_size;
+	read_ptr += read_data_size;
+
+	/* Read pointer can overflow into one additional bit */
+	read_ptr &= (buf_size << 1) - 1;
+	read_ptr_reg = REG_FIELD_PREP(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, (read_ptr >> 6));
+	read_ptr_reg = _MASKED_FIELD(XEHPC_EUSTALL_REPORT1_READ_PTR_MASK, read_ptr_reg);
+	xe_gt_mcr_unicast_write(gt, XEHPC_EUSTALL_REPORT1, read_ptr_reg, group, instance);
+	xecore_buf->read = read_ptr;
+	trace_xe_eu_stall_data_read(group, instance, read_ptr, write_ptr,
+				    read_offset, write_offset, *total_data_size);
+exit:
+	mutex_unlock(&xecore_buf->ptr_lock);
+	return ret;
+}
+
+/**
+ * xe_eu_stall_stream_read_locked - copy EU stall counters data from the
+ *				    per xecore buffers to the userspace buffer
+ * @stream: A stream opened for EU stall count metrics
+ * @file: An xe EU stall data stream file
+ * @buf: destination buffer given by userspace
+ * @count: the number of bytes userspace wants to read
+ *
+ * Returns: Number of bytes copied or a negative error code
+ * If we've successfully copied any data then reporting that takes
+ * precedence over any internal error status, so the data isn't lost.
+ */
+static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *stream,
+					      struct file *file, char __user *buf,
+					      size_t count)
+{
+	struct xe_gt *gt = stream->gt;
+	size_t total_size = 0;
+	u16 group, instance;
+	unsigned int xecore;
+	int ret = 0;
+
+	for_each_dss_steering(xecore, gt, group, instance) {
+		ret = xe_eu_stall_data_buf_read(stream, buf, count, &total_size,
+						gt, group, instance, xecore);
+		if (ret || count == total_size)
+			break;
+	}
+	return total_size ?: (ret ?: -EAGAIN);
+}
+
 /**
  * xe_eu_stall_stream_read - handles userspace read() of a EU stall data stream fd.
  *
@@ -272,7 +461,35 @@ static int xe_eu_stall_user_extensions(struct xe_device *xe, u64 extension,
 static ssize_t xe_eu_stall_stream_read(struct file *file, char __user *buf,
 				       size_t count, loff_t *ppos)
 {
-	ssize_t ret = 0;
+	struct xe_eu_stall_data_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+	ssize_t ret;
+
+	if (count == 0)
+		return -EINVAL;
+
+	if (!stream->enabled) {
+		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
+		return -EINVAL;
+	}
+
+	if (!(file->f_flags & O_NONBLOCK)) {
+		do {
+			ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
+			if (ret)
+				return -EINTR;
+
+			mutex_lock(&gt->eu_stall->stream_lock);
+			ret = xe_eu_stall_stream_read_locked(stream, file, buf, count);
+			mutex_unlock(&gt->eu_stall->stream_lock);
+		} while (ret == -EAGAIN);
+	} else {
+		mutex_lock(&gt->eu_stall->stream_lock);
+		ret = xe_eu_stall_stream_read_locked(stream, file, buf, count);
+		mutex_unlock(&gt->eu_stall->stream_lock);
+	}
+
+	stream->pollin = false;
 
 	return ret;
 }
@@ -281,6 +498,7 @@ static void free_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream)
 {
 	if (stream->bo)
 		xe_bo_unpin_map_no_vm(stream->bo);
+	destroy_workqueue(stream->buf_poll_wq);
 }
 
 static int alloc_eu_stall_data_buf(struct xe_eu_stall_data_stream *stream,
@@ -351,6 +569,21 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
 	return 0;
 }
 
+static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
+{
+	struct xe_eu_stall_data_stream *stream =
+		container_of(work, typeof(*stream), buf_poll_work.work);
+
+	if (eu_stall_data_buf_poll(stream)) {
+		stream->pollin = true;
+		wake_up(&stream->poll_wq);
+	}
+	if (stream->enabled)
+		queue_delayed_work(stream->buf_poll_wq,
+				   &stream->buf_poll_work,
+				   msecs_to_jiffies(POLL_PERIOD_MS));
+}
+
 static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 				   struct eu_stall_open_properties *props)
 {
@@ -361,6 +594,11 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 	u32 vaddr_offset;
 	int ret, xecore;
 
+	init_waitqueue_head(&stream->poll_wq);
+	INIT_DELAYED_WORK(&stream->buf_poll_work, eu_stall_data_buf_poll_work_fn);
+	stream->buf_poll_wq = alloc_ordered_workqueue("xe_eu_stall", 0);
+	if (!stream->buf_poll_wq)
+		return -ENOMEM;
 	stream->sampling_rate_mult = props->sampling_rate_mult;
 	stream->wait_num_reports = props->wait_num_reports;
 	stream->per_xecore_buf_size = per_xecore_buf_size;
@@ -391,6 +629,19 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
 	return 0;
 }
 
+static __poll_t xe_eu_stall_stream_poll_locked(struct xe_eu_stall_data_stream *stream,
+					       struct file *file, poll_table *wait)
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
 /**
  * xe_eu_stall_stream_poll - handles userspace poll() of a EU stall data stream fd.
  *
@@ -401,7 +652,13 @@ static int xe_eu_stall_stream_init(struct xe_eu_stall_data_stream *stream,
  */
 static __poll_t xe_eu_stall_stream_poll(struct file *file, poll_table *wait)
 {
-	__poll_t ret = 0;
+	struct xe_eu_stall_data_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+	__poll_t ret;
+
+	mutex_lock(&gt->eu_stall->stream_lock);
+	ret = xe_eu_stall_stream_poll_locked(stream, file, wait);
+	mutex_unlock(&gt->eu_stall->stream_lock);
 
 	return ret;
 }
@@ -416,6 +673,9 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
 	stream->enabled = true;
 
 	ret = xe_eu_stall_stream_enable(stream);
+	queue_delayed_work(stream->buf_poll_wq,
+			   &stream->buf_poll_work,
+			   msecs_to_jiffies(POLL_PERIOD_MS));
 	return ret;
 }
 
@@ -429,6 +689,9 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
 	stream->enabled = false;
 
 	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, 0);
+	/* Check for any new EU stall data one last time */
+	queue_delayed_work(stream->buf_poll_wq, &stream->buf_poll_work, 0);
+	flush_delayed_work(&stream->buf_poll_work);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_RENDER);
 	xe_pm_runtime_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index d5281de04d54..1cc6bfc34ccb 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -427,6 +427,39 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
 	     TP_ARGS(xe, caller)
 );
 
+TRACE_EVENT(xe_eu_stall_data_read,
+	    TP_PROTO(u8 slice, u8 subslice,
+		     u32 read_ptr, u32 write_ptr,
+		     u32 read_offset, u32 write_offset,
+		     size_t total_size),
+	    TP_ARGS(slice, subslice, read_ptr, write_ptr,
+		    read_offset, write_offset, total_size),
+
+	    TP_STRUCT__entry(__field(u8, slice)
+			     __field(u8, subslice)
+			     __field(u32, read_ptr)
+			     __field(u32, write_ptr)
+			     __field(u32, read_offset)
+			     __field(u32, write_offset)
+			     __field(size_t, total_size)
+			     ),
+
+	    TP_fast_assign(__entry->slice = slice;
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
-- 
2.48.1

