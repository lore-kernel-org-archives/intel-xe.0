Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F9D107639C
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 17:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B051710E7FD;
	Wed,  1 Apr 2026 17:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAVg40yv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816BF10E7FD;
 Wed,  1 Apr 2026 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775065478; x=1806601478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GJI6tCdbx0pwocZi/qDNJXm9moH/vgYQAD63cEf8t7Q=;
 b=CAVg40yvLFGiovW8yYFZ+JDQrPSMd7OQqAkX4wPUKuRHkGowvkmoSTJS
 YcR2wBTGIZ93pjmT+OUAcWkHmYAX5Ct/Lb1sp9SN5b0STd31FPhq76i9t
 q2iVXxGtRONR0B1veDJNBHVxSN8TWflxSq4gKJ9Pu2SSiRP7s12l5u4NZ
 RZqdcVk34y3ctBpnwx7ApCvpszPvs0EW3tA6a0zm7UhxLO5sqNjecbz7Z
 hCoIpB9kYmY7EFNw1Y+7jGxk+LsY/I+zMHe1ElJP4KFTl5AunT/tEFqts
 TaVInh3f86LBvNwAERp+CAjqy7aPQYyoFVJ1LaulLI3ZDwQw0aUR9u0nf A==;
X-CSE-ConnectionGUID: dSZfZ1RlRzexNPlJlucWog==
X-CSE-MsgGUID: 1695LS82QeuIbnSZOMPg0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75998873"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75998873"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:44:38 -0700
X-CSE-ConnectionGUID: T2/P+sK6Qki27i6eXWyiHA==
X-CSE-MsgGUID: DWGsnAviSZC27g9ErK7Hfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228351033"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.199])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:44:35 -0700
Date: Wed, 1 Apr 2026 20:44:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Juasheem Sultan <jdsultan@google.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <navaremanasi@google.com>,
 Drew Davenport <ddavenport@google.com>,
 Sean Paul <seanpaul@google.com>, Samuel Jacob <samjaco@google.com>,
 Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v4 2/2] drm/i915/display: Sync state to BIOS for seamless
 handoff
Message-ID: <ac1ZgLOwVm6YrDsd@intel.com>
References: <20260317220908.130968-1-jdsultan@google.com>
 <20260317220908.130968-3-jdsultan@google.com>
 <08c99b0d-6adb-423b-9c4b-2e8add00f5d3@lankhorst.se>
 <CAH6Pru5Me2pY31JF2GP61k3gy8XDaLfmH7U6jpAwXoYvGEZBwA@mail.gmail.com>
 <acZX6htfhw4v0G8c@intel.com>
 <6f14905d-74bd-4722-ba67-08361e779c17@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f14905d-74bd-4722-ba67-08361e779c17@lankhorst.se>
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

On Wed, Apr 01, 2026 at 06:19:00PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2026-03-27 kl. 11:11, skrev Ville Syrjälä:
> > On Thu, Mar 26, 2026 at 04:10:13PM -0700, Juasheem Sultan wrote:
> >> Hi,
> >>
> >> Thanks for looking at this.
> >>
> >> You're saying instead of manually adopting the state that I should focus on
> >> modifying the comparisons that we do to determine if we can perform a
> >> fastset?
> > 
> > We don't want any fuzzy fastset hacks anywhere. I intentionally killed
> > all that stuff because it was making it impossible to trust that the
> > software state actually represents what the hardware is doing.
> > 
> > Someone needs to figure out what exactly is the difference between
> > the states between the GOP and the driver, and then figure out where
> > that difference is coming from.
> 
> In some cases the firmware may have different considerations for setting a mode,
> not necesssarily worse than what the display driver is using, just different.
> 
> In this case userspace requests a mode for example 1920x1080, but it doesn't
> particularly care what pll's are used or anything nor has it a way to specify
> it at all.
> 
> Until there is a major change like disabling the screen, what are the downsides
> taking over the inherited mode from the firmware, and postponing changing the
> display mode?

Because all the hacks we had for this of the form:
1. fully compute a new state
2. randomly overwrite bits and pieces of that with the 
   old state
3. somehow hope that whatever got overwritten isn't incompatible
   with all the stuff that wasn't overwritten

It was a completely unmaintainable mess that could result in all
kinds of weird bugs.

And to be clear, we *do* take the state the firmware was using, and
ideally we don't recompute it at all. It's only because we lack certain
readout support/etc that we sometimes punt to the full computation and
therefore we may end up with a fastset mismatch (see the
.initial_fastset_check() stuff). The correct way to solve that is to
add the missing readout support, not add more hacks.

