Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B2E606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wlv6jVUD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62972112443;
	Thu,  5 Nov 2026 13:43:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4266710E14B;
 Thu,  5 Nov 2026 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793886221; x=1825422221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aKuGAb5ubV8sRuf+5o1waPKj5iXP4+iOJY4uENXRg+I=;
 b=Wlv6jVUDVcbHSBvWJcKhJ1Y+LKR/CkMhE3FCFrsGkfVaqWS31+ST21bG
 TSy07UL0TXjsiz8OUyRmqOSrWIYEfAFI0NIGY3H0fqUhBZp5GXh6K0UUE
 bejCjU5HqJQOPbr8/06KlGfOgA+NPzH2kEwMakYao30+1OAtx9+c+t4yy
 M8va+Edz5tOY+w3GODhgqp928ZGUhv6EMjlEmcVRmNI7D/EDcw76swdNj
 Dl5PG0z59QMq0RzIyrOJvm9Y9xH5FmT8yAijjVOTq/jpefXN1SAD8N/oK
 9SKZZjgQXWFaLCaisGuD4lRAk/IF89CckfM/jpm5a8Mw/T+X7nlEmNUYK A==;
X-CSE-ConnectionGUID: b1KtJC7OR6mZ8TxwumT/aw==
X-CSE-MsgGUID: 7CFMDW7ET9qQY0V4gN8UAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2666236"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2666236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 05:43:41 -0800
X-CSE-ConnectionGUID: R5yBValnTFybuz0GtgG1Gw==
X-CSE-MsgGUID: gPKtTWpvTqW4TYdWJ3GQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7177019"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 05:43:39 -0800
Date: Thu, 5 Nov 2026 15:43:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/i915/de: Introduce display->mmio.lock
Message-ID: <auyICBzA2aa9hHBw@intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-6-ville.syrjala@linux.intel.com>
 <e14bda43b109cc92c66277921b9d2cb31b8befce@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e14bda43b109cc92c66277921b9d2cb31b8befce@intel.com>
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

