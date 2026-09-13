Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA1BC88E5C
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3979210E0F4;
	Sun, 13 Sep 2026 15:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fghZyaWL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0069A10E0F4;
 Sun, 13 Sep 2026 15:33:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2050260E69;
 Sun, 13 Sep 2026 15:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A055C1F000FF;
 Sun, 13 Sep 2026 15:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789313613;
 bh=s1DI8fAmYD3AVAZalwqek+n5/CP8663HxxByXmMJDIA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fghZyaWL4G4qk2Gen4lbPeQecLdQF1SKlMZt24ri9WSH4gLJNl1pXO3+EtkY50R/s
 WDx+/lPnnvGu4o84eeZnrVrQi/Wi89XnIbb3DKKyWG6iyPCpCtdi2xcoT1UyhLdw8X
 kqwVZP4NSzeDDEcfFp0tW+UT78/RcDeWEGzwNJtIX98dBppUFRe/OFZwi3sdHMG3dq
 VqGY/hw058JhuyA5br45m58tJUZmy54lIF+crYLIoDzWFeCpL+lKp6gQohsoKxZ3OF
 tHLwPCDbczoTXx2Q+Ohdxx+hYoSBH5j3zJZ4tTkBl/KZt+vs38WxBX1AlkiOW3t5ko
 HYe5RaNNF0ADg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/13] drm/i915/dip: Enable Common SDP Transmission line
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260913145649.3240904-12-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-12-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 15:33:33 +0000
Message-Id: <20260913153333.A055C1F000FF@smtp.kernel.org>
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
- [Medium] Common SDP transmission line is incorrectly programmed for MST s=
treams due to missing computation and mismatched transcoder programming sco=
pes.
- [Medium] Integer underflow when computing cmn_sdp_tl for display modes wh=
ere VRR is disabled or unsupported, leading to spurious warnings and aborte=
d hardware programming.
--

commit 0717b28db12af360a6f11ccd09e4a25272022976
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dip: Enable Common SDP Transmission line

This commit computes and programs the common base transmission line and
per-SDP stagger values during modesets. It also disables the feature upon
pipe disable.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index dacb4b7588a02..3cdb06e81130b 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
[ ... ]
> @@ -2737,6 +2737,8 @@ static void mtl_ddi_pre_enable_dp(struct intel_atom=
ic_state *state,
>  	/* 6.o Configure and enable FEC if needed */
>  	intel_ddi_enable_fec(encoder, crtc_state);
> =20
> +	intel_dip_cmn_sdp_transmission_line_enable(crtc_state);
> +
>  	/* 7.a 128b/132b SST. */

[Severity: Medium]
Does hooking this transcoder-specific transmission line programming here
correctly handle MST streams?=20

Since mtl_ddi_pre_enable_dp() operates at the link level, it appears this
might only be called once for the first active MST stream. This could leave
subsequent transcoders in the MST topology uninitialized, causing their SDP
packets to use incorrect default transmission lines.

Additionally, should the transmission line computation be added to
mst_stream_compute_config_late() in intel_dp_mst.c? It looks like it is
currently omitted during the MST encoder's late compute configuration.

[ ... ]
> @@ -3124,6 +3126,7 @@ static void intel_ddi_buf_disable(struct intel_enco=
der *encoder,
>  			     DP_TP_CTL_ENABLE, 0);
>  	}
> =20
> +	intel_dip_cmn_sdp_transmission_line_disable(crtc_state);
>  	intel_ddi_disable_fec(encoder, crtc_state);

[Severity: Medium]
Similar to the pre-enable hook, does placing the disable sequence in this
link-level function cause it to only apply to the transcoder of the last
active MST stream?

> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i=
915/display/intel_dip.c
> index f8e8577b27558..f447150ff7bc0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
[ ... ]
> @@ -54,14 +55,109 @@ void intel_dip_write_emp_as_sdp_tl(const struct inte=
l_crtc_state *crtc_state)
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

[Severity: Medium]
Can this subtraction underflow if the display mode does not support VRR?

If an interlaced mode is set, for example, intel_vrr_compute_config() can
bail out early and leave vrr.guardband at 0. This would cause the
computation to evaluate to a large unsigned value (or a negative value that
is later evaluated as unsigned).

If this underflow happens, it appears it would cascade into the following
bounds check:

> +	if (drm_WARN_ON(display->drm,
> +			crtc_state->dip.cmn_sdp_tl >=3D
> +			crtc_state->vrr.guardband + crtc_state->set_context_latency))
> +		return;

This could trigger a spurious kernel warning and unexpectedly abort the
rest of the hardware programming sequence for the transmission line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913145649.3240=
904-1-ankit.k.nautiyal@intel.com?part=3D11
