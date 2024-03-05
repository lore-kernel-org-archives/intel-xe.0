Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6513C54E5D
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 05:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB6C11270F;
	Tue,  5 Mar 2024 05:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ztm/BswR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFE7112710
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 05:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709616811; x=1741152811;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5c3kKqINOskldlG+8wxZzRMdeGgxI7JDVlUtTf4FxCs=;
 b=Ztm/BswRQaZQ1yTX7HISId69oGQdaYkhUrz+vTjtAY9OODWYWIWVNV9U
 yT804WldjFfN60FJOr7k9MLqnGrPYxTxaESiZYkQPUWx/tR9cIwI/bJ4Z
 DOek3ec9T9HBmMI7B3l01tKb3/V4RVWF1n3tt9NT9pJ+Gt1p5lum4lMK8
 RXQJC5AEVkOQ7WvVCLvUxzDAJcRSU58bFUqJIfq89hC1fjkWPJg5bLd7o
 lD5fohrpXn4jRSWNqRrpo+lXlic1JGv8cz2BbedS+JhrDafj07+nrAURV
 83VtW0QqzuqqwGfKqSueT9KtbRrOftrmKIusP41A8TrEWRmghInXBN0DK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21601503"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="21601503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9660210"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:33:12 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/16] drm/xe/oa/uapi: Read file_operation
Date: Mon,  4 Mar 2024 21:32:53 -0800
Message-ID: <20240305053300.2406240-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
References: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
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

Implement the OA stream read file_operation. Both blocking and non-blocking
reads are supported. As part of read system call, the read copies OA perf
data from the OA buffer to the user buffer, after appending packet headers
for status and data packets.

v2: Drop OA report headers, implement DRM_XE_PERF_IOCTL_STATUS (Umesh)
v3: Introduce 'struct drm_xe_oa_stream_status'
v4: Define oa_status register bitfields (Umesh)
v5: Add extensions to 'struct drm_xe_oa_stream_status'

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 181 +++++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h  |  19 ++++
 2 files changed, 200 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index adbc5162bede..6e8f8bc97254 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -157,6 +157,14 @@ static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
 	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
 }
 
+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
+{
+	if (oa_report_header_64bit(stream))
+		*(u64 *)report = 0;
+	else
+		*report = 0;
+}
+
 static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
 {
 	return oa_report_header_64bit(stream) ?
@@ -164,6 +172,14 @@ static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
 		*((u32 *)report + 1);
 }
 
+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
+{
+	if (oa_report_header_64bit(stream))
+		*(u64 *)&report[2] = 0;
+	else
+		report[1] = 0;
+}
+
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
@@ -238,6 +254,104 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }
 
+static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
+			       size_t count, size_t *offset, const u8 *report)
+{
+	int report_size = stream->oa_buffer.format->size;
+	int report_size_partial;
+	u8 *oa_buf_end;
+
+	if ((count - *offset) < report_size)
+		return -ENOSPC;
+
+	buf += *offset;
+
+	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
+	report_size_partial = oa_buf_end - report;
+
+	if (report_size_partial < report_size) {
+		if (copy_to_user(buf, report, report_size_partial))
+			return -EFAULT;
+		buf += report_size_partial;
+
+		if (copy_to_user(buf, stream->oa_buffer.vaddr,
+				 report_size - report_size_partial))
+			return -EFAULT;
+	} else if (copy_to_user(buf, report, report_size)) {
+		return -EFAULT;
+	}
+
+	*offset += report_size;
+
+	return 0;
+}
+
+static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
+				size_t count, size_t *offset)
+{
+	int report_size = stream->oa_buffer.format->size;
+	u8 *oa_buf_base = stream->oa_buffer.vaddr;
+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
+	u32 mask = (XE_OA_BUFFER_SIZE - 1);
+	size_t start_offset = *offset;
+	unsigned long flags;
+	u32 head, tail;
+	int ret = 0;
+
+	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->enabled))
+		return -EIO;
+
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+
+	head = stream->oa_buffer.head;
+	tail = stream->oa_buffer.tail;
+
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
+	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
+
+	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
+		u8 *report = oa_buf_base + head;
+		u32 *report32 = (void *)report;
+
+		ret = xe_oa_append_report(stream, buf, count, offset, report);
+		if (ret)
+			break;
+
+		if (is_power_of_2(report_size)) {
+			/* Clear out report id and timestamp to detect unlanded reports */
+			oa_report_id_clear(stream, report32);
+			oa_timestamp_clear(stream, report32);
+		} else {
+			u8 *oa_buf_end = stream->oa_buffer.vaddr +
+					 XE_OA_BUFFER_SIZE;
+			u32 part = oa_buf_end - (u8 *)report32;
+
+			/* Zero out the entire report */
+			if (report_size <= part) {
+				memset(report32, 0, report_size);
+			} else {
+				memset(report32, 0, part);
+				memset(oa_buf_base, 0, report_size - part);
+			}
+		}
+	}
+
+	if (start_offset != *offset) {
+		struct xe_reg oaheadptr = __oa_regs(stream)->oa_head_ptr;
+
+		spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+
+		xe_mmio_write32(stream->gt, oaheadptr,
+				(head + gtt_offset) & OAG_OAHEADPTR_MASK);
+		stream->oa_buffer.head = head;
+
+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+	}
+
+	return ret;
+}
+
 static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
