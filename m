Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2E3E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 18:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC8610E90E;
	Wed,  8 Jan 2025 18:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccy/a46k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5619610EC49
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 18:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736359388; x=1767895388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rqW6owtPikSx7+gX9Kok7qVtf284cvSflrjqWc7amlI=;
 b=ccy/a46kPOJ6wuAAxbT57rwOfLiC5hh8u6uteO6srr8GTZG+H+RuJGH1
 dXxYWfhJ/4dZU4FEzvZTkul6Zk+ahP3y4p7E9gyQo6V0feNopM1/91cUf
 82QeJrUaiB/YqR+gcBCg3XLYMu1KQcrwXQmJat1XL//ZWR0e9ksVKPkcB
 1pmHwghOSAp+jxlnK7XM/XSJYw/Dof3V30lgaLvCaoWBiDQX5ADeBKNBg
 nfjyj8ntcMRvTD+XTG26tUT6VYxZaUSK2ficH0lpbHUdlwrG1Sm/9Jz3+
 /34cIpvHi9NWj68esRveL2FthgBY5Qe74/PNZoTKG15+vFodISVH+HnvA A==;
X-CSE-ConnectionGUID: 0Own3DiwQ7q31skM3B5S5A==
X-CSE-MsgGUID: mxeCxKWWRmejzoZWgEfZnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36762119"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="36762119"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 10:03:08 -0800
X-CSE-ConnectionGUID: pl5efNaLRwqvT6aGPgtkxQ==
X-CSE-MsgGUID: 0eqMTxzzQwmgSOn96tUaHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="103232997"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa006.jf.intel.com with ESMTP; 08 Jan 2025 10:03:07 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v12 4/4] drm/xe/pmu: Add GT frequency events
Date: Wed,  8 Jan 2025 09:59:23 -0800
Message-Id: <20250108175923.2160130-5-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250108175923.2160130-1-vinay.belgaumkar@intel.com>
References: <20250108175923.2160130-1-vinay.belgaumkar@intel.com>
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

Define PMU events for GT frequency (actual and requested). This is
a port from the i915 driver implementation, where an internal timer
is used to aggregate GT frequencies over certain fixed interval.
Following PMU events are being added-

  xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
  xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]

Standard perf commands can be used to monitor GT frequency-
  $ perf stat -e xe_0000_00_02.0/requested-frequency,gt_id=0/ -I1000

     1.001175175                700 M    xe/requested-frequency,gt_id=0/
     2.005891881                703 M    xe/requested-frequency,gt_id=0/
     3.007318169                700 M    xe/requested-frequency,gt_id=0/

Actual/requested frequencies will be 0 when GT is suspended.

v2: Checkpatch fix, moved timer code to this patch
v3: Fix kunit issue
v4: Checkpatch warning fixes
v5: Make PMU events per device (Lucas)
v6: Reuse bits from config mask for gt_id (Lucas)
v7: Fix bug in pmu_enable (Riana)
v8: Acquire pm runtime ref before pmu lock
v9: Review comments (Rodrigo)
v10: Use xe_pm_runtime_suspended (Riana) and review
comments (Rodrigo)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v3
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |   2 +
 drivers/gpu/drm/xe/xe_pmu.c       | 253 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pmu.h       |   2 +
 drivers/gpu/drm/xe/xe_pmu_types.h |  26 +++
 4 files changed, 282 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 64e60bcf131a..88ce52c63018 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -939,6 +939,8 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
+	xe_pmu_resume(gt);
+
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	xe_gt_dbg(gt, "resumed\n");
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 3afb2b1b533b..bcd020962611 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -26,6 +26,8 @@
 static cpumask_t xe_pmu_cpumask;
 static unsigned int xe_pmu_target_cpu = -1;
 
+#define SAMPLING_TIMER_FREQUENCY 200
+
 /**
  * DOC: Xe PMU (Performance Monitoring Unit)
  *
@@ -65,6 +67,29 @@ static unsigned int xe_pmu_target_cpu = -1;
  *      2352945
  *
  * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
+ *
+ * PMU frequency events use a software timer to aggregate GT freq values over the time of capture.
+ * This allows us to calculate a rough average over the timespan. This is why sysfs is the best way
+ * to obtain instantaneous frequency if accuracy is intended. Advantage of using PMU is that it
+ * results in lesser CPU utilization as compared to dumping sysfs entries repeatedly.
+ *
+ * To list GT frequency events, use the following-
+ *
+ * $ perf list | grep frequency
+ *   xe_0000_00_02.0/actual-frequency/              [Kernel PMU event]
+ *   xe_0000_00_02.0/requested-frequency/           [Kernel PMU event]
+ *
+ * $ perf stat -e xe_0000_00_02.0/requested-frequency,xe_gt_id=0/ -I1000
+ *             time             counts unit events
+ *      1.001189056               1950 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
+ *      2.006388494               1960 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
+ *      3.007930311               1959 M    xe_0000_00_02.0/requested-frequency,xe_gt_id=0/
+ *
+ * Dumping requested freq from sysfs-
+ * $  while true; do cat /sys/class/drm/card0/device/tile0/gt0/freq0/cur_freq ; sleep 1; done
+ *    1950
+ *    1950
+ *    1950
  */
 
 static struct xe_pmu *event_to_pmu(struct perf_event *event)
