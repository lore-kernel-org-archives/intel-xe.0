Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB25606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WPHZEC+i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CFC10E403;
	Thu, 12 Nov 2026 12:42:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C459310E403;
 Thu, 12 Nov 2026 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794487329; x=1826023329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7/6Uxr5LvA9RUwKWX+SKKoVDbvHY1GEfAtIRM269cEY=;
 b=WPHZEC+iKLqpLngqIDM372L7auLxX6IwAKNrCKK98wvEL/tGZ8rt0gst
 Al9Yr1HBFO+LFxNgjDMQp/KkIqdy7uPipVoGgW0NSRG5cJw9wGBRUskpB
 eTgzkj5Ik1IGOEuMID5nlxgSm8Btyvg5QyBFUXWvjldC585aiM5smNT/8
 /V06wkXKQSIuydjJsqggUEo1u1EQmKy7T+sj311lC5PTMEhTxWPzRY7oY
 XVPr76Yh3VTY7h0hLr4DfdIehJdvSEm3KldBgLd6qzijipwGAbG/ovcjj
 Pn8eHCWsmiHYF9X45nxsjS/n+M0kkxd5q8fZsnBZ9SYWkrzNknGIzStgu Q==;
X-CSE-ConnectionGUID: nVSwht9CSTyQi2mFPFqHOQ==
X-CSE-MsgGUID: LXMGHnzeSBWLSXvQOY3w4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3154756"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3154756"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:42:09 -0800
X-CSE-ConnectionGUID: d/XCWAZVRfWuXMp/ri3jSQ==
X-CSE-MsgGUID: 0dZcBWzTQd+DqT+5IWgKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8817752"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.60])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:42:06 -0800
Date: Thu, 12 Nov 2026 14:42:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 14/15] drm/i915/pfit: Account for pfit downscaling in
 pixel rate on GMCH platforms
Message-ID: <avW0G8HNImWkdT_0@intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-15-ville.syrjala@linux.intel.com>
 <shbezg62hmcqseiclkdfdgmcqef2x6dcqzg4xwh6lorkshydkq@2ihuuarp5vj7>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <shbezg62hmcqseiclkdfdgmcqef2x6dcqzg4xwh6lorkshydkq@2ihuuarp5vj7>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 10:47:47AM +0100, Michał Grzelak wrote:
> On Mon, Oct 19, 2026 at 04:53:08PM GMT, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Now that we have crtc_state->pch.dst populated on GMCH platforms
> > we can use the existing ILK+ code to calculate the downscale
> > adjusted pixel rate correctly on GMCH platforms.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 23 +++++++-------------
> >  1 file changed, 8 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index 200426bf0c59..6b813efff955 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2278,7 +2278,8 @@ static bool intel_crtc_supports_double_wide(const struct intel_crtc *crtc)
> >  		(crtc->pipe == PIPE_A || display->platform.i915g);
> >  }
> >  
> > -static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
> > +static unsigned int
> 
> Is there any consensus on when to use u32 and when unsigned int? I see
> that here it is because of pixel_rate_cdclk being defined as unsigned
> int, but asking for general guidance.

My general rules are roughly this:
1. Just plain old 'int' for most things
2. Use 'unsigned int' for some address/offset calculations and whatnot
   where negative values are never a thing
3. u32 for hardware registers and so forth

The pixel rate stuff should perhaps just all be 'int', but that
would probably need to double check a few things before doing that.

The one slight annoyance with signed ints is that stupid static
analyzers may start to nag you about unchecked negative values
even if they're not actually possible.

But a signed int is almost always the safer option in case you end
up using it in some arithmetic expression where negative results are
a possibility. Even a single 'unsigned int' there will probably 
convert the whole expression to unsigned due to C rules on integer
promotion/conversion, and then you negative result will become a
really large positive result.

> 
> Since that's a side question:
> 
> Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> 
> BR,
> Michał
> 
> > +intel_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
> >  {
> >  	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
> >  	struct drm_rect src;
> > @@ -2299,7 +2300,8 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
> >  				   pixel_rate);
> >  }
> >  
> > -static u32 ilk_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
> > +static unsigned int
> > +intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
> >  {
> >  	struct intel_display *display = to_intel_display(crtc_state);
> >  	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
> > @@ -2345,19 +2347,10 @@ static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
> >  
> >  static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
> >  {
> > -	struct intel_display *display = to_intel_display(crtc_state);
> > -
> > -	if (HAS_GMCH(display)) {
> > -		/* FIXME calculate proper pipe pixel rate for GMCH pfit */
> > -		crtc_state->pixel_rate =
> > -			crtc_state->hw.pipe_mode.crtc_clock;
> > -		crtc_state->pixel_rate_cdclk = crtc_state->pixel_rate;
> > -	} else {
> > -		crtc_state->pixel_rate =
> > -			ilk_pipe_pixel_rate(crtc_state);
> > -		crtc_state->pixel_rate_cdclk =
> > -			ilk_pipe_pixel_rate_cdclk(crtc_state);
> > -	}
> > +	crtc_state->pixel_rate =
> > +		intel_pipe_pixel_rate(crtc_state);
> > +	crtc_state->pixel_rate_cdclk =
> > +		intel_pipe_pixel_rate_cdclk(crtc_state);
> >  }
> >  
> >  static void intel_joiner_adjust_timings(const struct intel_crtc_state *crtc_state,
> > -- 
> > 2.55.0
> > 
> > 

-- 
Ville Syrjälä
Intel
