Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C94CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 12:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B819310E3E1;
	Thu, 23 Oct 2025 12:13:45 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97C10E3E1;
 Thu, 23 Oct 2025 12:13:44 +0000 (UTC)
Received: from mobile-access-d98cd6-211.dhcp.inet.fi ([217.140.214.211]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vBuCK-00000001lWo-1Wur; Thu, 23 Oct 2025 15:13:42 +0300
Message-ID: <a2ce6140c4f672eda184961d8fa9102789d077aa.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Oct 2025 15:13:39 +0300
In-Reply-To: <20251017161417.4399-3-ville.syrjala@linux.intel.com>
References: <20251017161417.4399-1-ville.syrjala@linux.intel.com>
 <20251017161417.4399-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] drm/i915/scaler: Adjust pipe scaler scale factors
 for 4:2:0 ouput
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
> 4:2:0 output effectively involves an extra downscale factor of
> 2x2 due to the chroma downsampling. Adjust the stored scaler
> scale factors accodingly.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/display/skl_scaler.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index 640c65818f8a..e8a8facdc300 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -499,6 +499,15 @@ static int intel_atomic_setup_scaler(struct intel_cr=
tc_state *crtc_state,
> =20
>  			return -EINVAL;
>  		}
> +
> +		/*
> +		 * For the purposes of prefill 4:2:0 chroma
> +		 * subsampling is considered a 2x2 downscale.
> +		 */
> +		if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420) {
> +			hscale <<=3D 1;
> +			vscale <<=3D 1;
> +		}
>  	}
> =20
>  	scaler_state->scalers[*scaler_id].hscale =3D hscale;
