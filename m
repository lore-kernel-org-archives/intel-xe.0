Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE189D597A7
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8265210E65A;
	Tue, 12 Nov 2024 20:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfnkkMQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF5110E65F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731444905; x=1762980905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8b8ene5qtNE+1aWs5gBBgNis8rgy4mwSxl0PdY/8G38=;
 b=RfnkkMQ/hhqz3EMxdJW7q8M6AaTpHPyTEkEd0CNy9rmMDWOo1n2OqFJK
 FQtB16Yq0WmroZmjH+JDmSHQJujF61ESVNtzBgjy4wWeiXNCSK7P2kizu
 uk9mKoaZf11jNGKAYc7jz8Rkk8/Nlij0pBSWH2YY5eBxuJbIn0hk8sddX
 w9FEe+FHT3zfgKNrrFtSVv1ePeDexDBYDpeclKyVk+CaLJD0UaePR5tzd
 Luft9+oaJ6izeVHtx77Mgep68GiGiw+CgQKNCCqozNwLV2oqMPGVFXQza
 +IuKG8pYN6V6Zj/xGGRK648g/6UsNWIYpDUrrO58GWlhSvQsKewkwPIDl A==;
X-CSE-ConnectionGUID: jVZ16Yp9Tcmcqw9W9Qam9Q==
X-CSE-MsgGUID: 4HSxxCuQTZu01mvwmYGJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41866817"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41866817"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:55:05 -0800
X-CSE-ConnectionGUID: L4Pd+h/PQK+UpEKtmeDj7g==
X-CSE-MsgGUID: WLe+NUeyTsuP7Q9l8tD87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92423476"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa004.fm.intel.com with ESMTP; 12 Nov 2024 12:55:05 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
Date: Tue, 12 Nov 2024 12:51:41 -0800
Message-Id: <20241112205142.4026554-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20241112205142.4026554-1-vinay.belgaumkar@intel.com>
References: <20241112205142.4026554-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
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

Provide a PMU interface for GT C6 residency counters. The implementation
is ported over from the i915 PMU code. Residency is provided in units of
ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).

Sample usage and output-

$ perf list | grep c6

  xe_0000_00_02.0/c6-residency-gt0/                 [Kernel PMU event]
  xe_0000_00_02.0/c6-residency-gt1/                 [Kernel PMU event]

$ perf stat -e xe_0000_00_02.0/c6-residency-gt0/

  Performance counter stats for 'system wide':

              1907 ms   xe/c6-residency-gt0/
       1.907581788 seconds time elapsed

v2: Checkpatch fix, move timer code to next patch
v3: Fix kunit issue
v4: Fix for locking issue, fix review comments (Riana)
v5: Add xe_pmu_disable() function to reset enable_count
v6: Change rc6 to c6 (Riana)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |   2 +
 drivers/gpu/drm/xe/xe_gt_idle.c   |  17 ++-
 drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
 drivers/gpu/drm/xe/xe_pmu.c       | 221 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pmu.h       |   2 +
 drivers/gpu/drm/xe/xe_pmu_types.h |  63 +++++++++
 6 files changed, 300 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d6744be01a68..fd18bbce99da 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -877,6 +877,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_idle_disable_pg(gt);
 
+	xe_pmu_suspend(gt);
+
 	xe_gt_disable_host_l2_vram(gt);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index fd80afeef56a..47b5696c7137 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -275,18 +275,25 @@ static ssize_t idle_status_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(idle_status);
 
+u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle)
+{
+	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
+
+	return get_residency_ms(gtidle, gtidle->idle_residency(pc));
+}
+
 static ssize_t idle_residency_ms_show(struct device *dev,
 				      struct device_attribute *attr, char *buff)
 {
 	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
-	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
+	struct xe_gt *gt = gtidle_to_gt(gtidle);
 	u64 residency;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
-	residency = gtidle->idle_residency(pc);
-	xe_pm_runtime_put(pc_to_xe(pc));
+	xe_pm_runtime_get(gt_to_xe(gt));
+	residency = xe_gt_idle_residency(gtidle);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
-	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
+	return sysfs_emit(buff, "%llu\n", residency);
 }
 static DEVICE_ATTR_RO(idle_residency_ms);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 4455a6501cb0..795a02c9d89c 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
 void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
 int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
