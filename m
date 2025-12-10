Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF071D3C91A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 14:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95610E262;
	Wed, 10 Dec 2025 14:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GhQisQPf";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DB210E262
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S9+9U0IxNAdrbf7RcHfHGlCrs28Bb/1O+w5o/mPsPEE=; b=GhQisQPfNvwDKGG+/HXXR2K1lz
 MZ+l91xQV13FIAmnsaJ0MVfNJiN1vPqLeuJJ2qjaMzIRVyqjyWEEdDD0fCsdFThaob1YcYintaLpc
 qqjv7IR3Qh88VMBDAh78s+PVr1zc0LbVoMXWsRWFtK1VePSK/g7vo1tJZbZ/nbPZ9tD9GwZAMNrU5
 EAzNsxBCcXXYPuA76NVcjwOGfCCBsoLBNJNV6n4HKC2AF/SRfALYjzTCmBflsCuQ00LYFDYGUwfna
 yT1JKfvBi/c1Iyt0ERT4iaX8X4sGlKetModPmx3H009s/VqHsWJJJvBLnqfJztcO/mCGfIPoJ/G3H
 3e3eGZXQ==;
Received: from [86.33.28.86] (helo=[192.168.1.83])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vTLXC-00B0se-9a; Wed, 10 Dec 2025 15:51:18 +0100
Message-ID: <e1f23c82-a4e7-4e18-a1e7-692b31982e4e@igalia.com>
Date: Wed, 10 Dec 2025 15:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
To: "Saarinen, Jani" <jani.saarinen@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-7-tursulin@igalia.com> <aTfxySrZ-O1Bplcm@intel.com>
 <2b912c41-a03a-40cc-8bf0-f70558ffdafc@igalia.com>
 <aTgxZTjU398-jnf3@intel.com>
 <9450ca34-033c-4217-80cb-6f87924f372c@igalia.com>
 <DM8PR11MB56550D69C15FBE13288B2224E0A0A@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@igalia.com>
In-Reply-To: <DM8PR11MB56550D69C15FBE13288B2224E0A0A@DM8PR11MB5655.namprd11.prod.outlook.com>
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


On 10/12/2025 12:17, Saarinen, Jani wrote:
> Hi,
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Tvrtko
>> Ursulin
>> Sent: Wednesday, 10 December 2025 12.08
>> To: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: intel-xe@lists.freedesktop.org; kernel-dev@igalia.com; Tvrtko Ursulin
>> <tvrtko.ursulin@igalia.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
>>
>>
>> On 09/12/2025 15:25, Ville Syrjälä wrote:
>>> On Tue, Dec 09, 2025 at 03:10:03PM +0100, Tvrtko Ursulin wrote:
>>>> On 09/12/2025 10:54, Ville Syrjälä wrote:
>>>>> On Mon, Dec 08, 2025 at 08:17:17PM +0100, Tvrtko Ursulin wrote:
>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>
>>>>>> If DPT is allocated from system memory it will be created in the
>>>>>> default write-back cached mode. This means we need to flush it
>>>>>> after populating otherwise nothing works.
>>>>>>
>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++++
>>>>>>     1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> index a22a9182dadb..89ee68c40329 100644
>>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> @@ -3,6 +3,7 @@
>>>>>>      * Copyright © 2021 Intel Corporation
>>>>>>      */
>>>>>>
>>>>>> +#include <drm/drm_cache.h>
>>>>>>     #include <drm/ttm/ttm_bo.h>
>>>>>>
>>>>>>     #include "i915_vma.h"
>>>>>> @@ -162,6 +163,9 @@ static int __xe_pin_fb_vma_dpt(const struct
>> intel_framebuffer *fb,
>>>>>>     					  rot_info->plane[i].dst_stride);
>>>>>>     	}
>>>>>>
>>>>>> +	if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
>>>>>> +		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);
>>>>> How is anything working currently if the DPT is being created with
>>>>> the wrong caching mode?
>>>> I suspect the stolen allocation never fails in practice (or almost
>>>> never, or at least not in CI).
>>>>> Sounds like someone should fix the DPT creation to correctly ask for
>>>>> UC/WC. But I suppose someone should measure if WB+flush is actually
>>>>> faster...
>>>> I am not sure what is desired here. System memory buffers defaulting
>>>> to cached is the xe default, so should DPT be an exception I do not know.
>>> Anything meant for the display engine is supposed to be uncached.
>> I can add XE_BO_FLAG_SCANOUT to the system memory buffer creation and
>> that would handle this aspect. Acceptable to you?
>>
>>    But..
>>
>>>> In any case AuxCCS seems to only work with DPT in system memory and
>>>> this clflush. DPT in stolen with GTT access and GTT flushing (as i915
>>>> does
>>>> it) does not seem to work for xe. I guess the entity doing the DPT
>>>> reads is somehow special coherency wise.
>>> Sounds like there is still something broken in xe.
>> ... Issue is when you found the magic mocs 61 the CI still saw a sporadic
>> failure. 3 out of 44 new tests failed. These sporadic CI fails I was never able
>> to reproduce locally. (It was always ADL-P, and I have an ADL-P as well.)
>>
>> Above coupled with the fact i915 has this clflush on the first pin, I assumed
>> CCS is just special enough that it is required. For certain with it there are no
>> sporadic CI fails.
>>
>> I even tried removing the clflush from i915 but I wasn't able to repro any
>> failures there. This may make it sound like the clflush isn't required, but
>> given I am not able to repro failures with xe either I think we cannot assume
>> this.
>>
>> On the overall ADL is not a supported platform with xe. So one option could
>> simply be to not complicate my series, allow for sporadic CI fails (record
>> them in CI bug log as expected), and revisit the topic
>> *if*/*when* a problem outside of CI is found.
>>
>> Also annoying is that ADL machines are in the xe CI and not i915. If they were
>> in i915 I would be able to do some CI runs to see if i915 can be made to fail
>> sporadically without the initial clflush.
> There are systems in i915 BAT but not in shards. Perhaps modify test list (BAT) and use that IGT for your kernel changes?

Okay I will try, thanks for the green light Jani. :)

Are they the same type machines/Alderlakes both in the i915 BAT and xe 
shards? Problem could be, as long as something is different, failure to 
trigger the sporadic fails in i915 BAT will not confirm i915 is immune 
to it.

Regards,

Tvrtko

