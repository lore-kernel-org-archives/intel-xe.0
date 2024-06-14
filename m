Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D990C2BA15
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 13:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293DA10E3BE;
	Mon, 17 Jun 2024 13:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JBBuAr7H";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F4F10E0B8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RG6YgtXcLsVzdvsTStrVcwyaIEJGaHJFDDDR5cJ71uE=; b=JBBuAr7HfFC9onXWBgqtMhulPx
 ChHcfbCIyLJ0kSYV2KiGc32qICDOi9eTrteDBROLJ8A6Ot1EDFNxX5TfeEiI89ch9e3Yh01csDYL1
 GcjdK4Ik/hg6qxcQd/OORzBtbYGGocas8GRevRGcJwddz35FmCJOk+2Oj9xe+rRKkIvcF2KR11GCd
 dzadXh2ud0BoK+QOfSe7nx5trNIh95rO5HzlTk8zmXLJTP/Gi2qVnaDZj7k0GZ3TwtmUlddnV8FJV
 G6X8HQFFKNiJaBQKxLwBmEEjfldgKTI8uQE5v+sM2x4Ab1B3sVFipqBK3ba7d5zGXcx0Fu7HM/6vb
 ekXIQMRA==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sI9wm-003CGd-Es; Fri, 14 Jun 2024 18:38:40 +0200
Message-ID: <c3467a3f-8124-469a-9cf1-e133b81f9e9f@igalia.com>
Date: Fri, 14 Jun 2024 17:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] drm/xe/pmu: Enable PMU interface
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 ashutosh.dixit@intel.com, aravind.iddamsetty@linux.intel.com,
 rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 krishnaiah.bommu@intel.com
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <20240613100411.1579218-3-riana.tauro@intel.com>
 <jldfwuyzm6pxms7qt2yqj57bb75lquvn27socbcxrfcevvt2s2@nllraaafjqpq>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <jldfwuyzm6pxms7qt2yqj57bb75lquvn27socbcxrfcevvt2s2@nllraaafjqpq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jun 2024 13:28:00 +0000
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


