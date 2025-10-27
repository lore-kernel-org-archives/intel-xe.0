Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FC6CCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 15:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D8810E4DB;
	Mon, 27 Oct 2025 15:40:59 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAC510E4DB;
 Mon, 27 Oct 2025 15:40:58 +0000 (UTC)
Received: from mobile-access-b04841-44.dhcp.inet.fi ([176.72.65.44]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vDPL4-00000001rsK-2fOp; Mon, 27 Oct 2025 17:40:55 +0200
Message-ID: <55586417fd9fb8b6363d7e2be8b1ca5a12314658.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 17:40:53 +0200
In-Reply-To: <20251017161417.4399-10-ville.syrjala@linux.intel.com>
References: <20251017161417.4399-1-ville.syrjala@linux.intel.com>
 <20251017161417.4399-10-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
Subject: Re: [PATCH 9/9] drm/i915/scaler: Use the actual scale factors for
 vblank length check
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 2025-10-17 at 19:14 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Now that the scaler assignment has been moved to an earlier point
> we can start to use the actual scale factors in the prefill vs.
> vblank length check.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/display/skl_scaler.c | 77 ++++++++++++++++++++---
>  1 file changed, 67 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index e8a8facdc300..53436c731cf1 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -978,22 +978,79 @@ void adl_scaler_ecc_unmask(const struct intel_crtc_=
state *crtc_state)
>  	intel_de_write(display, XELPD_DISPLAY_ERR_FATAL_MASK, 0);
>  }
> =20
> +static unsigned int skl_scaler_scale(const struct intel_crtc_state *crtc=
_state, int i)
> +{
> +	const struct intel_crtc_scaler_state *scaler_state =3D
> +		&crtc_state->scaler_state;
> +
> +	return DIV_ROUND_UP_ULL(mul_u32_u32(scaler_state->scalers[i].hscale,
> +					    scaler_state->scalers[i].vscale),
> +				0x10000);
> +}
> +
> +static unsigned int skl_scaler_downscale(const struct intel_crtc_state *=
crtc_state, int i)
> +{
> +	return max(0x10000, skl_scaler_scale(crtc_state, i));
> +}
> +
> +static unsigned int skl_plane_scaler_downscale(const struct intel_crtc_s=
tate *crtc_state)
> +{
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	const struct intel_crtc_scaler_state *scaler_state =3D
> +		&crtc_state->scaler_state;
> +	unsigned int scale =3D 0x10000;
> +	int i;
> +
> +	for (i =3D 0; i < crtc->num_scalers; i++) {
> +		/* ignore pfit */
> +		if (i =3D=3D scaler_state->scaler_id)
> +			continue;
> +
> +		if (!scaler_state->scalers[i].in_use)
> +			continue;
> +
> +		scale =3D max(scale, skl_scaler_downscale(crtc_state, i));
> +	}
> +
> +	return scale;
> +}
> +
> +static unsigned int skl_pipe_scaler_downscale(const struct intel_crtc_st=
ate *crtc_state)
> +{
> +	const struct intel_crtc_scaler_state *scaler_state =3D
> +		&crtc_state->scaler_state;
> +
> +	if (!crtc_state->pch_pfit.enabled)
> +		return 0x10000;
> +
> +	return skl_scaler_downscale(crtc_state, scaler_state->scaler_id);
> +}
> +
>  unsigned int skl_scaler_1st_prefill_adjustment(const struct intel_crtc_s=
tate *crtc_state)
>  {
> -	/*
> -	 * FIXME don't have scalers assigned yet
> -	 * so can't look up the scale factors
> -	 */
> -	return 0x10000;
> +	const struct intel_crtc_scaler_state *scaler_state =3D
> +		&crtc_state->scaler_state;
> +	int num_scalers =3D hweight32(scaler_state->scaler_users);
> +
> +	if (num_scalers < 1)
> +		return 0x10000;
> +
> +	if (num_scalers =3D=3D 1 && crtc_state->pch_pfit.enabled)
> +		return skl_pipe_scaler_downscale(crtc_state);
> +	else
> +		return skl_plane_scaler_downscale(crtc_state);
>  }
> =20
>  unsigned int skl_scaler_2nd_prefill_adjustment(const struct intel_crtc_s=
tate *crtc_state)
>  {
> -	/*
> -	 * FIXME don't have scalers assigned yet
> -	 * so can't look up the scale factors
> -	 */
> -	return 0x10000;
> +	const struct intel_crtc_scaler_state *scaler_state =3D
> +		&crtc_state->scaler_state;
> +	int num_scalers =3D hweight32(scaler_state->scaler_users);
> +
> +	if (num_scalers < 2)
> +		return 0x10000;
> +
> +	return skl_pipe_scaler_downscale(crtc_state);
>  }
> =20
>  unsigned int skl_scaler_1st_prefill_lines(const struct intel_crtc_state =
*crtc_state)