On Thu, Nov 05, 2026 at 11:32:25AM +0200, Jani Nikula wrote:
> On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Introduce our own display specific mmio.lock, and wrap
> > the more expensive non-fw register accesses with it. And
> > everything that explicitly takes the uncore.lock currently,
> > switch over to mmio.lock as well.
> >
> > This will preserve the same serialization behavior between
> > display registers as the uncore.lock is currently providing.
> > Once uncore.lock has actually been eliminated from display
> > registers (not the case yet) display vs. non-display
> > register accesses could happen in parallel. But that should
> > be fine since generally the registers for different hardware
> > units don't live on the same cacheline, so even concerns
> > about parallel accesses to the same cacheline potentially
> > hanging the machine (on IVB/HSW) should be assuaged.
> >
> > Currently uncore.lock usage is limited to SNB+ on i915.
> > The xe driver, and older platforms on the i915 driver
> > don't use uncore.lock. Follow the same rule for the mmio.lock
> > initially.
> >
> > With this we now end up with a double lock, or even a
> > triple lock due to i915's mmio debug lock. But we'll eliminate
> > the extra locks shortly. The end goal is either just mmio.lock
> > or no locks whatsoever. Well, ignoring the DMC wakelock stuff
> > that uses an additional lock as well.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/i9xx_wm.c        |  9 ++-
> >  drivers/gpu/drm/i915/display/intel_de.c       | 69 +++++++++++++++++--
> >  .../gpu/drm/i915/display/intel_display_core.h |  9 +++
> >  drivers/gpu/drm/i915/display/intel_vblank.c   | 16 ++---
> >  4 files changed, 83 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
> > index 0233f5053d95..46bfada7c060 100644
> > --- a/drivers/gpu/drm/i915/display/i9xx_wm.c
> > +++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
> > @@ -1863,7 +1863,6 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
> >  				   struct intel_crtc *crtc)
> >  {
> >  	struct intel_display *display = to_intel_display(crtc);
> > -	struct intel_uncore *uncore = to_intel_uncore(display->drm);
> >  	const struct intel_crtc_state *crtc_state =
> >  		intel_atomic_get_new_crtc_state(state, crtc);
> >  	const struct vlv_fifo_state *fifo_state =
> > @@ -1884,15 +1883,15 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
> >  	trace_vlv_fifo_size(crtc, sprite0_start, sprite1_start, fifo_size);
> >  
> >  	/*
> > -	 * uncore.lock serves a double purpose here. It allows us to
> > -	 * use the less expensive I915_{READ,WRITE}_FW() functions, and
> > +	 * display->mmio.lock serves a double purpose here. It allows us to
> > +	 * use the less expensive intel_de_{read,write}_fw() functions, and
> >  	 * it protects the DSPARB registers from getting clobbered by
> >  	 * parallel updates from multiple pipes.
> >  	 *
> >  	 * intel_pipe_update_start() has already disabled interrupts
> >  	 * for us, so a plain spin_lock() is sufficient here.
> >  	 */
> > -	spin_lock(&uncore->lock);
> > +	spin_lock(&display->mmio.lock);
> >  
> >  	switch (crtc->pipe) {
> >  	case PIPE_A:
> > @@ -1952,7 +1951,7 @@ static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
> >  
> >  	intel_de_read_fw(display, DSPARB(display));
> >  
> > -	spin_unlock(&uncore->lock);
> > +	spin_unlock(&display->mmio.lock);
> >  }
> >  
> >  #undef VLV_FIFO
> > diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
> > index 66de0d6be569..8b7a4e696ff9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_de.c
> > +++ b/drivers/gpu/drm/i915/display/intel_de.c
> > @@ -164,6 +164,7 @@ u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
> >  }
> >  
> >  #define __MMIO_WAKELOCK		BIT(0)
> > +#define __MMIO_LOCK		BIT(1)
> >  
> >  static __always_inline void
> >  __mmio_wakelock_pre(struct intel_display *display, intel_reg_t reg,
> > @@ -181,16 +182,35 @@ __mmio_wakelock_post(struct intel_display *display, intel_reg_t reg,
> >  		intel_dmc_wl_put(display, reg);
> >  }
> >  
> > +static __always_inline void
> > +__mmio_lock_pre(struct intel_display *display, unsigned long *irqflags,
> > +		const unsigned int mmio_flags)
> > +{
> > +	if (mmio_flags & __MMIO_LOCK)
> > +		spin_lock_irqsave(&display->mmio.lock, *irqflags);
> > +}
> > +
> > +static __always_inline void
> > +__mmio_lock_post(struct intel_display *display, unsigned long irqflags,
> > +		 const unsigned int mmio_flags)
> > +{
> > +	if (mmio_flags & __MMIO_LOCK)
> > +		spin_unlock_irqrestore(&display->mmio.lock, irqflags);
> > +}
> > +
> >  static __always_inline u32
> >  __intel_de_read(struct intel_display *display, intel_reg_t reg,
> >  		const unsigned int mmio_flags)
> >  {
> > +	unsigned long irqflags;
> >  	u32 val;
> >  
> >  	__mmio_wakelock_pre(display, reg, mmio_flags);
> > +	__mmio_lock_pre(display, &irqflags, mmio_flags);
> >  
> >  	val = intel_uncore_read(__to_uncore(display), reg);
> >  
> > +	__mmio_lock_post(display, irqflags, mmio_flags);
> >  	__mmio_wakelock_post(display, reg, mmio_flags);
> >  
> >  	return val;
> > @@ -200,10 +220,14 @@ static __always_inline void
> >  __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
> >  		 const unsigned int mmio_flags)
> >  {
> > +	unsigned long irqflags;
> > +
> >  	__mmio_wakelock_pre(display, reg, mmio_flags);
> > +	__mmio_lock_pre(display, &irqflags, mmio_flags);
> >  
> >  	intel_uncore_write(__to_uncore(display), reg, val);
> >  
> > +	__mmio_lock_post(display, irqflags, mmio_flags);
> >  	__mmio_wakelock_post(display, reg, mmio_flags);
> >  }
> >  
> > @@ -226,6 +250,25 @@ static const struct intel_mmio_funcs i9xx_mmio_funcs = {
> >  	.write = i9xx_mmio_write,
> >  };
> >  
> > +#define SNB_MMIO_FLAGS __MMIO_LOCK
> > +
> > +static u32 snb_mmio_read(struct intel_display *display, intel_reg_t reg)
> > +{
> > +	return __intel_de_read(display, reg, SNB_MMIO_FLAGS);
> > +}
> > +
> > +static void snb_mmio_write(struct intel_display *display, intel_reg_t reg, u32 val)
> > +{
> > +	__intel_de_write(display, reg, val, SNB_MMIO_FLAGS);
> > +}
> > +
> > +#undef SNB_MMIO_FLAGS
> > +
> > +static const struct intel_mmio_funcs snb_mmio_funcs = {
> > +	.read = snb_mmio_read,
> > +	.write = snb_mmio_write,
> > +};
> > +
> >  #define LNL_MMIO_FLAGS __MMIO_WAKELOCK
> >  
> >  static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
> > @@ -245,12 +288,30 @@ static const struct intel_mmio_funcs lnl_mmio_funcs = {
> >  	.write = lnl_mmio_write,
> >  };
> >  
> > +static bool driver_is_i915(void)
> > +{
> > +#ifdef I915
> > +	return true;
> > +#else
> > +	return false;
> > +#endif
> > +}
> 
> Ugh. Can we just not add this, because it needs to go real soon now
> anyway? Or do you already have patches in your tree removing this after
> some juggle?

One could just kill it now, but that will bring the lock and
unclaimed register detection to xe. I didn't want to do such
a drastic change in this ones series.

> 
> > +
> >  void intel_de_init(struct intel_display *display)
> >  {
> >  	display->mmio.uncore = to_intel_uncore(display->drm);
> >  
> > -	if (DISPLAY_VER(display) >= 20)
> > -		display->mmio.funcs = &lnl_mmio_funcs;
> > -	else
> > -		display->mmio.funcs = &i9xx_mmio_funcs;
> > +	spin_lock_init(&display->mmio.lock);
> > +
> > +	if (driver_is_i915()) {
> > +		if (DISPLAY_VER(display) >= 6)
> > +			display->mmio.funcs = &snb_mmio_funcs;
> > +		else
> > +			display->mmio.funcs = &i9xx_mmio_funcs;
> > +	} else {
> > +		if (DISPLAY_VER(display) >= 20)
> > +			display->mmio.funcs = &lnl_mmio_funcs;
> > +		else
> > +			display->mmio.funcs = &i9xx_mmio_funcs;
> > +	}
> 
> If we temporarily need driver_is_i915() for the non-functional iterative
> approach, seems like a different arrangement of the if ladder would be
> benefitial for the eventual removal of driver_is_i915(), maybe something
> like:
> 
> 	if (DISPLAY_VER(display) >= 20)
> 		display->mmio.funcs = &lnl_mmio_funcs;
> 	else if (!driver_is_i915())
> 		display->mmio.funcs = &i9xx_mmio_funcs;
> 	else if (display->platform.valleyview || display->platform.cherryview)
> 		display->mmio.funcs = &vlv_mmio_funcs;
> 	else if (DISPLAY_VER(display) >= 7)
> 		display->mmio.funcs = &ivb_mmio_funcs;
> 	else if (DISPLAY_VER(display) >= 6)
> 		display->mmio.funcs = &snb_mmio_funcs;
> 	else
> 		display->mmio.funcs = &i9xx_mmio_funcs;
> 
> (This includes changes from later patches.)

Feels like that makes the driver difference really hard to see, so
a casual reading of the code may give one the wrong impression of
what is happening. But I'll not die on that hill, so can go with
the single if ladder if you prefer. It should be a fairly short lived
state of affairs anyway.

> 
> I guess I'd like to see the decisions here (and in the vblank code) be
> based on platforms rather than driver, even though there's some overlap.

The driver difference will go away eventually. That said, I need
to have a real look at the vblank code's use of the lock to figure
out what to about that part. Might be I just end up removing the lock
there.

> 
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> > index 3a48119f7890..aded2af8c92a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> > @@ -533,6 +533,15 @@ struct intel_display {
> >  	} modeset;
> >  
> >  	struct {
> > +		/*
> > +		 * Simultaneous accesses to the same cacheline of
> > +		 * registers may hang IVB/HSW systems. This lock
> > +		 * serializes all display register accesses done
> > +		 * using intel_de_{read,write}(), but not those
> > +		 * done using intel_de_{read,write}_fw().
> > +		 */
> > +		spinlock_t lock;
> > +
> 
> I guess the comment begs the question why are we doing the locking also
> on display < 20? Just because the lock is (ab)used for other purposes as
> well?

The reason is that i915 has always used the lock on SNB+, so
we simply have no empirical data to tell us whether the more
recent platforms might still suffer from the same issue that
was observed on IVB/HSW before the lock was introduced.

I did a quick test run with the old 'xonotic + old version of
intel_gpu_top' reproducer, and sure enough IVB/HSW hang within
a reasonable amount of time. I also left that running on SNB 
and BDW for most of the day without hitting the hang. So I guess
that might be an indication that the problem is indeed real
but limited to IVB/HSW. Unfortunately the hsd is long gone
so I can't actually check what conclusions they reached there.

So my plan is to start by playing it safe without major
changes to the locking behaviour. And then follow up with
(easily revertable) changes to remove the lock from platforms
that we suspect don't need it.

But I also still need to figure out if making the unclaimed
register detection lockless is feasible. Otherwise we'll
be stuck with the lock for all HSW+ regardless of any
hardware issues.

> 
> >  		struct intel_uncore *uncore;
> >  		const struct intel_mmio_funcs *funcs;
> >  	} mmio;
> > diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> > index 1d4753605675..fc9d1e14ec87 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> > @@ -281,10 +281,6 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
> >  }
> >  
> >  /*
> > - * The uncore version of the spin lock functions is used to decide
> > - * whether we need to lock the uncore lock or not.  This is only
> > - * needed in i915, not in Xe.
> > - *
> >   * This lock in i915 is needed because some old platforms (at least
> >   * IVB and possibly HSW as well), which are not supported in Xe, need
> >   * all register accesses to the same cacheline to be serialized,
> > @@ -292,17 +288,15 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
> >   */
> >  #ifdef I915
> >  static void intel_vblank_section_enter(struct intel_display *display)
> > -	__acquires(uncore->lock)
> > +	__acquires(display->mmio.lock)
> >  {
> > -	struct intel_uncore *uncore = to_intel_uncore(display->drm);
> > -	spin_lock(&uncore->lock);
> > +	spin_lock(&display->mmio.lock);
> >  }
> >  
> >  static void intel_vblank_section_exit(struct intel_display *display)
> > -	__releases(uncore->lock)
> > +	__releases(display->mmio.lock)
> >  {
> > -	struct intel_uncore *uncore = to_intel_uncore(display->drm);
> > -	spin_unlock(&uncore->lock);
> > +	spin_unlock(&display->mmio.lock);
> >  }
> >  #else
> >  static void intel_vblank_section_enter(struct intel_display *display)
> > @@ -550,7 +544,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
> >  	 * consistent state during fastset seamless refresh rate changes.
> >  	 *
> >  	 * vblank_time_lock takes care of all drm_vblank.c stuff, and
> > -	 * uncore.lock takes care of __intel_get_crtc_scanline() which
> > +	 * display->mmio.lock takes care of __intel_get_crtc_scanline() which
> >  	 * may get called elsewhere as well.
> >  	 *
> >  	 * TODO maybe just protect everything (including
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