@@ -90,6 +115,12 @@ static unsigned int pm_bit(const u64 config)
 	case XE_PMU_C6_RESIDENCY:
 		val = __XE_PMU_C6_RESIDENCY_ENABLED;
 		break;
+	case XE_PMU_ACTUAL_FREQUENCY:
+		val =  __XE_PMU_ACTUAL_FREQUENCY_ENABLED;
+		break;
+	case XE_PMU_REQUESTED_FREQUENCY:
+		val = __XE_PMU_REQUESTED_FREQUENCY_ENABLED;
+		break;
 	default:
 		/*
 		 * Events that do not require sampling, or tracking state
@@ -106,6 +137,22 @@ static unsigned int config_bit(const u64 config)
 	return pm_bit(config);
 }
 
+static u32 config_mask(const u64 config)
+{
+	unsigned int bit = config_bit(config);
+
+	if (__builtin_constant_p(config))
+		BUILD_BUG_ON(bit >
+			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
+							 enable)) - 1);
+	else
+		WARN_ON_ONCE(bit >
+			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
+							 enable)) - 1);
+
+	return BIT(config_bit(config));
+}
+
 static unsigned int event_bit(struct perf_event *event)
 {
 	return config_bit(event->attr.config);
@@ -134,6 +181,10 @@ config_status(struct xe_device *xe, u64 config)
 		if (xe->info.skip_guc_pc)
 			return -ENODEV;
 		break;
+	case XE_PMU_ACTUAL_FREQUENCY:
+		fallthrough;
+	case XE_PMU_REQUESTED_FREQUENCY:
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -198,6 +249,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
 	pmu->event_sample[gt_id][sample].cur = val;
 }
 
+static void
+add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
+{
+	pmu->event_sample[gt_id][sample].cur += mul_u32_u32(val, mul);
+}
+
 static u64 get_c6(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -237,6 +294,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_device *xe =
 		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
 	const u64 config = event->attr.config;
 	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
@@ -246,6 +304,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	case XE_PMU_C6_RESIDENCY:
 		val = get_c6(gt);
 		break;
+	case XE_PMU_ACTUAL_FREQUENCY:
+		val =
+		   div_u64(read_sample(pmu, gt_id,
+				       __XE_SAMPLE_FREQ_ACT),
+			   USEC_PER_SEC /* to MHz */);
+		break;
+	case XE_PMU_REQUESTED_FREQUENCY:
+		val =
+		   div_u64(read_sample(pmu, gt_id,
+				       __XE_SAMPLE_FREQ_REQ),
+			   USEC_PER_SEC /* to MHz */);
+		break;
 	default:
 		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
 	}
@@ -274,11 +344,148 @@ static void xe_pmu_event_read(struct perf_event *event)
 	local64_add(new - prev, &event->count);
 }
 