+u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle);
 
 #endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 2bd98c91ab0f..199344154408 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -11,8 +11,11 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_idle.h"
+#include "xe_guc_pc.h"
 #include "xe_mmio.h"
 #include "xe_macros.h"
+#include "xe_module.h"
 #include "xe_pm.h"
 
 /*
@@ -22,6 +25,8 @@
 static cpumask_t xe_pmu_cpumask;
 static unsigned int xe_pmu_target_cpu = -1;
 
+#define FREQUENCY 200
+
 /**
  * DOC: Xe PMU (Performance Monitoring Unit)
  *
@@ -31,7 +36,9 @@ static unsigned int xe_pmu_target_cpu = -1;
  * Example commands to list/record supported perf events-
  *
  * $ ls -ld /sys/bus/event_source/devices/xe_*
- * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
+ * $ lrwxrwxrwx 1 root root 0 Oct 25 00:19  /sys/bus/event_source/devices/xe_0000_03_00.0 ->
+ *                                                           ../../../devices/xe_0000_03_00.0
+ * $ ls /sys/bus/event_source/devices/xe_0000_03_00.0/events/
  *
  * You can also use the perf tool to grep for a certain event-
  * $ perf list | grep rc6
@@ -39,8 +46,30 @@ static unsigned int xe_pmu_target_cpu = -1;
  * To list a specific event at regular intervals-
  * $ perf stat -e <event_name> -I <interval>
  *
+ * For RC6, following command will give GT residency per second-
+ * $ perf stat -e xe_0000_03_00.0/c6-residency-gt0/ -I 1000
+ * #           time             counts unit events
+ *      1.001153792               1002 ms   xe_0000_03_00.0/c6-residency-gt0/
+ *      2.008338100               1007 ms   xe_0000_03_00.0/c6-residency-gt0/
+ *      3.009887054               1002 ms   xe_0000_03_00.0/c6-residency-gt0/
+ *      4.011383318               1001 ms   xe_0000_03_00.0/c6-residency-gt0/
+ *
+ * To verify this matches with sysfs values of c6, you can run following command-
+ * $ for i in {1..10} ; do cat /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
+ *   sleep 1; done
+ *      2348877
+ *      2349901
+ *      2350917
+ *      2352945
+ *
+ * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
  */
 
+static struct xe_pmu *event_to_pmu(struct perf_event *event)
+{
+	return container_of(event->pmu, struct xe_pmu, base);
+}
+
 static unsigned int config_gt_id(const u64 config)
 {
 	return config >> __XE_PMU_GT_SHIFT;
@@ -51,6 +80,35 @@ static u64 config_counter(const u64 config)
 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
 }
 
