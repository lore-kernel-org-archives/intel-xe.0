Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48732CAC5A7
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 14:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125E710E63B;
	Tue, 23 Sep 2025 14:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fu1RA9Gn";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992F010E63B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HHxFzXiuWdwXFILAsp+SH7Grb5XEw8ExMJywGq/cvwE=; b=fu1RA9GngEgVZ2MgCsQ1RENf94
 GEB0cMUiZlJRd+AHnkYcnPgrJtM46mzKwQTsY6/AvJ93ff1oTAJ13A/yCWxxOtn/32S6JjwUWilMN
 zIsMcAxE5RwHJT0876KqF5ibjaXnNWbSg7rReF/ofIuu8cvrpYQoHG9GtZ3kLGxNeW3kMkPd3Pg0R
 XujFWjPDv4ePqYOoC7PSyTw272zj6LJS7dhIliPQEGEnM+I9NaAojU87gDWvPm4VH3Vn5xQJ+PFoB
 4rHyPj1A09pFutYlA4gjXfk66bh25cMGHWm4h/wogd2NXH1diMgWBr1NNhobX4sf26QXHi8t4GcdM
 zVrD2HRg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v14CO-00GJg1-1d; Tue, 23 Sep 2025 16:40:56 +0200
Message-ID: <f0fbf72f-4791-4aff-a4cb-299bf9ef265f@igalia.com>
Date: Tue, 23 Sep 2025 15:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
 <20250923100812.88257-12-tvrtko.ursulin@igalia.com>
 <aNJ0Pw9tvFA3jWDr@intel.com>
 <8bec1692-1bec-45ff-a552-10ff8c7420b5@igalia.com>
 <aNKMKSIGSPfmPBEc@intel.com>
 <afd72823-2b19-4d15-b87e-bd879568ad02@igalia.com>
 <aNKer6J7Op2gGmtC@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aNKer6J7Op2gGmtC@intel.com>
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


On 23/09/2025 14:20, Ville Syrjälä wrote:
> On Tue, Sep 23, 2025 at 01:25:58PM +0100, Tvrtko Ursulin wrote:
>>
>> On 23/09/2025 13:01, Ville Syrjälä wrote:
>>> On Tue, Sep 23, 2025 at 11:48:59AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 23/09/2025 11:19, Ville Syrjälä wrote:
>>>>> On Tue, Sep 23, 2025 at 11:08:04AM +0100, Tvrtko Ursulin wrote:
>>>>>> Even though frame buffer objects are created as write-combined, in
>>>>>> practice, on top of all the ring buffer flushing, an additional clflush
>>>>>> seems to be needed before display engine can coherently scan out the
>>>>>> AuxCCS compressed data without transient artifacts.
>>>>>>
>>>>>> If for comparison we look at how i915 handles things (where AuxCCS works
>>>>>> fine), as it happens it has this same clflush before a frame buffer is
>>>>>> pinned for display for the first time, courtesy the dynamic tracking of
>>>>>> the buffer cache mode and setting the latter to uncached before handing
>>>>>> to display.
>>>>>>
>>>>>> Since xe considers the buffer object caching mode as static we can
>>>>>> implement the same approach by adding a flag telling us if the buffer
>>>>>> was ever pinned for display and flush on the first pin. Subsequent re-pins
>>>>>> will not repeat the clflush but so far I have not observed any glitching
>>>>>> after the first pin.
>>>>>>
>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++++++++-
>>>>>>     drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>>>>>>     2 files changed, 22 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> index d8aa23b8cf14..f247c0da6b9e 100644
>>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>> @@ -382,6 +382,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>     	struct xe_bo *bo = gem_to_xe_bo(obj);
>>>>>>     	struct xe_validation_ctx ctx;
>>>>>>     	struct drm_exec exec;
>>>>>> +	bool first_pin;
>>>>>>     	int ret = 0;
>>>>>>     
>>>>>>     	if (!vma)
>>>>>> @@ -422,8 +423,11 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>     			ret = xe_bo_validate(bo, NULL, true, &exec);
>>>>>>     		drm_exec_retry_on_contention(&exec);
>>>>>>     		xe_validation_retry_on_oom(&ctx, &ret);
>>>>>> -		if (!ret)
>>>>>> +		if (!ret) {
>>>>>>     			ttm_bo_pin(&bo->ttm);
>>>>>> +			first_pin = !bo->display_pin;
>>>>>> +			bo->display_pin = true;
>>>>>> +		}
>>>>>>     	}
>>>>>>     	if (ret)
>>>>>>     		goto err;
>>>>>> @@ -436,6 +440,14 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>     	if (ret)
>>>>>>     		goto err_unpin;
>>>>>>     
>>>>>> +	/*
>>>>>> +	 * Force flush frame buffer data for non-coherent display access when
>>>>>> +	 * AuxCCS formats are used.
>>>>>> +	 */
>>>>>> +	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
>>>>>> +	    intel_fb_is_ccs_modifier(fb->base.modifier))
>>>>>> +		drm_clflush_sg(xe_bo_sg(bo));
>>>>>
>>>>> You still haven't found the actual bug that causes the dirty cache?
>>>>
>>>> Sadly no. I cross referenced everything numerous times, including
>>>> workarounds, tried pretty much 1:1 i915 vs xe ring buffer programming,
>>>> but this extra flush always remains required. I also heard that how
>>>> flushing of the aux metadata works isn't documented anywhere and i915
>>>> does have this flush, by design or accident I don't know.
>>>
>>> i915 has the flush for the *whole* bo because it started out as
>>> cached. As soon as it undergoes a cached->uncached change (either
>>> due to set_caching ioctl or becoming a display scanout buffer) we
>>> clflush it and switch the GPU page tables from WB to UC. After
>>> that the bo stays uncached, and will need no further clflushes,
>>> assuming that everyone follows the rules:
>>>
>>> - CPU accesses via a WB mapping to an uncached bo will explicitly
>>>     clflush before (invalidate) and after (write-back) the access
>>> - userspace always sets the GPU to use use "consult the PTE" MOCS
>>>     setting for any potential scanout buffer. That way the GPU will
>>>     use WB as long as the bo is cached, and once it becomes
>>>     uncached the GPU also switches to UC accesses
>>>
>>> With xe I presume the BO should already start out as UC/WC with
>>> clean caches, and nothing should be dirtying the caches unless
>>> there is a real bug somewhere.
>>
>> Correct, it is all WC and MOCS are correctly set as WC.
>>
>> For example for the media compression flavour that was broken and needed
>> fixing in b412b144685f ("lib/intel/veboxcopy: Respect buffer MOCS
>> index"). (For the render compression flavour MOCS was already correct.)
>> But MOCS is not enough on its own for some reason.
>>
>> I also looked into the rendercopy surface state programming and that too
>> looks okay. In fact it is possible to see how using the wrong MOCS makes
>> things worse. But it also appears the surface state MOCS only applies to
>> the main surface, while the aux state is the one which appears to
>> contain cached/unflushed data.
> 
> Are you saying that if you start scanning out a compressed buffer,
> then clean the caches, and then do frontbuffer rendering you get
> more cache dirt?

Render with the GPU or CPU? Do you know of any tests or userspaces which 
do that?

Regards,

Tvrtko

