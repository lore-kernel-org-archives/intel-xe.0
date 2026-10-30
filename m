Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BC5606A320
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZGom+Nn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73A610E186;
	Fri, 30 Oct 2026 17:26:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD86A10E6C8;
 Fri, 30 Oct 2026 17:26:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 05D9F601EE;
 Fri, 30 Oct 2026 17:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4341F000C1;
 Fri, 30 Oct 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793381193;
 bh=S7/eVeosovN/z/owFlFTKJ3W7BSIaAYA5N+oZzOtufU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BZGom+NnPR9dJp1KQYkpWEFQTLM2L4X81TJ0yz8PjL6GWab91h6zCU53R+BCmzM1t
 4f/7NorT4r9ph836nUXXS1QVaExEembovv77TabkmDpEIuNQe7o7GoNUdWoNdaVMY8
 PshlWMiuO2kaTJdf7tIzBUOnwR728xincDFVfEA5B7Rw5NY87/DFTsInzEjzV/IU6E
 cAAFAnEto97/BKHBEYhWBXJuawxQym4ij2slNEhTF3WMRcCZ3dTusSWz7HOmtWPGPW
 64ukXPf+YXSXYrm+Sv7gGu5uffJITbRuao2SiTSVJ26tuxUFbPya/C4C8Zh5APl/lF
 PMFbI9VyygtZQ==
Message-ID: <sashiko-outbox-191339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] drm/i915: Handle joined pipes inside
 intel_crtc_vblank_{on, off}()
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261030171327.29829-4-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:26:33 +0000
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
- [High] drm/i915: NULL state dereference in intel_crtc_vblank_off()
--

commit c6499a1bf58e345d4e50ee3b23d7821c66712bdd
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915: Handle joined pipes inside intel_crtc_vblank_{on, off}()

This commit moves the joined-pipe iteration into intel_crtc_vblank_on()
and intel_crtc_vblank_off(), renaming the single-pipe helpers to
intel_pipe_vblank_on() and intel_pipe_vblank_off(). Callers are updated to
pass struct intel_atomic_state alongside the CRTC state.

> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i91=
5/display/icl_dsi.c
> index ea0cdb7822f39..381cdf7d5131c 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c

[ ... ]

> @@ -1455,7 +1455,7 @@ static void gen11_dsi_post_disable(struct intel_ato=
mic_state *state,
>  	struct intel_dsi *intel_dsi =3D enc_to_intel_dsi(encoder);
>  	struct intel_crtc *crtc =3D to_intel_crtc(old_crtc_state->uapi.crtc);
> =20
> -	intel_crtc_vblank_off(old_crtc_state);
> +	intel_crtc_vblank_off(state, old_crtc_state);
> =20
>  	/* step2d,e: disable transcoder and wait */
>  	gen11_dsi_disable_transcoder(encoder);
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i=
915/display/intel_crt.c
> index 5b8968197fbcf..b814b84c650fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -265,7 +265,7 @@ static void hsw_post_disable_crt(struct intel_atomic_=
state *state,
>  	struct intel_display *display =3D to_intel_display(encoder);
>  	struct intel_crtc *crtc =3D to_intel_crtc(old_crtc_state->uapi.crtc);
> =20
> -	intel_crtc_vblank_off(old_crtc_state);
> +	intel_crtc_vblank_off(state, old_crtc_state);
> =20
>  	intel_disable_transcoder(old_crtc_state);
> =20

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/=
i915/display/intel_crtc.c
> index 10ed9bdfee763..a28f4a088e587 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c

[ ... ]

> @@ -165,6 +165,34 @@ void intel_crtc_vblank_off(const struct intel_crtc_s=
tate *crtc_state)
>  	flush_work(&display->irq.vblank_notify_work);
>  }
> =20
> +void intel_crtc_vblank_on(struct intel_atomic_state *state,
> +			  const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(state);
> +	struct intel_crtc *pipe_crtc;
> +
> +	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, crtc_state) {
> +		const struct intel_crtc_state *pipe_crtc_state =3D
> +			intel_atomic_get_new_crtc_state(state, pipe_crtc);
> +
> +		intel_pipe_vblank_on(pipe_crtc_state);
> +	}
> +}
> +
> +void intel_crtc_vblank_off(struct intel_atomic_state *state,
> +			   const struct intel_crtc_state *old_crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(state);
> +	struct intel_crtc *pipe_crtc;
> +
> +	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state) {
> +		const struct intel_crtc_state *old_pipe_crtc_state =3D
> +			intel_atomic_get_old_crtc_state(state, pipe_crtc);
> +
> +		intel_pipe_vblank_off(old_pipe_crtc_state);
> +	}
> +}

[Severity: High]
Can state be NULL when intel_crtc_vblank_off() is called from
encoder->post_disable()?

During initial hardware readout or resume in
intel_modeset_setup_hw_state(), intel_sanitize_encoder() disables an
encoder whose connector is active while its pipe is inactive by invoking
the disable hooks with a NULL atomic state:

drivers/gpu/drm/i915/display/intel_modeset_setup.c:intel_sanitize_encoder()=
 {
	...
	if (connector && !has_active_crtc) {
		...
		if (crtc_state) {
			...
			/* FIXME NULL atomic state passed! */
			if (encoder->disable)
				encoder->disable(NULL, encoder, crtc_state,
						 connector->base.state);
			if (encoder->post_disable)
				encoder->post_disable(NULL, encoder, crtc_state,
						      connector->base.state);
		}
	}
}

Previously, gen11_dsi_post_disable(), intel_dsi_post_disable() (on
Broxton and Geminilake), and hsw_post_disable_crt() did not dereference
state and passed old_crtc_state directly to intel_crtc_vblank_off(). With
this change, those callbacks pass state =3D NULL to intel_crtc_vblank_off(),
which dereferences state in both to_intel_display(state) and
intel_atomic_get_old_crtc_state(state, pipe_crtc).

Would it make sense to keep using intel_pipe_vblank_off(old_crtc_state) in
the non-joiner post_disable callbacks, or handle a NULL state inside
intel_crtc_vblank_off()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030171327.2982=
9-1-ville.syrjala@linux.intel.com?part=3D3
