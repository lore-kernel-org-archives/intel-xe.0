Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D05C47E49
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B39610EACC;
	Sat, 20 Jan 2024 02:00:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5671710EACC
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716032; x=1737252032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F/S/mBzvxu1HL8IhmzKnnRLKGD9HV3HraJfYFHzu4c0=;
 b=YaQ6ZdrjrGhTBPMEdDF4qZ6/zu8AM114iJTmcWCDZg72BLhJxvkXmWgU
 vJBW8ibxcEW5VUEeNnsjyiNateS6O1Of5mO0mUquEUjD6gfJZXsydmhm3
 EVZq13IylXMlSZrLft1/jzlD3OIE2fbieFZ92QJKHCSBR8WQrbAfeexgI
 jztL0EoFHHjbNGGr/FrPA4gfgA4p7Br66cPoZcH7GG2SyS8mJMmYJ8y5u
 UT74tGOV+W1gxwm9UAx6IGeny0eiDs85PvG5jd2RW318GKj6GYZ2iu/9G
 6/oEnba0kv/pb4L4jCQpic/qNZw6bmpwXPpo81h+jwtJvjymmfe5m3Vsi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472943"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472943"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125711"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125711"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/16] drm/xe/oa/uapi: Expose OA stream fd
Date: Fri, 19 Jan 2024 18:00:18 -0800
Message-ID: <20240120020026.1261201-9-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

The OA stream open perf op returns an fd with its own file_operations for
the newly initialized OA stream. These file_operations allow userspace to
enable or disable the stream, as well as apply a different metric
configuration for the OA stream. Userspace can also poll for data
availability. OA stream initialization is completed in this commit by
enabling the OA stream. When sampling is enabled this starts a hrtimer
which periodically checks for data availablility.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 367 +++++++++++++++++++++++++++++++++++++
 1 file changed, 367 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 11ab63373194c..a2e3f7965639c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -3,7 +3,9 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/anon_inodes.h>
 #include <linux/nospec.h>
+#include <linux/poll.h>
 
 #include <drm/drm_drv.h>
 #include <drm/xe_drm.h>
@@ -22,6 +24,7 @@
 #include "xe_sched_job.h"
 #include "xe_perf.h"
 
+#define OA_TAKEN(tail, head)	(((tail) - (head)) & (XE_OA_BUFFER_SIZE - 1))
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 #define XE_OA_UNIT_INVALID U32_MAX
@@ -140,6 +143,202 @@ static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
 	return &stream->hwe->oa_unit->regs;
 }
 
