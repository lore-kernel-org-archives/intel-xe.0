Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8D1C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0710EA72;
	Tue,  8 Sep 2026 07:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gt8RPIjt";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060D410EA71;
 Tue,  8 Sep 2026 07:11:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D8E6540238;
 Tue,  8 Sep 2026 07:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E681F00A3D;
 Tue,  8 Sep 2026 07:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788851493;
 bh=+HLlY965/eB1uFXMfyxZvQq4Qpxbi7qmwB9zp/aUiXc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Gt8RPIjtyaQPVeXeBDN19y4iDZJYKw4zfwTkFw/gMH7KUAh8kAi5nue8RGehlyY90
 PrIS0uBTr1QgTe5Ihy3i/zDnGW3kFZsV1yLQvXEPDtJgLbLSITZ9HI0a2EnIXSLj8w
 qsB+fad/3ijlRFM9LQOSqbmIkxlTpKhrtbB+jt+8+jETaZYgxZnfxABU1nPkZb3K0Z
 /gVo6O2pEGMiMsX5IkQCEUG+9B0kWlk6kGFkyct3GdWGZ/Y3N/jyqqe9gBy8ix4mQR
 9P8N3GPMBqqLHu7DkWj5CnUdtL30tcmHkZ9rtMiFR3h3M2uyBxbBaKxvLIVoL4yw10
 eVUCy7EvzNmag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/12] drm/i915/dip: Enable Common SDP Transmission line
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-12-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:11:33 +0000
Message-Id: <20260908071133.82E681F00A3D@smtp.kernel.org>
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
- [High] Integer underflow when computing cmn_sdp_tl with guardband=3D0 cau=
ses a kernel warning, and a valid transmission line of 0 is incorrectly tre=
ated as 'disabled'.
- [Medium] Per-transcoder SDP transmission line programming is incorrectly =
placed in port-level enable/disable paths, breaking DP MST secondary stream=
s.
--

commit dcefae9ad5800e7d0f8f1d55a58dfb400880ed28
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dip: Enable Common SDP Transmission line

This commit enables programming of the common SDP transmission line on
platforms that support it. It computes and programs the common base
transmission line and per-SDP stagger values from the crtc state during
modeset, and disables the feature on pipe disable.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atom=
ic_state *state,
>  	/* 6.o Configure and enable FEC if needed */
>  	intel_ddi_enable_fec(encoder, crtc_state);
> =20
> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
> +

[Severity: Medium]
Since mtl_ddi_pre_enable_dp() acts at the port level and only executes for
the first stream in a DP MST topology, will secondary streams' transcoders
miss having their SDP transmission line initialized?

It seems MST secondary streams will bypass this hook entirely. Furthermore,
mst_stream_compute_config_late() in intel_dp_mst.c doesn't appear to call
intel_dip_cmn_sdp_tl_compute_config_late(), meaning the values aren't
computed for MST streams.

>  	/* 7.a 128b/132b SST. */
>  	if (!is_mst && intel_dp_is_uhbr(crtc_state)) {
>  		/* VCPID 1, start slot 0 for 128b/132b, tu slots */
[ ... ]
> @@ -3124,6 +3126,7 @@ static void intel_ddi_buf_disable(struct intel_enco=
der *encoder,
>  			     DP_TP_CTL_ENABLE, 0);
>  	}
> =20
> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);

[Severity: Medium]
Similarly, since this port-level disable hook only executes when the last
stream is disabled, does this leave the transmission line registers active
for other transcoders in an MST setup when they are individually disabled?

>  	intel_ddi_disable_fec(encoder, crtc_state);
> =20
>  	if (DISPLAY_VER(display) < 14)
> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i=
915/display/intel_dip.c
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
[ ... ]
> +static
> +void intel_dip_cmn_sdp_tl_compute_config_late(struct intel_crtc_state *c=
rtc_state)
> +{
[ ... ]
> +	if (as_sdp)
> +		crtc_state->dip.cmn_sdp_tl =3D crtc_state->dip.emp_as_sdp_tl;
> +	else
> +		crtc_state->dip.cmn_sdp_tl =3D crtc_state->vrr.guardband - 1;

[Severity: High]
If crtc_state->vrr.guardband is 0 (for example, when VRR is not used), will
this subtraction underflow and set the u16 cmn_sdp_tl to 65535?

If it underflows to 65535, pps_stagger evaluates to a negative value=20
(0 - 65535) in intel_dip_cmn_sdp_transmission_line_enable(). Will this trig=
ger
the drm_WARN_ON(display->drm, pps_stagger < 0) and abort enabling the
transmission line?

Also, if guardband evaluates to 1, cmn_sdp_tl will be 0. Does the
!crtc_state->dip.cmn_sdp_tl check in intel_dip_cmn_sdp_transmission_line_en=
able()
and disable() incorrectly treat a valid transmission line value of 0 as a
sentinel for 'feature disabled', silently skipping the hardware enablement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908062224.2897=
987-1-ankit.k.nautiyal@intel.com?part=3D11
