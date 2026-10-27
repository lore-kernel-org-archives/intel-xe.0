Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAEE606A323
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bUyVnThJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37F210F6D2;
	Tue, 27 Oct 2026 16:06:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C197410E443;
 Tue, 27 Oct 2026 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793117185; x=1824653185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QeDUBUizWLtA7XI9PJPNXcQQfLNEh885J+VXo/vT19k=;
 b=bUyVnThJPY9lWI7jyeekvqi6adayy90oY1Txz0Dh2rp3m0YaK/7xlnog
 MA37Y791dXHbpX79w0P/LYK9nEZ4ly5agTxkcg6cT9/Aqo4AcJIMA5xQT
 FKi54AoIXQt+1PMWrOSm4bGVbZCACsrWUh2he4uKhCErZkIVQuZenqzim
 ni2Nm14AuyYcgLCMCLom1eqOMuZYEeJsZ3Dhpmvd0fEGdNIB+ogH4Lnl4
 7cMx0bM/3HPY4x3WV9RgD7pmB15I5m4lH8Wo5If/131nkMQHzOrEYZniT
 ZDD2vH7QI9hZ9vlOBAYoy5osILlcD4eoGm1Kn0gpUcdhU1BsvHwijx/N5 g==;
X-CSE-ConnectionGUID: r9kX+ej9SC6J4RXLp6Ep6Q==
X-CSE-MsgGUID: 7WYRYhbZQgCovry4FkcVfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1711564"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1711564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:06:25 -0700
X-CSE-ConnectionGUID: rYA31FBRTzm90Ahsewu5Zg==
X-CSE-MsgGUID: 3THNQOObR6SXr7jRhO6qDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4956101"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 09:06:22 -0700
Date: Tue, 27 Oct 2026 18:06:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH v3 2/3] drm/i915/fbc: Apply Wa_14028723391
Message-ID: <auDL-bAq0KSacWGL@intel.com>
References: <20261027150544.81548-1-vinod.govindapillai@intel.com>
 <20261027150544.81548-2-vinod.govindapillai@intel.com>
 <auC_tAQTwUlC67Wv@intel.com>
 <7340968078ff6e9d8e4cc1c8850e5a243d964e66.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7340968078ff6e9d8e4cc1c8850e5a243d964e66.camel@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 03:53:25PM +0000, Govindapillai, Vinod wrote:
> On Tue, 2026-10-27 at 17:13 +0200, Ville Syrjälä wrote:
> > On Tue, Oct 27, 2026 at 05:05:43PM +0200, Vinod Govindapillai wrote:
> > > Disable FBC in XE3P_LPD for FP16 formats with Alpha.
> > > 
> > > v2: Group the wa conditions as a separate function
> > >     Wa condition to check pixel blend mode
> > > 
> > > v3: use fomrat_is_float()
> > > 
> > > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > > ---
> > >  .../gpu/drm/i915/display/intel_display_wa.c   |  2 ++
> > >  .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
> > >  drivers/gpu/drm/i915/display/intel_fbc.c      | 22
> > > +++++++++++++++++++
> > >  3 files changed, 25 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c
> > > b/drivers/gpu/drm/i915/display/intel_display_wa.c
> > > index cc0b28d524f6..3df25104fb12 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> > > @@ -159,6 +159,8 @@ bool __intel_display_wa(struct intel_display
> > > *display, enum intel_display_wa wa,
> > >  		return IS_DISPLAY_VERx100(display, 1100, 1400);
> > >  	case INTEL_DISPLAY_WA_22021048059:
> > >  		return IS_DISPLAY_VER(display, 14, 35);
> > > +	case INTEL_DISPLAY_WA_14028723391:
> > > +		return DISPLAY_VER(display) == 35;
> > >  	default:
> > >  		drm_WARN(display->drm, 1, "Missing Wa: %s\n",
> > > name);
> > >  		break;
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > > b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > > index 2086c7da710d..5514771f513b 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > > @@ -56,6 +56,7 @@ enum intel_display_wa {
> > >  	INTEL_DISPLAY_WA_22012358565,
> > >  	INTEL_DISPLAY_WA_22014263786,
> > >  	INTEL_DISPLAY_WA_22021048059,
> > > +	INTEL_DISPLAY_WA_14028723391,
> > >  };
> > >  
> > >  bool __intel_display_wa(struct intel_display *display, enum
> > > intel_display_wa wa, const char *name);
> > > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c
> > > b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > index b84fa350c433..f70f3e34d655 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > @@ -1215,6 +1215,23 @@ static bool
> > > xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state
> > > *p
> > >  	}
> > >  }
> > >  
> > > +static bool
> > > +intel_fbc_wa_14028723391_applies(const struct intel_plane_state
> > > *plane_state)
> > > +{
> > > +	struct intel_display *display =
> > > to_intel_display(plane_state);
> > > +	const struct drm_framebuffer *fb = plane_state->hw.fb;
> > > +
> > > +	/*
> > > +	 * Wa_14028723391:
> > > +	 * Fixes: Screen corruption with FBC enabled on a plane
> > > with the FP16
> > > +	 * Workaround: Disable FBC for FP16+Alpha in xe3p_lpd
> > > +	 */
> > > +	return intel_display_wa(display,
> > > INTEL_DISPLAY_WA_14028723391) &&
> > > +	       format_is_float(plane_state) &&
> > > +	       fb->format->has_alpha &&
> > > +	       plane_state->hw.pixel_blend_mode !=
> > > DRM_MODE_BLEND_PIXEL_NONE;
> > 
> > Seems overly complicated. Could just drop the alpha formats from
> > the list and be done with it.
> 
> This WA is "only" to NVL. This format supported from this platform
> onwards. So isn't this the right approach to list as supported though
> this WA counteract on that. 

The next platform can get its own pixel_format_is_valid() function.

> 
> Also gathered that, ARGB/ABGR with DRM_MODE_BLEND_PIXEL_NONE is treated
> like XRGB/XBGR. So aren't those case need to be allowed? And there is
> another existing case in the fbc_check_pane() where we do the same.

That is dead code. I also hope that userspace isn't dumb enough to
use a format with alpha needlessly.

-- 
Ville Syrjälä
Intel
