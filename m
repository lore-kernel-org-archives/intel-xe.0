Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1EBC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 13:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3153410E580;
	Thu, 27 Jul 2023 13:05:39 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077F010E123
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 13:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690463136; x=1721999136;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4JYGdJXE/9DsWReiwv8HDN3wVtRKPEO8DD6ynhGsKc8=;
 b=QRHPyNDzg6m3XsjrCQddhTBkqj3HJgULIkddImv5i0YE2RFEaUHsh2iB
 WHRy7QO2EgkSmE0i+KIcINxIm/3JIEr2o1VwB6r+1PSH7KbnkpSPd7eHk
 bVssk0+ER6dSM4eerqGUjj3jTTBfnYqs7TToXR0D+thOrzhHijdMeFZPv
 hPlQYpNBphtWVxnH8ozIpru4u5K0+KfnMsIwgACB6LzZj7pIGZYesaZ3Y
 howyL7yXx3yw+eY+9KRQQ9fEakpY1NG98uFHG4jXrg+fpELYNCmQHOSoB
 eWiO4ylSXW5n2RnnoyavXVSfzr2X54ytjTjDHkbuphmLd5CF5lP0CvlL4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454667107"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="454667107"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730265128"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="730265128"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.36.92])
 ([10.252.36.92])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 06:05:34 -0700
Message-ID: <fdc14d48-0b38-6b1a-b282-b23e6ec3207d@linux.intel.com>
Date: Thu, 27 Jul 2023 15:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Welty, Brian" <brian.welty@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com
References: <20230726074300.13066-1-nirmoy.das@intel.com>
 <2f3f378a-dbbd-84de-f147-ec68e6dc7c90@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <2f3f378a-dbbd-84de-f147-ec68e6dc7c90@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Enable atomics on smem
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 7/27/2023 2:33 AM, Welty, Brian wrote:
>
> On 7/26/2023 12:42 AM, Nirmoy Das wrote:
>> Atomics works on smem as well on supported platforms so
>> set AE PTE bit on smem as well if XE_VMA_ATOMIC_PTE_BIT
>> flag is set.
>>
>> v2: Remove platform check(Lucas)
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index d4660520ac2c..3bd6dd048305 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -768,10 +768,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct 
>> xe_vma *vma,
>
> Why only changing this function and change is not also needed in 
> xe_pte_encode() ?

I didn't see userspace vmas are passed through xe_pte_encode() so I was 
avoiding that. Also xe_pte_encode() is always being

called with NULL vma.

>
>
>>       struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>       int ret;
>
> You need a xe_walk.default_pte = 0 upfront with way code is structured 
> now....

thanks, I have to fix that.

>
>
>> +    if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>> +        xe_walk.default_pte = XE_USM_PPGTT_PTE_AE;
>> +
>
> How is this supposed to be enable on non-PVC platform?
> Meaning when is XE_VMA_ATOMIC_PTE_BIT set in the xe_vma.gpuva.flags ?
> Are you wanting it to be controlled by the xe_vm_madvise ioctl?


I am looking for opinions here but  this is how I see it as there is a 
vm_madvise option for device atomics  but I might be wrong.

One option is to enable AE for all vmas depending if platform supports 
and and  umd can use vm_madvise option to check if the platfrom

supports it or not.

Hi Joonas, what is your thought on this?

> At least on i915, those were intended to only be used on platforms 
> with pagefault support as the intent was just to influence migration 
> policy.
>
>
> I think this breaks PVC?  We do still want AE bit clear on PVC when 
> backing store is !vram. 

Thanks, I didn't know that.

Regards,

Nirmoy

> I don't see how you can do this right way
> here without a platform check.   Possibly you could restore the code 
> below.   And then the new code above is only executed on platforms 
> without VRAM.   Not sure.
>
>
>>       if (is_vram) {
>> -        xe_walk.default_pte = XE_PPGTT_PTE_LM;
>> -        if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>> -            xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +        xe_walk.default_pte |= XE_PPGTT_PTE_LM;
>>           xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>>           xe_walk.cache = XE_CACHE_WB;
>>       } else {