+static unsigned int other_bit(const u64 config)
+{
+	unsigned int val;
+
+	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
+		break;
+	default:
+		/*
+		 * Events that do not require sampling, or tracking state
+		 * transitions between enabled and disabled can be ignored.
+		 */
+		return -1;
+	}
+
+	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
+}
+
+static unsigned int config_bit(const u64 config)
+{
+	return other_bit(config);
+}
+
+static unsigned int event_bit(struct perf_event *event)
+{
+	return config_bit(event->attr.config);
+}
+
 static void xe_pmu_event_destroy(struct perf_event *event)
 {
 	struct xe_device *xe =
@@ -70,6 +128,10 @@ config_status(struct xe_device *xe, u64 config)
 		return -ENOENT;
 
 	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		if (xe->info.skip_guc_pc)
+			return -ENODEV;
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -116,6 +178,63 @@ static int xe_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static inline s64 ktime_since_raw(const ktime_t kt)
+{
+	return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
+}
+
+static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
+{
+	return pmu->event_sample[gt_id][sample].cur;
+}
+
+static void
+store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
+{
+	pmu->event_sample[gt_id][sample].cur = val;
+}
+
+static u64 get_rc6(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	const unsigned int gt_id = gt->info.id;
+	struct xe_pmu *pmu = &xe->pmu;
+	bool device_awake;
+	unsigned long flags;
+	u64 val;
+
+	device_awake = xe_pm_runtime_get_if_active(xe);
+	if (device_awake) {
+		val = xe_gt_idle_residency(&gt->gtidle);
+		xe_pm_runtime_put(xe);
+	}
+
+	spin_lock_irqsave(&pmu->lock, flags);
+
+	if (device_awake) {
+		store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
+	} else {
+		/*
+		 * We think we are runtime suspended.
+		 *
+		 * Report the delta from when the device was suspended to now,
+		 * on top of the last known real value, as the approximated RC6
+		 * counter value.
+		 */
+		val = ktime_since_raw(pmu->sleep_last[gt_id]);
+		val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
+	}
+
+	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
+		val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
+	else
+		store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
+
+	spin_unlock_irqrestore(&pmu->lock, flags);
+
+	return val;
+}
+
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_device *xe =
@@ -126,6 +245,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	u64 val = 0;
 
 	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		val = get_rc6(gt);
+		break;
 	default:
 		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
 	}
@@ -157,6 +279,28 @@ static void xe_pmu_event_read(struct perf_event *event)
 
 static void xe_pmu_enable(struct perf_event *event)
 {
+	struct xe_pmu *pmu = event_to_pmu(event);
+	const unsigned int bit = event_bit(event);
+	unsigned long flags;
+
+	if (bit == -1)
+		goto update;
+
+	spin_lock_irqsave(&pmu->lock, flags);
+
+	/*
+	 * Update the bitmask of enabled events and increment
+	 * the event reference counter.
+	 */
+	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
+	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
+	XE_WARN_ON(pmu->enable_count[bit] == ~0);
+
+	pmu->enable |= BIT(bit);
+	pmu->enable_count[bit]++;
+
+	spin_unlock_irqrestore(&pmu->lock, flags);
+update:
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -165,6 +309,31 @@ static void xe_pmu_enable(struct perf_event *event)
 	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
 }
 
