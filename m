Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3075CC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02C310F94A;
	Thu, 14 Mar 2024 17:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYYlZe5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E113310FC27
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710435953; x=1741971953;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IS3wxWP1ET1GIoskladrW6IUZNUoWKQNV9aBIII9gpg=;
 b=QYYlZe5cy/9uz3xolXOvNK2z8ZKcY7/D9KgQWofNAnaM5gm49EX1ELlc
 /GGoG6ql4qVbGiFBzv1e6xhffiLwezqiqquE9bNPLwfvd4oejNgzsyJle
 Q6KMA0B6W7CeBZ726/waqLJi4WLpBYd+CQgEl3QT/idw39bjXJfzNiFPD
 /6fvIqmRAej3YedRCegB7PK0wRoYDzXLqkyqxdfz/0BdFy39BfnsrfMhs
 JMLaiDVgT421faWqqXZrHbaay5EAbpzmlmC0Un3JTBNbJAx6of6entyY1
 7bfmo1AUpsh9IBrpkMTRs3wdVygWpua1vXbbJOr/mcc7HmQYHd6Runayc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16665712"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16665712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16955270"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:05:51 -0700
Message-ID: <760c2986-1f16-434b-828e-ab92e9bc009a@intel.com>
Date: Thu, 14 Mar 2024 17:05:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: mark DPT with XE_BO_PAGETABLE
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20240314164905.239449-2-matthew.auld@intel.com>
 <dibnzpe5c3g34vfaodp5xw2au64cqsw5yqcaku6rgps47b6xzh@i4gzcr62grjs>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <dibnzpe5c3g34vfaodp5xw2au64cqsw5yqcaku6rgps47b6xzh@i4gzcr62grjs>
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

On 14/03/2024 17:00, Lucas De Marchi wrote:
> On Thu, Mar 14, 2024 at 04:49:06PM +0000, Matthew Auld wrote:
>> Otherwise in the case where we use normal system memory, the CPU access
>> will always be cached, like when filling the DPT PTEs, which is likely
>> not what we want since HW access could be incoherent on platforms like
>> LNL. Marking as XE_BO_PAGETABLE will force wc/uc underneath on such
>> platforms.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks.

> 
> humn... since you're touching these flags, could you take a look at
> https://lore.kernel.org/intel-xe/20240314052619.2628396-1-lucas.demarchi@intel.com/ ?

Sure, will take a look now.

> 
> thanks
> Lucas De Marchi
> 
>> ---
>> drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++++++---
>> 1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c 
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 722c84a56607..b220f136be70 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -100,17 +100,20 @@ static int __xe_pin_fb_vma_dpt(struct 
>> intel_framebuffer *fb,
>>         dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>>                        ttm_bo_type_kernel,
>>                        XE_BO_CREATE_VRAM0_BIT |
>> -                       XE_BO_CREATE_GGTT_BIT);
>> +                       XE_BO_CREATE_GGTT_BIT |
>> +                       XE_BO_PAGETABLE);
>>     else
>>         dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>>                        ttm_bo_type_kernel,
>>                        XE_BO_CREATE_STOLEN_BIT |
>> -                       XE_BO_CREATE_GGTT_BIT);
>> +                       XE_BO_CREATE_GGTT_BIT |
>> +                       XE_BO_PAGETABLE);
>>     if (IS_ERR(dpt))
>>         dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>>                        ttm_bo_type_kernel,
>>                        XE_BO_CREATE_SYSTEM_BIT |
>> -                       XE_BO_CREATE_GGTT_BIT);
>> +                       XE_BO_CREATE_GGTT_BIT |
>> +                       XE_BO_PAGETABLE);
>>     if (IS_ERR(dpt))
>>         return PTR_ERR(dpt);
>>
>> -- 
>> 2.44.0
>>
