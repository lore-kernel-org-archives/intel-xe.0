Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFC5CD343A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 14:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE14010E5C4;
	Tue,  3 Sep 2024 14:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lu+9Zb5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D45B10E5C4
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725374010; x=1756910010;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=80oH8Wbf2y3WjCqdDat/vN8XUg2s6rZZIyjtfcoCrpo=;
 b=Lu+9Zb5NQnhmSXM9WtSAMs98UhSyaVZhLSgOMT6gPsqeqgxJKzD6Z0GA
 hHgkJmn7uGleVQInVe9DfFTRkb+qTFbyH+1WGl9z2YDXYLrhzIbrro5W6
 0digo0+Sskk8rclIHM6f8VaAQ+m71yJakPDBYlNnHJWYd+6vuGJcGFFoz
 J5G6VHwKXefqZEZh7HoHbrg6xju26xNpY75cgs4qPy4tMroWvs6rNYAlB
 Iwoir/Sh7ouzg7CO9SPCKcCx95hWo7n6aVrE+CsP/SKIzjuVZZ2FJljMU
 CVb4wFkxq0+aHpHcHDxWkN8ZHFF5g5cyr9Cr3FpzSfJafZoyBmWfmQvNc Q==;
X-CSE-ConnectionGUID: rUWtPlcgQ725ghTb1WShhg==
X-CSE-MsgGUID: qQOp4MwTTSqv/qgA3/BAhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23852214"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="23852214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:33:30 -0700
X-CSE-ConnectionGUID: qMQhbIFbQL+66zRWCip8MQ==
X-CSE-MsgGUID: zWovwqDVS42p5snHAGaHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69730311"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.222])
 ([10.245.244.222])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:33:29 -0700
Message-ID: <22f6de28-49c4-41a5-909b-9cb2bcaa046e@intel.com>
Date: Tue, 3 Sep 2024 15:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bmg: improve cache flushing behaviour
To: Nirmoy Das <nirmoy.das@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20240902153744.63456-2-matthew.auld@intel.com>
 <9d3f3a9d-bfde-4a06-a776-743b1ed47236@linux.intel.com>
 <4bcc669d-7fb9-4daa-a94d-22a785f04b22@intel.com>
 <6c4a28d3-1c45-40ee-8401-9557e6bbd060@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <6c4a28d3-1c45-40ee-8401-9557e6bbd060@intel.com>
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

On 03/09/2024 14:49, Nirmoy Das wrote:
> 
> On 9/3/2024 1:08 PM, Matthew Auld wrote:
>> On 03/09/2024 11:53, Nirmoy Das wrote:
>>>
>>> On 9/2/2024 5:37 PM, Matthew Auld wrote:
>>>> The BSpec seems to suggest that EN_L3_RW_CCS_CACHE_FLUSH must be 
>>>> toggled
>>>> on for manual global invalidation to take effect
>>>
>>> I couldn't find this reference, in which bspec is this mentioned ?
>>
>> BSpec: 71718
>>
>> For discrete under global invalidation it says: "Device Cache flushed 
>> if SCRATCH1LPFC bit[0] is set". 
> 
> 
> I was only looking at the register spec.
> 
> If I get this correctly, setting SCRATCH1LPFC would flush device 
> cache/l2 from the L3 without it I assume global inval isn't useful to 
> flush device cache.

 From observation setting SCRATCH1LPFC will result in a flush of the 
device cache as part of the pipecontrol that is emitted at the end of 
each batch for compute/render. Basically exactly like LNL. On BMG this 
is not needed, since SA media is coherent.

 From observation if you take this patch as-is which turns off 
SCRATCH1LPFC, and then stub out the global invalidation in 
xe_device_l2_flush(), then display engine observes corruption when doing 
a render copy onto the display surface prior to display flip, using a 
pat index enabling caching. I assume same thing happens if doing VRAM 
writes from host side, but did not check this. If you add back the 
global invalidation then no display corruption. So seems like 
SCRATCH1LPFC is not needed for global invalidation in order for device 
cache to be flushed, but is needed for pipecontrol etc.

> 
> Can SCRATCH1LPFC be set/reset dynamically, if so then may be set 
> SCRATCH1LPFC  before global inval and reset it back after that ?

I suppose it might be possible, but not sure what happens with 
concurrent submission and trying to mess with SCRATCH1LPFC.

> 
> 
> 
>> Which is why I originally added this, however this then turns flushing 
>> on for all kinds of stuff like pipecontrol which is not what we want. 
>> But from playing around with this a bunch on BMG that doesn't look to 
>> be true. Also the original WA made no mention of needing to mess with 
>> SCRATCH1LPFC.
>>
>> I'm kind of hoping this helps that compute benchmark with not nuking 
>> entire device cache between submissions.
> 
> 
> I tried this one and is indeed improves compute test bandwidth.
> 
> 
> Regards,
> 
> Nirmoy
> 
>>
>>>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>>   and actually flush
>>>> device cache, however this also turns on flushing for things like
>>>> pipecontrol, which occurs between submissions for compute/render. This
>>>> sounds like massive overkill for our needs, where we already have the
>>>> manual flushing on the display side with the global invalidation. Some
>>>> observations on BMG:
>>>>
>>>> 1. Disabling l2 caching for host writes and stubbing out the driver
>>>>     global invalidation but keeping EN_L3_RW_CCS_CACHE_FLUSH 
>>>> enabled, has
>>>>     no impact on wb-transient-vs-display IGT, which makes sense 
>>>> since the
>>>>     pipecontrol is now flushing the device cache after the render copy.
>>>>     Without EN_L3_RW_CCS_CACHE_FLUSH the test then fails, which is also
>>>>     expected since device cache is now dirty and display engine 
>>>> can't see
>>>>     the writes.
>>>>
>>>> 2. Disabling EN_L3_RW_CCS_CACHE_FLUSH, but keeping the driver global
>>>>     invalidation also has no impact on wb-transient-vs-display. This
>>>>     suggests that the global invalidation still works as expected 
>>>> and is
>>>>     flushing the device cache without EN_L3_RW_CCS_CACHE_FLUSH 
>>>> turned on.
>>>>
>>>> With that drop EN_L3_RW_CCS_CACHE_FLUSH.
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
>>>>   drivers/gpu/drm/xe/xe_gt.c           | 1 -
>>>>   2 files changed, 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> index 0d1a4a9f4e11..88a01970cc5c 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> @@ -387,9 +387,6 @@
>>>>   #define XE2_GLOBAL_INVAL            XE_REG(0xb404)
>>>> -#define SCRATCH1LPFC                XE_REG(0xb474)
>>>> -#define   EN_L3_RW_CCS_CACHE_FLUSH        REG_BIT(0)
>>>> -
>>>>   #define XE2LPM_L3SQCREG5            XE_REG_MCR(0xb658)
>>>>   #define XE2_TDF_CTRL                XE_REG(0xb418)
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index f82b3e8ac5c8..313cc4242281 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -110,7 +110,6 @@ static void xe_gt_enable_host_l2_vram(struct 
>>>> xe_gt *gt)
>>>>           return;
>>>>       if (!xe_gt_is_media_type(gt)) {
>>>> -        xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
>>>>           reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>>>>           reg |= CG_DIS_CNTLBUS;
>>>>           xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
