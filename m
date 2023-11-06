Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7FCC001B5
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C580910E2DD;
	Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD29E10E2D3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269754; x=1730805754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4JdyaFTsiLKCgLW/zzs6TfmRU7wmWslCFFyzmwPQVIc=;
 b=YzjGwQzdLp36qKD+5BODwM+uW5GtgHuuR/yGyI5sdyTllmN+x9keFyUS
 +P+eT3j04CnfceGj63Yfy4t6BDD/079mJn6AsmFtPqIsamBYARh0uTHHa
 /HWJbxN2QDM6chohCcldBRz4aN53sV7jbbg6FMrpPiWQz9l8+tywMmIR0
 3g+p2lbJUykZ6buTasXsTYz0yqN/q1sGj1CxVwIkU1o2gSg5kIzVr2Ez8
 JR4KZ6nRYUjx5qVAGp82kkZ2GsFhWJOu6zWLSQU4fL10yy8CULwZkzYJI
 f6Ucf/+JwVWcLIkAXMvO9MLdaLLg3h2OeUDDu2wdofNhoVxuRIDF4TkPE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646795"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646795"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411590"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411590"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:23 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:29 +0200
Message-Id: <20231106111845.2333093-10-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 09/25] drm/xe/eudebug: Introduce per device
 attention scan worker
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Scan for EU debugging attention bits periodically to detect if some EU
thread has entered the system routine (SIP) due to EU thread exception.

Make the scanning interval 10 times slower when there is no debugger
connection open. Send attention event whenever we see attention with
debugger presence. If there is no debugger connection active - reset.

Based on work by authors and other folks who were part of attentions in
i915.

- v2 Do not validate potentially active hwe against engine->hwe.
  Whenever the engine has width > 1, this field contains only the first
  hwe of the class.
- squash dss walking and semaphore to mutex

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   6 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c          | 357 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug_types.h    |  32 ++
 drivers/gpu/drm/xe/xe_gt_debug.c         | 150 ++++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h         |  21 ++
 include/uapi/drm/xe_drm_tmp.h            |  18 +-
 9 files changed, 583 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 15c044c96d26..8371f3dd34f8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -61,6 +61,7 @@ xe-y += xe_bb.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
 	xe_gt_idle_sysfs.o \
+	xe_gt_debug.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 662105137d38..b5a80a05f99b 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -71,6 +71,9 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
+#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
+#define   CURRENT_LRCA_VALID			REG_BIT(0)
+
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
 #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a1bed8b9171a..ca33731dd442 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -351,6 +351,8 @@
 #define   DISABLE_ECC				REG_BIT(5)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
 
+#define TD_ATT(x)				XE_REG_MCR(0xe470 + (x) * 4)
+
 #define ROW_CHICKEN4				XE_REG_MCR(0xe48c, XE_REG_OPTION_MASKED)
 #define   DISABLE_GRF_CLEAR			REG_BIT(13)
 #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
@@ -406,6 +408,10 @@
 #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
 #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
 
+#define RCU_DEBUG_1				XE_REG(0x14a00)
+#define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
+#define   RCU_DEBUG_1_CONTEXT_ACTIVE		REG_BIT(0)
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
 #define   FORCEWAKE_USER			BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c577ac30efdc..f6d45e605a30 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -420,6 +420,9 @@ struct xe_device {
 
 		/** @available: is the debugging functionality available */
 		bool available;
+
+		/** @attention_scan: attention scan worker */
+		struct delayed_work attention_scan;
 	} eudebug;
 
 	/** @clients xe_file tracking for eudebug discovery */
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 99939176bbb9..b54d5135938d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -14,13 +14,23 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm_tmp.h>
 
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_debug.h"
+#include "xe_lrc.h"
+#include "xe_hw_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_eudebug_types.h"
-#include "xe_exec_queue_types.h"
+//#include "xe_exec_queue_types.h"
+#include "xe_guc_exec_queue_types.h"
+#include "xe_execlist_types.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 #include "xe_rtp.h"
+#include "xe_sched_job.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
 
