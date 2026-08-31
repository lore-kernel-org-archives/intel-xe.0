Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E5BC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 12:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD83010E2A1;
	Mon, 31 Aug 2026 12:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tn8cYMu8";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DD010E279;
 Mon, 31 Aug 2026 12:53:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9376F4371B;
 Mon, 31 Aug 2026 12:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3EA1F000E9;
 Mon, 31 Aug 2026 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788180827;
 bh=YG2bPs5WOqNnriZlfM4oPULjYlfDvUhkV9/Z67VGvz4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Tn8cYMu8tZz91YpNnfuEkBUiUasW1yQkoIRhDNhvCiGDeL8txoTQnDbFxRE8luKu2
 qohhsAJpL0IyuTGPa796gP7uljfq4eR+b+P2yCnG2e16OVQFnf/LoWeMzs4SIS6xg2
 Vav3DnxjUvemboc99yiFxqKkmK8V00aVRVn/rgK0c+h+d95VOOfZANpfxhKsu0IVXc
 CtFY7oN0lQaSEdOt1mew4o/omVb3fiZ/Zj5nmqkXwwobdiNbT4zQixNPJ46nhvsewN
 7dByLSP0P4whqLR7zxY4Nt55GqHz91NJJlCZXLT9rR3QatUXJ2u8k7pzp+gnHSSN8+
 +dRKMZ/Bj1JPA==
From: sashiko-bot@kernel.org
Subject: Re: [v3 3/4] drm/i915/display: Reprogram AS SDP skip frames on
 seamless VRR transitions
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260831125914.1736501-4-uma.shankar@intel.com>
References: <20260831125914.1736501-1-uma.shankar@intel.com>
 <20260831125914.1736501-4-uma.shankar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:53:46 +0000
Message-Id: <20260831125347.3F3EA1F000E9@smtp.kernel.org>
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
- [High] Sleeping function mutex_lock() is called from atomic context durin=
g seamless VRR enable.
--

commit 130854c15003f92b491f6090e85bf6bc4afe74ed
Author: Uma Shankar <uma.shankar@intel.com>

drm/i915/display: Reprogram AS SDP skip frames on seamless VRR transitions

This commit factors out AS SDP skip-frame programming and exposes
intel_alpm_pr_as_sdp_update() to recompute fields for the current VRR
state. It calls this function from seamless VRR enable and disable sites
so the skip counter matches whether VRR is actively driving the refresh rat=
e.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 5f635f14a5880..03d5bf5c526f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> [ ... ]
> +void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_sta=
te)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	struct intel_encoder *encoder;
> +
> +	/* AS SDP skip frames field only exists on Xe3LPD+ */
> +	if (DISPLAY_VER(display) < 35)
> +		return;
> +
> +	for_each_intel_encoder_mask(display->drm, encoder,
> +				    crtc_state->uapi.encoder_mask) {
> +		struct intel_dp *intel_dp;
> +
> +		if (!intel_encoder_is_dp(encoder))
> +			continue;
> +
> +		intel_dp =3D enc_to_intel_dp(encoder);
> +
> +		if (!intel_dp->as_sdp_supported ||
> +		    !intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
> +			continue;
> +
> +		mutex_lock(&intel_dp->alpm.lock);
                ^^^^^^^^^^

[Severity: High]
Is it safe to acquire a mutex here? This function is called from
commit_pipe_post_planes() and intel_pre_plane_update() during seamless VRR
transitions.

Since these callers execute within the vblank evasion critical section,
local interrupts are disabled and we are in an atomic context:

intel_update_crtc() {
        intel_pipe_update_start(state, crtc); /* Disables local interrupts =
*/
        ...
        commit_pipe_post_planes(state, crtc);
        ...
}

Calling a sleeping lock like mutex_lock() from this atomic context will
trigger a scheduling while atomic oops and can lead to a hard system
deadlock when dynamically toggling VRR on a supported display.

> +		intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
> +		mutex_unlock(&intel_dp->alpm.lock);
> +	}
> +}
> [ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 9dfd095f325f7..a6b776da14b3a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> [ ... ]
> @@ -6796,8 +6804,17 @@ static void commit_pipe_post_planes(struct intel_a=
tomic_state *state,
>  	    HAS_DOUBLE_BUFFERED_LUT(display))
>  		intel_color_load_luts(new_crtc_state);
> =20
> -	if (intel_crtc_vrr_enabling(state, crtc))
> +	if (intel_crtc_vrr_enabling(state, crtc)) {
>  		intel_vrr_enable(new_crtc_state);
> +
> +		/*
> +		 * VRR is being enabled seamlessly (no modeset, Panel Replay
> +		 * stays enabled), so re-apply the AS SDP skip-frame programming
> +		 * for the new (VRR on) state.
> +		 */
> +		if (!modeset)
> +			intel_alpm_pr_as_sdp_update(new_crtc_state);
> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831125914.1736=
501-1-uma.shankar@intel.com?part=3D3
