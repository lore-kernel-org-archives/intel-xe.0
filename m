Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3D3C0218F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 06:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6D510E675;
	Wed, 22 Jan 2025 06:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORj6/7y/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3217810E148
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 06:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737527053; x=1769063053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w/moRH9+IkSO0naJ3yo7DXb8IabDH3x85sNRQjtaGKc=;
 b=ORj6/7y/qGXr3EyKqAg8nKaDeNav/z96RQMM/LwfeOpfEKx9riBTqad6
 Wdpksq/u07/x/2KTDkls3K8YmwdX5X3XMcLliCIrtKM3uLHgbMNcdGKy9
 iytq8Nt8BEqXkhWH2X0/lnbX+S+Ctbwisao1ooAoRajhb8LdUm632tDXi
 cxrAJs6FxMlcXXsR264UhK0HC3Iu3bgyB90I+PHJURSrN5N+n1appdUhP
 qc01E0fx2I8VuAdB+GkfNbyrEdKHQ8R61wsnOIL3UANFC2hGXqCbJInQZ
 haZ8DrIReYIv1DZzQYQBnSl/Fp1Dhu4L7PHjf4H0zCUhCh3mSesLjoRoK A==;
X-CSE-ConnectionGUID: 53Dxy6IlQ5O+sF6oPzkFEA==
X-CSE-MsgGUID: Ga7VimQeTMCfjEbSuOY06A==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41643305"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="41643305"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:12 -0800
X-CSE-ConnectionGUID: +jLyik/bRemze9AfdNkCpQ==
X-CSE-MsgGUID: yq05QiH2QR2hLlklRtK8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112015657"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:24:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v14 2/7] drm/xe/pmu: Enable PMU interface
Date: Tue, 21 Jan 2025 22:23:36 -0800
Message-ID: <20250122062341.1100173-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250122062341.1100173-1-lucas.demarchi@intel.com>
References: <20250122062341.1100173-1-lucas.demarchi@intel.com>
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Basic PMU enabling patch. Setup the basic framework
for adding events/timers. This patch was previously
reviewed here -
https://patchwork.freedesktop.org/series/119504/

Based on previous versions by Bommu Krishnaiah, Aravind Iddamsetty and
Riana Tauro, using i915 and rapl as reference implementation.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_pmu.c          | 299 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  20 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  43 ++++
 6 files changed, 371 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 68861db5f27ce..aa0d981663e4c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -305,6 +305,8 @@ endif
 xe-$(CONFIG_DRM_XE_DP_TUNNEL) += \
 	i915-display/intel_dp_tunnel.o
 
+xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bd6191e1ed3e7..f3f754beb812b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -49,6 +49,7 @@
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
+#include "xe_pmu.h"
 #include "xe_query.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
@@ -871,6 +872,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_oa_register(xe);
 
