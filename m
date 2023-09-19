Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23527CE79A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F173B10E3AC;
	Tue, 19 Sep 2023 16:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656910E287
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140180; x=1726676180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PXw8pBEXKGVrxEpOrcO1ZJtGXXPvIsEuwFve5LEiySM=;
 b=M0H9WtsoblSSUhgxtO5yAh93XbLpxbLh2ud+cjmpRIl2lTqvSS6MOhq+
 Z2sXe9UNzhuclVUfu4OeRT7dUtJtjpJSvgp+9nJ/q/sB0wL2fCa42YQe7
 jZQs5Xfw6277ekQKy/kC2i7KDW16sMwlID0pyS5b1z7U8vHpGrX1ermLR
 PQ0FkdOxsuKM2lFXiJLITnbgGD7cjTBrwjJsSIwLzqJjfdd7ue9++ghoq
 eXxJQ0ixA+Yt6vR5jMIypUG/GLgOqzUQ0gzWY5PgPRcPlp5xWF3oq6mnU
 KV5Z3XVnTiPj4TMp9rRQN2JUBzb7AhLiWgP7QpTjSD9IMf3MDADeRNi6S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913549"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913549"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016524"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016524"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:36 -0700
Message-ID: <20230919161049.2307855-9-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/21] drm/xe/oa: Expose OA stream fd
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

The OA stream open ioctl returns an fd with its own file_operations for the
newly initialized OA stream. These file_operations allow userspace to
enable or disable the stream, as well as apply a different counter
configuration for the OA stream. Userspace can also poll for data
availability. OA stream initialization is completed in this commit by
enabling the OA stream. When sampling is enabled this starts a hrtimer
which periodically checks for data availablility.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 386 +++++++++++++++++++++++++++++++++++++
 1 file changed, 386 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 794ebbdc34cbd..261b168a61bf5 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -12,6 +12,7 @@
 #include <drm/drm_drv.h>
 
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
 #include "regs/xe_oa_regs.h"
@@ -26,6 +27,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
+#include "xe_pm.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -33,6 +35,7 @@
 #define OA_TAKEN(tail, head)	(((tail) - (head)) & (OA_BUFFER_SIZE - 1))
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
+#define INVALID_CTX_ID U32_MAX
 
 static u32 xe_oa_stream_paranoid = true;
 static int xe_oa_sample_rate_hard_limit;
@@ -129,6 +132,210 @@ static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
 	return &stream->hwe->oa_group->regs;
 }
 
