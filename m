Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A3606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z1TkpdeD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4F01120C1;
	Thu, 12 Nov 2026 12:50:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B991120C1;
 Thu, 12 Nov 2026 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794487830; x=1826023830;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6RIK5uEj5xdHgDFhLSgCCAx+Ipqqb6MeM3MyK9/KBh0=;
 b=Z1TkpdeD67IeXR0gJvRUT/RNiwjq780e2zaYo59hP3NxR4X08Wi26Kek
 iexqTFp3zsim4TQ7EhkqHJu97u39jhSn74lhpokMymyAAEg//nOwJ1GTo
 BgkQ46wtxSWYQ7QnEGX0DI1MxHP1pucY+1hrI3cIYQwwvcafe3fEpSzQJ
 +Wdn/Yf6x/39GScraw2QUQJm98DlkMFHSfQ9hsUvPQF64yCzTJu5PS+nB
 +T5OAUtYxkTSFPRNg5rEEK37nKjZ5wtVtEWINDYqBof5YNbd1tGDsrNmm
 lpXgXePYR+cZgHwoe76oc2EUC2piEZ6RcO1nWWKIzbghFtyH/ck9ZzlYg Q==;
X-CSE-ConnectionGUID: Zcfoa8BKQcexqJvcZKtgOw==
X-CSE-MsgGUID: 1Q4jh1goTCmtZ2MEUa/QCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3304762"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3304762"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:50:30 -0800
X-CSE-ConnectionGUID: XejGvoV3TCC3U2ydgKjtAw==
X-CSE-MsgGUID: YF30F6CVR5+5P9w8UJTDdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8994111"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.60])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:50:28 -0800
Date: Thu, 12 Nov 2026 14:50:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 06/15] drm/i915/pfit: Extract i965_pfit_get_config()
Message-ID: <avW2EY5KbsZzKhYa@intel.com>
References: <20261019135309.23578-7-ville.syrjala@linux.intel.com>
 <20261020183842.5218-1-ville.syrjala@linux.intel.com>
 <pdge7elm432id5djkqfiuxtngxbj6v2nownf4iggduvb4ltznj@ouexxq5lzxvd>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pdge7elm432id5djkqfiuxtngxbj6v2nownf4iggduvb4ltznj@ouexxq5lzxvd>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 10:57:03AM +0100, Michał Grzelak wrote:
> On Tue, Oct 20, 2026 at 09:38:42PM GMT, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Split i965_pfit_get_config() out from i9xx_pfit_get_config() to
> > unconfuse things a bit.
> > 
> > Note that we stop reading PFIT_PGM_RATIOS into
> > crtc_state->gmch_pfit.pgm_ratios since wen ever use the
> > progammed ratios on i965+. The .compute_config() path doesn't
> > populate crtc_state->gmch_pfit.pgm_ratios either.
> 
> I got lost a bit here. Maybe:
> s/wen ever/whenever we/
> s/progammed/programmed/
> s/i965+. The/i965+ the/

Its should have been:
 Note that we stop reading PFIT_PGM_RATIOS into
 crtc_state->gmch_pfit.pgm_ratios since we never use the
 programmed ratios on i965+. The .compute_config() path doesn't
 populate crtc_state->gmch_pfit.pgm_ratios either.

>
> 
> But that's just suggestion, not a blocker:
> Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> 
> BR,
> Michał
> 
> > 
> > v2: Highlight the crtc_state->gmch_pfit.pgm_ratios change (Jani)
> > 
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_pfit.c | 58 +++++++++++++++--------
> >  1 file changed, 38 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> > index 972218346362..82804159d0a1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> > +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> > @@ -720,38 +720,51 @@ void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
> >  	intel_de_write(display, PFIT_CONTROL(display), 0);
> >  }
> >  
> > -static bool i9xx_has_pfit(struct intel_display *display)
> > +static void i965_pfit_get_config(struct intel_crtc_state *crtc_state)
> >  {
> > +	struct intel_display *display = to_intel_display(crtc_state);
> > +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> > +	enum pipe pipe;
> > +	u32 tmp;
> > +
> > +	tmp = intel_de_read(display, PFIT_CONTROL(display));
> > +	if (!(tmp & PFIT_ENABLE))
> > +		return;
> > +
> > +	/* Check whether the pfit is attached to our pipe. */
> > +	pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> > +	if (pipe != crtc->pipe)
> > +		return;
> > +
> > +	crtc_state->gmch_pfit.control = tmp;
> > +}
> > +
> > +static bool i9xx_has_pfit(struct intel_crtc *crtc)
> > +{
> > +	struct intel_display *display = to_intel_display(crtc);
> > +
> > +	if (crtc->pipe != PIPE_B)
> > +		return false;
> > +
> >  	if (display->platform.i830)
> >  		return false;
> >  
> > -	return DISPLAY_VER(display) >= 4 ||
> > -		display->platform.pineview || display->platform.mobile;
> > +	return display->platform.pineview || display->platform.mobile;
> >  }
> >  
> >  static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
> >  {
> >  	struct intel_display *display = to_intel_display(crtc_state);
> >  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> > -	enum pipe pipe;
> >  	u32 tmp;
> >  
> > -	if (!i9xx_has_pfit(display))
> > +	if (!i9xx_has_pfit(crtc))
> >  		return;
> >  
> >  	tmp = intel_de_read(display, PFIT_CONTROL(display));
> >  	if (!(tmp & PFIT_ENABLE))
> >  		return;
> >  
> > -	/* Check whether the pfit is attached to our pipe. */
> > -	if (DISPLAY_VER(display) >= 4)
> > -		pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> > -	else
> > -		pipe = PIPE_B;
> > -
> > -	if (pipe != crtc->pipe)
> > -		return;
> > -
> >  	crtc_state->gmch_pfit.control = tmp;
> >  	crtc_state->gmch_pfit.pgm_ratios =
> >  		intel_de_read(display, PFIT_PGM_RATIOS(display));
> > @@ -761,10 +774,15 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
> >  {
> >  	struct intel_display *display = to_intel_display(crtc_state);
> >  
> > -	if (HAS_GMCH(display))
> > -		i9xx_pfit_get_config(crtc_state);
> > -	else if (DISPLAY_VER(display) >= 9)
> > -		skl_scaler_get_config(crtc_state);
> > -	else
> > -		ilk_pfit_get_config(crtc_state);
> > +	if (HAS_GMCH(display)) {
> > +		if (DISPLAY_VER(display) >= 4)
> > +			i965_pfit_get_config(crtc_state);
> > +		else
> > +			i9xx_pfit_get_config(crtc_state);
> > +	} else {
> > +		if (DISPLAY_VER(display) >= 9)
> > +			skl_scaler_get_config(crtc_state);
> > +		else
> > +			ilk_pfit_get_config(crtc_state);
> > +	}
> >  }
> > -- 
> > 2.55.0
> > 
> > 

-- 
Ville Syrjälä
Intel
