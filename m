Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6443BD3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 10:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAF610E393;
	Wed, 10 Dec 2025 10:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kF3beY57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8787210E393
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765362731; x=1796898731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t1A4vp7/3lRJTe7QBTO5EEw8+nxNJBq3R8R2ttIYzU8=;
 b=kF3beY57n8UK+b07SriW36jVb2eLcMvUsn/8HAQDr1+TcAmxJs1/S3jg
 0542+e68nqMuG+X6yKz9+w+TXZD9hE6ZSPRDEi5xU2I3zJafBk+0Z9EdY
 A6+5l55yQG49p0NO2pS8EZfcULTxUVVx2MRw/Jhq9xNLpWD2wC8dJXNWj
 Gm7L+ZoBOPsaznN7RUGSMpqiq7vrxe7BzvbajHMKzng7u2FBnVs0jvBjq
 lr3M2t0NLcjXpYxgyhZYco7pEzLj15eplF/NX4fpEzOaEbYmOBttfQOzb
 zG1dWmGZgFhWIJ8dGkN4BhSlgMATwXUxPHYiM+TtiVC0oEZ94WEPKIJpY g==;
X-CSE-ConnectionGUID: TwF82Eh6QW2fl5PChRqtfA==
X-CSE-MsgGUID: tX8NP2o/TnaLRpjvvVR0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67220892"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67220892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:32:10 -0800
X-CSE-ConnectionGUID: HO8UWzKeTpqZsoaZei/Dfw==
X-CSE-MsgGUID: slukj696T+KVtvujnyEeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="195740270"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:32:09 -0800
Date: Wed, 10 Dec 2025 12:32:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Message-ID: <aTlMJJFSMG1gilvC@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-7-tursulin@igalia.com>
 <aTfxySrZ-O1Bplcm@intel.com>
 <2b912c41-a03a-40cc-8bf0-f70558ffdafc@igalia.com>
 <aTgxZTjU398-jnf3@intel.com>
 <9450ca34-033c-4217-80cb-6f87924f372c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9450ca34-033c-4217-80cb-6f87924f372c@igalia.com>
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

On Wed, Dec 10, 2025 at 11:07:48AM +0100, Tvrtko Ursulin wrote:
> 
> On 09/12/2025 15:25, Ville Syrjälä wrote:
> > On Tue, Dec 09, 2025 at 03:10:03PM +0100, Tvrtko Ursulin wrote:
> >> On 09/12/2025 10:54, Ville Syrjälä wrote:
> >>> On Mon, Dec 08, 2025 at 08:17:17PM +0100, Tvrtko Ursulin wrote:
> >>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>>
> >>>> If DPT is allocated from system memory it will be created in the default
> >>>> write-back cached mode. This means we need to flush it after populating
> >>>> otherwise nothing works.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>>> ---
> >>>>    drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++++
> >>>>    1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>> index a22a9182dadb..89ee68c40329 100644
> >>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>> @@ -3,6 +3,7 @@
> >>>>     * Copyright © 2021 Intel Corporation
> >>>>     */
> >>>>    
> >>>> +#include <drm/drm_cache.h>
> >>>>    #include <drm/ttm/ttm_bo.h>
> >>>>    
> >>>>    #include "i915_vma.h"
> >>>> @@ -162,6 +163,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
> >>>>    					  rot_info->plane[i].dst_stride);
> >>>>    	}
> >>>>    
> >>>> +	if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
> >>>> +		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);
> >>> How is anything working currently if the DPT is being
> >>> created with the wrong caching mode?
> >> I suspect the stolen allocation never fails in practice (or almost
> >> never, or at least not in CI).
> >>> Sounds like someone should fix the DPT creation to correctly
> >>> ask for UC/WC. But I suppose someone should measure if WB+flush
> >>> is actually faster...
> >> I am not sure what is desired here. System memory buffers defaulting to
> >> cached is the xe default, so should DPT be an exception I do not know.
> > Anything meant for the display engine is supposed to be uncached.
> 
> I can add XE_BO_FLAG_SCANOUT to the system memory buffer creation and 
> that would handle this aspect. Acceptable to you?
> 
>   But..
> 
> >
> >> In any case AuxCCS seems to only work with DPT in system memory and this
> >> clflush. DPT in stolen with GTT access and GTT flushing (as i915 does
> >> it) does not seem to work for xe. I guess the entity doing the DPT reads
> >> is somehow special coherency wise.
> > Sounds like there is still something broken in xe.
> 
> ... Issue is when you found the magic mocs 61 the CI still saw a 
> sporadic failure. 3 out of 44 new tests failed. These sporadic CI fails 
> I was never able to reproduce locally. (It was always ADL-P, and I have 
> an ADL-P as well.)
> 
> Above coupled with the fact i915 has this clflush on the first pin, I 
> assumed CCS is just special enough that it is required. For certain with 
> it there are no sporadic CI fails.

clflush does nothing for the display engine. If it helps then
I think there must be dirty cachelines around. I don't see how
anything else could explain it.

One would think it should be possible to even see such dirt right
after allocating a new BO and handing it to the display engine
without touching it in any way (IIRC even reads through the GMADR
aperture trigger cache flushes).

-- 
Ville Syrjälä
Intel
