Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC52C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 09:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95AF10E058;
	Wed, 19 Jun 2024 09:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsPQA6vV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77D410E058
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718790290; x=1750326290;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vbj7p5Kv2PlOAlzRk/9gZ0O71Nta5ESS1BsEPT2sgJE=;
 b=gsPQA6vVvcGB3TV15sclG3xbB1dhaEvZoL6iMgOBLKJX4EmQ4l/D+lcI
 y/ysY7U9A5TECtCkNJDnOJaF1y0iVy0hdqPdsI+LtQ+i1p94Phmfd0jX9
 RnfrxqdOxg9S8Hg/ynVleUewB5IEGZgHCKDa90Y+kxHbgqqtK4mb8qpxH
 CBcyUwy4P6EhmZkBaJ/LycPhItvFLHete46HoFMvlY2ygycVJg9QOfE/8
 au0oMq/Esh2g1DXqm874CTdr98GH6ZqZhuzxR/grQIn+rgGVmTIXtvikW
 R6LeAZOr4BsU3EC9mzBZ9Kl0YlMGjKtASY5Qk7dVMablG7OmnmlovapXd Q==;
X-CSE-ConnectionGUID: yM6ccTSqS12slusEUYeX5Q==
X-CSE-MsgGUID: FYTF3yu3Rhazm0MaxZXPaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26346449"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="26346449"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 02:44:49 -0700
X-CSE-ConnectionGUID: 3/eRM99MQvCIZeXZw7qzhA==
X-CSE-MsgGUID: 9tfS7OI8TEqKsRYQ7nI0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="46772784"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.146])
 ([10.245.245.146])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 02:44:47 -0700
Message-ID: <70cbe0f4-5275-4716-b78b-c48fd86e281e@intel.com>
Date: Wed, 19 Jun 2024 10:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
To: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, Pallavi Mishra <pallavi.mishra@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Oak Zeng <oak.zeng@intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
 <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
 <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
 <20240617202838.GL2905419@mdroper-desk1.amr.corp.intel.com>
 <9c3ee93c4f5fffa5d5dd61ea71066fa231ab3ec5.camel@linux.intel.com>
 <20240618164323.GN2905419@mdroper-desk1.amr.corp.intel.com>
 <8bc380197b6129a458fb177d263ddf4fc7e2dda9.camel@linux.intel.com>
 <20240618185458.GK2906448@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240618185458.GK2906448@mdroper-desk1.amr.corp.intel.com>
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

