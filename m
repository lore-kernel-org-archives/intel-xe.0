Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32821C5472F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE8D10E3A4;
	Tue, 27 Aug 2024 16:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXyAhynP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9DF10E3A2
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777000; x=1756313000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ZzGHPTUD6HWJnj7JjoIvC/+yy6S1HGxqGyFuQCVhw0=;
 b=CXyAhynPLb04PWnWf2Yy92FJD91Ty7zIqJuktT650tqXSfgl1T7YFzBo
 Lsy6Y1oJVPDK+jqtEqd5Z9zIPIUiLfgbtcVbQdBoQG6+HmdhN6N7J5sxm
 y8FPxnV3ZdoeyH5sAtkrL7JH2FFuB1nA5jZ3QTLX85rnA4NJB/BJqmsqy
 9owYqDKS6JKVkKgB0HrlpBwIvytFh8cvfIoMnrS8agp9AyxUXMiFw3Y0/
 WGh83LIzFsEAEYFB2+RB/hrvx4x1Euzp9sJ6VKNmJ5etmo1nRNInrtzR6
 TBMsI3Nvb3z6RarAYKXuSLDY9FGfBd+JTEfR830X9CeYHKymz38xW232P A==;
X-CSE-ConnectionGUID: YxKgVCIZTJ6VWFI9HkFr0Q==
X-CSE-MsgGUID: BsMaD9RbStCXAOHJA3dYZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23143743"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23143743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:43:20 -0700
X-CSE-ConnectionGUID: jv1QKC7TQ3m9AmX9Sp5JnQ==
X-CSE-MsgGUID: QolPPaL+RtqUX5TlzzDX0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63424269"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 09:43:20 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/4] drm/xe/pmu: Add GT C6 events
Date: Tue, 27 Aug 2024 09:41:06 -0700
Message-Id: <20240827164107.47034-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
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

This provides pmu interface for GT C6 residency. The implementation has
been ported over from the i915 PMU code. Here, we provide residency
period in ms(same as the sysfs). If the GT is suspended, it provides
the sum of the last saved value and the approximate time suspend occurred.

These are the perf events being added-

  xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
  xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c   |  20 +++--
 drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
 drivers/gpu/drm/xe/xe_pmu.c       | 136 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu_types.h |  24 ++++++
 include/uapi/drm/xe_drm.h         |   4 +
 5 files changed, 179 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..a8273b8b047c 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -175,18 +175,26 @@ static ssize_t idle_status_show(struct device *dev,
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
index 554447b5d46d..1c62c0b87db6 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.h
+++ b/drivers/gpu/drm/xe/xe_gt_idle.h
@@ -15,5 +15,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
 void xe_gt_idle_disable_c6(struct xe_gt *gt);
 void xe_gt_idle_enable_pg(struct xe_gt *gt);
 void xe_gt_idle_disable_pg(struct xe_gt *gt);
+u64 xe_gt_idle_residency(struct xe_gt *gt);
 
 #endif /* _XE_GT_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 7140bf795cae..5b9c7966ec75 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -11,6 +11,8 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_idle.h"
+#include "xe_guc_pc.h"
 #include "xe_mmio.h"
 #include "xe_macros.h"
 #include "xe_module.h"
@@ -39,6 +41,9 @@ static unsigned int other_bit(const u64 config)
 	unsigned int val;
 
 	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
+		break;
 	default:
 		/*
 		 * Events that do not require sampling, or tracking state
@@ -79,6 +84,10 @@ config_status(struct xe_device *xe, u64 config)
 		return -ENOENT;
 
 	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		if (xe->info.skip_guc_pc)
+			return -ENODEV;
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -125,6 +134,63 @@ static int xe_pmu_event_init(struct perf_event *event)
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
@@ -135,6 +201,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	u64 val = 0;
 
 	switch (config_counter(config)) {
+	case XE_PMU_RC6_RESIDENCY:
+		val = get_rc6(gt);
+		break;
 	default:
 		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
 	}
@@ -350,6 +419,7 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *name;
 		const char *unit;
 	} events[] = {
+		__event(0, "rc6-residency", "ms"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -530,12 +600,58 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
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
 void xe_pmu_suspend(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->base.event_init)
+		return;
+
+	spin_lock_irq(&pmu->lock);
+
+	store_rc6_residency(gt);
+
+	/*
+	 * Signal sampling timer to stop if only engine events are enabled and
+	 * GPU went idle.
+	 */
+	pmu->active_gts &= ~BIT(gt->info.id);
+	if (pmu->active_gts == 0)
+		pmu->timer_enabled = false;
+
+	spin_unlock_irq(&pmu->lock);
 }
 
 void xe_pmu_resume(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->base.event_init)
+		return;
+
+	spin_lock_irq(&pmu->lock);
+
+	/*
+	 * Re-enable sampling timer when GPU goes active.
+	 */
+	if (pmu->active_gts == 0)
+		__xe_pmu_maybe_start_timer(pmu);
+
+	pmu->active_gts |= BIT(gt->info.id);
+
+	spin_unlock_irq(&pmu->lock);
 }
 
 static void xe_pmu_unregister(void *arg)
@@ -563,6 +679,24 @@ static void xe_pmu_unregister(void *arg)
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
+				     val);
+		pmu->sleep_last[j] = ktime_get_raw();
+		xe_pm_runtime_put(xe);
+	}
+}
+
 void xe_pmu_register(struct xe_pmu *pmu)
 {
 	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
@@ -593,6 +727,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
 	if (!pmu->events_attr_group.attrs)
 		goto err_name;
 
+	init_rc6(pmu);
+
 	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
 					GFP_KERNEL);
 	if (!pmu->base.attr_groups)
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f718a5a2f44d..32835f6987d2 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -11,6 +11,8 @@
 #include <uapi/drm/xe_drm.h>
 
 enum {
+	__XE_SAMPLE_RC6,
+	__XE_SAMPLE_RC6_LAST_REPORTED,
 	__XE_NUM_PMU_SAMPLERS
 };
 
@@ -21,6 +23,7 @@ enum {
  * current state.
  */
 enum xe_pmu_tracked_events {
+	__XE_PMU_RC6_RESIDENCY_ENABLED,
 	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
 };
 
@@ -32,6 +35,10 @@ enum xe_pmu_tracked_events {
 #define XE_PMU_MASK_BITS \
 	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
 
+struct xe_pmu_sample {
+	u64 cur;
+};
+
 struct xe_pmu {
 	/**
 	 * @cpuhp: Struct used for CPU hotplug handling.
@@ -107,6 +114,23 @@ struct xe_pmu {
 	 * @timer_enabled: Should the internal sampling timer be running.
 	 */
 	bool timer_enabled;
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
+	/**
+	 * @active_gts: GT active mask.
+	 */
+	unsigned int active_gts;
 
 	struct hrtimer timer;
 };
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index de6f39db618c..5b85ee1cfc0b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1422,6 +1422,10 @@ struct drm_xe_wait_user_fence {
 
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

