Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7795CA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 14:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B18910F623;
	Wed,  7 Oct 2026 14:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JlTUZZtz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A8810F617;
 Wed,  7 Oct 2026 14:20:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6848C60218;
 Wed,  7 Oct 2026 14:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8B11F0089B;
 Wed,  7 Oct 2026 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791382850;
 bh=oXAubKzB8loYADPuCw/wBEBDtVoyUVP6rdpZzDh3Yr8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JlTUZZtzKKmZ3RAaXIULS0qL25wuTjpkBh2kiUZZXEytlpd2eMA8rHEoY/aSO82oC
 1UEBh+KWsKmb0vdZHeQJCjUmaB7WNUUqxLiMaGPMVPx0Qb35cS0cejVQrFhhKSV0cJ
 zOO8SkvJgOvtXIOHnW98ChLzSeZnk3L/uK0sqoyjKCdz0N78FDPg2YlNjDsJLs57Cf
 4kdq2LHF/FvOjsIY91eZFLcNtXyO0RtzAdOi3ZuV8YxarF9ljS518Vu+x6IABDB+ek
 SJaLNAIHxgPe9AHVrbyKJj1CxU/BvyWmnWfsNh178C1/dixIVcUlwQgbtHx+577Ecu
 hCa78TEwxEe3g==
Message-ID: <sashiko-outbox-163095@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
To: "Jake Steinman" <j@metarealtyinc.ca>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261006220500.3417572-1-j@metarealtyinc.ca>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 14:20:49 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/i915/psr: wakeref leak and double-put in intel_psr_notify_vbla=
nk_enable_disable()
- [Low] drm/i915: Use of undeclared function intel_alpm_pr_as_sdp_skip_fram=
es_enabled
--

commit 83416e4f5b6b0591037f900cd3b6bc4bc168af5c
Author: Jake Steinman <j@metarealtyinc.ca>

drm/i915/psr: Send the AS SDP in PR Active while vblank is enabled

Sinks that support async video timing in PR get the AS SDP suspended in
PR Active (disable_as_sdp_when_pr_active). The LG panel in the Dell XPS
16 DA16260 (sink OUI 00:22:b9, "Balsa2") then judders while frames are
updating, with the source flipping at a steady 8.33 ms. Leaving the AS
SDP on fixes it but blocks DC5/DC6.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8930

> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index f490beb66629e..f69df2147c9d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
[ ... ]
> @@ -2221,6 +2244,12 @@ static void intel_psr_enable_locked(struct intel_d=
p *intel_dp,
>  	intel_dp->psr.enabled =3D true;
>  	intel_dp->psr.pause_counter =3D 0;
> =20
> +	intel_dp->psr.pr_as_sdp_follow_vblank =3D crtc_state->has_panel_replay =
&&
> +		crtc_state->disable_as_sdp_when_pr_active &&
> +		intel_dp->as_sdp_supported && intel_dp_is_edp(intel_dp) &&
> +		!intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state);

[Severity: Low]
Is this function call missing a declaration? The function
intel_alpm_pr_as_sdp_skip_frames_enabled() is neither defined nor declared
in the tree at this commit.

It appears to depend on an out-of-tree series, which causes a compilation
failure due to an implicit declaration.

> +	intel_psr_pr_as_sdp_update(intel_dp);
> +
>  	/*
>  	 * Link_ok is sticky and set here on PSR enable. We can assume link
>  	 * training is complete as we never continue to PSR enable with
[ ... ]
> @@ -4144,7 +4174,11 @@ void intel_psr_notify_vblank_enable_disable(struct=
 intel_display *display,
>  				intel_dp->psr.vblank_wakeref =3D
>  					intel_display_power_get(display,
>  								POWER_DOMAIN_DC_OFF);
> -			else
> +
> +			intel_dp->psr.vblank_enabled =3D enable;
> +			intel_psr_pr_as_sdp_update(intel_dp);
> +
> +			if (!enable)
>  				intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
>  							intel_dp->psr.vblank_wakeref);
>  		}

[Severity: High]
Does this loop cause unbalanced power tracking and a wakeref leak?

for_each_intel_encoder_with_psr() iterates over both the primary DP encoder
and its MST stream encoders, executing multiple times for the same
intel_dp pointer.

When enable is true, intel_dp->psr.vblank_wakeref is assigned repeatedly,
leaking all but the last tracker and leaking POWER_DOMAIN_DC_OFF references.

When enable is false, the single saved wakeref is freed multiple times,
causing a double-free or an underflow of the power domain use count.

Additionally, CAN_PANEL_REPLAY() evaluates sink capabilities which can chan=
ge
dynamically across hotplugs. If the capability changes between the true and
false calls, does this break the symmetry of the wakeref lifecycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006220500.3417=
572-1-j@metarealtyinc.ca?part=3D1
