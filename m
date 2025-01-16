Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42992C02188
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C89310EA2A;
	Thu, 16 Jan 2025 23:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHSdKGPS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD5A10E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068862; x=1768604862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MsohCofWaiEY1SCmsLK+koscI73AQSCUW+YofGw4f6o=;
 b=EHSdKGPSzibnQnVh65g01U4ln3L2PDUZcEXyKVqSD+l0FQEiP++VZVDT
 WtfEPNHRlQTJmdeZGac1HRY+tY99nJxhSfwlk+WxgcqZsdAfrDuh0Ck1n
 68Ka6S+KfMpB3IyCS0V9zCF158Mnz+O7JXju+nBN+3AP2R3x0P6LuXIx4
 1L2Hys0x9R5JT8BBO6ov5aspD3TES+WR38LrazRTqPa0F+VzbvxZYT0WW
 tUsqIXZsfYLOVkE/Wxp1C3aw/k+9qhutwNhS+5oWOVRCsvzBPEJDOpJ85
 qhtWbBt57yoLgaqxi//TRXlJPZsTR88Rh/aedtKGbSME9PAgX7yEB28mZ Q==;
X-CSE-ConnectionGUID: eeBBgkXvT2mUDHYEJNu2pg==
X-CSE-MsgGUID: eECZQAwbS8OyihgcCHQ/cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37364135"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37364135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:42 -0800
X-CSE-ConnectionGUID: sEeNkZFCSDmkGgTdkfUTvQ==
X-CSE-MsgGUID: Ov6K84l9SGuYOenN6TatYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136474363"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 7/7] drm/xe/pmu: Add GT C6 events
Date: Thu, 16 Jan 2025 15:07:18 -0800
Message-ID: <20250116230718.82460-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116230718.82460-1-lucas.demarchi@intel.com>
References: <20250116230718.82460-1-lucas.demarchi@intel.com>
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Provide a PMU interface for GT C6 residency counters. The implementation
is ported over from the i915 PMU code. Residency is provided in units of
ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).

Sample usage and output:

	$ perf list | grep gt-c6
	  xe_0000_00_02.0/gt-c6-residency/                   [Kernel PMU event]

	$ tail /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency*
	==> /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency <==
	event=0x01

	==> /sys/bus/event_source/devices/xe_0000_00_02.0/events/gt-c6-residency.unit <==
	ms

	$ perf stat -e xe_0000_00_02.0/gt-c6-residency,gt=0/ -I1000
	#           time             counts unit events
	     1.001196056              1,001 ms   xe_0000_00_02.0/gt-c6-residency,gt=0/
	     2.005216219              1,003 ms   xe_0000_00_02.0/gt-c6-residency,gt=0/

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Besides the rebase, that changed a lot how the event was added,
here is a summary of other changes:

- Use xe_pm_runtime_get_if_active() when reading
  xe_gt_idle_residency_msec() as there's not guarantee it will not be
  suspended anymore by the time it reads the counter

- Drop sample[] from the pmu struct and only use the prev/counter from
  the perf_event struct. This avoids mixing the counter reported to 2
  separate clients.

- Drop time ktime helpers and just use what's provided by
  include/linux/ktime.h

 drivers/gpu/drm/xe/xe_pmu.c | 56 +++++++++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index c2af82ec3f793..37df9d3cc110c 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -11,6 +11,7 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_idle.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
 #include "xe_macros.h"
@@ -117,16 +118,50 @@ static int xe_pmu_event_init(struct perf_event *event)
 	return 0;
 }
 
-static u64 __xe_pmu_event_read(struct perf_event *event)
+static u64 read_gt_c6_residency(struct xe_pmu *pmu, struct xe_gt *gt, u64 prev)
 {
-	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
+	struct xe_device *xe = gt_to_xe(gt);
+	unsigned long flags;
+	ktime_t t0;
+	s64 delta;
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		u64 val = xe_gt_idle_residency_msec(&gt->gtidle);
+
+		xe_pm_runtime_put(xe);
+
+		return val;
+	}
+
+	/*
+	 * Estimate the idle residency by looking at the time the device was
+	 * suspended: should be good enough as long as the sampling frequency is
+	 * 2x or more than the suspend frequency.
+	 */
+	raw_spin_lock_irqsave(&pmu->lock, flags);
+	t0 = pmu->suspend_timestamp[gt->info.id];
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
+
+	delta = ktime_ms_delta(ktime_get(), t0);
+
+	return prev + delta;
+}
+
+static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
+{
+	struct xe_pmu *pmu = container_of(event->pmu, typeof(*pmu), base);
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
 	struct xe_gt *gt = event_to_gt(event);
-	u64 val = 0;
 
 	if (!gt)
-		return 0;
+		return prev;
+
+	switch (config_to_event_id(event->attr.config)) {
+	case XE_PMU_EVENT_GT_C6_RESIDENCY:
+		return read_gt_c6_residency(pmu, gt, prev);
+	}
 
-	return val;
+	return prev;
 }
 
 static void xe_pmu_event_update(struct perf_event *event)
@@ -136,10 +171,11 @@ static void xe_pmu_event_update(struct perf_event *event)
 
 	prev = local64_read(&hwc->prev_count);
 	do {
-		new = __xe_pmu_event_read(event);
+		new = __xe_pmu_event_read(event, prev);
 	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
 
-	local64_add(new - prev, &event->count);
+	if (new > prev)
+		local64_add(new - prev, &event->count);
 }
 
 static void xe_pmu_event_read(struct perf_event *event)
@@ -162,7 +198,7 @@ static void xe_pmu_enable(struct perf_event *event)
 	 * for all listeners. Even when the event was already enabled and has
 	 * an existing non-zero value.
 	 */
-	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
+	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event, 0));
 }
 
 static void xe_pmu_event_start(struct perf_event *event, int flags)
@@ -267,6 +303,10 @@ static const struct attribute_group pmu_events_attr_group = {
 
 static void set_supported_events(struct xe_pmu *pmu)
 {
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+
+	if (!xe->info.skip_guc_pc)
+		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
 }
 
 /**
-- 
2.48.0

