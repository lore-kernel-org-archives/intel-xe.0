Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327CEEE57C8
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F287610E870;
	Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A9A10E869
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147035; x=1725683035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BmHeoETFVoULoMZHeKvM1UGPXwND/4Yip7SFa7x74lE=;
 b=f4Q22oRw0y9Y7pQ7mqoJKrcbOGq+XJd0PBGcFCpmq4J6rAs2z7DXHbFx
 IcxxdBjt4ulgZw4+3/ERd82vlkp5XTPN74aW2JPAVVyaVNhCEswG6E+aU
 uN5FhT+51ujPAn9oOOAX79Pc+Da5+B/7GJOcqCzQTS5cIjJJoxklkGH5Y
 s//IMnn9simcbQ90FxwZuaBXYPJVRWta54d0uvuBV9BfOxi0QGwC1dawG
 rP5tTntveT7e8Jpp7vYHoNcOpxd2KszEQDhQOG2o8rgd9ki348eHk1VtK
 bd5hvX/fmiSlZT2ftLB1rV5+NtbYgaQczI0zIzUJTVH90pRY6/NE4326t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935395"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935395"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200737"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200737"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:55 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:40 -0700
Message-ID: <20230908042348.1592535-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/17] drm/xe/oa: Read file_operation
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

Finally implement the OA stream read file_operation which was the only fop
missing in the previous commit. Both blocking and non-blocking reads are
supported. The read copies OA perf data from the OA buffer to the user
buffer provided as part of read system call.

v2: Implement oa_report_ctx_invalid (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 360 +++++++++++++++++++++++++++++++++++++
 1 file changed, 360 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index ba5ae2cc16065..f9d6fb9b75c26 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -146,6 +146,30 @@ static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
 	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
 }
 
