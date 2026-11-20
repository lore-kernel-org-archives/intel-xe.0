Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84465606A332
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jv6QbmXs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473DA10E2F7;
	Fri, 20 Nov 2026 15:03:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026F610E24F;
 Fri, 20 Nov 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795186995; x=1826722995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8iwqJ143Rfeo1zCCyLcuV9vE7s18YVQWaNCsw1j9IZQ=;
 b=jv6QbmXsumFmhxxuqKnCbj2EuNGDX4FInivEPen9Fp479IP/DNwGnLXq
 A1ui1y5pHC0UxzZYsy5ihZZN2zMfCypPBkAqiWizr1K2FS/QAaiJwVegQ
 DpwrnS8esOS4j+OJsuV7Fkz6HosK73XDl3bARIUPDYWcKExMvyhjvD17D
 ZUzyMZmzjfhRLRlUtv2QnfJsLrj+dZoHRuZZ74pYGLO7nUn3VToF8XgT5
 VafgE83Q4hSyzsq7pgNnux4rtMJ31YUOalH0t7fqdjlixeKlCiYu8lOt5
 VuyE1HXI+4m/d+Oe74pwhPW7HhkOEeJ3tPAUTwhdHXc2Qu7X/h7krIv1I Q==;
X-CSE-ConnectionGUID: RCjjHzFwThGmgINSylnGDA==
X-CSE-MsgGUID: tWSitsFWSNeivGpnQ9GbKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4069331"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4069331"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:03:14 -0800
X-CSE-ConnectionGUID: Y3MF4QldS3+Qrh4tto+zSw==
X-CSE-MsgGUID: /7kR7YHvRvipU+cANMSdcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10842449"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.66])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:03:11 -0800
Date: Fri, 20 Nov 2026 17:03:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: "j@metarealtyinc.ca" <j@metarealtyinc.ca>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Message-ID: <awBhLKnEiGt69Vr7@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
 <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
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

On Fri, Nov 20, 2026 at 09:42:40AM +0000, Hogander, Jouni wrote:
> On Tue, 2026-10-06 at 18:05 -0400, Jake Steinman wrote:
> > Sinks that support async video timing in PR get the AS SDP suspended
> > in
> > PR Active (disable_as_sdp_when_pr_active). The LG panel in the Dell
> > XPS
> > 16 DA16260 (sink OUI 00:22:b9, "Balsa2") then judders while frames
> > are
> > updating, with the source flipping at a steady 8.33 ms. Leaving the
> > AS
> > SDP on fixes it but blocks DC5/DC6.
> > 
> > Clear PR_ALPM_CTL[AS SDP Transmission in Active Disable] while vblank
> > interrupts are enabled and set it again when they are disabled. Panel
> > Replay already holds DC_OFF while vblank is enabled, so no DC5/DC6
> > residency is lost. Not done when AS SDP skip frames is in use.
> 
> Finally I was able to get confirmation internally on this. We should
> actually use this approach.

Is this some weird hardware quirk of ours? I don't see what vblank
interrupts (purely an internal thing to the display engine) have to
do with the external panel receiving SDPs.

