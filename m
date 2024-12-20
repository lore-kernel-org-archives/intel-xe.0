Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C22E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B67F10F05A;
	Fri, 20 Dec 2024 21:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbkIC5o/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090C110F05A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734728569; x=1766264569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kLNlBd14vuFUTy9jmwlgSnfAKyBh+3RizJ9SJG0BfzE=;
 b=ZbkIC5o/ofksJZfOOYRt475608sQrSsB/uKYeu113w0EAExK3reEgPOt
 YKCxzBjaewManNlQjIWs/Hh74OtyKidIQNNMIbhyPNM+JthVaHxULzZTA
 lZ9LoLpUc/0/PXmVkD2UCyY95oxiWSGUImQ9WGHS58k8YEVA/RJKDI0my
 Z9t7RKofI1gXmr7VPagnIWnF3gbqhAfbKWZRzxWDq0TJvgxec/tLNjYe9
 ClddDvFb3XZsy7rygL6IvG3r1Q/z5FzMxjT7muVmMsMJxWINFxu3aDZ/j
 GHGZUiz09QTNTQ4IpxYFbcDQov5Z/AVNNj1l4MQdOAcsaf0RPU/VIWd2S A==;
X-CSE-ConnectionGUID: OhYCfmbRRB2fyJrtE6SNXg==
X-CSE-MsgGUID: jdBG/R1HT7eFLbocrwkFQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35314439"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35314439"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:02:49 -0800
X-CSE-ConnectionGUID: 2mWZT2LCRAOAlWJ+KuM9aw==
X-CSE-MsgGUID: mOJE1aTBTS+62jxrTQ25Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102727960"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2024 13:02:49 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v11 3/4] drm/xe/pmu: Add GT C6 events
Date: Fri, 20 Dec 2024 12:59:26 -0800
Message-Id: <20241220205927.441082-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20241220205927.441082-1-vinay.belgaumkar@intel.com>
References: <20241220205927.441082-1-vinay.belgaumkar@intel.com>
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

  xe_0000_00_02.0/c6-residency/                 [Kernel PMU event]

$ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
  event_id  gt_id
$ cat /sys/bus/event_source/devices/xe_0000_00_02.0/format/*
  config:0-20
  config:60-63

$ perf stat -e xe_0000_00_02.0/c6-residency,gt_id=0/ -I1000

$           time     counts unit events
     1.001183454       1001 ms   xe_0000_00_02.0/c6-residency,gt_id=0/
     2.004434757       1002 ms   xe_0000_00_02.0/c6-residency,gt_id=0/

v2: Checkpatch fix, move timer code to next patch
v3: Fix kunit issue
v4: Fix for locking issue, fix review comments (Riana)
v5: Add xe_pmu_disable() function to reset enable_count
v6: Change rc6 to c6 (Riana)
v7: Fix another comment format
v8: Replace RC6 with C6 (Riana)
v9: Define sampling freq in next patch
v10: Use raw_spin_lock* instead of spin_lock* (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v5
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |   3 +
 drivers/gpu/drm/xe/xe_pmu.c       | 214 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h       |   2 +
 drivers/gpu/drm/xe/xe_pmu_types.h |  49 +++++++
 4 files changed, 268 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 41ab7fbebc19..64e60bcf131a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -47,6 +47,7 @@
 #include "xe_mmio.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
+#include "xe_pmu.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
@@ -875,6 +876,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_idle_disable_pg(gt);
 
+	xe_pmu_suspend(gt);
+
 	xe_gt_disable_host_l2_vram(gt);
 
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 5601e7a2377e..c5a8031b6fd3 100644
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
 #include "xe_pmu.h"
 
@@ -46,8 +49,29 @@ static unsigned int xe_pmu_target_cpu = -1;
  * To list a specific event for a GT at regular intervals-
  * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
  *
+ * For C6, following command will give GT residency per second-
+ * $ perf stat -e xe_0000_00_02.0/c6-residency,gt_id=0/ -I 1000
+ *            time             counts unit events
+ *     1.001183454               1001 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
+ *     2.004434757               1002 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
+ *     3.005854217               1000 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
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
@@ -58,6 +82,35 @@ static u64 config_counter(const u64 config)
 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
 }
 
+static unsigned int pm_bit(const u64 config)
+{
+	unsigned int val;
+
+	switch (config_counter(config)) {
+	case XE_PMU_C6_RESIDENCY:
+		val = __XE_PMU_C6_RESIDENCY_ENABLED;
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
+	return pm_bit(config);
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
@@ -77,6 +130,10 @@ config_status(struct xe_device *xe, u64 config)
 		return -ENOENT;
 
 	switch (config_counter(config)) {
+	case XE_PMU_C6_RESIDENCY:
+		if (xe->info.skip_guc_pc)
+			return -ENODEV;
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -125,6 +182,63 @@ static int xe_pmu_event_init(struct perf_event *event)
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
+static u64 get_c6(struct xe_gt *gt)
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
+		val = xe_gt_idle_residency_msec(&gt->gtidle);
+		xe_pm_runtime_put(xe);
+	}
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+
+	if (device_awake) {
+		store_sample(pmu, gt_id, __XE_SAMPLE_C6, val);
+	} else {
+		/*
+		 * We think we are runtime suspended.
+		 *
+		 * Report the delta from when the device was suspended to now,
+		 * on top of the last known real value, as the approximated C6
+		 * counter value.
+		 */
+		val = ktime_since_raw(pmu->sleep_last[gt_id]);
+		val += read_sample(pmu, gt_id, __XE_SAMPLE_C6);
+	}
+
+	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED))
+		val = read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED);
+	else
+		store_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED, val);
+
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+
+	return val;
+}
+
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_device *xe =
@@ -135,6 +249,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	u64 val = 0;
 
 	switch (config_counter(config)) {
+	case XE_PMU_C6_RESIDENCY:
+		val = get_c6(gt);
+		break;
 	default:
 		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
 	}
