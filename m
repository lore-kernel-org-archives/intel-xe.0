Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB2AC10F07
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EAD10E9D9;
	Fri,  8 Dec 2023 06:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830BB10E9D6
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017816; x=1733553816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZQjuRw8SeS32Hc+6DM+GLmQaG8eVN2HGJHsZLjCSXY=;
 b=SARzbfMKmIVSEBWGf+epK/jZo09PoUjkV8Rp6ZqnFbHmi5y9/S53E3We
 MiPYH/fdv1HFeb4pg7hIGz5sjq9+DpefV4Tyzc46RBwUzElNHzrlFrwHA
 /PXRU8sl+VDDch6UMOCd+p8rChPqrbfnOcX5Jt65vNH6WhL41N7+yTvOh
 Gf2oJ91zFq0Vd4R5TsxWACIox3QIv3GWEob5tpTEzy5ySl4WB59Vkd9/L
 THA7g7W1RlpsFeIvW3a+xLroLp3ic6TopaY4D+dInW4h2ZYkA+7+1muHy
 Zlmb2ks3plQhMM4m9lps2B3lYeL0DjaFE4dQo+ctVM3dzhre1WDyEl/Qe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866611"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866611"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699250"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699250"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:35 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/17] drm/xe/oa/uapi: Read file_operation
Date: Thu,  7 Dec 2023 22:43:22 -0800
Message-ID: <20231208064329.2387604-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 239 +++++++++++++++++++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b6e94dba5f525..5744436188dcd 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -170,6 +170,14 @@ static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
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
@@ -177,6 +185,14 @@ static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
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
@@ -251,6 +267,134 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
 	return HRTIMER_RESTART;
 }
 
+static int xe_oa_append_status(struct xe_oa_stream *stream, char __user *buf,
+			       size_t count, size_t *offset,
+			       enum drm_xe_oa_record_type type)
+{
+	struct drm_xe_oa_record_header header = { type, 0, sizeof(header) };
+
+	if ((count - *offset) < header.size)
+		return -ENOSPC;
+
+	if (copy_to_user(buf + *offset, &header, sizeof(header)))
+		return -EFAULT;
+
+	*offset += header.size;
+
+	return 0;
+}
+
+static int xe_oa_append_sample(struct xe_oa_stream *stream, char __user *buf,
+			       size_t count, size_t *offset, const u8 *report)
+{
+	int report_size = stream->oa_buffer.format->size;
+	struct drm_xe_oa_record_header header;
+	int report_size_partial;
+	u8 *oa_buf_end;
+
+	header.type = DRM_XE_OA_RECORD_SAMPLE;
+	header.pad = 0;
+	header.size = stream->sample_size;
+
+	if ((count - *offset) < header.size)
+		return -ENOSPC;
+
+	buf += *offset;
+	if (copy_to_user(buf, &header, sizeof(header)))
+		return -EFAULT;
+	buf += sizeof(header);
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
+	*offset += header.size;
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
+	/* An out of bounds or misaligned head or tail pointer implies a driver bug */
+	if (drm_WARN_ONCE(&stream->oa->xe->drm,
+			  head > XE_OA_BUFFER_SIZE || tail > XE_OA_BUFFER_SIZE,
+			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
+			  head, tail))
+		return -EIO;
+
+	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
+		u8 *report = oa_buf_base + head;
+		u32 *report32 = (void *)report;
+
+		ret = xe_oa_append_sample(stream, buf, count, offset, report);
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
@@ -321,6 +465,100 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 			"wait for OA tlb invalidate timed out\n");
 }
 
+static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
+			size_t count, size_t *offset)
+{
+	struct xe_reg oastatus_reg = __oa_regs(stream)->oa_status;
+	u32 oastatus;
+	int ret;
+
+	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->oa_buffer.vaddr))
+		return -EIO;
+
+	oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
+
+	/* We treat OABUFFER_OVERFLOW as a significant error */
+	if (oastatus & OAG_OASTATUS_BUFFER_OVERFLOW) {
+		ret = xe_oa_append_status(stream, buf, count, offset,
+					  DRM_XE_OA_RECORD_OA_BUFFER_LOST);
+		if (ret)
+			return ret;
+
+		drm_dbg(&stream->oa->xe->drm,
+			"OA buffer overflow (exponent = %d): force restart\n",
+			stream->period_exponent);
+
+		xe_oa_disable(stream);
+		xe_oa_enable(stream);
+
+		/* oa_enable will re-init oabuffer and reset oastatus_reg */
+		oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
+	}
+
+	if (oastatus & OAG_OASTATUS_REPORT_LOST) {
+		ret = xe_oa_append_status(stream, buf, count, offset,
+					  DRM_XE_OA_RECORD_OA_REPORT_LOST);
+		if (ret)
+			return ret;
+
+		xe_mmio_rmw32(stream->gt, oastatus_reg,
+			      OAG_OASTATUS_COUNTER_OVERFLOW |
+			      OAG_OASTATUS_REPORT_LOST, 0);
+	}
+
+	return xe_oa_append_reports(stream, buf, count, offset);
+}
+
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
+			ret = __xe_oa_read(stream, buf, count, &offset);
+			mutex_unlock(&stream->stream_lock);
+		} while (!offset && !ret);
+	} else {
+		mutex_lock(&stream->stream_lock);
+		ret = __xe_oa_read(stream, buf, count, &offset);
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
@@ -738,6 +976,7 @@ static const struct file_operations xe_oa_fops = {
 	.llseek		= no_llseek,
 	.release	= xe_oa_release,
 	.poll		= xe_oa_poll,
+	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
-- 
2.41.0

