Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB334CAC599
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 08:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B54B10E72F;
	Tue, 16 Sep 2025 08:44:15 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BAB10E72F;
 Tue, 16 Sep 2025 08:44:14 +0000 (UTC)
Received: from 88-113-67-44.elisa-laajakaista.fi ([88.113.67.44]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1uyRIJ-00000000p0G-2hF4; Tue, 16 Sep 2025 11:44:12 +0300
Message-ID: <badc23c0ec543b5b60613030113f4774495c89d9.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Sep 2025 11:44:10 +0300
In-Reply-To: <20250905145832.12097-8-ville.syrjala@linux.intel.com>
References: <20250905145832.12097-1-ville.syrjala@linux.intel.com>
 <20250905145832.12097-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 07/13] drm/i915: Extract increase_wm_latency()
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

On Fri, 2025-09-05 at 17:58 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Extract the "increase wm latencies by some amount" code into
> a helper that can be reused.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/display/skl_watermark.c | 28 ++++++++++++--------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/d=
rm/i915/display/skl_watermark.c
> index 8a98c3e52dc5..9eebb908beb8 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -3183,6 +3183,21 @@ static void multiply_wm_latency(struct intel_displ=
ay *display, int mult)
>  		wm[level] *=3D mult;
>  }
> =20
> +static void increase_wm_latency(struct intel_display *display, int inc)
> +{
> +	u16 *wm =3D display->wm.skl_latency;
> +	int level, num_levels =3D display->wm.num_levels;
> +
> +	wm[0] +=3D inc;
> +
> +	for (level =3D 1; level < num_levels; level++) {
> +		if (wm[level] =3D=3D 0)
> +			break;
> +
> +		wm[level] +=3D inc;
> +	}
> +}
> +
>  static bool need_16gb_dimm_wa(struct intel_display *display)
>  {
>  	const struct dram_info *dram_info =3D intel_dram_info(display->drm);
> @@ -3207,7 +3222,6 @@ adjust_wm_latency(struct intel_display *display)
>  {
>  	u16 *wm =3D display->wm.skl_latency;
>  	int i, level, num_levels =3D display->wm.num_levels;
> -	int read_latency =3D wm_read_latency(display);
> =20
>  	if (display->platform.dg2)
>  		multiply_wm_latency(display, 2);
> @@ -3232,16 +3246,8 @@ adjust_wm_latency(struct intel_display *display)
>  	 * to add proper adjustment to each valid level we retrieve
>  	 * from the punit when level 0 response data is 0us.
>  	 */
> -	if (wm[0] =3D=3D 0) {
> -		wm[0] +=3D read_latency;
> -
> -		for (level =3D 1; level < num_levels; level++) {
> -			if (wm[level] =3D=3D 0)
> -				break;
> -
> -			wm[level] +=3D read_latency;
> -		}
> -	}
> +	if (wm[0] =3D=3D 0)
> +		increase_wm_latency(display, wm_read_latency(display));
> =20
>  	/*
>  	 * WA Level-0 adjustment for 16Gb+ DIMMs: SKL+
