Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C18C3DA7E
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6E510E9A6;
	Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQczENb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A9810E9A3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003451; x=1753539451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wPS2f2R+mNpE44zYYrtU8gN5YH/uqRIsxyD+V7LvzOg=;
 b=QQczENb5iRK9lhdVTu+cYw2CjIjfV//Di/a7emyTOlaJFLwPyQ1mLtNR
 3isnRgFpDNOw41xKmTC1tRa5w4xfNqfZ13fmWx4n7bef8GTjY/1skjJiv
 2WC1i+PTyWVDl+A7+Rzzu8qRmgIjnAHEVX1Dh7WuQR8ifojdkcGOL+cWa
 F69wkax1Oj6QnicqPL6MsXvXjD8pwIi5kUxsQfW1q0sO+sPesaModTkGy
 DNRZqGuRT7whqZUqtO8AlWd8keZ1FzWJVfC5sNhc7PHqK8moBskZJVzxM
 Rley02RJppB4GjtDUx/mSRx+bEHOohohaxCi7KYmPbSp9PT8iwcwfNZT7 g==;
X-CSE-ConnectionGUID: JXP01O0zQTeFEeP39a+QFw==
X-CSE-MsgGUID: zz1b/5GZR4KGciZDdpMGyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598761"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:31 -0700
X-CSE-ConnectionGUID: W0vKOdRPTRC55tw/Iay3lw==
X-CSE-MsgGUID: dC0JEC50RgysG/83w5Fe2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861394"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:29 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 10/21] drm/xe/eudebug: Introduce per device attention scan
 worker
Date: Fri, 26 Jul 2024 17:08:07 +0300
Message-Id: <20240726140818.54304-11-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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
- v3 error path fix in xe_send_gt_attention (Christoph)
- v4 runalone active fix (Mika)
- v5 q->lrc changes (Mika)
- v6 Use C99 flexible arrays (Maciej, checkpatch)
     function with 'for_each' in name (Maciej, checkpatch)
- v7 long running active fix (Dominik)
- v8 resource handling errors rebase (Mika)
- v9 find out lrc handles first before sending event (Mika)
- v10 adjust runalone shift according to hw

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   7 +
 drivers/gpu/drm/xe/xe_device.c           |   2 +
 drivers/gpu/drm/xe/xe_device_types.h     |   3 +
 drivers/gpu/drm/xe/xe_eudebug.c          | 389 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h          |   1 +
 drivers/gpu/drm/xe/xe_eudebug_types.h    |  32 ++
 drivers/gpu/drm/xe/xe_gt_debug.c         | 152 +++++++++
 drivers/gpu/drm/xe/xe_gt_debug.h         |  21 ++
 include/uapi/drm/xe_drm_eudebug.h        |  15 +-
 11 files changed, 624 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 06badc5f99af..b7b6b047c02c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -49,6 +49,7 @@ xe-y += xe_bb.o \
 	xe_gt_debugfs.o \
 	xe_gt_freq.o \
 	xe_gt_idle.o \
+	xe_gt_debug.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 764c270599d0..b9d713a2061d 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -132,6 +132,9 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
+#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
+#define   CURRENT_LRCA_VALID			REG_BIT(0)
+
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 96a59a96dd4c..03e83ce3e35d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -437,6 +437,8 @@
 #define   DISABLE_ECC				REG_BIT(5)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
 
+#define TD_ATT(x)				XE_REG_MCR(0xe470 + (x) * 4)
+
 #define ROW_CHICKEN4				XE_REG_MCR(0xe48c, XE_REG_OPTION_MASKED)
 #define   DISABLE_GRF_CLEAR			REG_BIT(13)
 #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
@@ -516,6 +518,11 @@
 #define   CCS_MODE_CSLICE(cslice, ccs) \
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
+#define RCU_DEBUG_1				XE_REG(0x14a00)
+#define   RCU_DEBUG_1_ENGINE_STATUS		REG_GENMASK(2, 0)
+#define   RCU_DEBUG_1_RUNALONE_ACTIVE		REG_BIT(2)
+#define   RCU_DEBUG_1_CONTEXT_ACTIVE		REG_BIT(0)
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 
 /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 90bb0a8b1881..ba1c80089906 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -768,6 +768,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	xe_eudebug_init_late(xe);
+
 	xe_hwmon_register(xe);
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4dcfd39cb909..3b33add576be 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -516,6 +516,9 @@ struct xe_device {
 
 		/** @ordered_wq: used to discovery */
 		struct workqueue_struct *ordered_wq;
+
+		/** @attention_scan: attention scan worker */
+		struct delayed_work attention_scan;
 	} eudebug;
 
 	/* private: */
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 9611acedeee9..c2de001cc33a 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -11,19 +11,29 @@
 
 #include <drm/drm_managed.h>
 
-#include "regs/xe_gt_regs.h"
 #include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_assert.h"
 #include "xe_macros.h"
 #include "xe_gt.h"