+#define OAREPORT_REASON_MASK_EXTENDED	GENMASK(25, 19)
+#define OAREPORT_REASON_TIMER		BIT(0)
+#define OAREPORT_REASON_CTX_SWITCH	BIT(3)
+#define OAREPORT_REASON_CLK_RATIO	BIT(5)
+#define OAREPORT_CONTEXT_VALID		BIT(16)
+
+static u64 oa_report_reason(struct xe_oa_stream *stream, void *report)
+{
+	return FIELD_GET(OAREPORT_REASON_MASK_EXTENDED, oa_report_id(stream, report));
+}
+
+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
+{
+	if (oa_report_header_64bit(stream))
+		*(u64 *)report = 0;
+	else
+		*report = 0;
+}
+
+static bool oa_report_ctx_invalid(struct xe_oa_stream *stream, void *report)
+{
+	return !(oa_report_id(stream, report) & OAREPORT_CONTEXT_VALID);
+}
+
 static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
 {
 	return oa_report_header_64bit(stream) ?
@@ -153,6 +177,29 @@ static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
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
+static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
+{
+	u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
+
+	return ctx_id & stream->specific_ctx_id_mask;
+}
+
+static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
+{
+	if (oa_report_header_64bit(stream))
+		report[4] = INVALID_CTX_ID;
+	else
+		report[2] = INVALID_CTX_ID;
+}
+
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
@@ -234,6 +281,199 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
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
+	oa_buf_end = stream->oa_buffer.vaddr + OA_BUFFER_SIZE;
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
+	u32 mask = (OA_BUFFER_SIZE - 1);
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
+			  head > OA_BUFFER_SIZE || tail > OA_BUFFER_SIZE,
+			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
+			  head, tail))
+		return -EIO;
+
+	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
+		u8 *report = oa_buf_base + head;
+		u32 ctx_id, *report32 = (void *)report;
+		u64 reason;
+
+		/*
+		 * The reason field indicates what triggered this report (e.g. timer
+		 * triggered or a context switch).
+		 *
+		 * In MMIO triggered reports, some platforms do not set the reason bit in
+		 * this field and it is valid to have a reason field of zero.
+		 */
+		reason = oa_report_reason(stream, report);
+		ctx_id = oa_context_id(stream, report32);
+
+		/*
+		 * Squash whatever is in the CTX_ID field if it's marked as invalid to be
+		 * sure we avoid false-positive, single-context filtering below...
+		 *
+		 * Note: we don't clear the valid_ctx_bit so userspace can understand that
+		 * the ID has been squashed by the kernel.
+		 */
+		if (oa_report_ctx_invalid(stream, report)) {
+			ctx_id = INVALID_CTX_ID;
+			oa_context_id_squash(stream, report32);
+		}
+
+		/*
+		 * NB: The OA unit does not support clock gating off for a specific
+		 * context and the kernel can't securely stop counters from updating as
+		 * system-wide/global values.
+		 *
+		 * Automatic reports include a context ID so reports can be filtered on
+		 * the cpu but it's not worth trying to automatically subtract/hide
+		 * counter progress for other contexts while filtering since userspace can
+		 * issue MI_REPORT_PERF_COUNT commands which would still provide a
+		 * side-band view of the real values.
+		 *
+		 * To allow userspace to normalize counters for a single filtered context
+		 * then it needs be forwarded bookend context-switch reports so that it
+		 * can track switches in between MI_REPORT_PERF_COUNT commands and can
+		 * itself subtract/ignore the progress of counters associated with other
+		 * contexts. Note that the hardware automatically triggers reports when
+		 * switching to a new context which are tagged with the ID of the newly
+		 * active context. To avoid the complexity of reading ahead while parsing
+		 * reports to try and minimize forwarding redundant context switch reports
+		 * (i.e. between other, unrelated contexts) we simply elect to forward
+		 * them all.
+		 *
+		 * We don't rely solely on the reason field to identify context switches
+		 * since it's not-uncommon for periodic samples to identify a switch
+		 * before any 'context switch' report.
+		 */
+		if (!stream->exec_q || stream->specific_ctx_id == ctx_id ||
+		    stream->oa_buffer.last_ctx_id == stream->specific_ctx_id ||
+		    reason & OAREPORT_REASON_CTX_SWITCH) {
+			/*
+			 * While filtering for a single context we avoid
+			 * leaking the IDs of other contexts.
+			 */
+			if (stream->exec_q && stream->specific_ctx_id != ctx_id)
+				oa_context_id_squash(stream, report32);
+
+			ret = xe_oa_append_sample(stream, buf, count, offset, report);
+			if (ret)
+				break;
+
+			stream->oa_buffer.last_ctx_id = ctx_id;
+		}
+
+		if (is_power_of_2(report_size)) {
+			/*
+			 * Clear out report id and timestamp as a means to
+			 * detect unlanded reports.
+			 */
+			oa_report_id_clear(stream, report32);
+			oa_timestamp_clear(stream, report32);
+		} else {
+			u8 *oa_buf_end = stream->oa_buffer.vaddr +
+					 OA_BUFFER_SIZE;
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
+				(head + gtt_offset) & GEN12_OAG_OAHEADPTR_MASK);
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
@@ -305,6 +545,125 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
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
+	/*
+	 * We treat OABUFFER_OVERFLOW as a significant error:
+	 *
+	 * We could handle this more gracefully, but some Gens don't correctly suppress
+	 * certain automatically triggered reports in this condition and so we have to
+	 * assume that old reports are now being trampled over.
+	 *
+	 * Considering how we don't currently give userspace control over the OA buffer
+	 * size and always configure a large 16MB buffer, then a buffer overflow does
+	 * anyway likely indicate that something has gone quite badly wrong.
+	 */
+	if (oastatus & GEN12_OAG_OASTATUS_BUFFER_OVERFLOW) {
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
+		/*
+		 * Note: oa_enable is expected to re-init the oabuffer and reset
+		 * oastatus_reg for us
+		 */
+		oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
+	}
+
+	if (oastatus & GEN12_OAG_OASTATUS_REPORT_LOST) {
+		ret = xe_oa_append_status(stream, buf, count, offset,
+					  DRM_XE_OA_RECORD_OA_REPORT_LOST);
+		if (ret)
+			return ret;
+
+		xe_mmio_rmw32(stream->gt, oastatus_reg,
+			      GEN12_OAG_OASTATUS_COUNTER_OVERFLOW |
+			      GEN12_OAG_OASTATUS_REPORT_LOST, 0);
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
+		/*
+		 * There's the small chance of false positives from wait_unlocked,
+		 * e.g. with single engine filtering since we only wait until oabuffer
+		 * has >= 1 report we don't immediately know whether any reports really
+		 * belong to the current engine.
+		 */
+		do {
+			ret = xe_oa_wait_unlocked(stream);
+			if (ret)
+				return ret;
+
+			mutex_lock(&stream->lock);
+			ret = __xe_oa_read(stream, buf, count, &offset);
+			mutex_unlock(&stream->lock);
+		} while (!offset && !ret);
+	} else {
+		mutex_lock(&stream->lock);
+		ret = __xe_oa_read(stream, buf, count, &offset);
+		mutex_unlock(&stream->lock);
+	}
+
+	/*
+	 * We allow the poll checking to sometimes report false positive EPOLLIN
+	 * events where we might actually report EAGAIN on read() if there's
+	 * not really any data available. In this situation though we don't
+	 * want to enter a busy loop between poll() reporting a EPOLLIN event
+	 * and read() returning -EAGAIN. Clearing the oa.pollin state here
+	 * effectively ensures we back off until the next hrtimer callback
+	 * before reporting another EPOLLIN event.
+	 * The exception to this is if __xe_oa_read returned -ENOSPC which means
+	 * that more OA data is available than could fit in the user provided
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
@@ -873,6 +1232,7 @@ static const struct file_operations xe_oa_fops = {
 	.llseek		= no_llseek,
 	.release	= xe_oa_release,
 	.poll		= xe_oa_poll,
+	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
-- 
2.41.0

