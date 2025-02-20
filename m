Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921FC021B2
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 20:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C787310E9E2;
	Thu, 20 Feb 2025 20:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7cIygKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D44810E9E6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740084595; x=1771620595;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=54OM1iwPfTL5sqk6ywOmFShM8m8dzlQk5UECFlEsVc0=;
 b=k7cIygKOXVwZDbp79JwK8m2TZSTh0XCrZG6bR+NYulNTbXK87UbmFsVB
 G0/5gTaZizsDBtd4xUh0n+eqBWrxmQy7r1AaoLobho7/0ClBmJm5HLyCP
 68fSGnvaaAB10FZ5pqx4csuiRpJTFFWe2v8olG3Mk+4bLIkCaErVOkdGo
 0MqHBPRbC1vkT8lFelzezh6U00CoNJN3rTqYyGlAe83/qXBDPp3xJodHc
 L14YjgXwyWX7ratYyc1+E8XY4NCsJ9mpNU5mY2mRRVB3c60Cwkc5D9FZZ
 Mt0LGwBrPhl11TquDSB8kGuXfwmMWOLaRl/xVIOtnJe1ygFbA9kkQKGER Q==;
X-CSE-ConnectionGUID: LIyS1yAuRSqko2nwVLIe9A==
X-CSE-MsgGUID: cGoBmBhGT1umNsTu76gAwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44668860"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="44668860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:49:54 -0800
X-CSE-ConnectionGUID: DKWO4tX6RY2d6UnnPPk8Lw==
X-CSE-MsgGUID: axm45eOcRVudQX6PxdFbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115147971"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2025 12:49:51 -0800
Received: from [10.245.96.217] (unknown [10.245.96.217])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2374D3431C;
 Thu, 20 Feb 2025 20:49:50 +0000 (GMT)
Message-ID: <4a78fbe6-54f6-499e-9bf4-62538fce97b4@intel.com>
Date: Thu, 20 Feb 2025 21:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20250219192710.281-1-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B00440112FF389883EE1E5C52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <4ba44d2b-96fe-4cfe-a679-e3f6c9a23d24@intel.com>
 <CH0PR11MB54445213BCD785AD469D5FB3E5C42@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54445213BCD785AD469D5FB3E5C42@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 20.02.2025 21:09, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Thursday, February 20, 2025 10:42 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Dan Carpenter <dan.carpenter@linaro.org>; Brost, Matthew <matthew.brost@intel.com>
> Subject: Re: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET action
>>
>> On 19.02.2025 23:10, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
>>> Sent: Wednesday, February 19, 2025 11:27 AM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Dan Carpenter <dan.carpenter@linaro.org>; Brost, Matthew <matthew.brost@intel.com>
>>> Subject: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET action
>>>>
>>>> Treat unexpected non-zero response data from GuC as -EPROTO error.
>>>> This will also prevent passing positive value to ERR_PTR().
>>>>
>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Closes: https://lore.kernel.org/intel-xe/5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain/
>>>> Fixes: 12f95f9900c0 ("drm/xe/guc: Prefer GT oriented logs for GuC messages")
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_guc.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 1619c0a52db9..bb03db361512 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -1238,6 +1238,8 @@ int xe_guc_suspend(struct xe_guc *guc)
>>>>  
>>>>  	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
>>>>  	if (ret) {
>>>> +		if (ret > 0)
>>>> +			ret = -EPROTO;
>>>
>>> I don't see anything wrong with this current implementation, though it's perhaps
>>> a bit unnecessary to nest this if statement in the "if (ret)" check.
>>
>> the idea for nested 'if' was to avoid extra check on normal flow, since
>> it will be very unlikely that return value will non-zero.
>>
>> with your approach below we will be always doing comparison twice
>>
>> but yeah, this is not on critical path, so who cares...
> 
> Those are fair points.  I think overall, this means the decision is a stylistic
> choice more than anything, so I'm still good with either approach.
> 
>>
>>> Maybe:
>>> """
>>> 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
>>> 	if (ret > 0)
>>> 		ret = -EPROTO;
>>> 	if (ret) {
>>> 	...
>>> """
>>> Or, if you don't mind ternary operations:
>>> """
>>> 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
>>> 	ret = ret > 0 ? -EPROTO : ret;
>>> 	if (ret) {
>>> 	...
>>> """
>>
>> actually above pattern would be useful if move out the sending of
>> SOFT_RESET to separate helper that handles unexpected replies in place
>> and always returns only 0 or -ve error code:
>>
>> int guc_send_soft_reset(guc)
>> {
>> 	u32 action[] = {..}
>> 	int ret;
>>
>> 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
>>  	return = ret > 0 ? -EPROTO : ret;
>> }
>>
>> and this is what I'm usually doing, see guc_action_vf_control_cmd()
> 
> Given that, currently, all but one uses of xe_guc_mmio_send have this check in
> place to some extent, we may want to generalize this function a bit if we take
> this route.  That way, we can suitably replace xe_guc_mmio_send in the locations
> where we don't expect a reply:
> """
> int xe_guc_mmio_send_noreply(struct xe_gut *guc, const u32 *request, u32 len)
> {
>         int ret = xe_guc_mmio_send(guc, request, len);
>         return ret > 0 ? -EPROTO : ret;
> }
> """

strictly speaking, due to a format of the HXG SUCCESS_RESPONSE message,
that is is sent as reply to REQUEST message, the DATA0 is always there,
so we can't say

	"we don't expect a reply"

as for such cases we have a separate FAST_REQUEST message, but it is not
applicable for the MMIO communication ;)

I can try to prepare series that will introduce

	xe_guc_mmio_send_mbz()
or
	xe_guc_mmio_send_recv_mbz()

> 
>>
>>>
>>> Alternatively, given we do something similar everywhere we call
>>> xe_guc_mmio_send (except for in xe_guc_hwconfig.c), we might
>>> want to consider modifying the function to perform this -EPROTO
>>> step automatically:
>>> """
>>> int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
>>> {
>>>         int ret = xe_guc_mmio_send_recv(guc, request, len, NULL);
>>>         return ret > 0 ? -EPROTO : ret;
>>> }
>>
>> no, as xe_guc_mmio_send() shall remain as generic purpose function since
>> GuC ABI does not prevent actions to return data just in DATA0 field.
>>
>> and IIRC the XE_GUC_ACTION_ALLOCATE_DOORBELL, which is unused in xe yet,
>>  is one example of such action.
> 
> I think if we are expecting DATA0 to have a non-zero value, we could still use
> xe_guc_mmio_send_recv to acquire it.  However, I won't contest the assertion
> that xe_guc_mmio_send needs to remain unmodified.

xe_guc_mmio_send_recv() is mostly for cases where you expect more than
DATA0 from HXG header, forcing callers to use this one is step back.

> 
>>
>>> ...
>>> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
>>> static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 size)
>>> {
>>>         u32 action[] = {
>>>                 XE_GUC_ACTION_GET_HWCONFIG,
>>>                 lower_32_bits(ggtt_addr),
>>>                 upper_32_bits(ggtt_addr),
>>>                 size,
>>>         };
>>>         
>>>         return xe_guc_mmio_send_recv(guc, action, ARRAY_SIZE(action), NULL);
>>> }
>>> """
>>> These aren't necessary changes, by the way.  They're perhaps nice-to-haves,
>>> but I won't block on it:
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> My Reviewed-by still stands.

thanks!

> -Jonathan Cavitt
> 
>>> -Jonathan Cavitt
>>>
>>>>  		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
>>>>  		return ret;
>>>>  	}
>>>> -- 
>>>> 2.47.1
>>>>
>>>>
>>
>>

