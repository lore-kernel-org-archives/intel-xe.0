Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA670C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 07:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F1C10EA5E;
	Tue,  8 Sep 2026 07:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="And3wLj+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19D610EA5E;
 Tue,  8 Sep 2026 07:09:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CB2F43DFC;
 Tue,  8 Sep 2026 07:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FE81F00A3D;
 Tue,  8 Sep 2026 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788851351;
 bh=BmdtyT0BMQ0mG1ayLZK5iDDUunXRG5pU4IhMX+p4v/I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=And3wLj+3fuBJ2B/aByGTc+xpN/tBPR/qofa6dnrLBk/WkGwCJ5+HEdcx6eId3r9j
 FPAV3mZ2A0DaGL7eHfm7RUt6pxolF7Wh1FV0NZLZbyDAnDWRVCyDwj9v6CjRgh8Y/G
 53K0mldlnyIHEwIx45b9hrc2fWRXtZBYJfjCV9NDdyv1ABFA6oD+MXDIDQoepSIq9b
 BBPrCwyGXe3c48Bvy0LZGOqwPcPAyzRnVtWde5f4w5nU7VCvIcO2sD9uA6Ei3cHiec
 cJ5RjO6URN6u4Moy/ybYmsDadRQ3a40IFojndy3BUjlzALYeVyCSLiXVCiQeRM5ZLC
 MQlfJGc6O+0rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/12] drm/i915/dip: Store and use AS SDP
 transmission line from crtc state
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260908062224.2897987-7-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
 <20260908062224.2897987-7-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:09:10 +0000
Message-Id: <20260908070911.26FE81F00A3D@smtp.kernel.org>
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
- [Medium] Spurious state mismatch warnings for dip.emp_as_sdp_tl due to un=
conditional hardware readout of stale register values.
- [Medium] Unconditional fastset check for `dip.emp_as_sdp_tl` breaks seaml=
ess Link Refresh Rate (LRR) updates, forcing heavy full modesets.
--

commit fdc12bb4795c43a7d04cbec4746e152e2a99a6d8
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dip: Store and use AS SDP transmission line from crtc state

This commit moves the computation of the Adaptive Sync SDP transmission
line from programming time to the crtc state computation phase. It stores
the value in the crtc state to be used when programming the EMP_AS_SDP_TL
register, preparing for programmable transmission lines for other DP SDPs.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
[ ... ]
> @@ -4235,6 +4236,7 @@ static void intel_ddi_get_config(struct intel_encod=
er *encoder,
>  	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA=
);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>  	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
> +	intel_dip_sdp_transmission_line_get_config(pipe_config);

[Severity: Medium]
Could this unconditional hardware readout capture stale values and cause
spurious state mismatch warnings?

intel_dip_sdp_transmission_line_get_config() unconditionally reads the
EMP_AS_SDP_TL hardware register. If the encoder is HDMI, or if VRR was
disabled, the computed software state leaves dip.emp_as_sdp_tl =3D 0.

However, when VRR is disabled, intel_vrr_set_transcoder_timings() in
drivers/gpu/drm/i915/display/intel_vrr.c returns early and never clears
EMP_AS_SDP_TL. This leaves a stale non-zero value in the hardware register
from a previous DP modeset.

Could this mismatch cause intel_pipe_config_compare() to fail, incorrectly
forcing an unnecessary full modeset instead of a fastset?

> diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i=
915/display/intel_dip.c
> --- a/drivers/gpu/drm/i915/display/intel_dip.c
> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
[ ... ]
> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_=
state)
> +{
> +	crtc_state->dip.emp_as_sdp_tl =3D intel_dip_get_as_sdp_transmission_lin=
e(crtc_state);
> +}

[Severity: Medium]
Does computing and checking this transmission line state break seamless
Link Refresh Rate (LRR) updates?

LRR is designed to perform seamless refresh rate transitions without screen
blanking. The intel_pipe_config_compare() function in intel_display.c
ignores vrr.vsync_start differences during a fastset because it is
explicitly guarded by an if (!fastset) condition.

Because dip.emp_as_sdp_tl is computed directly from vrr.vsync_start, and
its corresponding state check (PIPE_CONF_CHECK_I) runs outside the
!fastset block, an LRR transition that naturally alters the vtotal and
vsync_start will produce a mismatch.

Will this erroneously fail the fastset check and force a heavy full modeset
instead of a seamless transition?

> +
> +void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state =
*crtc_state)
> +{
> +	crtc_state->dip.emp_as_sdp_tl =3D intel_dip_read_emp_as_sdp_tl(crtc_sta=
te);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908062224.2897=
987-1-ankit.k.nautiyal@intel.com?part=3D6
