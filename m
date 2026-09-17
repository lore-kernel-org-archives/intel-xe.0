Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42985C982D1
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 05:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C467510E428;
	Thu, 17 Sep 2026 05:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cp9a6AL9";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0603E10E419;
 Thu, 17 Sep 2026 05:19:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 77DC140A30;
 Thu, 17 Sep 2026 05:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6171F000FF;
 Thu, 17 Sep 2026 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789622343;
 bh=0BklnUeb095oberaLTpTX7fuyUp2f0FwDqhaW9HrJ5g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Cp9a6AL9zB7/cvy/lWBumaA/2homZduiIpXqx+NHuGWl0eLu/QS4ls72bD1/mZ0uR
 bkfIhAP7Ngq4waROYzyyIxlCFCDgoI34XW6wQg5aQBr5Z5QCAdWyzjRNojTVPXFgL4
 SKVp9Iv404mY1AopmO4/104rdfaJ6KcjDJWLoTVr7FSMLwy6EcQnMyIgxfE5Hb/UyF
 uucW2aIELM/S415NkpLrVOxM8ZxQXN9KoRxDDcFwvnLjXKMV7KVdgfZhLWwOEPhpDE
 oFlDGB8zxjb92qSuMheXfIe1CWXS/obPM+NwBIbF/qsH/WhDvi1Sr5l23kvPCRluN9
 LJ8VNFGsWWrjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260917050649.871960-8-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-8-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 05:19:02 +0000
Message-Id: <20260917051903.2F6171F000FF@smtp.kernel.org>
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
- [Medium] drm/i915/display: TGDDA workaround state leaks to HDMI modesets
--

commit 7ca764c5b58c7f2901c9b7de8005ba2561ae1426
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

    drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
   =20
    To support a Link M/N ratio between 10.0 and 15.0, for some BMG
    ultrajoiner cases we need Wa_14021768792.
   =20
    To bypass the hardware limitation within the Timing Generator DDA
    (TGDDA), we need to program the LINKM and LINKN registers as defined in
    the WA. Along with this we also need the relevant bits in HDMI_EMP_DATA
    and CHICKEN_TRANS.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 6d2025e109956..1e9d8943626a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
[ ... ]
> @@ -2738,6 +2749,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct intel_d=
isplay *display,
>  	return IS_DISPLAY_VER(display, 5, 7) || display->platform.cherryview;
>  }
> =20
> +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> +				     enum transcoder transcoder,
> +				     const struct intel_link_m_n *m_n)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> +
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return;
> +
> +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK, link_m_frac));
> +
> +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> +		     DP_ENHANCED_TGDDA_ENABLE,
> +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0);
> +}
> +
>  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    const struct intel_link_m_n *m_n)
> @@ -2745,6 +2776,8 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_cr=
tc *crtc,
>  	struct intel_display *display =3D to_intel_display(crtc);
>  	enum pipe pipe =3D crtc->pipe;
> =20
> +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> +
>  	if (DISPLAY_VER(display) >=3D 5)

[Severity: Medium]
The commit message states that CHICKEN_TRANS and HDMI_EMP_DATA "are explici=
tly
cleared when the mechanism is not in use, so that state cannot leak from a
previous modeset." Does this clearing logic work if the transcoder is repur=
posed
for HDMI?

The clearing logic is placed in bmg_enhanced_tgdda_write(), which is called
exclusively from intel_cpu_transcoder_set_m1_n1().

Looking at hsw_configure_cpu_transcoder(), intel_cpu_transcoder_set_m1_n1()=
 is
only called for DP and FDI encoders:

    } else if (intel_crtc_has_dp_encoder(crtc_state)) {
        intel_cpu_transcoder_set_m1_n1(crtc, cpu_transcoder,
                                       &crtc_state->dp_m_n);
        intel_cpu_transcoder_set_m2_n2(crtc, cpu_transcoder,
                                       &crtc_state->dp_m2_n2);
    }

If a transcoder is first used for DisplayPort (triggering the workaround and
setting DP_ENHANCED_TGDDA_ENABLE) and subsequently repurposed for HDMI,
intel_cpu_transcoder_set_m1_n1() is completely skipped.

Will the Transcoder's Timing Generator DDA remain in the enhanced DP workar=
ound
mode and potentially corrupt HDMI timings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917050649.8719=
60-1-suraj.kandpal@intel.com?part=3D7
