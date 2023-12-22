Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1282C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 07:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A055910E75E;
	Fri, 22 Dec 2023 07:38:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349CA10E75B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703230731; x=1734766731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8uVd5h5wIjrh2BxwX6/D7t7ELG5DD9FJxuK0t14DU5A=;
 b=YTjzoEJdersE2QS3AlCFrMsybIqDWYiZFcWUwzQ6kTxr9IprP9C5ZS0v
 da6QEvVHM2fHTHjaQlbZvy3/uKG40qQYJGXjRHpa2cQh8ZnKKmaCk29qx
 jf5HmD+Yhr0jZ5aKunigZR8KD5A7Y3A3Aw4WbFXDSjzpZKG8+i4cE9D7z
 MLc5O/uTkq8Sm/ltehEmyI/oEZP5Bt85rzLfWo9hNyWeT4DQ1yc2Hkza0
 1Iax/4rsXJDemwK7NyEARxBhxc89RYUY0xNVyJbm6uylgBH7yL65mUPu9
 vqsZ5jCdPciAkzqPXgrG2/Cdi+mxzpWpF1P6aZbN9BHPItnMXICdYuuB3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9481045"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9481045"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920582598"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="920582598"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 23:38:48 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 4/8] drm/xe/pmu: Enable PMU interface and add engine
 busyness counter
Date: Fri, 22 Dec 2023 13:15:58 +0530
Message-Id: <20231222074602.817518-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231222074602.817518-1-riana.tauro@intel.com>
References: <20231222074602.817518-1-riana.tauro@intel.com>
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

This patch adds the PMU base implementation along with engine busyness
counters.

GuC provides engine busyness ticks as a 64 bit counter which count
as clock ticks. These counters are maintained in a
shared memory buffer and internally updated on a continuous basis.

This is listed by perf tool as

  sudo ./perf list
     xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/rcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vcs0-busy-ticks-gt0/               [Kernel PMU event]
     xe_0000_03_00.0/vecs0-busy-ticks-gt0/              [Kernel PMU event]

and read as

  sudo ./perf stat -e xe_0000_03_00.0/bcs0-busy-ticks-gt0/  -I 1000
           time       counts unit       events
       1.000674178     2052       xe_0000_03_00.0/bcs0-busy-ticks-gt0/
       2.006626312     2033       xe_0000_03_00.0/bcs0-busy-ticks-gt0/
       3.009499300    40067       xe_0000_03_00.0/bcs0-busy-ticks-gt0/
       4.010521486     8491       xe_0000_03_00.0/bcs0-busy-ticks-gt0/

The pmu base implementation is taken from i915.

v2: rebase

v3: add engine busyness

v4: change internal uapi helpers (Umesh)

Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Co-developed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 543 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  23 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  49 +++
 7 files changed, 628 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 26988c1c732a..4cd8bae783ab 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -296,6 +296,8 @@ endif
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
+xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
+
 # header test
 hdrtest_find_args := -not -path xe_rtp_helpers.h
 ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86867d42d532..a7388aeffc28 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -538,6 +538,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
