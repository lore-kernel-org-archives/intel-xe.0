Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CD5CF07C7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 08:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5C10E2BF;
	Thu, 10 Oct 2024 08:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Imtc1FJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FD310E2BF
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728549618; x=1760085618;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3lr3zeCLiTupunxU4LQIGbc5MNMVbRCvMrcrXl3fpvo=;
 b=Imtc1FJCY++2sZFu81ng2skUUln/9Z1PmfTR6GJIUl5S3MbqOxpBTrum
 QfJuGzJccmOf0osLRB4byaglTouEry4BC9kMJ13IOe/gB/uTtZSvFkgqC
 McbA3Ec0RQQTwqeqL7vCgauRKOlo9Wem0XSHuK+Kv3ZfvXtmSPri6JzSe
 PcVwr52wdyv5JlbBY6uZzDRwm9GYanNN0BGX40zF+95PvziambQuRndpw
 Bg5yX/pPQrJSTl0eMK925kuF6ObfTLxhfDw0TMPrj3qPsC4oA+RIrrLi6
 PVMVdiwf1Szwu3e2+Ndu6jDXICqvCH+l4Kvg4X/8TOEGskRDDSsSoyT4L g==;
X-CSE-ConnectionGUID: W/yl98KFSS2ry9FQhg3lOA==
X-CSE-MsgGUID: yR/TzQojTY+5NKezMq6+pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27338350"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27338350"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:40:18 -0700
X-CSE-ConnectionGUID: kEH+eIU8R+Gk4xqZ33HZXA==
X-CSE-MsgGUID: vRcC9HlFQIGn6fOLluxM8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="99848960"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.131])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:40:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: "Shankar, Uma" <uma.shankar@intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>
Subject: RE: [PATCH] drm/i915/psr: Implement WA to help reach PC10
In-Reply-To: <SN7PR11MB675019D7D0344FCD40446332E3782@SN7PR11MB6750.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241003145337.1673715-2-suraj.kandpal@intel.com>
 <20241006164934.1689930-2-suraj.kandpal@intel.com>
 <87o73t8hdg.fsf@intel.com>
 <SN7PR11MB675019D7D0344FCD40446332E3782@SN7PR11MB6750.namprd11.prod.outlook.com>
