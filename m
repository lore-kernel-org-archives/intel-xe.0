Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C9606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNUfruzh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FC510F466;
	Tue, 27 Oct 2026 12:48:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2304F10F465;
 Tue, 27 Oct 2026 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793105297; x=1824641297;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8feM4CV0QTWMggZYz9XdhtigofoMF0Yr4vxJnaAoV4s=;
 b=SNUfruzhHRRgdVM3gBV+sGF6pRnycQhDoBFuBn2UgkllFzMP2ubjjZB9
 wHWsJIL6GNS5GzWOrKuxBfoVSPCS96isc+RuE/pgDLnM7YdydnwSzLDIi
 wxpyksYFqUzbWMGgXsKc3uPCBNFMK5hW3haQhhPoXGEef32zoVX1fMPni
 0qKuZe/QV/eWLWkAg1ZKCOUSYa1QfaUm/oP09nhH8tHPPRZzjt6XFyff2
 UdnmYFwxjlG3h01M6un8CWhLaKV/Ki9ckzQcaG4IfblXU5FKjTF1EHNiS
 /iJTjbhUKTLQjX5dOUt3gC3TR1tgu47OA/FsSzaeEamWjWrxXhTSXpDbk A==;
X-CSE-ConnectionGUID: lAupPE2vRdi/F4DMov8pLQ==
X-CSE-MsgGUID: 9jW/IzffRwKUh3NJGA43GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1823643"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1823643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:48:16 -0700
X-CSE-ConnectionGUID: mFBZqWDpTRG9NpAyuE//Uw==
X-CSE-MsgGUID: 3D0T6ysDTH63dEnOl9jnmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4439036"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 05:48:15 -0700
Date: Tue, 27 Oct 2026 14:48:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/i915/fbc: update the supported FP16 formats
Message-ID: <auCdjLxz021c2xmT@intel.com>
References: <20261026145508.235851-1-vinod.govindapillai@intel.com>
 <at9ulGJlfF6ImWOl@intel.com>
 <9d4f394e56e08def3c9b837291f4e09eb3a2f4b1.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d4f394e56e08def3c9b837291f4e09eb3a2f4b1.camel@intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 09:06:58AM +0000, Govindapillai, Vinod wrote:
> On Mon, 2026-10-26 at 17:15 +0200, Ville Syrjälä wrote:
> > On Mon, Oct 26, 2026 at 04:55:06PM +0200, Vinod Govindapillai wrote:
> > > FBC is supported with FP16 formats with or without alpha. At the
> > > same time modify the function name for the FP16 format check and
> > > simplify the FP16 format check calls.
> > > 
> > > Bspec: 68904
> > > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_fbc.c | 21 +++++++-------------
> > > -
> > >  1 file changed, 7 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c
> > > b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > index 5694d20773f8..dbb16a9ec69d 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> > > @@ -1180,14 +1180,15 @@ static bool
> > > lnl_fbc_pixel_format_is_valid(const struct intel_plane_state
> > > *plane_
> > >  	}
> > >  }
> > >  
> > > -static bool
> > > -xe3p_lpd_fbc_fp16_format_is_valid(const struct intel_plane_state
> > > *plane_state)
> > > +static bool intel_fbc_is_fp16_format(const struct
> > > intel_plane_state *plane_state)
> > >  {
> > >  	const struct drm_framebuffer *fb = plane_state->hw.fb;
> > >  
> > >  	switch (fb->format->format) {
> > >  	case DRM_FORMAT_ARGB16161616F:
> > > +	case DRM_FORMAT_XRGB16161616F:
> > >  	case DRM_FORMAT_ABGR16161616F:
> > > +	case DRM_FORMAT_XBGR16161616F:
> > >  		return true;
> > >  	default:
> > >  		return false;
> > > @@ -1196,24 +1197,16 @@ xe3p_lpd_fbc_fp16_format_is_valid(const
> > > struct intel_plane_state *plane_state)
> > >  
> > >  static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct
> > > intel_plane_state *plane_state)
> > >  {
> > > -	if (lnl_fbc_pixel_format_is_valid(plane_state))
> > > -		return true;
> > > -
> > > -	if (xe3p_lpd_fbc_fp16_format_is_valid(plane_state))
> > > -		return true;
> > > -
> > > -	return false;
> > > +	return lnl_fbc_pixel_format_is_valid(plane_state) ||
> > > +	       intel_fbc_is_fp16_format(plane_state);
> > 
> > This is getting super messy. Would be much simpler to just list
> > the actual supported pixel formats here instead of trying to
> > this hard to follow inheritance thing.
> Ok. I will list all the formats as it is.
> 
> But pixel normalizer need to be enabled for fp16 formats, I think, it
> is better to group those as a separate reusable function. are you ok
> with that?

Hmm. I thought the format_info thing has a .is_float already, but
apparently not. We could add that. But in the meantime just a
some format_is_float() function should do.

-- 
Ville Syrjälä
Intel
