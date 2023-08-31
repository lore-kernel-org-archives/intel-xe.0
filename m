Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96373C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 10:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F38910E5E7;
	Thu, 31 Aug 2023 10:20:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A66210E5E7
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693477237; x=1725013237;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=hqtomuXGc8zAKuKZOD6YYabl5l51g+B1osKZaxGl2uA=;
 b=WE2XKAVbj2f2KWTzDqV6vvgVdT4X+ldL+HDXyYOxY8y5ErqOtympAmLy
 CxbOSdcYSrTKjrWw3/MePHLBFEwwESAYMRtCdc9WS8dK3nQqa1gEB9AZM
 QtycSZMy2Qv2cPGoTW8yysdfJgCDCMBrmSMgvHZJSdD2AL7RKYHrbCFcD
 mwPClNWR80TivJVNxo23qql98Wgyjg5eemcn4UM4T8//+FeTUQv2A+CDS
 /etUv7C+xg5t9zjrN4OAiIlYNH1cZEKcefosvRlYgVBjet0XUUoK7/B+u
 4VHNMF3gyKYZnqj4Thm/XlHgebDQaRCdQIr0fWPJLxM/jdQJ3QM+qXiHu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442254860"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
 d="scan'208,217";a="442254860"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716287238"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
 d="scan'208,217";a="716287238"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:20:34 -0700
Content-Type: multipart/alternative;
 boundary="------------yERdJ4YQZ02qsW4K7kof9DrV"
Message-ID: <3b85e034-b1a4-29d1-2e4f-08ea6562b6ba@linux.intel.com>
Date: Thu, 31 Aug 2023 15:59:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-4-aravind.iddamsetty@linux.intel.com>
 <87a5u724xe.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87a5u724xe.wl-ashutosh.dixit@intel.com>
Subject: Re: [Intel-xe] [PATCH v5 3/3] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------yERdJ4YQZ02qsW4K7kof9DrV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 31/08/23 10:18, Dixit, Ashutosh wrote:

Hi Ashutosh,

> On Tue, 29 Aug 2023 22:15:44 -0700, Aravind Iddamsetty wrote:
> Hi Aravind,
>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..41dd422812ff
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,679 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static int engine_busyness_sample_type(u64 config)
>> +{
>> +	int type = 0;
> Why initialize? The switch statement should have a default with a BUG/WARN_ON
> below? Also see the comment below.
>
>> +
>> +	switch (config) {
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_RENDER_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_COPY_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>> +		break;
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>> +		break;
>> +	}
>> +
>> +	return type;
>> +}
> I am thinking this function is not really needed. We can just do:
>
> 	int sample_type = config - 1;
>
> or
>
> 	int sample_type = config_counter(config) - 1;

It might not always be true in future, the configs can start from any range.

>
> in engine_group_busyness_read? See comment at __xe_pmu_event_read below.
>
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +	drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +	drm_dev_put(&xe->drm);
>> +}
>> +
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>> +{
>> +	u64 val = 0;
>> +
>> +	switch (sample_type) {
>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +		break;
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return xe_gt_clock_cycles_to_ns(gt, val * 16);
>> +}
>> +
>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> +{
>> +	int sample_type = engine_busyness_sample_type(config);
> If config is event->attr.config, this can just be 'config_counter(config) - 1'.
> See comment at __xe_pmu_event_read below.
>
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_device *xe = gt->tile->xe;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	unsigned long flags;
>> +	bool device_awake;
>> +	u64 val;
>> +
>> +	device_awake = xe_device_mem_access_get_if_ongoing(xe);
>> +	if (device_awake) {
>> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +		val = __engine_group_busyness_read(gt, sample_type);
>> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +		xe_device_mem_access_put(xe);
>> +	}
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	if (device_awake)
>> +		pmu->sample[gt_id][sample_type] = val;
>> +	else
>> +		val = pmu->sample[gt_id][sample_type];
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +	return val;
>> +}
>> +
>> +static void engine_group_busyness_store(struct xe_gt *gt)
>> +{
>> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> +	unsigned int gt_id = gt->info.id;
>> +	unsigned long flags;
>> +	int i;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
>> +		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
> This is not quite right. At the minimum we need to take forcewake
> here. Also since this is called in both suspend and runtime_suspend code
> paths we might also need to the take the runtime_pm reference.

The pm reference and forcewake are already taken in suspend paths hence didn't
add here again as this is called only from those paths.

check xe_gt_suspend.

>
> I think the simplest might be to just construct 'config'
> (event->attr.config) here and call engine_group_busyness_read? Something
> like:
>
> 	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
> 		config = ; // Construct config using gt_id and i
> 		engine_group_busyness_read(gt, i);
> 	}
>
> This will automatically save the read values in pmu->sample[][] if the
> device is awake. Thoughts?

I think this is best kept separate from usual read paths(which are atomic) didn't want to club them.
Also because forcewakes and pm reference are taken separately in suspend path.

>
>> +	}
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
> What is this for? See below.

