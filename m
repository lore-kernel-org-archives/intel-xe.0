Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5801C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 18:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFCD10E9C9;
	Thu, 20 Feb 2025 18:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wz54I09M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A8E10E9C9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740076926; x=1771612926;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3YisdQwQJprw2hCnV30sjk/RQSt7ClabDxJS7pbTBho=;
 b=Wz54I09Mtmsf/9vcdwhQoRq80745LDhnnMvxWW7pKzzvgv4+xH1oFXcN
 HVC7wx3MHai13ZKVncI0Lubpl+yFFLoX7KlWma4YY0XeB6y4wubZTQuvM
 5d65emZioEBfKha+jAybiDHBVHAdTQwhe3dGku1KY1h8d7b9ZApOez3p3
 N5A3zPlwg+sPWfTjRec4oxm1tzZdBwA3lhnraHjvofhVDQjWyjeaVdkZr
 N6r6W3Hreatkw8luhmg3XF5kSSHXT0Ss+9q2CE0KGIfdisXIJqQ09Jg8F
 PcGGQ5ZU/9XXLXi5UdBpYTW2xYAXOOpx8AsvqbvZbqNpLDAAVsjMUmUvu g==;
X-CSE-ConnectionGUID: X6O9Alr2TZuUorxaGJiz0Q==
X-CSE-MsgGUID: cwd0uMZPTsyijr9DwkmZ3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44656359"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="44656359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 10:42:06 -0800
X-CSE-ConnectionGUID: kZxL+sgMTuSOndsk77S/DQ==
X-CSE-MsgGUID: VNKRzSaPRv+pJ18aoD4Y+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="120106234"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 20 Feb 2025 10:42:04 -0800
Received: from [10.245.96.217] (unknown [10.245.96.217])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EE70834310;
 Thu, 20 Feb 2025 18:42:02 +0000 (GMT)
Message-ID: <4ba44d2b-96fe-4cfe-a679-e3f6c9a23d24@intel.com>
Date: Thu, 20 Feb 2025 19:42:01 +0100
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
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444B00440112FF389883EE1E5C52@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 19.02.2025 23:10, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, February 19, 2025 11:27 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Dan Carpenter <dan.carpenter@linaro.org>; Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET action
>>
>> Treat unexpected non-zero response data from GuC as -EPROTO error.
>> This will also prevent passing positive value to ERR_PTR().
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/intel-xe/5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain/
>> Fixes: 12f95f9900c0 ("drm/xe/guc: Prefer GT oriented logs for GuC messages")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 1619c0a52db9..bb03db361512 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1238,6 +1238,8 @@ int xe_guc_suspend(struct xe_guc *guc)
>>  
>>  	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
>>  	if (ret) {
>> +		if (ret > 0)
>> +			ret = -EPROTO;
> 
> I don't see anything wrong with this current implementation, though it's perhaps
> a bit unnecessary to nest this if statement in the "if (ret)" check.

the idea for nested 'if' was to avoid extra check on normal flow, since
it will be very unlikely that return value will non-zero.

with your approach below we will be always doing comparison twice

but yeah, this is not on critical path, so who cares...

> Maybe:
> """
> 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
> 	if (ret > 0)
> 		ret = -EPROTO;
> 	if (ret) {
> 	...
> """
> Or, if you don't mind ternary operations:
> """
> 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
> 	ret = ret > 0 ? -EPROTO : ret;
> 	if (ret) {
> 	...
> """

actually above pattern would be useful if move out the sending of
SOFT_RESET to separate helper that handles unexpected replies in place
and always returns only 0 or -ve error code:

int guc_send_soft_reset(guc)
{
	u32 action[] = {..}
	int ret;

	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
 	return = ret > 0 ? -EPROTO : ret;
}

and this is what I'm usually doing, see guc_action_vf_control_cmd()

> 
> Alternatively, given we do something similar everywhere we call
> xe_guc_mmio_send (except for in xe_guc_hwconfig.c), we might
> want to consider modifying the function to perform this -EPROTO
> step automatically:
> """
> int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
> {
>         int ret = xe_guc_mmio_send_recv(guc, request, len, NULL);
>         return ret > 0 ? -EPROTO : ret;
> }

no, as xe_guc_mmio_send() shall remain as generic purpose function since
GuC ABI does not prevent actions to return data just in DATA0 field.

and IIRC the XE_GUC_ACTION_ALLOCATE_DOORBELL, which is unused in xe yet,
 is one example of such action.

> ...
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> static int send_get_hwconfig(struct xe_guc *guc, u64 ggtt_addr, u32 size)
> {
>         u32 action[] = {
>                 XE_GUC_ACTION_GET_HWCONFIG,
>                 lower_32_bits(ggtt_addr),
>                 upper_32_bits(ggtt_addr),
>                 size,
>         };
>         
>         return xe_guc_mmio_send_recv(guc, action, ARRAY_SIZE(action), NULL);
> }
> """
> These aren't necessary changes, by the way.  They're perhaps nice-to-haves,
> but I won't block on it:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>>  		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
>>  		return ret;
>>  	}
>> -- 
>> 2.47.1
>>
>>

