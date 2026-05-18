Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CACCD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 13:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4636710E307;
	Mon, 18 May 2026 13:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFH+hSxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD2C10E307;
 Mon, 18 May 2026 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779111997; x=1810647997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MoQHKK+EgBqa7h8HstICWE6L/YZ08Wnif5gPzPOFnzQ=;
 b=IFH+hSxg3BZtl5MxsJTSCLLF09IT8q+kTtb1xYzW1wcmIzfZAJR/p0Fz
 ZeCLgL8gfpvvir9EOdJClt8rqK5x64ELNuysLi2/VheRzTtrO/tAR/085
 188I+mECZoq0EM9tB2m+9Ut8KWjuINKD44JL8zfbDwGeCywb2DnJ0g1kb
 qJBdQ0V1dhkXWgx5693ShaPdDOE8a4aeJXvh6kV0mqla80l9VKdm3+exn
 XytkNfOHJdkCidTAOcpH3dbEyFdOShMxqVKLVexeKCISLkfwEFUsqA4k0
 rmzMs23zhL66IO5Zpx6+J1Cef/EjDMZ/WTy0JFML73XueEToXIArkpUIR w==;
X-CSE-ConnectionGUID: D9xXSGndTjq6jirUEC61TA==
X-CSE-MsgGUID: EzMI6ktBTZ2cZVPxmqlKPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79679291"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79679291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 06:46:36 -0700
X-CSE-ConnectionGUID: VIcT1Lk2QMSl0eB57h5FUw==
X-CSE-MsgGUID: Hd7YnJ5WRmCC5F9D9pBQKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="239513479"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.108])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 06:46:34 -0700
Date: Mon, 18 May 2026 16:46:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/14] drm/xe: Abstract the initial FB PTE checks a bit
Message-ID: <agsYNq7xz0Agp3-U@intel.com>
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
 <20260511214122.8468-10-ville.syrjala@linux.intel.com>
 <54bd10bc-84e2-45ad-9df9-cefe91dcf208@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54bd10bc-84e2-45ad-9df9-cefe91dcf208@lankhorst.se>
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

On Mon, May 18, 2026 at 10:15:10AM +0200, Maarten Lankhorst wrote:
> Hey Ville,
> 
> Den 2026-05-11 kl. 23:41, skrev Ville Syrjala:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Add a few helpers that allow us to abstract the xe initial FB PTE
> > check a bit. Still very ad-hoc compared to the nicely abstracted
> > i915 counterpart, but whatever.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/xe_initial_plane.c | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > index b7e0685351bb..0dabc5709d01 100644
> > --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> > @@ -18,8 +18,19 @@
> >  #include "xe_fb_pin.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_mmio.h"
> > +#include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vram_types.h"
> >  
> > +static bool is_pte_local(u64 pte)
> > +{
> > +	return pte & XE_GGTT_PTE_DM;
> > +}
> > +
> > +static bool need_pte_local(struct xe_device *xe)
> > +{
> > +	return IS_DGFX(xe);
> > +}
> > +
> >  static struct xe_bo *
> >  initial_plane_bo(struct xe_device *xe,
> >  		 struct intel_initial_plane_config *plane_config)
> > @@ -43,13 +54,13 @@ initial_plane_bo(struct xe_device *xe,
> >  	if (IS_DGFX(xe)) {
> >  		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
> >  
> > -		if (!(pte & XE_GGTT_PTE_DM)) {
> > -			drm_err(&xe->drm,
> > -				"Initial plane programming missing DM bit\n");
> > +		if (is_pte_local(pte) != need_pte_local(xe)) {
> > +			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
> >  			return NULL;
> >  		}
> This is unnecessary, this is already inside the IS_DGFX branch, so all you're doing is checking twice.
> Remove need_pte_local and use the has_lmembar() check directly in the next patch?

The point is to abstract this mess to look a bit more like the clean
version in i915. Ideally I'd like to end up with a single codepath like
in i915, but xe doesn't seem to have anything like intel_mem_region
so it's a bit hard to achieve right now :(

> 
> >  		phys_base = pte & ~(page_size - 1);
> > +
> >  		flags |= XE_BO_FLAG_VRAM0;
> >  
> >  		/*
> Extra newline.
> 
> Kind regards,
> ~Maarten Lankhorst

-- 
Ville Syrjälä
Intel
