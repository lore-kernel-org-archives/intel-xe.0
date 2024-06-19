Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99048C2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5789310E296;
	Wed, 19 Jun 2024 23:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klFv1gFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A528310E2AC
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718838145; x=1750374145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x6ZxDTHdcAeskIIZ6uhvwkObrDa53CJoFHcyItrUaJw=;
 b=klFv1gFOD02OrGuYkyNv1lqgp3doIZJV4ZZ2E8SXQRF5TKzXpvQrkkGh
 M8sTvxwxvlW8033dNNjUXVC1Q07da0j2iChpim8BTAcoqU4Bl4e0gPf2o
 MIBlc4dcSrcLqqEl8s9Kb76HLOXm372hfjM6uOkEJLsJLxMmPIadYM8eS
 qhfC2VP9L+AbhwXhLExlwTnj0HM4OJPY7KdiRpoJFbDFKDDooYBzIuYKc
 YzL8PccFXH66YJyaNC9yPeUuAoD3WXOH1PNCVDuQF5P+TYlrjMvv0096X
 xdWavSNx7y9KQdp/jzqJh2ETGpSnYPv1xdxapjuXNmwQGE7lbMd8V/9u8 g==;
X-CSE-ConnectionGUID: F93xY4wvQhO98VQeF7nyOQ==
X-CSE-MsgGUID: oWD98XYyRe+GC1VEYnkbig==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="41199360"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41199360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:02:25 -0700
X-CSE-ConnectionGUID: wbGeWibiTCmzp2FZ6f9/jA==
X-CSE-MsgGUID: Jw4Su3tDTLGNmHWjK5VYUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46422291"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 19 Jun 2024 16:02:22 -0700
Received: from [10.246.25.139] (unknown [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8290C28184;
 Thu, 20 Jun 2024 00:01:20 +0100 (IST)
Message-ID: <bbba22c7-4818-4910-b8d7-a0c72b564a9d@intel.com>
Date: Thu, 20 Jun 2024 01:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/xe/vf: Don't initialize OA if VF
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-6-michal.wajdeczko@intel.com>
 <85a5jgr3zj.wl-ashutosh.dixit@intel.com>
 <858qz0r3ce.wl-ashutosh.dixit@intel.com>
 <73d602b1-6042-47b9-9b35-396ce72a3788@intel.com>
 <855xu4r15l.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <855xu4r15l.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 20.06.2024 00:57, Dixit, Ashutosh wrote:
> On Wed, 19 Jun 2024 15:40:43 -0700, Michal Wajdeczko wrote:
>>
>> On 20.06.2024 00:10, Dixit, Ashutosh wrote:
>>> On Wed, 19 Jun 2024 14:56:32 -0700, Dixit, Ashutosh wrote:
>>>>
>>>> On Wed, 19 Jun 2024 14:45:53 -0700, Michal Wajdeczko wrote:
>>>>>
>>>>> We don't support Observation Architecture on the VF device.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_oa.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>>>> index 34206e0b6a08..f54a97954452 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_oa.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>>>>> @@ -35,6 +35,7 @@
>>>>>  #include "xe_perf.h"
>>>>>  #include "xe_pm.h"
>>>>>  #include "xe_sched_job.h"
>>>>> +#include "xe_sriov.h"
>>>>>
>>>>>  #define DEFAULT_POLL_FREQUENCY_HZ 200
>>>>>  #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>>>>> @@ -2385,6 +2386,9 @@ int xe_oa_init(struct xe_device *xe)
>>>>> 	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
>>>>> 		return 0;
>>>>>
>>>>> +	if (IS_SRIOV_VF(xe))
>>>>> +		return 0;
>>>>> +
>>>>
>>>> Do we want to add XE_WARN_ON's
>>>
>>> Though maybe not, if we don't want to see the WARN_ON when loading the VF driver...
>>
>> yep, we don't want WARN on every VF boot
>>
>> and TBH IMO above XE_WARN_ON are all wrong, as:
>>
>> - why WARN if someone used legal param xe.force_execlist ?
>>   we can rely on existing drm_dbg() when someone will attempt to use oa
>>
>> - why WARN if Xe driver by design does not support gen < 12 ?
>>   if you want to be paranoid just add xe_assert() to document that
> 
> I agree, best to get rid of these WARN_ON's (xe_assert will also cause a
> crash which we don't want). 

xe_assert() is based on WARN, but works only on debug builds

> The ioctl's have drm_dbg's which should be
> sufficient as you say. I just sent a patch to do this:
> 
> https://patchwork.freedesktop.org/series/135081/
> 
> Could you please take a look at this. Thanks.
> 
>>
>>>
>>>> or combine this if statement with the previous one?
>>>>
>>>> In any case:
>>>>
>>>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>
>> thanks
>>
>>>>
>>>>
>>>>> 	oa->xe = xe;
>>>>> 	oa->oa_formats = oa_formats;
>>>>>
>>>>> --
>>>>> 2.43.0
>>>>>