+static u32 gen12_oa_hw_tail_read(struct xe_oa_stream *stream)
+{
+	return xe_mmio_read32(stream->gt, __oa_regs(stream)->oa_tail_ptr) &
+		GEN12_OAG_OATAILPTR_MASK;
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
+	/*
+	 * We have to consider the (unlikely) possibility that read() errors could result
+	 * in an OA buffer reset which might reset the head and tail state.
+	 */
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+
+	hw_tail = gen12_oa_hw_tail_read(stream);
+	hw_tail -= gtt_offset;
+
+	/*
+	 * The tail pointer increases in 64 byte increments, not in report_size
+	 * steps. Also the report size may not be a power of 2. Compute potentially
+	 * partially landed report in the OA buffer
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
+	 * Walk the stream backward until we find a report with report id and timestmap
+	 * not at 0. Since the circular buffer pointers progress by increments of 64 bytes
+	 * and that reports can be up to 256 bytes long, we can't tell whether a report
+	 * has fully landed in memory before the report id and timestamp of the following
+	 * report have effectively landed.
+	 *
+	 * This is assuming that the writes of the OA unit land in memory in the order
+	 * they were written to.  If not : (╯°□°）╯︵ ┻━┻
+	 */
+	while (OA_TAKEN(tail, stream->oa_buffer.tail) >= report_size) {
+		void *report = stream->oa_buffer.vaddr + tail;
+
+		if (oa_report_id(stream, report) ||
+		    oa_timestamp(stream, report))
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
+	hrtimer_forward_now(hrtimer, ns_to_ktime(stream->poll_oa_period));
+
+	return HRTIMER_RESTART;
+}
+
+static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
+{
+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
+	unsigned long flags;
+
+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
+
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_status, 0);
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_head_ptr,
+			gtt_offset & GEN12_OAG_OAHEADPTR_MASK);
+	stream->oa_buffer.head = 0;
+
+	/*
+	 * PRM says: "This MMIO must be set before the OATAILPTR register and after the
+	 * OAHEADPTR register. This is to enable proper functionality of the overflow bit".
+	 */
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_buffer, gtt_offset |
+			OABUFFER_SIZE_16M | GEN12_OAG_OABUFFER_MEMORY_SELECT);
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_tail_ptr,
+			gtt_offset & GEN12_OAG_OATAILPTR_MASK);
+
+	/* Mark that we need updated tail pointers to read from... */
+	stream->oa_buffer.tail = 0;
+
+	/*
+	 * Reset state used to recognise context switches, affecting which reports we will
+	 * forward to userspace while filtering for a single context.
+	 */
+	stream->oa_buffer.last_ctx_id = INVALID_CTX_ID;
+
+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
+
+	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
+	memset(stream->oa_buffer.vaddr, 0, stream->oa_buffer.bo->size);
+}
+
+static void xe_oa_enable(struct xe_oa_stream *stream)
+{
+	const struct xe_oa_regs *regs;
+	u32 val;
+
+	/*
+	 * BSpec: 46822
+	 * Correct values for OAR counters are still dependent on enabling the
+	 * GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE in OAG_OACONTROL. Enabling this
+	 * bit means OAG unit will write reports to the OAG buffer, so
+	 * initialize the OAG buffer correctly.
+	 */
+	xe_oa_init_oa_buffer(stream);
+
+	regs = __oa_regs(stream);
+	val = (stream->oa_buffer.format->format << regs->oa_ctrl_counter_format_shift) |
+	      GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE;
+
+	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
+}
+
+static void xe_oa_disable(struct xe_oa_stream *stream)
+{
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, 0);
+	if (xe_mmio_wait32(stream->gt, __oa_regs(stream)->oa_ctrl,
+			   GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
+		drm_err(&stream->oa->xe->drm,
+			"wait for OA to be disabled timed out\n");
+
+	xe_mmio_write32(stream->gt, GEN12_OA_TLB_INV_CR, 1);
+	if (xe_mmio_wait32(stream->gt, GEN12_OA_TLB_INV_CR, 1, 0, 50000, NULL, false))
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
+	 * in use. We rely on hrtimer/xe_oa_poll_check_timer_cb to notify us when there
+	 * are samples to read.
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
+	mutex_lock(&stream->lock);
+	ret = xe_oa_poll_locked(stream, file, wait);
+	mutex_unlock(&stream->lock);
+
+	return ret;
+}
+
 static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 {
 	struct xe_hw_engine *hwe = stream->hwe;
@@ -327,6 +534,25 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 	xe_mmio_rmw32(stream->gt, GEN12_SQCNT1, sqcnt1, 0);
 }
 
+static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
+{
+	struct xe_oa_group *g = stream->hwe->oa_group;
+	struct xe_gt *gt = stream->hwe->gt;
+
+	if (WARN_ON(stream != g->exclusive_stream))
+		return;
+
+	/* Unset exclusive_stream first */
+	WRITE_ONCE(g->exclusive_stream, NULL);
+	xe_oa_disable_metric_set(stream);
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
@@ -508,6 +734,148 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
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
+			      ns_to_ktime(stream->poll_oa_period),
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
+		/*
+		 * If OA is bound to a specific engine, emit the reconfiguration
+		 * inline from that engine. The update will then be ordered with
+		 * respect to submission on that engine.
+		 */
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
+	case XE_OA_IOCTL_ENABLE:
+		xe_oa_enable_locked(stream);
+		return 0;
+	case XE_OA_IOCTL_DISABLE:
+		xe_oa_disable_locked(stream);
+		return 0;
+	case XE_OA_IOCTL_CONFIG:
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
+	mutex_lock(&stream->lock);
+	ret = xe_oa_ioctl_locked(stream, cmd, arg);
+	mutex_unlock(&stream->lock);
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
+	/*
+	 * Within this call, we know that the fd is being closed and we have no other
+	 * user of stream->lock. Use the perf lock to destroy the stream here.
+	 */
+	mutex_lock(&gt->oa.lock);
+	xe_oa_destroy_locked(stream);
+	mutex_unlock(&gt->oa.lock);
+
+	/* Release the reference the perf stream kept on the driver. */
+	drm_dev_put(&gt->tile->xe->drm);
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
 static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
 {
 	return hwe->class == XE_ENGINE_CLASS_RENDER;
@@ -636,6 +1004,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	WRITE_ONCE(g->exclusive_stream, stream);
 
 	hrtimer_init(&stream->poll_check_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	stream->poll_check_timer.function = xe_oa_poll_check_timer_cb;
 	init_waitqueue_head(&stream->poll_wq);
 
 	spin_lock_init(&stream->oa_buffer.ptr_lock);
@@ -663,6 +1032,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	struct xe_file *xef = to_xe_file(file);
 	struct xe_oa_stream *stream = NULL;
 	struct xe_exec_queue *q = NULL;
+	unsigned long f_flags = 0;
 	bool privileged_op = true;
 	int stream_fd;
 	int ret;
@@ -715,10 +1085,26 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	if (ret)
 		goto err_free;
 
+	if (param->flags & XE_OA_FLAG_FD_CLOEXEC)
+		f_flags |= O_CLOEXEC;
+	if (param->flags & XE_OA_FLAG_FD_NONBLOCK)
+		f_flags |= O_NONBLOCK;
+
+	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, f_flags);
+	if (stream_fd < 0) {
+		ret = stream_fd;
+		goto err_destroy;
+	}
+
+	if (!(param->flags & XE_OA_FLAG_DISABLED))
+		xe_oa_enable_locked(stream);
+
 	/* Hold a reference on the drm device till stream_fd is released */
 	drm_dev_get(&oa->xe->drm);
 
 	return stream_fd;
+err_destroy:
+	xe_oa_stream_destroy(stream);
 err_free:
 	kfree(stream);
 err_exec_q:
-- 
2.41.0

