Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BFCC98302
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 14:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EE810F0D0;
	Wed, 23 Sep 2026 14:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gEehRBHT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7657A10F0D0;
 Wed, 23 Sep 2026 14:27:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FB3B407A0;
 Wed, 23 Sep 2026 14:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183E61F000FF;
 Wed, 23 Sep 2026 14:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790173641;
 bh=vga9v/QyLK4GbDSVHsHxoBkyma312ueia/NHZLlnbjY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gEehRBHTO6mZJ85H8z20CRRkBo4WgY1vdZWpxbqroP2X0eRBt4yvB9JLu4Dd7kt+k
 zKRNXAqzSSHJHJNbF2LD71QQ4MgE8l3AxIr59HHqqvfVu2hrbyxtDAeFSdKq5OSrC9
 +ACUJ7mIEkpH2aw6a3ejVe6PI9EgwRaZRqrthkuVJZAKEbiDnW6w/oV8WaNmihrQFz
 Tic6tjM/Wuj3gOe5rQcLYxA58qJBzVev/wyWHSKS2zJT/l+c5UpcHuTiJLz5tKF2BH
 PJhULiiRGe2hf/m0m9HDYut3jbWbgJvsCYJkD1M1wv5iAVLY4yYfvVFVf4egPZ7Y5/
 Iw71fUVQx6Qyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp: Don't promise AS SDPs in PR Active when
 they are disabled
To: "Jake Steinman" <j@metarealtyinc.ca>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260923041342.2146450-1-j@metarealtyinc.ca>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 14:27:20 +0000
Message-Id: <20260923142721.183E61F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/i915: build failure due to undefined intel_alpm_pr_as_sdp_skip_=
frames_enabled()
--

commit b6467ba689abbe92a2f289d4eb766436f8714a78
Author: Jake Steinman <j@metarealtyinc.ca>

drm/i915/dp: Don't promise AS SDPs in PR Active when they are disabled

This commit conditionally disables DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE
during link training if AS SDP skip frames are not in use. It also attempts
to clarify documentation about when PR_ALPM_CTL[AS SDP Transmission in
Active Disable] is programmed.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0cd5e6b5034cf..217795e155607 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3154,11 +3154,12 @@ static void intel_dp_compute_as_sdp(struct intel_=
dp *intel_dp,
> =20
>  	/*
>  	 * For Panel Replay with Async Video Timing support, the source can
> -	 * disable sending the AS SDP during PR Active state. In that case,
> -	 * the sink needs the coasting vtotal value to maintain the refresh
> -	 * rate. The HW only samples this on PR_ALPM_CTL[AS SDP Transmission
> -	 * in Active Disable], which we never program, so providing the value
> -	 * unconditionally when the sink advertises the capability is safe.
> +	 * stop sending the AS SDP during PR Active (PR_ALPM_CTL[AS SDP
> +	 * Transmission in Active Disable], see intel_alpm_configure_pr_as_sdp(=
))

[Severity: Low]
Does the referenced intel_alpm_configure_pr_as_sdp() function exist in the
codebase? A tree-wide search doesn't show it being defined here or in any
subsequent patches. Was this perhaps renamed to lnl_alpm_configure(), or
is there a missing patch dependency?

> +	 * and the sink then keeps the refresh rate using the coasting vtotal of
> +	 * the last AS SDP it received. The coasting vtotal bytes are fully
> +	 * under driver control, so fill them in whenever the sink advertises
> +	 * the capability.
>  	 *
>  	 * #TODO:
>  	 * If we ever advertise support for coasting at other refresh targets,

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index cb92cff906146..5729ecaba1499 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -1122,7 +1123,17 @@ static bool
>  intel_dp_pr_with_as_sdp_enabled(struct intel_dp *intel_dp,
>  				const struct intel_crtc_state *crtc_state)
>  {
> +	/*
> +	 * DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE tells the sink that the AS SDP
> +	 * keeps coming during PR Active. With disable_as_sdp_when_pr_active,
> +	 * intel_alpm_configure_pr_as_sdp() sets PR_ALPM_CTL[AS SDP Transmission
> +	 * in Active Disable] and the source stops sending it for as long as PR
> +	 * is active, unless AS SDP skip frames is used. The sink then keeps
> +	 * the refresh rate using the coasting vtotal of the last AS SDP.
> +	 */
>  	return intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
> +		(!crtc_state->disable_as_sdp_when_pr_active ||
> +		 intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state)) &&

[Severity: Low]
Is intel_alpm_pr_as_sdp_skip_frames_enabled() defined anywhere in this tree?
This causes a build failure due to an implicit declaration and undefined
reference.

Additionally, the commit message states that when AS SDP skip frames are in
use, it clears the PR_ALPM_CTL bit and keeps a periodic AS SDP going.
However, looking at lnl_alpm_configure() in intel_alpm.c, the bit seems to
be programmed without a skip frames check:

	if (crtc_state->disable_as_sdp_when_pr_active)
		pr_alpm_ctl |=3D PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;

Are we missing the patch that introduces both these missing functions and t=
he
updated PR_ALPM_CTL programming logic?

>  		(crtc_state->infoframes.enable &
>  		 intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC));
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923041342.2146=
450-1-j@metarealtyinc.ca?part=3D1
