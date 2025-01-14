Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19627C02180
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 03:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36A810E44E;
	Tue, 14 Jan 2025 03:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7uS1mct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17E110E44E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 03:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736824717; x=1768360717;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H8NmKd4NR5kWU2UaZ2po/JDCHLoRYAeJIWvp/l+IGnM=;
 b=S7uS1mctW4ofQF5UpJsfREztX50oQ5x1idd7nQRTeSRm1F/njPfu94jW
 xBu4doWESLbiA3pFA+PxBiVlDE8AgNSx8lGRGPkA/4PT3fOfinOO/sXSS
 3Fna5P4PHqb1dnhG16no84qDIxVNXMmsYfrPaGgtxdA6nGgXM9kmWJ2JG
 ziSohdBkhXx6RmYrJbLH825eB63GOnVs9Q3P387PXgsSsIHo5tI+M3Y7m
 1Z7SvlENgCqrb3D3yqhqnstJplVQqJVJG1/QTjvvWJtOAbjuDfEiDHGLs
 S4hhY4bvSV7Fx+1X9HzFBiOQFV7IqhjAGRhk7PuhcXrYwc3mQcAzLKGmV Q==;
X-CSE-ConnectionGUID: Zu8LkQawSd6W1wNR3BJCgA==
X-CSE-MsgGUID: BskmvXBYTxOk34z7LykB0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47775259"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="47775259"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 19:18:36 -0800
X-CSE-ConnectionGUID: ozx2PZsFTIKlhUw+pz2F5g==
X-CSE-MsgGUID: 9bA0azc7TGGvEBmEhuQ3sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135559861"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 19:18:35 -0800
Date: Mon, 13 Jan 2025 21:18:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v12 3/4] drm/xe/pmu: Add GT C6 events
Message-ID: <6ibszdh7bmqn3bkfpb5q5lcmm4lo672nhrl2x243whcf4lm4l4@t3crdwhzq63p>
References: <20250108175923.2160130-1-vinay.belgaumkar@intel.com>
 <20250108175923.2160130-4-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250108175923.2160130-4-vinay.belgaumkar@intel.com>
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

On Wed, Jan 08, 2025 at 09:59:22AM -0800, Vinay Belgaumkar wrote:
>Provide a PMU interface for GT C6 residency counters. The implementation
>is ported over from the i915 PMU code. Residency is provided in units of

let's drop these comments that this is a copy and paste from i915,
because it shouldn't be

>ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).

missing space