On 14/06/2024 17:15, Lucas De Marchi wrote:
> On Thu, Jun 13, 2024 at 03:34:11PM GMT, Riana Tauro wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> There are a set of engine group busyness counters provided by HW which 
>> are
>> perfect fit to be exposed via PMU perf events.
>>
>> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>
>> events can be listed using:
>> perf list
>>  xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>  xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>  xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>  xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>
>> and can be read using:
>>
>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>           time        counts unit events
>>     1.001139062            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     2.003294678            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     3.005199582            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     4.007076497            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     5.008553068            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     6.010531563        43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     7.012468029        44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     8.013463515            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>     9.015300183            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>    10.017233010            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>    10.971934120            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>
>> The pmu base implementation is taken from i915.
>>
>> v2:
>> Store last known value when device is awake return that while the GT is
>> suspended and then update the driver copy when read during awake.
>>
>> v3:
>> 1. drop init_samples, as storing counters before going to suspend should
>> be sufficient.
>> 2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
>> dropped helpers to store and read samples.
>> 3. use xe_device_mem_access_get_if_ongoing to check if device is active
>> before reading the OA registers.
>> 4. dropped format attr as no longer needed
>> 5. introduce xe_pmu_suspend to call engine_group_busyness_store
>> 6. few other nits.
>>
>> v4: minor nits.
>>
>> v5: take forcewake when accessing the OAG registers
>>
>> v6:
>> 1. drop engine_busyness_sample_type
>> 2. update UAPI documentation
>>
>> v7:
>> 1. update UAPI documentation
>> 2. drop MEDIA_GT specific change for media busyness counter.
>>
>> v8:
>> 1. rebase
>> 2. replace mem_access_if_ongoing with xe_pm_runtime_get_if_active
>> 3. remove interrupts pmu event
>>
>> v9: replace drmm_add_action_or_reset with devm (Matthew Auld)
>>
>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> first s-o-b should match the author in the patch. According to the
> "From" above, author is set to Aravind Iddamsetty 
> <aravind.iddamsetty@linux.intel.com>
> 
> I wil leave some nits about the implementation and focus on the main
> concept being added here.
> 
> ...
> 
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..64960a358af2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,631 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +    return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +    drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +    drm_dev_put(&xe->drm);
>> +}
>> +
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int 
>> sample_type)
>> +{
>> +    u64 val;
>> +
>> +    switch (sample_type) {
>> +    case __XE_SAMPLE_RENDER_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +        break;
>> +    case __XE_SAMPLE_COPY_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +        break;
>> +    case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +        break;
>> +    case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +        break;
>> +    default:
>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    }
>> +
>> +    return xe_gt_clock_cycles_to_ns(gt, val * 16);
>> +}
>> +
>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> +{
>> +    int sample_type = config_counter(config);
>> +    const unsigned int gt_id = gt->info.id;
>> +    struct xe_device *xe = gt->tile->xe;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    unsigned long flags;
>> +    bool device_awake;
>> +    u64 val;
>> +
>> +    device_awake = xe_pm_runtime_get_if_active(xe);
>> +    if (device_awake) {
>> +        XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +        val = __engine_group_busyness_read(gt, sample_type);
>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +        xe_pm_runtime_put(xe);
>> +    }
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (device_awake)
>> +        pmu->sample[gt_id][sample_type] = val;
>> +    else
>> +        val = pmu->sample[gt_id][sample_type];
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +static void engine_group_busyness_store(struct xe_gt *gt)
>> +{
>> +    struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> +    unsigned int gt_id = gt->info.id;
>> +    unsigned long flags;
>> +    int i;
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= 
>> __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>> +        pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +    unsigned int gt_id = config_gt_id(config);
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +
>> +    if (gt_id >= XE_PMU_MAX_GT)
>> +        return -ENOENT;
>> +
>> +    switch (config_counter(config)) {
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +        if (gt->info.type == XE_GT_TYPE_MEDIA)
>> +            return -ENOENT;
>> +        break;
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | 
>> BIT(XE_HW_ENGINE_VECS0))))
>> +            return -ENOENT;
>> +        break;
>> +    default:
>> +        return -ENOENT;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    int ret;
>> +
>> +    if (pmu->closed)
>> +        return -ENODEV;
>> +
>> +    if (event->attr.type != event->pmu->type)
>> +        return -ENOENT;
>> +
>> +    /* unsupported modes and filters */
>> +    if (event->attr.sample_period) /* no sampling */
>> +        return -EINVAL;
>> +
>> +    if (has_branch_stack(event))
>> +        return -EOPNOTSUPP;
>> +
>> +    if (event->cpu < 0)
>> +        return -EINVAL;
>> +
>> +    /* only allow running on one cpu at a time */
>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +        return -EINVAL;
>> +
>> +    ret = config_status(xe, event->attr.config);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!event->parent) {
>> +        drm_dev_get(&xe->drm);
>> +        event->destroy = xe_pmu_event_destroy;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>> +    const u64 config = event->attr.config;
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +    u64 val;
>> +
>> +    switch (config_counter(config)) {
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        val = engine_group_busyness_read(gt, config);
>> +        break;
>> +    default:
>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct hw_perf_event *hwc = &event->hw;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    u64 prev, new;
>> +
>> +    if (pmu->closed) {
>> +        event->hw.state = PERF_HES_STOPPED;
>> +        return;
>> +    }
>> +again:
>> +    prev = local64_read(&hwc->prev_count);
>> +    new = __xe_pmu_event_read(event);
> 
> 
> so... when we enable a perf counter with the example in the cover
> letter:
> 
>      perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
> 
> then we will have the following call chain:
> 
> xe_pmu_event_read()
>    __xe_pmu_event_read()
>      engine_group_busyness_read()
>        engine_group_busyness_read()
>          __engine_group_busyness_read()
>        xe_mmio_read32()
> 
> At a frequency up to sysctl kernel.perf_event_max_sample_rate  (~50kHz
> in my distro). The event itself is recorded to the ring buffer if it
> changed.

No, only once a second in this example. I forget the terminology.. 
Sampling is for per-task PMU drivers which i915 and this are not.

> The HW interface we are using is to simply read XE_OAG_*_BUSY_FREE.
> At the same time we are trying to add new uapi called xe_perf (that has
> nothing to do with perf, sigh) that exposes OA as streams with ioctl.
> 
> Also, at the same time we already do per-client engine utilization and
> with the usual very few clients, why couldn't userspace just aggregate
> the values per engine?  Is it really useful to expose this HW counter to
> userspace? From a quick look, it doesn't seem that much more accurate
> to use the global (per-engine-class) counter.  The bad non-performant
> part IMO of the per-client side is the client-discovery via /proc

Once upon a time we were saying why we need these new group busyness 
thingies when we got per engine, but semantics are different and people 
(L0) were very insisting :shrug:

IMHO group busyness is weak and next to useless for end users and 
intel_gpu_top like tools. But it is not a discussion for me.

Aggregating fdinfo stats would IMO be better semantics but wasteful and 
not showing in-kernel stuff like maybe clearing and migrations via blitter.

> Also not clear to me why we need the percpu part if we are collecting
> the GPU counters. It's more than 10 years I last played with the
> implementation side of perf counters, so I'm needing a refresh while
> looking at this.

Per cpu.. you mean cpu hotplug handling? Perf core mandates it.

> FYI I started to look to thi series because of the problem reported in
> i915 wrt perf counters while unbinding the device:
> 
> https://lore.kernel.org/lkml/20240115170120.662220-1-tvrtko.ursulin@linux.intel.com/T/#me72abfa2771e6fc94b167ce47efdbf391cc313ab
> 
> and
> 
> https://lore.kernel.org/all/20240213180302.47266-1-umesh.nerlige.ramappa@intel.com/
> 
> Tvrtko, any additional feedback you got from the perf/core side for that
> series?

Good that you found it in the archives otherwise I could be thinking I 
sent it to /dev/null. Does that answer you? :)

IMO best solution is to fix the perf core for hot unbind and have i915 
like counters. Other options are all flawed and weak.

Regards,

Tvrtko