+#include "xe_gt_debug.h"
+#include "xe_lrc.h"
+#include "xe_hw_engine.h"
+#include "xe_exec_queue.h"
 #include "xe_eudebug_types.h"
 #include "xe_eudebug.h"
 #include "xe_exec_queue_types.h"
+#include "xe_guc_exec_queue_types.h"
+#include "xe_execlist_types.h"
+#include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 #include "xe_rtp.h"
+#include "xe_sched_job.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
+#include "xe_force_wake.h"
 
 /*
  * If there is no detected event read by userspace, during this period, assume
@@ -843,6 +853,371 @@ static const struct file_operations fops = {
 	.unlocked_ioctl	= xe_eudebug_ioctl,
 };
 
+static bool queue_has_active_job(struct xe_exec_queue *q)
+{
+
+	struct drm_gpu_scheduler *sched;
+	struct drm_sched_job *drm_job;
+
+	if (xe_device_uc_enabled(gt_to_xe(q->gt)))
+		sched = &q->guc->sched.base;
+	else
+		sched = &q->execlist->sched;
+
+	drm_job = list_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list);
+
+	if (drm_job) {
+		struct xe_sched_job *job = to_xe_sched_job(drm_job);
+
+		return xe_sched_job_started(job) && !xe_sched_job_completed(job);
+	} else if (xe_exec_queue_is_lr(q) &&
+		   (xe_lrc_ring_head(q->lrc[0]) != xe_lrc_ring_tail(q->lrc[0]))) {
+		return true;
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
+		lrc_ggtt = lower_32_bits(xe_lrc_descriptor(q->lrc[i]));
+		lrc_ggtt &= GENMASK(31, 12);
+		if (lrc_ggtt == lrc_hw)
+			return i;
+	}
+
+	return -1;
+}
+
+static u32 engine_status(const struct xe_hw_engine * const hwe,
+			 u32 rcu_debug1)
+{
+	const bool xe1 = GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20;
+	unsigned int shift;
+
+	if (hwe->class == XE_ENGINE_CLASS_RENDER) {
+		shift = 7;
+		XE_WARN_ON(hwe->instance != 0);
+	} else if (hwe->class == XE_ENGINE_CLASS_COMPUTE) {
+		XE_WARN_ON(hwe->instance > 3);
+
+		if (xe1)
+			shift = 10 + (hwe->instance * 3);
+		else
+			shift = 11 + (hwe->instance * 4);
+	} else {
+		XE_WARN_ON(hwe->class);
+		return 0;
+	}
+
+	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
+}
+
+static bool engine_runalone_set(const struct xe_hw_engine * const hwe,
+				   u32 rcu_debug1)
+{
+	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_RUNALONE_ACTIVE;
+}
+
+static bool engine_context_set(const struct xe_hw_engine * const hwe,
+			       u32 rcu_debug1)
+{
+	return engine_status(hwe, rcu_debug1) & RCU_DEBUG_1_CONTEXT_ACTIVE;
+}
+
+static bool engine_has_runalone(const struct xe_hw_engine * const hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_RENDER ||
+		hwe->class == XE_ENGINE_CLASS_COMPUTE;
+}
+
+static struct xe_hw_engine *get_runalone_active_hw_engine(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe, *first = NULL;
+	unsigned int num_active, id;
+	u32 val;
+
+	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
+		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone failed to get force wake\n");
+		return NULL;
+	}
+
+	val = xe_mmio_read32(gt, RCU_DEBUG_1);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone RCU_DEBUG_1 = 0x%08x\n", val);
+
+	num_active = 0;
+	for_each_hw_engine(hwe, gt, id) {
+		bool runalone, ctx;
+
+		if (!engine_has_runalone(hwe))
+			continue;
+
+		runalone = engine_runalone_set(hwe, val);
+		ctx = engine_context_set(hwe, val);
+
+		drm_dbg(&gt_to_xe(gt)->drm, "eudbg: engine %s: runalone=%s, context=%s",
+			hwe->name, runalone ? "active" : "inactive",
+			ctx ? "active" : "inactive");
+
+		/*
+		 * On earlier gen12 the context status seems to be idle when
+		 * it has raised attention. We have to omit the active bit.
+		 */
+		if (IS_DGFX(gt_to_xe(gt)))
+			ctx = true;
+
+		if (runalone && ctx) {
+			num_active++;
+
+			drm_dbg(&gt_to_xe(gt)->drm, "eudbg: runalone engine %s %s",
+				hwe->name, first ? "selected" : "found");
+			if (!first)
+				first = hwe;
+		}
+	}
+
+	if (num_active > 1)
+		drm_err(&gt_to_xe(gt)->drm, "eudbg: %d runalone engines active!",
+			num_active);
+
+	return first;
+}
+
+static struct xe_exec_queue *runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_exec_queue *q, *found = NULL;
+	struct xe_hw_engine *active;
+	struct xe_file *xef, *tmp;
+	unsigned long i;
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
+	mutex_lock(&xe->files.lock);
+	list_for_each_entry_safe(xef, tmp, &xe->files.list, link) {
+		mutex_lock(&xef->exec_queue.lock);
+		xa_for_each(&xef->exec_queue.xa, i, q) {
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
+
+			if (lrc_idx)
+				*lrc_idx = idx;
+
+			break;
+		}
+		mutex_unlock(&xef->exec_queue.lock);
+
+		if (found)
+			break;
+	}
+	mutex_unlock(&xe->files.lock);
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
+	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, q->vm->xef);
+	if (h_c < 0)
+		return h_c;
+
+	h_queue = find_handle(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, q);
+	if (h_queue < 0)
+		return h_queue;
+
+	h_lrc = find_handle(d->res, XE_EUDEBUG_RES_TYPE_LRC, q->lrc[lrc_idx]);
+	if (h_lrc < 0)
+		return h_lrc;
+
+	event = __xe_eudebug_create_event(d, 0, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					  DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, sz, GFP_KERNEL);
+
+	if (!event)
+		return -ENOSPC;
+
+	ea = cast_event(ea, event);
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
+	d = xe_eudebug_get(q->vm->xef);
+	if (!d) {
+		ret = -ENOTCONN;
+		goto err_exec_queue_put;
+	}
+
+	if (!completion_done(&d->discovery)) {
+		eu_dbg(d, "discovery not yet done\n");
+		ret = -EBUSY;
+		goto err_eudebug_put;
+	}
+
+	ret = send_attention_event(d, q, lrc_idx);
+	if (ret)
+		xe_eudebug_disconnect(d, ret);
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
+			if (ret) {
+				// TODO: error capture
+				drm_info(&gt_to_xe(gt)->drm,
+					 "gt:%d unable to handle eu attention ret=%d\n",
+					 gt_id, ret);
+
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
 static void discovery_work_fn(struct work_struct *work);
 
 static int
@@ -877,6 +1252,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_init(&d->ref);
 	spin_lock_init(&d->connection.lock);
+	mutex_init(&d->eu_lock);
 	init_waitqueue_head(&d->events.write_done);
 	init_waitqueue_head(&d->events.read_done);
 	init_completion(&d->discovery);
@@ -903,6 +1279,7 @@ xe_eudebug_connect(struct xe_device *xe,
 
 	kref_get(&d->ref);
 	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
+	attention_scan_flush(xe);
 
 	eu_dbg(d, "connected session %lld", d->session);
 
@@ -979,12 +1356,22 @@ void xe_eudebug_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->eudebug.lock);
 	INIT_LIST_HEAD(&xe->eudebug.list);
+	INIT_DELAYED_WORK(&xe->eudebug.attention_scan, attention_scan_fn);
 
 	xe->eudebug.available = true;
 }
 
