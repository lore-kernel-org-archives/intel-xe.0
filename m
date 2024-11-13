Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2187D637A3
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CEA10E05E;
	Wed, 13 Nov 2024 17:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDCsLoyv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345F910E05E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731519946; x=1763055946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nmjGNtCwiZUhNeLcCNfOGfetKA24spbT/bd/b/zPcI8=;
 b=gDCsLoyv8Dgw6KgW6DQkvfqMbDbCH8cBfKBcxjwxVDRpO/y0zQo2Qm89
 Sno43srszAd5Cl3/x7B39iJQWQe33YFrQBKG3nGuPvPJwI5qjAR8LCh//
 pMD7XEBX/sKL0yRqGu+415/eSsZn3+ASF0eSJvhALXyDigF9JhnGtvvdr
 cllGFpJaAwZn3FJPZ6blNHQjBWinWsKpb0Cf+bLT6Kr6dFGAXI3CK4K7m
 n0V9R6DEba/ziwb5rQNfvEvAu3f0vIM0YtQLV5Xot3yXR6wguPtN9/1Bj
 av7ROg0Cz0C5UUKQN9wwHrTkTsiXaE8eYLt1BTO5biFEk0N9wz0l4f4uW w==;
X-CSE-ConnectionGUID: gPDK5p/dQ6O3xlEZlBGjNA==
X-CSE-MsgGUID: Df8w9gplQbu0KDr7ehycrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53970921"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53970921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:45:46 -0800
X-CSE-ConnectionGUID: /LKbaj1XSwKPOeGpoY1R9A==
X-CSE-MsgGUID: 57bydYVgRQmIFKyPwmi9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="118754402"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa002.jf.intel.com with ESMTP; 13 Nov 2024 09:45:46 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 1/3] drm/xe/pmu: Enable PMU interface
Date: Wed, 13 Nov 2024 09:42:40 -0800
Message-Id: <20241113174242.24787-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
References: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
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

From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Basic PMU enabling patch. Setup the basic framework
for adding events/timers. This patch was previously
reviewed here -
https://patchwork.freedesktop.org/series/119504/

The pmu base implementation is still from the
i915 driver.

v2: Review comments(Rodrigo) and do not init pmu for VFs
as they don't have access to freq and c6 residency anyways.

v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
move drm uapi definitions (Lucas)

v4: Adapt Lucas's recent PMU fixes for i915
v5: Fix some kernel doc issues

Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   6 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 579 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  70 ++++
 7 files changed, 692 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..c231ecaf86b8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -299,6 +299,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 		i915-display/intel_pipe_crc.o
 endif
 
+xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae..89463cf7cc2c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -759,6 +759,9 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
+	if (!IS_SRIOV_VF(xe))
+		xe_pmu_register(&xe->pmu);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
@@ -803,6 +806,9 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_heci_gsc_fini(xe);
 
+	if (!IS_SRIOV_VF(xe))
+		xe_pmu_unregister(&xe->pmu);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bccca63c8a48..0cb8d650135a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,6 +18,7 @@
 #include "xe_memirq_types.h"
 #include "xe_oa.h"
 #include "xe_platform_types.h"
+#include "xe_pmu.h"
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
@@ -509,6 +510,9 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @pmu: performance monitoring unit */
+	struct xe_pmu pmu;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 77ce9f9ca7a5..1bf2bf8447c0 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -14,6 +14,7 @@
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
+#include "xe_pmu.h"
 #include "xe_observation.h"
 #include "xe_sched_job.h"
 
