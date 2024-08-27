Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D586C5472F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 16:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8B510E3A0;
	Tue, 27 Aug 2024 16:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIJuu4MY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8A710E3A0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724776997; x=1756312997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jEdnCN8iw3CWl8NKB0OXmrcl8OK97jUKb5fTEvsA7HE=;
 b=LIJuu4MYB2V0i5eDxJGLfWLTBoklbXbv8MJ7ao+QbDUE2dJAllcI8Uaw
 j90QXAzu5gnlRJ3CczbaBI+OVXFeDck58qxMq1w4gxk1jUcJs4mBsL2A9
 jjzQrcUNzPsALBYCSUQ404GWCHrce49Q23NwKBEw5VRox240zxwBnZiCd
 OxUhAag76DMxb4iqHERst7/xmb+SE+IDk2HTXwjpTOfak2x5ZYhq/1WKv
 0PqCwnxbko5q+uoYN8hrvL8xbxZSyHOhrTElMhx2oVgXKlk/uiq9yfrdg
 dTlfIvW/Ve1OmCt0MazbwnC2cVKS91qRkCaXQWwhISf+C8hx1/6N34vMK A==;
X-CSE-ConnectionGUID: BzogqYRFRXenP5xJ7LSNnA==
X-CSE-MsgGUID: +TLG+swKRWSM2vCu1DAjFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23143734"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23143734"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:43:17 -0700
X-CSE-ConnectionGUID: VjXX5Mb7Rbu+cJbolw71DA==
X-CSE-MsgGUID: xQ/g+KibQS6lqE70eUjCeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63424246"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 09:43:17 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@ntel.com>
Subject: [PATCH 2/4] drm/xe/pmu: Define and init a timer
Date: Tue, 27 Aug 2024 09:41:05 -0700
Message-Id: <20240827164107.47034-3-vinay.belgaumkar@intel.com>
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

This patch adds the necessary framework for a timer. Code
is ported over from the i915 driver. This will be used
for frequency related events. Instead of having a fixed
sampling frequency, it now provides a modparam so user is
able to change the sampling frequency if needed.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@ntel.com>
---
 drivers/gpu/drm/xe/xe_module.c    |  5 ++
 drivers/gpu/drm/xe/xe_module.h    |  1 +
 drivers/gpu/drm/xe/xe_pmu.c       | 92 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu_types.h | 51 +++++++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index a95c771e7fac..e36c10c10af4 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -22,6 +22,7 @@ struct xe_modparam xe_modparam = {
 #ifdef CONFIG_PCI_IOV
 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
 #endif
+	.pmu_sampling_freq = 200,
 	.wedged_mode = 1,
 	/* the rest are 0 by default */
 };
@@ -61,6 +62,10 @@ MODULE_PARM_DESC(max_vfs,
 		 "(0 = no VFs [default]; N = allow up to N VFs)");
 #endif
 
+module_param_named_unsafe(pmu_sampling_freq, xe_modparam.pmu_sampling_freq, int, 0600);
+MODULE_PARM_DESC(wedged_mode,
+		 "Module's default policy for the PMU sampling freq mode - 200=normal[default]");
+
 module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
 MODULE_PARM_DESC(wedged_mode,
 		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 161a5e6f717f..b583579b0594 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -21,6 +21,7 @@ struct xe_modparam {
 #ifdef CONFIG_PCI_IOV
 	unsigned int max_vfs;
 #endif
+	unsigned int pmu_sampling_freq;
 	int wedged_mode;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 33e7966f449c..7140bf795cae 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -13,11 +13,17 @@
 #include "xe_gt_clock.h"
 #include "xe_mmio.h"
 #include "xe_macros.h"
+#include "xe_module.h"
 #include "xe_pm.h"
 
 static cpumask_t xe_pmu_cpumask;
 static unsigned int xe_pmu_target_cpu = -1;
 
+static struct xe_pmu *event_to_pmu(struct perf_event *event)
+{
+	return container_of(event->pmu, struct xe_pmu, base);
+}
+
 static unsigned int config_gt_id(const u64 config)
 {
 	return config >> __XE_PMU_GT_SHIFT;
@@ -28,6 +34,32 @@ static u64 config_counter(const u64 config)
 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
 }
 
+static unsigned int other_bit(const u64 config)
+{
+	unsigned int val;
+
+	switch (config_counter(config)) {
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
@@ -132,8 +164,66 @@ static void xe_pmu_event_read(struct perf_event *event)
 	local64_add(new - prev, &event->count);
 }
 
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
+	 * If some bits remain it means we need the sampling timer running.
+	 */
+	return enable;
+}
+
+static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
+{
+	const u64 freq = xe_modparam.pmu_sampling_freq;
+	u64 period = max_t(u64, 10000, NSEC_PER_SEC / freq);
+
+        if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
+		pmu->timer_enabled = true;
+		pmu->timer_last = ktime_get();
+		hrtimer_start_range_ns(&pmu->timer,
+				       ns_to_ktime(period), 0,
+				       HRTIMER_MODE_REL_PINNED);
+        }
+}
+
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
+	/*
+	 * Start the sampling timer if needed and not already enabled.
+	 */
+	__xe_pmu_maybe_start_timer(pmu);
+
+	spin_unlock_irqrestore(&pmu->lock, flags);
+update:
 	/*
 	 * Store the current counter value so we can report the correct delta
 	 * for all listeners. Even when the event was already enabled and has
@@ -462,6 +552,7 @@ static void xe_pmu_unregister(void *arg)
 	 */
 	pmu->closed = true;
 	synchronize_rcu();
+	hrtimer_cancel(&pmu->timer);
 
 	xe_pmu_unregister_cpuhp_state(pmu);
 
@@ -484,6 +575,7 @@ void xe_pmu_register(struct xe_pmu *pmu)
 	int ret = -ENOMEM;
 
 	spin_lock_init(&pmu->lock);
+	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	pmu->cpuhp.cpu = -1;
 
 	pmu->name = kasprintf(GFP_KERNEL,
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index ca0e7cbe2081..f718a5a2f44d 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -16,6 +16,22 @@ enum {
 
 #define XE_PMU_MAX_GT 2
 
+/*
+ * Non-engine events that we need to track enabled-disabled transition and
+ * current state.
+ */
+enum xe_pmu_tracked_events {
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
 struct xe_pmu {
 	/**
 	 * @cpuhp: Struct used for CPU hotplug handling.
@@ -58,6 +74,41 @@ struct xe_pmu {
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
+	 * @timer_last:
+	 *
+	 * Timestmap of the previous timer invocation.
+	 */
+	ktime_t timer_last;
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
+	 * @timer_enabled: Should the internal sampling timer be running.
+	 */
+	bool timer_enabled;
+
+	struct hrtimer timer;
 };
 
 #endif
-- 
2.38.1