reminiscent of my previous code, will clean it up.

>
>> +	unsigned int gt_id = config_gt_id(config);
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +
>> +	if (gt_id > max_gt_id)
> Maybe this can just be:
>
> 	if (gt_id >= XE_PMU_MAX_GT)
>
>> +		return -ENOENT;
>> +
>> +	switch (config_counter(config)) {
>> +	case XE_PMU_INTERRUPTS(0):
>> +		if (gt_id)
>> +			return -ENOENT;
>> +		break;
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +		if (gt->info.type == XE_GT_TYPE_MEDIA)
>> +			return -ENOENT;
>> +		break;
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>> +			return -ENOENT;
>> +		break;
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	int ret;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	/* unsupported modes and filters */
>> +	if (event->attr.sample_period) /* no sampling */
>> +		return -EINVAL;
>> +
>> +	if (has_branch_stack(event))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (event->cpu < 0)
>> +		return -EINVAL;
>> +
>> +	/* only allow running on one cpu at a time */
>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +		return -EINVAL;
>> +
>> +	ret = config_status(xe, event->attr.config);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!event->parent) {
>> +		drm_dev_get(&xe->drm);
>> +		event->destroy = xe_pmu_event_destroy;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>> +	const u64 config = config_counter(event->attr.config);
> Probably nit but this config being different from event->attr.config is
> confusing. Let's use 'event->attr.config' throughout as argument to
> functions and use config_counter() to get rid of gt_id. So get rid of this
> config variable.
>
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 val = 0;
>> +
>> +	switch (config) {
> switch (config_counter(event->attr.config))
>
>> +	case XE_PMU_INTERRUPTS(0):
>> +		val = READ_ONCE(pmu->irq_count);
>> +		break;
>> +	case XE_PMU_RENDER_GROUP_BUSY(0):
>> +	case XE_PMU_COPY_GROUP_BUSY(0):
>> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +		val = engine_group_busyness_read(gt, config);
> engine_group_busyness_read(gt, event->attr.config);

hmmm ok.

>
> Also, need a default case.
>
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct hw_perf_event *hwc = &event->hw;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 prev, new;
>> +
>> +	if (pmu->closed) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +again:
>> +	prev = local64_read(&hwc->prev_count);
>> +	new = __xe_pmu_event_read(event);
>> +
>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +		goto again;
>> +
>> +	local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +	/*
>> +	 * Store the current counter value so we can report the correct delta
>> +	 * for all listeners. Even when the event was already enabled and has
>> +	 * an existing non-zero value.
>> +	 */
>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> Right now nothing is being enabled here (unlike i915) so the function name
> xe_pmu_enable looks weird. Not sure, maybe leave as is for when things get
> added in the future?
>
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +
>> +	BUG_ON(!pmu->base.event_init);
>> +
>> +	/* Select the first online CPU as a designated reader. */
>> +	if (cpumask_empty(&xe_pmu_cpumask))
>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +	unsigned int target = xe_pmu_target_cpu;
>> +
>> +	BUG_ON(!pmu->base.event_init);
> nit but wondering if we should remove these two BUG_ON's (and save a couple
> of checkpatch warnings even though the BUG_ON's are in i915) and just do
> something like:
>
> 	  if (!pmu->base.event_init)
> 		return 0;
>
> The reason for the BUG_ON's seems to be that these functions can be called
> after module_init but before probe.
>
> xe_pmu_cpu_online() doesn't depend on pmu at all so looks like the BUG_ON
> can just be dropped?

the  xe_pmu_cpu_online/offline are not invoked when they are registered with
cpuhp_setup_state_multi, but rather when cpuhp_state_add_instance() is called
which is done post the PMU is initialized hence the check for BUG_ON.

Thanks,
Aravind.

>
> Thanks.
> --
> Ashutosh
--------------yERdJ4YQZ02qsW4K7kof9DrV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 31/08/23 10:18, Dixit, Ashutosh wrote:

Hi Ashutosh,
</pre>
    </div>
    <blockquote type="cite"
      cite="mid:87a5u724xe.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 29 Aug 2023 22:15:44 -0700, Aravind Iddamsetty wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Aravind,

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
new file mode 100644
index 000000000000..41dd422812ff
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -0,0 +1,679 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include &lt;drm/drm_drv.h&gt;
+#include &lt;drm/drm_managed.h&gt;
+#include &lt;drm/xe_drm.h&gt;
+
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_gt_clock.h"
+#include "xe_mmio.h"
+
+static cpumask_t xe_pmu_cpumask;
+static unsigned int xe_pmu_target_cpu = -1;
+
+static unsigned int config_gt_id(const u64 config)
+{
+	return config &gt;&gt; __XE_PMU_GT_SHIFT;
+}
+
+static u64 config_counter(const u64 config)
+{
+	return config &amp; ~(~0ULL &lt;&lt; __XE_PMU_GT_SHIFT);
+}
+
+static int engine_busyness_sample_type(u64 config)
+{
+	int type = 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why initialize? The switch statement should have a default with a BUG/WARN_ON
below? Also see the comment below.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+	switch (config) {
+	case XE_PMU_RENDER_GROUP_BUSY(0):
+		type = __XE_SAMPLE_RENDER_GROUP_BUSY;
+		break;
+	case XE_PMU_COPY_GROUP_BUSY(0):
+		type = __XE_SAMPLE_COPY_GROUP_BUSY;
+		break;
+	case XE_PMU_MEDIA_GROUP_BUSY(0):
+		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
+		break;
+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
+		break;
+	}
+
+	return type;
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I am thinking this function is not really needed. We can just do:

	int sample_type = config - 1;

or

	int sample_type = config_counter(config) - 1;</pre>
    </blockquote>
    <pre>It might not always be true in future, the configs can start from any range.
</pre>
    <blockquote type="cite"
      cite="mid:87a5u724xe.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">

in engine_group_busyness_read? See comment at __xe_pmu_event_read below.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+static void xe_pmu_event_destroy(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event-&gt;pmu, typeof(*xe), pmu.base);
+
+	drm_WARN_ON(&amp;xe-&gt;drm, event-&gt;parent);
+
+	drm_dev_put(&amp;xe-&gt;drm);
+}
+
+static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
+{
+	u64 val = 0;
+
+	switch (sample_type) {
+	case __XE_SAMPLE_RENDER_GROUP_BUSY:
+		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
+		break;
+	case __XE_SAMPLE_COPY_GROUP_BUSY:
+		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
+		break;
+	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
+		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
+		break;
+	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
+		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
+		break;
+	default:
+		drm_warn(&amp;gt-&gt;tile-&gt;xe-&gt;drm, "unknown pmu event\n");
+	}
+
+	return xe_gt_clock_cycles_to_ns(gt, val * 16);
+}
+
+static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
+{
+	int sample_type = engine_busyness_sample_type(config);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If config is event-&gt;attr.config, this can just be 'config_counter(config) - 1'.
See comment at __xe_pmu_event_read below.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	const unsigned int gt_id = gt-&gt;info.id;
+	struct xe_device *xe = gt-&gt;tile-&gt;xe;
+	struct xe_pmu *pmu = &amp;xe-&gt;pmu;
+	unsigned long flags;
+	bool device_awake;
+	u64 val;
+
+	device_awake = xe_device_mem_access_get_if_ongoing(xe);
+	if (device_awake) {
+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		val = __engine_group_busyness_read(gt, sample_type);
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+		xe_device_mem_access_put(xe);
+	}
+
+	spin_lock_irqsave(&amp;pmu-&gt;lock, flags);
+
+	if (device_awake)
+		pmu-&gt;sample[gt_id][sample_type] = val;
+	else
+		val = pmu-&gt;sample[gt_id][sample_type];
+
+	spin_unlock_irqrestore(&amp;pmu-&gt;lock, flags);
+
+	return val;
+}
+
+static void engine_group_busyness_store(struct xe_gt *gt)
+{
+	struct xe_pmu *pmu = &amp;gt-&gt;tile-&gt;xe-&gt;pmu;
+	unsigned int gt_id = gt-&gt;info.id;
+	unsigned long flags;
+	int i;
+
+	spin_lock_irqsave(&amp;pmu-&gt;lock, flags);
+
+	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i &lt;= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
+		pmu-&gt;sample[gt_id][i] = __engine_group_busyness_read(gt, i);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is not quite right. At the minimum we need to take forcewake
here. Also since this is called in both suspend and runtime_suspend code
paths we might also need to the take the runtime_pm reference.</pre>
    </blockquote>
    <pre>The pm reference and forcewake are already taken in suspend paths hence didn't
add here again as this is called only from those paths.

check xe_gt_suspend.
</pre>
    <blockquote type="cite"
      cite="mid:87a5u724xe.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">

I think the simplest might be to just construct 'config'
(event-&gt;attr.config) here and call engine_group_busyness_read? Something
like:

	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i &lt;= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
		config = ; // Construct config using gt_id and i
		engine_group_busyness_read(gt, i);
	}

This will automatically save the read values in pmu-&gt;sample[][] if the
device is awake. Thoughts?</pre>
    </blockquote>
    <pre>I think this is best kept separate from usual read paths(which are atomic) didn't want to club them.
Also because forcewakes and pm reference are taken separately in suspend path.
</pre>
    <blockquote type="cite"
      cite="mid:87a5u724xe.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	}
+
+	spin_unlock_irqrestore(&amp;pmu-&gt;lock, flags);
+}
+
+static int
+config_status(struct xe_device *xe, u64 config)
+{
+	unsigned int max_gt_id = xe-&gt;info.gt_count &gt; 1 ? 1 : 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What is this for? See below.</pre>
    </blockquote>
    <pre>reminiscent of my previous code, will clean it up.</pre>
    <blockquote type="cite"
      cite="mid:87a5u724xe.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	unsigned int gt_id = config_gt_id(config);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+
+	if (gt_id &gt; max_gt_id)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe this can just be:

	if (gt_id &gt;= XE_PMU_MAX_GT)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+		return -ENOENT;
+
+	switch (config_counter(config)) {
+	case XE_PMU_INTERRUPTS(0):
+		if (gt_id)
+			return -ENOENT;
+		break;
+	case XE_PMU_RENDER_GROUP_BUSY(0):
+	case XE_PMU_COPY_GROUP_BUSY(0):
+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+		if (gt-&gt;info.type == XE_GT_TYPE_MEDIA)
+			return -ENOENT;
+		break;
+	case XE_PMU_MEDIA_GROUP_BUSY(0):
+		if (!(gt-&gt;info.engine_mask &amp; (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
+			return -ENOENT;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int xe_pmu_event_init(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event-&gt;pmu, typeof(*xe), pmu.base);
+	struct xe_pmu *pmu = &amp;xe-&gt;pmu;
+	int ret;
+
+	if (pmu-&gt;closed)
+		return -ENODEV;
+
+	if (event-&gt;attr.type != event-&gt;pmu-&gt;type)
+		return -ENOENT;
+
+	/* unsupported modes and filters */
+	if (event-&gt;attr.sample_period) /* no sampling */
+		return -EINVAL;
+
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
+
+	if (event-&gt;cpu &lt; 0)
+		return -EINVAL;
+
+	/* only allow running on one cpu at a time */
+	if (!cpumask_test_cpu(event-&gt;cpu, &amp;xe_pmu_cpumask))
+		return -EINVAL;
+
+	ret = config_status(xe, event-&gt;attr.config);
+	if (ret)
+		return ret;
+
+	if (!event-&gt;parent) {
+		drm_dev_get(&amp;xe-&gt;drm);
+		event-&gt;destroy = xe_pmu_event_destroy;
+	}
+
+	return 0;
+}
+
+static u64 __xe_pmu_event_read(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event-&gt;pmu, typeof(*xe), pmu.base);
+	const unsigned int gt_id = config_gt_id(event-&gt;attr.config);
+	const u64 config = config_counter(event-&gt;attr.config);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Probably nit but this config being different from event-&gt;attr.config is
confusing. Let's use 'event-&gt;attr.config' throughout as argument to
functions and use config_counter() to get rid of gt_id. So get rid of this
config variable.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+	struct xe_pmu *pmu = &amp;xe-&gt;pmu;
+	u64 val = 0;
+
+	switch (config) {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
switch (config_counter(event-&gt;attr.config))

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	case XE_PMU_INTERRUPTS(0):
+		val = READ_ONCE(pmu-&gt;irq_count);
+		break;
+	case XE_PMU_RENDER_GROUP_BUSY(0):
+	case XE_PMU_COPY_GROUP_BUSY(0):
+	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
+	case XE_PMU_MEDIA_GROUP_BUSY(0):
+		val = engine_group_busyness_read(gt, config);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
engine_group_busyness_read(gt, event-&gt;attr.config);</pre>
    </blockquote>
    <pre>hmmm ok.</pre>
    <blockquote type="cite"
      cite="mid:87a5u724xe.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">

Also, need a default case.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	}
+
+	return val;
+}
+
+static void xe_pmu_event_read(struct perf_event *event)
+{
+	struct xe_device *xe =
+		container_of(event-&gt;pmu, typeof(*xe), pmu.base);
+	struct hw_perf_event *hwc = &amp;event-&gt;hw;
+	struct xe_pmu *pmu = &amp;xe-&gt;pmu;
+	u64 prev, new;
+
+	if (pmu-&gt;closed) {
+		event-&gt;hw.state = PERF_HES_STOPPED;
+		return;
+	}
+again:
+	prev = local64_read(&amp;hwc-&gt;prev_count);
+	new = __xe_pmu_event_read(event);
+
+	if (local64_cmpxchg(&amp;hwc-&gt;prev_count, prev, new) != prev)
+		goto again;
+
+	local64_add(new - prev, &amp;event-&gt;count);
+}
+
+static void xe_pmu_enable(struct perf_event *event)
+{
+	/*
+	 * Store the current counter value so we can report the correct delta
+	 * for all listeners. Even when the event was already enabled and has
+	 * an existing non-zero value.
+	 */
+	local64_set(&amp;event-&gt;hw.prev_count, __xe_pmu_event_read(event));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right now nothing is being enabled here (unlike i915) so the function name
xe_pmu_enable looks weird. Not sure, maybe leave as is for when things get
added in the future?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
+{
+	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
+
+	BUG_ON(!pmu-&gt;base.event_init);
+
+	/* Select the first online CPU as a designated reader. */
+	if (cpumask_empty(&amp;xe_pmu_cpumask))
+		cpumask_set_cpu(cpu, &amp;xe_pmu_cpumask);
+
+	return 0;
+}
+
+static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
+{
+	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
+	unsigned int target = xe_pmu_target_cpu;
+
+	BUG_ON(!pmu-&gt;base.event_init);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
nit but wondering if we should remove these two BUG_ON's (and save a couple
of checkpatch warnings even though the BUG_ON's are in i915) and just do
something like:

	  if (!pmu-&gt;base.event_init)
		return 0;

The reason for the BUG_ON's seems to be that these functions can be called
after module_init but before probe.

xe_pmu_cpu_online() doesn't depend on pmu at all so looks like the BUG_ON
can just be dropped?</pre>
    </blockquote>
    <pre>the  xe_pmu_cpu_online/offline are not invoked when they are registered with
cpuhp_setup_state_multi, but rather when cpuhp_state_add_instance() is called
which is done post the PMU is initialized hence the check for BUG_ON.

Thanks,
Aravind.

</pre>
    <blockquote type="cite"
      cite="mid:87a5u724xe.wl-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">

Thanks.
--
Ashutosh
</pre>
    </blockquote>
  </body>
</html>

--------------yERdJ4YQZ02qsW4K7kof9DrV--
