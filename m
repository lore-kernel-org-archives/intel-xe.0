Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768ABC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 18:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FD610E278;
	Mon, 12 Aug 2024 18:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R582hAen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4C510E277
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723486636; x=1755022636;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oymu4qzyLs6ak0ECuZTe20Z8GjJsvsQJCA5YuCxz0os=;
 b=R582hAenvJCCust7oc6OHDRHsGlz3RQM6HcIr3ZCfGJ5R0eCWI/1/pdw
 bh6vcaM3u17XVuiFZ2AnrfBlfI9X9+v2S/WmRJ/EbxPTxN0CVcbpwtIzf
 /tgmbJ5BYQnzV7M/8VgQWykOOAxBxM55naSjzQQ7LlG76oRCBsIzhPdkr
 eBqEaGmJjGsR+WHJO24EsV7Im+vXXltYs65g6xO6kKf2EojtrI5lg8Yc5
 QuC7+HWMIzVvn+lMAFsaTMNkUGbBA1UcCC0mQycjtgaHiNYiDAZ/9E8Sv
 QlnP3B9m5CXiniHEK105u4sUnOgOC8V9TGWT3SThRfUbu2iYMSNGuvZWI w==;
X-CSE-ConnectionGUID: NiykVVE6SOuEcFlh6e+B9w==
X-CSE-MsgGUID: CaauX0KmTzqrwrjy4TUisA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33003255"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="33003255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 11:17:15 -0700
X-CSE-ConnectionGUID: gaWqCUmBRCG9xkQW04yUbg==
X-CSE-MsgGUID: fQUhNBkqTw2qhUXK7UxXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58285875"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.46])
 ([10.245.244.46])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 11:17:13 -0700
Message-ID: <fc87fc66-9782-430b-941a-b3cb4f08a2b5@intel.com>
Date: Mon, 12 Aug 2024 19:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: use devm instead of drmm for managed bo
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
 <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
 <d1758683-cc9f-4a6f-96dd-6180e91133a8@intel.com>
 <33aaf2aa-c8d8-48f5-a234-dd3358a872f0@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <33aaf2aa-c8d8-48f5-a234-dd3358a872f0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 12/08/2024 17:38, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/12/2024 3:41 AM, Matthew Auld wrote:
>> On 10/08/2024 00:12, Daniele Ceraolo Spurio wrote:
>>> The BO cleanup touches the GGTT and therefore requires the HW to be
>>> available, so we need to use devm instead of drmm.
>>
>> In the BO ggtt cleanup we have drm_dev_enter() to mark the critical 
>> sections that needs HW interaction vs the bits that just touch SW 
>> stuff, but looks like this only works once we have marked the device 
>> as unplugged. If something blows up during the probe, then the mmio 
>> stuff is still unmapped and set to NULL (mmio_fini or something IIRC), 
>> but the dev_enter() still sees the device as attached as part of the 
>> later drmm and we blow up.
>>
>> It might make sense to tweak the driver to call the dev unplug() in 
>> the error unwind during the probe sequence, that way the 
>> drm_dev_enter() will catch this (I think). If we error out during 
>> probe, then device can be considered unplugged at the end. Or perhaps 
>> we should anyway make this change regardless of this patch?
>>
>> My thinking with not converting xe_managed_* over to drmm was that we 
>> anyway have to deal with userspace objects existing after the HW is 
>> removed, and there we might also have to consider ggtt, like with 
>> display surfaces. Also the BO is largely just software state and can 
>> be tied to life cycle of the driver state, but I guess here this is 
>> internal and closely tied to the operation of the HW.
>>
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1160
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>
>> If calling unplug doesn't make sense, or is considered orthogonal and 
>> only makes sense for other drmm users:
> 
> I'm not familiar enough with this code to know what's the better choice 
> here. I didn't even know drm_dev_enter() existed before you mentioned 
> it, but that explains why we only see this problem on probe abort and 
> not on driver remove, because we only call drm_dev_unplug in the latter 
> case. Weirdly, drm_dev_unplug is called as part of 
> xe_device_remove_display(), which makes it look like part of the display 
> cleanup instead of the more general one.
> 
> IMO, using drmm for HW-accessing functions and relying on the fact that 
> we correctly mark the HW-touching blocks with drm_dev_enter/exit seems 
> more error prone than just using devm, so switching seems safer; is 
> there any advantage to sticking with drmm instead of switching to devm?

It's just that this is technically for the GEM object put path which is 
generic, and you can get here without drmm or devm, so I don't think we 
can really avoid drm_dev_enter() for these types of cases where you can 
hit the same path with the device unplugged. Maybe we can for the ggtt 
thing, but I don't think you can in general.

Just to be clear, the hotunplug thing which motivated the drmm vs devm 
stuff basically ends up calling into your pci remove callback even 
though there could still be multiple open driver fd, GEM objects etc for 
that drm_device. So here the object or other resources are released only 
when the user chooses to close everything, which can be long after devm 
fires and any other stuff that happens in our remove callback. That 
seems to be part of the idea behind drm_dev_enter(), where you have some 
generic path which can be triggered also after the unplug and doesn't 
fit neatly into drmm/devm model (only makes sense for driver init 
resources).

> 
> If we decide to stick to drmm, we'll need to review all callbacks to 
> make sure they have the enter/exit calls where needed. E.g, the 
> permanent exec_queue cleanup (being called from both the migration and 
> the GSC drmm callbacks) does an unconditional xe_pm_runtime_get/put, 
> which seems wrong if this can be called after the HW has been detached 
> (and implies that the function can end up accessing HW).

Yes, if we wanted to do the full thing then there is still lots of stuff 
missing, in addition to adding all the test coverage.

> 
> Thoughts?

I think your patch is fine, but maybe it also makes sense to set all the 
bo pointers to NULL? It's easy to have some user trying to access the bo 
pointer after removal, before the drm_device is finally closed? Up to 
you though. Either way r-b.

> 
> Daniele
> 
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 3295bc92d7aa..45652d7e6fa6 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -1576,7 +1576,7 @@ struct xe_bo *xe_bo_create_from_data(struct 
>>> xe_device *xe, struct xe_tile *tile,
>>>       return bo;
>>>   }
>>>   -static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void 
>>> *arg)
>>> +static void __xe_bo_unpin_map_no_vm(void *arg)
>>>   {
>>>       xe_bo_unpin_map_no_vm(arg);
>>>   }
>>> @@ -1591,7 +1591,7 @@ struct xe_bo 
>>> *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>>>       if (IS_ERR(bo))
>>>           return bo;
>>>   -    ret = drmm_add_action_or_reset(&xe->drm, 
>>> __xe_bo_unpin_map_no_vm, bo);
>>> +    ret = devm_add_action_or_reset(xe->drm.dev, 
>>> __xe_bo_unpin_map_no_vm, bo);
>>>       if (ret)
>>>           return ERR_PTR(ret);
>>>   @@ -1639,7 +1639,7 @@ int xe_managed_bo_reinit_in_vram(struct 
>>> xe_device *xe, struct xe_tile *tile, str
>>>       if (IS_ERR(bo))
>>>           return PTR_ERR(bo);
>>>   -    drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
>>> +    devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, *src);
>>>       *src = bo;
>>>         return 0;
> 
