Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23597C88E65
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CF210E959;
	Sun, 13 Sep 2026 15:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j9GI1FTi";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C30F10E958;
 Sun, 13 Sep 2026 15:25:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 78F5B60E64;
 Sun, 13 Sep 2026 15:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AF51F000FF;
 Sun, 13 Sep 2026 15:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789313140;
 bh=ZdmxvZn3LjVqLOkORecGYCcf/68FP4Z9I53HBLH64L0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=j9GI1FTii5Pqnz/OFzxAAd0K5OAk6Jt17QKq7AX4ZD7IPbBcYmYzACmLzs6lF4Gcw
 xv1FBaLT5DnpZiyZp97/yX9aDnY4pqeDvPov9ytymc8oycgedpmJblu1KbR7XcahEp
 AC6+j96Y/8VWylw88BHI9hA6UJf8Bni/6NQFCCGE18jsBUtBO0Ro+ba0zh3+awrcch
 geQdjlh9ExieWyiYGBWATbU0lzJ5hmcEhz6gFBEJQqLtgQgTk3EJ6uDWX08zf3ZnrM
 EryWVE8jFEQH7A0lvBQkum22x6fhFAsUDZHM3sq2clzpzntlnk4nnJSj78AnmNbqDM
 syWIp8zujngmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/13] drm/i915/dp: Adjust SDP guardband requirement
 for CMN_SDP_TL
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260913145649.3240904-13-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
 <20260913145649.3240904-13-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 15:25:39 +0000
Message-Id: <20260913152540.04AF51F000FF@smtp.kernel.org>
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

New issues:
- [Medium] intel_dp_get_lines_for_cmn_sdp_tl() fails to handle DP_SDP_VSC, =
returning 0 instead of the documented 3 setup lines.

Pre-existing issues:
- [High] intel_dp_sdp_min_guardband() fails to query guardband requirements=
 for DP_SDP_VSC and DP_SDP_VSC_EXT_VESA/CEA.
--

commit 9c43291671903e078a3be3eca84c33bbdb51d4ac
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

    drm/i915/dp: Adjust SDP guardband requirement for CMN_SDP_TL

This commit adjusts the SDP guardband requirements when CMN_SDP_TL is enabl=
ed.
It introduces intel_dp_get_lines_for_cmn_sdp_tl() to anchor SDPs like GMP, =
PPS,
VSC, and VSC_EXT relative to CMN_SDP_TL instead of the old per-packet sizin=
g.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 8c3a324e164ec..02e73ae9e34a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -7348,9 +7349,55 @@ int intel_dp_compute_config_late(struct intel_enco=
der *encoder,
>  	return 0;
>  }
> =20
> +static
> +int intel_dp_get_lines_for_cmn_sdp_tl(u32 type)
> +{
> +	u32 stagger_val;
> +
> +	/*
> +	 * Since we are using default stagger values similar to the case
> +	 * where CMN SDP TL is not set, the different SDP transmission
> +	 * lines are:
> +	 * base : 2nd line of delayed vblank:
> +	 * GMP : 2 + GMP_STAGGER
> +	 * VSC_EXT: 2 + VSC_EXT_STAGGER
> +	 * VSC : 2
> +	 * PPS : 2 + PPS_STAGGER
> +	 *
> +	 * SDP Setup =3D 1 + MAX(GMP, VSC_EXT, VSC, PPS setup lines)
> +	 *
> +	 * For EMP_AS_SDP_TL guardband should be more than vrr.vsync_start.
> +	 */
> +
> +	switch (type) {
> +	case DP_SDP_VSC_EXT_VESA:
> +	case DP_SDP_VSC_EXT_CEA:
> +		stagger_val =3D VSC_EXT_STAGGER_DEFAULT;
> +		break;
> +	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> +		stagger_val =3D GMP_STAGGER_DEFAULT;
> +		break;
> +	case DP_SDP_PPS:
> +		stagger_val =3D PPS_STAGGER_DEFAULT;
> +		break;
> +	default:
> +		return 0;
> +	}

[Severity: Medium]
Does this switch statement intentionally omit a case for DP_SDP_VSC?

The comment block above explicitly lists VSC as requiring 2 lines, but
because it is missing from the switch cases, this function falls through to
the default case and returns 0. Returning 0 instead of the documented 3
setup lines (1 + 2 + 0 stagger) for the DP_SDP_VSC guardband requirement
leads to an incorrectly calculated guardband when VSC SDPs are evaluated,
which could potentially cause missing SDPs or display corruption.

> +
> +	return 1 + 2 + stagger_val;
> +}
> +
>  static
>  int intel_dp_get_lines_for_sdp(const struct intel_crtc_state *crtc_state=
, u32 type)
>  {
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +
> +	if (type =3D=3D DP_SDP_ADAPTIVE_SYNC)
> +		return crtc_state->vrr.vsync_start + 1;
> +
> +	if (HAS_COMMON_SDP_TL(display))
> +		return intel_dp_get_lines_for_cmn_sdp_tl(type);
> +
>  	switch (type) {
>  	case DP_SDP_VSC_EXT_VESA:
>  	case DP_SDP_VSC_EXT_CEA:
> @@ -7359,8 +7406,6 @@ int intel_dp_get_lines_for_sdp(const struct intel_c=
rtc_state *crtc_state, u32 ty
>  		return 8;
>  	case DP_SDP_PPS:
>  		return 7;

[Severity: High]
This is a pre-existing issue, but I noticed that intel_dp_sdp_min_guardband=
()
never actually queries DP_SDP_VSC or DP_SDP_VSC_EXT_VESA/CEA.

While this patch explicitly adds logic to handle VSC_EXT and VSC sizes (both
in the new CMN mode and legacy paths), intel_dp_sdp_min_guardband() only
queries GMP, PPS, and AS SDPs when calculating the maximum guardband:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_sdp_min_guardband() {
	...
	if (assume_all_enabled ||
	    crtc_state->infoframes.enable &
	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
		sdp_guardband =3D max(sdp_guardband,
				    intel_dp_get_lines_for_sdp(crtc_state,
							       HDMI_PACKET_TYPE_GAMUT_METADATA));

	if (assume_all_enabled ||
	    crtc_state->dsc.compression_enable)
		sdp_guardband =3D max(sdp_guardband,
				    intel_dp_get_lines_for_sdp(crtc_state, DP_SDP_PPS));
	...
}

Does this leave the VSC_EXT switch cases in intel_dp_get_lines_for_sdp() and
intel_dp_get_lines_for_cmn_sdp_tl() as dead code? Since the guardband
calculation completely ignores the setup line requirements for VSC and
VSC_EXT packets, could programming a guardband smaller than the required
SDP transmission time lead to hardware failures or corrupted VBLANK timing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913145649.3240=
904-1-ankit.k.nautiyal@intel.com?part=3D12
