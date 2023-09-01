Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C3CA0FE3
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 03:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CD910E121;
	Fri,  1 Sep 2023 03:25:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A6910E121
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 03:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693538740; x=1725074740;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=valo3vhyA77bkMQT8M/eNqCmjwvpNIoCflFmFpJslrk=;
 b=n61aIV/ojwYGTceM5OfVNzR+JxoYy+5w64Dmcs7lwnKAMPrfaAqpl0f3
 tW3vYDethMlv235RTQ+Ay/iPbKByXfYQdtOHalxCuMi0q1xv3G/qbd8HS
 KpxbY3UMYzORFvrVed81YfSPcjaiyGa2WA04Tjzlo6JFcSmEva/6+mKAE
 fOitz2FuVPnKAdzx9lgaDLRhT1iLddzGMEf213GJSdHBmUcpS/E9ktjhX
 75T/nfZKNKquchIuM+TrG8mYRsLqrFBJ6r1FV5GhSaBJjPX6qJd+Sf0Rc
 zaWecWqiZbJIcljkV9EcnPJemPo5EPXcoLAe7b94MMRsdsR9PVj36dMlB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356439628"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="356439628"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 20:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809910184"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="809910184"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.80])
 ([10.145.162.80])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 20:25:34 -0700
Message-ID: <c37ec166-531b-3ac6-18c6-bef186b23a1b@linux.intel.com>
Date: Fri, 1 Sep 2023 09:04:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-4-aravind.iddamsetty@linux.intel.com>
 <87a5u724xe.wl-ashutosh.dixit@intel.com>
 <3b85e034-b1a4-29d1-2e4f-08ea6562b6ba@linux.intel.com>
 <877cpb173l.wl-ashutosh.dixit@intel.com>
 <496fa477-0361-5e65-e7a8-d3c0d02e114a@linux.intel.com>
 <77134894-47b2-98ce-d3e5-f30e611e03df@intel.com>
 <b9557547-1b36-5dc0-b2b9-0fdcf11c5141@linux.intel.com>
 <3c4ab23e-3b63-2f6f-a397-217f1818ead2@intel.com>
 <8734zy2471.wl-ashutosh.dixit@intel.com>
 <2872a593-8c93-a7c4-331a-51dc946db581@intel.com>
 <871qfi228i.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <871qfi228i.wl-ashutosh.dixit@intel.com>
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


On 01/09/23 05:28, Dixit, Ashutosh wrote:
HI Ashutosh,
> On Thu, 31 Aug 2023 16:57:25 -0700, Belgaumkar, Vinay wrote:
>> On 8/31/2023 4:16 PM, Dixit, Ashutosh wrote:
>>> On Thu, 31 Aug 2023 16:22:10 -0700, Belgaumkar, Vinay wrote:
>>>>>>>>> +static void xe_pmu_event_read(struct perf_event *event)
>>>>>>>>> +{
>>>>>>>>> +    struct xe_device *xe =
>>>>>>>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>>>>>>>> +    struct hw_perf_event *hwc = &event->hw;
>>>>>>>>> +    struct xe_pmu *pmu = &xe->pmu;
>>>>>>>>> +    u64 prev, new;
>>>>>>>>> +
>>>>>>>>> +    if (pmu->closed) {
>>>>>>>>> +        event->hw.state = PERF_HES_STOPPED;
>>>>>>>>> +        return;
>>>>>>>>> +    }
>>>>>>>>> +again:
>>>>>>>>> +    prev = local64_read(&hwc->prev_count);
>>>>>>>>> +    new = __xe_pmu_event_read(event);
>>>>>>>>> +
>>>>>>>>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>>>>>>>>> +        goto again;
>>>>>>>>> +
>>>>>>>>> +    local64_add(new - prev, &event->count);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void xe_pmu_enable(struct perf_event *event)
>>>>>>>>> +{
>>>>>> The i915_pmu code checks which event is requested here and accordingly sets pmu->enable (which doesn't seem to be defined here yet). Any reason we are not doing this yet?
>>>>> in i915 pmu->enable is only used by events for which there is an internal timer sampler
>>>>> which periodically samples those events, this series is not adding such events.
>>>> Ok, the tracked events are bound by I915_NUM_PMU_SAMPLERS in i915, whereas
>>>> you have already defined the max non/tracking ones as
>>>> __XE_NUM_PMU_SAMPLERS, hence my confusion. Should we use a different name
>>>> in lieu of the tracked events which will be defined in subsequent patches?
>>>>
>>>> enum {
>>>>
>>>>          __I915_SAMPLE_FREQ_ACT = 0,
>>>>
>>>>          __I915_SAMPLE_FREQ_REQ,
>>>>          __I915_SAMPLE_RC6,
>>>>          __I915_SAMPLE_RC6_LAST_REPORTED,
>>>>          __I915_NUM_PMU_SAMPLERS
>>>>
>>>> };
>>> +enum {
>>> +       __XE_SAMPLE_RENDER_GROUP_BUSY,
>>> +       __XE_SAMPLE_COPY_GROUP_BUSY,
>>> +       __XE_SAMPLE_MEDIA_GROUP_BUSY,
>>> +       __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>>> +       __XE_NUM_PMU_SAMPLERS
>>> +};
>>> +
>>>
>>> I'd think any future events will be added after
>>> __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY, changing the value of
>>> __XE_NUM_PMU_SAMPLERS, no? Why do we need a different name?
>> I guess that'll work, but the events in i915 are divided into ones that
>> need the timer (non-engine) (max of I915_NUM_PMU_SAMPLERS) and the
>> per-engine events (that don't need the timer).
> i915 per engine events need timer. They are just stored in
> engine->pmu->sample[] array, not in i915->pmu->sample[][]
> array. __I915_NUM_PMU_SAMPLERS is the size of the 2nd array.
>
>> We now should have 3 types?
>> Non-engine-non-timer, non-engine-timer and per-engine?
> RC6 events in i915 are also non-engine-non-timer (same as this patch). So
> it's the same.
>
> __XE_NUM_PMU_SAMPLERS is just the size of the xe->pmu->sample[][] array.
>
>> Or just club together the non-engine ones?
> I'd say let's restrict here to reviewing this patch. Everything in this
> patch can be changed except the uapi, the implementation can be completely
> changed/enhanced by future patches. So we should just make sure the uapi
> should not change by future changes.
>
> Incidentally I am against exposing freq through the PMU since it is
> available through sysfs. But we can have that discussion when we get to it.
Thanks Ashutosh for taking up the queries, yup let's stick to this series and
handle the future changes as they come.

Regards,
Aravind.
>
> Thanks.
> --
> Ashutosh
