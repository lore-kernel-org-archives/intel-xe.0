Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22FCEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 04:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29E010E09E;
	Mon, 19 Jun 2023 04:48:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAE110E09E
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 04:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687150091; x=1718686091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UDt1yIEqpU2LjQldQe5/gl9Mlr7KP3KUrojWzR8qxnE=;
 b=nesIMrDkUnk7PcMmCDCQ1XDGiNvtXcRjJpa5Az5Z4BVf/mE0bDWMPeEh
 bAc0wfShlXWmkdu+SsZISMWndXBpmJBHF+ny3fQ56DJIbTP7LbicUSGvh
 jB0qvbLdJuNlXTA8l5gqVQyyJva+hFSyoAHLm69tpi7GFwyETW8sus2qA
 KPAK92vdrwCojjBiJ7osEEqeT3YaTjuA1dKdjWfzRdq1yLShdrSUJGlue
 0Oy24JHo6z7xQ/FO+mLK+tOl47o6WR9VHHS2VsmmWxcjSfUby1f2DWjtp
 dsRjKS/Oe/XYSiWqj+/xZOieTsjeqXvzzSneKMvD9xGFE8lG+uhkNdA4i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349260745"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="349260745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 21:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="713541758"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; d="scan'208";a="713541758"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2023 21:48:09 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 10:21:28 +0530
Message-Id: <20230619045128.3716798-3-aravind.iddamsetty@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
References: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There are a set of engine group busyness counters provided by HW which are
perfect fit to be exposed via PMU perf events.

BSPEC: 46559, 46560, 46722, 46729

events can be listed using:
perf list
  xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
  xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
  xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
  xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
  xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]

and can be read using:
perf stat -e "xe_0000_03_00.0/render-group-busy-gt0/" -I 1000
           time             counts unit events
     1.001343319                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     2.011523336                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     3.014168811                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     4.016671838                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     5.018363448                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
     6.020125417 18446743376875220992 ns xe_0000_03_00.0/render-group-busy-gt0/
     7.021584533 18446744073708230656 ns xe_0000_03_00.0/render-group-busy-gt0/
     8.029878236       696835650983 ns xe_0000_03_00.0/render-group-busy-gt0/
     9.032367313                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
    10.034799448                  0 ns xe_0000_03_00.0/render-group-busy-gt0/

The pmu base implementation is taken from i915.

Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_irq.c          |  22 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 634 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  22 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  54 +++
 include/uapi/drm/xe_drm.h            |  16 +
 10 files changed, 765 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 081c57fd8632..d617ef8497eb 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -85,6 +85,7 @@ xe-y += xe_bb.o \
 	xe_pci.o \
 	xe_pcode.o \
 	xe_pm.o \
+	xe_pmu.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
 	xe_pt_walk.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3f664011eaea..c7d9e4634745 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -285,6 +285,11 @@
 #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
 #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
 
+#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE		XE_REG(0xdb80)
+#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
+#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
+#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
+
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7985af85a53..b2c7bd4a97d9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -328,6 +328,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	xe_pmu_register(&xe->pmu);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0226d44a6af2..3ba99aae92b9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -15,6 +15,7 @@
 #include "xe_devcoredump_types.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
+#include "xe_pmu.h"
 #include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
@@ -332,6 +333,9 @@ struct xe_device {
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
+	/* @pmu: performance monitoring unit */
+	struct xe_pmu pmu;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b4ed1e4a3388..cb943fb94ec7 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -27,6 +27,24 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
+/*
+ * Interrupt statistic for PMU. Increments the counter only if the
+ * interrupt originated from the GPU so interrupts from a device which
+ * shares the interrupt line are not accounted.
+ */
+static inline void xe_pmu_irq_stats(struct xe_device *xe,
+				    irqreturn_t res)
+{
+	if (unlikely(res != IRQ_HANDLED))
+		return;
+
+	/*
+	 * A clever compiler translates that into INC. A not so clever one
+	 * should at least prevent store tearing.
+	 */
+	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
+}
+
 static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(mmio, reg);
@@ -325,6 +343,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 	xe_display_irq_enable(xe, gu_misc_iir);
 
+	xe_pmu_irq_stats(xe, IRQ_HANDLED);
+
 	return IRQ_HANDLED;
 }
 
@@ -414,6 +434,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	dg1_intr_enable(xe, false);
 	xe_display_irq_enable(xe, gu_misc_iir);
 
+	xe_pmu_irq_stats(xe, IRQ_HANDLED);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 75e5be939f53..f6fe89748525 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -12,6 +12,7 @@
 #include "xe_hw_fence.h"
 #include "xe_module.h"
 #include "xe_pci.h"
