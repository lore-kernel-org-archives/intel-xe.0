Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B48FCAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 10:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E1F10E8B7;
	Thu, 25 Sep 2025 10:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FyqUnBwT";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A2D10E8B7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QopNfC3s/1eWPDB81Sw6n5+OMtunG4zcransxD5yDvw=; b=FyqUnBwT84+A72B65wLYwyRJEm
 +dsTdHc2TDebI8eciweLYHogHuB5dGClKJ8UKZ2BHX5LCxsyQXbMyH646cB4dIRuhf8FYHqEl8RkP
 DNlHW8pnz7/LJjMIKWuWgjD0HsZmss1AI8pfuAScUMn3dkv273TG15VGqt8LxQdZPwDS0zh15+dah
 bPNXKkYxaSy+s1QIi/kOTQa3shR4enV3MjFxezrjQCaLv2Q2Z82OEUoohNou6BBxFphIpI23IbM9Z
 V4OWHOEOwIOW9BGeC7DQmN3s9UqMY9KL6ORSWsqfIYBfBuWUl+Se8AyXiag7T5Kw7gwWhPdwsXSko
 B6xdAEOA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v1iuC-00HIck-9V; Thu, 25 Sep 2025 12:08:52 +0200
Message-ID: <cfc54165-b391-4905-a00a-27d2889225e3@igalia.com>
Date: Thu, 25 Sep 2025 11:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
 <20250923100812.88257-12-tvrtko.ursulin@igalia.com>
 <aNJ0Pw9tvFA3jWDr@intel.com>
 <8bec1692-1bec-45ff-a552-10ff8c7420b5@igalia.com>
 <aNKMKSIGSPfmPBEc@intel.com>
 <afd72823-2b19-4d15-b87e-bd879568ad02@igalia.com>
 <aNKer6J7Op2gGmtC@intel.com>
 <f0fbf72f-4791-4aff-a4cb-299bf9ef265f@igalia.com>
 <aNK0E7KMBW5iOzSo@intel.com>
 <e2cb2159-367b-4f43-babc-a5250fc9914d@igalia.com>
 <aNRx66g6y4c-eoZk@intel.com>
 <7e07606b-d542-4407-a092-476f202cc8e2@igalia.com>
Content-Language: en-GB
In-Reply-To: <7e07606b-d542-4407-a092-476f202cc8e2@igalia.com>
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