@@ -570,8 +580,7 @@ static long xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p)
 }
 
 static struct xe_eudebug_event *
-xe_eudebug_create_event(struct xe_eudebug *d,
-			u16 type, u16 flags, u32 len, gfp_t gfp)
+__xe_eudebug_create_event(u64 seqno, u16 type, u16 flags, u32 len, gfp_t gfp)
 {
 	struct xe_eudebug_event *event;
 
@@ -584,11 +593,17 @@ xe_eudebug_create_event(struct xe_eudebug *d,
 	event->type = type;
 	event->flags = flags;
 	event->len = len;
-	event->seqno = atomic_long_inc_return(&d->events.seqno);
-
+	event->seqno = seqno;
 	return event;
 }
 
+static struct xe_eudebug_event *
+xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u16 flags, u32 len, gfp_t gfp)
+{
+	return __xe_eudebug_create_event(atomic_long_inc_return(&d->events.seqno),
+					 type, flags, len, gfp);
+}
+
 static long xe_eudebug_read_event(struct xe_eudebug *d,
 				  const u64 arg,
 				  const bool wait)
@@ -687,6 +702,330 @@ static const struct file_operations fops = {
 	.unlocked_ioctl	= xe_eudebug_ioctl,
 };
 
+static bool queue_has_active_job(struct xe_exec_queue *q)
+{
+
+	struct drm_gpu_scheduler *sched;
+	struct drm_sched_job *drm_job;
+
+	if (xe_device_uc_enabled(gt_to_xe(q->gt)))
+		sched = &q->guc->sched;
+	else
+		sched = &q->execlist->sched;
+
+	drm_job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list);
+
+	if (drm_job) {
+		struct xe_sched_job *job = to_xe_sched_job(drm_job);
+
+		return xe_sched_job_started(job) && !xe_sched_job_completed(job);
+	}
+
+	return false;
+}
+
+static int current_lrc(struct xe_hw_engine *hwe, u32 *lrc_hw)
+{
+	u32 lrc_reg;
+	int err;
+
+	err = xe_force_wake_get(gt_to_fw(hwe->gt), hwe->domain);
+	if (err)
+		return err;
+
+	lrc_reg = hw_engine_mmio_read32(hwe, RING_CURRENT_LRCA(0));
+
+	xe_force_wake_put(gt_to_fw(hwe->gt), hwe->domain);
+
+	if (!(lrc_reg & CURRENT_LRCA_VALID))
+		return -ENOENT;
+
+	*lrc_hw = lrc_reg & GENMASK(31, 12);
+
+	return 0;
+}
+
+static int match_engine_lrc(struct xe_exec_queue *q, u32 lrc_hw)
+{
+	int i;
+	u32 lrc_ggtt;
+
+	for (i = 0; i < q->width; i++) {
+		lrc_ggtt = lower_32_bits(xe_lrc_descriptor(&q->lrc[i]));
+		lrc_ggtt &= GENMASK(31, 12);
+		if (lrc_ggtt == lrc_hw)
+			return i;
+	}
+
+	return -1;
+}
+
+static struct xe_hw_engine *get_runalone_active_hw_engine(struct xe_gt *gt)
+{
+	const int max_rcu_engine_id = 4;
+	enum xe_engine_class class;
+	struct xe_hw_engine *hwe;
+	u32 val, engine_shift;
+	u16 instance;
+	int id, ret;
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		return NULL;
+
+	val = xe_mmio_read32(gt, RCU_DEBUG_1);
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	for (id = 0, engine_shift = 7; id <= max_rcu_engine_id; id++, engine_shift += 3) {
+		u32 engine_status = val >> engine_shift & 0x7;
+
+		if (engine_status & RCU_DEBUG_1_RUNALONE_ACTIVE) {
+			/*
+			 * On earlier gen12 the context status seems to be idle when
+			 * it has raised attention. We have to omit the active bit.
+			 */
+			if (IS_DGFX(gt_to_xe(gt)) || (engine_status & RCU_DEBUG_1_CONTEXT_ACTIVE))
+				break;
+		}
+	}
+
+	if (id > max_rcu_engine_id)
+		return NULL;
+
+	if (id == 0) {
+		class = XE_ENGINE_CLASS_RENDER;
+		instance = id;
+	} else {
+		class = XE_ENGINE_CLASS_COMPUTE;
+		instance = id - 1;
+	}
+
+	for_each_hw_engine(hwe, gt, id)
+		if (hwe->class == class && hwe->instance == instance)
+			return hwe;
+
+	XE_WARN_ON("Missing hw engine!\n");
+	return NULL;
+}
+
+static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_exec_queue *q, *found = NULL;
+	struct xe_hw_engine *active;
+	struct xe_file *xef;
+	unsigned long i, j;
+	int idx, err;
+	u32 lrc_hw;
+
+	active = get_runalone_active_hw_engine(gt);
+	if (!active) {
+		drm_dbg(&gt_to_xe(gt)->drm, "Runalone engine not found!");
+		return ERR_PTR(-ENOENT);
+	}
+
+	err = current_lrc(active, &lrc_hw);
+	if (err)
+		return ERR_PTR(err);
+
+	mutex_lock(&xe->clients.lock);
+	xa_for_each(&xe->clients.xa, i, xef) {
+		mutex_lock(&xef->exec_queue.lock);
+		xa_for_each(&xef->exec_queue.xa, j, q) {
+			if (q->gt != gt)
+				continue;
+
+			if (q->class != active->class)
+				continue;
+
+			if (!queue_has_active_job(q))
+				continue;
+
+			idx = match_engine_lrc(q, lrc_hw);
+			if (idx < 0)
+				continue;
+
+			xe_exec_queue_get(q);
+			found = q;
+			*lrc_idx = idx;
+
+			break;
+		}
+		mutex_unlock(&xef->exec_queue.lock);
+
+		if (found)
+			break;
+	}
+	mutex_unlock(&xe->clients.lock);
+
+	if (!found)
+		return ERR_PTR(-ENOENT);
+
+	if (XE_WARN_ON(current_lrc(active, &lrc_hw)) &&
+	    XE_WARN_ON(match_engine_lrc(found, lrc_hw) < 0)) {
+		xe_exec_queue_put(found);
+		return ERR_PTR(-ENOENT);
+	}
+
+	return found;
+}
+
+#define struct_member(T, member) (((T *)0)->member)
+
+#define write_member(T_out, ptr, member, value) { \
+	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
+	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
+		     offsetof(typeof(T_out), member)); \
+	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
+	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
+	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
+	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
+	(ptr)->member = (value); \
+	}
+
+static int send_attention_event(struct xe_eudebug *d, struct xe_exec_queue *q, int lrc_idx)
+{
+	struct xe_eudebug_event_eu_attention *ea;
+	struct xe_eudebug_event *event;
+	int h_c, h_queue, h_lrc;
+	u32 size = xe_gt_eu_attention_bitmap_size(q->gt);
+	u32 sz = struct_size(ea, bitmask, size);
+	int ret;
+
+	XE_WARN_ON(lrc_idx < 0 || lrc_idx >= q->width);
+
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, q->persistent.xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_queue = find_handle(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
+	if (h_queue < 0)
+		return h_queue;
+
+	h_lrc = find_handle(d->res, XE_EUDEBUG_RES_TYPE_LRC, &q->lrc[lrc_idx]);
+	if (h_lrc < 0)
+		return h_lrc;
+
+	event = __xe_eudebug_create_event(0, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					  DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz, GFP_KERNEL);
+
+	if (!event)
+		return -ENOSPC;
+
+	ea = from_event(ea, event);
+	write_member(struct drm_xe_eudebug_event_eu_attention, ea, client_handle, (u64)h_c);
+	write_member(struct drm_xe_eudebug_event_eu_attention, ea, exec_queue_handle, (u64)h_queue);
+	write_member(struct drm_xe_eudebug_event_eu_attention, ea, lrc_handle, (u64)h_lrc);
+	write_member(struct drm_xe_eudebug_event_eu_attention, ea, bitmask_size, size);
+
+	mutex_lock(&d->eu_lock);
+	event->seqno = atomic_long_inc_return(&d->events.seqno);
+	ret = xe_gt_eu_attention_bitmap(q->gt, &ea->bitmask[0], ea->bitmask_size);
+	mutex_unlock(&d->eu_lock);
+
+	if (ret)
+		return ret;
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+
+static int xe_send_gt_attention(struct xe_gt *gt)
+{
+	struct xe_eudebug *d;
+	struct xe_exec_queue *q;
+	int ret, lrc_idx;
+
+	if (list_empty_careful(&gt_to_xe(gt)->eudebug.list))
+		return -ENOTCONN;
+
+	q = runalone_active_queue_get(gt, &lrc_idx);
+	if (IS_ERR(q))
+		return PTR_ERR(q);
+
+	d = xe_eudebug_get(q->persistent.xef);
+	if (!d) {
+		ret = -ENOTCONN;
+		goto err_eudebug_put;
+	}
+
+	if (!completion_done(&d->discovery)) {
+		eu_dbg(d, "discovery not yet done\n");
+		ret = -EBUSY;
+		goto err_exec_queue_put;
+	}
+
+	ret = send_attention_event(d, q, lrc_idx);
+
+err_eudebug_put:
+	xe_eudebug_put(d);
+err_exec_queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+static int xe_eudebug_handle_gt_attention(struct xe_gt *gt)
+{
+	int ret;
+
+	ret = xe_gt_eu_threads_needing_attention(gt);
+	if (ret <= 0)
+		return ret;
+
+	ret = xe_send_gt_attention(gt);
+
+	/* Discovery in progress, fake it */
+	if (ret == -EBUSY)
+		return 0;
+
+	return ret;
+}
+
+#define XE_EUDEBUG_ATTENTION_INTERVAL 100
+static void attention_scan_fn(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, typeof(*xe), eudebug.attention_scan.work);
+	long delay = msecs_to_jiffies(XE_EUDEBUG_ATTENTION_INTERVAL);
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	if (list_empty_careful(&xe->eudebug.list))
+		delay *= 10;
+
+	if (delay >= HZ)
+		delay = round_jiffies_up_relative(delay);
+
+	if (pm_runtime_active(xe->drm.dev)) {
+		for_each_gt(gt, xe, gt_id) {
+			int ret;
+
+			ret = xe_eudebug_handle_gt_attention(gt);
+
+			if (ret) {
+				// TODO: error capture
+				drm_info(&gt_to_xe(gt)->drm,
+					 "gt:%d unable to handle eu attention ret=%d\n",
+					 gt_id, ret);
+				xe_gt_reset_async(gt);
+			}
+		}
+	}
+
+	schedule_delayed_work(&xe->eudebug.attention_scan, delay);
+}
+
+static void attention_scan_cancel(struct xe_device *xe)
+{
+	cancel_delayed_work_sync(&xe->eudebug.attention_scan);
+}
+
+static void attention_scan_flush(struct xe_device *xe)
+{
+	mod_delayed_work(system_wq, &xe->eudebug.attention_scan, 0);
+}
+
 static struct task_struct *find_get_target(const pid_t nr)
 {
 	struct task_struct *task;
@@ -735,6 +1074,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_init(&d->ref);
 	mutex_init(&d->lock);
+	mutex_init(&d->eu_lock);
 	init_waitqueue_head(&d->events.write_done);
 	init_completion(&d->discovery);
 
@@ -798,6 +1138,7 @@ xe_eudebug_connect(struct xe_device *xe,
 	eu_dbg(d, "connected session %lld", d->session);
 
 	queue_work(d->discovery_wq, &d->discovery_work);
+	attention_scan_flush(xe);
 
 	return fd;
 
@@ -878,6 +1219,7 @@ void xe_eudebug_init(struct xe_device *xe)
 
 	spin_lock_init(&xe->eudebug.lock);
 	INIT_LIST_HEAD(&xe->eudebug.list);
+	INIT_DELAYED_WORK(&xe->eudebug.attention_scan, attention_scan_fn);
 	xa_init_flags(&xe->clients.xa, XA_FLAGS_ALLOC1);
 
 	ret = drmm_mutex_init(&xe->drm, &xe->clients.lock);
@@ -887,10 +1229,15 @@ void xe_eudebug_init(struct xe_device *xe)
 			 ret);
 
 	xe->eudebug.available = ret == 0;
+
+	if (xe->eudebug.available) {
+		attention_scan_flush(xe);
+	}
 }
 
 void xe_eudebug_fini(struct xe_device *xe)
 {
+	attention_scan_cancel(xe);
 	XE_WARN_ON(!list_empty_careful(&xe->eudebug.list));
 	mutex_destroy(&xe->clients.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 0fd317e7201f..8d6fef74b91e 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -98,6 +98,35 @@ struct xe_eudebug_event_exec_queue {
 	u64 lrc_handle[];
 } __packed;
 
+/**
+ * struct xe_eudebug_event_eu_attention - Internal event for EU attention
+ */
+struct xe_eudebug_event_eu_attention {
+	/** @base: base event */
+	struct xe_eudebug_event base;
+
+	/** @client_handle: client for the attention */
+	u64 client_handle;
+
+	/** @exec_queue_handle: handle of exec_queue which raised attention */
+	u64 exec_queue_handle;
+
+	/** @lrc_handle: lrc handle of the workload which raised attention */
+	u64 lrc_handle;
+
+	/** @flags: eu attention event flags, currently MBZ */
+	u32 flags;
+
+	/** @bitmask_size: size of the bitmask, specific to device */
+	u32 bitmask_size;
+
+	/**
+	 * @bitmask: reflects threads currently signalling attention,
+	 * starting from natural hardware order of DSS=0, eu=0
+	 */
+	u8 bitmask[0];
+} __packed;
+
 /**
  * struct xe_eudebug_handle - eudebug resource handle
  */
@@ -183,6 +212,9 @@ struct xe_eudebug {
 	/** @discovery_wq: workqueue for discovery worker */
 	struct workqueue_struct *discovery_wq;
 
+	/** eu_lock: guards operations on eus (eu thread control and attention) */
+	struct mutex eu_lock;
+
 	/** @events: kfifo queue of to-be-delivered events */
 	struct {
 		/** @lock: guards access to fifo */
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
new file mode 100644
index 000000000000..98297c24e401
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
+#include "xe_gt_topology.h"
+#include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
+#include "xe_pm.h"
+
+static int xe_gt_for_each_dss_group_instance(struct xe_gt *gt,
+					     int (*fn)(struct xe_gt *gt,
+						       void *data,
+						       unsigned int group,
+						       unsigned int instance),
+					     void *data)
+{
+	const enum xe_force_wake_domains fw_domains = XE_FW_GT | XE_FW_RENDER;
+	unsigned int dss, group, instance;
+	int ret;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	ret = xe_force_wake_get(gt_to_fw(gt), fw_domains);
+	if (ret)
+		goto pm_runtime_put;
+
+	for_each_dss_steering(dss, gt, group, instance) {
+		ret = fn(gt, data, group, instance);
+		if (ret)
+			break;
+	}
+
+	xe_force_wake_put(gt_to_fw(gt), fw_domains);
+pm_runtime_put:
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return ret;
+}
+
+static int read_first_attention_mcr(struct xe_gt *gt, void *data,
+				    unsigned int group, unsigned int instance)
+{
+	unsigned int row;
+
+	for (row = 0; row < 2; row++) {
+		u32 val;
+
+		val = xe_gt_mcr_unicast_read(gt, TD_ATT(row), group, instance);
+
+		if (val)
+			return 1;
+	}
+
+	return 0;
+}
+
+#define MAX_EUS_PER_ROW 4u
+#define MAX_THREADS 8u
+
+/**
+ * xe_gt_eu_attention_bitmap_size - query size of the attention bitmask
+ *
+ * @gt: pointer to struct xe_gt
+ *
+ * Return: size in bytes.
+ */
+int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt)
+{
+	xe_dss_mask_t dss_mask;
+
+	bitmap_or(dss_mask, gt->fuse_topo.c_dss_mask,
+		  gt->fuse_topo.g_dss_mask, XE_MAX_DSS_FUSE_BITS);
+
+	return  bitmap_weight(dss_mask, XE_MAX_DSS_FUSE_BITS) *
+		TD_EU_ATTENTION_MAX_ROWS * MAX_THREADS *
+		MAX_EUS_PER_ROW / 8;
+}
+
+struct attn_read_iter {
+	struct xe_gt *gt;
+	unsigned int i;
+	unsigned int size;
+	u8 *bits;
+};
+
+static int read_eu_attentions_mcr(struct xe_gt *gt, void *data,
+				  unsigned int group, unsigned int instance)
+{
+	struct attn_read_iter * const iter = data;
+	unsigned int row;
+
+	for (row = 0; row < TD_EU_ATTENTION_MAX_ROWS; row++) {
+		u32 val;
+
+		if (iter->i >= iter->size)
+			return 0;
+
+		XE_WARN_ON(iter->i + sizeof(val) > xe_gt_eu_attention_bitmap_size(gt));
+
+		val = xe_gt_mcr_unicast_read(gt, TD_ATT(row), group, instance);
+
+
+		memcpy(&iter->bits[iter->i], &val, sizeof(val));
+		iter->i += sizeof(val);
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_eu_attention_bitmap - query host attention
+ *
+ * @gt: pointer to struct xe_gt
+ *
+ * Return: 0 on success, negative otherwise.
+ */
+int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
+			      unsigned int bitmap_size)
+{
+	struct attn_read_iter iter = {
+		.gt = gt,
+		.i = 0,
+		.size = bitmap_size,
+		.bits = bits
+	};
+
+	return xe_gt_for_each_dss_group_instance(gt, read_eu_attentions_mcr, &iter);
+}
+
+/**
+ * xe_gt_eu_threads_needing_attention - Query host attention
+ *
+ * @gt: pointer to struct xe_gt
+ *
+ * Return: 1 if threads waiting host attention, 0 otherwise.
+ */
+int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
+{
+	int err;
+
+	err = xe_gt_for_each_dss_group_instance(gt, read_first_attention_mcr, NULL);
+
+	XE_WARN_ON(err < 0);
+
+	return err < 0 ? 0 : err;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
new file mode 100644
index 000000000000..3f13dbb17a5f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_GT_DEBUG_
+#define __XE_GT_DEBUG_
+
+#define TD_EU_ATTENTION_MAX_ROWS 2u
+
+#include "xe_gt_types.h"
+
+#define XE_GT_ATTENTION_TIMEOUT_MS 100
+
+int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
+
+int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
+int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
+			      unsigned int bitmap_size);
+
+#endif
diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
index 64d0f1295341..c476ac0b0162 100644
--- a/include/uapi/drm/xe_drm_tmp.h
+++ b/include/uapi/drm/xe_drm_tmp.h
@@ -32,11 +32,13 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_OPEN     2
 #define DRM_XE_EUDEBUG_EVENT_VM	      3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE 4
-#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
+#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
 
 	__u16 flags;
-#define DRM_XE_EUDEBUG_EVENT_CREATE	(1 << 0)
-#define DRM_XE_EUDEBUG_EVENT_DESTROY	(1 << 1)
+#define DRM_XE_EUDEBUG_EVENT_CREATE		BIT(0)
+#define DRM_XE_EUDEBUG_EVENT_DESTROY		BIT(1)
+#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	BIT(2)
 
 	__u64 seqno;
 	__u64 reserved;
@@ -66,6 +68,16 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[0];
 } __attribute__((packed));
 
+struct drm_xe_eudebug_event_eu_attention {
+	struct drm_xe_eudebug_event base;
+	__u64 client_handle;
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u8 bitmask[0];
+} __attribute__((packed));
+
 /*
  * Debugger ABI (ioctl and events) Version History:
  * 0 - No debugger available
-- 
2.34.1

