Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FBAC001DE
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 08:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A56B10E282;
	Mon, 24 Jul 2023 08:36:33 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296910E282
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690187792; x=1721723792;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=F4pM5aKOosByODXeaOqUYjPS3MvapHpp+PRVtvHXfKU=;
 b=dH/1bgFfpGcLMjSYfdkcztTDmwW3FTD6LVR4+xA1BEgtO2hMLL0yEGsx
 M9NxGzhc6o/Alh4F15WDzT6/lkkyZN+0891uHRcGOSkpYssFPogke1O7a
 iwSqC93ahrBWFRuLH8zeMm8pHcHFtTHTLy6ImCcF57T4gF3whlcYoWqND
 7/YSU9od3Ukhm6tH/+9WSfFvdEO2oApaaAnULu5KQpTZtCzMJpzr1iIW7
 Lh1/X8O79zdjyAQDunm0keLZ2fsNtCGdTiqCSab86BwzyEmrBfNrBocTI
 Z362IWlVoRmDYyhejYEgQ1mjSoJR9g/6NUUtgclPGAsfS18s02JDyBMuz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="398285151"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="398285151"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="728830877"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="728830877"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.58.138])
 ([10.252.58.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:36:26 -0700
Message-ID: <87fccc28-a719-06c0-3635-efa21e1b84cf@linux.intel.com>
Date: Mon, 24 Jul 2023 10:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230721140745.16187-1-nirmoy.das@intel.com>
 <4etyiovcv7ds5k5zizgy7hlhavkmbkaw3ld4qtkzljoj3ceffe@it5n22pfuoeq>
 <6e04ba7a-1015-1f0b-4b6e-c04ed5f24a76@linux.intel.com>
 <7zktdn6feu77txpzkdtmzgnhr7alnawgclkhaneeui5t4xfbiw@vqaqeovmrgg7>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <7zktdn6feu77txpzkdtmzgnhr7alnawgclkhaneeui5t4xfbiw@vqaqeovmrgg7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Set AE PTE bit if enabled on smem
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,

On 7/22/2023 3:41 AM, Lucas De Marchi wrote:
> On Fri, Jul 21, 2023 at 06:41:57PM +0200, Nirmoy Das wrote:
>> Hi Lucas,
>>
>> On 7/21/2023 6:14 PM, Lucas De Marchi wrote:
>>> On Fri, Jul 21, 2023 at 04:07:44PM +0200, Nirmoy Das wrote:
>>>> Set AE PTE bit on smem if the platform is supported and
>>>> enabled device scoped atomics on system memory by a
>>>> user with madvise ioctl.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_pt.c | 4 ++++
>>>> 1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index 457f1363ec67..d43c91cf4776 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -774,6 +774,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct 
>>>> xe_vma *vma,
>>>>         xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>>>>         xe_walk.cache = XE_CACHE_WB;
>>>>     } else {
>>>> +        if (tile_to_xe(tile)->info.platform != XE_PVC &&
>>>
>>> why the platform check?
>>
>>
>> PVC doesn't support atomics on smem. Should I move the check in the 
>> madvise ioctl instead ?
>
> yes, I think so. See below
>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> Lucas De Marchi
>>>
>>>> +            (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT))
>
> this check should suffice without adding each and every platform
> throughout the code. When we can't do a generic check, then we should
> add helper functions like has_xyz() to abstract what we are checking.


I see you what you meant. I will remove that platform check.

Should I add a check to return an error to userspace if a platform 
doesn't support device atomics ?


Thanks,

Nirmoy

>
> Lucas De Marchi
>
>>>> +            xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>> +
>>>>         if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
>>>>             xe_walk.cache = XE_CACHE_WT;
>>>>         else
>>>> -- 
>>>> 2.39.0
>>>>
