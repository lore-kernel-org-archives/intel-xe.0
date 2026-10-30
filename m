Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274F9606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eqVDmJm0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4311129B2;
	Fri, 30 Oct 2026 20:46:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10CC1129B2;
 Fri, 30 Oct 2026 20:46:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F92B41448;
 Fri, 30 Oct 2026 20:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC291F000C1;
 Fri, 30 Oct 2026 20:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793393168;
 bh=h75UfJU3XBaguuNcL+A3fhFnTjIZnrNg9t3pT7fOcaA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=eqVDmJm0nX8TK1Wd8eAYgEVY4s7Vxl9Q6lzL3FTj0151bHCcfjrsVR0eRa0pPTkjC
 EfUXB6ZbvcVq5A0LHh92OES06INQ/bWiiZQKPkmgWYgW9PGdm5DRI7ecRyhKT2MZrL
 tC0q76LDPpUMAJ8ZhLcNPZJoH2xRpCI/8UPKEBgXqsviyVEd+2sGdngRa5yKXTfYi6
 CxVEc5iT4kCKMhNOQEkTBV7gvPXvb8N32NzhoUwgLP4hX6VQ988jjREO476ACgzhVg
 tp+DA8J1MpNFyujKd5bc4ruZfXAaXct0MKPTEj+VMe0UJ13owmbRdYsljPQccpJWLh
 EWr6GBIa/J9rA==
Message-ID: <sashiko-outbox-191492@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC v1 1/3] drm/i915/dip: Send HDMI EMPs early in V. Blank
 when VRR is in range
To: "Alan Stead" <alan.stead@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261030203314.1085262-2-alan.stead@intel.com>
References: <20261030203314.1085262-1-alan.stead@intel.com>
 <20261030203314.1085262-2-alan.stead@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 20:46:07 +0000
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
- [High] drm/i915/dip: unreachable HDMI branch in intel_dip_get_as_sdp_tran=
smission_line()
--

commit d831d02efdf03e1121867448c9abebc827f0c335
Author: Alan Stead <alan.stead@intel.com>

drm/i915/dip: Send HDMI EMPs early in V. Blank when VRR is in range

This commit updates intel_dip_get_as_sdp_transmission_line() so that HDMI
outputs with VRR in range send EMPs on the second line of V. Blank within
the SCL + guardband region rather than at the start of the VSYNC pulse.

> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i=
915/display/intel_dip.c
> index f447150ff7bc0..831881e6c15ec 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
> @@ -19,6 +19,25 @@ static int intel_dip_get_as_sdp_transmission_line(cons=
t struct intel_crtc_state
>  	if (!HAS_EMP_AS_SDP_TL(display))
>  		return 0;
> =20
> +	/*
> +	 * HDMI 2.1 expects the EMPs (such as the VTEM used for VRR) within
> +	 * the first half of V. Blank, so send them on the 2nd line of the
> +	 * V. Blank rather than at the start of the VSYNC pulse. The line
> +	 * must also stay within the SCL + guardband region.
> +	 */
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
> +	    crtc_state->vrr.in_range) {
> +		const struct drm_display_mode *mode =3D &crtc_state->hw.adjusted_mode;
> +		int max_tl =3D crtc_state->set_context_latency +
> +			crtc_state->vrr.guardband - 1;
> +		int tl =3D mode->crtc_vtotal - mode->crtc_vdisplay - 1;
> +
> +		if (max_tl > 0)
> +			tl =3D min(tl, max_tl);
> +
> +		return tl;
> +	}

[Severity: High]
Can this HDMI branch in intel_dip_get_as_sdp_transmission_line() ever be
reached?

Looking at the call chain, intel_dip_get_as_sdp_transmission_line() is only
called from intel_dip_sdp_tl_compute_config_late():

drivers/gpu/drm/i915/display/intel_dip.c:
void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_sta=
te)
{
	crtc_state->dip.emp_as_sdp_tl =3D intel_dip_get_as_sdp_transmission_line(c=
rtc_state);

	intel_dip_cmn_sdp_tl_compute_config_late(crtc_state);
}

And intel_dip_sdp_tl_compute_config_late() is only called from
intel_dp_compute_config_late() -> intel_dp_sdp_compute_config_late(), which
is gated on intel_crtc_has_dp_encoder(crtc_state) in
intel_ddi_compute_config_late():

drivers/gpu/drm/i915/display/intel_ddi.c:
static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
					 struct intel_encoder *encoder,
					 struct intel_crtc_state *crtc_state,
					 struct drm_connector_state *conn_state)
{
	...
	if (intel_crtc_has_dp_encoder(crtc_state))
		ret =3D intel_dp_compute_config_late(encoder, crtc_state, conn_state);

Because DDI encoders are not cloneable, intel_crtc_has_dp_encoder(crtc_stat=
e)
is false whenever intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) is tru=
e,
leaving crtc_state->dip.emp_as_sdp_tl at 0 for HDMI outputs.

In addition, if intel_dip_sdp_tl_compute_config_late() were called for HDMI,
non-VRR HDMI modes (!crtc_state->vrr.in_range) would fall through to return
crtc_state->vrr.vsync_start instead of 0, and
intel_dip_cmn_sdp_tl_compute_config_late() would populate
crtc_state->dip.cmn_sdp_tl and the SDP stagger fields that are only
programmed on DP in mtl_ddi_pre_enable_dp(), causing state verification
mismatches in intel_pipe_config_compare() on platforms with
HAS_COMMON_SDP_TL(display).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030203314.1085=
262-1-alan.stead@intel.com?part=3D1
