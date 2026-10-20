Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6AD606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cHnOyWrW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AB210EA19;
	Tue, 20 Oct 2026 18:31:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48B310EC1D;
 Tue, 20 Oct 2026 18:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792521082; x=1824057082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RwKALq7QX9OKo83egn3Wq1A/qkiKaRSFFMEEk09V4so=;
 b=cHnOyWrWWG70Bf+mhBeUCrNo2tc781Lr1kdlM+i+VGh6mVNcfPkV1xca
 F7uStby14lQCoPJ/Re5UswC/IopUEDgIbXj3tNiIM4nW3gAFeMXxGeMVk
 hYniUUAWOxsmsBFAjQV+KoAnlEzdVE5K/dph0CKf6er4UTsLVgFn7gNoX
 EqJHOIQzQacCb4IEr35bfodlfGO7KZqPpggIogV4+EchfOLLLZlSYv7++
 EJDfY39ELiVxz0vM711n9VnPeqmy81L0CSDTKPjB0re6kFJb53MH2C/fg
 HCCyLNDJDYcpQU5Wy/Fd1LuWWe8/hzqi9B5hGMTpEBOjFuOnt+FV1DboK w==;
X-CSE-ConnectionGUID: Yg9flvhLRnGxWZfrOQnLZA==
X-CSE-MsgGUID: Mh7SgWuVT326M5ajyMRfyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1249286"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1249286"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 11:31:21 -0700
X-CSE-ConnectionGUID: g+dAZ/deShiRwHKtUxW9+Q==
X-CSE-MsgGUID: 32fYlhqJRsu0ZyY6qL81yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4627866"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 11:31:19 -0700
Date: Tue, 20 Oct 2026 21:31:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 15/15] drm/i915/pfit: Allow downscaling on i966+
Message-ID: <atezdPm7w8x4KNlT@intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-16-ville.syrjala@linux.intel.com>
 <sashiko-outbox-177503@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-177503@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:47:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915/pfit: off-by-one max_scale in i9xx_pfit_check_scaling()
> --
> 
> commit c5496f644982a254aa09057b7c02f1bea3cb5b18
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915/pfit: Allow downscaling on i966+
> 
> This commit updates i9xx_pfit_check_scaling() to raise max_scale to 0x20000 on
> DISPLAY_VER(display) >= 4 platforms to permit panel fitter downscaling.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> > index 6eb457047bf4c..2b6706c7af534 100644
> > --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> > +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> > @@ -563,7 +563,10 @@ static int i9xx_pfit_check_scaling(const struct intel_crtc_state *crtc_state)
> >  	int hscale, vscale, max_scale;
> >  	struct drm_rect src;
> >  
> > -	max_scale = 0x10000;
> > +	if (DISPLAY_VER(display) >= 4)
> > +		max_scale = 0x20000;
> > +	else
> > +		max_scale = 0x10000;
> >  
> >  	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
> >  
> 
> [Severity: Medium]
> Should max_scale be 0x20000 - 1 (or 0x1fff0) rather than 0x20000 here?

I guess I'll just go with 0x20000-1 for now. I suppose that isn't
100% correct because it doesn't match the hardware precision, but
then again neither does the rounding done by drm_rect_{h,v}scale().
The same issue actually exist in the ILK+ pfit and SKL+ scaler
code as well, though in that case the hw precision is .15. I think
what we should do is perform the check using the hardware precision
and rounding, but that check will have to be done after clipping
and all this stuff right now runs before clipping. Currently we
don't have clipping for pfit but I have a branch somewhere that
tries to add that to properly handle the pfit+joiner combo.
For SKL+ plane scaling clipping is already there of course.

> 
> In i9xx_pfit_check_scaling(), max_scale is passed to drm_rect_calc_hscale()
> and drm_rect_calc_vscale(), which treat max_hscale and max_vscale as inclusive
> upper bounds and only reject with -ERANGE when scale > max_scale. Setting
> max_scale = 0x20000 allows an exact 2.0x downscale factor (for example, when
> scaling a 1600x1200 pipe_src to an 800x600 dst).
> 
> However, in drivers/gpu/drm/i915/display/intel_pfit_regs.h, the i965+ scaling
> ratio fields in PFIT_PGM_RATIOS are 13-bit 1.12 fixed-point values:
> 
> #define   PFIT_VERT_SCALE_MASK_965	REG_GENMASK(28, 16) /* 965+ */
> #define   PFIT_VERT_SCALE_965(x)	REG_FIELD_PREP(PFIT_VERT_SCALE_MASK_965, (x))
> #define   PFIT_HORIZ_SCALE_MASK_965	REG_GENMASK(12, 0) /* 965+ */
> #define   PFIT_HORIZ_SCALE_965(x)	REG_FIELD_PREP(PFIT_HORIZ_SCALE_MASK_965, (x))
> 
> These 13-bit fields have a maximum representable value of 0x1fff (< 2.0). For
> an exact 2.0x downscale, panel_fitter_scaling() computes 0x2000 (BIT(13)),
> which overflows the 13-bit register field and causes a hardware state readout
> mismatch in i965_pfit_get_config() -> i9xx_compute_pfit_dst() on
> crtc_state->pfit.dst and pixel_rate:
> 
> drivers/gpu/drm/i915/display/intel_pfit.c:i965_pfit_get_config() {
> 	...
> 	case PFIT_SCALING_AUTO:
> 	case PFIT_SCALING_PROGRAMMED:
> 		hscale = REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK_965, ratios);
> 		vscale = REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, ratios);
> 		break;
> 	}
> 
> 	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
> 	...
> }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019135309.23578-1-ville.syrjala@linux.intel.com?part=15

-- 
Ville Syrjälä
Intel