>
>Sample usage and output-
>
>$ perf list | grep c6
>
>  xe_0000_00_02.0/gt-c6-residency/                 [Kernel PMU event]
>
>$ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>  event  gt_id
>$ cat /sys/bus/event_source/devices/xe_0000_00_02.0/format/*
>  config:0-11
>  config:60-63
>
>$ perf stat -e xe_0000_00_02.0/gt-c6-residency,gt_id=0/ -I1000
>
>$           time     counts unit events
>     1.001183454       1001 ms   xe_0000_00_02.0/gt-c6-residency,gt_id=0/
>     2.004434757       1002 ms   xe_0000_00_02.0/gt-c6-residency,gt_id=0/
>
>v2: Checkpatch fix, move timer code to next patch
>v3: Fix kunit issue
>v4: Fix for locking issue, fix review comments (Riana)
>v5: Add xe_pmu_disable() function to reset enable_count
>v6: Change rc6 to c6 (Riana)
>v7: Fix another comment format
>v8: Replace RC6 with C6 (Riana)
>v9: Define sampling freq in next patch
>v10: Use raw_spin_lock* instead of spin_lock* (Lucas)
>v11: Use gt-c6 to avoid confusion with CPU (Rodrigo). Use
>xe_pm_runtime_suspended() and format attr def cleanup (Riana)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v5
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c        |   3 +
> drivers/gpu/drm/xe/xe_pmu.c       | 236 +++++++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_pmu.h       |   2 +
> drivers/gpu/drm/xe/xe_pmu_types.h |  53 ++++++-
> 4 files changed, 272 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 41ab7fbebc19..64e60bcf131a 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -47,6 +47,7 @@
> #include "xe_mmio.h"
> #include "xe_pat.h"
> #include "xe_pm.h"
>+#include "xe_pmu.h"
> #include "xe_mocs.h"
> #include "xe_reg_sr.h"
> #include "xe_ring_ops.h"
>@@ -875,6 +876,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>
> 	xe_gt_idle_disable_pg(gt);
>
>+	xe_pmu_suspend(gt);

it would be good to split the xe_pmu_suspend()/xe_pmu_resume()
notifications from the main driver as a prep patch for this counter.


>+
> 	xe_gt_disable_host_l2_vram(gt);
>
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 5ff830e66ed3..3afb2b1b533b 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -11,8 +11,11 @@
> #include "xe_device.h"
> #include "xe_force_wake.h"
> #include "xe_gt_clock.h"
>+#include "xe_gt_idle.h"
>+#include "xe_guc_pc.h"
> #include "xe_mmio.h"
> #include "xe_macros.h"
>+#include "xe_module.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>
>@@ -41,13 +44,34 @@ static unsigned int xe_pmu_target_cpu = -1;
>  * The format directory has info regarding the configs that can be used.
>  *
>  * The standard perf tool can be used to grep for a certain event as well-
>- * $ perf list | grep c6
>+ * $ perf list | grep gt-c6
>  *
>  * To list a specific event for a GT at regular intervals-
>  * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
>  *
>+ * For C6, following command will give GT residency per second-
>+ * $ perf stat -e xe_0000_00_02.0/c6-residency,gt_id=0/ -I 1000
>+ *            time             counts unit events
>+ *     1.001183454               1001 ms   xe_0000_00_02.0/gt-c6-residency,gt_id=0/
>+ *     2.004434757               1002 ms   xe_0000_00_02.0/gt-c6-residency,gt_id=0/
>+ *     3.005854217               1000 ms   xe_0000_00_02.0/gt-c6-residency,gt_id=0/
>+ *

I don't think the part below belongs as source comment. As commit
message it's ok.

>+ * To verify this matches with sysfs values of c6, you can run following command-
>+ * $ for i in {1..10} ; do cat /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
>+ *   sleep 1; done
>+ *      2348877
>+ *      2349901
>+ *      2350917
>+ *      2352945
>+ *
>+ * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>  */
>
>+static struct xe_pmu *event_to_pmu(struct perf_event *event)
>+{
>+	return container_of(event->pmu, struct xe_pmu, base);
>+}
>+
> static unsigned int config_gt_id(const u64 config)
> {
> 	return config >> __XE_PMU_GT_SHIFT;
>@@ -58,6 +82,35 @@ static u64 config_counter(const u64 config)
> 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);

this is wrong as we export to userspace it's 11 bits wide, not 59. I'm
not sure we even need this helper, name wise it's very confusing

> }
>
>+static unsigned int pm_bit(const u64 config)

this name makes no sense at all. Let's drop it.

>+{
>+	unsigned int val;
>+
>+	switch (config_counter(config)) {
>+	case XE_PMU_C6_RESIDENCY:
>+		val = __XE_PMU_C6_RESIDENCY_ENABLED;
>+		break;
>+	default:
>+		/*
>+		 * Events that do not require sampling, or tracking state
>+		 * transitions between enabled and disabled can be ignored.
>+		 */
>+		return -1;

for this event we may actually drop the function. It's good rule of
thumb to only add helpers that are actually needed. If this is needed
for some other event, then add it when it's needed.

>+	}
>+
>+	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>+}
>+
>+static unsigned int config_bit(const u64 config)
>+{
>+	return pm_bit(config);

config_bit/pm_bit - it seems like we didn't decide on name and added
both.

>+}
>+
>+static unsigned int event_bit(struct perf_event *event)
>+{
>+	return config_bit(event->attr.config);

ditto - why do we need so many single line wrappers?

>+}
>+
> static void xe_pmu_event_destroy(struct perf_event *event)
> {
> 	struct xe_device *xe =
>@@ -77,6 +130,10 @@ config_status(struct xe_device *xe, u64 config)
> 		return -ENOENT;
>
> 	switch (config_counter(config)) {
>+	case XE_PMU_C6_RESIDENCY:
>+		if (xe->info.skip_guc_pc)
>+			return -ENODEV;
>+		break;
> 	default:
> 		return -ENOENT;
> 	}
>@@ -125,6 +182,57 @@ static int xe_pmu_event_init(struct perf_event *event)
> 	return 0;
> }
>
>+static inline s64 ktime_since_raw(const ktime_t kt)

