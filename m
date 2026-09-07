Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8453C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 06:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3CA10E48A;
	Mon,  7 Sep 2026 06:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuqnlEru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468B710E48A
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788763642; x=1820299642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oqat8xX13zWcpqdjBDbXd5TuKEfW6rWOSJbgRCvv2OQ=;
 b=fuqnlEru/2Ke8UssbYgJUGhObry3VM0red9FAwtaD0wODcD13bseaPYE
 2PION29qw40dTUwoJNqp6j9CyfAxLjtp9sbdla314sNC5No/Ln3H5CUMz
 pO2HVS0b+Mr8rBlfjgKNGVjvtk9skwnSS184CXYCMa1SkxlaLZ4qkUevd
 xXZixlAFYCAbMS/yzBvJgQig7JobUiHPXpY+ERpEecoFfdIJuPGJuOaV8
 yeYKpZubzb74OQ4b40y1azE6wxTSkHAdH07s9DPi6domt72iWJ65l0V4W
 e5yuw5T7zItoS2uI6DH7xhj9fm43iGxF1fvIRqLbGDdfgug5GQ+7mFvcF Q==;
X-CSE-ConnectionGUID: Ya3kWitoQvKTEs4Km2m4mQ==
X-CSE-MsgGUID: 0yo5Go9BRZ6leKfu5Qqk5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="76717872"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="76717872"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:47:22 -0700
X-CSE-ConnectionGUID: Gp3eEP7NQPmum9cTsMRu4w==
X-CSE-MsgGUID: lkegJRlCR5Wil2TDq3Fc+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="264434176"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2026 23:47:19 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: S Sebinraj <s.sebinraj@intel.corp-partner.google.com>,
 Carlos Santa <carlos.santa@intel.com>, Erin Park <erin.park@intel.com>,
 Ryan Neph <ryanneph@google.com>, Renato Pereyra <renatopereyra@google.com>,
 S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 4/4] RFC: ANDROID: drm/xe: Gate mem_monitor wake ups on order
 9 external fragmentation
Date: Mon,  7 Sep 2026 11:37:37 +0530
Message-Id: <20260907060737.3636824-5-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907060737.3636824-1-s.sebinraj@intel.com>
References: <20260907060737.3636824-1-s.sebinraj@intel.com>
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

From: S Sebinraj <s.sebinraj@intel.corp-partner.google.com>

xe_mem_monitor_notify_activity() previously woke the polling worker
based only on a raw byte-level delta (ACTIVITY_MIN_DELTA_BYTES), which
doesn't capture whether order 9 (2M) TTM allocations are actually
under any pressure.

Add xe_mem_monitor_zone_order9_free_bytes(), which reads the amount of
order 9 or larger free memory directly from struct zone's free_area
counts.

Add xe_mem_monitor_order9_supply_low(), which walks the populated zones
and returns true if any zone's order 9 free supply has dropped below
an adaptive floor. The floor is mon->max_delta_bytes, the largest
growth sample xe_mem_monitor_work() has ever observed on this device
clamped between the mem_monitor_order9_supply_min_mb and
mem_monitor_order9_supply_max_mb module parameters (in MiB).

Adapting the floor to the largest growth sample actually observed
avoids false positives from a single large but otherwise harmless
allocation burst when overall order 9 supply is still healthy.
The upper clamp (mem_monitor_order9_supply_max_mb) stops a single
anomalously large allocation from permanently pinning the floor too high.

Use this as an additional guard in xe_mem_monitor_notify_activity
both the existing byte-delta check and this free-supply check must
now indicate pressure before the worker is woken.

Test: Tested by running WLEU on a fragmented system and confirmed the
      worker is only woken when some populated zone's order-9 free
      supply drops below ORDER9_SUPPLY_MIN_PCT of total RAM.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Erin Park <erin.park@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Cc: Renato Pereyra <renatopereyra@google.com>
Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_mem_monitor.c | 115 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_mem_monitor.h |   2 +
 drivers/gpu/drm/xe/xe_module.c      |  22 ++++++
 drivers/gpu/drm/xe/xe_module.h      |   2 +
 4 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mem_monitor.c b/drivers/gpu/drm/xe/xe_mem_monitor.c
