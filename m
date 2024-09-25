Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DCBCCFA08
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 23:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06310E872;
	Wed, 25 Sep 2024 23:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klpCWKlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C190C10E871
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 23:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727306688; x=1758842688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c25FWaE0Oa+DS9FzujqEA3TD+jffHMiApaDU4jtlYIQ=;
 b=klpCWKlvufcvfDanG5a8wrZ8PtNCQb0gAIZDaUXPrz9vegbYhX7HZVCs
 KFmFZVlwSS57zcduyUAoiqyGdnT2vURviy/ZVKI+JeLEa5SKKXOFPQat5
 fY8PDQ+8MXODTi2uE5GSrRD/3STj1iuHyNzmVSTG3YoOAuQ16wjUmEKCx
 V5x9PFcwxN7pegGUx5zqzuq0wvFtHc9oYqHD5dSr2h5ilf7WvWujWsSTI
 XKlG/fA+SRbBd/J+zfQ+D5hTIsAhrk+mXnDREgybpE2WuuM/C+Jzgw/w5
 ZIyIsAK7I9XMI0JMPMubamHSWLUD99TydYFcLL+vftL6OI6FJBGq1H8UU Q==;
X-CSE-ConnectionGUID: rGvofifOSiGRmKC9GCoZUw==
X-CSE-MsgGUID: 6xFRIQURQZWvG9Vhy3Qizw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="30176189"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="30176189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 16:24:48 -0700
X-CSE-ConnectionGUID: nnZf+bC5SAuSXjBy/4f4Zw==
X-CSE-MsgGUID: JVrPi4mVRha8zPGbzL3fmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="76320943"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2024 16:24:48 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/3] drm/xe/pmu: Add GT frequency events
Date: Wed, 25 Sep 2024 16:21:59 -0700
Message-Id: <20240925232159.2057581-4-vinay.belgaumkar@intel.com>
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

Define PMU events for GT frequency (actual and requested). This is
a port from the i915 driver implementation.

Following PMU events are being added-

  xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
  xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
  xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
  xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]

v2: Checkpatch fix, moved timer code to this patch

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c        |   2 +
 drivers/gpu/drm/xe/xe_pmu.c       | 218 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h       |   2 +
 drivers/gpu/drm/xe/xe_pmu_types.h |  22 +++
 include/uapi/drm/xe_drm.h         |   5 +
 5 files changed, 249 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 7a190c49c573..796b330ffd62 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -929,6 +929,8 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_gt_idle_enable_pg(gt);
 
+	xe_pmu_resume(gt);
+
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_gt_dbg(gt, "resumed\n");
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index b1b38d245e00..39bae25a92ed 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -63,6 +63,12 @@ static unsigned int other_bit(const u64 config)
 	case XE_PMU_RC6_RESIDENCY:
 		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
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
@@ -79,6 +85,22 @@ static unsigned int config_bit(const u64 config)
 	return other_bit(config);
 }
 
+static u32 config_mask(const u64 config)
+{
+	unsigned int bit = config_bit(config);
+
+	if (__builtin_constant_p(config))
+		BUILD_BUG_ON(bit >
+			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
+					   enable)) - 1);
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
@@ -107,6 +129,10 @@ config_status(struct xe_device *xe, u64 config)
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
@@ -169,6 +195,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
 	pmu->event_sample[gt_id][sample].cur = val;
 }
 