+static void xe_pmu_disable(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
+	const unsigned int bit = event_bit(event);
+	unsigned long flags;
+
+	if (bit == -1)
+		return;
+
+	spin_lock_irqsave(&pmu->lock, flags);
+
+	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
+	XE_WARN_ON(pmu->enable_count[bit] == 0);
+	/*
+	 * Decrement the reference count and clear the enabled
+	 * bitmask when the last listener on an event goes away.
+	 */
+	if (--pmu->enable_count[bit] == 0)
+		pmu->enable &= ~BIT(bit);
+
+	spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 static void xe_pmu_event_start(struct perf_event *event, int flags)
 {
 	struct xe_device *xe =
@@ -190,6 +359,8 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
 	if (flags & PERF_EF_UPDATE)
 		xe_pmu_event_read(event);
 
+	xe_pmu_disable(event);
+
 out:
 	event->hw.state = PERF_HES_STOPPED;
 }
@@ -291,6 +462,7 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *name;
 		const char *unit;
 	} events[] = {
+		__event(0, "c6-residency", "ms"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -477,6 +649,33 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
 	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
 }
 
+static void store_rc6_residency(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
+		     xe_gt_idle_residency(&gt->gtidle));
+	pmu->sleep_last[gt->info.id] = ktime_get_raw();
+}
+
+/**
+ * xe_pmu_suspend() - Save residency count before suspend
+ * @gt: GT object
+ */
+void xe_pmu_suspend(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->base.event_init)
+		return;
+
+	spin_lock_irq(&pmu->lock);
+	store_rc6_residency(gt);
+	spin_unlock_irq(&pmu->lock);
+}
+
 /**
  * xe_pmu_unregister() - Remove/cleanup PMU registration
  * @arg: Ptr to pmu
@@ -498,6 +697,24 @@ void xe_pmu_unregister(void *arg)
 	free_event_attributes(pmu);
 }
 
+static void init_rc6(struct xe_pmu *pmu)
+{
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt;
+	unsigned int j;
+
+	for_each_gt(gt, xe, j) {
+		xe_pm_runtime_get(xe);
+		u64 val = xe_gt_idle_residency(&gt->gtidle);
+
+		store_sample(pmu, j, __XE_SAMPLE_RC6, val);
+		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
+			     val);
+		pmu->sleep_last[j] = ktime_get_raw();
+		xe_pm_runtime_put(xe);
+	}
+}
+
 /**
  * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
  * @pmu: the PMU object
@@ -533,6 +750,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
 	if (!pmu->events_attr_group.attrs)
 		goto err_name;
 
+	init_rc6(pmu);
+
 	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
 					GFP_KERNEL);
 	if (!pmu->base.attr_groups)
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
index d07e5dfdfec0..17f5a8d7d45c 100644
--- a/drivers/gpu/drm/xe/xe_pmu.h
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -15,11 +15,13 @@ int xe_pmu_init(void);
 void xe_pmu_exit(void);
 void xe_pmu_register(struct xe_pmu *pmu);
 void xe_pmu_unregister(void *arg);
+void xe_pmu_suspend(struct xe_gt *gt);
 #else
 static inline int xe_pmu_init(void) { return 0; }
 static inline void xe_pmu_exit(void) {}
 static inline void xe_pmu_register(struct xe_pmu *pmu) {}
 static inline void xe_pmu_unregister(void *arg) {}
+static inline void xe_pmu_suspend(struct xe_gt *gt) {}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 4da96b8fadd1..59d7718c59ce 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -10,6 +10,8 @@
 #include <linux/spinlock_types.h>
 
 enum {
+	__XE_SAMPLE_RC6,
+	__XE_SAMPLE_RC6_LAST_REPORTED,
 	__XE_NUM_PMU_SAMPLERS
 };
 
@@ -23,6 +25,32 @@ enum {
 #define ___XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
 
+#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
+
+#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
+#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
+
+/**
+ * Non-engine events that we need to track enabled-disabled transition and
+ * current state.
+ */
+enum xe_pmu_tracked_events {
+	__XE_PMU_RC6_RESIDENCY_ENABLED,
+	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
+};
+
+/**
+ * How many different events we track in the global PMU mask.
+ *
+ * It is also used to know to needed number of event reference counters.
+ */
+#define XE_PMU_MASK_BITS \
+	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
+
+struct xe_pmu_sample {
+	u64 cur;
+};
+
 struct xe_pmu {
 	/**
 	 * @cpuhp: Struct used for CPU hotplug handling.
@@ -65,6 +93,41 @@ struct xe_pmu {
 	 * @pmu_attr: Memory block holding device attributes.
 	 */
 	void *pmu_attr;
+
+	/**
+	 * @enable: Bitmask of specific enabled events.
+	 *
+	 * For some events we need to track their state and do some internal
+	 * house keeping.
+	 *
+	 * Each engine event sampler type and event listed in enum
+	 * i915_pmu_tracked_events gets a bit in this field.
+	 *
+	 * Low bits are engine samplers and other events continue from there.
+	 */
+	u32 enable;
+
+	/**
+	 * @enable_count: Reference counter for enabled events.
+	 *
+	 * Array indices are mapped in the same way as bits in the @enable field
+	 * and they are used to control sampling on/off when multiple clients
+	 * are using the PMU API.
+	 */
+	unsigned int enable_count[XE_PMU_MASK_BITS];
+	/**
+	 * @sample: Current and previous (raw) counters for sampling events.
+	 *
+	 * These counters are updated from the i915 PMU sampling timer.
+	 *
+	 * Only global counters are held here, while the per-engine ones are in
+	 * struct intel_engine_cs.
+	 */
+	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
+	/**
+	 * @sleep_last: Last time GT parked for RC6 estimation.
+	 */
+	ktime_t sleep_last[XE_PMU_MAX_GT];
 };
 
 #endif
-- 
2.38.1