+static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
+{
+	return xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_tail_ptr) &
+		OAG_OATAILPTR_MASK;
+}
+
+#define oa_report_header_64bit(__s) \
+	((__s)->oa_buffer.format->header == HDR_64_BIT)
+
+static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
+{
+	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
+}
+
+static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
+{
+	return oa_report_header_64bit(stream) ?
+		*((u64 *)report + 1) :
+		*((u32 *)report + 1);
+}
+
+static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
+{
+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
+	int report_size = stream->oa_buffer.format->size;
+	u32 tail, hw_tail;
+	unsigned long flags;
+	bool pollin;
+	u32 partial_report_size;
+
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+
+	hw_tail = xe_oa_hw_tail_read(stream);
+	hw_tail -= gtt_offset;
+
+	/*
+	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
+	 * increments. Also report size may not be a power of 2. Compute potential
+	 * partially landed report in OA buffer.
+	 */
+	partial_report_size = OA_TAKEN(hw_tail, stream->oa_buffer.tail);
+	partial_report_size %= report_size;
+
+	/* Subtract partial amount off the tail */
+	hw_tail = OA_TAKEN(hw_tail, partial_report_size);
+
+	tail = hw_tail;
+
+	/*
+	 * Walk the stream backward until we find a report with report id and timestamp
+	 * not 0. We can't tell whether a report has fully landed in memory before the
+	 * report id and timestamp of the following report have landed.
+	 *
+	 * This is assuming that the writes of the OA unit land in memory in the order
+	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
+	 */
+	while (OA_TAKEN(tail, stream->oa_buffer.tail) >= report_size) {
+		void *report = stream->oa_buffer.vaddr + tail;
+
+		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
+			break;
+
+		tail = OA_TAKEN(tail, report_size);
+	}
+
+	if (OA_TAKEN(hw_tail, tail) > report_size)
+		drm_dbg(&stream->oa->xe->drm,
+			"unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
+			stream->oa_buffer.head, tail, hw_tail);
+
+	stream->oa_buffer.tail = tail;
+
+	pollin = OA_TAKEN(stream->oa_buffer.tail,
+			  stream->oa_buffer.head) >= report_size;
+
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
+	return pollin;
+}
+
+static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
+{
+	struct xe_oa_stream *stream =
+		container_of(hrtimer, typeof(*stream), poll_check_timer);
+
+	if (xe_oa_buffer_check_unlocked(stream)) {
+		stream->pollin = true;
+		wake_up(&stream->poll_wq);
+	}
+
+	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_period_ns));
+
+	return HRTIMER_RESTART;
+}
+
+static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
+{
+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
+	u32 oa_buf = gtt_offset | OABUFFER_SIZE_16M | OAG_OABUFFER_MEMORY_SELECT;
+	unsigned long flags;
+
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
+			gtt_offset & OAG_OAHEADPTR_MASK);
+	stream->oa_buffer.head = 0;
+
+	/*
+	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
+	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
+	 */
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_buffer, oa_buf);
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_tail_ptr,
+			gtt_offset & OAG_OATAILPTR_MASK);
+
+	/* Mark that we need updated tail pointer to read from */
+	stream->oa_buffer.tail = 0;
+
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
+	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
+	memset(stream->oa_buffer.vaddr, 0, stream->oa_buffer.bo->size);
+}
+
+static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
+{
+	return ((format->counter_select << __bf_shf(counter_sel_mask)) & counter_sel_mask) |
+		REG_FIELD_PREP(OA_OACONTROL_REPORT_BC_MASK, format->bc_report) |
+		REG_FIELD_PREP(OA_OACONTROL_COUNTER_SIZE_MASK, format->counter_size);
+}
+
+static void xe_oa_enable(struct xe_oa_stream *stream)
+{
+	const struct xe_oa_format *format = stream->oa_buffer.format;
+	const struct xe_oa_regs *regs;
+	u32 val;
+
+	/*
+	 * BSpec: 46822: Bit 0. Even if stream->sample is 0, for OAR to function, the OA
+	 * buffer must be correctly initialized
+	 */
+	xe_oa_init_oa_buffer(stream);
+
+	regs = __oa_regs(stream);
+	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
+		OAG_OACONTROL_OA_COUNTER_ENABLE;
+
+	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
+}
+
+static void xe_oa_disable(struct xe_oa_stream *stream)
+{
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, 0);
+	if (xe_mmio_wait32(stream->gt, __oa_regs(stream)->oa_ctrl,
+			   OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
+		drm_err(&stream->oa->xe->drm,
+			"wait for OA to be disabled timed out\n");
+
+	xe_mmio_write32(stream->gt, OA_TLB_INV_CR, 1);
+	if (xe_mmio_wait32(stream->gt, OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
+		drm_err(&stream->oa->xe->drm,
+			"wait for OA tlb invalidate timed out\n");
+}
+
+static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
+				  struct file *file, poll_table *wait)
+{
+	__poll_t events = 0;
+
+	poll_wait(file, &stream->poll_wq, wait);
+
+	/*
+	 * We don't explicitly check whether there's something to read here since this
+	 * path may be hot depending on what else userspace is polling, or on the timeout
+	 * in use. We rely on hrtimer xe_oa_poll_check_timer_cb to notify us when there
+	 * are samples to read
+	 */
+	if (stream->pollin)
+		events |= EPOLLIN;
+
+	return events;
+}
+
+static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
+{
+	struct xe_oa_stream *stream = file->private_data;
+	__poll_t ret;
+
+	mutex_lock(&stream->stream_lock);
+	ret = xe_oa_poll_locked(stream, file, wait);
+	mutex_unlock(&stream->stream_lock);
+
+	return ret;
+}
+
 static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 {
 	struct xe_sched_job *job;
@@ -239,6 +438,26 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, sqcnt1, 0);
 }
 
+static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
+{
+	struct xe_oa_unit *u = stream->hwe->oa_unit;
+	struct xe_gt *gt = stream->hwe->gt;
+
+	if (WARN_ON(stream != u->exclusive_stream))
+		return;
+
+	WRITE_ONCE(u->exclusive_stream, NULL);
+
+	xe_oa_disable_metric_set(stream);
+	xe_exec_queue_put(stream->k_exec_q);
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	xe_device_mem_access_put(stream->oa->xe);
+
+	xe_oa_free_oa_buffer(stream);
+	xe_oa_free_configs(stream);
+}
+
 static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
 {
 	struct xe_bo *bo;
@@ -376,6 +595,139 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	return xe_oa_emit_oa_config(stream);
 }
 
+static void xe_oa_stream_enable(struct xe_oa_stream *stream)
+{
+	stream->pollin = false;
+
+	xe_oa_enable(stream);
+
+	if (stream->sample)
+		hrtimer_start(&stream->poll_check_timer,
+			      ns_to_ktime(stream->poll_period_ns),
+			      HRTIMER_MODE_REL_PINNED);
+}
+
+static void xe_oa_stream_disable(struct xe_oa_stream *stream)
+{
+	xe_oa_disable(stream);
+
+	if (stream->sample)
+		hrtimer_cancel(&stream->poll_check_timer);
+}
+
+static void xe_oa_enable_locked(struct xe_oa_stream *stream)
+{
+	if (stream->enabled)
+		return;
+
+	stream->enabled = true;
+
+	xe_oa_stream_enable(stream);
+}
+
+static void xe_oa_disable_locked(struct xe_oa_stream *stream)
+{
+	if (!stream->enabled)
+		return;
+
+	stream->enabled = false;
+
+	xe_oa_stream_disable(stream);
+}
+
+static long xe_oa_config_locked(struct xe_oa_stream *stream,
+				unsigned long metrics_set)
+{
+	struct xe_oa_config *config;
+	long ret = stream->oa_config->id;
+
+	config = xe_oa_get_oa_config(stream->oa, metrics_set);
+	if (!config)
+		return -ENODEV;
+
+	if (config != stream->oa_config) {
+		int err;
+
+		err = xe_oa_emit_oa_config(stream);
+		if (!err)
+			config = xchg(&stream->oa_config, config);
+		else
+			ret = err;
+	}
+
+	xe_oa_config_put(config);
+
+	return ret;
+}
+
+static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
+			       unsigned int cmd,
+			       unsigned long arg)
+{
+	switch (cmd) {
+	case DRM_XE_PERF_IOCTL_ENABLE:
+		xe_oa_enable_locked(stream);
+		return 0;
+	case DRM_XE_PERF_IOCTL_DISABLE:
+		xe_oa_disable_locked(stream);
+		return 0;
+	case DRM_XE_PERF_IOCTL_CONFIG:
+		return xe_oa_config_locked(stream, arg);
+	}
+
+	return -EINVAL;
+}
+
+static long xe_oa_ioctl(struct file *file,
+			unsigned int cmd,
+			unsigned long arg)
+{
+	struct xe_oa_stream *stream = file->private_data;
+	long ret;
+
+	mutex_lock(&stream->stream_lock);
+	ret = xe_oa_ioctl_locked(stream, cmd, arg);
+	mutex_unlock(&stream->stream_lock);
+
+	return ret;
+}
+
+static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
+{
+	if (stream->enabled)
+		xe_oa_disable_locked(stream);
+
+	xe_oa_stream_destroy(stream);
+
+	if (stream->exec_q)
+		xe_exec_queue_put(stream->exec_q);
+
+	kfree(stream);
+}
+
+static int xe_oa_release(struct inode *inode, struct file *file)
+{
+	struct xe_oa_stream *stream = file->private_data;
+	struct xe_gt *gt = stream->gt;
+
+	mutex_lock(&gt->oa.gt_lock);
+	xe_oa_destroy_locked(stream);
+	mutex_unlock(&gt->oa.gt_lock);
+
+	/* Release the reference the perf stream kept on the driver */
+	drm_dev_put(&gt_to_xe(gt)->drm);
+
+	return 0;
+}
+
+static const struct file_operations xe_oa_fops = {
+	.owner		= THIS_MODULE,
+	.llseek		= no_llseek,
+	.release	= xe_oa_release,
+	.poll		= xe_oa_poll,
+	.unlocked_ioctl	= xe_oa_ioctl,
+};
+
 static int xe_oa_stream_init(struct xe_oa_stream *stream,
 			     struct xe_oa_open_param *param)
 {
@@ -429,6 +781,10 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 
 	WRITE_ONCE(u->exclusive_stream, stream);
 
+	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	stream->poll_check_timer.function = xe_oa_poll_check_timer_cb;
+	init_waitqueue_head(&stream->poll_wq);
+
 	spin_lock_init(&stream->oa_buffer.ptr_lock);
 	mutex_init(&stream->stream_lock);
 
@@ -472,10 +828,21 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	if (ret)
 		goto err_free;
 
+	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
+	if (stream_fd < 0) {
+		ret = stream_fd;
+		goto err_destroy;
+	}
+
+	if (!param->disabled)
+		xe_oa_enable_locked(stream);
+
 	/* Hold a reference on the drm device till stream_fd is released */
 	drm_dev_get(&stream->oa->xe->drm);
 
 	return stream_fd;
+err_destroy:
+	xe_oa_stream_destroy(stream);
 err_free:
 	kfree(stream);
 exit:
-- 
2.41.0

