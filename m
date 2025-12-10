Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B047ED3C90B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 13:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8474910E6C6;
	Wed, 10 Dec 2025 13:39:51 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8C710E264;
 Wed, 10 Dec 2025 13:39:50 +0000 (UTC)
Received: from mobile-access-5d6aa7-235.dhcp.inet.fi ([93.106.167.235]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vTKPy-00000000iWz-3lZX; Wed, 10 Dec 2025 15:39:47 +0200
Message-ID: <44c1b341992dba8b3fe778b3460d0822fae097a7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Wed, 10 Dec 2025 15:39:45 +0200
In-Reply-To: <20251127175023.1522538-12-imre.deak@intel.com>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-12-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
Subject: Re: [PATCH 11/50] drm/i915/dp: Account with DSC BW overhead for
 compressed DP-SST stream BW
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
> A DSC compressed stream requires FEC (except for eDP), which has a BW
> overhead on non-UHBR links that must be accounted for explicitly. Do
> that during computing the required BW.
>=20
> Note that the overhead doesn't need to be accounted for on UHBR links
> where FEC is always enabled and so the corresponding overhead is part of
> the channel coding efficiency instead (i.e. the overhead is part of the
> available vs. the required BW).
>=20
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 4044bdbceaef5..55be648283b19 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2085,12 +2085,16 @@ static int dsc_compute_link_config(struct intel_d=
p *intel_dp,
>  				if (ret)
>  					continue;
>  			} else {
> +				unsigned long bw_overhead_flags =3D
> +					pipe_config->fec_enable ? DRM_DP_BW_OVERHEAD_FEC : 0;
> +
>  				if (!is_bw_sufficient_for_dsc_config(intel_dp,
>  								     link_rate, lane_count,
>  								     adjusted_mode->crtc_clock,
>  								     adjusted_mode->hdisplay,
>  								     pipe_config->dsc.slice_count,
> -								     dsc_bpp_x16, 0))
> +								     dsc_bpp_x16,
> +								     bw_overhead_flags))
>  					continue;
>  			}
> =20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