+static u32 frequency_enabled_mask(void)
+{
+	unsigned int i;
+	u32 mask = 0;
+
+	for (i = 0; i < XE_PMU_MAX_GT; i++)
+		mask |= config_mask(__XE_PMU_ACTUAL_FREQUENCY(i)) |
+		config_mask(__XE_PMU_REQUESTED_FREQUENCY(i));
+
+	return mask;
+}
+
+static bool
+frequency_sampling_enabled(struct xe_pmu *pmu, unsigned int gt)
+{
+	return pmu->enable &
+	       (config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt)) |
+		config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt)));
+}
+
+static void
+frequency_sample(struct xe_gt *gt, unsigned int period_ns)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	const unsigned int gt_id = gt->info.id;
+	struct xe_pmu *pmu = &xe->pmu;
+	int ret;
+	u32 cur_freq;
+
+	if (!frequency_sampling_enabled(pmu, gt_id))
+		return;
+
+	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
+	if (xe_pm_runtime_suspended(xe))
+		return;
+
+	if (pmu->enable & config_mask(__XE_PMU_ACTUAL_FREQUENCY(gt_id))) {
+		u32 val;
+
+		/*
+		 * We take a quick peek here without using forcewake
+		 * so that we don't perturb the system under observation
+		 * (forcewake => !rc6 => increased power use). We expect
+		 * that if the read fails because it is outside of the
+		 * mmio power well, then it will return 0 -- in which
+		 * case we assume the system is running at the intended
+		 * frequency. Fortunately, the read should rarely fail!
+		 */
+		val = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+
+		add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_ACT,
+				val, period_ns / 1000);
+	}
+
+	if (pmu->enable & config_mask(__XE_PMU_REQUESTED_FREQUENCY(gt_id))) {
+		ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
+		if (!ret)
+			add_sample_mult(pmu, gt_id, __XE_SAMPLE_FREQ_REQ,
+					cur_freq,
+					period_ns / 1000);
+	}
+}
+
+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
+{
+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY);
+	unsigned int period_ns;
+	struct xe_gt *gt;
+	unsigned int i;
+	ktime_t now;
+
+	if (!READ_ONCE(pmu->timer_enabled))
+		return HRTIMER_NORESTART;
+
+	now = ktime_get();
+	period_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
+	pmu->timer_last = now;
+
+	/*
+	 * Strictly speaking the passed in period may not be 100% accurate for
+	 * all internal calculation, since some amount of time can be spent on
+	 * grabbing the forcewake. However the potential error from timer call-
+	 * back delay greatly dominates this so we keep it simple.
+	 */
+
+	for_each_gt(gt, xe, i) {
+		if (!(pmu->active_gts & BIT(i)))
+			continue;
+		frequency_sample(gt, period_ns);
+	}
+
+	hrtimer_forward(hrtimer, now, ns_to_ktime(period));
+
+	return HRTIMER_RESTART;
+}
+
+static bool pmu_needs_timer(struct xe_pmu *pmu)
+{
+	u32 enable;
+
+	/*
+	 * Only some counters need the sampling timer.
+	 *
+	 * We start with a bitmask of all currently enabled events.
+	 */
+	enable = pmu->enable;
+
+	/*
+	 * Mask out all the ones which do not need the timer, or in
+	 * other words keep all the ones that could need the timer.
+	 */
+	enable &= frequency_enabled_mask();
+
+	/*
+	 * If some bits remain it means we need the sampling timer running.
+	 */
+	return enable;
+}
+
+static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
+{
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / SAMPLING_TIMER_FREQUENCY);
+
+	if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
+		pmu->timer_enabled = true;
+		pmu->timer_last = ktime_get();
+		hrtimer_start_range_ns(&pmu->timer,
+				       ns_to_ktime(period), 0,
+				       HRTIMER_MODE_REL_PINNED);
+	}
+}
+
 static void xe_pmu_enable(struct perf_event *event)
 {
 	struct xe_pmu *pmu = event_to_pmu(event);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt;
 	const unsigned int bit = event_bit(event);
 	unsigned long flags;
+	unsigned int i;
 
 	if (bit == -1)
 		goto update;
@@ -296,6 +503,17 @@ static void xe_pmu_enable(struct perf_event *event)
 	pmu->enable |= BIT(bit);
 	pmu->enable_count[bit]++;
 
+	/*
+	 * Start the sampling timer if needed and not already enabled.
+	 */
+	__xe_pmu_maybe_start_timer(pmu);
+
+	/* Set active GTs in case system is not currently suspended */
+	if (!xe_pm_runtime_suspended(xe)) {
+		for_each_gt(gt, xe, i)
+			pmu->active_gts |= BIT(gt->info.id);
+	}
+
 	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 update:
 	/*
@@ -325,8 +543,10 @@ static void xe_pmu_disable(struct perf_event *event)
 	 * Decrement the reference count and clear the enabled
 	 * bitmask when the last listener on an event goes away.
 	 */
-	if (--pmu->enable_count[bit] == 0)
+	if (--pmu->enable_count[bit] == 0) {
 		pmu->enable &= ~BIT(bit);
+		pmu->timer_enabled &= pmu_needs_timer(pmu);
+	}
 
 	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 }
