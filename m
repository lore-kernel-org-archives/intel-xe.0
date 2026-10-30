Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABDA606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EgJoxkqT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A6710E8B4;
	Fri, 30 Oct 2026 18:07:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B6110E8A7;
 Fri, 30 Oct 2026 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793383666; x=1824919666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iMCu81S75zLO2i9FQ6pTzBDIIuWC6KjPwVwRGycoMs0=;
 b=EgJoxkqTKMlKZsu+0Z8/DWKJsY504Z/kNed6rtAmyJxMQTAsYHpTb22J
 lRbx/syp3ht/Z/Lh//6iaiG1cOk81eMa8N+MOwif9f6n8iuunYugJl1DM
 mzqlfTJovOrDNP07Tfkuw4dwA9IijytrnHD2nk5J4eHlQs9tsET7Z37IQ
 uG6spjVeTF9qR7m0+zT8ZB+D8T3eboSMsfHs0kEgVFiuHT631WUoX6HeY
 DSuCp/3igQ6eM/i0LxGYGFiGQ2U2t/xk1bOpIVuTNpWlENsE8g1JQFHBH
 JB/f3x6ncEQv6I2pGjyWYlFaWv/5q02fVSqD+P9WzldjHDL5+bPl+yzJA w==;
X-CSE-ConnectionGUID: gjzROsGJR026tfsVC4q5Bg==
X-CSE-MsgGUID: o8FP0nLkT7iqowZsB204ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2054543"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2054543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 11:07:46 -0700
X-CSE-ConnectionGUID: r6JRaza9S06mZ+OCu9l0Kw==
X-CSE-MsgGUID: p5a+eOGXS5yqtCXJ5cD5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="6041310"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 11:07:45 -0700
Date: Fri, 30 Oct 2026 20:07:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/10] drm/i915: Wait for timing generator to start in
 intel_crtc_vblank_on() on HSW+
Message-ID: <auTc7YkuwukKcLWX@intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-7-ville.syrjala@linux.intel.com>
 <sashiko-outbox-191348@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-191348@kernel.org>
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

On Fri, Oct 30, 2026 at 05:32:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915: intel_pipe_vblank_on() scanline wait times out on DSI
> --
> 
> commit a024447aed84d4ab8f0e7bb2ee11d21475e5b408
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/i915: Wait for timing generator to start in intel_crtc_vblank_on() on HSW+
> 
> This commit waits for the pipe scanline counter to start moving inside
> intel_pipe_vblank_on() on Haswell and newer platforms before enabling
> vblank interrupts.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> > index a28f4a088e587..209d5a18ee8d9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> > @@ -128,8 +128,21 @@ u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state)
> >  
> >  void intel_pipe_vblank_on(const struct intel_crtc_state *crtc_state)
> >  {
> > +	struct intel_display *display = to_intel_display(crtc_state);
> >  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> >  
> > +	/*
> > +	 * Make sure the timing generator has really started so
> > +	 * the sampled frame/scanline counter values don't jump
> > +	 * erratically.
> > +	 *
> > +	 * TODO do this for older platforms as well after
> > +	 * rearranging the modeset sequence a bit.
> > +	 */
> > +	if (DISPLAY_VER(display) >= 9 ||
> > +	    display->platform.broadwell || display->platform.haswell)
> > +		intel_wait_for_pipe_scanline_moving(crtc);
> 
> [Severity: Medium]
> Will calling intel_wait_for_pipe_scanline_moving() unconditionally on
> DISPLAY_VER(display) >= 9 time out for 100 ms and log a false error on
> Broxton/Geminilake DSI and Gen11+ DSI command mode?
> 
> intel_wait_for_pipe_scanline_moving() calls wait_for_pipe_scanline_moving() ->
> pipe_scanline_is_moving(), which directly polls PIPEDSL:
> 
> drivers/gpu/drm/i915/display/intel_vblank.c:pipe_scanline_is_moving() {
> 	intel_reg_t reg = PIPEDSL(display, pipe);
> 	u32 line1, line2;
> 
> 	line1 = intel_de_read(display, reg) & PIPEDSL_LINE_MASK;
> 	msleep(5);
> 	line2 = intel_de_read(display, reg) & PIPEDSL_LINE_MASK;
> 
> 	return line1 != line2;
> }
> 
> On Broxton (DISPLAY_VER 9) and Geminilake (DISPLAY_VER 10) MIPI DSI, timings
> are driven from the port rather than the CPU transcoder, and PIPEDSL does not
> increment. Because of this, intel_dsi_compute_config() and
> bxt_dsi_get_pipe_config() set I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP, and
> __intel_get_crtc_scanline() skips reading PIPEDSL:
> 
> drivers/gpu/drm/i915/display/intel_vblank.c:__intel_get_crtc_scanline() {
> 	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
> 		return __intel_get_crtc_scanline_from_timestamp(crtc);
> 
> 	vtotal = intel_mode_vtotal(mode);
> 
> 	position = intel_de_read_fw(display, PIPEDSL(display, pipe)) & PIPEDSL_LINE_MASK;
> 	...
> }
> 
> When bxt_dsi_enable() -> intel_crtc_vblank_on() -> intel_pipe_vblank_on() runs
> (or during intel_modeset_setup_hw_state()), polling PIPEDSL will see a static
> value and time out.
> 
> Similarly, on Gen11+ DSI command mode (where I915_MODE_FLAG_DSI_USE_TE0 or
> I915_MODE_FLAG_DSI_USE_TE1 is set in crtc_state->mode_flags),
> gen11_dsi_configure_transcoder() configures the transcoder in CMD_MODE_TE_GATE
> without periodic updates. When gen11_dsi_enable() calls intel_crtc_vblank_on()
> during intel_enable_crtc(), no frame update has been requested yet because
> icl_dsi_frame_update() is only called later in intel_update_crtc() ->
> intel_pipe_update_end():
> 
> drivers/gpu/drm/i915/display/intel_crtc.c:intel_pipe_update_end() {
> 	...
> 	if (DISPLAY_VER(display) >= 11 &&
> 	    intel_crtc_has_type(new_crtc_state, INTEL_OUTPUT_DSI))
> 		icl_dsi_frame_update(new_crtc_state);
> 	...
> }
> 
> Should intel_pipe_vblank_on() skip intel_wait_for_pipe_scanline_moving() when
> crtc_state->mode_flags has I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP or
> I915_MODE_FLAG_DSI_USE_TE0 / I915_MODE_FLAG_DSI_USE_TE1 set?

DSI, sigh. 

I suppose for I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP we could
just wait for the frame timestamp to change. Or perhaps even use
that approach unconditionally for all platforms that have frame
timestamps. But I'll probably need to reverse engineer the actual
behavior of the frame timestamp during timing generator startup...

For now I guess I could just skip this for anything where
the scanline counter supposedly doesn't work.

-- 
Ville Syrjälä
Intel