index a34cafe56976..24458af2700c 100644
--- a/drivers/gpu/drm/xe/xe_mem_monitor.c
+++ b/drivers/gpu/drm/xe/xe_mem_monitor.c
@@ -59,9 +59,11 @@
 #include "xe_mem_monitor.h"
 
 #include <linux/atomic.h>
+#include <linux/compiler.h>
 #include <linux/debugfs.h>
 #include <linux/jiffies.h>
 #include <linux/minmax.h>
+#include <linux/mmzone.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -129,6 +131,13 @@
  * @last_poll_jiffies:     jiffies value of the most recent real sample taken
  *                         by xe_mem_monitor_work(), used to detect and decay
  *                         the EMA across skipped (slept-through) intervals
+ * @max_delta_bytes:       largest clamped_delta (growth-only, per real
+ *                         sample) ever observed by xe_mem_monitor_work(),
+ *                         used by xe_mem_monitor_order9_supply_low() to
+ *                         adapt its floor upward to this workload's
+ *                         demonstrated behaviour (clamped between
+ *                         mem_monitor_order9_supply_min_mb and
+ *                         mem_monitor_order9_supply_max_mb there).
  * @suspended:             set while the device is suspended (system or
  *                         runtime PM); xe_mem_monitor_notify_activity() is a
  *                         no-op while set, so that BO eviction/restore
@@ -155,6 +164,7 @@ struct xe_mem_monitor_data {
 	unsigned long last_activity_jiffies;
 	unsigned long last_poll_jiffies;
 	bool is_high_throughput;
+	u64 max_delta_bytes;
 	atomic_t suspended;
 	bool was_pending_before_suspend;
 
@@ -186,6 +196,26 @@ static void xe_mem_monitor_set_latency_mode(struct xe_mem_monitor_data *mon)
 	trace_xe_gpu_mem_mode_switch(XE_GPU_MEM_MODE_LATENCY, mon->ema_growth_bytes);
 }
 
+/*
+ * Returns the total amount of memory (bytes) available as order-9 (2M) or
+ * larger contiguous blocks in the given zone. Computed directly from
+ * struct zone's free_area[] counts (see <linux/mmzone.h>)
+ */
+static u64 xe_mem_monitor_zone_order9_free_bytes(struct zone *zone)
+{
+	unsigned long free_blocks_suitable = 0;
+	unsigned int order;
+
+	for (order = 9; order < NR_PAGE_ORDERS; order++) {
+		/* nr_free is lockless/diagnostic-only */
+		unsigned long blocks = data_race(zone->free_area[order].nr_free);
+
+		free_blocks_suitable += blocks << (order - 9);
+	}
+
+	return (u64)free_blocks_suitable << (9 + PAGE_SHIFT);
+}
+
 static void xe_mem_monitor_work(struct work_struct *work)
 {
 	struct xe_mem_monitor_data *mon =
@@ -255,6 +285,8 @@ static void xe_mem_monitor_work(struct work_struct *work)
 				 ALPHA_RETAINED * mon->ema_growth_bytes)
 				>> ALPHA_SHIFT;
 
+	mon->max_delta_bytes = max_t(u64, mon->max_delta_bytes, clamped_delta);
+
 	atomic64_set(&mon->info.current_bytes, current_bytes);
 	atomic64_set(&mon->info.delta_signed, delta_signed);
 
@@ -348,6 +380,58 @@ void xe_mem_monitor_fini(struct xe_device *xe)
 	drm_info(&xe->drm, "xe_mem_monitor: stopped");
 }
 