Date: Thu, 10 Oct 2024 11:40:13 +0300
Message-ID: <87v7y073ma.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 10 Oct 2024, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Wednesday, October 9, 2024 8:16 PM
>> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Shankar, Uma <uma.shankar@intel.com>; Hogander, Jouni
>> <jouni.hogander@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
>> Subject: Re: [PATCH] drm/i915/psr: Implement WA to help reach PC10
>> 
>> On Sun, 06 Oct 2024, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
>> > To reach PC10 when PKG_C_LATENCY is configure we must do the
>> following
>> > things
>> > 1) Enter PSR1 only when delayed_vblank < 6 lines and DC5 can be
>> > entered
>> > 2) Allow PSR2 deep sleep when DC5 can be entered
>> > 3) DC5 can be entered when all transocoder have either PSR1, PSR2 or
>> > eDP 1.5 PR ALPM enabled and VBI is disabled and flips and pushes are
>> > not happening.
>> >
>> > --v2
>> > -Add debug prints
>> >
>> > WA: 22019444797
>> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_ddi.c      |   3 +
>> >  .../drm/i915/display/intel_display_types.h    |   3 +
>> >  drivers/gpu/drm/i915/display/intel_psr.c      | 117 +++++++++++++++++-
>> >  drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
>> >  4 files changed, 124 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
>> > b/drivers/gpu/drm/i915/display/intel_ddi.c
>> > index fe1ded6707f9..cbd71c136c8d 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> > @@ -4368,6 +4368,9 @@ static int intel_ddi_compute_config_late(struct
>> intel_encoder *encoder,
>> >  			port_sync_transcoders & ~BIT(crtc_state-
>> >cpu_transcoder);
>> >  	}
>> >
>> > +	if (intel_encoder_is_dp(encoder))
>> > +		intel_psr_compute_config_late(encoder, crtc_state);
>> > +
>> >  	return 0;
>> >  }
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> > b/drivers/gpu/drm/i915/display/intel_display_types.h
>> > index 17fc21f6ae36..7fb3eeb0e0f2 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> > @@ -1576,6 +1576,9 @@ struct intel_psr {
>> >  #define I915_PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
>> >
>> >  	u32 debug;
>> > +	bool is_dpkgc_configured;
>> > +	bool is_dc5_entry_possible;
>> > +	bool is_wa_delayed_vblank_limit;
>> >  	bool sink_support;
>> >  	bool source_support;
>> >  	bool enabled;
>> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
>> > b/drivers/gpu/drm/i915/display/intel_psr.c
>> > index 8e9f068b9b2b..9b77045df228 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
>> > @@ -26,6 +26,7 @@
>> >  #include <drm/drm_atomic_helper.h>
>> >  #include <drm/drm_damage_helper.h>
>> >  #include <drm/drm_debugfs.h>
>> > +#include <drm/drm_vblank.h>
>> >
>> >  #include "i915_drv.h"
>> >  #include "i915_reg.h"
>> > @@ -896,6 +897,82 @@ static u8 psr_compute_idle_frames(struct
>> intel_dp *intel_dp)
>> >  	return idle_frames;
>> >  }
>> >
>> > +static bool
>> > +intel_psr_check_wa_delayed_vblank(const struct drm_display_mode
>> > +*adjusted_mode) {
>> > +	return (adjusted_mode->crtc_vblank_start -
>> > +adjusted_mode->crtc_vdisplay) >= 6; }
>> > +
>> > +/*
>> > + * PKG_C_LATENCY is configured only when DISPLAY_VER >= 20 and
>> > + * VRR is not enabled
>> > + */
>> > +static bool intel_psr_is_dpkgc_configured(struct intel_display *display,
>> > +					  struct intel_crtc_state *crtc_state) {
>> > +	if (DISPLAY_VER(display) < 20 || crtc_state->vrr.enable)
>> > +		return false;
>> > +
>> > +	return true;
>> > +}
>> > +
>> > +static bool wa_22019444797_psr1_check(const struct intel_crtc_state
>> *crtc_state,
>> > +				      struct intel_psr *psr)
>> > +{
>> > +	struct intel_display *display = to_intel_display(crtc_state);
>> > +
>> > +	if (DISPLAY_VER(display) == 20 && psr->is_dpkgc_configured &&
>> > +	    (psr->is_wa_delayed_vblank_limit || !psr->is_dc5_entry_possible)
>> &&
>> > +	   !crtc_state->has_sel_update && !crtc_state->has_panel_replay) {
>> > +		drm_dbg_kms(display->drm,
>> > +			    "Wa 22019444797 requirement met PSR1
>> disabled\n");
>> > +		return true;
>> > +	} else {
>> > +		return false;
>> > +	}
>> > +}
>> > +
>> > +/*
>> > + * DC5 entry is only possible if vblank interrupt is disabled
>> > + * and either psr1, psr2, edp 1.5 pr alpm is enabled on all
>> > + * enabled encoders.
>> > + */
>> > +static bool
>> > +intel_psr_is_dc5_entry_possible(struct intel_display *display,
>> > +				struct intel_crtc_state *crtc_state) {
>> > +	struct intel_crtc *intel_crtc;
>> > +
>> > +	if ((display->power.domains.target_dc_state &
>> > +	     DC_STATE_EN_UPTO_DC5_DC6_MASK) == 0)
>> > +		return false;
>> > +
>> > +	if (!crtc_state->has_psr && !crtc_state->has_sel_update &&
>> > +	    !crtc_state->has_panel_replay)
>> > +		return false;
>> > +
>> > +	for_each_intel_crtc(display->drm, intel_crtc) {
>> > +		struct drm_crtc *crtc = &intel_crtc->base;
>> > +		struct drm_vblank_crtc *vblank;
>> > +		struct intel_encoder *encoder;
>> > +
>> > +		if (!intel_crtc->active)
>> > +			continue;
>> > +
>> > +		vblank = drm_crtc_vblank_crtc(crtc);
>> > +
>> > +		if (vblank->enabled)
>> > +			return false;
>> > +
>> > +		for_each_encoder_on_crtc(display->drm, crtc, encoder)
>> > +			if (encoder->type != INTEL_OUTPUT_EDP ||
>> > +			    !CAN_PSR(enc_to_intel_dp(encoder)))
>> > +				return false;
>> > +	}
>> > +
>> > +	return true;
>> > +}
>> > +
>> >  static void hsw_activate_psr1(struct intel_dp *intel_dp)  {
>> >  	struct intel_display *display = to_intel_display(intel_dp); @@
>> > -1008,7 +1085,18 @@ static void hsw_activate_psr2(struct intel_dp
>> *intel_dp)
>> >  	u32 val = EDP_PSR2_ENABLE;
>> >  	u32 psr_val = 0;
>> >
>> > -	val |= EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
>> > +	/*
>> > +	 * Wa_22019444797
>> > +	 * TODO: Disable idle frames when vblank gets enabled while
>> > +	 * PSR2 is enabled
>> > +	 */
>> > +	if (DISPLAY_VER(dev_priv) != 20 ||
>> > +	    !intel_dp->psr.is_dpkgc_configured ||
>> > +	    intel_dp->psr.is_dc5_entry_possible)
>> > +		val |=
>> EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
>> > +	else
>> > +		drm_dbg_kms(display->drm,
>> > +			    "Wa 22019444797 requirement met PSR2 deep
>> sleep disabled\n");
>> >
>> >  	if (DISPLAY_VER(display) < 14 && !IS_ALDERLAKE_P(dev_priv))
>> >  		val |= EDP_SU_TRACK_ENABLE;
>> > @@ -1686,6 +1774,24 @@ void intel_psr_compute_config(struct intel_dp
>> *intel_dp,
>> >  	crtc_state->has_sel_update = intel_sel_update_config_valid(intel_dp,
>> > crtc_state);  }
>> >
>> > +void intel_psr_compute_config_late(struct intel_encoder *intel_encoder,
>> > +				   struct intel_crtc_state *crtc_state) {
>> > +	struct intel_display *display = to_intel_display(intel_encoder);
>> > +	struct intel_dp *dp = enc_to_intel_dp(intel_encoder);
>> > +
>> > +	if (DISPLAY_VER(display) == 20) {
>> > +		mutex_lock(&dp->psr.lock);
>> > +		dp->psr.is_dpkgc_configured =
>> > +			intel_psr_is_dpkgc_configured(display, crtc_state);
>> > +		dp->psr.is_dc5_entry_possible =
>> > +			intel_psr_is_dc5_entry_possible(display, crtc_state);
>> > +		dp->psr.is_wa_delayed_vblank_limit =
>> > +			intel_psr_check_wa_delayed_vblank(&crtc_state-
>> >hw.adjusted_mode);
>> 
>> Compute config should only change the crtc state.
>
> Hi Jani,
> I see your point the reason for having this here is because as Jouni suggested that we get the crtc_state completely filled out
> Only after compute config so calling all these functions there may end up giving us misleading results. That's why we ended up using
> Compute config late path to get these variables filled up. Also trying to fill these up in pre/post plane update gave the wrong
> Dc5_entry_possible result since at that point vblank gets enabled.
> @Hogander, Jouni what do you think?

Two ways this could go wrong:

- The atomic check (i.e. our compute config path) goes wrong later, and
  the state is discarded, but the changes to intel_dp remain.

- It's a DRM_MODE_ATOMIC_TEST_ONLY commit, which is only supposed to
  check if the configuration is possible, not to modify anything, but
  the changes to intel_dp remain.

In both cases, the mode hasn't changed, but you've changed the way PSR
behaves with the existing crtc state.

You can only modify the hardware or (for lack of a better word) the more
"permanent" software state in the actual atomic commit.

BR,
Jani.

>
> Regards,
> Suraj Kandpal
>
>> 
>> BR,
>> Jani.
>> 
>> > +		mutex_unlock(&dp->psr.lock);
>> > +	}
>> > +}
>> > +
>> >  void intel_psr_get_config(struct intel_encoder *encoder,
>> >  			  struct intel_crtc_state *pipe_config)  { @@ -2742,6
>> +2848,7 @@
>> > void intel_psr_pre_plane_update(struct intel_atomic_state *state,
>> >  		 * - Changing between PSR versions
>> >  		 * - Region Early Transport changing
>> >  		 * - Display WA #1136: skl, bxt
>> > +		 * - Display WA_22019444797
>> >  		 */
>> >  		needs_to_disable |=
>> intel_crtc_needs_modeset(new_crtc_state);
>> >  		needs_to_disable |= !new_crtc_state->has_psr; @@ -2751,6
>> +2858,8 @@
>> > void intel_psr_pre_plane_update(struct intel_atomic_state *state,
>> >  			psr->su_region_et_enabled;
>> >  		needs_to_disable |= DISPLAY_VER(i915) < 11 &&
>> >  			new_crtc_state->wm_level_disabled;
>> > +		/* TODO: Disable PSR1 when vblank gets enabled while PSR1
>> is enabled */
>> > +		needs_to_disable |=
>> wa_22019444797_psr1_check(new_crtc_state, psr);
>> >
>> >  		if (psr->enabled && needs_to_disable)
>> >  			intel_psr_disable_locked(intel_dp);
>> > @@ -2791,6 +2900,12 @@ void intel_psr_post_plane_update(struct
>> intel_atomic_state *state,
>> >  		keep_disabled |= DISPLAY_VER(display) < 11 &&
>> >  			crtc_state->wm_level_disabled;
>> >
>> > +		/*
>> > +		 * Wa_22019444797
>> > +		 * TODO: Disable PSR1 when vblank gets enabled while PSR1
>> is enabled
>> > +		 */
>> > +		keep_disabled |= wa_22019444797_psr1_check(crtc_state,
>> psr);
>> > +
>> >  		if (!psr->enabled && !keep_disabled)
>> >  			intel_psr_enable_locked(intel_dp, crtc_state);
>> >  		else if (psr->enabled && !crtc_state->wm_level_disabled) diff
>> --git
>> > a/drivers/gpu/drm/i915/display/intel_psr.h
>> > b/drivers/gpu/drm/i915/display/intel_psr.h
>> > index 5f26f61f82aa..e0fa04952393 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_psr.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_psr.h
>> > @@ -47,6 +47,8 @@ void intel_psr_init(struct intel_dp *intel_dp);
>> > void intel_psr_compute_config(struct intel_dp *intel_dp,
>> >  			      struct intel_crtc_state *crtc_state,
>> >  			      struct drm_connector_state *conn_state);
>> > +void intel_psr_compute_config_late(struct intel_encoder *intel_encoder,
>> > +				   struct intel_crtc_state *crtc_state);
>> >  void intel_psr_get_config(struct intel_encoder *encoder,
>> >  			  struct intel_crtc_state *pipe_config);  void
>> > intel_psr_irq_handler(struct intel_dp *intel_dp, u32 psr_iir);
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
