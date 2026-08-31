Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719A8C624C6
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 12:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27510E2A1;
	Mon, 31 Aug 2026 12:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ImsC9Uyv";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7110E210;
 Mon, 31 Aug 2026 12:57:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4974C60215;
 Mon, 31 Aug 2026 12:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66511F00A3D;
 Mon, 31 Aug 2026 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788181074;
 bh=PXdOYm/2OcRiqwHFut2St4B4Wpuvd88AkYp8fMpP15s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ImsC9UyvHXXCtwfQ6gwNcV6cTl8WaK+11vPASrmRaYh5i57wS0vw10fbMYFJhZou4
 pLu7xgVEwTKdrsOCEacJ18FxQ9+JfuVymtTavm6uM6wSTT4ICjJphMuNzxkbrF3RYf
 M1ehCPVuVvgzNcbGfGt8ZYkdZYx6aY1pyDxXbRBhIOe48yDSgCFtmEEFnLuWW02a4P
 cAzP9/bKUJduR6HrAMhDgzsDR+px9XFn+FQKFYxnXjKaXMBOm7hgxm3/lY4X2I3C+S
 aVf4o17ysILqe3iAxaZ36MojkcvMOcEEtStnqVih7dEtO+nYFigw2vwIcPkVNj2yCT
 vTlYyDPPXIA8g==
From: sashiko-bot@kernel.org
Subject: Re: [v3 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260831125914.1736501-3-uma.shankar@intel.com>
References: <20260831125914.1736501-1-uma.shankar@intel.com>
 <20260831125914.1736501-3-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:57:53 +0000
Message-Id: <20260831125753.D66511F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Divergent skip-frames logic breaks DC3co for PSR2 and LOBF due to =
missing usage of the new predicate in lnl_alpm_configure().

Pre-existing issues:
- [Critical] Lockless access to crtc->base.state for CRTCs outside the curr=
ent atomic transaction leads to potential Use-After-Free.
- [High] Global DC3co power state computation races with concurrent atomic =
commits, potentially enabling DC3co incorrectly when multiple pipes are act=
ive.
- [High] intel_display_power_dc3co_update() acquires a mutex within intel_a=
tomic_commit_tail(), which is designated as a forbidden atomic context by s=
ubsystem guidelines.
--

commit 32252d15cc26d3b3cd4283b9975d4988e8519de3
Author: Uma Shankar <uma.shankar@intel.com>
Subject: drm/i915/display: Force disable DC3co when AS SDP skip frames is e=
nabled

This commit disables DC3co when AS SDP skip frames are enabled for Panel
Replay, as DC3co suppresses the necessary periodic AS SDP transmission. It
introduces the intel_alpm_pr_as_sdp_skip_frames_enabled() predicate and uses
it in intel_display_power_dc3co_compute() to override the trigger state.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index d1f6bb82e35ef..5f635f14a5880 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -404,6 +404,29 @@ static u32 intel_pr_as_sdp_skip_frames(struct intel_=
dp *intel_dp)
>  		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
>  }
> =20
> +/*
> + * Whether periodic AS SDP transmission (AS SDP skip frames) will be pro=
grammed
> + * for this Panel Replay config. The skip counter needs the AS SDP to ke=
ep
> + * flowing during PR active, which is incompatible with DC3co, so this i=
s used
> + * to keep DC3co disabled while skip frames is enabled.
> + */
> +bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
> +					      const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +
> +	/*
> +	 * The AS SDP skip frames field only exists on Xe3LPD+. Periodic AS SDP
> +	 * drives the panel down to its minimum refresh rate on its own, so it =
is
> +	 * only used when VRR is not actively driving the refresh rate.
> +	 */
> +	if (DISPLAY_VER(display) < 35 || !intel_dp->as_sdp_supported ||
> +	    !crtc_state->has_panel_replay || crtc_state->vrr.enable)
> +		return false;
> +
> +	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
> +}
> +

[Severity: High]
Does the open-coded skip_frames logic in lnl_alpm_configure() cause a state
mismatch regression by missing the has_panel_replay check?

While the newly introduced predicate correctly checks
!crtc_state->has_panel_replay, lnl_alpm_configure() directly open-codes:

    if (DISPLAY_VER(display) >=3D 35 && !crtc_state->vrr.enable)
        skip_frames =3D intel_pr_as_sdp_skip_frames(intel_dp);

Since this is guarded only by intel_alpm_is_alpm_aux_less() (which can be
true for LOBF alone), wouldn't it program a non-zero skip_frames and disable
DC3co in hardware, while intel_display_power_dc3co_compute() incorrectly
assumes DC3co is allowed?

>  static void lnl_alpm_configure(struct intel_dp *intel_dp,
>  			       const struct intel_crtc_state *crtc_state)
>  {

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers=
/gpu/drm/i915/display/intel_display_power.c
> index ee2a2bc1332b7..2e534ddb73479 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -489,6 +490,14 @@ void intel_display_power_dc3co_compute(struct intel_=
atomic_state *state)
>  	if (crtc_state->has_sel_update)
>  		trigger |=3D DC3CO_TRIGGER_PSR2;
> =20
> +	/*
> +	 * Periodic AS SDP (skip frames) needs the AS SDP to keep flowing during
> +	 * PR active, which is incompatible with DC3co. Keep DC3co disabled whi=
le
> +	 * skip frames is enabled.
> +	 */
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
> +		trigger =3D DC3CO_TRIGGER_NONE;

[Severity: Critical]
This is a pre-existing issue, but does passing crtc_state here extend a
use-after-free regression?

Earlier in intel_display_power_dc3co_compute(), the code locklessly accesses
crtc->base.state for a CRTC that may not be part of the current atomic stat=
e:

    crtc =3D intel_crtc_for_pipe(display, pipe);
    crtc_state =3D to_intel_crtc_state(crtc->base.state);

If a concurrent atomic commit is modifying the single active CRTC,
crtc->base.state may be swapped and freed by the other thread. Now this
potentially freed state is passed into
intel_alpm_pr_as_sdp_skip_frames_enabled().

[Severity: High]
This isn't a bug introduced by this patch, but does the global DC3co power
state computation contain a race regression with concurrent atomic commits?

Earlier in this function, active_pipes is calculated locklessly:

    for_each_intel_crtc(display, crtc)
        active_pipes |=3D crtc->active ? BIT(crtc->pipe) : 0;

    active_pipes =3D intel_calc_active_pipes(state, active_pipes);

    if (hweight8(active_pipes) !=3D 1)
        goto done;

Could two concurrent commits (e.g., each disabling one of two active pipes)
both read crtc->active, miscalculate active_pipes as exactly 1, and
incorrectly proceed to enable DC3co even though 0 pipes will actually be
active?

> +
>  done:
>  	intel_display_power_dc3co_update(display, trigger);

[Severity: High]
This is a pre-existing issue, but does intel_display_power_dc3co_update()
contain a locking regression?

This code path is called from intel_atomic_commit_tail(), which is designat=
ed
as a forbidden atomic context by DRM subsystem guidelines. However,
intel_display_power_dc3co_update() calls mutex_lock(&dc3co->lock):

void intel_display_power_dc3co_update(struct intel_display *display, u32 tr=
igger)
{
    ...
    mutex_lock(&dc3co->lock);
    dc3co->trigger =3D trigger;
    dc3co->allowed =3D !!trigger;
    mutex_unlock(&dc3co->lock);
}

Is it safe to acquire a mutex here?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831125914.1736=
501-1-uma.shankar@intel.com?part=3D2