+/*
+ * Companion check to ACTIVITY_MIN_DELTA_BYTES for
+ * xe_mem_monitor_notify_activity(): a large byte-level delta doesn't
+ * necessarily mean order-9 (2M) allocations are under any real pressure, so
+ * this looks instead at whether any single populated zone's absolute
+ * order-9-and-larger free supply has dropped below the adaptive floor
+ * clamp_t(mon->max_delta_bytes, mem_monitor_order9_supply_min_mb,
+ * mem_monitor_order9_supply_max_mb) independent of the size of whatever
+ * delta triggered this call, since a single large delta is not itself
+ * evidence that supply is actually running low. Taking mon->max_delta_bytes
+ * (the largest growth sample ever observed on this device, see
+ * xe_mem_monitor_work()) as the basis, clamped between the two module
+ * parameters, means the floor adapts upward to this workload's own
+ * demonstrated behaviour without being able to grow unbounded from a
+ * single anomalous allocation.
+ */
+#if IS_ENABLED(CONFIG_COMPACTION)
+static bool xe_mem_monitor_order9_supply_low(struct xe_mem_monitor_data *mon)
+{
+	struct xe_device *xe = mon->xe;
+	struct pglist_data *pgdat = NODE_DATA(0);
+	u64 min_free_bytes = clamp_t(u64, mon->max_delta_bytes,
+				     (u64)xe_modparam.mem_monitor_order9_supply_min_mb << 20,
+				     (u64)xe_modparam.mem_monitor_order9_supply_max_mb << 20);
+	unsigned int z;
+
+	for (z = 0; z < MAX_NR_ZONES; z++) {
+		struct zone *zone = &pgdat->node_zones[z];
+
+		if (!populated_zone(zone))
+			continue;
+
+		if (xe_mem_monitor_zone_order9_free_bytes(zone) < min_free_bytes) {
+			drm_dbg(&xe->drm,
+				"xe_mem_monitor: zone=%s order9_free=%llu MB < min=%llu MB\n",
+				zone->name,
+				xe_mem_monitor_zone_order9_free_bytes(zone) >> 20,
+				min_free_bytes >> 20);
+			return true;
+		}
+	}
+
+	return false;
+}
+#else
+static inline bool xe_mem_monitor_order9_supply_low(struct xe_mem_monitor_data *mon)
+{
+	/* No zone data available - don't gate on it. */
+	return true;
+}
+#endif
+
 /**
  * xe_mem_monitor_notify_activity - notify the monitor of GPU memory changes
  * @xe: the Xe device
@@ -367,6 +451,12 @@ void xe_mem_monitor_fini(struct xe_device *xe)
  * cross. If the worker is already scheduled (delayed_work_pending()), it
  * will read the live counter fresh when it runs and pick up whatever
  * accumulated, so there's no need to re-schedule again here.
+ *
+ * As a further guard, even a significant byte-level change is ignored unless
+ * xe_mem_monitor_order9_supply_low() also reports that some populated
+ * zone's order-9-and-larger free supply has dropped below the adaptive
+ * floor described there. A byte-level delta alone doesn't imply 2M
+ * allocations are under any real pressure.
  */
 void xe_mem_monitor_notify_activity(struct xe_device *xe)
 {
@@ -387,11 +477,14 @@ void xe_mem_monitor_notify_activity(struct xe_device *xe)
 	if (abs_delta < ACTIVITY_MIN_DELTA_BYTES)
 		return;
 
-	mon->last_activity_jiffies = jiffies;
-
 	if (delayed_work_pending(&mon->work))
 		return;
 
+	if (!xe_mem_monitor_order9_supply_low(mon))
+		return;
+
+	mon->last_activity_jiffies = jiffies;
+
 	schedule_delayed_work(&mon->work, 0);
 }
 
