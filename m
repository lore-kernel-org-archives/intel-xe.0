Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5722FD41C02
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 04:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7BA10E684;
	Wed, 13 Nov 2024 04:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlz4gCV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18A710E336
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 04:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731472856; x=1763008856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iu9nIYEhhsO5R9CqtWXy5IVG7JH/LY3vmTwwJoODZGE=;
 b=mlz4gCV/Gh/0FLVeIUtsUWhrWLRQAfPPYhXWecfr/4kZQJICnrntgR0I
 NTX901YV+3ziMAEtOC7myzsnpCHouGZZe20VDyUX8DqSQ1hAzqictH97p
 W0O9hT1G6kBKWqEuI2p8F0xTBnCPWzThiW8/YhEIOe3UHw6giYXtD6CfK
 NV+nCpS0+HMMTacCZdoQuVo59XNanWiw0ZAVndWkromkQ+dabYb78HMX3
 sza7nIYCopwqnDjLkpk+/JftasQoaPYMkqT1zEYLgvotQTNWse9mWiMql
 1pzrGH9Bhxt7HHA4+PJjQYYQFDg0Q5uE74fNJpWK0lmnCdAnVg94GHuR4 g==;
X-CSE-ConnectionGUID: DSiclq7cRTKbV+OkkzCkJw==
X-CSE-MsgGUID: BSNe36ygQq6hryl6XHV13g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30742197"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="30742197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:52 -0800
X-CSE-ConnectionGUID: vue+FeMMTUeNcJ2V+0UZng==
X-CSE-MsgGUID: q5zrmH2CROGrZnGD9eugiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87489503"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:50 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH 5/7] drm/xe: Add single engine busyness support
Date: Wed, 13 Nov 2024 10:25:47 +0530
Message-Id: <20241113045549.2390980-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241113045549.2390980-1-riana.tauro@intel.com>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
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

GuC provides support to read engine active counters to calculate the
engine utilization. KMD exposes two counters via the PMU interface to
calculate engine busyness

Engine Active Ticks(<engine>-busy-ticks-gt<n>) - number of active ticks
						 for engine
Total Ticks (<engine>-total-ticks-gt<n>) - total ticks GT has been active

Busyness percentage can be calculated as below
busyness % = (engine active ticks/total ticks) * 100.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_engine_activity.c       | 317 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine_activity.h       |  18 +
 drivers/gpu/drm/xe/xe_engine_activity_types.h |  85 +++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 8 files changed, 447 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c231ecaf86b8..32473c609824 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -33,6 +33,7 @@ xe-y += xe_bb.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
 	xe_drm_client.o \
+	xe_engine_activity.o \
 	xe_exec.o \
 	xe_execlist.o \
 	xe_exec_queue.o \
diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index b54fe40fc5a9..3a7834f7e421 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -138,6 +138,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
+	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0c9e4b2fafab..7a7283262673 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -355,6 +355,8 @@
 #define   RENDER_AWAKE_STATUS			REG_BIT(1)
 #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
 
+#define MISC_STATUS_0				XE_REG(0xa500)
+
 #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
 #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
 #define FORCEWAKE_GSC				XE_REG(0xa618)
diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
new file mode 100644
index 000000000000..7a2ae09d23de
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#include "xe_engine_activity.h"
+
+#include "abi/guc_actions_abi.h"
+#include "regs/xe_gt_regs.h"
+
+#include "xe_bo.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_ct.h"
+#include "xe_hw_engine.h"
+#include "xe_map.h"
+#include "xe_mmio.h"
+
+#define TOTAL_QUANTA 0x8000
+
+static struct xe_guc *engine_busy_to_guc(struct xe_engine_activity *engine_busy)
+{
+	return container_of(engine_busy, struct xe_guc, engine_busy);
+}
+
+static struct iosys_map *activity_to_map(struct activity_buffer *buffer)
+{
+	return &buffer->activity->vmap;
+}
+
+static struct iosys_map *metadata_to_map(struct activity_buffer *buffer)
+{
+	return &buffer->metadata->vmap;
+}
+
+static int allocate_activity_group(struct xe_engine_activity *engine_busy)
+{
+	u32 num_activity_group = 1;
+
+	engine_busy->ag =  kmalloc_array(num_activity_group,
+					 sizeof(struct activity_group),
+					 GFP_KERNEL);
+
+	if (!engine_busy->ag)
+		return -ENOMEM;
+
+	memset(engine_busy->ag, 0, num_activity_group * sizeof(struct activity_group));
+	engine_busy->num_activity_group = num_activity_group;
+
+	return 0;
+}
+
+static int allocate_activity_buffers(struct xe_engine_activity *engine_busy)
+{
+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
+	u32 size = sizeof(struct guc_engine_activity_data);
+	struct xe_guc *guc = engine_busy_to_guc(engine_busy);
+	struct activity_buffer *ab = &engine_busy->device_buffer;
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_bo *bo, *metadata_bo;
+
+	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
+						   XE_BO_FLAG_SYSTEM |
+						   XE_BO_FLAG_GGTT |
+						   XE_BO_FLAG_GGTT_INVALIDATE);
+	if (IS_ERR(metadata_bo))
+		return PTR_ERR(metadata_bo);
+
+	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_INVALIDATE);
+
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	ab->metadata = metadata_bo;
+	ab->activity = bo;
+	return 0;
+}
+
+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
+{
+	struct xe_guc *guc = &hwe->gt->uc.guc;
+	struct activity_group *ag = &guc->engine_busy.ag[0];
+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
+
+	return &ag->engine[guc_class][hwe->logical_instance];
+}
+
+static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
+{
+	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
+}
+
+#define read_engine_activity_record(xe_, map_, field_) \
+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
+
+#define read_metadata_record(xe_, buffers_, field_) \
+	xe_map_rd_field(xe_, metadata_to_map(buffers_), \
+			0, struct guc_engine_activity_metadata, field_)
+
+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
+{
+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
+	struct guc_engine_activity *cached_activity = &ea->activity;
+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
+	struct activity_buffer *device_buffer = &engine_busy->device_buffer;
+	struct xe_device *xe =  guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
+	size_t offset = offsetof(struct guc_engine_activity_data,
+				 engine_activity[guc_class][hwe->logical_instance]);
+	struct iosys_map engine_activity_map = IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
+								     offset);
+	u32 last_update_tick, global_change_num;
+	u64 active_ticks, gpm_ts;
+	u16 change_num;
+
+	global_change_num = read_metadata_record(xe, device_buffer, global_change_num);
+
+	/* GuC has not initialized activity data yet, return 0 */
+	if (!global_change_num)
+		goto update;
+
+	if (global_change_num == cached_metadata->global_change_num)
+		goto update;
+	else
+		cached_metadata->global_change_num = global_change_num;
+
+	change_num = read_engine_activity_record(xe, &engine_activity_map, change_num);
+
+	if (!change_num || change_num == cached_activity->change_num)
+		goto update;
+
+	/* read engine activity values */
+	last_update_tick = read_engine_activity_record(xe, &engine_activity_map, last_update_tick);
+	active_ticks = read_engine_activity_record(xe, &engine_activity_map, active_ticks);
+
+	/* activity calculations */
+	ea->running = !!last_update_tick;
+	ea->total += active_ticks - cached_activity->active_ticks;
+	ea->active = 0;
+
+	/* cache the counter */
+	cached_activity->change_num = change_num;
+	cached_activity->last_update_tick = last_update_tick;
+	cached_activity->active_ticks = active_ticks;
+
+update:
+	if (ea->running) {
+		gpm_ts  = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
+			  engine_busy->gpm_timestamp_shift;
+		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
+	}
+
+	return ea->total + ea->active;
+}
+
+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
+{
+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
+	struct guc_engine_activity *cached_activity = &ea->activity;
+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
+	struct activity_buffer *device_buffer = &engine_busy->device_buffer;
+	struct xe_device *xe =  guc_to_xe(guc);
+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
+	size_t offset = offsetof(struct guc_engine_activity_data,
+				 engine_activity[guc_class][hwe->logical_instance]);
+	struct iosys_map engine_activity_map = IOSYS_MAP_INIT_OFFSET(activity_to_map(device_buffer),
+								     offset);
+
+	ktime_t now, cpu_delta;
+	u64 numerator;
+	u16 quanta_ratio;
+
+	if (!cached_metadata->guc_tsc_frequency_hz)
+		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe,
+									     device_buffer,
+									     guc_tsc_frequency_hz);
+
+	quanta_ratio = read_engine_activity_record(xe, &engine_activity_map, quanta_ratio);
+	cached_activity->quanta_ratio = quanta_ratio;
+
+	/* Total ticks calculations */
+	now = ktime_get();
+	cpu_delta = now - ea->last_cpu_ts;
+	ea->last_cpu_ts = now;
+	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
+	ea->quanta_ns += numerator / TOTAL_QUANTA;
+	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
+	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
+
+	return ea->quanta;
+}
+
+static int enable_engine_activity_stats(struct xe_guc *guc)
+{
+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
+	struct activity_buffer *buffer = &engine_busy->device_buffer;
+	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata);
+	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity);
+	int len = 0;
+	u32 action[5];
+
+	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
+	action[len++] = metadata_ggtt_addr;
+	action[len++] = 0;
+	action[len++] = ggtt_addr;
+	action[len++] = 0;
+
+	/* Blocking here to ensure the buffers are ready before reading them */
+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static void engine_activity_set_cpu_ts(struct xe_guc *guc)
+{
+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
+	struct activity_group *ag = engine_busy->ag;
+	int i, j;
+
+	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
+		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
+			ag->engine[i][j].last_cpu_ts = ktime_get();
+}
+
+static u32 gpm_timestamp_shift(struct xe_gt *gt)
+{
+	u32 reg;
+
+	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
+
+	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
+}
+
+/**
+ * xe_engine_activity_get_active_ticks - Get engine active ticks
+ * @hwe: The hw_engine object
+ *
+ * Return: accumulated ticks @hwe was busy since engine stats were enabled.
+ */
+u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
+{
+	struct xe_guc *guc =  &hwe->gt->uc.guc;
+
+	return get_engine_active_ticks(guc, hwe);
+}
+
+/**
+ * xe_engine_activity_get_total_ticks - Get engine total ticks
+ * @hwe: The hw_engine object
+ *
+ * Return: accumulated quanta of ticks allocated for the engine
+ */
+u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
+{
+	struct xe_guc *guc =  &hwe->gt->uc.guc;
+
+	return get_engine_total_ticks(guc, hwe);
+}
+
+/**
+ * xe_engine_activity_enable_stats - Enable engine activity stats
+ * @guc: The GuC object
+ *
+ * Enable engine activity stats and set initial timestamps
+ */
+void xe_engine_activity_enable_stats(struct xe_guc *guc)
+{
+	int ret;
+
+	ret = enable_engine_activity_stats(guc);
+	if (ret)
+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
+	else
+		engine_activity_set_cpu_ts(guc);
+}
+
+static void engine_activity_fini(void *arg)
+{
+	struct xe_engine_activity *engine_busy = arg;
+
+	kfree(engine_busy->ag);
+}
+
+/**
+ * xe_engine_activity_init - Initialize the engine activity data
+ * @guc: The GuC object
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int xe_engine_activity_init(struct xe_guc *guc)
+{
+	struct xe_engine_activity *engine_busy = &guc->engine_busy;
+	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
+
+	ret = allocate_activity_group(engine_busy);
+	if (ret) {
+		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
+		return ret;
+	}
+
+	ret = allocate_activity_buffers(engine_busy);
+	if (ret) {
+		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
+		kfree(engine_busy->ag);
+		return ret;
+	}
+
+	engine_busy->gpm_timestamp_shift = gpm_timestamp_shift(gt);
+
+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini, engine_busy);
+}
diff --git a/drivers/gpu/drm/xe/xe_engine_activity.h b/drivers/gpu/drm/xe/xe_engine_activity.h
new file mode 100644
index 000000000000..d44ac3366bd0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_engine_activity.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_ENGINE_ACTIVITY_H_
+#define _XE_ENGINE_ACTIVITY_H_
+
+#include <linux/types.h>
+
+struct xe_hw_engine;
+struct xe_guc;
+
+int xe_engine_activity_init(struct xe_guc *guc);
+void xe_engine_activity_enable_stats(struct xe_guc *guc);
+u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe);
+u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_engine_activity_types.h b/drivers/gpu/drm/xe/xe_engine_activity_types.h
new file mode 100644
index 000000000000..5fca85ddd15c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_engine_activity_types.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_ENGINE_ACTIVITY_TYPES_H_
+#define _XE_ENGINE_ACTIVITY_TYPES_H_
+
+#include <linux/types.h>
+
+#include "xe_guc_fwif.h"
+/**
+ * struct engine_activity - Engine specific activity data
+ *
+ * Contains engine specific activity data and snapshot of the
+ * structures from GuC
+ */
+struct engine_activity {
+	/** @active: current activity */
+	u64 active;
+
+	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
+	u64 last_cpu_ts;
+
+	/** @quanta: total quanta used on HW */
+	u64 quanta;
+
+	/** @quanta_ns: total quanta_ns used on HW */
+	u64 quanta_ns;
+
+	/**
+	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
+	 * per the quanta_ratio. This remainder is used insubsequent
+	 * quanta calculations.
+	 */
+	u64 quanta_remainder_ns;
+
+	/** @total: total engine activity */
+	u64 total;
+
+	/** @running: true if engine is running some work */
+	bool running;
+
+	/** @metadata: snapshot of engine activity metadata */
+	struct guc_engine_activity_metadata metadata;
+
+	/** @activity: snapshot of engine activity counter */
+	struct guc_engine_activity activity;
+};
+
+/**
+ * struct activity_group - Busyness data for all engines
+ */
+struct activity_group {
+	/** @engine: engine specific activity data */
+	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
+};
+
+/**
+ * struct activity_buffer - Activity buffers
+ *
+ * This contains the buffers allocated for metadata and activity data
+ */
+struct activity_buffer {
+	/* @activity: object allocated to hold activity data */
+	struct xe_bo *activity;
+	/* @metadata: object allocated to hold activity metadata */
+	struct xe_bo *metadata;
+};
+
+/**
+ * struct xe_engine_activity - Data used by engine activity implementation
+ */
+struct xe_engine_activity {
+	/* @gpm_timestamp_shift: Right shift value for the gpm timestamp */
+	u32 gpm_timestamp_shift;
+	/** num_activity_group: number of activity groups */
+	int num_activity_group;
+	/** @ag: holds the device level busyness data */
+	struct activity_group *ag;
+	/* @device_buffer: activity buffer object for global activity */
+	struct activity_buffer device_buffer;
+};
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 057153f89b30..8b336c15ef5b 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -208,6 +208,25 @@ struct guc_engine_usage {
 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 } __packed;
 