@@ -476,6 +696,8 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *unit;
 	} events[] = {
 		__event(0, "gt-c6-residency", "ms"),
+		__event(1, "actual-frequency", "M"),
+		__event(2, "requested-frequency", "M"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -684,6 +906,31 @@ void xe_pmu_suspend(struct xe_gt *gt)
 	raw_spin_unlock_irq(&pmu->lock);
 }
 
+/**
+ * xe_pmu_resume() - Restart the timer if needed
+ * @gt: GT object
+ */
+void xe_pmu_resume(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+
+	if (!pmu->base.event_init)
+		return;
+
+	raw_spin_lock_irq(&pmu->lock);
+
+	/*
+	 * Re-enable sampling timer when GPU goes active.
+	 */
+	if (pmu->active_gts == 0)
+		__xe_pmu_maybe_start_timer(pmu);
+
+	pmu->active_gts |= BIT(gt->info.id);
+
+	raw_spin_unlock_irq(&pmu->lock);
+}
+
 /**
  * xe_pmu_unregister() - Remove/cleanup PMU registration
  * @arg: Ptr to pmu
@@ -701,6 +948,8 @@ void xe_pmu_unregister(void *arg)
 
 	pmu->registered = false;
 
+	hrtimer_cancel(&pmu->timer);
+
 	xe_pmu_unregister_cpuhp_state(pmu);
 
 	perf_pmu_unregister(&pmu->base);
@@ -747,6 +996,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
 		return;
 
 	raw_spin_lock_init(&pmu->lock);
+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	pmu->timer.function = xe_sample;
 	pmu->cpuhp.cpu = -1;
 
 	pmu->name = kasprintf(GFP_KERNEL,
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
index 263665f814f0..388ada1ef9ff 100644
--- a/drivers/gpu/drm/xe/xe_pmu.h
+++ b/drivers/gpu/drm/xe/xe_pmu.h
@@ -16,12 +16,14 @@ void xe_pmu_exit(void);
 void xe_pmu_register(struct xe_pmu *pmu);
 void xe_pmu_unregister(void *arg);
 void xe_pmu_suspend(struct xe_gt *gt);
+void xe_pmu_resume(struct xe_gt *gt);
 #else
 static inline int xe_pmu_init(void) { return 0; }
 static inline void xe_pmu_exit(void) {}
 static inline void xe_pmu_register(struct xe_pmu *pmu) {}
 static inline void xe_pmu_unregister(void *arg) {}
 static inline void xe_pmu_suspend(struct xe_gt *gt) {}
+static inline void xe_pmu_resume(struct xe_gt *gt) {}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index b97ba536d3ee..404b92f9d67c 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -12,6 +12,8 @@
 enum {
 	__XE_SAMPLE_C6,
 	__XE_SAMPLE_C6_LAST_REPORTED,
+	__XE_SAMPLE_FREQ_ACT,
+	__XE_SAMPLE_FREQ_REQ,
 	__XE_NUM_PMU_SAMPLERS
 };
 
@@ -28,7 +30,11 @@ enum {
 #define __XE_PMU_EVENT(x) ___XE_PMU_EVENT(0, x)
 
 #define XE_PMU_C6_RESIDENCY		__XE_PMU_EVENT(0)
+#define XE_PMU_ACTUAL_FREQUENCY		__XE_PMU_EVENT(1)
+#define XE_PMU_REQUESTED_FREQUENCY	__XE_PMU_EVENT(2)
 #define __XE_PMU_C6_RESIDENCY(gt)	___XE_PMU_EVENT(gt, 0)
+#define __XE_PMU_ACTUAL_FREQUENCY(gt)	___XE_PMU_EVENT(gt, 1)
+#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_EVENT(gt, 2)
 
 /*
  * Non-engine events that we need to track enabled-disabled transition and
@@ -36,6 +42,8 @@ enum {
  */
 enum xe_pmu_tracked_events {
 	__XE_PMU_C6_RESIDENCY_ENABLED,
+	__XE_PMU_ACTUAL_FREQUENCY_ENABLED,
+	__XE_PMU_REQUESTED_FREQUENCY_ENABLED,
 	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
 };
 
@@ -122,6 +130,24 @@ struct xe_pmu {
 	 * @sleep_last: Last time GT parked for C6 estimation.
 	 */
 	ktime_t sleep_last[XE_PMU_MAX_GT];
+	/**
+	 * @timer: Timer for internal Xe PMU sampling.
+	 */
+	struct hrtimer timer;
+	/**
+	 * @timer_last:
+	 *
+	 * Timestmap of the previous timer invocation.
+	 */
+	ktime_t timer_last;
+	/**
+	 * @timer_enabled: Should the internal sampling timer be running.
+	 */
+	bool timer_enabled;
+	/**
+	 * @active_gts: GT active mask.
+	 */
+	unsigned int active_gts;
 };
 
 #endif
-- 
2.38.1

