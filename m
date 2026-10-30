Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04290606A320
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b81ueP3o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BA510E8A6;
	Fri, 30 Oct 2026 17:49:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E1B10E7FA;
 Fri, 30 Oct 2026 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793382563; x=1824918563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q9NUBALzJtbhnhVCNIwuJ47P+HE6jJLbXyKKMYZsZfM=;
 b=b81ueP3oYXyOQsjv51+FBPSuJW/tNc0ng0owrN+yt2uWeGyoerg0vWFO
 R0rPyaoRaWNymLCu8iy1C05uTtG9IA86+s2pShPTCvgNqQPM3ZuQu9qHS
 K1g+J/P3iK551CrWWSQ3HDy7PpXFoX5W+zxw6AwQhhO8OxzSZF7uW6Ec5
 s4PqKiIKrazyd+PiVgoOiAZT7pUVtSTOq9uJAS9zPOq2ERPy/BeeEP4aH
 YWL8ZI8gnz903+4W6jCBJkVg9Xu7bPQMP8Lj6VKCJldumLwAM56ROIWPi
 bz2DnzVLkuCWknfzSt2QBNK3rRsYDE23Shps47HsC3g4ysBoFIQvE3lDs g==;
X-CSE-ConnectionGUID: h7YGpb5FS8WzY+yxqaxrQw==
X-CSE-MsgGUID: sEC8r/MWTaKAdnpPfE7HTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2041057"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2041057"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:49:22 -0700
X-CSE-ConnectionGUID: gjq2ikNwQp+wdp/6QMhXhg==
X-CSE-MsgGUID: zp2xxMV6QGS4vueUG2sEiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7335017"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:49:21 -0700
Date: Fri, 30 Oct 2026 19:49:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/10] drm/i915: Handle joined pipes inside
 intel_crtc_vblank_{on, off}()
Message-ID: <auTYnfB34tjuivIH@intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-4-ville.syrjala@linux.intel.com>
 <sashiko-outbox-191339@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-191339@kernel.org>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 05:26:33PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/i915: NULL state dereference in intel_crtc_vblank_off()
> --
> 
> commit c6499a1bf58e345d4e50ee3b23d7821c66712bdd
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915: Handle joined pipes inside intel_crtc_vblank_{on, off}()
> 
> This commit moves the joined-pipe iteration into intel_crtc_vblank_on()
> and intel_crtc_vblank_off(), renaming the single-pipe helpers to
> intel_pipe_vblank_on() and intel_pipe_vblank_off(). Callers are updated to
> pass struct intel_atomic_state alongside the CRTC state.
> 
> > diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> > index ea0cdb7822f39..381cdf7d5131c 100644
> > --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> > +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> 
> [ ... ]
> 
> > @@ -1455,7 +1455,7 @@ static void gen11_dsi_post_disable(struct intel_atomic_state *state,
> >  	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
> >  	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
> >  
> > -	intel_crtc_vblank_off(old_crtc_state);
> > +	intel_crtc_vblank_off(state, old_crtc_state);
> >  
> >  	/* step2d,e: disable transcoder and wait */
> >  	gen11_dsi_disable_transcoder(encoder);
> > diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
> > index 5b8968197fbcf..b814b84c650fd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crt.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> > @@ -265,7 +265,7 @@ static void hsw_post_disable_crt(struct intel_atomic_state *state,
> >  	struct intel_display *display = to_intel_display(encoder);
> >  	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
> >  
> > -	intel_crtc_vblank_off(old_crtc_state);
> > +	intel_crtc_vblank_off(state, old_crtc_state);
> >  
> >  	intel_disable_transcoder(old_crtc_state);
> >  
> 
> [ ... ]
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> > index 10ed9bdfee763..a28f4a088e587 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> 
> [ ... ]
> 
> > @@ -165,6 +165,34 @@ void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state)
> >  	flush_work(&display->irq.vblank_notify_work);
> >  }
> >  
> > +void intel_crtc_vblank_on(struct intel_atomic_state *state,
> > +			  const struct intel_crtc_state *crtc_state)
> > +{
> > +	struct intel_display *display = to_intel_display(state);
> > +	struct intel_crtc *pipe_crtc;
> > +
> > +	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, crtc_state) {
> > +		const struct intel_crtc_state *pipe_crtc_state =
> > +			intel_atomic_get_new_crtc_state(state, pipe_crtc);
> > +
> > +		intel_pipe_vblank_on(pipe_crtc_state);
> > +	}
> > +}
> > +
> > +void intel_crtc_vblank_off(struct intel_atomic_state *state,
> > +			   const struct intel_crtc_state *old_crtc_state)
> > +{
> > +	struct intel_display *display = to_intel_display(state);
> > +	struct intel_crtc *pipe_crtc;
> > +
> > +	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state) {
> > +		const struct intel_crtc_state *old_pipe_crtc_state =
> > +			intel_atomic_get_old_crtc_state(state, pipe_crtc);
> > +
> > +		intel_pipe_vblank_off(old_pipe_crtc_state);
> > +	}
> > +}
> 
> [Severity: High]
> Can state be NULL when intel_crtc_vblank_off() is called from
> encoder->post_disable()?
> 
> During initial hardware readout or resume in
> intel_modeset_setup_hw_state(), intel_sanitize_encoder() disables an
> encoder whose connector is active while its pipe is inactive by invoking
> the disable hooks with a NULL atomic state:
> 
> drivers/gpu/drm/i915/display/intel_modeset_setup.c:intel_sanitize_encoder() {
> 	...
> 	if (connector && !has_active_crtc) {
> 		...
> 		if (crtc_state) {
> 			...
> 			/* FIXME NULL atomic state passed! */
> 			if (encoder->disable)
> 				encoder->disable(NULL, encoder, crtc_state,
> 						 connector->base.state);
> 			if (encoder->post_disable)
> 				encoder->post_disable(NULL, encoder, crtc_state,
> 						      connector->base.state);
> 		}
> 	}
> }
> 
> Previously, gen11_dsi_post_disable(), intel_dsi_post_disable() (on
> Broxton and Geminilake), and hsw_post_disable_crt() did not dereference
> state and passed old_crtc_state directly to intel_crtc_vblank_off(). With
> this change, those callbacks pass state = NULL to intel_crtc_vblank_off(),
> which dereferences state in both to_intel_display(state) and
> intel_atomic_get_old_crtc_state(state, pipe_crtc).
> 
> Would it make sense to keep using intel_pipe_vblank_off(old_crtc_state) in
> the non-joiner post_disable callbacks, or handle a NULL state inside
> intel_crtc_vblank_off()?

I thought about it but apparently forgot to note it in the commit
message; My conclusion was that the encoder sanitize stuff should
never happen on the platforms where we do the vblank_off() from the
encoder hooks. On earlier platforms the vblank_off() is in
.crtc_disable() and intel_crtc_disable_noatomic_begin() creates
a temporary atomic state for that.

I've also occasionally pondered about creating a temporary
atomic state for intel_sanitize_encoder() as well, just to get
rid of even the theoretical possibility of a NULL state. But
that would probably involve some actual thinking...

-- 
Ville Syrjälä
Intel