+void xe_eudebug_init_late(struct xe_device *xe)
+{
+	if (!xe->eudebug.available)
+		return;
+
+	attention_scan_flush(xe);
+}
+
 void xe_eudebug_fini(struct xe_device *xe)
 {
+	attention_scan_cancel(xe);
 	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index ac89a3d1ee1d..1e233c4683d6 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -18,6 +18,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     struct drm_file *file);
 
 void xe_eudebug_init(struct xe_device *xe);
+void xe_eudebug_init_late(struct xe_device *xe);
 void xe_eudebug_fini(struct xe_device *xe);
 void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 6e3c23023933..16667b4dfe45 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -105,6 +105,9 @@ struct xe_eudebug {
 	/** @discovery_work: worker to discover resources for target_task */
 	struct work_struct discovery_work;
 
+	/** eu_lock: guards operations on eus (eu thread control and attention) */
+	struct mutex eu_lock;
+
 	/** @events: kfifo queue of to-be-delivered events */
 	struct {
 		/** @lock: guards access to fifo */
@@ -202,4 +205,33 @@ struct xe_eudebug_event_exec_queue {
 	u64 lrc_handle[];
 };
 
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
+	u8 bitmask[];
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
new file mode 100644
index 000000000000..04d2d43ce249
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -0,0 +1,152 @@
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
+#include "xe_macros.h"
+
+static int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
+					    int (*fn)(struct xe_gt *gt,
+						      void *data,
+						      u16 group,
+						      u16 instance),
+					    void *data)
+{
+	const enum xe_force_wake_domains fw_domains = XE_FW_GT | XE_FW_RENDER;
+	unsigned int dss;
+	u16 group, instance;
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
+				    u16 group, u16 instance)
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
+				  u16 group, u16 instance)
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
+	return xe_gt_foreach_dss_group_instance(gt, read_eu_attentions_mcr, &iter);
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
+	err = xe_gt_foreach_dss_group_instance(gt, read_first_attention_mcr, NULL);
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
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 25dddb8b22f4..453269ac8307 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -27,13 +27,15 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_OPEN		2
 #define DRM_XE_EUDEBUG_EVENT_VM			3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
-#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
+#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_EU_ATTENTION
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
 #define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
 #define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
 #define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
+
 	__u64 seqno;
 	__u64 reserved;
 };
@@ -62,6 +64,17 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[];
 };
 
+struct drm_xe_eudebug_event_eu_attention {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u8 bitmask[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

