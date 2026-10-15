Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA90CC6B3A
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AF2112260;
	Thu, 15 Oct 2026 13:56:08 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B9E112260;
 Thu, 15 Oct 2026 13:56:07 +0000 (UTC)
Received: from 178-55-143-231.bb.dnainternet.fi ([178.55.143.231]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xHLwB-00000004PEb-2n49; Thu, 15 Oct 2026 16:56:04 +0300
Message-ID: <62e61323dcb28d33f0f951dc90e33be6be3a9c57.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 16:56:17 +0300
In-Reply-To: <20261014120542.29675-6-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
 <20261014120542.29675-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] drm/i915/de: Implement intel_de_posting_read() via
 intel_de_read()
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
> Simplify the intel_de_posting_read() implementation by just
> calling intel_de_read(). The only difference between a normal
> read and posting read is the return value (u32 vs. void).
>=20
> This will reduce the uncore usage footprint of intel_de.h,
> which will help with cleaning up the final uncore i915 vs. xe
> mess.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 3339567496e9..5d3aeaf6a70f 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -50,11 +50,7 @@ intel_de_read64_2x32(struct intel_display *display, in=
tel_reg_t reg)
>  static inline void
>  intel_de_posting_read(struct intel_display *display, intel_reg_t reg)
>  {
> -	intel_dmc_wl_get(display, reg);
> -
> -	intel_uncore_posting_read(__to_uncore(display), reg);
> -
> -	intel_dmc_wl_put(display, reg);
> +	intel_de_read(display, reg);
>  }
> =20
>  static inline void

Reviwed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
