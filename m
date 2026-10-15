Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88561CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE7B1122A7;
	Thu, 15 Oct 2026 13:51:25 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846371122A5;
 Thu, 15 Oct 2026 13:51:24 +0000 (UTC)
Received: from 178-55-143-231.bb.dnainternet.fi ([178.55.143.231]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xHLrb-00000004PCo-1L61; Thu, 15 Oct 2026 16:51:21 +0300
Message-ID: <bb63ccd2eb795f9c4934e310566cddcb0e5b98d1.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 16:51:32 +0300
In-Reply-To: <20261014120542.29675-4-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
 <20261014120542.29675-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] drm/i915/de: Convert
 intel_de_read64_2x32_volatile() to intel_de_read64_2x32_volatile_fw()
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

On Wed, 2026-10-14 at 15:05 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Our only use of intel_de_read64_2x32_volatile() is for the
> PIPEFRAMEPIXEL/PIPEFRAMEHIGH read. That only gets used on gen3/4
> so we don't actually need the uncore.lock protection there.
> Replace intel_de_read64_2x32_volatile() with a hand rolled
> intel_de_read64_2x32_volatile_fw().
>=20
> This will reduce the uncore usage footprint of intel_de.h,
> which will help with cleaning up the final uncore i915 vs. xe
> mess.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.h     | 35 ++++++++++-----------
>  drivers/gpu/drm/i915/display/intel_vblank.c |  4 +--
>  2 files changed, 19 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 4ae041a96b31..76f698cfa354 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -35,24 +35,6 @@ intel_de_read(struct intel_display *display, intel_reg=
_t reg)
>  	return val;
>  }
> =20
> -static inline u64
> -intel_de_read64_2x32_volatile(struct intel_display *display,
> -			      intel_reg_t lower_reg, intel_reg_t upper_reg)
> -{
> -	u64 val;
> -
> -	intel_dmc_wl_get(display, lower_reg);
> -	intel_dmc_wl_get(display, upper_reg);
> -
> -	val =3D intel_uncore_read64_2x32(__to_uncore(display), lower_reg,
> -				       upper_reg);
> -
> -	intel_dmc_wl_put(display, upper_reg);
> -	intel_dmc_wl_put(display, lower_reg);
> -
> -	return val;
> -}
> -
>  static inline u64
>  intel_de_read64_2x32(struct intel_display *display, intel_reg_t reg)
>  {
> @@ -158,6 +140,23 @@ intel_de_rmw_fw(struct intel_display *display, intel=
_reg_t reg, u32 clear, u32 s
>  	return old;
>  }
> =20
> +static inline u64
> +intel_de_read64_2x32_volatile_fw(struct intel_display *display,
> +				 i915_reg_t lower_reg, i915_reg_t upper_reg)
> +{
> +	u32 old_upper, upper, lower;
> +	int loop =3D 0;
> +
> +	upper =3D intel_de_read_fw(display, upper_reg);
> +	do {
> +		old_upper =3D upper;
> +		lower =3D intel_de_read_fw(display, lower_reg);
> +		upper =3D intel_de_read_fw(display, upper_reg);
> +	} while (upper !=3D old_upper && loop++ < 2);
> +
> +	return (u64)upper << 32 | lower;
> +}
> +
>  static inline void
>  intel_de_posting_read_fw(struct intel_display *display, intel_reg_t reg)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index a01be2e34bc9..d706284f073b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -109,8 +109,8 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
>  	 * we get a low value that's stable across two reads of the high
>  	 * register.
>  	 */
> -	frame =3D intel_de_read64_2x32_volatile(display, PIPEFRAMEPIXEL(display=
, pipe),
> -					      PIPEFRAMEHIGH(display, pipe));
> +	frame =3D intel_de_read64_2x32_volatile_fw(display, PIPEFRAMEPIXEL(disp=
lay, pipe),
> +						 PIPEFRAMEHIGH(display, pipe));
> =20
>  	pixel =3D REG_FIELD_GET(PIPE_PIXEL_MASK, frame);
>  	frame =3D REG_FIELD_GET64(PIPE_FRAME_MASK, frame);

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
