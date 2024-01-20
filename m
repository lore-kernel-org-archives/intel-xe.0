Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A87C47DAF
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C7A10EAEE;
	Sat, 20 Jan 2024 02:00:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DE410EAD2
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716032; x=1737252032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSDLpLClT3TLqPbd9RHR/aeFhfJ6cFB5oH5e60HfMc0=;
 b=V3BC0Jlhp0vE15QD0GAojZjl1Zp2HrBnsv/3Bg0E2DIHTp73Co/S/n5m
 IrYlysV4yEPM4wVWgaSFY020wLMF0itZH7vvz3hFYHnIssaNGGvAGFpHh
 LxOJQRAZ9VdsMznhSE/326awgKDduWvsx59STUW7iGGhDzve69wTh4FuP
 CZODHuY/F4kXF9I0m6pc0FGdv4vR3h4V2YkqvHqA8VSDvLX0iJoS7FT+R
 UWWySxI6ACyvjKqk02qvBwE60YluXrT60z0RDb7jpwQ20KOdTmkqEzw/7
 CJZQrJlLexZKxxu3frFWuJdKN6jR0hfJVpGvnAWdi/mDoFzkL6eJkw+9k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472944"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472944"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125715"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125715"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/16] drm/xe/oa/uapi: Read file_operation
Date: Fri, 19 Jan 2024 18:00:19 -0800
Message-ID: <20240120020026.1261201-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 175 +++++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a2e3f7965639c..745ebeb045e8b 100644
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
@@ -660,6 +824,14 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream,
 	return ret;
 }
 
+static long xe_oa_status_locked(struct xe_oa_stream *stream)
+{
+	u32 ret = xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_status);
+
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
+	return ret;
+}
+
 static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
@@ -673,6 +845,8 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 		return 0;
 	case DRM_XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
+	case DRM_XE_PERF_IOCTL_STATUS:
+		return xe_oa_status_locked(stream);
 	}
 
 	return -EINVAL;
@@ -725,6 +899,7 @@ static const struct file_operations xe_oa_fops = {
 	.llseek		= no_llseek,
 	.release	= xe_oa_release,
 	.poll		= xe_oa_poll,
+	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
-- 
2.41.0

