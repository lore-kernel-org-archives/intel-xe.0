Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DC606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HVjnkMaM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F74A10E28E;
	Fri, 30 Oct 2026 17:32:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A90910E28E;
 Fri, 30 Oct 2026 17:32:48 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B4CB431DA;
 Fri, 30 Oct 2026 17:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7411F000C1;
 Fri, 30 Oct 2026 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793381568;
 bh=Q3ieiLiFjs1VuSJrjCfBcIblR8jFuIbAn2W/sTO7WwQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HVjnkMaMpsX3vO8DANTfXwwOGbN7fwg3YLhhkBq7JZi79A1S2nyS+GpGrIQWlNW6s
 ufbIwbOl6fUV8RcE2oVR3xmFYCUYUHRET75GrUilRP68ygrATvFVweJJG0KnmgokAj
 n7kI7fajD6sW17U7Nmz3gxXRS9udKMtHQtkCV/w6tuD7xuzXxnQVOXZwfcjk5T3pPm
 0kQxqKTbvmPbnn3uAZs+sqah3z0NouJi5vheRRZq0ivXYWQfpfAa/05a7LgjPXqZzm
 0XPqgzaHrSKJA1dhtCDyf8qyTY0eYT9zb/Qx21ZZvfGf50xbDWUfhZk3lMBz6wQzd8
 PdZ8KkvjLM5Dw==
Message-ID: <sashiko-outbox-191348@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] drm/i915: Wait for timing generator to start in
 intel_crtc_vblank_on() on HSW+
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261030171327.29829-7-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:32:47 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915: intel_pipe_vblank_on() scanline wait times out on DSI
--

commit a024447aed84d4ab8f0e7bb2ee11d21475e5b408
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915: Wait for timing generator to start in intel_crtc_vblank_on() on H=
SW+

This commit waits for the pipe scanline counter to start moving inside
intel_pipe_vblank_on() on Haswell and newer platforms before enabling
vblank interrupts.

> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/=
i915/display/intel_crtc.c
> index a28f4a088e587..209d5a18ee8d9 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -128,8 +128,21 @@ u32 intel_crtc_max_vblank_count(const struct intel_c=
rtc_state *crtc_state)
> =20
>  void intel_pipe_vblank_on(const struct intel_crtc_state *crtc_state)
>  {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> =20
> +	/*
> +	 * Make sure the timing generator has really started so
> +	 * the sampled frame/scanline counter values don't jump
> +	 * erratically.
> +	 *
> +	 * TODO do this for older platforms as well after
> +	 * rearranging the modeset sequence a bit.
> +	 */
> +	if (DISPLAY_VER(display) >=3D 9 ||
> +	    display->platform.broadwell || display->platform.haswell)
> +		intel_wait_for_pipe_scanline_moving(crtc);

[Severity: Medium]
Will calling intel_wait_for_pipe_scanline_moving() unconditionally on
DISPLAY_VER(display) >=3D 9 time out for 100 ms and log a false error on
Broxton/Geminilake DSI and Gen11+ DSI command mode?

intel_wait_for_pipe_scanline_moving() calls wait_for_pipe_scanline_moving()=
 ->
pipe_scanline_is_moving(), which directly polls PIPEDSL:

drivers/gpu/drm/i915/display/intel_vblank.c:pipe_scanline_is_moving() {
	intel_reg_t reg =3D PIPEDSL(display, pipe);
	u32 line1, line2;

	line1 =3D intel_de_read(display, reg) & PIPEDSL_LINE_MASK;
	msleep(5);
	line2 =3D intel_de_read(display, reg) & PIPEDSL_LINE_MASK;

	return line1 !=3D line2;
}

On Broxton (DISPLAY_VER 9) and Geminilake (DISPLAY_VER 10) MIPI DSI, timings
are driven from the port rather than the CPU transcoder, and PIPEDSL does n=
ot
increment. Because of this, intel_dsi_compute_config() and
bxt_dsi_get_pipe_config() set I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP, a=
nd
__intel_get_crtc_scanline() skips reading PIPEDSL:

drivers/gpu/drm/i915/display/intel_vblank.c:__intel_get_crtc_scanline() {
	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
		return __intel_get_crtc_scanline_from_timestamp(crtc);

	vtotal =3D intel_mode_vtotal(mode);

	position =3D intel_de_read_fw(display, PIPEDSL(display, pipe)) & PIPEDSL_L=
INE_MASK;
	...
}

When bxt_dsi_enable() -> intel_crtc_vblank_on() -> intel_pipe_vblank_on() r=
uns
(or during intel_modeset_setup_hw_state()), polling PIPEDSL will see a stat=
ic
value and time out.

Similarly, on Gen11+ DSI command mode (where I915_MODE_FLAG_DSI_USE_TE0 or
I915_MODE_FLAG_DSI_USE_TE1 is set in crtc_state->mode_flags),
gen11_dsi_configure_transcoder() configures the transcoder in CMD_MODE_TE_G=
ATE
without periodic updates. When gen11_dsi_enable() calls intel_crtc_vblank_o=
n()
during intel_enable_crtc(), no frame update has been requested yet because
icl_dsi_frame_update() is only called later in intel_update_crtc() ->
intel_pipe_update_end():

drivers/gpu/drm/i915/display/intel_crtc.c:intel_pipe_update_end() {
	...
	if (DISPLAY_VER(display) >=3D 11 &&
	    intel_crtc_has_type(new_crtc_state, INTEL_OUTPUT_DSI))
		icl_dsi_frame_update(new_crtc_state);
	...
}

Should intel_pipe_vblank_on() skip intel_wait_for_pipe_scanline_moving() wh=
en
crtc_state->mode_flags has I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP or
I915_MODE_FLAG_DSI_USE_TE0 / I915_MODE_FLAG_DSI_USE_TE1 set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030171327.2982=
9-1-ville.syrjala@linux.intel.com?part=3D6
