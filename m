Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D39CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DC610EC06;
	Thu, 15 Oct 2026 13:54:51 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB91010FDE3;
 Thu, 15 Oct 2026 13:54:49 +0000 (UTC)
Received: from 178-55-143-231.bb.dnainternet.fi ([178.55.143.231]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xHLuv-00000004PE6-3cTT; Thu, 15 Oct 2026 16:54:46 +0300
Message-ID: <0fdc10e4f41b29d0a17fbd642450a53572ef2147.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 16:54:59 +0300
In-Reply-To: <20261014120542.29675-5-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
 <20261014120542.29675-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 4/6] drm/i915/de: Implement intel_de_rmw() by hand
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
> Replace the intel_uncore_rmw() usage with a hand rolled
> implementation in intel_de.h. The intel_de_rmw_fw()
> counterpart is already implemented identically.
>=20
> I chose to do the straightforward implementation of just
> using intel_de_{read,write}() and drop the extra wakelock
> stuff. That does mean that we drop the wakelock reference
> between the read and the write, but since the wakelock release
> happens via a delayed work this should not cause any actual
> difference under normal circumstances.
>=20
> This will reduce the uncore usage footprint of intel_de.h,
> which will help with cleaning up the final uncore i915 vs. xe
> mess.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.h | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 76f698cfa354..3339567496e9 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -70,15 +70,13 @@ intel_de_write(struct intel_display *display, intel_r=
eg_t reg, u32 val)
>  static inline u32
>  intel_de_rmw(struct intel_display *display, intel_reg_t reg, u32 clear, =
u32 set)
>  {
> -	u32 val;
> -
> -	intel_dmc_wl_get(display, reg);
> -
> -	val =3D intel_uncore_rmw(__to_uncore(display), reg, clear, set);
> +	u32 old, val;
> =20
> -	intel_dmc_wl_put(display, reg);
> +	old =3D intel_de_read(display, reg);
> +	val =3D (old & ~clear) | set;
> +	intel_de_write(display, reg, val);
> =20
> -	return val;
> +	return old;
>  }
> =20
>  int intel_de_wait_us(struct intel_display *display, intel_reg_t reg,

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
