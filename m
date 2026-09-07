Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82044C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4F910E483;
	Mon,  7 Sep 2026 06:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbA1xpoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070A410E469
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 06:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788763636; x=1820299636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXpz/w/f0Yn1/5EDquk2Ef1F/cLXOqD5zpy++2npedI=;
 b=CbA1xpoIdLwEynIkDW+WMwkaHljxxlf2C5tnf00kiK6KZvjXEDbvS9mo
 v9BFszGmFOtOuaJqZIzwwe2YhYjh6aPmuUBdwGHIqFr5J+VUgOqn+QR8p
 KyfOXQAbXkCdSmNJqkV5H5dFj1Xuk1lJ1N9mMRg+pbumAaMDfN9xKweSH
 4z/XeDs7FFUWmV5yvcbgeJSpQvnPHvO8MrFPX510B01JTZo1wq4qPJs/9
 5UolQEhBgFVYEkIpllhHrFH+dZLeYZFtxX+gdtP21K7dV15Pr9B3bp0pJ
 E8B1WgrS83txxgt63h2CR+ugjlZsM16iGnDNZgHQaWqnex6qPSgaLpgS5 Q==;
X-CSE-ConnectionGUID: x1WtBbaDQWqiIUB0Uc7gPw==
X-CSE-MsgGUID: irDF6WbnSRGfuu1rIho41g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76717858"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="76717858"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:47:16 -0700
X-CSE-ConnectionGUID: OQ6Ghu3hRAma1u4pkPuoYg==
X-CSE-MsgGUID: 9Ot85tF7SK+BjaEugJoazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="264434151"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2026 23:47:13 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: S Sebinraj <s.sebinraj@intel.corp-partner.google.com>,
 Carlos Santa <carlos.santa@intel.com>, Ryan Neph <ryanneph@google.com>,
 Renato Pereyra <renatopereyra@google.com>,
 S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 1/4] RFC: ANDROID: drm/xe: add adaptive GPU memory growth
 monitor xe_mem_monitor
Date: Mon,  7 Sep 2026 11:37:34 +0530
Message-Id: <20260907060737.3636824-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907060737.3636824-1-s.sebinraj@intel.com>
References: <20260907060737.3636824-1-s.sebinraj@intel.com>
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

From: S Sebinraj <s.sebinraj@intel.corp-partner.google.com>

Introduce xe_mem_monitor, a periodic worker that samples
xe->global_total_pages (the same counter that feeds the
gpu_mem/gpu_mem_total tracepoint) and tracks GPU memory growth using an
exponential moving average (EMA) over per-interval deltas:

    delta(t) = max(0, mem(t) - mem(t-1))
    EMA(t)   = alpha * delta(t) + (1 - alpha) * EMA(t-1)

    where alpha = 0.8, applied to every real sample
    regardless of mode.

A single alpha and a single polling cadence (mem_monitor_poll_ms)
are used in both LATENCY and HIGH_THROUGHPUT mode, once
HIGH_THROUGHPUT mode is entered there is little benefit to re-checking
any faster, since mem_monitor_debounce_count consecutive
below-threshold samples are already required before switching back,
which itself provides the desired minimum dwell time
(debounce_count * poll_ms) at this single cadence.

When the EMA of growth exceeds a threshold, xe->gpu_mem_mode is switched
from XE_GPU_MEM_MODE_LATENCY to XE_GPU_MEM_MODE_HIGH_THROUGHPUT, and
back once mem_monitor_debounce_count consecutive below-threshold
samples are seen.

xe->gpu_mem_mode is intended to be read by the TTM page allocation path
to trade allocation latency for throughput during GPU memory growth
bursts; the GFP flag adjustment itself is added in a follow-up change.

For power, the worker sleeps after mem_monitor_idle_timeout_ms of no
significant activity in LATENCY mode. The worker is re-armed on
activity.

The worker is suspended/resumed across system and runtime PM
transitions with notify_activity() also disabled while suspended.

All tuning is exposed as module parameters (mem_monitor_*) under
/sys/module/xe/parameters/. Defaults:

    mem_monitor_enabled                    false
    mem_monitor_growth_threshold_mb          250
    mem_monitor_poll_ms                     2000
    mem_monitor_debounce_count                 5
    mem_monitor_idle_timeout_ms            10000

Guarded by new CONFIG_DRM_XE_MEM_MONITOR (depends on DRM_XE, selects
TRACE_GPU_MEM), enabled by default in defconfig_xe.

mem_monitor_enabled for fatcat is set via kernel arg xe.mem_monitor_enabled=1

Test: Verified via kernel logs while running WebGL-Aquarium / WLEU benchmark,
      mode switches to HIGH_THROUGHPUT on rapid allocation bursts and
      back once memory stabilizes. Confirmed idle-sleep/wake, EMA decay
      across sleep, clean suspend/resume behavior.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Cc: Renato Pereyra <renatopereyra@google.com>
Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/BUILD.bazel          |   3 +
 drivers/gpu/drm/defconfig_xe         |   1 +
 drivers/gpu/drm/xe/Kconfig           |  14 +
 drivers/gpu/drm/xe/xe_bo.c           |   3 +
 drivers/gpu/drm/xe/xe_device.c       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h |  12 +
 drivers/gpu/drm/xe/xe_mem_monitor.c  | 462 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mem_monitor.h  |  82 +++++
 drivers/gpu/drm/xe/xe_module.c       |  55 ++++
 drivers/gpu/drm/xe/xe_module.h       |  13 +
 drivers/gpu/drm/xe/xe_pm.c           |   5 +
 11 files changed, 655 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_mem_monitor.c
 create mode 100644 drivers/gpu/drm/xe/xe_mem_monitor.h