no need for this helper

>+{
>+	return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
>+}
>+
>+static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>+{
>+	return pmu->event_sample[gt_id][sample].cur;
>+}
>+
>+static void
>+store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>+{
>+	pmu->event_sample[gt_id][sample].cur = val;
>+}
>+
>+static u64 get_c6(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	const unsigned int gt_id = gt->info.id;
>+	struct xe_pmu *pmu = &xe->pmu;
>+	unsigned long flags;
>+	u64 val;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	if (!xe_pm_runtime_suspended(xe)) {

it seems we have a race here. What is preventing the gpu to suspend in
between these calls? It seems here we want a call to
xe_pm_runtime_get_if_in_use()

>+		val = xe_gt_idle_residency_msec(&gt->gtidle);
>+		store_sample(pmu, gt_id, __XE_SAMPLE_C6, val);
>+	} else {
>+		/*
>+		 * We think we are runtime suspended.
>+		 *
>+		 * Report the delta from when the device was suspended to now,
>+		 * on top of the last known real value, as the approximated C6
>+		 * counter value.
>+		 */
>+		val = ktime_since_raw(pmu->sleep_last[gt_id]);

this doesn't seem to be the time it was last suspended, but rather the
time we stored the last sample.

>+		val += read_sample(pmu, gt_id, __XE_SAMPLE_C6);
>+	}
>+
>+	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED))
>+		val = read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED);
>+	else
>+		store_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED, val);
>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+
>+	return val;
>+}
>+
> static u64 __xe_pmu_event_read(struct perf_event *event)
> {
> 	struct xe_device *xe =
>@@ -135,6 +243,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
> 	u64 val = 0;
>
> 	switch (config_counter(config)) {
>+	case XE_PMU_C6_RESIDENCY:
>+		val = get_c6(gt);
>+		break;
> 	default:
> 		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> 	}
>@@ -165,6 +276,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>
> static void xe_pmu_enable(struct perf_event *event)
> {
>+	struct xe_pmu *pmu = event_to_pmu(event);
>+	const unsigned int bit = event_bit(event);
>+	unsigned long flags;
>+
>+	if (bit == -1)
>+		goto update;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	/*
>+	 * Update the bitmask of enabled events and increment
>+	 * the event reference counter.
>+	 */
>+	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>+	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>+	XE_WARN_ON(pmu->enable_count[bit] == ~0);
>+
>+	pmu->enable |= BIT(bit);
>+	pmu->enable_count[bit]++;

I'm missing something here because we write to pmu->enable and
pmu->enable_count, but we never read it to act on that. Either I'm
missing something, this is boilerplate unneeded code or both

>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+update:
> 	/*
> 	 * Store the current counter value so we can report the correct delta
> 	 * for all listeners. Even when the event was already enabled and has
>@@ -173,6 +306,31 @@ static void xe_pmu_enable(struct perf_event *event)
> 	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> }
>
>+static void xe_pmu_disable(struct perf_event *event)
>+{
>+	struct xe_device *xe =
>+		container_of(event->pmu, typeof(*xe), pmu.base);
>+	struct xe_pmu *pmu = &xe->pmu;
>+	const unsigned int bit = event_bit(event);
>+	unsigned long flags;
>+
>+	if (bit == -1)
>+		return;
>+
>+	raw_spin_lock_irqsave(&pmu->lock, flags);
>+
>+	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>+	XE_WARN_ON(pmu->enable_count[bit] == 0);
>+	/*
>+	 * Decrement the reference count and clear the enabled
>+	 * bitmask when the last listener on an event goes away.
>+	 */
>+	if (--pmu->enable_count[bit] == 0)
>+		pmu->enable &= ~BIT(bit);

as noted above, this is just annotating enable based on enable_count,
but otherwise not doing anything

>+
>+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>+}
>+
> static void xe_pmu_event_start(struct perf_event *event, int flags)
> {
> 	struct xe_device *xe =
>@@ -192,9 +350,11 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
> 		container_of(event->pmu, typeof(*xe), pmu.base);
> 	struct xe_pmu *pmu = &xe->pmu;
>
>-	if (pmu->registered)
>+	if (pmu->registered) {
> 		if (flags & PERF_EF_UPDATE)
> 			xe_pmu_event_read(event);
>+		xe_pmu_disable(event);
>+	}
>
> 	event->hw.state = PERF_HES_STOPPED;
> }
>@@ -229,24 +389,12 @@ struct xe_str_attribute {
> 	const char *str;
> };
>
>-static ssize_t xe_pmu_format_show(struct device *dev,
>-				  struct device_attribute *attr, char *buf)
>-{
>-	struct xe_str_attribute *eattr;
>-
>-	eattr = container_of(attr, struct xe_str_attribute, attr);
>-	return sprintf(buf, "%s\n", eattr->str);
>-}
>-

it seems this is squashed in the wrong place. While re-working the first
patch I already did it there.

>-#define XE_PMU_FORMAT_ATTR(_name, _config) \
>-	(&((struct xe_str_attribute[]) { \
>-		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
>-		.str = _config, } \
>-	})[0].attr.attr)
>+PMU_FORMAT_ATTR(event, "config:0-11");
>+PMU_FORMAT_ATTR(gt_id, "config:60-63");
>
> static struct attribute *xe_pmu_format_attrs[] = {
>-	XE_PMU_FORMAT_ATTR(event_id, "config:0-20"),
>-	XE_PMU_FORMAT_ATTR(gt_id, "config:60-63"),
>+	&format_attr_event.attr,
>+	&format_attr_gt_id.attr,

this is also changed on my version and we will need to rebase this.

> 	NULL,
> };
>
>@@ -327,6 +475,7 @@ create_event_attributes(struct xe_pmu *pmu)
> 		const char *name;
> 		const char *unit;
> 	} events[] = {
>+		__event(0, "gt-c6-residency", "ms"),
> 	};
>
> 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>@@ -337,7 +486,7 @@ create_event_attributes(struct xe_pmu *pmu)
>
> 	/* Count how many counters we will be exposing. */
> 	for (i = 0; i < ARRAY_SIZE(events); i++) {
>-		u64 config = __XE_PMU_PM(events[i].counter);
>+		u64 config = __XE_PMU_EVENT(events[i].counter);
>
> 		if (!config_status(xe, config))
> 			count++;
>@@ -362,7 +511,7 @@ create_event_attributes(struct xe_pmu *pmu)
> 	attr_iter = attr;
>
> 	for (i = 0; i < ARRAY_SIZE(events); i++) {
>-		u64 config = __XE_PMU_PM(events[i].counter);
>+		u64 config = __XE_PMU_EVENT(events[i].counter);
> 		char *str;
>
> 		if (config_status(xe, config))
>@@ -508,6 +657,33 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> 	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
> }
>
>+static void store_c6_residency(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	store_sample(pmu, gt->info.id, __XE_SAMPLE_C6,
>+		     xe_gt_idle_residency_msec(&gt->gtidle));
>+	pmu->sleep_last[gt->info.id] = ktime_get_raw();
>+}
>+
>+/**
>+ * xe_pmu_suspend() - Save residency count before suspend
>+ * @gt: GT object
>+ */
>+void xe_pmu_suspend(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_pmu *pmu = &xe->pmu;
>+
>+	if (!pmu->base.event_init)
>+		return;
>+
>+	raw_spin_lock_irq(&pmu->lock);
>+	store_c6_residency(gt);

shouldn't we set here the pmu->sleep_last and probably call it 
pmu->suspended_time;

as mentioned above the xe_pmu_suspend() and xe_pmu_resume() could be a
prep patch, with the commit message justifying **why** it's needed
rather than what is being done

>+	raw_spin_unlock_irq(&pmu->lock);
>+}
>+
> /**
>  * xe_pmu_unregister() - Remove/cleanup PMU registration
>  * @arg: Ptr to pmu
>@@ -533,6 +709,24 @@ void xe_pmu_unregister(void *arg)
> 	free_event_attributes(pmu);
> }
>
>+static void init_c6(struct xe_pmu *pmu)
>+{
>+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>+	struct xe_gt *gt;
>+	unsigned int j;
>+
>+	for_each_gt(gt, xe, j) {
>+		xe_pm_runtime_get(xe);
>+		u64 val = xe_gt_idle_residency_msec(&gt->gtidle);
>+
>+		store_sample(pmu, j, __XE_SAMPLE_C6, val);
>+		store_sample(pmu, j, __XE_SAMPLE_C6_LAST_REPORTED,
>+			     val);

why is this done on pmu registration rather than when we start actively
sampling the hw?

I'm seeing what I can do in this commit on top of my changes to the
previous one. 

Lucas De Marchi

>+		pmu->sleep_last[j] = ktime_get_raw();
>+		xe_pm_runtime_put(xe);
>+	}
>+}
>+
> /**
>  * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>  * @pmu: the PMU object
>@@ -569,6 +763,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
> 	if (!pmu->events_attr_group.attrs)
> 		goto err_name;
>
>+	init_c6(pmu);
>+
> 	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> 					GFP_KERNEL);
> 	if (!pmu->base.attr_groups)
>diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>index d3d91d00e50e..263665f814f0 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.h
>+++ b/drivers/gpu/drm/xe/xe_pmu.h
>@@ -15,11 +15,13 @@ int xe_pmu_init(void);
> void xe_pmu_exit(void);
> void xe_pmu_register(struct xe_pmu *pmu);
> void xe_pmu_unregister(void *arg);
>+void xe_pmu_suspend(struct xe_gt *gt);
> #else
> static inline int xe_pmu_init(void) { return 0; }
> static inline void xe_pmu_exit(void) {}
> static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> static inline void xe_pmu_unregister(void *arg) {}
>+static inline void xe_pmu_suspend(struct xe_gt *gt) {}
> #endif
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index 29a2009f4d5e..b97ba536d3ee 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -10,6 +10,8 @@
> #include <linux/spinlock_types.h>
>
> enum {
>+	__XE_SAMPLE_C6,
>+	__XE_SAMPLE_C6_LAST_REPORTED,
> 	__XE_NUM_PMU_SAMPLERS
> };
>
>@@ -20,10 +22,30 @@ enum {
>  */
> #define __XE_PMU_GT_SHIFT (60)
>
>-#define ___XE_PMU_PM(gt, x) \
>+#define ___XE_PMU_EVENT(gt, x) \
> 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>
>-#define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>+#define __XE_PMU_EVENT(x) ___XE_PMU_EVENT(0, x)
>+
>+#define XE_PMU_C6_RESIDENCY		__XE_PMU_EVENT(0)
>+#define __XE_PMU_C6_RESIDENCY(gt)	___XE_PMU_EVENT(gt, 0)
>+
>+/*
>+ * Non-engine events that we need to track enabled-disabled transition and
>+ * current state.
>+ */
>+enum xe_pmu_tracked_events {
>+	__XE_PMU_C6_RESIDENCY_ENABLED,
>+	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>+};
>+
>+/* Global PMU mask to track enabled events */
>+#define XE_PMU_MASK_BITS \
>+	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>+
>+struct xe_pmu_sample {
>+	u64 cur;
>+};
>
> /**
>  * struct xe_pmu - PMU related data per Xe device
>@@ -73,6 +95,33 @@ struct xe_pmu {
> 	 * @pmu_attr: Memory block holding perf attributes.
> 	 */
> 	void *pmu_attr;
>+
>+	/**
>+	 * @enable: Bitmask of specific enabled events.
>+	 *
>+	 * For some events we need to track their state and do some internal
>+	 * house keeping.
>+	 */
>+	u32 enable;
>+
>+	/**
>+	 * @enable_count: Reference counter for enabled events.
>+	 *
>+	 * Array indices are mapped in the same way as bits in the @enable field
>+	 * and they are used to control sampling on/off when multiple clients
>+	 * are using the PMU API.
>+	 */
>+	unsigned int enable_count[XE_PMU_MASK_BITS];
>+	/**
>+	 * @sample: Current and previous (raw) counters for sampling events.
>+	 *
>+	 * These counters are updated from the PMU sampling timer.
>+	 */
>+	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>+	/**
>+	 * @sleep_last: Last time GT parked for C6 estimation.
>+	 */
>+	ktime_t sleep_last[XE_PMU_MAX_GT];
> };
>
> #endif
>-- 
>2.38.1
>