+#include "xe_pmu.h"
 #include "xe_sched_job.h"
 
 bool enable_guc = true;
@@ -49,6 +50,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_sched_job_module_init,
 		.exit = xe_sched_job_module_exit,
 	},
+	{
+		.init = xe_pmu_init,
+		.exit = xe_pmu_exit,
+	},
 	{
 		.init = xe_register_pci_driver,
 		.exit = xe_unregister_pci_driver,
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
new file mode 100644
index 000000000000..f9b25accdeb1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -0,0 +1,634 @@
+/*
+ * SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
+
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_gt_clock.h"
+#include "xe_mmio.h"
+
+static cpumask_t xe_pmu_cpumask;
+static unsigned int xe_pmu_target_cpu = -1;
+
+static unsigned int config_gt_id(const u64 config)
+{
+	return config >> __XE_PMU_GT_SHIFT;
+}
+
+static u64 config_counter(const u64 config)
+{
+	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
+}
+
+static void xe_pmu_event_destroy(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+
+	drm_WARN_ON(&xe->drm, event->parent);
+
+	drm_dev_put(&xe->drm);
+}
+
+static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
+{
+	u64 val = 0;
+
+	switch (config) {
+	case XE_PMU_RENDER_GROUP_BUSY(0):
+		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
+		break;
+	case XE_PMU_COPY_GROUP_BUSY(0):
+		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
+		break;
+	case XE_PMU_MEDIA_GROUP_BUSY(0):
+		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
+		break;
+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
+		break;
+	default:
+		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
+	}
+
+	return xe_gt_clock_interval_to_ns(gt, val * 16);
+}
+
+static int
+config_status(struct xe_device *xe, u64 config)
+{
+	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
+	unsigned int gt_id = config_gt_id(config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+
+	if (gt_id > max_gt_id)
+		return -ENOENT;
+
+	switch (config_counter(config)) {
+	case XE_PMU_INTERRUPTS(0):
+		if (gt_id)
+			return -ENOENT;
+		break;
+	case XE_PMU_RENDER_GROUP_BUSY(0):
+	case XE_PMU_COPY_GROUP_BUSY(0):
+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+		if (GRAPHICS_VER(xe) < 12)
+			return -ENOENT;
+		break;
+	case XE_PMU_MEDIA_GROUP_BUSY(0):
+		if (MEDIA_VER(xe) >= 13 && gt->info.type != XE_GT_TYPE_MEDIA)
+			return -ENOENT;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int xe_pmu_event_init(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	int ret;
+
+	if (pmu->closed)
+		return -ENODEV;
+
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	/* unsupported modes and filters */
+	if (event->attr.sample_period) /* no sampling */
+		return -EINVAL;
+
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
+
+	if (event->cpu < 0)
+		return -EINVAL;
+
+	/* only allow running on one cpu at a time */
+	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
+		return -EINVAL;
+
+	ret = config_status(xe, event->attr.config);
+	if (ret)
+		return ret;
+
+	if (!event->parent) {
+		drm_dev_get(&xe->drm);
+		event->destroy = xe_pmu_event_destroy;
+	}
+
+	return 0;
+}
+
+static u64 __xe_pmu_event_read(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	const unsigned int gt_id = config_gt_id(event->attr.config);
+	const u64 config = config_counter(event->attr.config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	struct xe_pmu *pmu = &xe->pmu;
+	u64 val = 0;
+
+	switch (config) {
+	case XE_PMU_INTERRUPTS(0):
+		val = READ_ONCE(pmu->irq_count);
+		break;
+	case XE_PMU_RENDER_GROUP_BUSY(0):
+	case XE_PMU_COPY_GROUP_BUSY(0):
+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+	case XE_PMU_MEDIA_GROUP_BUSY(0):
+		val = engine_group_busyness_read(gt, config);
+	}
+
+	return val;
+}
+
+static void xe_pmu_event_read(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct hw_perf_event *hwc = &event->hw;
+	struct xe_pmu *pmu = &xe->pmu;
+	u64 prev, new;
+
+	if (pmu->closed) {
+		event->hw.state = PERF_HES_STOPPED;
+		return;
+	}
+again:
+	prev = local64_read(&hwc->prev_count);
+	new = __xe_pmu_event_read(event);
+
+	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
+		goto again;
+
+	local64_add(new - prev, &event->count);
+}
+
+static void xe_pmu_enable(struct perf_event *event)
+{
+	/*
+	 * Store the current counter value so we can report the correct delta
+	 * for all listeners. Even when the event was already enabled and has
+	 * an existing non-zero value.
+	 */
+	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
+}
+
+static void xe_pmu_event_start(struct perf_event *event, int flags)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (pmu->closed)
+		return;
+
+	xe_pmu_enable(event);
+	event->hw.state = 0;
+}
+
+static void xe_pmu_event_stop(struct perf_event *event, int flags)
+{
+	if (flags & PERF_EF_UPDATE)
+		xe_pmu_event_read(event);
+
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static int xe_pmu_event_add(struct perf_event *event, int flags)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (pmu->closed)
+		return -ENODEV;
+
+	if (flags & PERF_EF_START)
+		xe_pmu_event_start(event, flags);
+
+	return 0;
+}
+
+static void xe_pmu_event_del(struct perf_event *event, int flags)
+{
+	xe_pmu_event_stop(event, PERF_EF_UPDATE);
+}
+
+static int xe_pmu_event_event_idx(struct perf_event *event)
+{
+	return 0;
+}
+
+struct xe_str_attribute {
+	struct device_attribute attr;
+	const char *str;
+};
+
+static ssize_t xe_pmu_format_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct xe_str_attribute *eattr;
+
+	eattr = container_of(attr, struct xe_str_attribute, attr);
+	return sprintf(buf, "%s\n", eattr->str);
+}
+
+#define XE_PMU_FORMAT_ATTR(_name, _config) \
+	(&((struct xe_str_attribute[]) { \
+		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
+		  .str = _config, } \
+	})[0].attr.attr)
+
+static struct attribute *xe_pmu_format_attrs[] = {
+	XE_PMU_FORMAT_ATTR(xe_eventid, "config:0-20"),
+	NULL,
+};
+
+static const struct attribute_group xe_pmu_format_attr_group = {
+	.name = "format",
+	.attrs = xe_pmu_format_attrs,
+};
+
+struct xe_ext_attribute {
+	struct device_attribute attr;
+	unsigned long val;
+};
+
+static ssize_t xe_pmu_event_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct xe_ext_attribute *eattr;
+
+	eattr = container_of(attr, struct xe_ext_attribute, attr);
+	return sprintf(buf, "config=0x%lx\n", eattr->val);
+}
+
+static ssize_t cpumask_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
+}
+
+static DEVICE_ATTR_RO(cpumask);
+
+static struct attribute *xe_cpumask_attrs[] = {
+	&dev_attr_cpumask.attr,
+	NULL,
+};
+
+static const struct attribute_group xe_pmu_cpumask_attr_group = {
+	.attrs = xe_cpumask_attrs,
+};
+
+#define __event(__counter, __name, __unit) \
+{ \
+	.counter = (__counter), \
+	.name = (__name), \
+	.unit = (__unit), \
+	.global = false, \
+}
+
+#define __global_event(__counter, __name, __unit) \
+{ \
+	.counter = (__counter), \
+	.name = (__name), \
+	.unit = (__unit), \
+	.global = true, \
+}
+
+static struct xe_ext_attribute *
+add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
+{
+	sysfs_attr_init(&attr->attr.attr);
+	attr->attr.attr.name = name;
+	attr->attr.attr.mode = 0444;
+	attr->attr.show = xe_pmu_event_show;
+	attr->val = config;
+
+	return ++attr;
+}
+
+static struct perf_pmu_events_attr *
+add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
+	     const char *str)
+{
+	sysfs_attr_init(&attr->attr.attr);
+	attr->attr.attr.name = name;
+	attr->attr.attr.mode = 0444;
+	attr->attr.show = perf_event_sysfs_show;
+	attr->event_str = str;
+
+	return ++attr;
+}
+
+static struct attribute **
+create_event_attributes(struct xe_pmu *pmu)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	static const struct {
+		unsigned int counter;
+		const char *name;
+		const char *unit;
+		bool global;
+	} events[] = {
+		__global_event(0, "interrupts", NULL),
+		__event(1, "render-group-busy", "ns"),
+		__event(2, "copy-group-busy", "ns"),
+		__event(3, "media-group-busy", "ns"),
+		__event(4, "any-engine-group-busy", "ns"),
+	};
+
+	unsigned int count = 0;
+	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
+	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
+	struct attribute **attr = NULL, **attr_iter;
+	struct xe_gt *gt;
+	unsigned int i, j;
+
+	/* Count how many counters we will be exposing. */
+	for_each_gt(gt, xe, j) {
+		for (i = 0; i < ARRAY_SIZE(events); i++) {
+			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
+
+			if (!config_status(xe, config))
+				count++;
+		}
+	}
+
+	/* Allocate attribute objects and table. */
+	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
+	if (!xe_attr)
+		goto err_alloc;
+
+	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
+	if (!pmu_attr)
+		goto err_alloc;
+
+	/* Max one pointer of each attribute type plus a termination entry. */
+	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		goto err_alloc;
+
+	xe_iter = xe_attr;
+	pmu_iter = pmu_attr;
+	attr_iter = attr;
+
+	for_each_gt(gt, xe, j) {
+		for (i = 0; i < ARRAY_SIZE(events); i++) {
+			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
+			char *str;
+
+			if (config_status(xe, config))
+				continue;
+
+			if (events[i].global)
+				str = kstrdup(events[i].name, GFP_KERNEL);
+			else
+				str = kasprintf(GFP_KERNEL, "%s-gt%u",
+						events[i].name, j);
+			if (!str)
+				goto err;
+
+			*attr_iter++ = &xe_iter->attr.attr;
+			xe_iter = add_xe_attr(xe_iter, str, config);
+
+			if (events[i].unit) {
+				if (events[i].global)
+					str = kasprintf(GFP_KERNEL, "%s.unit",
+							events[i].name);
+				else
+					str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
+							events[i].name, j);
+				if (!str)
+					goto err;
+
+				*attr_iter++ = &pmu_iter->attr.attr;
+				pmu_iter = add_pmu_attr(pmu_iter, str,
+							events[i].unit);
+			}
+		}
+	}
+
+	pmu->xe_attr = xe_attr;
+	pmu->pmu_attr = pmu_attr;
+
+	return attr;
+
+err:
+	for (attr_iter = attr; *attr_iter; attr_iter++)
+		kfree((*attr_iter)->name);
+
+err_alloc:
+	kfree(attr);
+	kfree(xe_attr);
+	kfree(pmu_attr);
+
+	return NULL;
+}
+
+static void free_event_attributes(struct xe_pmu *pmu)
+{
+	struct attribute **attr_iter = pmu->events_attr_group.attrs;
+
+	for (; *attr_iter; attr_iter++)
+		kfree((*attr_iter)->name);
+
+	kfree(pmu->events_attr_group.attrs);
+	kfree(pmu->xe_attr);
+	kfree(pmu->pmu_attr);
+
+	pmu->events_attr_group.attrs = NULL;
+	pmu->xe_attr = NULL;
+	pmu->pmu_attr = NULL;
+}
+
+static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
+{
+	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
+
+	XE_BUG_ON(!pmu->base.event_init);
+
+	/* Select the first online CPU as a designated reader. */
+	if (cpumask_empty(&xe_pmu_cpumask))
+		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
+
+	return 0;
+}
+
+static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
+{
+	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
+	unsigned int target = xe_pmu_target_cpu;
+
+	XE_BUG_ON(!pmu->base.event_init);
+
+	/*
+	 * Unregistering an instance generates a CPU offline event which we must
+	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
+	 */
+	if (pmu->closed)
+		return 0;
+
+	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
+		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
+
+		/* Migrate events if there is a valid target */
+		if (target < nr_cpu_ids) {
+			cpumask_set_cpu(target, &xe_pmu_cpumask);
+			xe_pmu_target_cpu = target;
+		}
+	}
+
+	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
+		perf_pmu_migrate_context(&pmu->base, cpu, target);
+		pmu->cpuhp.cpu = target;
+	}
+
+	return 0;
+}
+
+static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
+
+int xe_pmu_init(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
+				      "perf/x86/intel/xe:online",
+				      xe_pmu_cpu_online,
+				      xe_pmu_cpu_offline);
+	if (ret < 0)
+		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
+			  ret);
+	else
+		cpuhp_slot = ret;
+
+	return 0;
+}
+
+void xe_pmu_exit(void)
+{
+	if (cpuhp_slot != CPUHP_INVALID)
+		cpuhp_remove_multi_state(cpuhp_slot);
+}
+
+static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
+{
+	if (cpuhp_slot == CPUHP_INVALID)
+		return -EINVAL;
+
+	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
+}
+
+static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
+{
+	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
+}
+
+static void xe_pmu_unregister(struct drm_device *device, void *arg)
+{
+	struct xe_pmu *pmu = arg;
+
+	if (!pmu->base.event_init)
+		return;
+
+	/*
+	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
+	 * ensures all currently executing ones will have exited before we
+	 * proceed with unregistration.
+	 */
+	pmu->closed = true;
+	synchronize_rcu();
+
+	xe_pmu_unregister_cpuhp_state(pmu);
+
+	perf_pmu_unregister(&pmu->base);
+	pmu->base.event_init = NULL;
+	kfree(pmu->base.attr_groups);
+	kfree(pmu->name);
+	free_event_attributes(pmu);
+}
+
+void xe_pmu_register(struct xe_pmu *pmu)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	const struct attribute_group *attr_groups[] = {
+		&xe_pmu_format_attr_group,
+		&pmu->events_attr_group,
+		&xe_pmu_cpumask_attr_group,
+		NULL
+	};
+
+	int ret = -ENOMEM;
+
+	pmu->cpuhp.cpu = -1;
+
+	pmu->name = kasprintf(GFP_KERNEL,
+			      "xe_%s",
+			      dev_name(xe->drm.dev));
+	if (pmu->name)
+		/* tools/perf reserves colons as special. */
+		strreplace((char *)pmu->name, ':', '_');
+
+	if (!pmu->name)
+		goto err;
+
+	pmu->events_attr_group.name = "events";
+	pmu->events_attr_group.attrs = create_event_attributes(pmu);
+	if (!pmu->events_attr_group.attrs)
+		goto err_name;
+
+	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
+					GFP_KERNEL);
+	if (!pmu->base.attr_groups)
+		goto err_attr;
+
+	pmu->base.module	= THIS_MODULE;
+	pmu->base.task_ctx_nr	= perf_invalid_context;
+	pmu->base.event_init	= xe_pmu_event_init;
+	pmu->base.add		= xe_pmu_event_add;
+	pmu->base.del		= xe_pmu_event_del;
+	pmu->base.start		= xe_pmu_event_start;
+	pmu->base.stop		= xe_pmu_event_stop;
+	pmu->base.read		= xe_pmu_event_read;
+	pmu->base.event_idx	= xe_pmu_event_event_idx;
+
+	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
+	if (ret)
+		goto err_groups;
+
+	ret = xe_pmu_register_cpuhp_state(pmu);
+	if (ret)
+		goto err_unreg;
+
+	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
+	XE_WARN_ON(ret);
+
+	return;
+
+err_unreg:
+	perf_pmu_unregister(&pmu->base);
+err_groups:
+	kfree(pmu->base.attr_groups);
+err_attr:
+	pmu->base.event_init = NULL;
+	free_event_attributes(pmu);
+err_name:
+	kfree(pmu->name);
+err:
+	drm_notice(&xe->drm, "Failed to register PMU!\n");
+}
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
new file mode 100644
index 000000000000..8accae840aba
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PMU_H_
+#define _XE_PMU_H_
+
+#include "xe_pmu_types.h"
+
+#ifdef CONFIG_PERF_EVENTS
+int xe_pmu_init(void);
+void xe_pmu_exit(void);
+void xe_pmu_register(struct xe_pmu *pmu);
+#else
+static inline int xe_pmu_init(void) { return 0; }
+static inline void xe_pmu_exit(void) {}
+static inline void xe_pmu_register(struct xe_pmu *pmu) {}
+#endif
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
new file mode 100644
index 000000000000..1b63f5c0135b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PMU_TYPES_H_
+#define _XE_PMU_TYPES_H_
+
+#include <linux/perf_event.h>
+#include <uapi/drm/xe_drm.h>
+
+struct xe_pmu {
+	/**
+	 * @cpuhp: Struct used for CPU hotplug handling.
+	 */
+	struct {
+		struct hlist_node node;
+		unsigned int cpu;
+	} cpuhp;
+	/**
+	 * @base: PMU base.
+	 */
+	struct pmu base;
+	/**
+	 * @closed: xe is unregistering.
+	 */
+	bool closed;
+	/**
+	 * @name: Name as registered with perf core.
+	 */
+	const char *name;
+	/**
+	 * @irq_count: Number of interrupts
+	 *
+	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
+	 * 4e9 interrupts are a lot and postprocessing can really deal with an
+	 * occasional wraparound easily. It's 32bit after all.
+	 */
+	unsigned long irq_count;
+	/**
+	 * @events_attr_group: Device events attribute group.
+	 */
+	struct attribute_group events_attr_group;
+	/**
+	 * @xe_attr: Memory block holding device attributes.
+	 */
+	void *xe_attr;
+	/**
+	 * @pmu_attr: Memory block holding device attributes.
+	 */
+	void *pmu_attr;
+};
+
+#endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9bdea8b81435..a79c0f29ba8d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -821,6 +821,22 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
+/* PMU event config IDs */
+
+/*
+ * Top 4 bits of every counter are GT id.
+ */
+#define __XE_PMU_GT_SHIFT (60)
+
+#define ___XE_PMU_OTHER(gt, x) \
+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
+
+#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
+#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
+#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
+#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
+#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