> 
> Having a flicker-free boot is a desired feature to have, and something intel
> handles a lot better than the other drivers.
> 
> Kind regards,
> ~Maarten Lankhorst
> 
> >>
> >> -Juasheem
> >>
> >> On Wed, Mar 18, 2026 at 5:00 AM Maarten Lankhorst <dev@lankhorst.se> wrote:
> >>
> >>> Hey,
> >>>
> >>> Den 2026-03-17 kl. 23:09, skrev Juasheem Sultan:
> >>>> Align DP timings and C10 PLL state with BIOS values if within a 0.5%
> >>>> clock threshold. This prevents minor mismatches from triggering a full
> >>>> modeset during the first atomic commit, ensuring a flicker-free handoff.
> >>>>
> >>>> Signed-off-by: Juasheem Sultan <jdsultan@google.com>
> >>>> ---
> >>>>  drivers/gpu/drm/i915/display/intel_display.c | 67 ++++++++++++++++++++
> >>>>  1 file changed, 67 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> >>> b/drivers/gpu/drm/i915/display/intel_display.c
> >>>> index c4246481fc2f..22e5e931f134 100644
> >>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >>>> @@ -6397,6 +6397,71 @@ static int
> >>> intel_atomic_check_config_and_link(struct intel_atomic_state *state)
> >>>>
> >>>>       return ret;
> >>>>  }
> >>>> +
> >>>> +// Helper function to sanitize pll state
> >>>> +static void intel_sanitize_pll_state(struct intel_crtc_state
> >>> *old_crtc_state,
> >>>> +             struct intel_crtc_state *new_crtc_state)
> >>>> +{
> >>>> +     int j;
> >>>> +
> >>>> +     for (j = 4; j < 9; j++) {
> >>>> +             if (new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] !=
> >>>> +
> >>>  old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j]) {
> >>>> +                     new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] =
> >>>> +
> >>>  old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j];
> >>>> +             }
> >>>> +     }
> >>>> +}
> >>>> +
> >>>> +/*
> >>>> + * intel_dp_sanitize_seamless_boot - Snap driver state to BIOS state
> >>> for seamless handoff.
> >>>> + * @state: the atomic state to sanitize
> >>>> + *
> >>>> + * This function compares the driver's calculated new_state with the
> >>> inherited BIOS state
> >>>> + * (old_state). If they are within a small threshold (e.g., 0.5% for
> >>> clock), it "snaps"
> >>>> + * the new_state to match the BIOS state exactly. This prevents minor
> >>> state mismatches
> >>>> + * that would otherwise force a full modeset (and a screen flicker)
> >>> during the initial
> >>>> + * kernel handoff.
> >>>> + */
> >>>> +static void intel_dp_sanitize_seamless_boot(struct intel_atomic_state
> >>> *state)
> >>>> +{
> >>>> +     struct intel_display *display = to_intel_display(state);
> >>>> +     struct intel_crtc_state *new_crtc_state, *old_crtc_state;
> >>>> +     struct intel_crtc *crtc;
> >>>> +     struct intel_encoder *encoder;
> >>>> +     int i;
> >>>> +
> >>>> +     for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> >>> new_crtc_state, i) {
> >>>> +             /*
> >>>> +              * We must check old_crtc_state->inherited because
> >>> new_crtc_state->inherited
> >>>> +              * is cleared at the start of intel_atomic_check for
> >>> userspace commits.
> >>>> +              */
> >>>> +             if (!old_crtc_state->inherited ||
> >>> !new_crtc_state->hw.active)
> >>>> +                     continue;
> >>>> +
> >>>> +             if (intel_crtc_has_dp_encoder(new_crtc_state)) {
> >>>> +                     int old_clock =
> >>> old_crtc_state->hw.adjusted_mode.crtc_clock;
> >>>> +                     int new_clock =
> >>> new_crtc_state->hw.adjusted_mode.crtc_clock;
> >>>> +                     int threshold = old_clock / 200; /* 0.5% */
> >>>> +
> >>>> +                     if (abs(new_clock - old_clock) <= threshold) {
> >>>> +                             new_crtc_state->hw.pipe_mode.crtc_clock =
> >>> old_clock;
> >>>> +
> >>>  new_crtc_state->hw.adjusted_mode.crtc_clock = old_clock;
> >>>> +                             new_crtc_state->pixel_rate =
> >>> old_crtc_state->pixel_rate;
> >>>> +                             new_crtc_state->dp_m_n =
> >>> old_crtc_state->dp_m_n;
> >>>> +                     }
> >>>> +             }
> >>>> +
> >>>> +             for_each_intel_encoder_mask(display->drm, encoder,
> >>>> +                             new_crtc_state->uapi.encoder_mask) {
> >>>> +                     if (intel_encoder_is_c10phy(encoder)) {
> >>>> +                             if
> >>> (!new_crtc_state->dpll_hw_state.cx0pll.ssc_enabled)
> >>>> +
> >>>  intel_sanitize_pll_state(old_crtc_state, new_crtc_state);
> >>>> +                     }
> >>>> +             }
> >>>> +     }
> >>>> +}
> >>>> +
> >>>>  /**
> >>>>   * intel_atomic_check - validate state object
> >>>>   * @dev: drm device
> >>>> @@ -6447,6 +6512,8 @@ int intel_atomic_check(struct drm_device *dev,
> >>>>       if (ret)
> >>>>               goto fail;
> >>>>
> >>>> +     intel_dp_sanitize_seamless_boot(state);
> >>>> +
> >>>>       for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> >>>>               if (!intel_crtc_needs_modeset(new_crtc_state))
> >>>>                       continue;
> >>>
> >>> This might fix boot state, but in a way that complicates the code
> >>> considerably.
> >>>
> >>> Have you considered updating intel_pipe_config_compare instead?
> >>>
> >>> Kind regards,
> >>> ~Maarten Lankhorst
> >>>
> > 

-- 
Ville Syrjälä
Intel