> 
> Second patch in your set could be removal of the quirk? That one could
> have tag "Closes:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9119"
> 
> Also add these into this patch:
> 
> Fixes: d6a8336c5f06 ("drm/i915/alpm: Write PR_ALPM_CTL register")
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.17+
> 
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8930
> > Cc: Jouni Högander <jouni.hogander@intel.com>
> > Cc: Animesh Manna <animesh.manna@intel.com>
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
> > ---
> > Jouni, this is the fix for the stutter in the thread below. The 0x107
> > bit 6 patch there is still correct but is not enough on its own.
> > https://lore.kernel.org/r/20260923041342.2146450-1-j@metarealtyinc.ca
> > 
> > - Run as an equivalent change on 7.3-rc4 and rc5 (PTL, xe) since 28
> > Sep:
> >   smooth, DC5 still reached when idle. This drm-tip version is build
> >   tested only (W=1, i915 and xe).
> > - A seamless VRR toggle rewrites PR_ALPM_CTL through
> >   intel_alpm_configure_pr_as_sdp() and sets the bit again until the
> >   next vblank enable. Not handled here.
> > - A second machine shows the same thing: XPS 13 (1028:0e53, same sink
> >   OUI), fixed downstream by exiting PR on every flush (issue 8930).
> > - Separate from this: the panel judders for a few seconds after panel
> >   power-on. Locally I hold PR inactive after power-on; 3 s was not
> >   quite enough, 8 s is clean. Not part of this patch.
> > - CI has never run on my patches (address not on the allowlist, asked
> >   twice). Could someone trigger it for this one and for series
> > 174810?
> >  .../drm/i915/display/intel_display_types.h    |  3 ++
> >  drivers/gpu/drm/i915/display/intel_psr.c      | 36
> > ++++++++++++++++++-
> >  2 files changed, 38 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 0e3083e85..75113ed10 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1816,6 +1816,9 @@ struct intel_psr {
> >  	bool dc3co_allowed;
> >  	/* DC3CO disable work */
> >  	struct delayed_work dc3co_work;
> > +	/* AS SDP in PR Active follows vblank enable */
> > +	bool pr_as_sdp_follow_vblank;
> > +	bool vblank_enabled;
> >  	u16 su_w_granularity;
> >  	u16 su_y_granularity;
> >  	bool source_panel_replay_support;
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> > b/drivers/gpu/drm/i915/display/intel_psr.c
> > index 00d0146b2..0f0b1fc94 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -2166,6 +2166,29 @@ static bool psr_interrupt_error_check(struct
> > intel_dp *intel_dp)
> >  	return true;
> >  }
> >  
> > +/*
> > + * Sinks that support async video timing in PR get the AS SDP
> > suspended in PR
> > + * Active. Some then drift out of phase with the source and judder
> > while
> > + * frames are being updated. Send the AS SDP in PR Active while
> > vblank
> > + * interrupts are enabled: Panel Replay holds DC_OFF then anyway, so
> > this
> > + * costs no DC5/DC6 residency. Suspend it again when vblank
> > interrupts are
> > + * disabled, before DC_OFF is dropped.
> > + */
> > +static void intel_psr_pr_as_sdp_update(struct intel_dp *intel_dp)
> > +{
> > +	struct intel_display *display = to_intel_display(intel_dp);
> > +
> > +	lockdep_assert_held(&intel_dp->psr.lock);
> > +
> > +	if (!intel_dp->psr.enabled || !intel_dp-
> > >psr.pr_as_sdp_follow_vblank)
> > +		return;
> 
> You could drop pr_as_sdp_follow_vblank. Instead check here only
> crtc_state->disable_as_sdp_when_pr_active and intel_dp->psr.enabled
> 
> Then just use inverted intel_dp->psr.vblank_enabled to set/clear the
> bit.
> 
> Everything else: 
> 
> intel_alpm_pr_as_sdp_skip_frames_enabled
> intel_psr_needs_alpm_aux_less
> crtc_state->infoframes.enable &
> intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC)
> 
> could be checked in compute_disable_as_sdp_when_pr_active.
> 
> Would this work for you?
> 
> > +
> > +	intel_de_rmw(display, PR_ALPM_CTL(display, intel_dp-
> > >psr.transcoder),
> > +		    
> > PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE,
> > +		     intel_dp->psr.vblank_enabled ? 0 :
> > +		    
> > PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE);
> 
> I propose you add a new helper into intel_alpm.c providing interface
> just to set the bit.
> 
> Also you need to remove setting the bit in
> intel_alpm_configure_pr_as_sdp. That could be separate patch.
> 
> BR,
> Jouni Högander
> 
> > +}
> > +
> >  static void intel_psr_enable_locked(struct intel_dp *intel_dp,
> >  				    const struct intel_crtc_state
> > *crtc_state)
> >  {
> > @@ -2225,6 +2248,12 @@ static void intel_psr_enable_locked(struct
> > intel_dp *intel_dp,
> >  	intel_dp->psr.enabled = true;
> >  	intel_dp->psr.pause_counter = 0;
> >  
> > +	intel_dp->psr.pr_as_sdp_follow_vblank = crtc_state-
> > >has_panel_replay &&
> > +		crtc_state->disable_as_sdp_when_pr_active &&
> > +		intel_dp->as_sdp_supported &&
> > intel_dp_is_edp(intel_dp) &&
> > +		!intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp,
> > crtc_state);
> > +	intel_psr_pr_as_sdp_update(intel_dp);
> > +
> >  	/*
> >  	 * Link_ok is sticky and set here on PSR enable. We can
> > assume link
> >  	 * training is complete as we never continue to PSR enable
> > with
> > @@ -2400,6 +2429,7 @@ static void intel_psr_disable_locked(struct
> > intel_dp *intel_dp)
> >  	intel_dp->psr.pkg_c_latency_used = 0;
> >  	cancel_delayed_work(&intel_dp->psr.dc3co_work);
> >  	intel_dp->psr.dc3co_allowed = false;
> > +	intel_dp->psr.pr_as_sdp_follow_vblank = false;
> >  }
> >  
> >  /**
> > @@ -4163,7 +4193,11 @@ void
> > intel_psr_notify_vblank_enable_disable(struct intel_display *display,
> >  				intel_dp->psr.vblank_wakeref =
> >  					intel_display_power_get(disp
> > lay,
> >  								POWE
> > R_DOMAIN_DC_OFF);
> > -			else
> > +
> > +			intel_dp->psr.vblank_enabled = enable;
> > +			intel_psr_pr_as_sdp_update(intel_dp);
> > +
> > +			if (!enable)
> >  				intel_display_power_put(display,
> > POWER_DOMAIN_DC_OFF,
> >  							intel_dp-
> > >psr.vblank_wakeref);
> >  		}
> > 
> > base-commit: daeb062fc40f727fafefed080c6d12a5ad1d0d12

-- 
Ville Syrjälä
Intel
