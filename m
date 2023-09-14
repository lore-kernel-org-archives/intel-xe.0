Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D7ACA0ECD
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 04:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF11410E4F4;
	Thu, 14 Sep 2023 04:34:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3214410E4F4
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 04:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694666077; x=1726202077;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KmiKF2eT1lHVNHL6RrSq5sciSuTw3Aw8NCSq6qK19fA=;
 b=l7CdXiZEi2hjhaQGGG/0QAVq6Z5Pafmy5cWC3/3jJseHQveSFw7flZSk
 eWj64qJnfN/kkWaY06PwMVoGRNVf360RDXVo/WAMmjWC+GicHPsFAwjl1
 p2xWSfKkBX3YJyi/VgkmPqRldry/7mugtv3EbS3chxWelydFpiMEsYkWr
 w1ytLJDrXIOBVLvWc/FchlsZiAYx0XzxinWw7MYg8B2I9IFAyVAyRIqOa
 QKz6MWC8KtEzQHZFEuvhAX+w7vupzbhvOS1Yxrm0z+j4oaXihlp+klhxI
 6ZtJEB9Nic0r7JXKH8436qFuo6g7HhomHtnUeZAuXspfaWBL9BMdKmHNw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377757619"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="377757619"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 21:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="809909047"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="809909047"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 21:34:33 -0700
Message-ID: <a681fe7a-4487-a8a6-1830-bdc23cc98ff9@linux.intel.com>
Date: Thu, 14 Sep 2023 10:11:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230901070648.1100049-1-aravind.iddamsetty@linux.intel.com>
 <20230901070648.1100049-4-aravind.iddamsetty@linux.intel.com>
 <87wmx9yxsm.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87wmx9yxsm.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v6 3/3] drm/xe/pmu: Enable PMU interface
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 02/09/23 10:30, Dixit, Ashutosh wrote:

Hi Ashutosh,
> On Fri, 01 Sep 2023 00:06:48 -0700, Aravind Iddamsetty wrote:
> Hi Aravind,
>
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>> +{
>> +	u64 val;
>> +
>> +	switch (sample_type) {
>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +		break;
>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>> +		/*
>> +		 * This GSI offset is not replicated in media specific range
>> +		 * BSPEC: 67789, 46559
>> +		 */
>> +		if (gt->info.type == XE_GT_TYPE_MEDIA)
>> +			val = xe_mmio_read32(gt->tile->primary_gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
> Hmm, this appeared in this version. Is this really needed? Did you test
> this on MTL media gt?
>
> E.g. if this is needed we'd need to do similar stuff in freq_act_show()
> when reading MTL_MIRROR_TARGET_WP1, but we don't do this there. So we don't
> see this done anywhere else in XE.
>
> I don't understand this multicast steering but appears XE mmio read/write
> functions might already be taking care of this via:
>
> 	if (reg.addr < gt->mmio.adj_limit)

As per the BSPEC: 67789, 46559 the XE_OAG_ANY_MEDIA_FF_BUSY_FREE register falls in the range
0038D120 - 0038DFFF but this belongs to DVPMEDIAVCCRO3D, means the above register is not
replicated for media gt hencethe above register math is not valid in these case.

I did verify on MTL but the register is not updating properly the same was reported by windows folks as well,
so I can do one thing can make this change as separate patch and track that for MTL.
>
> So could you please check this out and take out this code if not needed.
>
>> +		else
>> +			val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
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
>> +	int sample_type = config_counter(config) - 1;
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
>> +	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>> +		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
> Just a reminder about what we discussed about this earlier. Here we are
> saving all these samples unconditionally, whether or not PMU will ever be
> used. We have deferred the optimization to only save enabled counters to a
> later patch. So we might still come back and do that.
OK
>
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
> Just curious, in case you know, why do we do this here rather than just a:
>
> 	local64_set(new, &event->count);
>
> The code is the same as i915 so is likely correct, so no issue, if you
> don't know just ignore this comment. No changes needed here.
So a PMU counter can be opened by multiple clients simultaneously in which case
we shall always report the relative value per the clients view, hence that math.
>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 86f16d50e9cc..8a59350b3cea 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1056,6 +1056,45 @@ struct drm_xe_vm_madvise {
>> 	__u64 reserved[2];
>>  };
>>
>> +/* PMU event config IDs */
>> +
>> +/*
>> + * The below config IDs needs to be filled in the struct perf_even_attr field
>> + * as part of perf_event_open call to read a particular event.
>> + *
>> + * check man perf_event_open.
>> + *
>> + * example on how to open an event:
>> + * .. code-block:: C
>> + *	struct perf_event_attr pe;
>> + *	long long count;
>> + *	int cpu = 0;
>> + *	int fd;
>> + *
>> + *	memset(&pe, 0, sizeof(struct perf_event_attr));
>> + *	pe.type = type // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>> + *	pe.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>> + *	pe.use_clockid = 1;
>> + *	pe.clockid = CLOCK_MONOTONIC;
>> + *	pe.config = XE_PMU_INTERRUPTS(0);
>> + *
>> + *	fd = perf_event_open(&pe, -1, cpu, -1, 0);
>> + */
> Pretty good, let me fix up the formatting, style and some typos. But please
> check.
>
> /**
>  * XE PMU event config ID's
>  *
>  * Check 'man perf_event_open' to use these ID's in 'struct
>  * perf_event_attr' as part of perf_event_open syscall to read particular
>  * event counts.
>  *
>  * For example, to open the XE_PMU_INTERRUPTS(0) event:
>  *
>  * .. code-block:: C
>  *
>  *	struct perf_event_attr attr = {};
>  *	long long count;
>  *	int cpu = 0;
>  *	int fd;
>  *
>  *	attr.type = type; /* /sys/bus/event_source/devices/xe_0000_56_00.0/type */
>  *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>  *	attr.use_clockid = 1;
>  *	attr.clockid = CLOCK_MONOTONIC;
>  *	attr.config = XE_PMU_INTERRUPTS(0);
>  *
>  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>  */
we have a perf_event_open API we needn't use syscall so i'll mention that, but rest of the text looks good.
>
> Apart from the couple of things above to be fixed up, I don't want to hold
> onto this review any longer, so this is now:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

thanks, so will respin the series by nuking the MTL change.

Regards,
Aravind.
