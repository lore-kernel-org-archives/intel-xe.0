Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EE3C4451C
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBE710E479;
	Fri, 17 Jul 2026 14:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpYjszau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F7210E44B;
 Fri, 17 Jul 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784299604; x=1815835604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=98fmoaxzRcfEHCIVaTXRO/WeYDtK27yc9RsvwXLofhU=;
 b=GpYjszau8sWXn+lzgOVsPSnjhZVb7egNeMeThhAc1MkUBmwXfKyvth6n
 3UKy2vm0nmUcucXoCOeiNfWOhSs171cTUznzgH4C9Dc/pmSQMgIXfK2Aq
 yPGJeKn80NAYxvbozfKloo+DUmH77Zd4ONgMatVjvKs6lDjArlip0ylAq
 AEvF9F314odV6JmaBaB2ixYMp8Epm33wIqhxNJthp6pQkLdT5/1mZeLvo
 rUkNDvzaBgguI72RxjyMEPFjMsTiohM9BnzwqrpXJPQuBIxX1pGgo3vWE
 6J3GcktSAh6v+DziesS/NwQ1N0sY21yCJsh1eKg6h0VLzV1VD1EEPy9bZ A==;
X-CSE-ConnectionGUID: M9LVU+tCSimf8/dFEXOHmg==
X-CSE-MsgGUID: Lcq7xpyISuqcVoL/cpIXNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84850787"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84850787"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:46:43 -0700
X-CSE-ConnectionGUID: gWi+SpeySkSWHitLDan4qw==
X-CSE-MsgGUID: eE6NpUo3R9q8W6zbezuN7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="294997841"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 07:46:41 -0700
Date: Fri, 17 Jul 2026 17:46:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 5/6] drm/xe/display: Remove duplicated code
Message-ID: <alpAT3UENLh_SPEa@intel.com>
References: <20260715110557.2172095-1-dev@lankhorst.se>
 <20260715110557.2172095-6-dev@lankhorst.se>
 <b654aaaa-4290-4aab-be36-c2f3a01eb369@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b654aaaa-4290-4aab-be36-c2f3a01eb369@lankhorst.se>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Jul 15, 2026 at 01:34:28PM +0200, Maarten Lankhorst wrote:
> 
> 
> On 7/15/26 13:05, Maarten Lankhorst wrote:
> > The order of pte vs checks isn't important, so read the pte
> > outside the if block. This makes it slightly more readable.
> > 
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/display/xe_initial_plane.c | 35 ++++++-------------
> >  1 file changed, 11 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > index 5540b0fca392a..e16a6a1e6288a 100644
> > --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > @@ -64,7 +64,7 @@ initial_plane_bo(struct xe_device *xe,
> >  	struct xe_bo *bo;
> >  	resource_size_t phys_base;
> >  	u32 base, size, flags;
> > -	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> > +	u64 page_size = xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K, pte;
> >  	struct xe_ggtt_node *original_ggtt_node;
> >  
> >  	if (plane_config->size == 0)
> > @@ -77,16 +77,14 @@ initial_plane_bo(struct xe_device *xe,
> >  			page_size);
> >  	size -= base;
> >  
> > -	if (IS_DGFX(xe)) {
> > -		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> > -
> > -		if (is_pte_local(pte) != need_pte_local(xe)) {
> > -			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> > -			return NULL;
> > -		}
> > -
> > -		phys_base = pte & ~(page_size - 1);
> > +	pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> > +	phys_base = pte & ~(page_size - 1);
> > +	if (is_pte_local(pte) != need_pte_local(xe)) {
> > +		drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> > +		return NULL;
> > +	}
> >  
> > +	if (IS_DGFX(xe)) {
> >  		flags |= XE_BO_FLAG_VRAM0;
> >  
> >  		/*
> > @@ -104,25 +102,14 @@ initial_plane_bo(struct xe_device *xe,
> >  			    "Using phys_base=%pa, based on initial plane programming\n",
> >  			    &phys_base);
> >  	} else {
> > -		struct ttm_resource_manager *stolen;
> > -		u64 pte;
> > +		flags |= XE_BO_FLAG_STOLEN;
> > +		phys_base -= xe_ttm_stolen_gpu_offset(xe);
> >  
> > -		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> > -		if (!stolen) {
> > +		if (!ttm_manager_type(&xe->ttm, XE_PL_STOLEN)) {
> >  			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");
> >  			return NULL;
> >  		}
> >
> 
> Woops, phys_base adjustment should be after !stolen check,
> result should be the same though.

I would still like to see the dma_addr/phys_base/ggtt offset
(old and new) debug stuff from
https://patchwork.freedesktop.org/patch/724207/?series=166362&rev=1
sucked in as well, as a separate patch. It's useful to see all of
that when debugging this stuff...

But this patch seems fine, with the reordering to avoid oopsing
if stolen isn't there
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> > -		pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> > -
> > -		if (is_pte_local(pte) != need_pte_local(xe)) {
> > -			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> > -			return NULL;
> > -		}
> > -
> > -		phys_base = (pte & ~(page_size - 1)) - xe_ttm_stolen_gpu_offset(xe);
> > -		flags |= XE_BO_FLAG_STOLEN;
> > -
> >  		if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
> >  		    IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
> >  		    !xe_display_bo_fbdev_prefer_stolen(xe, plane_config->size)) {

-- 
Ville Syrjälä
Intel
