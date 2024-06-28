Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3A7C2BBCA
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43A110E209;
	Fri, 28 Jun 2024 09:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CI7XYSNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971210E209
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719567483; x=1751103483;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xZnFD51ThxA4xrBmnqERM6+KBqun0hwwXXsMJKXzz2w=;
 b=CI7XYSNtztXwspX/H1cfzSBNJbpNREdxNK4XEozC99Q44czGzpAgjMUR
 Ct5ZwzMyC48ZyfwK4avFnJprOTtKfxXzX8TLtwbau/iomLHN1fYER50M8
 u6R+6rn9ed3RRiXfUTZF93PHmgfq5To5aiZfQzgnEMQEgt3faxkX5fFq2
 +Vu3hiLzKcS8vNQL+zKbxMFqvGABm6wba1rEQ5saHmUj3aLNGqIXpeUrh
 dFy21s60xXwsgsUnggastL0vANK4zIipo86a6K1eH85cjAw6kvQbXew4E
 hXay5Kg5Qs/DYIPUPEK+UyxHgWT1I5lcjJKGBBfb78qjq8TLHcd3tRLQL Q==;
X-CSE-ConnectionGUID: JCwsd9DBRVSdZuTmKUdo8Q==
X-CSE-MsgGUID: m9vWb7anQSOb6bDNcNSTLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="28136569"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="28136569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:38:03 -0700
X-CSE-ConnectionGUID: Wb3ABKajRm6kwcaJxz5iXA==
X-CSE-MsgGUID: J8iT0EvgTgK+oG+jtnfUUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="44523812"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 02:37:59 -0700
Message-ID: <888bf4a4-77eb-49c4-b8d2-b3252f32a64f@linux.intel.com>
Date: Fri, 28 Jun 2024 15:11:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] drm/xe/pmu: Enable PMU interface
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, ashutosh.dixit@intel.com, rodrigo.vivi@intel.com,
 krishnaiah.bommu@intel.com, lucas.demarchi@intel.com,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <20240613100411.1579218-3-riana.tauro@intel.com>
 <ZnSIZf4PIW9CL4LQ@orsosgc001>
 <9fff12e4-a577-4a37-a9ab-55dc8e8ffbf0@linux.intel.com>
 <Zn2NyxfoHNByLv95@orsosgc001>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <Zn2NyxfoHNByLv95@orsosgc001>
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


