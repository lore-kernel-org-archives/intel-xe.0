Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C27CCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 12:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B8E10E3FC;
	Thu, 23 Oct 2025 12:27:56 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A68D10E3FC;
 Thu, 23 Oct 2025 12:27:56 +0000 (UTC)
Received: from mobile-access-d98cd6-211.dhcp.inet.fi ([217.140.214.211]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vBuQ4-00000001lZA-2cEY; Thu, 23 Oct 2025 15:27:53 +0300
Message-ID: <6d9857e8d3023d6f948ba0adeb91aa465fc3212b.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Oct 2025 15:27:52 +0300
In-Reply-To: <20251017161417.4399-6-ville.syrjala@linux.intel.com>
References: <20251017161417.4399-1-ville.syrjala@linux.intel.com>
 <20251017161417.4399-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
Subject: Re: [PATCH 5/9] drm/i915/scaler: Call skl_update_scaler_crtc() earlier
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
> Move the skl_update_scaler_crtc() call into intel_crtc_compute_config().
> It no longer has any dependency on CDLCK/etc. so it doesn't need to be
> done so late.
>=20
> The fastset/modeset checks are redundant now as that's exactly
> when intel_crtc_compute_config() is called.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/display/intel_display.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 211761c5b72a..0c483a4994c2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2406,6 +2406,7 @@ static int intel_crtc_compute_set_context_latency(s=
truct intel_atomic_state *sta
>  static int intel_crtc_compute_config(struct intel_atomic_state *state,
>  				     struct intel_crtc *crtc)
>  {
> +	struct intel_display *display =3D to_intel_display(state);
>  	struct intel_crtc_state *crtc_state =3D
>  		intel_atomic_get_new_crtc_state(state, crtc);
>  	int ret;
> @@ -2433,6 +2434,12 @@ static int intel_crtc_compute_config(struct intel_=
atomic_state *state,
> =20
>  	intel_vrr_compute_guardband(crtc_state);
> =20
> +	if (DISPLAY_VER(display) >=3D 9) {
> +		ret =3D skl_update_scaler_crtc(crtc_state);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -4223,13 +4230,6 @@ static int intel_crtc_atomic_check_late(struct int=
el_atomic_state *state,
>  	}
> =20
>  	if (DISPLAY_VER(display) >=3D 9) {
> -		if (intel_crtc_needs_modeset(crtc_state) ||
> -		    intel_crtc_needs_fastset(crtc_state)) {
> -			ret =3D skl_update_scaler_crtc(crtc_state);
> -			if (ret)
> -				return ret;
> -		}
> -
>  		ret =3D intel_atomic_setup_scalers(state, crtc);
>  		if (ret)
>  			return ret;
