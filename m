Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0DDC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A5B10E0C1;
	Wed, 16 Sep 2026 09:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EPP1bG0r";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F5710E0C1;
 Wed, 16 Sep 2026 09:23:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 178DC416F9;
 Wed, 16 Sep 2026 09:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E081F00893;
 Wed, 16 Sep 2026 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789550627;
 bh=tX6y98+sbWcczxrWAeAh6CUdyAcFQQGoYSudnIn0p/g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EPP1bG0r/SGiOaFRX/9O85psZ3Gy/XOJtK2tmbugOtFQWtT3h5KgbGmeGXdkePQXt
 vz0O99I03EzTQtDgGBHnBJDqtHWRASZIzsmZNNHbgtIu4F21006HhHVfUGSEvPQTmZ
 SaAb5g10GhGSvkANkHgHP78lgGdi2Wg0Zmef7E5Bd3S18drICHviemRMBcgenKdGqB
 BnrZoxQnmfeJDO4e1Sy5TTOTUpBA6nW4oezGLCFxyrTjqc/25f+StjigpDGgQEKsE1
 xVV5xtoYXqf91759kvu++FzSjdoWZQwAT/hg1WjvsngEddi0IAHglxgpnsX3t33tqv
 W65/DhEUN7XGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260916090946.677564-8-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
 <20260916090946.677564-8-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 09:23:46 +0000
Message-Id: <20260916092346.B8E081F00893@smtp.kernel.org>
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
- [High] drm/i915: CHICKEN_TRANS modified during fastset violates HW sequen=
ce
- [Medium] drm/i915: TGDDA bypass readout masks invalid hardware state
--

commit 0462c93350e8b8ead0d7c6de9d75c2b9a0868707
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > =
10

To support a Link M/N ratio between 10.0 and 15.0, for some BMG
ultrajoiner cases we need Wa_14021768792. This commit programs the LINKM and
LINKN registers, along with relevant bits in HDMI_EMP_DATA and CHICKEN_TRAN=
S,
to bypass the hardware limitation within the Timing Generator DDA (TGDDA).

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 6d2025e109956..2b226620de0fd 100644
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

[Severity: High]
When reached via intel_update_crtc() during a fastset, can these
non-double-buffered registers be modified while the transcoder is already
enabled?

If userspace requests a modeset that lowers the pixel clock on an eDP panel
(which supports seamless M/N updates) such that the M/N ratio drops below t=
he
workaround threshold, the new state will have bypass_m_n_ratio_limit =3D fa=
lse.

Because the M/N struct check is skipped when update_m_n is true:

drivers/gpu/drm/i915/display/intel_display.c:intel_pipe_config_compare() {
    ...
		if (!fastset || !pipe_config->update_m_n)
			PIPE_CONF_CHECK_M_N(dp_m_n);
    ...
}

And because intel_crtc_check_fastset() leaves update_m_n true despite the
bypass_m_n_ratio_limit mismatch:

drivers/gpu/drm/i915/display/intel_display.c:intel_crtc_check_fastset() {
    ...
	if (intel_compare_link_m_n(&old_crtc_state->dp_m_n,
				   &new_crtc_state->dp_m_n))
		new_crtc_state->update_m_n =3D false;
    ...
}

This authorizes a fastset. During the fastset, bmg_enhanced_tgdda_write() w=
ill
then clear the workaround bits in the live transcoder. Modifying CHICKEN_TR=
ANS
and HDMI_EMP_DATA while the transcoder is active violates the explicit hard=
ware
programming sequence. This can lead to transcoder hangs, blank screens, or
display corruption, and is reachable by a local unprivileged user requesting
specific modes/refresh rates on supported eDP displays.

> +}
> +
[ ... ]
> @@ -3495,6 +3528,49 @@ void intel_get_m_n(struct intel_display *display,
>  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display, data_m_r=
eg)) + 1;
>  }
> =20
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio,
> +					enum pipe pipe)
> +{
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return false;
> +
> +	if (m_n_ratio > 15)
> +		return false;
> +
> +	if (pipe !=3D PIPE_A)
> +		return false;
> +
> +	return true;
> +}
> +
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
Does this early return apply software policy during hardware readout, maski=
ng
the fact that the hardware workaround is physically enabled on a disallowed
pipe?

If DP_ENHANCED_TGDDA_ENABLE is erroneously left enabled on an invalid pipe
(e.g., PIPE B) or with a corrupted fractional value, bmg_enhanced_tgdda_rea=
d()
returns early. The state checker compares this readout (false) against the
computed software state (false) and incorrectly declares a match, blinding =
the
state checker to the actual hardware configuration. If the hardware is
misprogrammed (e.g., by BIOS), it will not be detected and healed, potentia=
lly
causing display corruption or blank screens.

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
Does requiring a perfect fractional match to report the enable bit mask cas=
es
where the workaround is enabled but incorrectly configured?

If the fractional value is corrupted, bmg_enhanced_tgdda_read() refuses to =
set
bypass_m_n_ratio_limit =3D true, causing the same state checker mismatch is=
sue
described above.

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916090946.6775=
64-1-suraj.kandpal@intel.com?part=3D7