@@ -165,6 +282,28 @@ static void xe_pmu_event_read(struct perf_event *event)
 
 static void xe_pmu_enable(struct perf_event *event)
 {
+	struct xe_pmu *pmu = event_to_pmu(event);
+	const unsigned int bit = event_bit(event);
+	unsigned long flags;
+
+	if (bit == -1)
+		goto update;
+
+	raw_spin_lock_irqsave(&pmu->lock, flags);
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
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+update:
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -173,6 +312,31 @@ static void xe_pmu_enable(struct perf_event *event)
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
+	raw_spin_lock_irqsave(&pmu->lock, flags);
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
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+}
+
 static void xe_pmu_event_start(struct perf_event *event, int flags)
 {
 	struct xe_device *xe =
@@ -198,6 +362,8 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
 	if (flags & PERF_EF_UPDATE)
 		xe_pmu_event_read(event);
 
+	xe_pmu_disable(event);
+
 out:
 	event->hw.state = PERF_HES_STOPPED;
 }
@@ -330,6 +496,7 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *name;
 		const char *unit;
 	} events[] = {
+		__event(0, "c6-residency", "ms"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -511,6 +678,33 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
 	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
 }
 
+static void store_rc6_residency(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	store_sample(pmu, gt->info.id, __XE_SAMPLE_C6,
+		     xe_gt_idle_residency_msec(&gt->gtidle));
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
+	raw_spin_lock_irq(&pmu->lock);
+	store_rc6_residency(gt);
+	raw_spin_unlock_irq(&pmu->lock);
+}
+
 /**
  * xe_pmu_unregister() - Remove/cleanup PMU registration
  * @arg: Ptr to pmu
@@ -536,6 +730,24 @@ void xe_pmu_unregister(void *arg)
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
+		u64 val = xe_gt_idle_residency_msec(&gt->gtidle);
+
+		store_sample(pmu, j, __XE_SAMPLE_C6, val);
+		store_sample(pmu, j, __XE_SAMPLE_C6_LAST_REPORTED,
+			     val);
+		pmu->sleep_last[j] = ktime_get_raw();
+		xe_pm_runtime_put(xe);
+	}
+}
+
 /**
  * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
  * @pmu: the PMU object
@@ -575,6 +787,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
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
index 2b3f8982023f..f47a6e1b109c 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -10,6 +10,8 @@
 #include <linux/spinlock_types.h>
 
 enum {
+	__XE_SAMPLE_C6,
+	__XE_SAMPLE_C6_LAST_REPORTED,
 	__XE_NUM_PMU_SAMPLERS
 };
 
@@ -25,6 +27,26 @@ enum {
 
 #define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
 
+#define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
+#define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
+
+/*
+ * Non-engine events that we need to track enabled-disabled transition and
+ * current state.
+ */
+enum xe_pmu_tracked_events {
+	__XE_PMU_C6_RESIDENCY_ENABLED,
+	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
+};
+
+/* Global PMU mask to track enabled events */
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
@@ -67,6 +89,33 @@ struct xe_pmu {
 	 * @pmu_attr: Memory block holding device attributes.
 	 */
 	void *pmu_attr;
+
+	/**
+	 * @enable: Bitmask of specific enabled events.
+	 *
+	 * For some events we need to track their state and do some internal
+	 * house keeping.
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
+	 * These counters are updated from the PMU sampling timer.
+	 */
+	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
+	/**
+	 * @sleep_last: Last time GT parked for C6 estimation.
+	 */
+	ktime_t sleep_last[XE_PMU_MAX_GT];
 };
 
 #endif
-- 
2.38.1