+	xe_pmu_register(&xe->pmu);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71f23ac365e6..c738c03ded88 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -19,6 +19,7 @@
 #include "xe_memirq_types.h"
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
+#include "xe_pmu.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 
@@ -479,6 +480,9 @@ struct xe_device {
 	/* To shut up runtime pm macros.. */
 	struct xe_runtime_pm {} runtime_pm;
 
+	/** @pmu: performance monitoring unit */
+	struct xe_pmu pmu;
+
 	/* For pcode */
 	struct mutex sb_lock;
 
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..51bf69b7ab22 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
+#include "xe_pmu.h"
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
@@ -62,6 +63,10 @@ static const struct init_funcs init_funcs[] = {
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
index 000000000000..371ca6d7e215
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+
+#define XE_ENGINE_SAMPLE_COUNT (DRM_XE_PMU_SAMPLE_BUSY_TICKS + 1)
+
+static cpumask_t xe_pmu_cpumask;
+static unsigned int xe_pmu_target_cpu = -1;
+
+static unsigned int config_gt_id(const u64 config)
+{
+	return config >> __DRM_XE_PMU_GT_SHIFT;
+}
+
+static u64 config_counter(const u64 config)
+{
+	return config & ~(~0ULL << __DRM_XE_PMU_GT_SHIFT);
+}
+
+static u8 engine_event_sample(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return config_counter(config) & 0xf;
+}
+
+static u8 engine_event_class(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return (config_counter(config) >> __DRM_XE_PMU_CLASS_SHIFT) & 0xff;
+}
+
+static u8 engine_event_instance(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	return (config_counter(config) >> __DRM_XE_PMU_SAMPLE_BITS) & 0xff;
+}
+
+static bool is_engine_event(struct perf_event *event)
+{
+	return config_counter(event->attr.config) < __DRM_XE_PMU_OTHER(0, 0);
+}
+
+static int engine_event_status(struct xe_hw_engine *hwe,
+			       enum drm_xe_pmu_engine_sample sample)
+{
+	if (!hwe)
+		return -ENODEV;
+
+	/* Other engine events will be added, XE_ENGINE_SAMPLE_COUNT will be changed */
+	return (sample >= DRM_XE_PMU_SAMPLE_BUSY_TICKS && sample < XE_ENGINE_SAMPLE_COUNT)
+		? 0 : -ENOENT;
+}
+
+static int engine_event_init(struct perf_event *event)
+{
+	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	const u64 config = event->attr.config;
+	const unsigned int gt_id = config_gt_id(config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	struct xe_hw_engine *hwe;
+
+	hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(engine_event_class(event)),
+			      engine_event_instance(event), true);
+
+	return engine_event_status(hwe, engine_event_sample(event));
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
+	if (is_engine_event(event)) {
+		ret = engine_event_init(event);
+		if (ret)
+			return ret;
+	}
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
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	u64 val;
+
+	if (is_engine_event(event)) {
+		u8 sample = engine_event_sample(event);
+		struct xe_hw_engine *hwe;
+
+		hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(engine_event_class(event)),
+				      engine_event_instance(event), true);
+		if (!hwe)
+			drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
+		else if (sample == DRM_XE_PMU_SAMPLE_BUSY_TICKS)
+			val = xe_gt_engine_busy_ticks(gt, hwe);
+		else
+			drm_warn(&xe->drm, "unknown pmu engine event\n");
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
+#define __engine_event(__sample, __name) \
+{ \
+	.sample = (__sample), \
+	.name = (__name), \
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
+static struct attribute **
+create_event_attributes(struct xe_pmu *pmu)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
+	struct attribute **attr = NULL, **attr_iter;
+	unsigned int count = 0;
+	enum xe_hw_engine_id id;
+	unsigned int i, j;
+	struct xe_hw_engine *hwe;
+	struct xe_gt *gt;
+
+	static const struct {
+		enum drm_xe_pmu_engine_sample sample;
+		char *name;
+	} engine_events[] = {
+		__engine_event(DRM_XE_PMU_SAMPLE_BUSY_TICKS, "busy-ticks"),
+	};
+
+	for_each_gt(gt, xe, j) {
+		for_each_hw_engine(hwe, gt, id) {
+			for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
+				if (!engine_event_status(hwe, engine_events[i].sample))
+					count++;
+			}
+		}
+	}
+
+	/* Allocate attribute objects and table. */
+	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
+	if (!xe_attr)
+		goto err_alloc;
+
+	/* Max one pointer of each attribute type plus a termination entry. */
+	attr = kcalloc(count + 1, sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		goto err_alloc;
+
+	xe_iter = xe_attr;
+	attr_iter = attr;
+
+	/* Initialize supported engine counters */
+	for_each_gt(gt, xe, j) {
+		for_each_hw_engine(hwe, gt, id) {
+			for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
+				char *str;
+
+				if (engine_event_status(hwe, engine_events[i].sample))
+					continue;
+
+				str = kasprintf(GFP_KERNEL, "%s-%s-gt%u",
+						hwe->name, engine_events[i].name, j);
+
+				if (!str)
+					goto err;
+
+				*attr_iter++ = &xe_iter->attr.attr;
+				xe_iter = add_xe_attr(xe_iter, str,
+						      __DRM_XE_PMU_GT_EVENT(j, __DRM_XE_PMU_ENGINE(xe_hw_engine_to_user_class(hwe->class),
+												   hwe->logical_instance,
+												   engine_events[i].sample)));
+			}
+		}
+	}
+
+	pmu->xe_attr = xe_attr;
+	return attr;
+
+err:
+	for (attr_iter = attr; *attr_iter; attr_iter++)
+		kfree((*attr_iter)->name);
+
+err_alloc:
+	kfree(attr);
+	kfree(xe_attr);
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
+
+	pmu->events_attr_group.attrs = NULL;
+	pmu->xe_attr = NULL;
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
+	if (ret)
+		goto err_cpuhp;
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
+	pmu->base.event_init = NULL;
+	free_event_attributes(pmu);
+err_name:
+	kfree(pmu->name);
+err:
+	drm_notice(&xe->drm, "Failed to register PMU!\n");
+}
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
new file mode 100644
index 000000000000..d6fca18466f4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PMU_H_
+#define _XE_PMU_H_
+
+#include "xe_gt_types.h"
+#include "xe_pmu_types.h"
+
+#if IS_ENABLED(CONFIG_PERF_EVENTS)
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
index 000000000000..d38b24d27cfd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_PMU_TYPES_H_
+#define _XE_PMU_TYPES_H_
+
+#include <linux/perf_event.h>
+#include <linux/spinlock_types.h>
+#include <uapi/drm/xe_drm.h>
+
+#define XE_PMU_MAX_GT 2
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
+	 * @lock: Lock protecting enable mask and ref count handling.
+	 */
+	spinlock_t lock;
+	/**
+	 * @events_attr_group: Device events attribute group.
+	 */
+	struct attribute_group events_attr_group;
+	/**
+	 * @xe_attr: Memory block holding device attributes.
+	 */
+	void *xe_attr;
+};
+
+#endif
-- 
2.40.0