+static void
+add_sample_mult(struct xe_pmu *pmu, unsigned int gt_id, int sample, u32 val, u32 mul)
+{
+	pmu->event_sample[gt_id][sample].cur += mul_u32_u32(val, mul);
+}
+
 static u64 get_rc6(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -214,6 +246,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_device *xe =
 		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
 	const unsigned int gt_id = config_gt_id(event->attr.config);
 	const u64 config = event->attr.config;
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
@@ -223,6 +256,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	case XE_PMU_RC6_RESIDENCY:
 		val = get_rc6(gt);
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
@@ -252,6 +297,144 @@ static void xe_pmu_event_read(struct perf_event *event)
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
+	bool device_awake;
+	int ret;
+	u32 cur_freq;
+
+	if (!frequency_sampling_enabled(pmu, gt_id))
+		return;
+
+	/* Report 0/0 (actual/requested) frequency while GT is suspended. */
+	device_awake = xe_pm_runtime_get_if_active(xe);
+	if (!device_awake)
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
+
+	xe_pm_runtime_put(xe);
+}
+
+static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
+{
+	struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
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
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / FREQUENCY);
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
@@ -263,6 +446,11 @@ static void xe_pmu_enable(struct perf_event *event)
 
 	spin_lock_irqsave(&pmu->lock, flags);
 
+	/*
+	 * Start the sampling timer if needed and not already enabled.
+	 */
+	__xe_pmu_maybe_start_timer(pmu);
+
 	/*
 	 * Update the bitmask of enabled events and increment
 	 * the event reference counter.
@@ -403,6 +591,8 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *unit;
 	} events[] = {
 		__event(0, "rc6-residency", "ms"),
+		__event(1, "actual-frequency", "M"),
+		__event(2, "requested-frequency", "M"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -617,6 +807,30 @@ void xe_pmu_suspend(struct xe_gt *gt)
 	spin_unlock_irq(&pmu->lock);
 }
 
+/**
+ * xe_pmu_resume() - Restart the timer if needed
+ */
+void xe_pmu_resume(struct xe_gt *gt)
+{
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
+}
+
 /**
  * xe_pmu_unregister() - Remove/cleanup PMU registration
  */
@@ -635,6 +849,8 @@ void xe_pmu_unregister(void *arg)
 	pmu->closed = true;
 	synchronize_rcu();
 
+	hrtimer_cancel(&pmu->timer);
+
 	xe_pmu_unregister_cpuhp_state(pmu);
 
 	perf_pmu_unregister(&pmu->base);
@@ -678,6 +894,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
 	int ret = -ENOMEM;
 
 	spin_lock_init(&pmu->lock);
+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	pmu->timer.function = xe_sample;
 	pmu->cpuhp.cpu = -1;
 
 	pmu->name = kasprintf(GFP_KERNEL,
diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
index 733f2c33039c..47d7f0a8e4bb 100644
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
 static void xe_pmu_unregister(void *arg) {}
 void xe_pmu_suspend(struct xe_gt *gt) {}
+void xe_pmu_resume(struct xe_gt *gt) {}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 1213d2a73492..f4cf85d72aac 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -13,6 +13,8 @@
 enum {
 	__XE_SAMPLE_RC6,
 	__XE_SAMPLE_RC6_LAST_REPORTED,
+	__XE_SAMPLE_FREQ_ACT,
+	__XE_SAMPLE_FREQ_REQ,
 	__XE_NUM_PMU_SAMPLERS
 };
 
@@ -23,6 +25,8 @@ enum {
  * current state.
  */
 enum xe_pmu_tracked_events {
+	__XE_PMU_ACTUAL_FREQUENCY_ENABLED,
+	__XE_PMU_REQUESTED_FREQUENCY_ENABLED,
 	__XE_PMU_RC6_RESIDENCY_ENABLED,
 	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
 };
@@ -116,6 +120,24 @@ struct xe_pmu {
 	 * @sleep_last: Last time GT parked for RC6 estimation.
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
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 3ef3926551dd..1f0ddbd77838 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1399,7 +1399,12 @@ struct drm_xe_wait_user_fence {
 #define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
 
 #define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
+#define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_OTHER(1)
+#define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_OTHER(2)
+
 #define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
+#define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_OTHER(gt, 1)
+#define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_OTHER(gt, 2)
 
 /**
  * enum drm_xe_observation_type - Observation stream types
-- 
2.38.1

