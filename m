Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E799C27C65
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC1410ED0E;
	Fri,  7 Jun 2024 20:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THDrhToF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254BB10ED0A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717793007; x=1749329007;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JqOmlgAbg/MHXAceICzTWEjjfr8zJomc8smddog5Qy0=;
 b=THDrhToFxYDuBBRSM7Ke1H8tsHQMSgLlWN4Op6xg7PZW1WyVb2XZF3pI
 VHROwa+uaptgCUwIqBOAREa5XPA54DF/hKt1tEC4ukwxGAt/hjX1A3ndw
 zyyR0x0qBpQO1XwQGFRObDfGkXLSR66EJ0XpOS/TL9L5M7IdHXnip+T6C
 zm5ktcslRswhwcPtYD91Wix+rHWCC9LsgvjPIfVXUWE0Oo0VYvYgD90AP
 GD18AdvKyDQHeddf1A/L1oQuImC2d7eHcuKsa/Slme8z0SuKo/FtboE0B
 CsHFB3lqzuzN82lzlSfx/B26Tmn07MHs4pS1Dv7zMNSZKiQ2d+5VpmVRj g==;
X-CSE-ConnectionGUID: WkHr2LEJRdGpxSr47gR4ZQ==
X-CSE-MsgGUID: 6PGjWUOzTD240aq+Bu+QuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14651051"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14651051"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:43:26 -0700
X-CSE-ConnectionGUID: +7WbAlFeQLKfaxhb281PZg==
X-CSE-MsgGUID: uuihirgDS76xoUn1JMcAXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43368447"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:43:26 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/17] drm/xe/oa/uapi: Read file_operation
Date: Fri,  7 Jun 2024 13:43:14 -0700
Message-ID: <20240607204322.1966831-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
References: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
v7: Use -EIO to signal to userspace to read OASTATUS using
    DRM_XE_PERF_IOCTL_STATUS, change previous sites returning -EIO to
    return -EINVAL
    Make drm_xe_oa_stream_status bits contiguous (Jose, Umesh)
    rmw oa_status bits (Umesh)

Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 201 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 include/uapi/drm/xe_drm.h        |  20 +++
 3 files changed, 224 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 5281ab9da202..37d869df413d 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -162,6 +162,14 @@ static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
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
@@ -169,6 +177,14 @@ static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
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
@@ -243,6 +259,95 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
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
@@ -316,6 +421,78 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
 	}
 }
 
+static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
+{
+	/* We might wait indefinitely if periodic sampling is not enabled */
+	if (!stream->periodic)
+		return -EINVAL;
+
+	return wait_event_interruptible(stream->poll_wq,
+					xe_oa_buffer_check_unlocked(stream));
+}
+
+#define OASTATUS_RELEVANT_BITS (OASTATUS_MMIO_TRG_Q_FULL | OASTATUS_COUNTER_OVERFLOW | \
+				OASTATUS_BUFFER_OVERFLOW | OASTATUS_REPORT_LOST)
+
+static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
+			size_t count, size_t *offset)
+{
+	/* Only clear our bits to avoid side-effects */
+	stream->oa_status = xe_mmio_rmw32(stream->gt, __oa_regs(stream)->oa_status,
+					  OASTATUS_RELEVANT_BITS, 0);
+	/*
+	 * Signal to userspace that there is non-zero OA status to read via
+	 * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
+	 */
+	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
+		return -EIO;
+
+	return xe_oa_append_reports(stream, buf, count, offset);
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
+		return -EINVAL;
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
+	 *
+	 * Also in case of -EIO, we have already waited for data before returning
+	 * -EIO, so need to wait again
+	 */
+	if (ret != -ENOSPC && ret != -EIO)
+		stream->pollin = false;
+
+	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, -EINVAL, ... */
+	return offset ?: (ret ?: -EAGAIN);
+}
+
 static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
 				  struct file *file, poll_table *wait)
 {
@@ -678,6 +855,27 @@ static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
 	return ret;
 }
 
+static long xe_oa_status_locked(struct xe_oa_stream *stream, unsigned long arg)
+{
+	struct drm_xe_oa_stream_status status = {};
+	void __user *uaddr = (void __user *)arg;
+
+	/* Map from register to uapi bits */
+	if (stream->oa_status & OASTATUS_REPORT_LOST)
+		status.oa_status |= DRM_XE_OASTATUS_REPORT_LOST;
+	if (stream->oa_status & OASTATUS_BUFFER_OVERFLOW)
+		status.oa_status |= DRM_XE_OASTATUS_BUFFER_OVERFLOW;
+	if (stream->oa_status & OASTATUS_COUNTER_OVERFLOW)
+		status.oa_status |= DRM_XE_OASTATUS_COUNTER_OVERFLOW;
+	if (stream->oa_status & OASTATUS_MMIO_TRG_Q_FULL)
+		status.oa_status |= DRM_XE_OASTATUS_MMIO_TRG_Q_FULL;
+
+	if (copy_to_user(uaddr, &status, sizeof(status)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 			       unsigned int cmd,
 			       unsigned long arg)
@@ -691,6 +889,8 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
 		return 0;
 	case DRM_XE_PERF_IOCTL_CONFIG:
 		return xe_oa_config_locked(stream, arg);
+	case DRM_XE_PERF_IOCTL_STATUS:
+		return xe_oa_status_locked(stream, arg);
 	}
 
 	return -EINVAL;
@@ -743,6 +943,7 @@ static const struct file_operations xe_oa_fops = {
 	.llseek		= no_llseek,
 	.release	= xe_oa_release,
 	.poll		= xe_oa_poll,
+	.read		= xe_oa_read,
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 91ecb1a0c7cc..d6f183be0c2d 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -215,5 +215,8 @@ struct xe_oa_stream {
 
 	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
 	u64 poll_period_ns;
+
+	/** @oa_status: temporary storage for oa_status register value */
+	u32 oa_status;
 };
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index eff62a3ed7d9..697a4f9e12e6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1556,6 +1556,26 @@ struct drm_xe_oa_config {
 	__u64 regs_ptr;
 };
 
+/**
+ * struct drm_xe_oa_stream_status - OA stream status returned from
+ * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
+ * query stream status in response to EIO errno from perf fd read().
+ */
+struct drm_xe_oa_stream_status {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_status: OA stream status (see Bspec 46717/61226) */
+	__u64 oa_status;
+#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 3)
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