+/* Engine usage stats - v3 */
+struct guc_engine_activity {
+	u16 change_num;
+	u16 quanta_ratio;
+	u32 last_update_tick;
+	u64 active_ticks;
+} __packed;
+
+struct guc_engine_activity_data {
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
+} __packed;
+
+struct guc_engine_activity_metadata {
+	u32 guc_tsc_frequency_hz;
+	u32 lag_latency_usec;
+	u32 global_change_num;
+	u32 reserved;
+} __packed;
+
 /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
 enum xe_guc_recv_message {
 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index fa75f57bf5da..3a89bfb18307 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -10,6 +10,7 @@
 #include <linux/xarray.h>
 
 #include "regs/xe_reg_defs.h"
+#include "xe_engine_activity_types.h"
 #include "xe_guc_ads_types.h"
 #include "xe_guc_ct_types.h"
 #include "xe_guc_fwif.h"
@@ -90,6 +91,9 @@ struct xe_guc {
 	/** @relay: GuC Relay Communication used in SR-IOV */
 	struct xe_guc_relay relay;
 
+	/** @engine_busy: Device specific engine busyness */
+	struct xe_engine_activity engine_busy;
+
 	/**
 	 * @notify_reg: Register which is written to notify GuC of H2G messages
 	 */
-- 
2.40.0

