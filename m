Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275D0C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 11:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12ED10E168;
	Thu,  3 Jul 2025 11:37:38 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37AC10E168;
 Thu,  3 Jul 2025 11:37:37 +0000 (UTC)
Received: from 91-155-254-100.elisa-laajakaista.fi ([91.155.254.100]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1uXIFy-00000008dVc-2rli; Thu, 03 Jul 2025 14:37:35 +0300
Message-ID: <58c440f7a1e2c75781134fbbf2d46ea6069148ef.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Imre Deak <imre.deak@gmail.com>
Date: Thu, 03 Jul 2025 14:37:33 +0300
In-Reply-To: <20250626082053.219514-13-imre.deak@intel.com>
References: <20250626082053.219514-1-imre.deak@intel.com>
 <20250626082053.219514-13-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 12/20] drm/i915/dp: Reprobe connector if getting/acking
 link service IRQs fails
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

On Thu, 2025-06-26 at 11:20 +0300, Imre Deak wrote:
> From: Imre Deak <imre.deak@gmail.com>
>=20
> An AUX access failure during HPD IRQ handling should be handled by
> falling back to a full connector detection, ensure that if the failure
> happens while reading/acking a link service IRQ.
>=20
> Signed-off-by: Imre Deak <imre.deak@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 7eb208d2c321b..66db426b4aca1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5430,12 +5430,15 @@ static bool intel_dp_check_link_service_irq(struc=
t intel_dp *intel_dp)
>  		return false;
> =20
>  	if (drm_dp_dpcd_readb(&intel_dp->aux,
> -			      DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &val) !=3D 1 || !val)
> +			      DP_LINK_SERVICE_IRQ_VECTOR_ESI0, &val) !=3D 1)
> +		return true;
> +
> +	if (!val)
>  		return false;
> =20
>  	if (drm_dp_dpcd_writeb(&intel_dp->aux,
>  			       DP_LINK_SERVICE_IRQ_VECTOR_ESI0, val) !=3D 1)
> -		return false;
> +		return true;
> =20
>  	if (val & RX_CAP_CHANGED)
>  		reprobe_needed =3D true;

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
