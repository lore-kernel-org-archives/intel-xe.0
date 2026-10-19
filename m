Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2CFCCF2E5
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919C610ED83;
	Mon, 19 Oct 2026 14:23:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0B310ED73;
 Mon, 19 Oct 2026 14:23:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 184BA6020A;
 Mon, 19 Oct 2026 14:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C03C1F000C4;
 Mon, 19 Oct 2026 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792419784;
 bh=NLW1yYdWyuxTk12nik2DDWm07p70gSWPSMmWuPx++B0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XjvnvZmkHUGBa2D0Co/99FdTwptDdP/fNogRhXancq1vZGGCUsd2Tp4EMoIuwcB70
 Nuu+X1ozRwblicaBEI93YzalFlAn9MQseMe1pGSGqwnfsZ79xqoD9ImdS/qkNYH/oZ
 4zPaBNuYAKFzlAW2Fs35BK9UVvDUpU9Xtq518winsWbVTSrn24xDyyuJLa5zT4NCdb
 zzqbM9givx3SY6ekYnEM+5AVzoR5PJVaeiQ087h4GmnxE9/R143gmWet5yyfJFfV+l
 +RnhLpmFs0KlDOh7vf4W82rXIiUr/pqU64l+IPea4g6Rl1O9pMmG6ZtEUsaeUPIedA
 xclA4/eyFqN4Q==
Message-ID: <sashiko-outbox-177367@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/15] drm/i915/pfit: Populate crtc_state->pfit.dst on
 GMCH platforms
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261019135309.23578-10-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-10-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:23:04 +0000
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
- [Medium] drm/i915/pfit: uninitialized hscale and vscale in i965_pfit_get_=
config()
--

commit 1baf5f8a446b17a6276479fa9824e29481b05caf
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/pfit: Populate crtc_state->pfit.dst on GMCH platforms

This commit populates crtc_state->pfit.dst on GMCH platforms by computing
the destination window coordinates from the horizontal and vertical panel
fitter scaling factors during both config computation and hardware readout.

> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index 5d519f45adbec..63e5a656a33b8 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
[ ... ]
> @@ -716,19 +799,39 @@ static void i965_pfit_get_config(struct intel_crtc_=
state *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 hscale, vscale, control, ratios;
>  	enum pipe pipe;
> -	u32 tmp;
> =20
> -	tmp =3D intel_de_read(display, PFIT_CONTROL(display));
> -	if (!(tmp & PFIT_ENABLE))
> +	control =3D intel_de_read(display, PFIT_CONTROL(display));
> +	if (!(control & PFIT_ENABLE))
>  		return;
> =20
>  	/* Check whether the pfit is attached to our pipe. */
> -	pipe =3D REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> +	pipe =3D REG_FIELD_GET(PFIT_PIPE_MASK, control);
>  	if (pipe !=3D crtc->pipe)
>  		return;
> =20
> -	crtc_state->gmch_pfit.control =3D tmp;
> +	crtc_state->gmch_pfit.control =3D control;
> +
> +	ratios =3D intel_de_read(display, PFIT_PGM_RATIOS(display));
> +
> +	switch (control & PFIT_SCALING_MASK) {
> +	case PFIT_SCALING_LETTER:
> +		hscale =3D REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK_965, ratios);
> +		vscale =3D hscale; /* PFIT_VERT_SCALE_MASK_965 contains garbage */
> +		break;
> +	case PFIT_SCALING_PILLAR:
> +		vscale =3D REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, ratios);
> +		hscale =3D vscale; /* PFIT_HORIZ_SCALE_MASK_965 contains garbage */
> +		break;
> +	case PFIT_SCALING_AUTO:
> +	case PFIT_SCALING_PROGRAMMED:
> +		hscale =3D REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK_965, ratios);
> +		vscale =3D REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, ratios);
> +		break;
> +	}
> +
> +	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
>  }

[Severity: Medium]
Can hscale and vscale be used uninitialized in i965_pfit_get_config()?

In drivers/gpu/drm/i915/display/intel_pfit_regs.h, PFIT_SCALING_MASK is a
3-bit mask with 8 possible values, while only 4 constants (0..3) are
defined:

#define   PFIT_SCALING_MASK		REG_GENMASK(28, 26) /* 965+ */
#define   PFIT_SCALING_AUTO		REG_FIELD_PREP(PFIT_SCALING_MASK, 0)
#define   PFIT_SCALING_PROGRAMMED	REG_FIELD_PREP(PFIT_SCALING_MASK, 1)
#define   PFIT_SCALING_PILLAR		REG_FIELD_PREP(PFIT_SCALING_MASK, 2)
#define   PFIT_SCALING_LETTER		REG_FIELD_PREP(PFIT_SCALING_MASK, 3)

Since the switch in intel_pfit_get_config() -> i965_pfit_get_config() has no
default case and hscale and vscale are not initialized at declaration, could
a reserved value in PFIT_CONTROL pass uninitialized stack values into
i9xx_compute_pfit_dst() (and trigger compiler uninitialized-variable
warnings)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135309.2357=
8-1-ville.syrjala@linux.intel.com?part=3D9
