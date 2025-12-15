Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133B0D5B16C
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 07:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AEF10E36A;
	Mon, 15 Dec 2025 07:51:08 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B2010E366;
 Mon, 15 Dec 2025 07:51:07 +0000 (UTC)
Received: from mobile-access-5d6aa7-235.dhcp.inet.fi ([93.106.167.235]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vV3MF-00000000omM-3mMx; Mon, 15 Dec 2025 09:51:05 +0200
Message-ID: <565e8dd8f176b00334f9fea65d6f022312245e5f.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 09:51:03 +0200
In-Reply-To: <20251127175023.1522538-17-imre.deak@intel.com>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-17-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
Subject: Re: [PATCH 16/50] drm/i915/dp: Fail state computation for invalid
 min/max link BPP values
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

On Thu, 2025-11-27 at 19:49 +0200, Imre Deak wrote:
> Make sure that state computation fails if the minimum/maximum link BPP
> values got invalid as a result of limiting both of these values
> separately to the corresponding source/sink capability limits.
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 3111758578d6c..545d872a30403 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2654,7 +2654,7 @@ intel_dp_compute_config_link_bpp_limits(struct inte=
l_dp *intel_dp,
>  	limits->link.max_bpp_x16 =3D max_link_bpp_x16;
> =20
>  	drm_dbg_kms(display->drm,
> -		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DS=
C %s max lanes %d max rate %d max pipe_bpp %d max link_bpp " FXP_Q4_FMT "\n=
",
> +		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DS=
C %s max lanes %d max rate %d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " m=
ax link_bpp " FXP_Q4_FMT "\n",
>  		    encoder->base.base.id, encoder->base.name,
>  		    crtc->base.base.id, crtc->base.name,
>  		    adjusted_mode->crtc_clock,
> @@ -2662,8 +2662,13 @@ intel_dp_compute_config_link_bpp_limits(struct int=
el_dp *intel_dp,
>  		    limits->max_lane_count,
>  		    limits->max_rate,
>  		    limits->pipe.max_bpp,
> +		    FXP_Q4_ARGS(limits->link.min_bpp_x16),
>  		    FXP_Q4_ARGS(limits->link.max_bpp_x16));
> =20
> +	if (limits->link.min_bpp_x16 <=3D 0 ||
> +	    limits->link.min_bpp_x16 > limits->link.max_bpp_x16)
> +		return false;
> +
>  	return true;
>  }
> =20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