@@ -308,6 +422,56 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 			"wait for OA tlb invalidate timed out\n");
 }
 
+static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
+{
+	/* We might wait indefinitely if periodic sampling is not enabled */
+	if (!stream->periodic)
+		return -EIO;
+
+	return wait_event_interruptible(stream->poll_wq,
+					xe_oa_buffer_check_unlocked(stream));
+}
+
+static ssize_t xe_oa_read(struct file *file, char __user *buf,
+			  size_t count, loff_t *ppos)
+{
+	struct xe_oa_stream *stream = file->private_data;
+	size_t offset = 0;
+	int ret;
+
+	/* Can't read from disabled streams */
+	if (!stream->enabled || !stream->sample)
+		return -EIO;
+
+	if (!(file->f_flags & O_NONBLOCK)) {
+		do {
+			ret = xe_oa_wait_unlocked(stream);
+			if (ret)
+				return ret;
+
+			mutex_lock(&stream->stream_lock);
+			ret = xe_oa_append_reports(stream, buf, count, &offset);
+			mutex_unlock(&stream->stream_lock);
+		} while (!offset && !ret);
+	} else {
+		mutex_lock(&stream->stream_lock);
+		ret = xe_oa_append_reports(stream, buf, count, &offset);
+		mutex_unlock(&stream->stream_lock);
+	}
+
+	/*
+	 * Typically we clear pollin here in order to wait for the new hrtimer callback
+	 * before unblocking. The exception to this is if __xe_oa_read returns -ENOSPC,
+	 * which means that more OA data is available than could fit in the user provided
+	 * buffer. In this case we want the next poll() call to not block.
+	 */
+	if (ret != -ENOSPC)
+		stream->pollin = false;
+
+	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, ... */
+	return offset ?: (ret ?: -EAGAIN);
+}
+
 static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 				  struct file *file, poll_table *wait)
 {
@@ -669,6 +833,20 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 	return ret;
 }
 
+static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
+{
+	struct drm_xe_oa_stream_status status = {};
+	void __user *uaddr = (void __user *)arg;
+
+	status.oa_status = xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_status);
+
+	if (copy_to_user(uaddr, &status, sizeof(status)))
+		return -EFAULT;
+
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
+	return 0;
+}
+
 static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
@@ -682,6 +860,8 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 		return 0;
 	case DRM_XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
+	case DRM_XE_PERF_IOCTL_STATUS:
+		return xe_oa_status_locked(stream, arg);
 	}
 
 	return -EINVAL;
@@ -734,6 +914,7 @@ static const struct file_operations xe_oa_fops = {
 	.llseek		= no_llseek,
 	.release	= xe_oa_release,
 	.poll		= xe_oa_poll,
+	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 975845206818..499f542ddc03 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1538,6 +1538,25 @@ struct drm_xe_oa_config {
 	__u64 regs_ptr;
 };
 
+/**
+ * struct drm_xe_oa_stream_status - OA stream status returned from
+ * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
+ */
+struct drm_xe_oa_stream_status {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_status: OA status register as specified in PRM/Bspec 46717/61226 */
+	__u64 oa_status;
+#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 6)
+#define DRM_XE_OASTATUS_COUNTER_OVERFLOW	(1 << 2)
+#define DRM_XE_OASTATUS_BUFFER_OVERFLOW		(1 << 1)
+#define DRM_XE_OASTATUS_REPORT_LOST		(1 << 0)
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[3];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