On 27/06/24 21:35, Umesh Nerlige Ramappa wrote:
> On Thu, Jun 27, 2024 at 12:19:44PM +0530, Aravind Iddamsetty wrote:
>>
>> On 21/06/24 01:22, Umesh Nerlige Ramappa wrote:
>>> On Thu, Jun 13, 2024 at 03:34:11PM +0530, Riana Tauro wrote:
>>>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>>
>>>> There are a set of engine group busyness counters provided by HW which are
>>>> perfect fit to be exposed via PMU perf events.
>>>>
>>>> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>>>
>>>> events can be listed using:
>>>> perf list
>>>>  xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>>>  xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>>>  xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>>>  xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>>>
>>>> and can be read using:
>>>>
>>>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>>>           time        counts unit events
>>>>     1.001139062            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     2.003294678            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     3.005199582            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     4.007076497            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     5.008553068            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     6.010531563        43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     7.012468029        44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     8.013463515            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>     9.015300183            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>    10.017233010            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>    10.971934120            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>>>
>>>> The pmu base implementation is taken from i915.
>>>>
>>>> v2:
>>>> Store last known value when device is awake return that while the GT is
>>>> suspended and then update the driver copy when read during awake.
>>>>
>>>> v3:
>>>> 1. drop init_samples, as storing counters before going to suspend should
>>>> be sufficient.
>>>> 2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
>>>> dropped helpers to store and read samples.
>>>> 3. use xe_device_mem_access_get_if_ongoing to check if device is active
>>>> before reading the OA registers.
>>>> 4. dropped format attr as no longer needed
>>>> 5. introduce xe_pmu_suspend to call engine_group_busyness_store
>>>> 6. few other nits.
>>>>
>>>> v4: minor nits.
>>>>
>>>> v5: take forcewake when accessing the OAG registers
>>>>
>>>> v6:
>>>> 1. drop engine_busyness_sample_type
>>>> 2. update UAPI documentation
>>>>
>>>> v7:
>>>> 1. update UAPI documentation
>>>> 2. drop MEDIA_GT specific change for media busyness counter.
>>>>
>>>> v8:
>>>> 1. rebase
>>>> 2. replace mem_access_if_ongoing with xe_pm_runtime_get_if_active
>>>> 3. remove interrupts pmu event
>>>>
>>>> v9: replace drmm_add_action_or_reset with devm (Matthew Auld)
>>>>
>>>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/Makefile          |   2 +
>>>> drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>>> drivers/gpu/drm/xe/xe_device.c       |   2 +
>>>> drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>>> drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>>> drivers/gpu/drm/xe/xe_module.c       |   5 +
>>>> drivers/gpu/drm/xe/xe_pmu.c          | 631 +++++++++++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>>>> drivers/gpu/drm/xe/xe_pmu_types.h    |  67 +++
>>>> include/uapi/drm/xe_drm.h            |  39 ++
>>>> 10 files changed, 783 insertions(+)
>>>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>>> create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>>> create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index cbf961b90237..83bf1e07669b 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -278,6 +278,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>>     i915-display/skl_universal_plane.o \
>>>>     i915-display/skl_watermark.o
>>>>
>>>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>>>> +
>>>> ifeq ($(CONFIG_ACPI),y)
>>>>     xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>>         i915-display/intel_acpi.o \
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> index 47c26c37608d..22821dcd4e1b 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> @@ -390,6 +390,11 @@
>>>> #define   INVALIDATION_BROADCAST_MODE_DIS    REG_BIT(12)
>>>> #define   GLOBAL_INVALIDATION_MODE        REG_BIT(2)
>>>>
>>>> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE        XE_REG(0xdb80)
>>>> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE        XE_REG(0xdba0)
>>>> +#define XE_OAG_BLT_BUSY_FREE            XE_REG(0xdbbc)
>>>> +#define XE_OAG_RENDER_BUSY_FREE            XE_REG(0xdbdc)
>>>> +
>>>> #define HALF_SLICE_CHICKEN5            XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>>>> #define   DISABLE_SAMPLE_G_PERFORMANCE        REG_BIT(0)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 64691a56d59c..bb00c8c9ec9b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -668,6 +668,8 @@ int xe_device_probe(struct xe_device *xe)
>>>>
>>>>     xe_hwmon_register(xe);
>>>>
>>>> +    xe_pmu_register(&xe->pmu);
>>>> +
>>>>     return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>>>
>>>> err_fini_display:
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 52bc461171d5..a5dba7325cf1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -18,6 +18,7 @@
>>>> #include "xe_lmtt_types.h"
>>>> #include "xe_memirq_types.h"
>>>> #include "xe_platform_types.h"
>>>> +#include "xe_pmu.h"
>>>> #include "xe_pt_types.h"
>>>> #include "xe_sriov_types.h"
>>>> #include "xe_step_types.h"
>>>> @@ -473,6 +474,9 @@ struct xe_device {
>>>>         int mode;
>>>>     } wedged;
>>>>
>>>> +    /** @pmu: performance monitoring unit */
>>>> +    struct xe_pmu pmu;
>>>> +
>>>>     /* private: */
>>>>
>>>> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 57d84751e160..477d0ae5f230 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -782,6 +782,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>>     if (err)
>>>>         goto err_msg;
>>>>
>>>> +    xe_pmu_suspend(gt);
>>>> +
>>>>     err = xe_uc_suspend(&gt->uc);
>>>>     if (err)
>>>>         goto err_force_wake;
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>> index 3edeb30d5ccb..26f814f97fc2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -11,6 +11,7 @@
>>>> #include "xe_drv.h"
>>>> #include "xe_hw_fence.h"
>>>> #include "xe_pci.h"
>>>> +#include "xe_pmu.h"
>>>> #include "xe_sched_job.h"
>>>>
>>>> struct xe_modparam xe_modparam = {
>>>> @@ -74,6 +75,10 @@ static const struct init_funcs init_funcs[] = {
>>>>         .init = xe_sched_job_module_init,
>>>>         .exit = xe_sched_job_module_exit,
>>>>     },
>>>> +    {
>>>> +        .init = xe_pmu_init,
>>>> +        .exit = xe_pmu_exit,
>>>> +    },
>>>>     {
>>>>         .init = xe_register_pci_driver,
>>>>         .exit = xe_unregister_pci_driver,
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>> new file mode 100644
>>>> index 000000000000..64960a358af2
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>> @@ -0,0 +1,631 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_managed.h>
>>>> +#include <drm/xe_drm.h>
>>>> +
>>>> +#include "regs/xe_gt_regs.h"
>>>> +#include "xe_device.h"
>>>> +#include "xe_force_wake.h"
>>>> +#include "xe_gt_clock.h"
>>>> +#include "xe_mmio.h"
>>>> +#include "xe_macros.h"
>>>> +#include "xe_pm.h"
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
>>>> +    u64 val;
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
>>>> +    int sample_type = config_counter(config);
>>>> +    const unsigned int gt_id = gt->info.id;
>>>> +    struct xe_device *xe = gt->tile->xe;
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +    unsigned long flags;
>>>> +    bool device_awake;
>>>> +    u64 val;
>>>> +
>>>> +    device_awake = xe_pm_runtime_get_if_active(xe);
>>>> +    if (device_awake) {
>>>> +        XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>>> +        val = __engine_group_busyness_read(gt, sample_type);
>>>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +        xe_pm_runtime_put(xe);
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
>>>> +    for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>>>> +        pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>>>> +
>>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>>> +}
>>>> +
>>>> +static int
>>>> +config_status(struct xe_device *xe, u64 config)
>>>> +{
>>>> +    unsigned int gt_id = config_gt_id(config);
>>>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>> +
>>>> +    if (gt_id >= XE_PMU_MAX_GT)
>>>> +        return -ENOENT;
>>>> +
>>>> +    switch (config_counter(config)) {
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
>>>> +    const u64 config = event->attr.config;
>>>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>>>> +    u64 val;
>>>> +
>>>> +    switch (config_counter(config)) {
>>>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>>>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>>>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>>>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>>>> +        val = engine_group_busyness_read(gt, config);
>>>> +        break;
>>>> +    default:
>>>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>> +    }
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
>>>> +    /*
>>>> +     * Store the current counter value so we can report the correct delta
>>>> +     * for all listeners. Even when the event was already enabled and has
>>>> +     * an existing non-zero value.
>>>> +     */
>>>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>>> +}
>>>> +
>>>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>>>> +{
>>>> +    struct xe_device *xe =
>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +
>>>> +    if (pmu->closed)
>>>> +        return;
>>>> +
>>>> +    xe_pmu_enable(event);
>>>> +    event->hw.state = 0;
>>>> +}
>>>> +
>>>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>>> +{
>>>> +    if (flags & PERF_EF_UPDATE)
>>>> +        xe_pmu_event_read(event);
>>>> +
>>>> +    event->hw.state = PERF_HES_STOPPED;
>>>> +}
>>>> +
>>>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>>>> +{
>>>> +    struct xe_device *xe =
>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>> +
>>>> +    if (pmu->closed)
>>>> +        return -ENODEV;
>>>> +
>>>> +    if (flags & PERF_EF_START)
>>>> +        xe_pmu_event_start(event, flags);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>>>> +{
>>>> +    xe_pmu_event_stop(event, PERF_EF_UPDATE);
>>>> +}
>>>> +
>>>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +struct xe_ext_attribute {
>>>> +    struct device_attribute attr;
>>>> +    unsigned long val;
>>>> +};
>>>> +
>>>> +static ssize_t xe_pmu_event_show(struct device *dev,
>>>> +                 struct device_attribute *attr, char *buf)
>>>> +{
>>>> +    struct xe_ext_attribute *eattr;
>>>> +
>>>> +    eattr = container_of(attr, struct xe_ext_attribute, attr);
>>>> +    return sprintf(buf, "config=0x%lx\n", eattr->val);
>>>> +}
>>>> +
>>>> +static ssize_t cpumask_show(struct device *dev,
>>>> +                struct device_attribute *attr, char *buf)
>>>> +{
>>>> +    return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RO(cpumask);
>>>> +
>>>> +static struct attribute *xe_cpumask_attrs[] = {
>>>> +    &dev_attr_cpumask.attr,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>>>> +    .attrs = xe_cpumask_attrs,
>>>> +};
>>>> +
>>>> +#define __event(__counter, __name, __unit) \
>>>> +{ \
>>>> +    .counter = (__counter), \
>>>> +    .name = (__name), \
>>>> +    .unit = (__unit), \
>>>> +}
>>>> +
>>>> +static struct xe_ext_attribute *
>>>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>>>> +{
>>>> +    sysfs_attr_init(&attr->attr.attr);
>>>> +    attr->attr.attr.name = name;
>>>> +    attr->attr.attr.mode = 0444;
>>>> +    attr->attr.show = xe_pmu_event_show;
>>>> +    attr->val = config;
>>>> +
>>>> +    return ++attr;
>>>> +}
>>>> +
>>>> +static struct perf_pmu_events_attr *
>>>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>>>> +         const char *str)
>>>> +{
>>>> +    sysfs_attr_init(&attr->attr.attr);
>>>> +    attr->attr.attr.name = name;
>>>> +    attr->attr.attr.mode = 0444;
>>>> +    attr->attr.show = perf_event_sysfs_show;
>>>> +    attr->event_str = str;
>>>> +
>>>> +    return ++attr;
>>>> +}
>>>> +
>>>> +static struct attribute **
>>>> +create_event_attributes(struct xe_pmu *pmu)
>>>> +{
>>>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>> +    static const struct {
>>>> +        unsigned int counter;
>>>> +        const char *name;
>>>> +        const char *unit;
>>>> +    } events[] = {
>>>> +        __event(0, "render-group-busy", "ns"),
>>>> +        __event(1, "copy-group-busy", "ns"),
>>>> +        __event(2, "media-group-busy", "ns"),
>>>> +        __event(3, "any-engine-group-busy", "ns"),
>>>> +    };
>>>> +
>>>> +    struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>>>> +    struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>>>> +    struct attribute **attr = NULL, **attr_iter;
>>>> +    unsigned int count = 0;
>>>> +    unsigned int i, j;
>>>> +    struct xe_gt *gt;
>>>> +
>>>> +    /* Count how many counters we will be exposing. */
>>>> +    for_each_gt(gt, xe, j) {
>>>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>>>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>>>> +
>>>> +            if (!config_status(xe, config))
>>>> +                count++;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /* Allocate attribute objects and table. */
>>>> +    xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>>>> +    if (!xe_attr)
>>>> +        goto err_alloc;
>>>> +
>>>> +    pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>>>> +    if (!pmu_attr)
>>>> +        goto err_alloc;
>>>> +
>>>> +    /* Max one pointer of each attribute type plus a termination entry. */
>>>> +    attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>>>> +    if (!attr)
>>>> +        goto err_alloc;
>>>> +
>>>> +    xe_iter = xe_attr;
>>>> +    pmu_iter = pmu_attr;
>>>> +    attr_iter = attr;
>>>> +
>>>> +    for_each_gt(gt, xe, j) {
>>>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>>>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>>>> +            char *str;
>>>> +
>>>> +            if (config_status(xe, config))
>>>> +                continue;
>>>> +
>>>> +            str = kasprintf(GFP_KERNEL, "%s-gt%u",
>>>> +                    events[i].name, j);
>>>> +            if (!str)
>>>> +                goto err;
>>>> +
>>>> +            *attr_iter++ = &xe_iter->attr.attr;
>>>> +            xe_iter = add_xe_attr(xe_iter, str, config);
>>>> +
>>>> +            if (events[i].unit) {
>>>> +                str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>>>> +                        events[i].name, j);
>>>> +                if (!str)
>>>> +                    goto err;
>>>> +
>>>> +                *attr_iter++ = &pmu_iter->attr.attr;
>>>> +                pmu_iter = add_pmu_attr(pmu_iter, str,
>>>> +                            events[i].unit);
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    pmu->xe_attr = xe_attr;
>>>> +    pmu->pmu_attr = pmu_attr;
>>>> +
>>>> +    return attr;
>>>> +
>>>> +err:
>>>> +    for (attr_iter = attr; *attr_iter; attr_iter++)
>>>> +        kfree((*attr_iter)->name);
>>>> +
>>>> +err_alloc:
>>>> +    kfree(attr);
>>>> +    kfree(xe_attr);
>>>> +    kfree(pmu_attr);
>>>> +
>>>> +    return NULL;
>>>> +}
>>>> +
>>>> +static void free_event_attributes(struct xe_pmu *pmu)
>>>> +{
>>>> +    struct attribute **attr_iter = pmu->events_attr_group.attrs;
>>>> +
>>>> +    for (; *attr_iter; attr_iter++)
>>>> +        kfree((*attr_iter)->name);
>>>> +
>>>> +    kfree(pmu->events_attr_group.attrs);
>>>> +    kfree(pmu->xe_attr);
>>>> +    kfree(pmu->pmu_attr);
>>>> +
>>>> +    pmu->events_attr_group.attrs = NULL;
>>>> +    pmu->xe_attr = NULL;
>>>> +    pmu->pmu_attr = NULL;
>>>> +}
>>>> +
>>>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>>>> +{
>>>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
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
>>>> +    /*
>>>> +     * Unregistering an instance generates a CPU offline event which we must
>>>> +     * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>>>> +     */
>>>> +    if (pmu->closed)
>>>> +        return 0;
>>>> +
>>>> +    if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>>>> +        target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>>>> +
>>>> +        /* Migrate events if there is a valid target */
>>>> +        if (target < nr_cpu_ids) {
>>>> +            cpumask_set_cpu(target, &xe_pmu_cpumask);
>>>> +            xe_pmu_target_cpu = target;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>>>> +        perf_pmu_migrate_context(&pmu->base, cpu, target);
>>>> +        pmu->cpuhp.cpu = target;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>>>> +
>>>> +int xe_pmu_init(void)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>>>> +                      "perf/x86/intel/xe:online",
>>>> +                      xe_pmu_cpu_online,
>>>> +                      xe_pmu_cpu_offline);
>>>> +    if (ret < 0)
>>>> +        pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>>>> +              ret);
>>>> +    else
>>>> +        cpuhp_slot = ret;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +void xe_pmu_exit(void)
>>>> +{
>>>> +    if (cpuhp_slot != CPUHP_INVALID)
>>>> +        cpuhp_remove_multi_state(cpuhp_slot);
>>>> +}
>>>> +
>>>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>>>> +{
>>>> +    if (cpuhp_slot == CPUHP_INVALID)
>>>> +        return -EINVAL;
>>>> +
>>>> +    return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>>>> +}
>>>> +
>>>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>>>> +{
>>>> +    cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>>>> +}
>>>> +
>>>> +void xe_pmu_suspend(struct xe_gt *gt)
>>>> +{
>>>> +    engine_group_busyness_store(gt);
>>>> +}
>>>> +
>>>> +static void xe_pmu_unregister(void *arg)
>>>> +{
>>>> +    struct xe_pmu *pmu = arg;
>>>> +
>>>> +    if (!pmu->base.event_init)
>>>> +        return;
>>>> +
>>>> +    /*
>>>> +     * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>>>> +     * ensures all currently executing ones will have exited before we
>>>> +     * proceed with unregistration.
>>>> +     */
>>>> +    pmu->closed = true;
>>>> +    synchronize_rcu();
>>>> +
>>>> +    xe_pmu_unregister_cpuhp_state(pmu);
>>>> +
>>>> +    perf_pmu_unregister(&pmu->base);
>>>> +    pmu->base.event_init = NULL;
>>>> +    kfree(pmu->base.attr_groups);
>>>> +    kfree(pmu->name);
>>>> +    free_event_attributes(pmu);
>>>> +}
>>>> +
>>>> +void xe_pmu_register(struct xe_pmu *pmu)
>>>> +{
>>>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>>> +    const struct attribute_group *attr_groups[] = {
>>>> +        &pmu->events_attr_group,
>>>> +        &xe_pmu_cpumask_attr_group,
>>>> +        NULL
>>>> +    };
>>>> +
>>>> +    int ret = -ENOMEM;
>>>> +
>>>> +    spin_lock_init(&pmu->lock);
>>>> +    pmu->cpuhp.cpu = -1;
>>>> +
>>>> +    pmu->name = kasprintf(GFP_KERNEL,
>>>> +                  "xe_%s",
>>>> +                  dev_name(xe->drm.dev));
>>>> +    if (pmu->name)
>>>> +        /* tools/perf reserves colons as special. */
>>>> +        strreplace((char *)pmu->name, ':', '_');
>>>> +
>>>> +    if (!pmu->name)
>>>> +        goto err;
>>>> +
>>>> +    pmu->events_attr_group.name = "events";
>>>> +    pmu->events_attr_group.attrs = create_event_attributes(pmu);
>>>> +    if (!pmu->events_attr_group.attrs)
>>>> +        goto err_name;
>>>> +
>>>> +    pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>>> +                    GFP_KERNEL);
>>>> +    if (!pmu->base.attr_groups)
>>>> +        goto err_attr;
>>>> +
>>>> +    pmu->base.module    = THIS_MODULE;
>>>> +    pmu->base.task_ctx_nr    = perf_invalid_context;
>>>> +    pmu->base.event_init    = xe_pmu_event_init;
>>>> +    pmu->base.add        = xe_pmu_event_add;
>>>> +    pmu->base.del        = xe_pmu_event_del;
>>>> +    pmu->base.start        = xe_pmu_event_start;
>>>> +    pmu->base.stop        = xe_pmu_event_stop;
>>>> +    pmu->base.read        = xe_pmu_event_read;
>>>> +    pmu->base.event_idx    = xe_pmu_event_event_idx;
>>>> +
>>>> +    ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>>>> +    if (ret)
>>>> +        goto err_groups;
>>>> +
>>>> +    ret = xe_pmu_register_cpuhp_state(pmu);
>>>> +    if (ret)
>>>> +        goto err_unreg;
>>>> +
>>>> +    ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>>>> +    if (ret)
>>>> +        goto err_cpuhp;
>>>> +
>>>> +    return;
>>>> +
>>>> +err_cpuhp:
>>>> +    xe_pmu_unregister_cpuhp_state(pmu);
>>>> +err_unreg:
>>>> +    perf_pmu_unregister(&pmu->base);
>>>> +err_groups:
>>>> +    kfree(pmu->base.attr_groups);
>>>> +err_attr:
>>>> +    pmu->base.event_init = NULL;
>>>> +    free_event_attributes(pmu);
>>>> +err_name:
>>>> +    kfree(pmu->name);
>>>> +err:
>>>> +    drm_notice(&xe->drm, "Failed to register PMU!\n");
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>>>> new file mode 100644
>>>> index 000000000000..8afa256f9dac
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>>>> @@ -0,0 +1,26 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_PMU_H_
>>>> +#define _XE_PMU_H_
>>>> +
>>>> +#include "xe_pmu_types.h"
>>>> +
>>>> +struct xe_gt;
>>>> +
>>>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>>>> +int xe_pmu_init(void);
>>>> +void xe_pmu_exit(void);
>>>> +void xe_pmu_register(struct xe_pmu *pmu);
>>>> +void xe_pmu_suspend(struct xe_gt *gt);
>>>> +#else
>>>> +static inline int xe_pmu_init(void) { return 0; }
>>>> +static inline void xe_pmu_exit(void) {}
>>>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>>>> +#endif
>>>> +
>>>> +#endif
>>>> +
>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>> new file mode 100644
>>>> index 000000000000..e86e8d7e0356
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>>> @@ -0,0 +1,67 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_PMU_TYPES_H_
>>>> +#define _XE_PMU_TYPES_H_
>>>> +
>>>> +#include <linux/perf_event.h>
>>>> +#include <linux/spinlock_types.h>
>>>> +#include <uapi/drm/xe_drm.h>
>>>> +
>>>> +enum {
>>>> +    __XE_SAMPLE_RENDER_GROUP_BUSY,
>>>> +    __XE_SAMPLE_COPY_GROUP_BUSY,
>>>> +    __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>>> +    __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>>> +    __XE_NUM_PMU_SAMPLERS
>>>> +};
>>>> +
>>>> +#define XE_PMU_MAX_GT 2
>>>> +
>>>> +struct xe_pmu {
>>>> +    /**
>>>> +     * @cpuhp: Struct used for CPU hotplug handling.
>>>> +     */
>>>> +    struct {
>>>> +        struct hlist_node node;
>>>> +        unsigned int cpu;
>>>> +    } cpuhp;
>>>> +    /**
>>>> +     * @base: PMU base.
>>>> +     */
>>>> +    struct pmu base;
>>>> +    /**
>>>> +     * @closed: xe is unregistering.
>>>> +     */
>>>> +    bool closed;
>>>> +    /**
>>>> +     * @name: Name as registered with perf core.
>>>> +     */
>>>> +    const char *name;
>>>> +    /**
>>>> +     * @lock: Lock protecting enable mask and ref count handling.
>>>> +     */
>>>> +    spinlock_t lock;
>>>> +    /**
>>>> +     * @sample: Current and previous (raw) counters.
>>>> +     *
>>>> +     * These counters are updated when the device is awake.
>>>> +     */
>>>> +    u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>>>> +    /**
>>>> +     * @events_attr_group: Device events attribute group.
>>>> +     */
>>>> +    struct attribute_group events_attr_group;
>>>> +    /**
>>>> +     * @xe_attr: Memory block holding device attributes.
>>>> +     */
>>>> +    void *xe_attr;
>>>> +    /**
>>>> +     * @pmu_attr: Memory block holding device attributes.
>>>> +     */
>>>> +    void *pmu_attr;
>>>> +};
>>>> +
>>>> +#endif
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index d7b0903c22b2..07ca545354f7 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -1370,6 +1370,45 @@ struct drm_xe_wait_user_fence {
>>>>     __u64 reserved[2];
>>>> };
>>>>
>>>> +/**
>>>> + * DOC: XE PMU event config IDs
>>>> + *
>>>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
>>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>>> + * particular event.
>>>> + *
>>>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>> + *
>>>> + * .. code-block:: C
>>>> + *
>>>> + *    struct perf_event_attr attr;
>>>> + *    long long count;
>>>> + *    int cpu = 0;
>>>> + *    int fd;
>>>> + *
>>>> + *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>> + *    attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>>>> + *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>> + *    attr.use_clockid = 1;
>>>> + *    attr.clockid = CLOCK_MONOTONIC;
>>>> + *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>> + *
>>>> + *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>> + */
>>>> +
>>>> +/*
>>>> + * Top bits of every counter are GT id.
>>>> + */
>>>> +#define __XE_PMU_GT_SHIFT (56)
>>>> +
>>>> +#define ___XE_PMU_OTHER(gt, x) \
>>>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>> +
>>>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 0)
>>>> +#define XE_PMU_COPY_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 1)
>>>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 2)
>>>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)    ___XE_PMU_OTHER(gt, 3)
>>>
>>> + Lucas for inputs
>>>
>>> We should align this to the interface planned for other PMU busyness counters as well as how we do PCEU. i.e.
>>>
>>> 1) counters are in ticks
>>> 2) total time in ticks is also exported to the user.
>>>
>>> For 1), I would just append TICKS to the counter names and drop the conversion to _ns in __engine_group_busyness_read(). Also, drop the patch that adds this conversion helper.
>>>
>>> For 2) define a new counter - total active ticks that would return the 'CPU' timestamp converted to gpu ticks. The reason I am insisting on CPU timestamp here is because we want to have a time base that is ticking even when the GPU is idle.
>>
>> why can't we expose what the HW presents[1] to us via register and leave the interpretation to userspace.
>
> HW is indeed exposing ticks. In this case, I am suggesting to expose that directly to the user, so I think you are saying the same.
correct
>
> As for interpretation, we need to make sure it works consistently in SRIOV. The L0 API for group busyness itself imposes the requirement for another counter to make sense of [1]. This additional counter has always existed, but in prior implementations, it was just using the CPU time in the equation. The CPU sample time is always returned in all the PMU counters. With SRIOV, it will still be CPU time, but only the time that a VF executed for and that information is only available to the KMD/GuC.  Without that information, interpreting the ticks in [1] will not be meaningful. 

I hope in SRIOV case you are mentioning about accessing these counters from PF right? if it is from VF I'm not sure if these registers are accessible.

Regards,
Aravind.
>
> Regards,
> Umesh
>
>
>>
>> Thanks,
>> Aravind.
>>>
>>> Regards,
>>> Umesh
>>>
>>>> +
>>>> #if defined(__cplusplus)
>>>> }
>>>> #endif
>>>> -- 
>>>> 2.40.0
>>>>
