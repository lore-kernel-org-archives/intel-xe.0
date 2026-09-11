Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E8C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E4E10E2DB;
	Fri, 11 Sep 2026 04:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="grIuMhzd";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F374E10E2DB;
 Fri, 11 Sep 2026 04:29:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C218C42DEB;
 Fri, 11 Sep 2026 04:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CB21F000FF;
 Fri, 11 Sep 2026 04:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789100948;
 bh=J7dFUgd4t/M3NQOK+5IsEDC0sEhBlXq+wAu7Sg5S2K8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=grIuMhzdSuky5AAZspF37YCdCQ1vUKhs6wYVrsticfnURsN7BHVZtogL3m0uFcaLp
 AGmEvD+9CjLT0dpvTNIe+R+z+zkdwAOpqhv25kHx2Rcz1YF+cyInQA36DH1Z/QZkX8
 VOVfQjj6KJ7j3T+5dc+TneKN8yd2dgwfmIVzz0lWOKeryy1FJ0nre9wdmf7HhdqxTK
 dlHvg/klJ0vsO1DQ/h6EdIVo9P6GfT40DIQmfgHA06FbSm5n+3Vh62IVae91uJc4Gr
 75eMKbszoD1YlKCBs/T6BKocHGN9chN8maNL/rDTNES8Sv0k3m/mrqUVnnC2t04Rvn
 RdbbYRZDNRUYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] drm/i915/display: Add bits for Wa_14021768792 for
 linkm/n ratio > 10
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260911041449.3699400-8-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-8-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 04:29:08 +0000
Message-Id: <20260911042908.78CB21F000FF@smtp.kernel.org>
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
- [Medium] Hardware state readout for TGDDA bypass is gated by software pol=
icy checks and strips register fields, hiding invalid hardware state from t=
he DRM state checker.
--

commit 1ce39b1d4686aae2119d0886a91c099e220bd0a0
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > =
10

This commit adds support for Wa_14021768792 to bypass the hardware limitati=
on
within the Timing Generator DDA (TGDDA) for Link M/N ratios between 10.0 and
15.0. It introduces hardware programming in the LINKM, LINKN, HDMI_EMP_DATA,
and CHICKEN_TRANS registers and tracks the usage with a new
bypass_m_n_ratio_limit member.

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 347892b0c1da7..a5b1d4c4623a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
[ ... ]
> @@ -3487,16 +3520,64 @@ void intel_get_m_n(struct intel_display *display,
>  	m_n->link_m =3D intel_de_read(display, link_m_reg) & DATA_LINK_M_N_MASK;
>  	m_n->link_n =3D intel_de_read(display, link_n_reg);
> =20
> -	if (DISPLAY_VER(display) >=3D 14)
> +	if (DISPLAY_VER(display) >=3D 14) {
> +		u8 link_n_ext =3D REG_FIELD_GET(PIPE_LINK_N1_EXTENDED_MASK, m_n->link_=
n);
> +
>  		m_n->link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;

[Severity: Medium]
This unconditionally strips the extended bits from the read hardware state =
in
intel_get_m_n(). The drm_WARN_ON directly below it only triggers if
link_n_ext is non-zero, which fails to warn if the bits are zero in hardware
but were expected to be set. Should this code retain the extended bits or
unconditionally validate them so the DRM state checker can detect missing
hardware configuration?

> +
> +		if (intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +			drm_WARN_ON(display->drm,
> +				    link_n_ext && link_n_ext !=3D bmg_get_link_n_ext(m_n));
> +	} else {
>  		m_n->link_n &=3D DATA_LINK_M_N_MASK;
> +	}
[ ... ]
> +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> +				    enum transcoder transcoder,
> +				    struct intel_link_m_n *m_n)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	u32 link_m_frac;
> +	int m_n_ratio;
> +
> +	if (!m_n->link_n)
> +		return;
> +
> +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> +
> +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc->pipe))
> +		return;

[Severity: Medium]
This policy check in bmg_enhanced_tgdda_read() aborts the readout of
DP_ENHANCED_TGDDA_ENABLE if the driver considers the configuration unsuppor=
ted.
If the hardware is misconfigured, this early return leaves
bypass_m_n_ratio_limit as false. Should this check be removed so the true
hardware state is read and exposed to the DRM state checker?

> +
> +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> +	      DP_ENHANCED_TGDDA_ENABLE))
> +		return;
> +
> +	link_m_frac =3D REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +				    intel_de_read(display, HDMI_EMP_DATA(display, transcoder)));
> +
> +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> +		m_n->bypass_m_n_ratio_limit =3D true;

[Severity: Medium]
This exact-match check prevents the readout from recording that the bypass =
is
enabled if the fractional part in hardware is incorrect. Should
bypass_m_n_ratio_limit be set regardless of the fractional value so the
DRM state checker can catch incorrect hardware configurations?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911041449.3699=
400-1-suraj.kandpal@intel.com?part=3D7