On 18/06/2024 19:54, Matt Roper wrote:
> On Tue, Jun 18, 2024 at 08:29:24PM +0200, Thomas Hellström wrote:
>> Hi, Matt
>>
>> On Tue, 2024-06-18 at 09:43 -0700, Matt Roper wrote:
>>> On Tue, Jun 18, 2024 at 02:38:01PM +0200, Thomas Hellström wrote:
>>>> Hi,
>>>>
>>>> On Mon, 2024-06-17 at 13:28 -0700, Matt Roper wrote:
>>>>> On Wed, Jun 12, 2024 at 08:03:24PM +0200, Michal Wajdeczko wrote:
>>>>>> Hi Thomas,
>>>>>>
>>>>>> On 11.06.2024 14:47, Thomas Hellström wrote:
>>>>>>> Hi, Michal,
>>>>>>>
>>>>>>> On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko wrote:
>>>>>>>> We should honor requested uncached mode also at the TTM
>>>>>>>> layer.
>>>>>>>> Otherwise, we risk losing updates to the memory based
>>>>>>>> interrupts
>>>>>>>> source or status vectors, as those require uncached memory.
>>>>>>>>
>>>>>>>> Signed-off-by: Michal Wajdeczko
>>>>>>>> <michal.wajdeczko@intel.com>
>>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/xe/xe_bo.c | 3 +++
>>>>>>>>   1 file changed, 3 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>> index 2bae01ce4e5b..2573cc118f29 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>>>>> @@ -378,6 +378,9 @@ static struct ttm_tt
>>>>>>>> *xe_ttm_tt_create(struct
>>>>>>>> ttm_buffer_object *ttm_bo,
>>>>>>>>   	    (xe->info.graphics_verx100 >= 1270 && bo-
>>>>>>>>> flags &
>>>>>>>> XE_BO_FLAG_PAGETABLE))
>>>>>>>>   		caching = ttm_write_combined;
>>>>>>>>   
>>>>>>>> +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
>>>>>>>> +		caching = ttm_uncached;
>>>>>>>> +
>>>>>>>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
>>>>>>>> caching,
>>>>>>>> extra_pages);
>>>>>>>>   	if (err) {
>>>>>>>>   		kfree(tt);
>>>>>>>
>>>>>>> To me the preferred method is to teach bo->cpu_caching about
>>>>>>> the
>>>>>>> uncached mode and then include it in the switch statement
>>>>>>> above.
>>>>>>>
>>>>>>
>>>>>> but bo->cpu_caching is currently documented as:
>>>>>>
>>>>>> /**
>>>>>>   * @cpu_caching: CPU caching mode. Currently only used for
>>>>>> userspace
>>>>>>   * objects.
>>>>>>   */
>>>>>>
>>>>>> and value 0 is implicitly reserved as kind of default, so
>>>>>> 'teaching'
>>>>>> would likely mean either extending uapi with something like:
>>>>>>
>>>>>>    #define DRM_XE_GEM_CPU_CACHING_WB                      1
>>>>>>    #define DRM_XE_GEM_CPU_CACHING_WC                      2
>>>>>> + #define DRM_XE_GEM_CPU_CACHING_UC                      3
>>>>>>
>>>>>> which will introduce lot of undesired right now code changes,
>>>>>> or we
>>>>>> will
>>>>>> introduce internal only flag:
>>>>>>
>>>>>> + #define XE_CPU_CACHING_UC                      ((u16)~0)
>>>>>>
>>>>>> but that doesn't look like a clean solution.
>>>>>>
>>>>>>
>>>>>> OTOH, just above this new diff chunk, there is already a code
>>>>>> that
>>>>>> updates caching mode outside the "switch statement above":
>>>>>>
>>>>>> 	if ((!bo->cpu_caching && bo->flags &
>>>>>> XE_BO_FLAG_SCANOUT)
>>>>>>>>
>>>>>> 	    (xe->info.graphics_verx100 >= 1270 &&
>>>>>> 	     bo->flags & XE_BO_FLAG_PAGETABLE))
>>>>>> 		caching = ttm_write_combined;
>>>>>>
>>>>>> so maybe as a short term solution we can keep this patch as
>>>>>> it's
>>>>>> doing
>>>>>> similar last resort stuff and return to 'preferred way' later:
>>>>>>
>>>>>> 	if (!bo->cpu_caching && bo->flags &
>>>>>> XE_BO_FLAG_NEEDS_UC)
>>>>>> 		caching = ttm_uncached;
>>>>>
>>>>> Yeah, cpu_caching is a "uapi only" thing at the moment (and even
>>>>> then
>>>>> is
>>>>> only set in some situations).  Given the current design and
>>>>> assumptions
>>>>> of the code, maybe it would be more clear to add an assertion
>>>>> like
>>>>> this
>>>>> to help document why this is special?
>>>>>
>>>>>          if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
>>>>>                  /*
>>>>>                   * Valid only for internally-created buffers
>>>>> only,
>>>>> for
>>>>>                   * which cpu_caching is never initialized.
>>>>>                   */
>>>>>                  xe_assert(xe, bo->cpu_caching == 0);
>>>>>                  caching = ttm_uncached;
>>>>>          }
>>>>>
>>>>> If we decide we want a more general redesign of cpu_caching
>>>>> behavior,
>>>>> that would probably be a separate change from the direct
>>>>> functional
>>>>> fix
>>>>> here.
>>>>
>>>> I do think the change should have actually been done before the
>>>> scanout
>>>> caching hack. We shouldn't be building special cases like this, but
>>>> rather fix what's missing.
>>>
>>> I think things happened the other way around.  The scanout caching
>>> adjustment pre-dates the existence of bo->cpu_caching in the driver.
>>> When bo->cpu_caching got added in commit 622f709ca629 ("drm/xe/uapi:
>>> Add
>>> support for CPU caching mode"), it intentionally left kernel objects
>>> set
>>> to 0 by design.
>>
>> I don't really see a discussion around the kernel objects in the commit
>> message, it mentions "currently" in the caching mode doc, but that
>> sounds more like a documentation of current status than a guideline.
>> Ofc, it might be in the review discussion but I haven't looked too
>> closely TBH.
>>
>> Hmm. This commit raises some questions. Do you remember the reason for
>> leaving out the kernel bos? Was it because kernel bos relies on
>> implicit caching mode selection whereas the user-space bo caching mode
>> selection is now explicit? Otherwise it's pretty standard in the driver
>> to map the DRM_XE user-space flags / enums to XE_ internal ones.

Yeah, no real reason IIRC. I don't remember exactly, but I don't think 
there was a huge need for kmd internal objects needing explicit caching 
at the time, and didn't seem worth adding just for that scanout case.

> 
> Unfortunately I don't remember the details here very well myself; I know
> this patch went through a lot of revisions and morphed a fair bit during
> the review cycles.  Adding a couple extra Cc's of people who were more
> actively involved in the review and may have a clearer memory of how we
> initially settled on the userspace-only design.
> 
> +cc Jose, Oak
> 
> 
> Matt
> 
>>
>> (As a complete side note it looks like the system pages for VRAM-only
>> user-bo eviction are now forced to be write-combined by the uAPI?)

Yeah, originally we had smem_cpu_caching, where it had to be left as 
zero for vram objects. vram caching was then implicit and always wc. I 
think internally kmd would use wb if it was evicted and vram-only, idea 
was also to potentially allow umd to also control this with 
smem_cpu_caching.

There was some discussion here: 
https://lore.kernel.org/intel-xe/30454ab26b8df746cfcdc4c1a0548e7c1e676ac0.camel@intel.com/

Feedback was rather to have single cpu_caching value which would always 
be respected when mmapping the object. If the cpu_caching is wc then the 
mmap is always wc, and not sometimes wc and sometimes wb, depending on 
if it's evicted or not which userspace is unaware of. The downside is 
that wc for evicted vram is going to be common and maybe not ideal. 
Maybe this can be revisited?

>>
>>>
>>> We can certainly change the design now if everyone agrees that it
>>> makes
>>> the code cleaner,
>>
>> This is probably a bigger change than I originally though and requires
>> some additional consideration of the above.
>>
>>>   but I think that the general refactoring and
>>> repurposing of bo->cpu_caching is orthogonal to the functional fix
>>> that
>>> Michal is providing here.
>>
>> Generally I think that if something is missing to be able to cleanly
>> add a fix, then we should definitely try our best to add that something
>> _first_. In this case it turns out, though, that it requires some
>> additional afterthought.
>>
>> So for the patch
>>
>> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>>
>>
>>>
>>> +Cc Pallavi, Matt Auld as the authors of the original design in case
>>> they have any thoughts on extending the usage of bo->cpu_caching.
>>>
>>>
>>> Matt
>>>
>>>>
>>>> Can't we make bo->cpu_caching valid also for kernel bos with a new
>>>> enum
>>>> and do the translation in the ioctl?
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>>
>>>>>> Michal
>>>>>
>>>>
>>>
>>
> 
