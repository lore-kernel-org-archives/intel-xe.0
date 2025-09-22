Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E1CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 10:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F321A10E406;
	Mon, 22 Sep 2025 10:17:50 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536B810E037;
 Mon, 22 Sep 2025 10:17:49 +0000 (UTC)
Received: from 91-153-11-122.elisa-laajakaista.fi ([91.153.11.122]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1v0dc8-00000000yjR-06W5; Mon, 22 Sep 2025 13:17:45 +0300
Message-ID: <476f54559dca291d40f194ad40adcc5ac2c418e9.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Mon, 22 Sep 2025 13:17:43 +0300
In-Reply-To: <20250919193000.17665-11-ville.syrjala@linux.intel.com>
References: <20250919193000.17665-1-ville.syrjala@linux.intel.com>
 <20250919193000.17665-11-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/13] drm/i915: Flatten sanitize_wm_latency() a bit
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

On Fri, 2025-09-19 at 22:29 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Move the inner loop out from the outer loop in
> sanitize_wm_latency() to flatten things a bit.
> Easier to read flat code.
>=20
> v2: Move the inner loop out completely (Luca)
>=20
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/display/skl_watermark.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/d=
rm/i915/display/skl_watermark.c
> index 1acb9285bd05..d83772c6ea9a 100644
> --- a/drivers/gpu/drm/i915/display/skl_watermark.c
> +++ b/drivers/gpu/drm/i915/display/skl_watermark.c
> @@ -3228,14 +3228,12 @@ static void sanitize_wm_latency(struct intel_disp=
lay *display)
>  	 * of the punit to satisfy this requirement.
>  	 */
>  	for (level =3D 1; level < num_levels; level++) {
> -		if (wm[level] =3D=3D 0) {
> -			int i;
> -
> -			for (i =3D level + 1; i < num_levels; i++)
> -				wm[i] =3D 0;
> -			return;
> -		}
> +		if (wm[level] =3D=3D 0)
> +			break;
>  	}
> +
> +	for (level =3D level + 1; level < num_levels; level++)
> +		wm[level] =3D 0;
>  }
> =20
>  static void