diff --git a/drivers/gpu/drm/BUILD.bazel b/drivers/gpu/drm/BUILD.bazel
index ac32f5cdecb9..274a1aa4ca93 100644
--- a/drivers/gpu/drm/BUILD.bazel
+++ b/drivers/gpu/drm/BUILD.bazel
@@ -154,6 +154,9 @@ ddk_module(
         "CONFIG_DRM_XE_GPUFREQTRACER": {
             True: ["xe/xe_gpufreqtracer.c"],
         },
+        "CONFIG_DRM_XE_MEM_MONITOR": {
+            True: ["xe/xe_mem_monitor.c"],
+        },
         "CONFIG_DRM_XE_GPUSVM": {
             True: ["xe/xe_svm.c"],
         },
diff --git a/drivers/gpu/drm/defconfig_xe b/drivers/gpu/drm/defconfig_xe
index c6e1c69fa663..4dc505580a37 100644
--- a/drivers/gpu/drm/defconfig_xe
+++ b/drivers/gpu/drm/defconfig_xe
@@ -3,3 +3,4 @@ CONFIG_DRM_XE_DISPLAY=y
 CONFIG_DRM_XE_DP_TUNNEL=y
 CONFIG_DRM_XE_FORCE_PROBE="*"
 CONFIG_DRM_XE_GPUFREQTRACER=y
+CONFIG_DRM_XE_MEM_MONITOR=y
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1521975c35fc..d0a0fcb33d64 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -150,6 +150,20 @@ config DRM_XE_GPUFREQTRACER
 
 	  If unsure, say N.
 
+config DRM_XE_MEM_MONITOR
+        bool "Enable XE GPU memory growth monitor"
+        depends on DRM_XE
+        select TRACE_GPU_MEM
+        default n
+        help
+          Enable adaptive GPU memory growth monitoring for the Intel XE driver.
+          Polls xe->global_total_pages at 500ms (active) or 2s (idle) intervals
+          and applies an exponential moving average to detect rapid allocation
+          bursts (>200 MB/interval).  When a burst is detected the TTM vendor
+          hook is disabled so that the kernel's normal direct-reclaim path can
+          apply backpressure on high-order page allocations, preventing stalls
+          from an unresponsive page cache.
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 493619229376..f2634d048cd4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -27,6 +27,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_map.h"
+#include "xe_mem_monitor.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
@@ -436,6 +437,8 @@ static void update_global_total_pages(struct ttm_device *ttm_dev,
 
 	trace_gpu_mem_total(xe->drm.primary->index, 0,
 			    global_total_pages << PAGE_SHIFT);
+
+	xe_mem_monitor_notify_activity(xe);
 #endif
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e405dbedd6b8..676ffc258b94 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -36,6 +36,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gpufreqtracer.h"
+#include "xe_mem_monitor.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
@@ -931,6 +932,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_mem_monitor_init(xe);
+	if (err)
+		return err;
+
 	err = xe_late_bind_init(&xe->late_bind);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7b6c4e9a12b1..48aa9d8f6f56 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -39,6 +39,7 @@ struct intel_display;
 struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_gpufreqtracer_data;
+struct xe_mem_monitor_data;
 struct xe_i2c;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -583,6 +584,9 @@ struct xe_device {
 	/** @gpufreqtracer_data: GPU frequency tracer data */
 	struct xe_gpufreqtracer_data *gpufreqtracer_data;
 
+	/** @mem_monitor: GPU memory growth monitor data */
+	struct xe_mem_monitor_data *mem_monitor;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
@@ -630,6 +634,14 @@ struct xe_device {
 	 */
 	atomic64_t global_total_pages;
 #endif
+
+	/**
+	 * @gpu_mem_mode: current GPU memory allocation mode (enum xe_gpu_mem_mode),
+	 * switched between latency and high-throughput by xe_mem_monitor based on
+	 * GPU memory growth rate.
+	 */
+	atomic_t gpu_mem_mode;
+
 	/** @val: The domain for exhaustive eviction, which is currently per device. */
 	struct xe_validation_device val;
 
diff --git a/drivers/gpu/drm/xe/xe_mem_monitor.c b/drivers/gpu/drm/xe/xe_mem_monitor.c
new file mode 100644
index 000000000000..06fbd0624da7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mem_monitor.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * xe_mem_monitor - Adaptive GPU memory growth monitor
+ *
+ * Periodically samples xe->global_total_pages (the same counter that feeds
+ * the gpu_mem/gpu_mem_total tracepoint) and applies an exponential moving
+ * average (EMA) over per-interval growth.  When growth exceeds a threshold
+ * xe->gpu_mem_mode is switched to XE_GPU_MEM_MODE_HIGH_THROUGHPUT, allowing
+ * the kernel's normal reclaim path to apply backpressure on TTM page
+ * allocations.  Once memory stabilises, the mode is switched back to
+ * XE_GPU_MEM_MODE_LATENCY.
+ *
+ * Algorithm:
+ *
+ *   delta(t)  = max(0, mem(t) - mem(t-1))          // clamp frees to zero
+ *   EMA(t)    = (ALPHA_NUM * delta(t) +
+ *               (2^ALPHA_SHIFT - ALPHA_NUM) * EMA(t-1) ) >> ALPHA_SHIFT
+ *
+ *   where ALPHA_NUM/2^ALPHA_SHIFT = alpha = 13/16 = 0.8125,
+ *   applied to every real sample regardless of mode, where ALPHA_SHIFT
+ *   = 4, (2^4 = 16). Both modes poll at the same mem_monitor_poll_ms
+ *   cadence and use the same smoothing weight.
+ *
+ * State machine (xe->gpu_mem_mode):
+ *   LATENCY mode, poll
+ *     -> EMA > mem_monitor_growth_threshold_mb: switch to HIGH_THROUGHPUT
+ *   HIGH_THROUGHPUT mode, poll (single polling rate - see
+ *   xe_mem_monitor_work()'s reschedule logic)
+ *     -> EMA below threshold for mem_monitor_debounce_count consecutive
+ *        samples -> switch back to LATENCY mode. Since samples are taken
+ *        every mem_monitor_poll_ms regardless of mode,
+ *        mem_monitor_debounce_count also acts as the implicit minimum dwell
+ *        time in HIGH_THROUGHPUT mode (debounce_count * poll_ms).
+ *
+ * Power saving: while in LATENCY mode, if no GPU allocation activity has been
+ * observed (see xe_mem_monitor_notify_activity()) for mem_monitor_idle_timeout_ms,
+ * the polling worker stops rescheduling itself entirely (goes to sleep, zero
+ * wakeups) rather than continuing to poll indefinitely. It is re-armed the
+ * next time real GPU memory growth is observed via
+ * xe_mem_monitor_notify_activity(). Since the state machine only ever reacts
+ * to growth (frees are clamped to zero), notify_activity() itself only
+ * resets the idle timer / wakes a sleeping worker when the live memory total
+ * has actually grown since the last real sample, a pure free or a
+ * populate/unpopulate pair that nets to no change, is ignored rather than
+ * forcing a full poll+decay cycle that could never affect the LATENCY/
+ * HIGH_THROUGHPUT decision.
+ *
+ * Since the EMA depends on samples being taken at a roughly regular cadence,
+ * and no samples are taken while asleep, the worker treats any skipped
+ * mem_monitor_poll_ms intervals since its last real sample as implicit
+ * zero-growth samples and fast-forwards the EMA decay for them before
+ * folding in the real delta observed on the sample that woke it up. This
+ * prevents stale, pre-sleep growth history from persisting indefinitely
+ * across arbitrarily long idle gaps.
+ */
+
+#include "xe_mem_monitor.h"
+
+#include <linux/atomic.h>
+#include <linux/jiffies.h>
+#include <linux/minmax.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_module.h"
+
+/*
+ * EMA smoothing factor. alpha (13/16 = 0.8125) applies to every real
+ * sample, regardless of mode,
+ * since both LATENCY and HIGH_THROUGHPUT modes poll at the same
+ * mem_monitor_poll_ms cadence (see xe_mem_monitor_work()'s reschedule
+ * logic) and share the same smoothing weight.
+ */
+#define ALPHA_NUM		13U
+#define ALPHA_RETAINED		3U	/* 16 - 13 */
+#define ALPHA_SHIFT		4U	/* /16 */
+
+/*
+ * This is the max number of implicit zero-growth decay steps applied when waking
+ * from sleep (see xe_mem_monitor_work()). Each step degrades EMA by
+ * ALPHA_RETAINED/2^ALPHA_SHIFT = 3/16 per step,
+ * so after the number of steps below the EMA has already decayed to 0
+ * via integer truncation regardless of its starting value. No need to loop
+ * further for arbitrarily long sleeps.
+ */
+#define EMA_DECAY_SATURATE_PERIODS 32
+
+/*
+ * Minimum absolute change (bytes) since the worker's last real sample
+ * required for xe_mem_monitor_notify_activity() to treat it as activity
+ * worth acting on. Filters out negligible/noise-level trickle (a few KB of
+ * housekeeping churn) that would otherwise repeatedly wake the worker for no
+ * meaningful reason. Checked in both directions (growth or shrink): a
+ * significant free must also resync prev_mem_bytes, otherwise it can be left
+ * stuck at a stale high-water mark that later, real growth from a much lower
+ * baseline would never be able to cross.
+ * Current allocated bytes is compared to the prev bytes so we won't accumulate
+ * small errors less than 1 MB over multiple calls
+ */
+#define ACTIVITY_MIN_DELTA_BYTES (1ULL << 20)   /* 1 MB */
+
+/**
+ * struct xe_mem_monitor_data - per-device GPU memory monitor state
+ * @xe:                    back-pointer to the xe device
+ * @work:                  self-rescheduling delayed work
+ * @prev_mem_bytes:        GPU memory total from the previous poll. atomic64_t
+ *                         because it is also read from
+ *                         xe_mem_monitor_notify_activity(), which can run
+ *                         concurrently with the worker on another thread.
+ * @has_prev_sample:       false until the first sample is taken (baseline)
+ * @ema_growth_bytes:      EMA of per-interval memory growth (bytes)
+ * @is_high_throughput:    true while in HIGH_THROUGHPUT mode; only gates
+ *                         the idle-sleep check below (idle-sleep only
+ *                         applies in LATENCY mode).
+ * @below_threshold_count: consecutive below-threshold samples since entering
+ *                         HIGH_THROUGHPUT mode
+ * @last_activity_jiffies: jiffies value of the most recent GPU memory growth
+ *                         notification (see xe_mem_monitor_notify_activity())
+ * @last_poll_jiffies:     jiffies value of the most recent real sample taken
+ *                         by xe_mem_monitor_work(), used to detect and decay
+ *                         the EMA across skipped (slept-through) intervals
+ * @suspended:             set while the device is suspended (system or
+ *                         runtime PM); xe_mem_monitor_notify_activity() is a
+ *                         no-op while set, so that BO eviction/restore
+ *                         traffic generated by suspend/resume itself cannot
+ *                         re-arm the worker mid-transition. atomic_t because
+ *                         it is read from xe_mem_monitor_notify_activity() on
+ *                         arbitrary caller threads.
+ * @was_pending_before_suspend: whether the worker had a poll actually
+ *                         scheduled at the moment xe_mem_monitor_suspend()
+ *                         cancelled it; used by xe_mem_monitor_resume() to
+ *                         decide whether to reschedule, so that a monitor
+ *                         that was legitimately asleep before suspend stays
+ *                         asleep after resume instead of being woken
+ *                         unconditionally.
+ */
+struct xe_mem_monitor_data {
+	struct xe_device *xe;
+	struct delayed_work work;
+
+	atomic64_t prev_mem_bytes;
+	bool has_prev_sample;
+	u64 ema_growth_bytes;
+	int below_threshold_count;
+	unsigned long last_activity_jiffies;
+	unsigned long last_poll_jiffies;
+	bool is_high_throughput;
+	atomic_t suspended;
+	bool was_pending_before_suspend;
+};
+
+static void xe_mem_monitor_set_high_throughput_mode(struct xe_mem_monitor_data *mon)
+{
+	/* TODO: wire up to the actual vendor hook (adds __GFP_RETRY_MAYFAIL, TBD) */
+	drm_dbg(&mon->xe->drm,
+		 "xe_mem_monitor: switching to HIGH_THROUGHPUT mode (TBD)\n");
+	atomic_set(&mon->xe->gpu_mem_mode, XE_GPU_MEM_MODE_HIGH_THROUGHPUT);
+}
+
+static void xe_mem_monitor_set_latency_mode(struct xe_mem_monitor_data *mon)
+{
+	/* TODO: wire up to the actual vendor hook (TBD) */
+	drm_dbg(&mon->xe->drm,
+		 "xe_mem_monitor: switching to LATENCY mode (TBD)\n");
+	atomic_set(&mon->xe->gpu_mem_mode, XE_GPU_MEM_MODE_LATENCY);
+}
+
+static void xe_mem_monitor_work(struct work_struct *work)
+{
+	struct xe_mem_monitor_data *mon =
+		container_of(work, struct xe_mem_monitor_data, work.work);
+	struct xe_device *xe = mon->xe;
+	u64 current_bytes, clamped_delta;
+	u64 growth_threshold_bytes;
+	s64 delta_signed;
+	unsigned long now = jiffies;
+	unsigned long next_delay;
+
+	/*
+	 * Read the GPU memory total directly from Xe's own accounting counter.
+	 * This is the same value that drives the gpu_mem/gpu_mem_total
+	 * tracepoint, but read without any BPF or sysfs indirection.
+	 */
+	current_bytes = (u64)atomic64_read(&xe->global_total_pages) << PAGE_SHIFT;
+
+	if (!mon->has_prev_sample) {
+		drm_dbg(&xe->drm, "xe_mem_monitor: baseline = %llu MB\n",
+			current_bytes >> 20);
+		atomic64_set(&mon->prev_mem_bytes, current_bytes);
+		mon->has_prev_sample = true;
+		mon->last_poll_jiffies = now;
+		goto reschedule;
+	}
+
+	/*
+	 * If more than one nominal poll interval has elapsed since the
+	 * last real sample, the worker must have been asleep (or otherwise
+	 * delayed) for the extra time. Since no growth can occur unnoticed
+	 * while asleep (any GPU allocation activity would have woken it via
+	 * xe_mem_monitor_notify_activity()), treat each skipped interval as
+	 * an implicit zero-growth sample and fast-forward the EMA decay for
+	 * them before folding in the real delta observed below. Otherwise
+	 * stale, pre-sleep growth history would persist indefinitely across
+	 * arbitrarily long idle gaps.
+	 */
+	{
+		unsigned long poll_jiffies =
+			msecs_to_jiffies(xe_modparam.mem_monitor_poll_ms);
+		unsigned long skipped_periods = poll_jiffies ?
+			(now - mon->last_poll_jiffies) / poll_jiffies : 0;
+
+		if (skipped_periods > 1) {
+			unsigned long decay_periods = min_t(unsigned long,
+							    skipped_periods - 1,
+							    EMA_DECAY_SATURATE_PERIODS);
+
+			drm_dbg(&xe->drm,
+				"xe_mem_monitor: woke after %lu skipped poll interval(s), "
+				"fast-forwarding EMA decay by %lu\n",
+				skipped_periods - 1, decay_periods);
+
+			while (decay_periods-- > 0)
+				mon->ema_growth_bytes = (ALPHA_RETAINED *
+							 mon->ema_growth_bytes) >> ALPHA_SHIFT;
+		}
+	}
+
+	/* Clamp negative deltas (memory freed) to zero; only track growth. */
+	delta_signed = (s64)current_bytes - (s64)atomic64_read(&mon->prev_mem_bytes);
+	clamped_delta = delta_signed > 0 ? (u64)delta_signed : 0;
+
+	/* A single alpha smoothing weight is used regardless of mode. */
+	mon->ema_growth_bytes = (ALPHA_NUM * clamped_delta +
+				 ALPHA_RETAINED * mon->ema_growth_bytes)
+				>> ALPHA_SHIFT;
+
+	atomic64_set(&mon->prev_mem_bytes, current_bytes);
+	mon->last_poll_jiffies = now;
+
+	growth_threshold_bytes = (u64)xe_modparam.mem_monitor_growth_threshold_mb << 20;
+
+	if (atomic_read(&xe->gpu_mem_mode) == XE_GPU_MEM_MODE_LATENCY) {
+		if (mon->ema_growth_bytes > growth_threshold_bytes) {
+			drm_dbg(&xe->drm,
+				 "xe_mem_monitor: rapid GPU memory growth detected, delta=%llu MB, "
+				 "(EMA=%llu MB/interval > threshold=%llu MB)\n",
+				 clamped_delta >> 20,
+				 mon->ema_growth_bytes >> 20,
+				 growth_threshold_bytes >> 20);
+			xe_mem_monitor_set_high_throughput_mode(mon);
+			mon->is_high_throughput = true;
+			mon->below_threshold_count = 0;
+		}
+	} else {
+		/*
+		 * mem_monitor_debounce_count consecutive below-threshold
+		 * samples (taken at mem_monitor_poll_ms, same single
+		 * polling rate used in both modes) are required before
+		 * switching back to LATENCY mode. This also acts as the
+		 * implicit minimum dwell time in HIGH_THROUGHPUT mode.
+		 */
+		if (mon->ema_growth_bytes < growth_threshold_bytes) {
+			mon->below_threshold_count++;
+			drm_dbg(&xe->drm,
+				"xe_mem_monitor: GPU memory growth slowing "
+				"(EMA=%llu MB/interval), below-threshold sample %d/%u\n",
+				mon->ema_growth_bytes >> 20,
+				mon->below_threshold_count, xe_modparam.mem_monitor_debounce_count);
+			if (mon->below_threshold_count >= xe_modparam.mem_monitor_debounce_count) {
+				drm_dbg(&xe->drm,
+					 "xe_mem_monitor: GPU memory stable for %u "
+					 "consecutive samples\n",
+					 xe_modparam.mem_monitor_debounce_count);
+				xe_mem_monitor_set_latency_mode(mon);
+				mon->is_high_throughput = false;
+				mon->below_threshold_count = 0;
+			}
+		} else {
+			drm_dbg(&xe->drm,
+				"xe_mem_monitor: GPU memory still growing "
+				"(EMA=%llu MB/interval), resetting debounce counter\n",
+				mon->ema_growth_bytes >> 20);
+			mon->below_threshold_count = 0;
+		}
+	}
+
+reschedule:
+	if (!mon->is_high_throughput &&
+	    jiffies_to_msecs(jiffies - mon->last_activity_jiffies) >
+			xe_modparam.mem_monitor_idle_timeout_ms) {
+		drm_dbg(&xe->drm,
+			"xe_mem_monitor: no activity for %u ms, going to sleep\n",
+			xe_modparam.mem_monitor_idle_timeout_ms);
+		return;
+	}
+
+	/*
+	 * Single polling rate (mem_monitor_poll_ms) regardless of mode -
+	 * per review discussion, once HIGH_THROUGHPUT mode is entered we
+	 * don't need to re-check any faster, since mem_monitor_debounce_count
+	 * already provides the equivalent minimum dwell time at this cadence.
+	 */
+	next_delay = msecs_to_jiffies(xe_modparam.mem_monitor_poll_ms);
+	schedule_delayed_work(&mon->work, next_delay);
+}
+
+static void xe_mem_monitor_cleanup(struct drm_device *drm, void *arg)
+{
+	struct xe_mem_monitor_data *mon = arg;
+
+	cancel_delayed_work_sync(&mon->work);
+}
+
+/**
+ * xe_mem_monitor_notify_activity - notify the monitor of GPU memory changes
+ * @xe: the Xe device
+ *
+ * Called from the TTM populate/unpopulate path whenever GPU memory is
+ * allocated or freed. No-op while the device is suspended (see
+ * xe_mem_monitor_suspend()), since suspend/resume's own BO eviction/restore
+ * traffic would otherwise re-arm the worker mid-transition. Otherwise only
+ * acts when the live memory total has changed by at least
+ * ACTIVITY_MIN_DELTA_BYTES (in either direction) since the worker's last real
+ * sample, negligible trickle growth/shrink is ignored to avoid waking the
+ * worker for no meaningful reason. A significant free must still be acted on
+ * (not just growth): it resyncs prev_mem_bytes down to reality by letting the
+ * worker run once, which is required so that later real growth measured from
+ * that new, lower baseline can still be detected, otherwise prev_mem_bytes
+ * would stay stuck at a stale high-water mark that new growth might never
+ * cross. If the worker is already scheduled (delayed_work_pending()), it
+ * will read the live counter fresh when it runs and pick up whatever
+ * accumulated, so there's no need to re-schedule again here.
+ */
+void xe_mem_monitor_notify_activity(struct xe_device *xe)
+{
+	struct xe_mem_monitor_data *mon = xe->mem_monitor;
+	u64 current_bytes;
+	s64 delta_signed, abs_delta;
+
+	if (!mon)
+		return;
+
+	if (atomic_read(&mon->suspended))
+		return;
+
+	current_bytes = (u64)atomic64_read(&xe->global_total_pages) << PAGE_SHIFT;
+	delta_signed = (s64)current_bytes - (s64)atomic64_read(&mon->prev_mem_bytes);
+	abs_delta = delta_signed < 0 ? -delta_signed : delta_signed;
+
+	if (abs_delta < ACTIVITY_MIN_DELTA_BYTES)
+		return;
+
+	mon->last_activity_jiffies = jiffies;
+
+	if (delayed_work_pending(&mon->work))
+		return;
+
+	schedule_delayed_work(&mon->work, 0);
+}
+
+/**
+ * xe_mem_monitor_suspend - stop the polling worker for a PM transition
+ * @xe: the Xe device
+ *
+ * Sets the suspended flag first so any xe_mem_monitor_notify_activity()
+ * call racing with (or generated by) the suspend sequence itself (e.g.
+ * xe_bo_evict_all()) is a no-op, then synchronously cancels the worker.
+ * Whether a poll was actually pending at that point is recorded so
+ * xe_mem_monitor_resume() can decide whether to reschedule.
+ */
+void xe_mem_monitor_suspend(struct xe_device *xe)
+{
+	struct xe_mem_monitor_data *mon = xe->mem_monitor;
+
+	if (!mon)
+		return;
+
+	atomic_set(&mon->suspended, 1);
+	mon->was_pending_before_suspend = cancel_delayed_work_sync(&mon->work);
+}
+
+/**
+ * xe_mem_monitor_resume - resume the polling worker after a PM transition
+ * @xe: the Xe device
+ *
+ * Only reschedules the worker if it was actually pending at the time
+ * xe_mem_monitor_suspend() cancelled it. If the monitor had already gone to
+ * sleep (idle timeout) before suspend, it stays asleep across the
+ * transition rather than being unconditionally woken.
+ */
+void xe_mem_monitor_resume(struct xe_device *xe)
+{
+	struct xe_mem_monitor_data *mon = xe->mem_monitor;
+
+	if (!mon)
+		return;
+
+	atomic_set(&mon->suspended, 0);
+
+	if (mon->was_pending_before_suspend) {
+		unsigned long delay = msecs_to_jiffies(xe_modparam.mem_monitor_poll_ms);
+
+		schedule_delayed_work(&mon->work, delay);
+	}
+}
+
+/**
+ * xe_mem_monitor_init - initialise and start the GPU memory monitor
+ * @xe: the Xe device
+ *
+ * Allocates monitor state, registers a cleanup action via drmm, and
+ * schedules the first poll after one poll interval.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_mem_monitor_init(struct xe_device *xe)
+{
+	struct xe_mem_monitor_data *mon;
+	int ret;
+
+	if (!xe_modparam.mem_monitor_enabled) {
+		drm_info(&xe->drm,
+			 "xe_mem_monitor: disabled via mem_monitor_enabled module parameter\n");
+		return 0;
+	}
+
+	mon = drmm_kzalloc(&xe->drm, sizeof(*mon), GFP_KERNEL);
+	if (!mon)
+		return -ENOMEM;
+
+	mon->xe = xe;
+	atomic_set(&xe->gpu_mem_mode, XE_GPU_MEM_MODE_LATENCY);
+	mon->last_activity_jiffies = jiffies;
+	INIT_DELAYED_WORK(&mon->work, xe_mem_monitor_work);
+
+	xe->mem_monitor = mon;
+
+	ret = drmm_add_action_or_reset(&xe->drm, xe_mem_monitor_cleanup, mon);
+	if (ret)
+		return ret;
+
+	schedule_delayed_work(&mon->work,
+			      msecs_to_jiffies(xe_modparam.mem_monitor_poll_ms));
+
+	drm_info(&xe->drm,
+		 "xe_mem_monitor: initialized: poll=%u ms, "
+		 "threshold=%u MB, alpha=0.%03u, "
+		 "debounce=%u, idle_timeout=%u ms\n",
+		 xe_modparam.mem_monitor_poll_ms,
+		 xe_modparam.mem_monitor_growth_threshold_mb,
+		 (ALPHA_NUM * 1000U + (1U << (ALPHA_SHIFT - 1))) >> ALPHA_SHIFT,
+		 xe_modparam.mem_monitor_debounce_count,
+		 xe_modparam.mem_monitor_idle_timeout_ms);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_mem_monitor.h b/drivers/gpu/drm/xe/xe_mem_monitor.h
new file mode 100644
index 000000000000..846c0628ed93
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mem_monitor.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_MEM_MONITOR_H_
+#define _XE_MEM_MONITOR_H_
+
+struct xe_device;
+
+/**
+ * enum xe_gpu_mem_mode - GPU memory allocation mode controlled by xe_mem_monitor
+ * @XE_GPU_MEM_MODE_LATENCY: default mode; vendor hook strips reclaim flags
+ *                           from high-order TTM allocations for low latency.
+ * @XE_GPU_MEM_MODE_HIGH_THROUGHPUT: entered during rapid GPU memory growth;
+ *                           reclaim is allowed (and __GFP_RETRY_MAYFAIL added)
+ *                           so the kernel can shrink the page cache to satisfy
+ *                           high-order allocations.
+ */
+enum xe_gpu_mem_mode {
+	XE_GPU_MEM_MODE_LATENCY = 0,
+	XE_GPU_MEM_MODE_HIGH_THROUGHPUT,
+};
+
+/* Default values for module parameters, see xe_module.h/xe_module.c */
+#define XE_MEM_MONITOR_DEFAULT_ENABLED				false
+#define XE_MEM_MONITOR_DEFAULT_GROWTH_THRESHOLD_MB		250
+#define XE_MEM_MONITOR_DEFAULT_POLL_MS				2000
+#define XE_MEM_MONITOR_DEFAULT_DEBOUNCE_COUNT			5
+#define XE_MEM_MONITOR_DEFAULT_IDLE_TIMEOUT_MS			10000
+
+/*
+ * Minimum enforced value for mem_monitor_poll_ms (no maximum is
+ * enforced). Guards against a misconfigured/absurdly low value (e.g. 0)
+ * causing the delayed work to effectively busy-loop.
+ */
+#define XE_MEM_MONITOR_MIN_POLL_MS				500
+
+#ifdef CONFIG_DRM_XE_MEM_MONITOR
+
+int xe_mem_monitor_init(struct xe_device *xe);
+
+/*
+ * Notify the monitor that GPU allocation activity occurred (called from the
+ * TTM populate/unpopulate path). Updates the last-activity timestamp and
+ * re-arms the polling worker if it had gone to sleep due to inactivity.
+ */
+void xe_mem_monitor_notify_activity(struct xe_device *xe);
+
+/*
+ * Suspend/resume the polling worker across system and runtime PM
+ * transitions. Must be called from the same suspend/resume paths for
+ * the same reason: schedule_delayed_work() on system_wq is not freezable, so
+ * without this the worker could keep firing (or be re-armed by the BO
+ * eviction/restore traffic that suspend/resume itself generates) across the
+ * transition.
+ */
+void xe_mem_monitor_suspend(struct xe_device *xe);
+void xe_mem_monitor_resume(struct xe_device *xe);
+
+#else /* CONFIG_DRM_XE_MEM_MONITOR */
+
+static inline int xe_mem_monitor_init(struct xe_device *xe)
+{
+	return 0;
+}
+
+static inline void xe_mem_monitor_notify_activity(struct xe_device *xe)
+{
+}
+
+static inline void xe_mem_monitor_suspend(struct xe_device *xe)
+{
+}
+
+static inline void xe_mem_monitor_resume(struct xe_device *xe)
+{
+}
+
+#endif /* CONFIG_DRM_XE_MEM_MONITOR */
+
+#endif /* _XE_MEM_MONITOR_H_ */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4878463734eb..a49b0c0f958b 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -15,6 +15,7 @@
 #include "xe_configfs.h"
 #include "xe_gpufreqtracer.h"
 #include "xe_hw_fence.h"
+#include "xe_mem_monitor.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_observation.h"
@@ -45,6 +46,13 @@ struct xe_modparam xe_modparam = {
 	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
 #ifdef CONFIG_DRM_XE_GPUFREQTRACER
 	.gpufreq_monitoring_interval_ms = XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS,
+#endif
+#ifdef CONFIG_DRM_XE_MEM_MONITOR
+	.mem_monitor_enabled =	XE_MEM_MONITOR_DEFAULT_ENABLED,
+	.mem_monitor_growth_threshold_mb = XE_MEM_MONITOR_DEFAULT_GROWTH_THRESHOLD_MB,
+	.mem_monitor_poll_ms = XE_MEM_MONITOR_DEFAULT_POLL_MS,
+	.mem_monitor_debounce_count = XE_MEM_MONITOR_DEFAULT_DEBOUNCE_COUNT,
+	.mem_monitor_idle_timeout_ms = XE_MEM_MONITOR_DEFAULT_IDLE_TIMEOUT_MS,
 #endif
 	/* the rest are 0 by default */
 };
@@ -108,6 +116,53 @@ MODULE_PARM_DESC(gpufreq_monitoring_interval_ms,
 		 __stringify(XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS) ")");
 #endif
 
+#ifdef CONFIG_DRM_XE_MEM_MONITOR
+module_param_named_unsafe(mem_monitor_enabled, xe_modparam.mem_monitor_enabled, bool, 0444);
+MODULE_PARM_DESC(mem_monitor_enabled,
+		 "Master enable switch for the GPU memory growth monitor and its "
+		 "vendor hooks. Intended to be set as a kernel boot argument"
+		 " [default=" __stringify(XE_MEM_MONITOR_DEFAULT_ENABLED) " (enabled)]");
+
+module_param_named(mem_monitor_growth_threshold_mb,
+		   xe_modparam.mem_monitor_growth_threshold_mb, uint, 0644);
+MODULE_PARM_DESC(mem_monitor_growth_threshold_mb,
+		 "GPU memory growth EMA threshold in MiB per interval that triggers "
+		 "HIGH_THROUGHPUT mode [default="
+		 __stringify(XE_MEM_MONITOR_DEFAULT_GROWTH_THRESHOLD_MB) "])");
+
+static int param_set_mem_monitor_poll_ms(const char *val, const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, XE_MEM_MONITOR_MIN_POLL_MS, UINT_MAX);
+}
+
+static const struct kernel_param_ops param_ops_mem_monitor_poll_ms = {
+	.set = param_set_mem_monitor_poll_ms,
+	.get = param_get_uint,
+};
+
+module_param_cb(mem_monitor_poll_ms, &param_ops_mem_monitor_poll_ms,
+		&xe_modparam.mem_monitor_poll_ms, 0644);
+MODULE_PARM_DESC(mem_monitor_poll_ms,
+		 "GPU memory monitor polling interval in milliseconds, minimum "
+		 __stringify(XE_MEM_MONITOR_MIN_POLL_MS) "ms "
+		 "[default=" __stringify(XE_MEM_MONITOR_DEFAULT_POLL_MS) "])");
+
+module_param_named(mem_monitor_debounce_count,
+		   xe_modparam.mem_monitor_debounce_count, uint, 0644);
+MODULE_PARM_DESC(mem_monitor_debounce_count,
+		 "Number of consecutive below-threshold samples required before "
+		 "switching back to LATENCY mode [default="
+		 __stringify(XE_MEM_MONITOR_DEFAULT_DEBOUNCE_COUNT) "])");
+
+module_param_named(mem_monitor_idle_timeout_ms,
+		   xe_modparam.mem_monitor_idle_timeout_ms, uint, 0644);
+MODULE_PARM_DESC(mem_monitor_idle_timeout_ms,
+		 "Time in milliseconds with no GPU allocation activity in LATENCY "
+		 "mode after which the monitor's polling worker goes to sleep "
+		 "(woken again on the next allocation) [default="
+		 __stringify(XE_MEM_MONITOR_DEFAULT_IDLE_TIMEOUT_MS) "])");
+#endif
+
 static int xe_check_nomodeset(void)
 {
 	if (drm_firmware_drivers_only())
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 6a64ee221da6..24e0b52e48ca 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -26,6 +26,19 @@ struct xe_modparam {
 #ifdef CONFIG_DRM_XE_GPUFREQTRACER
 	u32 gpufreq_monitoring_interval_ms;
 #endif
+#ifdef CONFIG_DRM_XE_MEM_MONITOR
+	/*
+	 * Master enable switch for the GPU memory growth monitor and its
+	 * associated vendor hooks. Defaults is set in xe_mem_monitor.h
+	 * (XE_MEM_MONITOR_DEFAULT_ENABLED). Intended to be
+	 * settable as a kernel boot argument
+	 */
+	bool mem_monitor_enabled;
+	u32 mem_monitor_growth_threshold_mb;
+	u32 mem_monitor_poll_ms;
+	u32 mem_monitor_debounce_count;
+	u32 mem_monitor_idle_timeout_ms;
+#endif
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b291265d18fc..a330a42ea187 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -24,6 +24,7 @@
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_mem_monitor.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
@@ -129,6 +130,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
 	xe_gpufreqtracer_suspend_workers(xe);
+	xe_mem_monitor_suspend(xe);
 
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
@@ -219,6 +221,7 @@ int xe_pm_resume(struct xe_device *xe)
 		goto err;
 
 	xe_gpufreqtracer_resume_workers(xe);
+	xe_mem_monitor_resume(xe);
 
 	xe_pxp_pm_resume(xe->pxp);
 
@@ -515,6 +518,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	xe_rpm_lockmap_acquire(xe);
 
 	xe_gpufreqtracer_suspend_workers(xe);
+	xe_mem_monitor_suspend(xe);
 
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
@@ -616,6 +620,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	}
 
 	xe_gpufreqtracer_resume_workers(xe);
+	xe_mem_monitor_resume(xe);
 
 	xe_pxp_pm_resume(xe->pxp);
 
-- 
2.34.1

