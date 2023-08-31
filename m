Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE73CA0FE2
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 23:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584C910E6FB;
	Thu, 31 Aug 2023 23:03:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1548310E6FB
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693522990; x=1725058990;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U5eHbxaKm8UwoN/2VNnCCjIs3hQEJp+soChkZrL3RgA=;
 b=bk35EVFKEzvlFriiCVqD6bcsMa5ska+8u1XW+P2lsISHNwk3I+Mbl9vF
 kNHzMYnrP6txUwBj8qzjtq2npQGL1q4dyptihUEDpLAAdbwUNkCzV85Eo
 pDkHcCU3LlrA4B1RyDhoVwU5rGaim1W7PPPmJPAqVvXNi7tORVBhMam/k
 pc8kcLCUcpVcw9b5NgAKqhpV0OE3+kD5k7hE0LPFhQBZUaWVQiNzE87lD
 8OCBtW2/iogxs9MX+WAi6Pjer33AZ2Ip7dG0h08fgKuW/scxFI8/cQunH
 cxRMd3llAw1RaUMq+MhPfU5dRpCSoZFZ75QMIZwiu8H3J2Y0PJ6SGdvgI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440071665"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="440071665"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 16:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913465828"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="913465828"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 16:02:55 -0700
Message-ID: <b9557547-1b36-5dc0-b2b9-0fdcf11c5141@linux.intel.com>
Date: Fri, 1 Sep 2023 04:41:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-4-aravind.iddamsetty@linux.intel.com>
 <87a5u724xe.wl-ashutosh.dixit@intel.com>
 <3b85e034-b1a4-29d1-2e4f-08ea6562b6ba@linux.intel.com>
 <877cpb173l.wl-ashutosh.dixit@intel.com>
 <496fa477-0361-5e65-e7a8-d3c0d02e114a@linux.intel.com>
 <77134894-47b2-98ce-d3e5-f30e611e03df@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <77134894-47b2-98ce-d3e5-f30e611e03df@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 01/09/23 03:51, Belgaumkar, Vinay wrote:
>
> On 8/31/2023 3:11 PM, Aravind Iddamsetty wrote:
>> On 31/08/23 22:28, Dixit, Ashutosh wrote:
>> HI Ashutosh,
>>
>>> On Thu, 31 Aug 2023 03:29:11 -0700, Aravind Iddamsetty wrote:
>>> Hi Aravind,
>>>
>>> Hmm, what happened to the email formatting here?
>> not sure, some how my email client is showing proper or I messed up.
>>>>   On Tue, 29 Aug 2023 22:15:44 -0700, Aravind Iddamsetty wrote:
>>>>
>>>>   diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>> new file mode 100644
>>>> index 000000000000..41dd422812ff
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>> @@ -0,0 +1,679 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_managed.h>
>>>> +#include <drm/xe_drm.h>
>>>> +
>>>> +#include "regs/xe_gt_regs.h"
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt_clock.h"
>>>> +#include "xe_mmio.h"
>>>> +
>>>> +static cpumask_t xe_pmu_cpumask;
>>>> +static unsigned int xe_pmu_target_cpu = -1;
>>>> +
>>>> +static unsigned int config_gt_id(const u64 config)
>>>> +{
>>>> +    return config >> __XE_PMU_GT_SHIFT;
>>>> +}
>>>> +
>>>> +static u64 config_counter(const u64 config)
>>>> +{
>>>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>>> +}
>>>> +
>>>> +static int engine_busyness_sample_type(u64 config)
>>>> +{
>>>> +    int type = 0;
>>>>
>>>>
>>>> Why initialize? The switch statement should have a default with a BUG/WARN_ON
>>>> below? Also see the comment below.
>>>>
>>>>   +
>>>> +    switch (config) {
>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>> +        type = __XE_SAMPLE_RENDER_GROUP_BUSY;
>>>> +        break;
>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>> +        type = __XE_SAMPLE_COPY_GROUP_BUSY;
>>>> +        break;
>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>> +        type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>>>> +        break;
>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>> +        type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return type;
>>>> +}
>>>>
>>>>
>>>> I am thinking this function is not really needed. We can just do:
>>>>
>>>>     int sample_type = config - 1;
>>>>
>>>> or
>>>>
>>>>     int sample_type = config_counter(config) - 1;
>>>>
>>>> It might not always be true in future, the configs can start from any range.
>>> Disagree. This is uapi. Once it is exposed it cannot change. I am talking
>>> about this:
>>>
>>> +#define XE_PMU_INTERRUPTS(gt)                  ___XE_PMU_OTHER(gt, 0)
>>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)           ___XE_PMU_OTHER(gt, 1)
>>> +#define XE_PMU_COPY_GROUP_BUSY(gt)             ___XE_PMU_OTHER(gt, 2)
>>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)            ___XE_PMU_OTHER(gt, 3)
>>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)       ___XE_PMU_OTHER(gt, 4)
>>>
>>> How can this "start from any range"? We can only add new counters after
>>> these, not before these, correct?
>> I didn't mean to say that these particular one's would change but any
>> future new events that might fall into these categories might start
>> from a different range. sorry for the confusion.
>>
>> Your suggestion makes it looks simple but somehow i wanted to tie this to
>> the enums we defined in sample array, so ya will check one more time if
>> it doesn't really makes any sense will clean it up.
>>
>>
>>>> in engine_group_busyness_read? See comment at __xe_pmu_event_read below.
>>>>
>>>>   +
>>>> +static void xe_pmu_event_destroy(struct perf_event *event)
>>>> +{
>>>> +    struct xe_device *xe =
>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>> +
>>>> +    drm_WARN_ON(&xe->drm, event->parent);
>>>> +
>>>> +    drm_dev_put(&xe->drm);
>>>> +}
>>>> +
>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>>> +{
>>>> +    u64 val = 0;
>>> No need to initialize here I think. We are not really expecting to drop
>>> into the default case, which should be caught much before we enter this
>>> function.
>>>
>>>> +
>>>> +    switch (sample_type) {
>>>> +    case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>>> +        val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>> +        break;
>>>> +    case __XE_SAMPLE_COPY_GROUP_BUSY:
>>>> +        val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>> +        break;
>>>> +    case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>>> +        val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>> +        break;
>>>> +    case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>>> +        val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>> +        break;
>>>> +    default:
>>>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>> +    }
>>>> +
>>>> +    return xe_gt_clock_cycles_to_ns(gt, val * 16);
>>>> +}
>>>> +
>>>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>>>> +{
>>>> +    int sample_type = engine_busyness_sample_type(config);
>>>>
>>>>
>>>> If config is event->attr.config, this can just be 'config_counter(config) - 1'.
>>>> See comment at __xe_pmu_event_read below.
>>>>
>>>>   +    const unsigned int gt_id = gt->info.id;
>>>> +    struct xe_device *xe = gt->tile->xe;
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    unsigned long flags;
>>>> +    bool device_awake;
>>>> +    u64 val;
>>>> +
>>>> +    device_awake = xe_device_mem_access_get_if_ongoing(xe);
>>>> +    if (device_awake) {
>>>> +        XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>>> +        val = __engine_group_busyness_read(gt, sample_type);
>>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +        xe_device_mem_access_put(xe);
>>>> +    }
>>>> +
>>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>>> +
>>>> +    if (device_awake)
>>>> +        pmu->sample[gt_id][sample_type] = val;
>>>> +    else
>>>> +        val = pmu->sample[gt_id][sample_type];
>>>> +
>>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>>> +
>>>> +    return val;
>>>> +}
>>>> +
>>>> +static void engine_group_busyness_store(struct xe_gt *gt)
>>>> +{
>>>> +    struct xe_pmu *pmu = &gt->tile->xe->pmu;
>>>> +    unsigned int gt_id = gt->info.id;
>>>> +    unsigned long flags;
>>>> +    int i;
>>>> +
>>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>>> +
>>>> +    for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
>>>> +        pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>>>>
>>>>
>>>> This is not quite right. At the minimum we need to take forcewake
>>>> here. Also since this is called in both suspend and runtime_suspend code
>>>> paths we might also need to the take the runtime_pm reference.
>>>>
>>>> The pm reference and forcewake are already taken in suspend paths hence
>>>> didn't add here again as this is called only from those paths.
>>>>
>>>> check xe_gt_suspend.
>>> Sorry, you are right, I missed it. So this is fine.
>>>
>>>
>>>>
>>>> I think the simplest might be to just construct 'config'
>>>> (event->attr.config) here and call engine_group_busyness_read? Something
>>>> like:
>>>>
>>>>     for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
>>>>         config = ; // Construct config using gt_id and i
>>>>         engine_group_busyness_read(gt, i);
>>>>     }
>>>>
>>>> This will automatically save the read values in pmu->sample[][] if the
>>>> device is awake. Thoughts?
>>>>
>>>> I think this is best kept separate from usual read paths(which are
>>>> atomic) didn't want to club them.  Also because forcewakes and pm
>>>> reference are taken separately in suspend path.
>>> Sure, no changes needed here. Just get rid of the braces to keep checkpatch
>>> happy.
>>>
>>>
>>>>
>>>>   +    }
>>>> +
>>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>>> +}
>>>> +
>>>> +static int
>>>> +config_status(struct xe_device *xe, u64 config)
>>>> +{
>>>> +    unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
>>>>
>>>>
>>>> What is this for? See below.
>>>>
>>>> reminiscent of my previous code, will clean it up.
>>>>
>>>>
>>>>
>>>>   +    unsigned int gt_id = config_gt_id(config);
>>>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>> +
>>>> +    if (gt_id > max_gt_id)
>>>>
>>>>
>>>> Maybe this can just be:
>>>>
>>>>     if (gt_id >= XE_PMU_MAX_GT)
>>>>
>>>>   +        return -ENOENT;
>>>> +
>>>> +    switch (config_counter(config)) {
>>>> +    case XE_PMU_INTERRUPTS(0):
>>>> +        if (gt_id)
>>>> +            return -ENOENT;
>>>> +        break;
>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>> +        if (gt->info.type == XE_GT_TYPE_MEDIA)
>>>> +            return -ENOENT;
>>>> +        break;
>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>> +        if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
>>>> +            return -ENOENT;
>>>> +        break;
>>>> +    default:
>>>> +        return -ENOENT;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int xe_pmu_event_init(struct perf_event *event)
>>>> +{
>>>> +    struct xe_device *xe =
>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    int ret;
>>>> +
>>>> +    if (pmu->closed)
>>>> +        return -ENODEV;
>>>> +
>>>> +    if (event->attr.type != event->pmu->type)
>>>> +        return -ENOENT;
>>>> +
>>>> +    /* unsupported modes and filters */
>>>> +    if (event->attr.sample_period) /* no sampling */
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (has_branch_stack(event))
>>>> +        return -EOPNOTSUPP;
>>>> +
>>>> +    if (event->cpu < 0)
>>>> +        return -EINVAL;
>>>> +
>>>> +    /* only allow running on one cpu at a time */
>>>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>>>> +        return -EINVAL;
>>>> +
>>>> +    ret = config_status(xe, event->attr.config);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    if (!event->parent) {
>>>> +        drm_dev_get(&xe->drm);
>>>> +        event->destroy = xe_pmu_event_destroy;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>>>> +{
>>>> +    struct xe_device *xe =
>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>>>> +    const u64 config = config_counter(event->attr.config);
>>>>
>>>>
>>>> Probably nit but this config being different from event->attr.config is
>>>> confusing. Let's use 'event->attr.config' throughout as argument to
>>>> functions and use config_counter() to get rid of gt_id. So get rid of this
>>>> config variable.
>>>>
>>>>   +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    u64 val = 0;
>>>> +
>>>> +    switch (config) {
>>>>
>>>>
>>>> switch (config_counter(event->attr.config))
>>>>
>>>>   +    case XE_PMU_INTERRUPTS(0):
>>>> +        val = READ_ONCE(pmu->irq_count);
>>>> +        break;
>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>> +        val = engine_group_busyness_read(gt, config);
>>>>
>>>>
>>>> engine_group_busyness_read(gt, event->attr.config);
>>>>
>>>> hmmm ok.
>>>>
>>>>
>>>>
>>>> Also, need a default case.
>>>>
>>>>   +    }
>>>> +
>>>> +    return val;
>>>> +}
>>>> +
>>>> +static void xe_pmu_event_read(struct perf_event *event)
>>>> +{
>>>> +    struct xe_device *xe =
>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>> +    struct hw_perf_event *hwc = &event->hw;
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    u64 prev, new;
>>>> +
>>>> +    if (pmu->closed) {
>>>> +        event->hw.state = PERF_HES_STOPPED;
>>>> +        return;
>>>> +    }
>>>> +again:
>>>> +    prev = local64_read(&hwc->prev_count);
>>>> +    new = __xe_pmu_event_read(event);
>>>> +
>>>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>>>> +        goto again;
>>>> +
>>>> +    local64_add(new - prev, &event->count);
>>>> +}
>>>> +
>>>> +static void xe_pmu_enable(struct perf_event *event)
>>>> +{
>
> The i915_pmu code checks which event is requested here and accordingly sets pmu->enable (which doesn't seem to be defined here yet). Any reason we are not doing this yet?


in i915 pmu->enable is only used by events for which there is an internal timer sampler
which periodically samples those events, this series is not adding such events.

Thanks,
Aravind.
>
> Thanks,
>
> Vinay.
>
>>>> +    /*
>>>> +     * Store the current counter value so we can report the correct delta
>>>> +     * for all listeners. Even when the event was already enabled and has
>>>> +     * an existing non-zero value.
>>>> +     */
>>>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>>>
>>>>
>>>> Right now nothing is being enabled here (unlike i915) so the function name
>>>> xe_pmu_enable looks weird. Not sure, maybe leave as is for when things get
>>>> added in the future?
>>>>
>>>>   +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>>>> +{
>>>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>> +
>>>> +    BUG_ON(!pmu->base.event_init);
>>>> +
>>>> +    /* Select the first online CPU as a designated reader. */
>>>> +    if (cpumask_empty(&xe_pmu_cpumask))
>>>> +        cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>>>> +{
>>>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>>>> +    unsigned int target = xe_pmu_target_cpu;
>>>> +
>>>> +    BUG_ON(!pmu->base.event_init);
>>>>
>>>>
>>>> nit but wondering if we should remove these two BUG_ON's (and save a couple
>>>> of checkpatch warnings even though the BUG_ON's are in i915) and just do
>>>> something like:
>>>>
>>>>       if (!pmu->base.event_init)
>>>>         return 0;
>>>>
>>>> The reason for the BUG_ON's seems to be that these functions can be called
>>>> after module_init but before probe.
>>>>
>>>> xe_pmu_cpu_online() doesn't depend on pmu at all so looks like the BUG_ON
>>>> can just be dropped?
>>>>
>>>> the  xe_pmu_cpu_online/offline are not invoked when they are registered with
>>>> cpuhp_setup_state_multi, but rather when cpuhp_state_add_instance() is called
>>>> which is done post the PMU is initialized hence the check for BUG_ON.
>>> cpuhp_setup_state_multi is called at module_init
>>> time. cpuhp_state_add_instance is called from xe_pmu_register, i.e. during
>>> device probe when pmu->base.event_init is already initialized. Therefore
>>> seems even less reason to have the BUG_ON's.
>> that is true even, so will remove the BUG_ON.
>>> Just a few minor issues left now so I am hoping we can wrap this marathon
>>> review up soon :)
>> ya i'm waiting for the same :)
>>
>> Thanks,
>> Aravind.
>>> Thanks.
>>> -- 
>>> Ashutosh
