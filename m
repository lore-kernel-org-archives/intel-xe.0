Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52413C54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091210E3A1;
	Tue, 27 Aug 2024 16:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHUBrO6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3905410E3A5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777003; x=1756313003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RglCFPwOEpxPbH3wL6yj+bYQgNcPoCDw+vXdO7R1+X4=;
 b=NHUBrO6y6aZdPmgLotPhK82nPDwrh2+FGFy6YeeVV9CTziFXr9UQIeBN
 mDtKBX2+OxcXFRoO+3uIinLJPGDHdlKs2o2r+oH4QrYaAnLeBkABd4IBo
 h+gajqmKYMH1UA4of+yJ0GmCNnLLi2feHUx4dWgPkoifRI5aIesHZlHhz
 EfQ5D70ZM9U74MUNCx7BSeT2pmcUeyfOGfhdP+S/lFC2sun5L4HpfnuP8
 65YigY1Uszup5FeNQ/nkq3p+Z6EgjgukFD/XGXYZ2yIQT1MJpRX9Adm3p
 vy0VKEk3I2aruRZnK5KfHkCZHkSTzt4Ps7V7ACkIWdnI2E9rgBOhFU3Eg A==;
X-CSE-ConnectionGUID: nR3X7DHAS/CEUZnqzcWjvw==
X-CSE-MsgGUID: As0jxGGHQQWj4RpqPT80JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23143748"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23143748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:43:23 -0700
X-CSE-ConnectionGUID: WU+qx/tRRGCyp3dv5pDtOw==
X-CSE-MsgGUID: 403PTbFIRbmjnISFLefpow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63424280"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 09:43:23 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/4] drm/xe/pmu: Add GT frequency events
Date: Tue, 27 Aug 2024 09:41:07 -0700
Message-Id: <20240827164107.47034-5-vinay.belgaumkar@intel.com>
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

Define PMU events for GT freq (actual and requested).
PMU events being added -

  xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
  xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
  xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
  xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]

These events will aggregate freq in Mhz just like sysfs. The
implementation has been borrowed from i915 driver.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c       | 157 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu_types.h |   4 +
 include/uapi/drm/xe_drm.h         |   5 +
 3 files changed, 166 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 5b9c7966ec75..671dc2caf37d 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -44,6 +44,12 @@ static unsigned int other_bit(const u64 config)
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
@@ -60,6 +66,22 @@ static unsigned int config_bit(const u64 config)
 	return other_bit(config);
 }
 
+static u32 config_mask(const u64 config)
+{
+	unsigned int bit = config_bit(config);
+
+	if (__builtin_constant_p(config))
+		BUILD_BUG_ON(bit >
+			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
+						 enable)) - 1);
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
@@ -88,6 +110,10 @@ config_status(struct xe_device *xe, u64 config)
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
@@ -150,6 +176,12 @@ store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
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
@@ -195,6 +227,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_device *xe =
 		container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &xe->pmu;
 	const unsigned int gt_id = config_gt_id(event->attr.config);
 	const u64 config = event->attr.config;
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
@@ -204,6 +237,18 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
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
@@ -233,6 +278,109 @@ static void xe_pmu_event_read(struct perf_event *event)
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
+	const u64 freq = xe_modparam.pmu_sampling_freq;
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / freq);
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
 static bool pmu_needs_timer(struct xe_pmu *pmu)
 {
 	u32 enable;
@@ -244,6 +392,12 @@ static bool pmu_needs_timer(struct xe_pmu *pmu)
 	 */
 	enable = pmu->enable;
 
+	/*
+	 * Mask out all the ones which do not need the timer, or in
+	 * other words keep all the ones that could need the timer.
+	 */
+	enable &= frequency_enabled_mask();
+
 	/*
 	 * If some bits remain it means we need the sampling timer running.
 	 */
@@ -420,6 +574,8 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *unit;
 	} events[] = {
 		__event(0, "rc6-residency", "ms"),
+		__event(1, "actual-frequency", "M"),
+		__event(2, "requested-frequency", "M"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
@@ -710,6 +866,7 @@ void xe_pmu_register(struct xe_pmu *pmu)
 
 	spin_lock_init(&pmu->lock);
 	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	pmu->timer.function = xe_sample;
 	pmu->cpuhp.cpu = -1;
 
 	pmu->name = kasprintf(GFP_KERNEL,
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index 32835f6987d2..073964be473d 100644
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
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5b85ee1cfc0b..6f39e08f6e8d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1425,7 +1425,12 @@ struct drm_xe_wait_user_fence {
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

