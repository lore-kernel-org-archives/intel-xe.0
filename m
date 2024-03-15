Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE20C54E5D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1C110FF3F;
	Fri, 15 Mar 2024 01:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jbc8EvGz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3932410FF3A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710466526; x=1742002526;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=n3qsZm2bHum//mA6c6S8d5OQg+RGRinKln33krwzfWA=;
 b=Jbc8EvGzMcuUP+0Q/L6HFdv53oVNpDWe7wDbf5aW/qsP3K+ADhFACTiJ
 nII4pgi9wLszdlsqHQICVEBkzQbaglj0Mhhk4ufHO4oBrH5HYsMHuVo6w
 7OZ8am7sa60twVwY1YUxWvxEdlcEXiLON1Q9YaQkx3wR5tOi7BkaepafO
 Xef4hysBvVj9KE3IUAemWgXXO8Iww9ZtGVy7N7hqI/olinqa3sI3So9xr
 eX/IEEjqNTrjZy9c1/gh1nJU4UXNZABL/rFNZz6PE94Y9olzWG3x6Zi9G
 NIOUYObmoOu0y7KYaJqORzyu/cvm1Zlv0zb55+43u/sb2t06wOVVClhmw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15963131"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="15963131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="43397266"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:35:23 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/17] drm/xe/oa/uapi: Read file_operation
Date: Thu, 14 Mar 2024 18:35:10 -0700
Message-ID: <20240315013518.2848986-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
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
v6: Minor cleanup, eliminate report32 variable

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 172 +++++++++++++++++++++++++++++++++++++
 include/uapi/drm/xe_drm.h  |  19 ++++
 2 files changed, 191 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index adbc5162bede..183e3dc14385 100644
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
@@ -238,6 +254,95 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
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
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+	head = stream->oa_buffer.head;
+	tail = stream->oa_buffer.tail;
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
+	xe_assert(stream->oa->xe, head < XE_OA_BUFFER_SIZE && tail < XE_OA_BUFFER_SIZE);
+
+	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
+		u8 *report = oa_buf_base + head;
+
+		ret = xe_oa_append_report(stream, buf, count, offset, report);
+		if (ret)
+			break;
+
+		if (is_power_of_2(report_size)) {
+			/* Clear out report id and timestamp to detect unlanded reports */
+			oa_report_id_clear(stream, (void *)report);
+			oa_timestamp_clear(stream, (void *)report);
+		} else {
+			u8 *oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
+			u32 part = oa_buf_end - report;
+
+			/* Zero out the entire report */
+			if (report_size <= part) {
+				memset(report, 0, report_size);
+			} else {
+				memset(report, 0, part);
+				memset(oa_buf_base, 0, report_size - part);
+			}
+		}
+	}
+
+	if (start_offset != *offset) {
+		struct xe_reg oaheadptr = __oa_regs(stream)->oa_head_ptr;
+
+		spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+		xe_mmio_write32(stream->gt, oaheadptr,
+				(head + gtt_offset) & OAG_OAHEADPTR_MASK);
+		stream->oa_buffer.head = head;
+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+	}
+
+	return ret;
+}
+
 static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
@@ -308,6 +413,56 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
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
@@ -669,6 +824,20 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
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
@@ -682,6 +851,8 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 		return 0;
 	case DRM_XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
+	case DRM_XE_PERF_IOCTL_STATUS:
+		return xe_oa_status_locked(stream, arg);
 	}
 
 	return -EINVAL;
@@ -734,6 +905,7 @@ static const struct file_operations xe_oa_fops = {
 	.llseek		= no_llseek,
 	.release	= xe_oa_release,
 	.poll		= xe_oa_poll,
+	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8e60cf3bbfec..4bfa06ebf6da 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1546,6 +1546,25 @@ struct drm_xe_oa_config {
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