+	xe_pmu_register(&xe->pmu);
+
 	xe_debugfs_register(xe);
 
 	xe_hwmon_register(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 16ebb2859877f..58e79e19deaad 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,6 +18,7 @@
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
+#include "xe_pmu_types.h"
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
@@ -514,6 +515,9 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @pmu: performance monitoring unit */
+	struct xe_pmu pmu;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
new file mode 100644
index 0000000000000..c5641af6e9a91
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
+
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_gt_clock.h"
+#include "xe_gt_printk.h"
+#include "xe_mmio.h"
+#include "xe_macros.h"
+#include "xe_pm.h"
+#include "xe_pmu.h"
+
+/**
+ * DOC: Xe PMU (Performance Monitoring Unit)
+ *
+ * Expose events/counters like GT-C6 residency and GT frequency to user land.
+ * Events are per device. The GT can be selected with an extra config sub-field
+ * (bits 60-63).
+ *
+ * All events are listed in sysfs:
+ *
+ *     $ ls -ld /sys/bus/event_source/devices/xe_*
+ *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
+ *     $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
+ *
+ * The format directory has info regarding the configs that can be used.
+ * The standard perf tool can be used to grep for a certain event as well.
+ * Example:
+ *
+ *     $ perf list | grep gt-c6
+ *
+ * To sample a specific event for a GT at regular intervals:
+ *
+ *     $ perf stat -e <event_name,gt=> -I <interval>
+ */
+
+#define XE_PMU_EVENT_GT_MASK		GENMASK_ULL(63, 60)
+#define XE_PMU_EVENT_ID_MASK		GENMASK_ULL(11, 0)
+
+static unsigned int config_to_event_id(u64 config)
+{
+	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
+}
+
+static unsigned int config_to_gt_id(u64 config)
+{
+	return FIELD_GET(XE_PMU_EVENT_GT_MASK, config);
+}
+
+static struct xe_gt *event_to_gt(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	u64 gt = config_to_gt_id(event->attr.config);
+
+	return xe_device_get_gt(xe, gt);
+}
+
+static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
+			    unsigned int id)
+{
+	if (gt >= XE_MAX_GT_PER_TILE)
+		return false;
+
+	return false;
+}
+
+static void xe_pmu_event_destroy(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+
+	drm_WARN_ON(&xe->drm, event->parent);
+	drm_dev_put(&xe->drm);
+}
+
+static int xe_pmu_event_init(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	unsigned int id, gt;
+
+	if (!pmu->registered)
+		return -ENODEV;
+
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	/* unsupported modes and filters */
+	if (event->attr.sample_period) /* no sampling */
+		return -EINVAL;
+
+	if (event->cpu < 0)
+		return -EINVAL;
+
+	gt = config_to_gt_id(event->attr.config);
+	id = config_to_event_id(event->attr.config);
+	if (!event_supported(pmu, gt, id))
+		return -ENOENT;
+
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
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
+	struct xe_gt *gt = event_to_gt(event);
+	u64 val = 0;
+
+	if (!gt)
+		return 0;
+
+	return val;
+}
+
+static void xe_pmu_event_read(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct hw_perf_event *hwc = &event->hw;
+	struct xe_pmu *pmu = &xe->pmu;
+	u64 prev, new;
+
+	if (!pmu->registered) {
+		event->hw.state = PERF_HES_STOPPED;
+		return;
+	}
+
+	prev = local64_read(&hwc->prev_count);
+	do {
+		new = __xe_pmu_event_read(event);
+	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
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
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->registered)
+		return;
+
+	xe_pmu_enable(event);
+	event->hw.state = 0;
+}
+
+static void xe_pmu_event_stop(struct perf_event *event, int flags)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (pmu->registered)
+		if (flags & PERF_EF_UPDATE)
+			xe_pmu_event_read(event);
+
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static int xe_pmu_event_add(struct perf_event *event, int flags)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->registered)
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
+PMU_FORMAT_ATTR(gt,	"config:60-63");
+PMU_FORMAT_ATTR(event,	"config:0-11");
+
+static struct attribute *pmu_format_attrs[] = {
+	&format_attr_event.attr,
+	&format_attr_gt.attr,
+	NULL,
+};
+
+static const struct attribute_group pmu_format_attr_group = {
+	.name = "format",
+	.attrs = pmu_format_attrs,
+};
+
+static struct attribute *pmu_event_attrs[] = {
+	/* No events yet */
+	NULL,
+};
+
+static const struct attribute_group pmu_events_attr_group = {
+	.name = "events",
+	.attrs = pmu_event_attrs,
+};
+
+/**
+ * xe_pmu_unregister() - Remove/cleanup PMU registration
+ * @arg: Ptr to pmu
+ */
+static void xe_pmu_unregister(void *arg)
+{
+	struct xe_pmu *pmu = arg;
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+
+	if (!pmu->registered)
+		return;
+
+	pmu->registered = false;
+
+	perf_pmu_unregister(&pmu->base);
+	kfree(pmu->name);
+}
+
+/**
+ * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
+ * @pmu: the PMU object
+ *
+ * Returns 0 on success and an appropriate error code otherwise
+ */
+int xe_pmu_register(struct xe_pmu *pmu)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	static const struct attribute_group *attr_groups[] = {
+		&pmu_format_attr_group,
+		&pmu_events_attr_group,
+		NULL
+	};
+	int ret = -ENOMEM;
+	char *name;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
+	raw_spin_lock_init(&pmu->lock);
+
+	name = kasprintf(GFP_KERNEL, "xe_%s",
+			 dev_name(xe->drm.dev));
+	if (!name)
+		goto err;
+
+	/* tools/perf reserves colons as special. */
+	strreplace(name, ':', '_');
+
+	pmu->name		= name;
+	pmu->base.attr_groups	= attr_groups;
+	pmu->base.scope		= PERF_PMU_SCOPE_SYS_WIDE;
+	pmu->base.module	= THIS_MODULE;
+	pmu->base.task_ctx_nr	= perf_invalid_context;
+	pmu->base.event_init	= xe_pmu_event_init;
+	pmu->base.add		= xe_pmu_event_add;
+	pmu->base.del		= xe_pmu_event_del;
+	pmu->base.start		= xe_pmu_event_start;
+	pmu->base.stop		= xe_pmu_event_stop;
+	pmu->base.read		= xe_pmu_event_read;
+
+	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
+	if (ret)
+		goto err_name;
+
+	pmu->registered = true;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
+
+err_name:
+	kfree(name);
+err:
+	drm_err(&xe->drm, "Failed to register PMU (ret=%d)!\n", ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
new file mode 100644
index 0000000000000..f9dfe77d00cb6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PMU_H_
+#define _XE_PMU_H_
+
+#include "xe_pmu_types.h"
+
+struct xe_gt;
+
+#if IS_ENABLED(CONFIG_PERF_EVENTS)
+int xe_pmu_register(struct xe_pmu *pmu);
+#else
+static inline void xe_pmu_register(struct xe_pmu *pmu) {}
+#endif
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
new file mode 100644
index 0000000000000..e0cf7169f4fda
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PMU_TYPES_H_
+#define _XE_PMU_TYPES_H_
+
+#include <linux/perf_event.h>
+#include <linux/spinlock_types.h>
+
+enum {
+	__XE_NUM_PMU_SAMPLERS
+};
+
+#define XE_PMU_MAX_GT 2
+
+/**
+ * struct xe_pmu - PMU related data per Xe device
+ *
+ * Stores per device PMU info that includes event/perf attributes and
+ * sampling counters across all GTs for this device.
+ */
+struct xe_pmu {
+	/**
+	 * @base: PMU base.
+	 */
+	struct pmu base;
+	/**
+	 * @registered: PMU is registered and not in the unregistering process.
+	 */
+	bool registered;
+	/**
+	 * @name: Name as registered with perf core.
+	 */
+	const char *name;
+	/**
+	 * @lock: Lock protecting enable mask and ref count handling.
+	 */
+	raw_spinlock_t lock;
+};
+
+#endif
-- 
2.48.0

