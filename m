Received: from smtp.lore.kernel.org (ip-10-30-226-214.us-west-2.compute.internal [10.30.226.214])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF14606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixdFg3Ud
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC13CCF2E5
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 14:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3F510E55E;
	Mon, 19 Oct 2026 14:48:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519CC10E55E;
 Mon, 19 Oct 2026 14:47:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 97AF960136;
 Mon, 19 Oct 2026 14:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180D71F000C4;
 Mon, 19 Oct 2026 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792421277;
 bh=ROBpAwF4KUTANQfYV/YcSWuNUlXFcBlR5vC+33GP17A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ixdFg3UdENUKuCtHokhxR3dv//pUHybEDKlCe0mzIXL4k/+v6JrdiNv0cUilnETCW
 H8VJph6U+JD8caJsZZTaPMxzkiHiRgfN10EcSd89wTl0cYJsF63EtQfdCKKWYAfVGc
 pzXYIZzpnaXh/RMP5N3Cx/lUXt6eehpp8zKOWGW9OBYZwNTt7C4Gs1+QiST8rGn6tq
 k7klQDLKN+MnmP8ibMWwecRwpr31+CY3ZvZfjeWWSJM5MGif/asgyBM5RYPAN0rqtT
 3dhjVTD8JOAi5RjdAXDbBT35Gjn+TN3AxxjCh8EI7wC+q1Oly/Ulu126laodxjjFlH
 nwNCXctUctw0Q==
Message-ID: <sashiko-outbox-177503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/15] drm/i915/pfit: Allow downscaling on i966+
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261019135309.23578-16-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-16-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:47:56 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/i915/pfit: off-by-one max_scale in i9xx_pfit_check_scaling()
--

commit c5496f644982a254aa09057b7c02f1bea3cb5b18
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/pfit: Allow downscaling on i966+

This commit updates i9xx_pfit_check_scaling() to raise max_scale to 0x20000=
 on
DISPLAY_VER(display) >=3D 4 platforms to permit panel fitter downscaling.

> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index 6eb457047bf4c..2b6706c7af534 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -563,7 +563,10 @@ static int i9xx_pfit_check_scaling(const struct inte=
l_crtc_state *crtc_state)
>  	int hscale, vscale, max_scale;
>  	struct drm_rect src;
> =20
> -	max_scale =3D 0x10000;
> +	if (DISPLAY_VER(display) >=3D 4)
> +		max_scale =3D 0x20000;
> +	else
> +		max_scale =3D 0x10000;
> =20
>  	drm_rect_init(&src, 0, 0, pipe_src_w << 16, pipe_src_h << 16);
> =20

[Severity: Medium]
Should max_scale be 0x20000 - 1 (or 0x1fff0) rather than 0x20000 here?

In i9xx_pfit_check_scaling(), max_scale is passed to drm_rect_calc_hscale()
and drm_rect_calc_vscale(), which treat max_hscale and max_vscale as inclus=
ive
upper bounds and only reject with -ERANGE when scale > max_scale. Setting
max_scale =3D 0x20000 allows an exact 2.0x downscale factor (for example, w=
hen
scaling a 1600x1200 pipe_src to an 800x600 dst).

However, in drivers/gpu/drm/i915/display/intel_pfit_regs.h, the i965+ scali=
ng
ratio fields in PFIT_PGM_RATIOS are 13-bit 1.12 fixed-point values:

#define   PFIT_VERT_SCALE_MASK_965	REG_GENMASK(28, 16) /* 965+ */
#define   PFIT_VERT_SCALE_965(x)	REG_FIELD_PREP(PFIT_VERT_SCALE_MASK_965, (=
x))
#define   PFIT_HORIZ_SCALE_MASK_965	REG_GENMASK(12, 0) /* 965+ */
#define   PFIT_HORIZ_SCALE_965(x)	REG_FIELD_PREP(PFIT_HORIZ_SCALE_MASK_965,=
 (x))

These 13-bit fields have a maximum representable value of 0x1fff (< 2.0). F=
or
an exact 2.0x downscale, panel_fitter_scaling() computes 0x2000 (BIT(13)),
which overflows the 13-bit register field and causes a hardware state reado=
ut
mismatch in i965_pfit_get_config() -> i9xx_compute_pfit_dst() on
crtc_state->pfit.dst and pixel_rate:

drivers/gpu/drm/i915/display/intel_pfit.c:i965_pfit_get_config() {
	...
	case PFIT_SCALING_AUTO:
	case PFIT_SCALING_PROGRAMMED:
		hscale =3D REG_FIELD_GET(PFIT_HORIZ_SCALE_MASK_965, ratios);
		vscale =3D REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, ratios);
		break;
	}

	i9xx_compute_pfit_dst(crtc_state, hscale, vscale);
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135309.2357=
8-1-ville.syrjala@linux.intel.com?part=3D15