@@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
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
index 000000000000..2bd98c91ab0f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
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
+#include "xe_mmio.h"
+#include "xe_macros.h"
+#include "xe_pm.h"
+
+/*
+ * CPU mask is defined/initialized at a module level. All devices
+ * inside this module share this mask.
+ */
+static cpumask_t xe_pmu_cpumask;
+static unsigned int xe_pmu_target_cpu = -1;
+
+/**
+ * DOC: Xe PMU (Performance Monitoring Unit)
+ *
+ * Expose events/counters like C6 residency and GT frequency to user land.
+ * Perf tool can be used to list these counters from the command line.
+ *
+ * Example commands to list/record supported perf events-
+ *
+ * $ ls -ld /sys/bus/event_source/devices/xe_*
+ * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
+ *
+ * You can also use the perf tool to grep for a certain event-
+ * $ perf list | grep rc6
+ *
+ * To list a specific event at regular intervals-
+ * $ perf stat -e <event_name> -I <interval>
+ *
+ */
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
+static int
+config_status(struct xe_device *xe, u64 config)
+{
+	unsigned int gt_id = config_gt_id(config);
+
+	if (gt_id >= XE_MAX_GT_PER_TILE)
+		return -ENOENT;
+
+	switch (config_counter(config)) {
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
+	const u64 config = event->attr.config;
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	u64 val = 0;
+
+	switch (config_counter(config)) {
+	default:
+		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
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
+	if (!pmu->registered) {
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
+	if (!pmu->registered)
+		return;
+
+	xe_pmu_enable(event);
+	event->hw.state = 0;
+}
+
+static void xe_pmu_event_stop(struct perf_event *event, int flags)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->registered)
+		goto out;
+
+	if (flags & PERF_EF_UPDATE)
+		xe_pmu_event_read(event);
+
+out:
+	event->hw.state = PERF_HES_STOPPED;
+}
+
+static int xe_pmu_event_add(struct perf_event *event, int flags)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
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
+static int xe_pmu_event_event_idx(struct perf_event *event)
+{
+	return 0;
+}
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
+	} events[] = {
+	};
+
+	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
+	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
+	struct attribute **attr = NULL, **attr_iter;
+	unsigned int count = 0;
+	unsigned int i, j;
+	struct xe_gt *gt;
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
+			str = kasprintf(GFP_KERNEL, "%s-gt%u",
+					events[i].name, j);
+			if (!str)
+				goto err;
+
+			*attr_iter++ = &xe_iter->attr.attr;
+			xe_iter = add_xe_attr(xe_iter, str, config);
+
+			if (events[i].unit) {
+				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
+						events[i].name, j);
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
+	/*
+	 * Unregistering an instance generates a CPU offline event which we must
+	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
+	 */
+	if (!pmu->registered)
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
+static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
+
+/**
+ * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
+ *
+ * Returns: 0 if successful, else error code
+ */
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
+		cpuhp_state = ret;
+
+	return 0;
+}
+
+/**
+ * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
+ */
+void xe_pmu_exit(void)
+{
+	if (cpuhp_state != CPUHP_INVALID)
+		cpuhp_remove_multi_state(cpuhp_state);
+}
+
+static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
+{
+	if (cpuhp_state == CPUHP_INVALID)
+		return -EINVAL;
+
+	return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
+}
+
+static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
+{
+	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
+}
+
+/**
+ * xe_pmu_unregister() - Remove/cleanup PMU registration
+ * @arg: Ptr to pmu
+ */
+void xe_pmu_unregister(void *arg)
+{
+	struct xe_pmu *pmu = arg;
+
+	if (!pmu->registered)
+		return;
+
+	pmu->registered = false;
+
+	xe_pmu_unregister_cpuhp_state(pmu);
+
+	perf_pmu_unregister(&pmu->base);
+	kfree(pmu->base.attr_groups);
+	kfree(pmu->name);
+	free_event_attributes(pmu);
+}
+
+/**
+ * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
+ * @pmu: the PMU object
+ *
+ */
+void xe_pmu_register(struct xe_pmu *pmu)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	const struct attribute_group *attr_groups[] = {
+		&pmu->events_attr_group,
+		&xe_pmu_cpumask_attr_group,
+		NULL
+	};
+
+	int ret = -ENOMEM;
+
+	spin_lock_init(&pmu->lock);
+	pmu->cpuhp.cpu = -1;
+
+	pmu->name = kasprintf(GFP_KERNEL,
+			      "xe_%s",
+			      dev_name(xe->drm.dev));
+	if (pmu->name) {
+		/* tools/perf reserves colons as special. */
+		strreplace((char *)pmu->name, ':', '_');
+	}
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
+	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
+	if (ret)
+		goto err_cpuhp;
+
+	pmu->registered = true;
+
+	return;
+
+err_cpuhp:
+	xe_pmu_unregister_cpuhp_state(pmu);
+err_unreg:
+	perf_pmu_unregister(&pmu->base);
+err_groups:
+	kfree(pmu->base.attr_groups);
+err_attr:
+	free_event_attributes(pmu);
+err_name:
+	kfree(pmu->name);
+err:
+	drm_notice(&xe->drm, "Failed to register PMU!\n");
+}
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
new file mode 100644
index 000000000000..d07e5dfdfec0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
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
+int xe_pmu_init(void);
+void xe_pmu_exit(void);
+void xe_pmu_register(struct xe_pmu *pmu);
+void xe_pmu_unregister(void *arg);
+#else
+static inline int xe_pmu_init(void) { return 0; }
+static inline void xe_pmu_exit(void) {}
+static inline void xe_pmu_register(struct xe_pmu *pmu) {}
+static inline void xe_pmu_unregister(void *arg) {}
+#endif
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
new file mode 100644
index 000000000000..4da96b8fadd1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
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
+/*
+ * Top bits of every counter are GT id.
+ */
+#define __XE_PMU_GT_SHIFT (56)
+
+#define ___XE_PMU_OTHER(gt, x) \
+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
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
+	spinlock_t lock;
+	/**
+	 * @sample: Current and previous (raw) counters.
+	 *
+	 * These counters are updated when the device is awake.
+	 */
+	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
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
-- 
2.38.1

