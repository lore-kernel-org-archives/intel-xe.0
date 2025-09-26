Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D0CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 07:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E73C10E9E2;
	Fri, 26 Sep 2025 07:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eORws3tM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7FE10E9E2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 07:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872522; x=1790408522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k81HwlEeCFoDjAOZDV6d4LWKvyBMYDj2QLJNbeDjsns=;
 b=eORws3tMntVBzqbnADx36yfE57Ci4zlPCgSHb4+txOGY/glflnjRyI4q
 JIsFX2QdQAznJ7e1L45xLptk+rvSiC2j2ziF1OgadaskMDUhvg2wlcLH6
 QLcbdEMCnw3vbnw5p6ahy8h+8mIp1jfgWsIMrSaZ+3QpG5MZJ1z6RRKVa
 Ca8DG8c4wCz5qYfM8CdIIHq1V9d96NwXzYWnJ3qhAW/4QHSK3ok9ivYS2
 hs+ZXdUuV0bHSbIwWQrAdC5rVlKdvABwxBarbHN8fyI0WcXBFAJkcTtd9
 tjmcVTUFz4+NTLhsTfvDTWJ115ijw29LdbalbZ6BNw7SISY/EKpidHYrh w==;
X-CSE-ConnectionGUID: 6OWg2GVuRmGY8H7SmR8ioA==
X-CSE-MsgGUID: b7plzzrxTIqhMgbH9YDssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="86645964"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="86645964"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:42:01 -0700
X-CSE-ConnectionGUID: YqSJ0NvYRgqoNjVEZSIF+Q==
X-CSE-MsgGUID: 45BvtTZIRbmdEuUT+/3QtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="181545749"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:42:00 -0700
Date: Fri, 26 Sep 2025 10:41:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Message-ID: <aNZDxGoYxVFfRNOu@intel.com>
References: <8bec1692-1bec-45ff-a552-10ff8c7420b5@igalia.com>
 <aNKMKSIGSPfmPBEc@intel.com>
 <afd72823-2b19-4d15-b87e-bd879568ad02@igalia.com>
 <aNKer6J7Op2gGmtC@intel.com>
 <f0fbf72f-4791-4aff-a4cb-299bf9ef265f@igalia.com>
 <aNK0E7KMBW5iOzSo@intel.com>
 <e2cb2159-367b-4f43-babc-a5250fc9914d@igalia.com>
 <aNRx66g6y4c-eoZk@intel.com>
 <7e07606b-d542-4407-a092-476f202cc8e2@igalia.com>
 <cfc54165-b391-4905-a00a-27d2889225e3@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfc54165-b391-4905-a00a-27d2889225e3@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Sep 25, 2025 at 11:08:50AM +0100, Tvrtko Ursulin wrote:
> 
> On 25/09/2025 08:24, Tvrtko Ursulin wrote:
> > 
> > On 24/09/2025 23:35, Ville Syrjälä wrote:
> >> On Wed, Sep 24, 2025 at 02:09:42PM +0100, Tvrtko Ursulin wrote:
> >>>
> >>> On 23/09/2025 15:52, Ville Syrjälä wrote:
> >>>> On Tue, Sep 23, 2025 at 03:40:55PM +0100, Tvrtko Ursulin wrote:
> >>>>>
> >>>>> On 23/09/2025 14:20, Ville Syrjälä wrote:
> >>>>>> On Tue, Sep 23, 2025 at 01:25:58PM +0100, Tvrtko Ursulin wrote:
> >>>>>>>
> >>>>>>> On 23/09/2025 13:01, Ville Syrjälä wrote:
> >>>>>>>> On Tue, Sep 23, 2025 at 11:48:59AM +0100, Tvrtko Ursulin wrote:
> >>>>>>>>>
> >>>>>>>>> On 23/09/2025 11:19, Ville Syrjälä wrote:
> >>>>>>>>>> On Tue, Sep 23, 2025 at 11:08:04AM +0100, Tvrtko Ursulin wrote:
> >>>>>>>>>>> Even though frame buffer objects are created as write- 
> >>>>>>>>>>> combined, in
> >>>>>>>>>>> practice, on top of all the ring buffer flushing, an 
> >>>>>>>>>>> additional clflush
> >>>>>>>>>>> seems to be needed before display engine can coherently scan 
> >>>>>>>>>>> out the
> >>>>>>>>>>> AuxCCS compressed data without transient artifacts.
> >>>>>>>>>>>
> >>>>>>>>>>> If for comparison we look at how i915 handles things (where 
> >>>>>>>>>>> AuxCCS works
> >>>>>>>>>>> fine), as it happens it has this same clflush before a frame 
> >>>>>>>>>>> buffer is
> >>>>>>>>>>> pinned for display for the first time, courtesy the dynamic 
> >>>>>>>>>>> tracking of
> >>>>>>>>>>> the buffer cache mode and setting the latter to uncached 
> >>>>>>>>>>> before handing
> >>>>>>>>>>> to display.
> >>>>>>>>>>>
> >>>>>>>>>>> Since xe considers the buffer object caching mode as static 
> >>>>>>>>>>> we can
> >>>>>>>>>>> implement the same approach by adding a flag telling us if 
> >>>>>>>>>>> the buffer
> >>>>>>>>>>> was ever pinned for display and flush on the first pin. 
> >>>>>>>>>>> Subsequent re-pins
> >>>>>>>>>>> will not repeat the clflush but so far I have not observed 
> >>>>>>>>>>> any glitching
> >>>>>>>>>>> after the first pin.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>>       drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++++++++-
> >>>>>>>>>>>       drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
> >>>>>>>>>>>       2 files changed, 22 insertions(+), 6 deletions(-)
> >>>>>>>>>>>
> >>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/ 
> >>>>>>>>>>> drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>>>>>>>> index d8aa23b8cf14..f247c0da6b9e 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>>>>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>>>>>>>> @@ -382,6 +382,7 @@ static struct i915_vma 
> >>>>>>>>>>> *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> >>>>>>>>>>>           struct xe_bo *bo = gem_to_xe_bo(obj);
> >>>>>>>>>>>           struct xe_validation_ctx ctx;
> >>>>>>>>>>>           struct drm_exec exec;
> >>>>>>>>>>> +    bool first_pin;
> >>>>>>>>>>>           int ret = 0;
> >>>>>>>>>>>           if (!vma)
> >>>>>>>>>>> @@ -422,8 +423,11 @@ static struct i915_vma 
> >>>>>>>>>>> *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> >>>>>>>>>>>                   ret = xe_bo_validate(bo, NULL, true, &exec);
> >>>>>>>>>>>               drm_exec_retry_on_contention(&exec);
> >>>>>>>>>>>               xe_validation_retry_on_oom(&ctx, &ret);
> >>>>>>>>>>> -        if (!ret)
> >>>>>>>>>>> +        if (!ret) {
> >>>>>>>>>>>                   ttm_bo_pin(&bo->ttm);
> >>>>>>>>>>> +            first_pin = !bo->display_pin;
> >>>>>>>>>>> +            bo->display_pin = true;
> >>>>>>>>>>> +        }
> >>>>>>>>>>>           }
> >>>>>>>>>>>           if (ret)
> >>>>>>>>>>>               goto err;
> >>>>>>>>>>> @@ -436,6 +440,14 @@ static struct i915_vma 
> >>>>>>>>>>> *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> >>>>>>>>>>>           if (ret)
> >>>>>>>>>>>               goto err_unpin;
> >>>>>>>>>>> +    /*
> >>>>>>>>>>> +     * Force flush frame buffer data for non-coherent 
> >>>>>>>>>>> display access when
> >>>>>>>>>>> +     * AuxCCS formats are used.
> >>>>>>>>>>> +     */
> >>>>>>>>>>> +    if (first_pin && !xe_bo_is_vram(bo) && ! 
> >>>>>>>>>>> xe_bo_is_stolen(bo) &&
> >>>>>>>>>>> +        intel_fb_is_ccs_modifier(fb->base.modifier))
> >>>>>>>>>>> +        drm_clflush_sg(xe_bo_sg(bo));
> >>>>>>>>>>
> >>>>>>>>>> You still haven't found the actual bug that causes the dirty 
> >>>>>>>>>> cache?
> >>>>>>>>>
> >>>>>>>>> Sadly no. I cross referenced everything numerous times, including
> >>>>>>>>> workarounds, tried pretty much 1:1 i915 vs xe ring buffer 
> >>>>>>>>> programming,
> >>>>>>>>> but this extra flush always remains required. I also heard that 
> >>>>>>>>> how
> >>>>>>>>> flushing of the aux metadata works isn't documented anywhere 
> >>>>>>>>> and i915
> >>>>>>>>> does have this flush, by design or accident I don't know.
> >>>>>>>>
> >>>>>>>> i915 has the flush for the *whole* bo because it started out as
> >>>>>>>> cached. As soon as it undergoes a cached->uncached change (either
> >>>>>>>> due to set_caching ioctl or becoming a display scanout buffer) we
> >>>>>>>> clflush it and switch the GPU page tables from WB to UC. After
> >>>>>>>> that the bo stays uncached, and will need no further clflushes,
> >>>>>>>> assuming that everyone follows the rules:
> >>>>>>>>
> >>>>>>>> - CPU accesses via a WB mapping to an uncached bo will explicitly
> >>>>>>>>       clflush before (invalidate) and after (write-back) the access
> >>>>>>>> - userspace always sets the GPU to use use "consult the PTE" MOCS
> >>>>>>>>       setting for any potential scanout buffer. That way the GPU 
> >>>>>>>> will
> >>>>>>>>       use WB as long as the bo is cached, and once it becomes
> >>>>>>>>       uncached the GPU also switches to UC accesses
> >>>>>>>>
> >>>>>>>> With xe I presume the BO should already start out as UC/WC with
> >>>>>>>> clean caches, and nothing should be dirtying the caches unless
> >>>>>>>> there is a real bug somewhere.
> >>>>>>>
> >>>>>>> Correct, it is all WC and MOCS are correctly set as WC.
> >>>>>>>
> >>>>>>> For example for the media compression flavour that was broken and 
> >>>>>>> needed
> >>>>>>> fixing in b412b144685f ("lib/intel/veboxcopy: Respect buffer MOCS
> >>>>>>> index"). (For the render compression flavour MOCS was already 
> >>>>>>> correct.)
> >>>>>>> But MOCS is not enough on its own for some reason.
> >>>>>>>
> >>>>>>> I also looked into the rendercopy surface state programming and 
> >>>>>>> that too
> >>>>>>> looks okay. In fact it is possible to see how using the wrong 
> >>>>>>> MOCS makes
> >>>>>>> things worse. But it also appears the surface state MOCS only 
> >>>>>>> applies to
> >>>>>>> the main surface, while the aux state is the one which appears to
> >>>>>>> contain cached/unflushed data.
> >>>>>>
> >>>>>> Are you saying that if you start scanning out a compressed buffer,
> >>>>>> then clean the caches, and then do frontbuffer rendering you get
> >>>>>> more cache dirt?
> >>>>>
> >>>>> Render with the GPU or CPU? Do you know of any tests or userspaces 
> >>>>> which
> >>>>> do that?
> >>>>
> >>>> On the GPU.
> >>>>
> >>>> Can't think of anything nice off the top of my head.
> >>>>
> >>>> I'd probably just write a quick igt:
> >>>> 1. create a compressed fb
> >>>> 2. flip to it
> >>>> 3. manually clflush the whole thing to be sure it's clean
> >>>> 4. rendercopy some junk around, and keep an eye out for cache dirt
> >>>
> >>> Looks the same dirt on i915 and xe, which would support the theory that
> >>> MOCS settings do not apply to the aux surface.
> >>>
> >>> If you look at these videos frame by frame you can see it:
> >>>
> >>> https://people.igalia.com/tursulin/i915-ccs-cache-dirt.MOV
> >>> https://people.igalia.com/tursulin/xe-ccs-cache-dirt.MOV
> >>>
> >>
> >> That doesn't really look like cache dirt since it doesn't linger.
> >> So I'd say that is more tearing than anything. Tearing can look
> >> rather weird with tiled/compressed buffers.
> > 
> > Some occurrences have two frames of artefacts before the grey square 
> > settles. With a 90Hz display and camera taking 60fps video can it be 
> > tearing?
> > 
> >> To raelly see cache dirt you should tweak the test to
> >> select a wb mocs.
> >>
> >> Oh, and disable CPU c-states. Turns out deep c-states cause extra
> >> cache flushes all the time which will hide the dirt in short order.
> >> Without those extra flushes cache dirt will linger for a long time
> >> on screen.
> > 
> > This I didn't do, will try.
> 
> With no C-states results are indeed much more "fun". Although still the 
> same between i915 and xe:
> 
> https://people.igalia.com/tursulin/i915-ccs-cache-dirt-nocstates.MOV
> https://people.igalia.com/tursulin/xe-ccs-cache-dirt-nocstates.MOV
> 
> Still MOCS 3 so uncached in render state verified for both.

I reverse engineered this a bit and there's definitely a
MOCS issue at play.

First I noticed that if filled the entire MOCS table with
UC the problem went away. I then filled the entire table
with WB and essentially bisected what I need to make UC
to fix it. And I had to repeat that same process starting
from the other end of table.

Looks like there is some undocumented magic in the hardware.

MOCS 61 really is special:
- MOCS 61 UC, others WB, select MOCS 61 -> no corruption

MOCS 0 and 63 are special in other ways:
- MOCS X UC, others WB, select MOCS X -> corruption
- MOCS X+0 UC, others WB, select MOCS X -> corruption
- MOCS X+63 UC, others WB, select MOCS X -> corruption
- MOCS X+0+63 UC, others WB, select MOCS X -> no corruption
  where X != 61

I didn't actually test all values of X there, but I did spot
check a handful of them.

Also, ADL is affected, but TGL doesn't seem to be. Though I
still need to check the situation on TGL a bit more thoroughly.

-- 
Ville Syrjälä
Intel