@@ -525,15 +618,29 @@ static int info_show(struct seq_file *s, void *data)
 {
 	struct xe_device *xe = s->private;
 	struct xe_mem_monitor_data *mon = xe->mem_monitor;
+	int mode = atomic_read(&xe->gpu_mem_mode);
+	struct pglist_data *pgdat = NODE_DATA(0);
+	unsigned long long order9_free_bytes = 0;
 
 	if (!mon)
 		return 1;
 
-	seq_printf(s, "current=%llu MB, delta=%lld MB, EMA=%llu MB mode=%d\n",
+	for (int z = 0; z < MAX_NR_ZONES; z++) {
+		struct zone *zone = &pgdat->node_zones[z];
+
+		if (!populated_zone(zone))
+			continue;
+		order9_free_bytes += xe_mem_monitor_zone_order9_free_bytes(zone);
+	}
+
+	seq_printf(s, "current=%llu MB, delta=%lld MB, EMA=%llu MB mode=%s, alpha=0.%03u, "
+		   "order9_free_total=%llu MB\n",
 		   atomic64_read(&mon->info.current_bytes) >> 20,
 		   atomic64_read(&mon->info.delta_signed) >> 20,
 		   mon->ema_growth_bytes >> 20,
-		   atomic_read(&xe->gpu_mem_mode));
+		   mode == XE_GPU_MEM_MODE_LATENCY ? "latency" : "throughput",
+		   (ALPHA_NUM * 1000U + (1U << (ALPHA_SHIFT - 1))) >> ALPHA_SHIFT,
+		   order9_free_bytes >> 20);
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(info);
diff --git a/drivers/gpu/drm/xe/xe_mem_monitor.h b/drivers/gpu/drm/xe/xe_mem_monitor.h
index c617c10c1a12..a30fabd5a8ea 100644
--- a/drivers/gpu/drm/xe/xe_mem_monitor.h
+++ b/drivers/gpu/drm/xe/xe_mem_monitor.h
@@ -28,6 +28,8 @@ enum xe_gpu_mem_mode {
 #define XE_MEM_MONITOR_DEFAULT_POLL_MS				2000
 #define XE_MEM_MONITOR_DEFAULT_DEBOUNCE_COUNT			5
 #define XE_MEM_MONITOR_DEFAULT_IDLE_TIMEOUT_MS			10000
+#define XE_MEM_MONITOR_DEFAULT_ORDER9_SUPPLY_MIN_MB		512
+#define XE_MEM_MONITOR_DEFAULT_ORDER9_SUPPLY_MAX_MB		1024
 
 /*
  * Minimum enforced value for mem_monitor_poll_ms (no maximum is
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index a38776734544..69825baf100c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -54,6 +54,8 @@ struct xe_modparam xe_modparam = {
 	.mem_monitor_poll_ms = XE_MEM_MONITOR_DEFAULT_POLL_MS,
 	.mem_monitor_debounce_count = XE_MEM_MONITOR_DEFAULT_DEBOUNCE_COUNT,
 	.mem_monitor_idle_timeout_ms = XE_MEM_MONITOR_DEFAULT_IDLE_TIMEOUT_MS,
+	.mem_monitor_order9_supply_min_mb = XE_MEM_MONITOR_DEFAULT_ORDER9_SUPPLY_MIN_MB,
+	.mem_monitor_order9_supply_max_mb = XE_MEM_MONITOR_DEFAULT_ORDER9_SUPPLY_MAX_MB,
 #endif
 	/* the rest are 0 by default */
 };
@@ -162,6 +164,26 @@ MODULE_PARM_DESC(mem_monitor_idle_timeout_ms,
 		 "mode after which the monitor's polling worker goes to sleep "
 		 "(woken again on the next allocation) [default="
 		 __stringify(XE_MEM_MONITOR_DEFAULT_IDLE_TIMEOUT_MS) "])");
+
+module_param_named(mem_monitor_order9_supply_min_mb,
+		   xe_modparam.mem_monitor_order9_supply_min_mb, uint, 0644);
+MODULE_PARM_DESC(mem_monitor_order9_supply_min_mb,
+		 "Minimum order-9-and-larger free supply, in MiB, required per "
+		 "populated zone before a significant GPU memory change wakes the "
+		 "monitor's polling worker. The effective floor actually used is "
+		 "the largest single growth sample ever observed by the worker, "
+		 "clamped between this value and mem_monitor_order9_supply_max_mb, "
+		 "so it adapts to this workload's own demonstrated behaviour without "
+		 "growing unbounded from a single anomalous allocation "
+		 "[default=" __stringify(XE_MEM_MONITOR_DEFAULT_ORDER9_SUPPLY_MIN_MB) "])");
+
+module_param_named(mem_monitor_order9_supply_max_mb,
+		   xe_modparam.mem_monitor_order9_supply_max_mb, uint, 0644);
+MODULE_PARM_DESC(mem_monitor_order9_supply_max_mb,
+		 "Upper bound, in MiB, on the adaptive order-9 free supply floor "
+		 "described under mem_monitor_order9_supply_min_mb - caps how high "
+		 "a single unusually large growth sample can permanently push that "
+		 "floor [default=" __stringify(XE_MEM_MONITOR_DEFAULT_ORDER9_SUPPLY_MAX_MB) "])");
 #endif
 
 static int xe_check_nomodeset(void)
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 24e0b52e48ca..19d0de96e078 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -38,6 +38,8 @@ struct xe_modparam {
 	u32 mem_monitor_poll_ms;
 	u32 mem_monitor_debounce_count;
 	u32 mem_monitor_idle_timeout_ms;
+	u32 mem_monitor_order9_supply_min_mb;
+	u32 mem_monitor_order9_supply_max_mb;
 #endif
 };
 
-- 
2.34.1