On 25/09/2025 08:24, Tvrtko Ursulin wrote:
> 
> On 24/09/2025 23:35, Ville Syrjälä wrote:
>> On Wed, Sep 24, 2025 at 02:09:42PM +0100, Tvrtko Ursulin wrote:
>>>
>>> On 23/09/2025 15:52, Ville Syrjälä wrote:
>>>> On Tue, Sep 23, 2025 at 03:40:55PM +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 23/09/2025 14:20, Ville Syrjälä wrote:
>>>>>> On Tue, Sep 23, 2025 at 01:25:58PM +0100, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 23/09/2025 13:01, Ville Syrjälä wrote:
>>>>>>>> On Tue, Sep 23, 2025 at 11:48:59AM +0100, Tvrtko Ursulin wrote:
>>>>>>>>>
>>>>>>>>> On 23/09/2025 11:19, Ville Syrjälä wrote:
>>>>>>>>>> On Tue, Sep 23, 2025 at 11:08:04AM +0100, Tvrtko Ursulin wrote:
>>>>>>>>>>> Even though frame buffer objects are created as write- 
>>>>>>>>>>> combined, in
>>>>>>>>>>> practice, on top of all the ring buffer flushing, an 
>>>>>>>>>>> additional clflush
>>>>>>>>>>> seems to be needed before display engine can coherently scan 
>>>>>>>>>>> out the
>>>>>>>>>>> AuxCCS compressed data without transient artifacts.
>>>>>>>>>>>
>>>>>>>>>>> If for comparison we look at how i915 handles things (where 
>>>>>>>>>>> AuxCCS works
>>>>>>>>>>> fine), as it happens it has this same clflush before a frame 
>>>>>>>>>>> buffer is
>>>>>>>>>>> pinned for display for the first time, courtesy the dynamic 
>>>>>>>>>>> tracking of
>>>>>>>>>>> the buffer cache mode and setting the latter to uncached 
>>>>>>>>>>> before handing
>>>>>>>>>>> to display.
>>>>>>>>>>>
>>>>>>>>>>> Since xe considers the buffer object caching mode as static 
>>>>>>>>>>> we can
>>>>>>>>>>> implement the same approach by adding a flag telling us if 
>>>>>>>>>>> the buffer
>>>>>>>>>>> was ever pinned for display and flush on the first pin. 
>>>>>>>>>>> Subsequent re-pins
>>>>>>>>>>> will not repeat the clflush but so far I have not observed 
>>>>>>>>>>> any glitching
>>>>>>>>>>> after the first pin.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>>>>> ---
>>>>>>>>>>>       drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++++++++-
>>>>>>>>>>>       drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>>>>>>>>>>>       2 files changed, 22 insertions(+), 6 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/ 
>>>>>>>>>>> drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>>>>> index d8aa23b8cf14..f247c0da6b9e 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>>>>>>>> @@ -382,6 +382,7 @@ static struct i915_vma 
>>>>>>>>>>> *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>>>>>>           struct xe_bo *bo = gem_to_xe_bo(obj);
>>>>>>>>>>>           struct xe_validation_ctx ctx;
>>>>>>>>>>>           struct drm_exec exec;
>>>>>>>>>>> +    bool first_pin;
>>>>>>>>>>>           int ret = 0;
>>>>>>>>>>>           if (!vma)
>>>>>>>>>>> @@ -422,8 +423,11 @@ static struct i915_vma 
>>>>>>>>>>> *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>>>>>>                   ret = xe_bo_validate(bo, NULL, true, &exec);
>>>>>>>>>>>               drm_exec_retry_on_contention(&exec);
>>>>>>>>>>>               xe_validation_retry_on_oom(&ctx, &ret);
>>>>>>>>>>> -        if (!ret)
>>>>>>>>>>> +        if (!ret) {
>>>>>>>>>>>                   ttm_bo_pin(&bo->ttm);
>>>>>>>>>>> +            first_pin = !bo->display_pin;
>>>>>>>>>>> +            bo->display_pin = true;
>>>>>>>>>>> +        }
>>>>>>>>>>>           }
>>>>>>>>>>>           if (ret)
>>>>>>>>>>>               goto err;
>>>>>>>>>>> @@ -436,6 +440,14 @@ static struct i915_vma 
>>>>>>>>>>> *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>>>>>>>>>>>           if (ret)
>>>>>>>>>>>               goto err_unpin;
>>>>>>>>>>> +    /*
>>>>>>>>>>> +     * Force flush frame buffer data for non-coherent 
>>>>>>>>>>> display access when
>>>>>>>>>>> +     * AuxCCS formats are used.
>>>>>>>>>>> +     */
>>>>>>>>>>> +    if (first_pin && !xe_bo_is_vram(bo) && ! 
>>>>>>>>>>> xe_bo_is_stolen(bo) &&
>>>>>>>>>>> +        intel_fb_is_ccs_modifier(fb->base.modifier))
>>>>>>>>>>> +        drm_clflush_sg(xe_bo_sg(bo));
>>>>>>>>>>
>>>>>>>>>> You still haven't found the actual bug that causes the dirty 
>>>>>>>>>> cache?
>>>>>>>>>
>>>>>>>>> Sadly no. I cross referenced everything numerous times, including
>>>>>>>>> workarounds, tried pretty much 1:1 i915 vs xe ring buffer 
>>>>>>>>> programming,
>>>>>>>>> but this extra flush always remains required. I also heard that 
>>>>>>>>> how
>>>>>>>>> flushing of the aux metadata works isn't documented anywhere 
>>>>>>>>> and i915
>>>>>>>>> does have this flush, by design or accident I don't know.
>>>>>>>>
>>>>>>>> i915 has the flush for the *whole* bo because it started out as
>>>>>>>> cached. As soon as it undergoes a cached->uncached change (either
>>>>>>>> due to set_caching ioctl or becoming a display scanout buffer) we
>>>>>>>> clflush it and switch the GPU page tables from WB to UC. After
>>>>>>>> that the bo stays uncached, and will need no further clflushes,
>>>>>>>> assuming that everyone follows the rules:
>>>>>>>>
>>>>>>>> - CPU accesses via a WB mapping to an uncached bo will explicitly
>>>>>>>>       clflush before (invalidate) and after (write-back) the access
>>>>>>>> - userspace always sets the GPU to use use "consult the PTE" MOCS
>>>>>>>>       setting for any potential scanout buffer. That way the GPU 
>>>>>>>> will
>>>>>>>>       use WB as long as the bo is cached, and once it becomes
>>>>>>>>       uncached the GPU also switches to UC accesses
>>>>>>>>
>>>>>>>> With xe I presume the BO should already start out as UC/WC with
>>>>>>>> clean caches, and nothing should be dirtying the caches unless
>>>>>>>> there is a real bug somewhere.
>>>>>>>
>>>>>>> Correct, it is all WC and MOCS are correctly set as WC.
>>>>>>>
>>>>>>> For example for the media compression flavour that was broken and 
>>>>>>> needed
>>>>>>> fixing in b412b144685f ("lib/intel/veboxcopy: Respect buffer MOCS
>>>>>>> index"). (For the render compression flavour MOCS was already 
>>>>>>> correct.)
>>>>>>> But MOCS is not enough on its own for some reason.
>>>>>>>
>>>>>>> I also looked into the rendercopy surface state programming and 
>>>>>>> that too
>>>>>>> looks okay. In fact it is possible to see how using the wrong 
>>>>>>> MOCS makes
>>>>>>> things worse. But it also appears the surface state MOCS only 
>>>>>>> applies to
>>>>>>> the main surface, while the aux state is the one which appears to
>>>>>>> contain cached/unflushed data.
>>>>>>
>>>>>> Are you saying that if you start scanning out a compressed buffer,
>>>>>> then clean the caches, and then do frontbuffer rendering you get
>>>>>> more cache dirt?
>>>>>
>>>>> Render with the GPU or CPU? Do you know of any tests or userspaces 
>>>>> which
>>>>> do that?
>>>>
>>>> On the GPU.
>>>>
>>>> Can't think of anything nice off the top of my head.
>>>>
>>>> I'd probably just write a quick igt:
>>>> 1. create a compressed fb
>>>> 2. flip to it
>>>> 3. manually clflush the whole thing to be sure it's clean
>>>> 4. rendercopy some junk around, and keep an eye out for cache dirt
>>>
>>> Looks the same dirt on i915 and xe, which would support the theory that
>>> MOCS settings do not apply to the aux surface.
>>>
>>> If you look at these videos frame by frame you can see it:
>>>
>>> https://people.igalia.com/tursulin/i915-ccs-cache-dirt.MOV
>>> https://people.igalia.com/tursulin/xe-ccs-cache-dirt.MOV
>>>
>>
>> That doesn't really look like cache dirt since it doesn't linger.
>> So I'd say that is more tearing than anything. Tearing can look
>> rather weird with tiled/compressed buffers.
> 
> Some occurrences have two frames of artefacts before the grey square 
> settles. With a 90Hz display and camera taking 60fps video can it be 
> tearing?
> 
>> To raelly see cache dirt you should tweak the test to
>> select a wb mocs.
>>
>> Oh, and disable CPU c-states. Turns out deep c-states cause extra
>> cache flushes all the time which will hide the dirt in short order.
>> Without those extra flushes cache dirt will linger for a long time
>> on screen.
> 
> This I didn't do, will try.

With no C-states results are indeed much more "fun". Although still the 
same between i915 and xe:

https://people.igalia.com/tursulin/i915-ccs-cache-dirt-nocstates.MOV
https://people.igalia.com/tursulin/xe-ccs-cache-dirt-nocstates.MOV

Still MOCS 3 so uncached in render state verified for both.

Regards,

Tvrtko

> 
>> And also enable_psr=0 + enable_fbc=0 to make sure the display
>> engine is really fetching from the memory we just wrote.
>>
> 
> This I did since the laptop has PSR.
> 
> Regards,
> 
> Tvrtko
> 

