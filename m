Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C7CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 12:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A63F10E605;
	Tue, 23 Sep 2025 12:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UH4aYv0x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F8510E605
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758628909; x=1790164909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dt56Hr+sUyMETV9Qthlk33LNJrln7zX7KINOKwp6VzY=;
 b=UH4aYv0xqvv34jwsfg6uou1sKyq9GsfnoKl70U0BTR8khRaaW0eYzXLP
 ApX6fxMs+Fy5bTnON2C6LuPqSybchxiHHpj24bcTAcogvGP9sVTZq4NMg
 TDf3xuJIYc8afspgZC42+4KcW4J/yHdvZDCr0DFqzVFElLIpsh2XYLbKo
 kwB5vqUHrhLn1dohyBuPc+3Zq9rO2N5YkWEhLKI7LyxG/h7zeYr9C7f3m
 OTrUM1mJu/TphdTMBn55qaL2M4Hhp8j2qZ+PjOLTI6JA0Vj8ozo1a72ct
 iRIAINRSHfl22EkvvRXathICbhH7M8eD1TxKjryAP1GkbzbmQ3yHgHoFX Q==;
X-CSE-ConnectionGUID: nX5Sc3vhS66ONyZQk2Oyhw==
X-CSE-MsgGUID: PNJ8MGjQQ26hSDfYjQbtSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71577718"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="71577718"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:01:49 -0700
X-CSE-ConnectionGUID: 63/dXOv6Tw6p9/QQ1LF3Ew==
X-CSE-MsgGUID: 7K78/jNZRCGOf3sBq6tvOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="177197364"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:01:48 -0700
Date: Tue, 23 Sep 2025 15:01:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Message-ID: <aNKMKSIGSPfmPBEc@intel.com>
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
 <20250923100812.88257-12-tvrtko.ursulin@igalia.com>
 <aNJ0Pw9tvFA3jWDr@intel.com>
 <8bec1692-1bec-45ff-a552-10ff8c7420b5@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bec1692-1bec-45ff-a552-10ff8c7420b5@igalia.com>
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

On Tue, Sep 23, 2025 at 11:48:59AM +0100, Tvrtko Ursulin wrote:
> 
> On 23/09/2025 11:19, Ville Syrjälä wrote:
> > On Tue, Sep 23, 2025 at 11:08:04AM +0100, Tvrtko Ursulin wrote:
> >> Even though frame buffer objects are created as write-combined, in
> >> practice, on top of all the ring buffer flushing, an additional clflush
> >> seems to be needed before display engine can coherently scan out the
> >> AuxCCS compressed data without transient artifacts.
> >>
> >> If for comparison we look at how i915 handles things (where AuxCCS works
> >> fine), as it happens it has this same clflush before a frame buffer is
> >> pinned for display for the first time, courtesy the dynamic tracking of
> >> the buffer cache mode and setting the latter to uncached before handing
> >> to display.
> >>
> >> Since xe considers the buffer object caching mode as static we can
> >> implement the same approach by adding a flag telling us if the buffer
> >> was ever pinned for display and flush on the first pin. Subsequent re-pins
> >> will not repeat the clflush but so far I have not observed any glitching
> >> after the first pin.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> ---
> >>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++++++++-
> >>   drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
> >>   2 files changed, 22 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> index d8aa23b8cf14..f247c0da6b9e 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> @@ -382,6 +382,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> >>   	struct xe_bo *bo = gem_to_xe_bo(obj);
> >>   	struct xe_validation_ctx ctx;
> >>   	struct drm_exec exec;
> >> +	bool first_pin;
> >>   	int ret = 0;
> >>   
> >>   	if (!vma)
> >> @@ -422,8 +423,11 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> >>   			ret = xe_bo_validate(bo, NULL, true, &exec);
> >>   		drm_exec_retry_on_contention(&exec);
> >>   		xe_validation_retry_on_oom(&ctx, &ret);
> >> -		if (!ret)
> >> +		if (!ret) {
> >>   			ttm_bo_pin(&bo->ttm);
> >> +			first_pin = !bo->display_pin;
> >> +			bo->display_pin = true;
> >> +		}
> >>   	}
> >>   	if (ret)
> >>   		goto err;
> >> @@ -436,6 +440,14 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
> >>   	if (ret)
> >>   		goto err_unpin;
> >>   
> >> +	/*
> >> +	 * Force flush frame buffer data for non-coherent display access when
> >> +	 * AuxCCS formats are used.
> >> +	 */
> >> +	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
> >> +	    intel_fb_is_ccs_modifier(fb->base.modifier))
> >> +		drm_clflush_sg(xe_bo_sg(bo));
> > 
> > You still haven't found the actual bug that causes the dirty cache?
> 
> Sadly no. I cross referenced everything numerous times, including 
> workarounds, tried pretty much 1:1 i915 vs xe ring buffer programming, 
> but this extra flush always remains required. I also heard that how 
> flushing of the aux metadata works isn't documented anywhere and i915 
> does have this flush, by design or accident I don't know.

i915 has the flush for the *whole* bo because it started out as
cached. As soon as it undergoes a cached->uncached change (either
due to set_caching ioctl or becoming a display scanout buffer) we
clflush it and switch the GPU page tables from WB to UC. After
that the bo stays uncached, and will need no further clflushes,
assuming that everyone follows the rules:

- CPU accesses via a WB mapping to an uncached bo will explicitly
  clflush before (invalidate) and after (write-back) the access
- userspace always sets the GPU to use use "consult the PTE" MOCS
  setting for any potential scanout buffer. That way the GPU will
  use WB as long as the bo is cached, and once it becomes
  uncached the GPU also switches to UC accesses

With xe I presume the BO should already start out as UC/WC with
clean caches, and nothing should be dirtying the caches unless 
there is a real bug somewhere.

-- 
Ville Syrjälä
Intel
