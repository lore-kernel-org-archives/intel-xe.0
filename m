Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B743CE77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8416310E5A6;
	Mon,  6 Jan 2025 07:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKtARbpZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C834010E5A6
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736148983; x=1767684983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lfCktBh3OsgsPyb7vNDs09Vt0c9kc3/E//BsAw+5L3M=;
 b=dKtARbpZ1Ca1MIqtTX/gmPd6TBgbKeazGrpbdUJrmI9KG58lrDa3uanC
 nCRKS9DOdAl5bihSm/SqoAjmy5NFgXrSN5mWlySNHnBsdti7cKwcEGy4F
 R8OcHTd6ZvN+laUUwVg9y00Gq18npy3CJ3uuMf2X7auaMMiO5K99CiXCV
 d3ioM9Bh26nt9ZJuyUr0uvVqpEY+7DA1tF3Y4G2akhibqMmCwzBQrmoay
 oN38tA8AN/qgq2gB7BcO3kjYDhnSCLWOhznBnp6JbBSgEDOeBaxLhwp84
 V6nAIoKjC6o2AaRvADhD1jqdxwdAPIzYrcCOEn7A0XRCfJHp/EyLVvDVG Q==;
X-CSE-ConnectionGUID: wd7v9LxURG26/K4GTmCsFA==
X-CSE-MsgGUID: b9Zju9ntRKilXfvBAF2prw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46873009"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46873009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:22 -0800
X-CSE-ConnectionGUID: jXlmWVwjQGaWSRmmuDTmYA==
X-CSE-MsgGUID: axbfUxWRR4uXi9J6QrudkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="125650675"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:18 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 john.c.harrison@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 01/10] [DO NOT REVIEW] drm/xe/pmu: Enable PMU interface
Date: Mon,  6 Jan 2025 13:25:50 +0530
Message-ID: <20250106075600.852080-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106075600.852080-1-riana.tauro@intel.com>
References: <20250106075600.852080-1-riana.tauro@intel.com>
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

DO NOT REVIEW. Patch added for compilation

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
v6: Address comments from Lucas.
v7: Define events per device and use xe_gt_id to choose GT (Lucas)
v8: Use config field bits for gt_id as well. Use raw_spinlock_t
to avoid deadlocks with perf subsystem (Lucas)
v9: Fix checkpatch warning

Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h |   4 +
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 621 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
 drivers/gpu/drm/xe/xe_pmu_types.h    |  72 ++++
 7 files changed, 733 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5c97ad6ed738..9f3d24a5d611 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -301,6 +301,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 		i915-display/intel_pipe_crc.o
 endif
 
+xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bf36e4fb4679..ca557c22c979 100644
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
@@ -760,6 +761,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_oa_register(xe);
 
+	xe_pmu_register(&xe->pmu);
+
 	xe_debugfs_register(xe);
 
 	xe_hwmon_register(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8a7b15972413..bd1e72d318f7 100644
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
@@ -525,6 +526,9 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @pmu: performance monitoring unit */
+	struct xe_pmu pmu;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 0f2c20e9204a..d3a9d4bc9bee 100644
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
index 000000000000..5601e7a2377e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -0,0 +1,621 @@
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
+#include "xe_pmu.h"
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
+ * Events will be per device, the GT can be selected with an extra config
+ * sub-field (bits 60-63).
+ *
+ * Perf tool can be used to list these counters from the command line.
+ *
+ * Example commands to list/record supported perf events-
+ *
+ * $ ls -ld /sys/bus/event_source/devices/xe_*
+ * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
+ * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
+ *
+ * The format directory has info regarding the configs that can be used.
+ *
+ * The standard perf tool can be used to grep for a certain event as well-
+ * $ perf list | grep c6
+ *
+ * To list a specific event for a GT at regular intervals-
+ * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
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
+	u64 event_config;
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
+	event_config = event->attr.config;
+	ret = config_status(xe, event_config);
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
+	const u64 config = event->attr.config;
+	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
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
+		.str = _config, } \
+	})[0].attr.attr)
+
+static struct attribute *xe_pmu_format_attrs[] = {
+	XE_PMU_FORMAT_ATTR(event_id, "config:0-20"),
+	XE_PMU_FORMAT_ATTR(gt_id, "config:60-63"),
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
+	unsigned int i;
+
+	/* Count how many counters we will be exposing. */
+	for (i = 0; i < ARRAY_SIZE(events); i++) {
+		u64 config = __XE_PMU_PM(events[i].counter);
+
+		if (!config_status(xe, config))
+			count++;
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
+	for (i = 0; i < ARRAY_SIZE(events); i++) {
+		u64 config = __XE_PMU_PM(events[i].counter);
+		char *str;
+
+		if (config_status(xe, config))
+			continue;
+
+		str = kasprintf(GFP_KERNEL, "%s",
+				events[i].name);
+		if (!str)
+			goto err;
+
+		*attr_iter++ = &xe_iter->attr.attr;
+		xe_iter = add_xe_attr(xe_iter, str, config);
+
+		if (events[i].unit) {
+			str = kasprintf(GFP_KERNEL, "%s.unit",
+					events[i].name);
+			if (!str)
+				goto err;
+
+			*attr_iter++ = &pmu_iter->attr.attr;
+			pmu_iter = add_pmu_attr(pmu_iter, str,
+						events[i].unit);
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
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+
+	if (IS_SRIOV_VF(xe))
+		return;
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
+		&xe_pmu_format_attr_group,
+		&pmu->events_attr_group,
+		&xe_pmu_cpumask_attr_group,
+		NULL
+	};
+
+	int ret = -ENOMEM;
+
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	raw_spin_lock_init(&pmu->lock);
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
index 000000000000..2b3f8982023f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -0,0 +1,72 @@
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
+#define __XE_PMU_GT_SHIFT (60)
+
+#define ___XE_PMU_PM(gt, x) \
+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
+
+#define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
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
+	raw_spinlock_t lock;
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
2.47.1

