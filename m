Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FC0CCFA07
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 23:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C39910E86E;
	Wed, 25 Sep 2024 23:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkeGEzPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1736910E86E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 23:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727306684; x=1758842684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1lK9zz+IftiVMJPED+qlJy3XoUhUKZtoU2q5kUk4n5U=;
 b=bkeGEzPTHVvm8m2vTw7+36NRTJ3WYGYyBrfgTRRzfoyoaOZpmu0H5AjZ
 wqJftNXFsG4RQUAddyW1YZpqlmdnJi8T5wUE9N1ja9giurDl99stmDocp
 KrR7KKbxrXt5AFZvQac4VOZpipaWoA2ewrBCr8mc5c+R1va/9oKLnV/vs
 +PHUtvs4NI751nZ5gORDO7hrgh8MOO7e/IHso7I/oivGvEnp0YSTp8WBP
 cC2HloG5pRjo/d765jy1zIs2biTewU7kDype/r63K9uZl5oXVXiDVmgrS
 8BBdJMnJ3xW0jWaqHqMXqvSbBkSFbJ1cEU/GFbQ1NEXdpxDzfDnAQ9fwM Q==;
X-CSE-ConnectionGUID: 7U+iQMuzSt6gLJfHEvIKbQ==
X-CSE-MsgGUID: dmGVLR38RuWXVBZcrPUpiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30176184"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="30176184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 16:24:44 -0700
X-CSE-ConnectionGUID: C3sIvomlSTSRb5YRqNjgEg==
X-CSE-MsgGUID: A/LNaaG+S521dACusNCp6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="76320921"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2024 16:24:44 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
Date: Wed, 25 Sep 2024 16:21:58 -0700
Message-Id: <20240925232159.2057581-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
References: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
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
ms(similar to sysfs entry - /sys/class/drm/card0/device/tile0/gt0/gtidle).

Following PMU events are being added-

>> perf list | grep rc6

  xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
  xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]

v2: Checkpatch fix, move timer code to next patch

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |   2 +
 drivers/gpu/drm/xe/xe_gt_idle.c   |  20 ++--
 drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
 drivers/gpu/drm/xe/xe_pmu.c       | 172 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h       |   2 +
 drivers/gpu/drm/xe/xe_pmu_types.h |  58 ++++++++++
 include/uapi/drm/xe_drm.h         |   4 +
 7 files changed, 253 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9b0218109647..7a190c49c573 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -872,6 +872,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_idle_disable_pg(gt);
 
+	xe_pmu_suspend(gt);
+
 	xe_gt_disable_host_l2_vram(gt);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 531924b6c0a1..e0a12ac7387c 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -277,18 +277,26 @@ static ssize_t idle_status_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(idle_status);
 
-static ssize_t idle_residency_ms_show(struct device *dev,
-				      struct device_attribute *attr, char *buff)
+u64 xe_gt_idle_residency(struct xe_gt *gt)
 {
-	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_gt_idle *gtidle = &gt->gtidle;
 	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
 	u64 residency;
 
-	xe_pm_runtime_get(pc_to_xe(pc));
+	xe_pm_runtime_get(xe);
 	residency = gtidle->idle_residency(pc);
-	xe_pm_runtime_put(pc_to_xe(pc));
+	xe_pm_runtime_put(xe);
+
+	return get_residency_ms(gtidle, residency);
+}
+
+static ssize_t idle_residency_ms_show(struct device *dev,
+				      struct device_attribute *attr, char *buff)
+{
+	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
 
-	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
+	return sysfs_emit(buff, "%llu\n", xe_gt_idle_residency(gtidle_to_gt(gtidle)));
 }
 static DEVICE_ATTR_RO(idle_residency_ms);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
index 4455a6501cb0..887791f653ac 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
 void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
 int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
+u64 xe_gt_idle_residency(struct xe_gt *gt);
 
 #endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index bdaea9ca1065..b1b38d245e00 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -11,10 +11,15 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_idle.h"
+#include "xe_guc_pc.h"
 #include "xe_mmio.h"
 #include "xe_macros.h"
+#include "xe_module.h"
 #include "xe_pm.h"
 
+#define FREQUENCY 200
+
 static cpumask_t xe_pmu_cpumask;
 static unsigned int xe_pmu_target_cpu = -1;
 
@@ -35,6 +40,11 @@ static unsigned int xe_pmu_target_cpu = -1;
  *
  */
 
+static struct xe_pmu *event_to_pmu(struct perf_event *event)
+{
+	return container_of(event->pmu, struct xe_pmu, base);
+}
+
 static unsigned int config_gt_id(const u64 config)
 {
 	return config >> __XE_PMU_GT_SHIFT;
@@ -45,6 +55,35 @@ static u64 config_counter(const u64 config)
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
@@ -64,6 +103,10 @@ config_status(struct xe_device *xe, u64 config)
 		return -ENOENT;
 
 	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		if (xe->info.skip_guc_pc)
+			return -ENODEV;
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -110,6 +153,63 @@ static int xe_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
+static inline s64 ktime_since_raw(const ktime_t kt)
+{
+	return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
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
+		val = xe_gt_idle_residency(gt);
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
@@ -120,6 +220,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	u64 val = 0;
 
 	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		val = get_rc6(gt);
+		break;
 	default:
 		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
 	}
@@ -151,6 +254,28 @@ static void xe_pmu_event_read(struct perf_event *event)
 
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
@@ -277,6 +402,7 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *name;
 		const char *unit;
 	} events[] = {
+		__event(0, "rc6-residency", "ms"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -465,6 +591,32 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
 	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
 }
 
+static void store_rc6_residency(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
+		     xe_gt_idle_residency(gt));
+	pmu->sleep_last[gt->info.id] = ktime_get_raw();
+}
+
+/**
+ * xe_pmu_suspend() - Save residency count before suspend
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
  */
@@ -492,6 +644,24 @@ void xe_pmu_unregister(void *arg)
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
+		u64 val = xe_gt_idle_residency(gt);
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
  *
@@ -525,6 +695,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
 	if (!pmu->events_attr_group.attrs)
 		goto err_name;
 
+	init_rc6(pmu);
+
 	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
 					GFP_KERNEL);
 	if (!pmu->base.attr_groups)
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
index af8108ebef87..733f2c33039c 100644
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
 static void xe_pmu_unregister(void *arg) {}
+void xe_pmu_suspend(struct xe_gt *gt) {}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index ca0e7cbe2081..1213d2a73492 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -11,11 +11,34 @@
 #include <uapi/drm/xe_drm.h>
 
 enum {
+	__XE_SAMPLE_RC6,
+	__XE_SAMPLE_RC6_LAST_REPORTED,
 	__XE_NUM_PMU_SAMPLERS
 };
 
 #define XE_PMU_MAX_GT 2
 
+/*
+ * Non-engine events that we need to track enabled-disabled transition and
+ * current state.
+ */
+enum xe_pmu_tracked_events {
+	__XE_PMU_RC6_RESIDENCY_ENABLED,
+	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
+};
+
+/*
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
@@ -58,6 +81,41 @@ struct xe_pmu {
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
+	 * @enable_count: Reference counts for the enabled events.
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
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2c5f258eee3a..3ef3926551dd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1396,6 +1396,10 @@ struct drm_xe_wait_user_fence {
 
 #define ___XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
+#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
+
+#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
+#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
 
 /**
  * enum drm_xe_observation_type - Observation stream types
-- 
2.38.1

