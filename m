Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC06C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D95D10E924;
	Tue, 25 Aug 2026 06:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OXCv52gI";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C077810E91E;
 Tue, 25 Aug 2026 06:35:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AF4A56011F;
 Tue, 25 Aug 2026 06:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3151B1F00A3A;
 Tue, 25 Aug 2026 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639741;
 bh=oP09JjzTGpWI5zKQzdF30MaSZ1zhBanqsiLSxj0dl6w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OXCv52gI8GYZnv/e0VsWiFlU/f+KGH5nolfqwFM0NtcOQ/hkbpcQqHCz4JT0UuW10
 1NRI2TNiy+7iIvkq+Xg0kW9uRcHo+yo4PMZwdnDr3uho7TB8+TSm4IlKkT+0plIP2Y
 eC+hDvAJ8euwJlLFKzwZeRMIiY4JEkBwRE8EHcpqw3o8DOcgdLrKr4Iku4qg7X3jwc
 HNXbOxu0XeAfD2jFYMHNZpPOx9E2kGfTUpZrrggnl2Yc5IF7k2V7RZh3W+DtFVrhsK
 Ju25SL84Q6553VJoP2zZo+Vbn3z5KFYp7Qq0eCF80QNQlyhHPeV9dRg2T93wKROd79
 wUU5RgSORV5Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/15] drm/i915/alpm: Introduce has_alpm to decouple
 from pr/psr2/lobf
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-14-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-14-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:35:40 +0000
Message-Id: <20260825063541.3151B1F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Source/sink protocol mismatch for PSR2 panels with AUX-less capabi=
lity.
- [High] State leakage of the `has_alpm` flag forces ALPM on unsupported PS=
R1 fallbacks.
- [High] Inconsistent ALPM wake line validation causes unsafe late atomic s=
tate downgrades.
--

--- Patch [13]: [PATCH v5 13/15] drm/i915/alpm: Introduce has_alpm to decou=
ple from pr/psr2/lobf ---
commit dd0c0bc3be20db88d8488b6083be9663dc32cc6d
Author: Animesh Manna <animesh.manna@intel.com>
Subject: drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf

For DP2.1, ALPM is optional and there can be scenario where panel replay
will be supported without ALPM. So decouple ALPM feature by has_alpm flag
from related display features.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index f3f6f40f96244..8c17da9883d6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c

[ ... ]

> @@ -575,8 +569,7 @@ static void lnl_alpm_configure(struct intel_dp *intel=
_dp,
>  	enum transcoder cpu_transcoder =3D crtc_state->cpu_transcoder;
>  	u32 alpm_ctl, alpm_ctl2, lttpr_count;
> =20
> -	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_=
state) &&
> -					  !crtc_state->has_lobf))
> +	if (DISPLAY_VER(display) < 20 || !crtc_state->has_alpm)
>  		return;
> =20
>  	mutex_lock(&intel_dp->alpm.lock);
> @@ -584,7 +577,7 @@ static void lnl_alpm_configure(struct intel_dp *intel=
_dp,
>  	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
>  	 * check panel support at this point.
>  	 */
> -	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
> +	if (intel_alpm_aux_less_wake_supported(intel_dp)) {
>  		alpm_ctl =3D ALPM_CTL_ALPM_ENABLE |
>  			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
>  			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS;

[Severity: High]
Does this create a protocol mismatch between the source and the sink?

By changing this to rely on intel_alpm_aux_less_wake_supported(), the source
is now programmed for AUX-less ALPM (ALPM_CTL_ALPM_AUX_LESS_ENABLE) for PSR2
panels that advertise DP_ALPM_AUX_LESS_CAP.

However, intel_alpm_enable_sink() still requires Panel Replay or LOBF to
enable AUX-less mode on the sink. Because neither is true for PSR2, the sink
will be expecting fast-wake ALPM, which conflicts with how the source is
now programmed here.

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index 40e3d70959965..8c6aa4e948894 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c

[ ... ]

> @@ -1729,11 +1731,17 @@ static bool _panel_replay_compute_config(struct i=
ntel_crtc_state *crtc_state,
>  	crtc_state->link_off_after_as_sdp_when_pr_active =3D compute_link_off_a=
fter_as_sdp_when_pr_active(connector);
>  	crtc_state->disable_as_sdp_when_pr_active =3D compute_disable_as_sdp_wh=
en_pr_active(connector);
> =20
> +	if (intel_alpm_is_possible(intel_dp))
> +		crtc_state->has_alpm =3D alpm_config_valid(intel_dp, crtc_state, true,=
 true, false);
> +
>  	if (!intel_dp_is_edp(intel_dp))
>  		return true;
> =20
>  	/* Remaining checks are for eDP only */
> =20
> +	if (!crtc_state->has_alpm)
> +		return false;
> +
>  	if (to_intel_crtc(crtc_state->uapi.crtc)->pipe !=3D PIPE_A &&
>  	    to_intel_crtc(crtc_state->uapi.crtc)->pipe !=3D PIPE_B)
>  		return false;

[Severity: High]
Can this leak the has_alpm state if the panel replay config is aborted?

If alpm_config_valid() succeeds, crtc_state->has_alpm is set to true.
However, if a subsequent check in _panel_replay_compute_config() returns
false (such as the PIPE_A/B check or a later HDCP check), has_alpm remains
set to true.

When the driver then falls back to computing PSR1, has_alpm stays true and
bypasses the previous protections that prevented ALPM from being enabled
on PSR1. This forces ALPM on for PSR1 fallbacks where it is not supported.

[ ... ]

> @@ -4547,15 +4542,17 @@ void intel_psr_compute_config_late(struct intel_d=
p *intel_dp,
>  	int vblank =3D intel_crtc_vblank_length(crtc_state);
>  	int wake_lines;
> =20
> -	if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state))
> -		wake_lines =3D crtc_state->alpm_state.aux_less_wake_lines;
> -	else if (intel_psr_needs_alpm(intel_dp, crtc_state))
> -		wake_lines =3D DISPLAY_VER(display) < 20 ?
> -			     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
> -						    crtc_state->alpm_state.fast_wake_lines) :
> -			     crtc_state->alpm_state.io_wake_lines;
> -	else
> +	if (crtc_state->has_alpm) {
> +		if (intel_alpm_aux_less_wake_supported(intel_dp))
> +			wake_lines =3D crtc_state->alpm_state.aux_less_wake_lines;
> +		else
> +			wake_lines =3D DISPLAY_VER(display) < 20 ?
> +				     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
> +							    crtc_state->alpm_state.fast_wake_lines) :
> +				     crtc_state->alpm_state.io_wake_lines;
> +	} else {
>  		wake_lines =3D 0;
> +	}
> =20
>  	/*
>  	 * Disable the PSR features if wake lines exceed the available vblank.

[Severity: High]
Does this late selection of aux_less_wake_lines conflict with the early
validation performed for PSR2?

During early validation, intel_psr2_config_valid() hardcodes the aux_less
parameter to false when calling alpm_config_valid(), so it validates
against the smaller io_wake_lines.

If intel_alpm_aux_less_wake_supported() evaluates to true here in late
compute, it will dynamically select the larger aux_less_wake_lines instead.=
=20
This mismatch can cause the subsequent _wake_lines_fit_into_vblank() check
to fail, triggering a late teardown of has_sel_update after watermarks and
DDB allocations have already been computed assuming PSR/SU was active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D13
