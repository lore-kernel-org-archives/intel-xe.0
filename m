Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144BEC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 06:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A904B10E225;
	Wed,  3 Jan 2024 06:59:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B35710E1EA
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704265180; x=1735801180;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IFmCh3Me3rM2u4gznRDVmnovk5+FZdvCI7Hc/LkjNG0=;
 b=Y08yJ1iToFHKUQljUH1bsWNxQT1CAhSRRRluwtjOCIG7KcKbR2hj09FN
 ftFvkaPHqfXXG4Ytf159thKEvFQtAITRAnHOp2pv5+GvCz67bDfLu38fq
 HLdJ2Z8AEaunDwCU01g46dGhmVomnPsTvF0PmqeaX31IXaxEXp/EzGQke
 go7wXThL42jiAvHU1QOvGmueXi4LB/0Tbyv6NTytTQZWiSwYuaVJQjAu2
 zFFcGiZQhwcILC3kyX5A5Ha5OrtDOA5IQiXv49pex/JhFBEA/XAhs1ur3
 Ph+Bg0AQGHroLo5HbVhPZ2T3H25BEOJhOPT1Bj+iZjgr/b++VkNX3qSsb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="463373407"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="463373407"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 22:59:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="28287269"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 22:59:37 -0800
Message-ID: <a7e0d7df-3727-4801-ba2d-35170afc8a1a@linux.intel.com>
Date: Wed, 3 Jan 2024 12:32:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/uapi: Add configs for Engine busyness
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-4-riana.tauro@intel.com>
 <4cb7f45b-c742-4bd2-ac96-c950d5d4301b@linux.intel.com>
 <a0a6c14b-4eca-40bf-b219-3c5e90c97f04@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <a0a6c14b-4eca-40bf-b219-3c5e90c97f04@intel.com>
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


On 1/3/24 12:10, Riana Tauro wrote:
>
> Hi Aravind
>
> On 1/3/2024 10:56 AM, Aravind Iddamsetty wrote:
>>
>> On 12/22/23 13:15, Riana Tauro wrote:
>>> GuC provides engine busyness ticks as a 64 bit counter which count
>>> as clock ticks.
>>>
>>> Add configs to the uapi to expose Engine busyness via PMU.
>>>
>>> v2: add "__" prefix for internal helpers
>>>      add a simple helper for application usage (Aravind)
>>>
>>> v3: rebase
>>>      change internal uapi pmu config helpers (Umesh)
>>>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 41 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index 9fa3ae324731..f8456cda5cda 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1340,6 +1340,47 @@ struct drm_xe_wait_user_fence {
>>>       __u64 reserved[2];
>>>   };
>>>   +/**
>>> + * DOC: XE PMU event config IDs
>>> + *
>>> + * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
>>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>> + * particular event.
>>> + *
>>> + */
>>> +
>>> +/**
>>> + * enum drm_xe_pmu_engine_sample - Supported PMU engine samples
>>> + */
>>> +enum drm_xe_pmu_engine_sample {
>>> +    /** @DRM_XE_PMU_SAMPLE_BUSY_TICKS: Engine busy ticks */
>>> +    DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
>>> +};
>>> +
>>> +/*
>>> + * Top bits of every counter are GT id.
>>> + */
>>> +#define __DRM_XE_PMU_GT_SHIFT (56)
>>> +#define __DRM_XE_PMU_SAMPLE_BITS (4)
>>> +#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
>>> +#define __DRM_XE_PMU_CLASS_SHIFT \
>>> +    (__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
>>> +
>>> +#define __DRM_XE_PMU_GT_EVENT(gt, x) \
>>> +    (((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>>> +
>>> +#define __DRM_XE_PMU_ENGINE(class, instance, sample) \
>>> +    (((class) << __DRM_XE_PMU_CLASS_SHIFT | \
>>> +    (instance) << __DRM_XE_PMU_SAMPLE_BITS | \
>>> +    (sample)))
>>> +
>>> +#define __DRM_XE_PMU_OTHER(gt, x) \
>>> +    (__DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + (x))
>> Use __DRM_XE_PMU_ENGINE(0xff, 0xff, 0xf) instead of 0xfffff so that it will be clear
>> that it is starting after the engine event.
> Previous comments from Umesh suggested to use 0xfffff so changed it from rev3.
looking back at the comment, Umesh corrected it to be 0xfffff, so using as suggested by me above
looks to be more apt.
>>
>> But __DRM_XE_PMU_OTHER is not used any where so why to introduce in this patch.
> I added it here so that it can be used in the next patch to check if its engine event.
>
> Will move total active ticks config also to the same patch so that all configs are in one patch.

then you should define __DRM_XE_PMU_OTHER where active ticks is being introduced not viceversa.

Thanks,
Aravind.
>
> Thanks
> Riana
>
>
>>
>> Thanks,
>> Aravind.
>>> +
>>> +#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
>>> +    __DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
>>> +                              DRM_XE_PMU_SAMPLE_BUSY_TICKS))
>>> +
>>>   #if defined(__cplusplus)
>>>   }
>>>   #endif
